<?php

namespace Sites\Endpoint\Controllers\Filters;

use CodeIgniter\Filters\FilterInterface;
use CodeIgniter\HTTP\RequestInterface;
use CodeIgniter\HTTP\ResponseInterface;

class ThrottleFilter implements FilterInterface
{
    /**
     * Do whatever processing this filter needs to do.
     * By default it should not return anything during
     * normal execution. However, when an abnormal state
     * is found, it should return an instance of
     * CodeIgniter\HTTP\Response. If it does, script
     * execution will end and the HTTP Response will
     * be sent back to the browser, and any other code
     * that called this filter will not run.
     *
     * @param array<mixed> $arguments
     */
    public function before(RequestInterface $request, $arguments = null): ?ResponseInterface
    {
        // Simple rate limiting using session
        $ip = $request->getIPAddress();
        $key = 'throttle_' . md5($ip);

        $session = \Config\Services::session();
        $now = time();

        $data = $session->get($key) ?? ['count' => 0, 'start' => $now];

        // Reset if more than 1 minute has passed
        if ($now - $data['start'] > 60) {
            $data = ['count' => 0, 'start' => $now];
        }

        $data['count']++;
        $session->set($key, $data);

        // Limit: 60 requests per minute
        if ($data['count'] > 60) {
            $response = \Config\Services::response();
            return $response
                ->setStatusCode(429)
                ->setJSON([
                    'success' => false,
                    'message' => 'Too many requests. Please try again later.',
                    'data'    => null,
                    'meta'    => null,
                    'errors'  => null,
                ]);
        }

        return null;
    }

    /**
     * Allows After filters to inspect and modify the response
     * object as needed. This method does not have any mechanism
     * for preventing other filters from running after it — use
     * $this->response->setStatusCode() or check response code
     *
     * @param array<mixed> $arguments
     */
    public function after(RequestInterface $request, ResponseInterface $response, $arguments = null): ?ResponseInterface
    {
        return null;
    }
}
