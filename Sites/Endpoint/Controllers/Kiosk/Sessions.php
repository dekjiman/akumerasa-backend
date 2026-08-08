<?php

namespace Sites\Endpoint\Controllers\Kiosk;

use CodeIgniter\RESTful\ResourceController;
use Sites\Endpoint\Controllers\Traits\ResponseFormat;

class Sessions extends ResourceController
{
    use ResponseFormat;

    /**
     * POST /endpoint/kiosk/sessions
     */
    public function create()
    {
        $json = $this->request->getJSON(true);
        $kioskId = $this->request->kioskId;
        $locationId = $this->request->locationId;
        $tenantId = $this->request->tenantId;

        $db = \Config\Database::connect();

        $db->table('reflection_sessions')->insert([
            'kiosk_id'       => $kioskId,
            'location_id'    => $locationId,
            'tenant_id'      => $tenantId,
            'visitor_name'   => $json['visitor_name'] ?? null,
            'visitor_email'  => $json['visitor_email'] ?? null,
            'emotion_id'     => $json['emotion_id'] ?? null,
            'context_id'     => $json['context_id'] ?? null,
            'cause_id'       => $json['cause_id'] ?? null,
            'story'          => $json['story'] ?? null,
            'status'         => 'in_progress',
            'created_at'     => date('Y-m-d H:i:s'),
            'updated_at'     => date('Y-m-d H:i:s'),
        ]);
        $sessionId = $db->insertID();

        $session = $db->table('reflection_sessions')->where('id', $sessionId)->get()->getRow();

        return $this->respondCreated($session, 'Session created.');
    }

    /**
     * GET /endpoint/kiosk/sessions/:id
     */
    public function show($id = null)
    {
        $db = \Config\Database::connect();
        $session = $db->table('reflection_sessions')->where('id', $id)->get()->getRow();

        if (!$session) {
            return $this->respondNotFound('Session not found.');
        }

        return $this->respondSuccess($session);
    }

    /**
     * PUT /endpoint/kiosk/sessions/:id
     */
    public function update($id = null)
    {
        $db = \Config\Database::connect();
        $session = $db->table('reflection_sessions')->where('id', $id)->get()->getRow();

        if (!$session) {
            return $this->respondNotFound('Session not found.');
        }

        $json = $this->request->getJSON(true);
        $updateData = ['updated_at' => date('Y-m-d H:i:s')];

        if (isset($json['emotion_id'])) $updateData['emotion_id'] = $json['emotion_id'];
        if (isset($json['context_id'])) $updateData['context_id'] = $json['context_id'];
        if (isset($json['cause_id'])) $updateData['cause_id'] = $json['cause_id'];
        if (isset($json['story'])) $updateData['story'] = $json['story'];
        if (isset($json['status'])) $updateData['status'] = $json['status'];

        $db->table('reflection_sessions')->where('id', $id)->update($updateData);

        $updated = $db->table('reflection_sessions')->where('id', $id)->get()->getRow();

        return $this->respondUpdated($updated, 'Session updated.');
    }

    /**
     * POST /endpoint/kiosk/sessions/:id/complete
     */
    public function complete($id = null)
    {
        $db = \Config\Database::connect();
        $session = $db->table('reflection_sessions')->where('id', $id)->get()->getRow();

        if (!$session) {
            return $this->respondNotFound('Session not found.');
        }

        // Generate QR token
        $token = bin2hex(random_bytes(16));

        // Select approved content using the selected emotion tags.
        $emotion = $session->emotion_id
            ? $db->table('emotions')->where('id', $session->emotion_id)->get()->getRow()
            : null;
        $emotionName = $emotion->name ?? null;
        $emotionCategory = $emotion->category ?? null;

        $verseQuery = $db->table('quran_verses')->where('status', 'approved');
        if ($emotionName || $emotionCategory) {
            $verseQuery->groupStart();
            if ($emotionName) $verseQuery->like('tags', $emotionName);
            if ($emotionCategory) $verseQuery->orLike('tags', $emotionCategory);
            $verseQuery->groupEnd();
        }
        $verse = $verseQuery->orderBy('RAND()')->limit(1)->get()->getRow();

        $hadithQuery = $db->table('hadiths')->where('status', 'approved');
        if ($emotionName || $emotionCategory) {
            $hadithQuery->groupStart();
            if ($emotionName) $hadithQuery->like('tags', $emotionName);
            if ($emotionCategory) $hadithQuery->orLike('tags', $emotionCategory);
            $hadithQuery->groupEnd();
        }
        $hadith = $hadithQuery->orderBy('RAND()')->limit(1)->get()->getRow();

        // Fallback to approved content if no matching tag exists.
        if (!$verse) $verse = $db->table('quran_verses')->where('status', 'approved')->orderBy('RAND()')->limit(1)->get()->getRow();
        if (!$hadith) $hadith = $db->table('hadiths')->where('status', 'approved')->orderBy('RAND()')->limit(1)->get()->getRow();

        // Create reflection result
        $resultId = $db->table('reflection_results')->insert([
            'session_id'       => $id,
            'token'            => $token,
            'verse_id'         => $verse->id ?? null,
            'hadith_id'        => $hadith->id ?? null,
            'advice'           => null,
            'reflection_guide' => null,
            'printed'          => false,
            'created_at'       => date('Y-m-d H:i:s'),
        ]);

        // Update session status
        $db->table('reflection_sessions')->where('id', $id)->update([
            'status'     => 'completed',
            'updated_at' => date('Y-m-d H:i:s'),
        ]);

        $result = $db->table('reflection_results')->where('id', $resultId)->get()->getRow();
        $result->verse = $verse;
        $result->hadith = $hadith;

        return $this->respondCreated($result, 'Reflection completed.');
    }
}
