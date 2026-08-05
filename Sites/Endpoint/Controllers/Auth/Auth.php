<?php

namespace Sites\Endpoint\Controllers\Auth;

use CodeIgniter\RESTful\ResourceController;
use Firebase\JWT\JWT;
use Firebase\JWT\Key;
use Sites\Endpoint\Controllers\Traits\ResponseFormat;

class Auth extends ResourceController
{
    use ResponseFormat;

    public function login()
    {
        $json = $this->request->getJSON(true);
        $email = trim($json['email'] ?? '');
        $password = $json['password'] ?? '';

        if (empty($email) || empty($password)) {
            return $this->respondValidationError(null, 'Email and password are required.');
        }

        $db = \Config\Database::connect();
        $user = $db->table('users')
            ->where('email', $email)
            ->get()
            ->getRow();

        if (!$user) {
            return $this->respondUnauthorized('Invalid credentials.');
        }

        if ($user->status !== 'active') {
            return $this->respondUnauthorized('Account is not active.');
        }

        if (!password_verify($password . env('HASH_KEY'), $user->password_hash)) {
            $attempts = (int) $user->login_attempts + 1;
            $update = ['login_attempts' => $attempts];

            if ($attempts >= 5) {
                $update['locked_until'] = date('Y-m-d H:i:s', time() + (15 * 60));
                $update['login_attempts'] = 0;
            }

            $db->table('users')->where('id', $user->id)->update($update);

            return $this->respondUnauthorized('Invalid credentials.');
        }

        $db->table('users')->where('id', $user->id)->update([
            'login_attempts' => 0,
            'locked_until'   => null,
            'last_login_at'  => date('Y-m-d H:i:s'),
        ]);

        $tokens = $this->issueTokens($user);

        $db->table('user_sessions')->insert([
            'user_id'          => $user->id,
            'token_hash'       => hash('sha256', $tokens['access_token']),
            'refresh_token_hash' => hash('sha256', $tokens['refresh_token']),
            'device_fingerprint' => $this->request->getHeaderLine('X-Device-Fingerprint'),
            'expires_at'       => date('Y-m-d H:i:s', time() + $tokens['expires_in']),
            'created_at'       => date('Y-m-d H:i:s'),
        ]);

        return $this->respondSuccess([
            'token'        => $tokens['access_token'],
            'refresh_token' => $tokens['refresh_token'],
            'expires_in'   => $tokens['expires_in'],
            'user'         => [
                'id'       => $user->id,
                'name'     => $user->name,
                'email'    => $user->email,
                'role'     => $user->role,
                'tenant_id' => $user->tenant_id,
            ],
        ], 'Login successful.');
    }

    public function register()
    {
        $json = $this->request->getJSON(true);
        $name = trim($json['name'] ?? '');
        $email = trim($json['email'] ?? '');
        $password = $json['password'] ?? '';
        $phone = trim($json['phone'] ?? '');

        if (empty($name) || empty($email) || empty($password)) {
            return $this->respondValidationError([
                'name'     => empty($name) ? ['Name is required.'] : null,
                'email'    => empty($email) ? ['Email is required.'] : null,
                'password' => empty($password) ? ['Password is required.'] : null,
            ]);
        }

        if (strlen($password) < 8) {
            return $this->respondValidationError(['password' => ['Password must be at least 8 characters.']]);
        }

        $db = \Config\Database::connect();

        $exists = $db->table('users')
            ->where('email', $email)
            ->where('deleted_at', null)
            ->countAllResults();

        if ($exists > 0) {
            return $this->respondError('Email already registered.', 422);
        }

        $verificationToken = bin2hex(random_bytes(32));
        $verificationExpiry = date('Y-m-d H:i:s', time() + (24 * 60 * 60));

        $db->table('users')->insert([
            'name'           => $name,
            'email'          => $email,
            'password_hash'  => password_hash($password . env('HASH_KEY'), PASSWORD_BCRYPT),
            'phone'          => $phone,
            'role'           => 'tenant_admin',
            'status'         => 'pending_verification',
            'created_at'     => date('Y-m-d H:i:s'),
            'updated_at'     => date('Y-m-d H:i:s'),
        ]);

        $userId = $db->insertID();

        $db->table('user_sessions')->insert([
            'user_id'              => $userId,
            'token_hash'           => hash('sha256', $verificationToken),
            'refresh_token_hash'   => hash('sha256', bin2hex(random_bytes(32))),
            'expires_at'           => $verificationExpiry,
            'device_fingerprint'   => 'email_verification',
            'created_at'           => date('Y-m-d H:i:s'),
        ]);

        $this->sendVerificationEmail($email, $name, $verificationToken);

        return $this->respondCreated([
            'user_id' => $userId,
            'email'   => $email,
            'message' => 'Registration successful. Please check your email for verification.',
        ], 'Registration successful.');
    }

    private function sendVerificationEmail(string $toEmail, string $toName, string $token): void
    {
        $verifyUrl = 'http://localhost:5173/verifikasi/' . $token;

        $email = \Config\Services::email();
        $email->setTo($toEmail);
        $email->setFrom('noreply@managpro.com', 'Refleksi Diri');
        $email->setSubject('Verifikasi Email - Refleksi Diri');
        $email->setMessage("
            <div style='font-family: Arial, sans-serif; max-width: 480px; margin: 0 auto; padding: 20px;'>
                <div style='background: #1a5632; color: white; padding: 20px; border-radius: 12px 12px 0 0; text-align: center;'>
                    <h1 style='margin: 0; font-size: 20px;'>Refleksi Diri</h1>
                </div>
                <div style='background: #ffffff; padding: 24px; border: 1px solid #e8e2d6; border-top: none; border-radius: 0 0 12px 12px;'>
                    <h2 style='color: #2c3327; margin-top: 0;'>Verifikasi Email Anda</h2>
                    <p style='color: #5c5748; font-size: 14px; line-height: 1.6;'>
                        Halo <strong>" . htmlspecialchars($toName) . "</strong>,
                    </p>
                    <p style='color: #5c5748; font-size: 14px; line-height: 1.6;'>
                        Terima kasih telah mendaftar di Refleksi Diri. Klik tombol di bawah untuk memverifikasi email Anda:
                    </p>
                    <div style='text-align: center; margin: 24px 0;'>
                        <a href='" . $verifyUrl . "' style='background: #1a5632; color: white; padding: 12px 32px; border-radius: 8px; text-decoration: none; font-weight: 600; font-size: 14px; display: inline-block;'>
                            Verifikasi Email
                        </a>
                    </div>
                    <p style='color: #9e9784; font-size: 12px; text-align: center;'>
                        Link ini berlaku selama 24 jam.
                    </p>
                    <p style='color: #9e9784; font-size: 12px; text-align: center;'>
                        Jika Anda tidak mendaftar, abaikan email ini.
                    </p>
                </div>
            </div>
        ");
        $email->setMailType('html');
        $email->send();
    }

    public function verifyEmail()
    {
        $json = $this->request->getJSON(true);
        $token = trim($json['token'] ?? '');

        if (empty($token)) {
            return $this->respondValidationError(null, 'Verification token is required.');
        }

        $db = \Config\Database::connect();

        $session = $db->table('user_sessions')
            ->where('token_hash', hash('sha256', $token))
            ->where('device_fingerprint', 'email_verification')
            ->where('revoked_at', null)
            ->where('expires_at >', date('Y-m-d H:i:s'))
            ->get()
            ->getRow();

        if (!$session) {
            return $this->respondError('Invalid or expired verification token.', 422);
        }

        $user = $db->table('users')
            ->where('id', $session->user_id)
            ->get()
            ->getRow();

        if (!$user) {
            return $this->respondNotFound('User not found.');
        }

        if ($user->status === 'active') {
            return $this->respondSuccess(null, 'Email already verified.');
        }

        $db->table('users')->where('id', $user->id)->update([
            'status'     => 'active',
            'updated_at' => date('Y-m-d H:i:s'),
        ]);

        $db->table('user_sessions')->where('id', $session->id)->update([
            'revoked_at' => date('Y-m-d H:i:s'),
        ]);

        $tokens = $this->issueTokens($user);

        $db->table('user_sessions')->insert([
            'user_id'              => $user->id,
            'token_hash'           => hash('sha256', $tokens['access_token']),
            'refresh_token_hash'   => hash('sha256', $tokens['refresh_token']),
            'expires_at'           => date('Y-m-d H:i:s', time() + $tokens['expires_in']),
            'created_at'           => date('Y-m-d H:i:s'),
        ]);

        return $this->respondSuccess([
            'token'        => $tokens['access_token'],
            'refresh_token' => $tokens['refresh_token'],
            'expires_in'   => $tokens['expires_in'],
            'user'         => [
                'id'    => $user->id,
                'name'  => $user->name,
                'email' => $user->email,
                'role'  => $user->role,
            ],
        ], 'Email verified successfully.');
    }

    public function deviceActivate()
    {
        $json = $this->request->getJSON(true);
        $activationCode = trim($json['activation_code'] ?? '');
        $deviceFingerprint = trim($json['device_fingerprint'] ?? '');
        $platform = trim($json['platform'] ?? 'web');
        $appVersion = trim($json['app_version'] ?? '1.0.0');
        $deviceName = trim($json['device_name'] ?? '');

        if (empty($activationCode) || strlen($activationCode) !== 6) {
            return $this->respondValidationError(['activation_code' => ['Activation code must be 6 digits.']]);
        }

        if (empty($deviceFingerprint)) {
            return $this->respondValidationError(['device_fingerprint' => ['Device fingerprint is required.']]);
        }

        $db = \Config\Database::connect();

        $activation = $db->table('device_activations')
            ->where('status', 'pending')
            ->where('expires_at >', date('Y-m-d H:i:s'))
            ->where('use_count < max_uses')
            ->get()
            ->getResult();

        $matched = null;
        foreach ($activation as $record) {
            if (password_verify($activationCode, $record->activation_code_hash)) {
                $matched = $record;
                break;
            }
        }

        if (!$matched) {
            return $this->respondError('Invalid or expired activation code.', 422);
        }

        $db->table('device_activations')->where('id', $matched->id)->update([
            'use_count'           => $matched->use_count + 1,
            'used_at'             => date('Y-m-d H:i:s'),
            'used_by_fingerprint' => $deviceFingerprint,
            'used_by_ip'          => $this->request->getIPAddress(),
            'updated_at'          => date('Y-m-d H:i:s'),
        ]);

        if ($matched->use_count + 1 >= $matched->max_uses) {
            $db->table('device_activations')->where('id', $matched->id)->update([
                'status' => 'used',
            ]);
        }

        $kiosk = $db->table('kiosks')->where('id', $matched->kiosk_id)->get()->getRow();
        if (!$kiosk) {
            return $this->respondNotFound('Kiosk not found.');
        }

        $db->table('kiosks')->where('id', $kiosk->id)->update([
            'status'            => 'active',
            'device_fingerprint' => $deviceFingerprint,
            'platform'          => $platform,
            'device_id'         => $deviceName,
            'activated_at'      => date('Y-m-d H:i:s'),
            'updated_at'        => date('Y-m-d H:i:s'),
        ]);

        $expireAt = time() + (365 * 24 * 60 * 60);
        $payload = [
            'iss'         => base_url(),
            'iat'         => time(),
            'exp'         => $expireAt,
            'type'        => 'device',
            'kiosk_id'    => $kiosk->id,
            'location_id' => $kiosk->location_id,
            'tenant_id'   => $kiosk->tenant_id,
        ];

        $token = JWT::encode($payload, env('JWT_SECRET'), 'HS256');

        $db->table('kiosk_tokens')->insert([
            'kiosk_id'    => $kiosk->id,
            'token_hash'  => hash('sha256', $token),
            'expires_at'  => date('Y-m-d H:i:s', $expireAt),
            'created_at'  => date('Y-m-d H:i:s'),
        ]);

        return $this->respondSuccess([
            'device_token'               => $token,
            'expires_in'                 => 365 * 24 * 60 * 60,
            'kiosk_id'                   => $kiosk->id,
            'tenant_id'                  => $kiosk->tenant_id,
            'location_id'                => $kiosk->location_id,
            'configuration_version'      => (int) $kiosk->configuration_version,
            'content_manifest_version'   => (int) $kiosk->content_manifest_version,
            'sync_required'              => false,
        ], 'Device activated successfully.');
    }

    public function me()
    {
        $userId = $this->request->userId ?? null;

        if (!$userId) {
            return $this->respondUnauthorized('User not found.');
        }

        $db = \Config\Database::connect();
        $user = $db->table('users')
            ->where('id', $userId)
            ->get()
            ->getRow();

        if (!$user) {
            return $this->respondNotFound('User not found.');
        }

        return $this->respondSuccess([
            'id'        => $user->id,
            'name'      => $user->name,
            'email'     => $user->email,
            'role'      => $user->role,
            'tenant_id' => $user->tenant_id,
            'status'    => $user->status,
        ]);
    }

    public function myPermissions()
    {
        $userId = $this->request->userId ?? null;
        if (!$userId) {
            return $this->respondUnauthorized('User not found.');
        }

        $db = \Config\Database::connect();

        $now = date('Y-m-d H:i:s');
        $assignments = $db->table('user_role_assignments')
            ->select('user_role_assignments.role_id, user_role_assignments.scope_type, user_role_assignments.scope_id, user_role_assignments.tenant_id, roles.name as role_name')
            ->join('roles', 'roles.id = user_role_assignments.role_id')
            ->where('user_role_assignments.user_id', $userId)
            ->where('user_role_assignments.status', 'active')
            ->groupStart()
                ->where('user_role_assignments.valid_from IS NULL')
                ->orWhere('user_role_assignments.valid_from <=', $now)
            ->groupEnd()
            ->groupStart()
                ->where('user_role_assignments.valid_until IS NULL')
                ->orWhere('user_role_assignments.valid_until >=', $now)
            ->groupEnd()
            ->get()
            ->getResult();

        if (empty($assignments)) {
            $user = $db->table('users')->where('id', $userId)->get()->getRow();
            $legacyRole = $user->role ?? 'viewer';
            $permRows = $db->table('role_permissions')
                ->select('permission')
                ->distinct(true)
                ->join('roles', 'roles.id = role_permissions.role_id')
                ->where('roles.name', $legacyRole)
                ->get()
                ->getResultArray();
            $permissions = array_column($permRows, 'permission');
            return $this->respondSuccess([
                'roles'       => [['role_id' => 0, 'role_name' => $legacyRole, 'scope_type' => 'legacy', 'scope_id' => null, 'tenant_id' => null]],
                'permissions' => array_values(array_unique($permissions)),
                'tenant_id'   => $user->tenant_id ?? null,
            ]);
        }

        $roleIds = array_column($assignments, 'role_id');
        $permRows = $db->table('role_permissions')
            ->select('permission')
            ->distinct(true)
            ->whereIn('role_id', $roleIds)
            ->get()
            ->getResultArray();
        $permissions = array_column($permRows, 'permission');

        $primaryTenantId = null;
        foreach ($assignments as $a) {
            if ($a->tenant_id) {
                $primaryTenantId = (int) $a->tenant_id;
                break;
            }
        }

        return $this->respondSuccess([
            'roles'       => array_map(fn($a) => [
                'role_id'     => (int) $a->role_id,
                'role_name'   => $a->role_name,
                'scope_type'  => $a->scope_type,
                'scope_id'    => $a->scope_id ? (int) $a->scope_id : null,
                'tenant_id'   => $a->tenant_id ? (int) $a->tenant_id : null,
            ], $assignments),
            'permissions' => array_values(array_unique($permissions)),
            'tenant_id'   => $primaryTenantId,
        ]);
    }

    public function logout()
    {
        $decoded = $this->request->decodedToken ?? null;

        if ($decoded && isset($decoded->logged_token)) {
            $db = \Config\Database::connect();
            $db->table('user_sessions')
                ->where('token_hash', hash('sha256', $decoded->logged_token))
                ->update(['revoked_at' => date('Y-m-d H:i:s')]);
        }

        return $this->respondSuccess(null, 'Logged out successfully.');
    }

    public function refresh()
    {
        $refreshToken = $this->request->getHeaderLine('X-Refresh-Token');
        $fingerprint = $this->request->getHeaderLine('X-Device-Fingerprint');

        if (empty($refreshToken)) {
            return $this->respondValidationError(null, 'Refresh token is required.');
        }

        $db = \Config\Database::connect();
        $session = $db->table('user_sessions')
            ->where('refresh_token_hash', hash('sha256', $refreshToken))
            ->where('revoked_at', null)
            ->where('expires_at >', date('Y-m-d H:i:s'))
            ->get()
            ->getRow();

        if (!$session) {
            return $this->respondUnauthorized('Invalid or expired refresh token.');
        }

        $user = $db->table('users')
            ->where('id', $session->user_id)
            ->get()
            ->getRow();

        if (!$user) {
            return $this->respondUnauthorized('User not found.');
        }

        $db->table('user_sessions')->where('id', $session->id)->update([
            'revoked_at' => date('Y-m-d H:i:s'),
        ]);

        $tokens = $this->issueTokens($user);

        $db->table('user_sessions')->insert([
            'user_id'          => $user->id,
            'token_hash'       => hash('sha256', $tokens['access_token']),
            'refresh_token_hash' => hash('sha256', $tokens['refresh_token']),
            'device_fingerprint' => $fingerprint,
            'expires_at'       => date('Y-m-d H:i:s', time() + $tokens['expires_in']),
            'created_at'       => date('Y-m-d H:i:s'),
        ]);

        $this->response->setHeader('X-New-Token', $tokens['access_token']);

        return $this->respondSuccess([
            'token'         => $tokens['access_token'],
            'refresh_token' => $tokens['refresh_token'],
            'expires_in'    => $tokens['expires_in'],
            'user'          => [
                'id'    => $user->id,
                'name'  => $user->name,
                'email' => $user->email,
            ],
        ], 'Token refreshed successfully.');
    }

    private function issueTokens(object $user): array
    {
        $expireAt = time() + (int) env('JWT_EXPIRE');
        $refreshExpireAt = time() + (int) env('JWT_REFRESH_EXPIRE');

        $accessToken = JWT::encode([
            'iss'      => base_url(),
            'iat'      => time(),
            'exp'      => $expireAt,
            'sub'      => (string) $user->id,
            'email'    => $user->email,
            'logged_token' => bin2hex(random_bytes(32)),
        ], env('JWT_SECRET'), 'HS256');

        $refreshToken = JWT::encode([
            'iss' => base_url(),
            'iat' => time(),
            'exp' => $refreshExpireAt,
            'sub' => (string) $user->id,
        ], env('JWT_SECRET'), 'HS256');

        return [
            'access_token'  => $accessToken,
            'refresh_token' => $refreshToken,
            'expires_in'    => (int) env('JWT_EXPIRE'),
        ];
    }

    public function forgotPassword()
    {
        $json = $this->request->getJSON(true);
        $email = trim($json['email'] ?? '');

        if (empty($email)) {
            return $this->respondValidationError(['email' => ['Email is required.']]);
        }

        $db = \Config\Database::connect();
        $user = $db->table('users')
            ->where('email', $email)
            ->where('deleted_at', null)
            ->get()
            ->getRow();

        if (!$user) {
            return $this->respondSuccess(null, 'If the email exists, a reset link has been sent.');
        }

        $resetToken = bin2hex(random_bytes(32));
        $resetExpiry = date('Y-m-d H:i:s', time() + (60 * 60));

        $db->table('user_sessions')->insert([
            'user_id'              => $user->id,
            'token_hash'           => hash('sha256', $resetToken),
            'refresh_token_hash'   => hash('sha256', bin2hex(random_bytes(32))),
            'expires_at'           => $resetExpiry,
            'device_fingerprint'   => 'password_reset',
            'created_at'           => date('Y-m-d H:i:s'),
        ]);

        $this->sendPasswordResetEmail($user->email, $user->name, $resetToken);

        return $this->respondSuccess(null, 'If the email exists, a reset link has been sent.');
    }

    public function resendVerification()
    {
        $json = $this->request->getJSON(true);
        $email = trim($json['email'] ?? '');

        if (empty($email)) {
            return $this->respondValidationError(['email' => ['Email is required.']]);
        }

        $db = \Config\Database::connect();
        $user = $db->table('users')
            ->where('email', $email)
            ->where('status', 'pending_verification')
            ->where('deleted_at', null)
            ->get()
            ->getRow();

        if (!$user) {
            return $this->respondSuccess(null, 'If the email exists and is unverified, a new link has been sent.');
        }

        $db->table('user_sessions')
            ->where('user_id', $user->id)
            ->where('device_fingerprint', 'email_verification')
            ->where('revoked_at', null)
            ->update(['revoked_at' => date('Y-m-d H:i:s')]);

        $verificationToken = bin2hex(random_bytes(32));
        $verificationExpiry = date('Y-m-d H:i:s', time() + (24 * 60 * 60));

        $db->table('user_sessions')->insert([
            'user_id'              => $user->id,
            'token_hash'           => hash('sha256', $verificationToken),
            'refresh_token_hash'   => hash('sha256', bin2hex(random_bytes(32))),
            'expires_at'           => $verificationExpiry,
            'device_fingerprint'   => 'email_verification',
            'created_at'           => date('Y-m-d H:i:s'),
        ]);

        $this->sendVerificationEmail($user->email, $user->name, $verificationToken);

        return $this->respondSuccess(null, 'If the email exists and is unverified, a new link has been sent.');
    }

    public function resetPassword()
    {
        $json = $this->request->getJSON(true);
        $token = trim($json['token'] ?? '');
        $newPassword = $json['password'] ?? '';

        if (empty($token) || empty($newPassword)) {
            return $this->respondValidationError([
                'token'    => empty($token) ? ['Token is required.'] : null,
                'password' => empty($newPassword) ? ['Password is required.'] : null,
            ]);
        }

        if (strlen($newPassword) < 8) {
            return $this->respondValidationError(['password' => ['Password must be at least 8 characters.']]);
        }

        $db = \Config\Database::connect();

        $session = $db->table('user_sessions')
            ->where('token_hash', hash('sha256', $token))
            ->where('device_fingerprint', 'password_reset')
            ->where('revoked_at', null)
            ->where('expires_at >', date('Y-m-d H:i:s'))
            ->get()
            ->getRow();

        if (!$session) {
            return $this->respondError('Invalid or expired reset token.', 422);
        }

        $user = $db->table('users')
            ->where('id', $session->user_id)
            ->get()
            ->getRow();

        if (!$user) {
            return $this->respondNotFound('User not found.');
        }

        $db->table('users')->where('id', $user->id)->update([
            'password_hash' => password_hash($newPassword . env('HASH_KEY'), PASSWORD_BCRYPT),
            'updated_at'    => date('Y-m-d H:i:s'),
        ]);

        $db->table('user_sessions')->where('id', $session->id)->update([
            'revoked_at' => date('Y-m-d H:i:s'),
        ]);

        $db->table('user_sessions')
            ->where('user_id', $user->id)
            ->where('revoked_at', null)
            ->update(['revoked_at' => date('Y-m-d H:i:s')]);

        return $this->respondSuccess(null, 'Password has been reset successfully.');
    }

    private function sendPasswordResetEmail(string $toEmail, string $toName, string $token): void
    {
        $resetUrl = 'http://localhost:5173/admin/reset-password?token=' . $token;

        $email = \Config\Services::email();
        $email->setTo($toEmail);
        $email->setFrom('noreply@managpro.com', 'Refleksi Diri');
        $email->setSubject('Reset Password - Refleksi Diri');
        $email->setMessage("
            <div style='font-family: Arial, sans-serif; max-width: 480px; margin: 0 auto; padding: 20px;'>
                <div style='background: #1a5632; color: white; padding: 20px; border-radius: 12px 12px 0 0; text-align: center;'>
                    <h1 style='margin: 0; font-size: 20px;'>Refleksi Diri</h1>
                </div>
                <div style='background: #ffffff; padding: 24px; border: 1px solid #e8e2d6; border-top: none; border-radius: 0 0 12px 12px;'>
                    <h2 style='color: #2c3327; margin-top: 0;'>Reset Password</h2>
                    <p style='color: #5c5748; font-size: 14px; line-height: 1.6;'>
                        Halo <strong>" . htmlspecialchars($toName) . "</strong>,
                    </p>
                    <p style='color: #5c5748; font-size: 14px; line-height: 1.6;'>
                        Kami menerima permintaan untuk mereset password akun Anda. Klik tombol di bawah untuk membuat password baru:
                    </p>
                    <div style='text-align: center; margin: 24px 0;'>
                        <a href='" . $resetUrl . "' style='background: #1a5632; color: white; padding: 12px 32px; border-radius: 8px; text-decoration: none; font-weight: 600; font-size: 14px; display: inline-block;'>
                            Reset Password
                        </a>
                    </div>
                    <p style='color: #9e9784; font-size: 12px; text-align: center;'>
                        Link ini berlaku selama 1 jam.
                    </p>
                    <p style='color: #9e9784; font-size: 12px; text-align: center;'>
                        Jika Anda tidak meminta reset password, abaikan email ini.
                    </p>
                </div>
            </div>
        ");
        $email->setMailType('html');
        $email->send();
    }
}

