<?php

namespace Sites\Endpoint\Controllers\Traits;

use CodeIgniter\HTTP\ResponseInterface;

trait ResponseFormat
{
    /**
     * Send a 200 OK response with data
     */
    protected function respondSuccess(mixed $data = null, string $message = 'OK', ?array $meta = null): ResponseInterface
    {
        return $this->response
            ->setStatusCode(200)
            ->setJSON([
                'success' => true,
                'message' => $message,
                'data'    => $data,
                'meta'    => $meta,
                'errors'  => null,
            ]);
    }

    /**
     * Send a 201 Created response
     */
    protected function respondCreated(mixed $data = null, string $message = 'Created.'): ResponseInterface
    {
        return $this->response
            ->setStatusCode(201)
            ->setJSON([
                'success' => true,
                'message' => $message,
                'data'    => $data,
                'meta'    => null,
                'errors'  => null,
            ]);
    }

    /**
     * Send a 200 OK response for updates
     */
    protected function respondUpdated(mixed $data = null, string $message = 'Updated.'): ResponseInterface
    {
        return $this->response
            ->setStatusCode(200)
            ->setJSON([
                'success' => true,
                'message' => $message,
                'data'    => $data,
                'meta'    => null,
                'errors'  => null,
            ]);
    }

    /**
     * Send a 200 OK response for deletes
     */
    protected function respondDeleted($data = null, string $message = ''): ResponseInterface
    {
        if (is_string($data) && $message === '') {
            $message = $data;
            $data = null;
        }
        $message = $message !== '' ? $message : 'Deleted.';

        return $this->response
            ->setStatusCode(200)
            ->setJSON([
                'success' => true,
                'message' => $message,
                'data'    => $data,
                'meta'    => null,
                'errors'  => null,
            ]);
    }

    /**
     * Send an error response
     */
    protected function respondError(string $message, int $code = 400, mixed $errors = null): ResponseInterface
    {
        return $this->response
            ->setStatusCode($code)
            ->setJSON([
                'success' => false,
                'message' => $message,
                'data'    => null,
                'meta'    => null,
                'errors'  => $errors,
            ]);
    }

    /**
     * Send a 400 Validation Error response
     */
    protected function respondValidationError(mixed $errors = null, string $message = 'Validation failed.'): ResponseInterface
    {
        return $this->respondError($message, 400, $errors);
    }

    /**
     * Send a 404 Not Found response
     */
    protected function respondNotFound(string $message = 'Resource not found.'): ResponseInterface
    {
        return $this->respondError($message, 404);
    }

    /**
     * Send a 401 Unauthorized response
     */
    protected function respondUnauthorized(string $message = 'Unauthorized.'): ResponseInterface
    {
        return $this->respondError($message, 401);
    }

    /**
     * Send a 403 Forbidden response
     */
    protected function respondForbidden(string $message = 'Forbidden.'): ResponseInterface
    {
        return $this->respondError($message, 403);
    }

    /**
     * Send a 500 Server Error response
     */
    protected function respondServerError(string $message = 'Internal server error.'): ResponseInterface
    {
        return $this->respondError($message, 500);
    }

    /**
     * Send a 429 Too Many Requests response
     */
    protected function respondTooManyRequests(string $message = 'Too many requests. Please try again later.'): ResponseInterface
    {
        return $this->respondError($message, 429);
    }

    /**
     * Send a 422 Business Rule Error response
     */
    protected function respondBusinessRuleError(string $message = 'Business rule violation.'): ResponseInterface
    {
        return $this->respondError($message, 422);
    }
}
