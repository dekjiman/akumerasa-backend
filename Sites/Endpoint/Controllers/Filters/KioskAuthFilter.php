<?php

namespace Sites\Endpoint\Controllers\Filters;

use CodeIgniter\Filters\FilterInterface;
use CodeIgniter\HTTP\RequestInterface;
use CodeIgniter\HTTP\ResponseInterface;
use Firebase\JWT\JWT;
use Firebase\JWT\Key;

class KioskAuthFilter implements FilterInterface
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
        $authHeader = $request->getHeaderLine('Authorization');

        if (empty($authHeader) || !str_starts_with($authHeader, 'Bearer ')) {
            return $this->getErrorResponse('Missing or invalid Authorization header.', 401);
        }

        $token = substr($authHeader, 7);

        try {
            $decoded = JWT::decode($token, new Key(env('JWT_SECRET'), 'HS256'));

            // Check if this is a device token
            if (!isset($decoded->type) || $decoded->type !== 'device') {
                return $this->getErrorResponse('Invalid token type for kiosk endpoint.', 401);
            }

            // Check if token is revoked
            $db = \Config\Database::connect();
            $kioskToken = $db->table('kiosk_tokens')
                ->where('token_hash', hash('sha256', $token))
                ->where('revoked_at', null)
                ->get()
                ->getRow();

            if (!$kioskToken) {
                return $this->getErrorResponse('Token has been revoked.', 401);
            }

            // Add kiosk info to request
            $request->kioskId = (int) $decoded->kiosk_id;
            $request->locationId = (int) $decoded->location_id;
            $request->tenantId = (int) $decoded->tenant_id;
            $request->decodedToken = $decoded;

        } catch (\Exception $e) {
            return $this->getErrorResponse('Invalid or expired token.', 401);
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

    private function getErrorResponse(string $message, int $code): ResponseInterface
    {
        $response = \Config\Services::response();
        return $response
            ->setStatusCode($code)
            ->setJSON([
                'success' => false,
                'message' => $message,
                'data'    => null,
                'meta'    => null,
                'errors'  => null,
            ]);
    }
}
