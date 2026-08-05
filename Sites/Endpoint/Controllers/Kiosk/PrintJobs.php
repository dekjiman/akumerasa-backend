<?php

namespace Sites\Endpoint\Controllers\Kiosk;

use CodeIgniter\RESTful\ResourceController;
use Sites\Endpoint\Controllers\Traits\ResponseFormat;

class PrintJobs extends ResourceController
{
    use ResponseFormat;

    /**
     * POST /endpoint/kiosk/sessions/:id/print
     */
    public function create($sessionId = null)
    {
        $db = \Config\Database::connect();

        $session = $db->table('reflection_sessions')->where('id', $sessionId)->get()->getRow();
        if (!$session) return $this->respondNotFound('Session not found.');

        $result = $db->table('reflection_results')->where('session_id', $sessionId)->get()->getRow();
        if (!$result) return $this->respondNotFound('Reflection result not found.');

        $jobId = $db->table('print_jobs')->insert([
            'session_id'  => $sessionId,
            'result_id'   => $result->id,
            'kiosk_id'    => $this->request->kioskId,
            'status'      => 'pending',
            'retry_count' => 0,
            'created_at'  => date('Y-m-d H:i:s'),
            'updated_at'  => date('Y-m-d H:i:s'),
        ]);

        $job = $db->table('print_jobs')->where('id', $jobId)->get()->getRow();

        return $this->respondCreated($job, 'Print job queued.');
    }

    /**
     * GET /endpoint/kiosk/print-jobs/pending
     */
    public function pending()
    {
        $db = \Config\Database::connect();
        $kioskId = $this->request->kioskId;

        $jobs = $db->table('print_jobs')
            ->where('kiosk_id', $kioskId)
            ->where('status', 'pending')
            ->orderBy('created_at', 'ASC')
            ->get()
            ->getResult();

        return $this->respondSuccess($jobs);
    }

    /**
     * GET /endpoint/kiosk/print-jobs/:id
     */
    public function show($id = null)
    {
        $db = \Config\Database::connect();
        $job = $db->table('print_jobs')->where('id', $id)->get()->getRow();
        if (!$job) return $this->respondNotFound('Print job not found.');
        return $this->respondSuccess($job);
    }

    /**
     * PUT /endpoint/kiosk/print-jobs/:id/status
     */
    public function updateStatus($id = null)
    {
        $db = \Config\Database::connect();
        $job = $db->table('print_jobs')->where('id', $id)->get()->getRow();
        if (!$job) return $this->respondNotFound('Print job not found.');

        $json = $this->request->getJSON(true);
        $status = $json['status'] ?? null;

        if (!in_array($status, ['printing', 'completed', 'failed'])) {
            return $this->respondValidationError('Invalid status.');
        }

        $updateData = [
            'status'     => $status,
            'updated_at' => date('Y-m-d H:i:s'),
        ];

        if ($status === 'completed') {
            $updateData['completed_at'] = date('Y-m-d H:i:s');

            // Mark result as printed
            $db->table('reflection_results')->where('id', $job->result_id)->update(['printed' => true]);
        }

        if ($status === 'failed') {
            $updateData['retry_count'] = $job->retry_count + 1;
            $updateData['error_message'] = $json['error'] ?? null;
        }

        $db->table('print_jobs')->where('id', $id)->update($updateData);

        $updated = $db->table('print_jobs')->where('id', $id)->get()->getRow();

        return $this->respondUpdated($updated, 'Print job status updated.');
    }
}
