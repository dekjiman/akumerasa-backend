<?php

namespace Sites\Endpoint\Controllers\Public;

use CodeIgniter\RESTful\ResourceController;
use Sites\Endpoint\Controllers\Traits\ResponseFormat;

class QrResult extends ResourceController
{
    use ResponseFormat;

    /**
     * GET /t/:token
     * Redirects to result web page or returns JSON
     */
    public function show($token = null)
    {
        if (empty($token)) {
            return $this->respondNotFound('Invalid token.');
        }

        $db = \Config\Database::connect();

        $result = $db->table('reflection_results')
            ->where('token', $token)
            ->get()
            ->getRow();

        if (!$result) {
            return $this->respondNotFound('Result not found or invalid token.');
        }

        // Get session details
        $session = $db->table('reflection_sessions')
            ->where('id', $result->session_id)
            ->get()
            ->getRow();

        // Get verse
        $verse = null;
        if ($result->verse_id) {
            $verse = $db->table('quran_verses')->where('id', $result->verse_id)->get()->getRow();
        }

        // Get hadith
        $hadith = null;
        if ($result->hadith_id) {
            $hadith = $db->table('hadiths')->where('id', $result->hadith_id)->get()->getRow();
        }

        // Get location
        $location = null;
        if ($session && $session->location_id) {
            $location = $db->table('locations')->where('id', $session->location_id)->get()->getRow();
        }

        // Check Accept header for JSON or HTML response
        $accept = $this->request->getHeaderLine('Accept');
        if (strpos($accept, 'application/json') !== false) {
            return $this->respondSuccess([
                'id'           => $result->id,
                'token'        => $result->token,
                'created_at'   => $result->created_at,
                'emotion'      => $session ? $this->getEmotion($db, $session->emotion_id) : null,
                'verse'        => $verse,
                'hadith'       => $hadith,
                'advice'       => $result->advice,
                'reflection_guide' => $result->reflection_guide,
                'location'     => $location ? $location->name : null,
                'printed'      => $result->printed,
            ]);
        }

        // Return HTML view
        $data = [
            'result'  => $result,
            'session' => $session,
            'verse'   => $verse,
            'hadith'  => $hadith,
            'location' => $location,
        ];

        return $this->respondSuccess($data);
    }

    private function getEmotion($db, $emotionId)
    {
        if (!$emotionId) return null;
        return $db->table('emotions')->where('id', $emotionId)->get()->getRow();
    }
}
