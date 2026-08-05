<?php

namespace Sites\Endpoint\Controllers\Filters;

use CodeIgniter\Filters\FilterInterface;
use CodeIgniter\HTTP\RequestInterface;
use CodeIgniter\HTTP\ResponseInterface;

class JWTRefreshFilter implements FilterInterface
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
        $refreshToken = $request->getHeaderLine('X-Refresh-Token');

        if (empty($refreshToken)) {
            $json = $request->getJSON(true);
            $refreshToken = $json['refresh_token'] ?? '';
        }

        if (empty($refreshToken)) {
            $response = \Config\Services::response();
            return $response
                ->setStatusCode(400)
                ->setJSON([
                    'success' => false,
                    'message' => 'Refresh token required.',
                    'data'    => null,
                    'meta'    => null,
                    'errors'  => null,
                ]);
        }

        $request->refreshToken = $refreshToken;

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
