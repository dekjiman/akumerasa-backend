# Authentication

## Overview

Refleksi Diri Backend menggunakan JWT (JSON Web Tokens) untuk autentikasi.

## User Authentication (Admin)

### Login Flow

1. **POST** `/endpoint/auth/login` dengan email dan password
2. Backend memvalidasi credentials
3. Backend generate JWT access token (24 jam) dan refresh token (7 hari)
4. Token disimpan di database (`user_sessions`)
5. Return token ke client

### Request

```json
POST /endpoint/auth/login
Content-Type: application/json

{
  "email": "admin@refleksidiri.id",
  "password": "your_password"
}
```

### Response

```json
{
  "success": true,
  "data": {
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
    "refresh_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
    "expires_in": 86400,
    "user": {
      "id": 1,
      "name": "Admin",
      "email": "admin@refleksidiri.id",
      "role": "super_admin",
      "tenant_id": null
    }
  }
}
```

### Using Token

Semua request yang dilindungi harus menyertakan header:

```
Authorization: Bearer {token}
```

### Refresh Token

Ketika access token expired:

```
POST /endpoint/auth/refresh
Headers:
  X-Refresh-Token: {refresh_token}
  X-Device-Fingerprint: {fingerprint}
```

### Logout

```
POST /endpoint/auth/logout
Headers:
  Authorization: Bearer {token}
```

Token akan di-revoke dan tidak dapat digunakan lagi.

---

## Device Authentication (Kiosk)

### Login Flow

1. Kiosk sudah terdaftar dengan `kiosk_code` dan `device_secret`
2. **POST** `/endpoint/auth/device/login` dengan kiosk_code dan device_secret
3. Backend memvalidasi credentials
4. Backend generate device token (1 tahun)
5. Return token ke kiosk

### Request

```json
POST /endpoint/auth/device/login
Content-Type: application/json

{
  "kiosk_code": "KSK-001",
  "device_secret": "your_device_secret"
}
```

### Response

```json
{
  "success": true,
  "data": {
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
    "expires_in": 2592000,
    "kiosk": {
      "id": 1,
      "kiosk_code": "KSK-001",
      "location_id": 1,
      "tenant_id": 1
    }
  }
}
```

### Using Token

```
Authorization: Bearer {device_token}
```

---

## Token Structure

### User Token Payload

```json
{
  "iss": "http://localhost:8080/",
  "iat": 1690000000,
  "exp": 1690086400,
  "sub": "1",
  "email": "admin@refleksidiri.id",
  "logged_token": "random_hex_string"
}
```

### Device Token Payload

```json
{
  "iss": "http://localhost:8080/",
  "iat": 1690000000,
  "exp": 1692592000,
  "type": "device",
  "kiosk_id": 1,
  "location_id": 1,
  "tenant_id": 1
}
```

---

## Security Notes

- Password di-hash dengan bcrypt + salt (`HASH_KEY`)
- Token dapat di-revoke melalui logout
- Refresh token hanya berlaku 7 hari
- Device token berlaku 1 tahun
- Login attempts dibatasi (5 kali) sebelum akun terkunci (15 menit)

