# API Reference

## Base URL

```
http://localhost:8080/endpoint
```

## Standard Response Format

### Success
```json
{
  "success": true,
  "message": "OK",
  "data": { ... },
  "meta": null,
  "errors": null
}
```

### Paginated
```json
{
  "success": true,
  "message": "OK",
  "data": [ ... ],
  "meta": {
    "current_page": 1,
    "last_page": 10,
    "per_page": 20,
    "total": 200
  },
  "errors": null
}
```

### Error
```json
{
  "success": false,
  "message": "Error message",
  "data": null,
  "meta": null,
  "errors": { ... }
}
```

---

## Auth Endpoints

### POST /endpoint/auth/login
Login and get JWT token.

**Request:**
```json
{
  "email": "admin@refleksidiri.id",
  "password": "password"
}
```

**Response:**
```json
{
  "success": true,
  "data": {
    "token": "eyJ...",
    "refresh_token": "eyJ...",
    "expires_in": 86400,
    "user": {
      "id": 1,
      "name": "Admin",
      "email": "admin@refleksidiri.id",
      "role": "super_admin"
    }
  }
}
```

### POST /endpoint/auth/device/login
Kiosk device login.

**Request:**
```json
{
  "kiosk_code": "KSK-001",
  "device_secret": "abc123..."
}
```

### GET /endpoint/auth/me
Get current user profile.

**Headers:** `Authorization: Bearer {token}`

### POST /endpoint/auth/logout
Logout and revoke token.

**Headers:** `Authorization: Bearer {token}`

### POST /endpoint/auth/refresh
Refresh access token.

**Headers:** `X-Refresh-Token: {refresh_token}`

---

## Admin Endpoints

All admin endpoints require JWT authentication.

### Tenants

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | /endpoint/admin/tenants | List tenants |
| POST | /endpoint/admin/tenants | Create tenant |
| GET | /endpoint/admin/tenants/:id | Get tenant |
| PUT | /endpoint/admin/tenants/:id | Update tenant |
| DELETE | /endpoint/admin/tenants/:id | Delete tenant |

### Locations

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | /endpoint/admin/locations | List locations |
| POST | /endpoint/admin/locations | Create location |
| GET | /endpoint/admin/locations/:id | Get location |
| PUT | /endpoint/admin/locations/:id | Update location |
| DELETE | /endpoint/admin/locations/:id | Delete location |

### Kiosks

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | /endpoint/admin/kiosks | List kiosks |
| POST | /endpoint/admin/kiosks | Register kiosk |
| GET | /endpoint/admin/kiosks/:id | Get kiosk |
| PUT | /endpoint/admin/kiosks/:id | Update kiosk |
| DELETE | /endpoint/admin/kiosks/:id | Delete kiosk |
| GET | /endpoint/admin/kiosks/:id/heartbeats | Get heartbeats |
| POST | /endpoint/admin/kiosks/:id/regenerate-token | Regenerate device secret |

### Users

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | /endpoint/admin/users | List users |
| POST | /endpoint/admin/users | Create user |
| GET | /endpoint/admin/users/:id | Get user |
| PUT | /endpoint/admin/users/:id | Update user |
| DELETE | /endpoint/admin/users/:id | Delete user |

### Content

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | /endpoint/admin/content/emotions | List emotions |
| POST | /endpoint/admin/content/emotions | Create emotion |
| PUT | /endpoint/admin/content/emotions/:id | Update emotion |
| DELETE | /endpoint/admin/content/emotions/:id | Delete emotion |
| GET | /endpoint/admin/content/quran | List Quran verses |
| POST | /endpoint/admin/content/quran | Create verse |
| PUT | /endpoint/admin/content/quran/:id | Update verse |
| PUT | /endpoint/admin/content/quran/:id/review | Review verse |

### Campaigns

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | /endpoint/admin/campaigns | List campaigns |
| POST | /endpoint/admin/campaigns | Create campaign |
| GET | /endpoint/admin/campaigns/:id | Get campaign |
| PUT | /endpoint/admin/campaigns/:id | Update campaign |
| DELETE | /endpoint/admin/campaigns/:id | Delete campaign |

### Reports

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | /endpoint/admin/reports/overview | Dashboard overview |
| GET | /endpoint/admin/reports/sessions | Session statistics |
| GET | /endpoint/admin/reports/donations | Donation statistics |

---

## Kiosk Endpoints

All kiosk endpoints require device authentication.

| Method | Endpoint | Description |
|--------|----------|-------------|
| POST | /endpoint/kiosk/heartbeat | Send heartbeat |
| GET | /endpoint/kiosk/config | Get kiosk config |
| GET | /endpoint/kiosk/manifest | Get active campaigns |
| POST | /endpoint/kiosk/sessions | Start reflection |
| GET | /endpoint/kiosk/sessions/:id | Get session |
| PUT | /endpoint/kiosk/sessions/:id | Update session |
| POST | /endpoint/kiosk/sessions/:id/complete | Complete reflection |
| POST | /endpoint/kiosk/sessions/:id/print | Queue print job |

---

## Public Endpoints

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | /t/:token | QR result redirect |
| POST | /endpoint/public/donasi | Create donation |

---

## Webhook Endpoints

| Method | Endpoint | Description |
|--------|----------|-------------|
| POST | /endpoint/webhook/payment | Payment webhook |
