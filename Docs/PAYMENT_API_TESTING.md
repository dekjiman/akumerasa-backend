# Payment Gateway - API Testing Guide

> **Base URL:** `http://localhost:8080`
> **Content-Type:** `application/json`

---

## Setup

### 1. Login Admin (dapatkan JWT token)

```
POST http://localhost:8080/endpoint/auth/login
Content-Type: application/json
```

```json
{
  "email": "admin@refleksi.com",
  "password": "your_password"
}
```

**Response (200):**
```json
{
  "success": true,
  "message": "Login successful.",
  "data": {
    "token": "eyJhbGciOiJIUzI1NiIs...",
    "refresh_token": "...",
    "user": { "id": 1, "email": "admin@refleksi.com", "role": "admin" }
  }
}
```

> Simpan token: `Authorization: Bearer <token>`

### 2. Generate Webhook HMAC Signature

```bash
# Bash
PAYLOAD='{"event":"payment.succeeded","data":{"id":"pr_xxx","reference_id":"DON-xxx","status":"SUCCEEDED","amount":50000}}'
echo -n "$PAYLOAD" | openssl dgst -sha256 -hmac "JhMhTIus9m9V3fss7zF6tweSYVdwsfhu6swgMh7lJd6v23or"
```

```php
// PHP
$payload = '{"event":"payment.succeeded","data":{...}}';
$signature = hash_hmac('sha256', $payload, 'JhMhTIus9m9V3fss7zF6tweSYVdwsfhu6swgMh7lJd6v23or');
```

---

## 1. Create Donation (QRIS)

**POST** `/endpoint/public/donasi`

### Request Body

```json
{
  "amount": 50000,
  "payment_method": "qris",
  "session_id": 1,
  "tenant_id": 1,
  "donor_name": "Ahmad Fauzi",
  "campaign_id": 1,
  "note": "Donasi untuk pembangunan masjid"
}
```

### Response (201)

```json
{
  "success": true,
  "message": "Payment created. Proceed with payment.",
  "data": {
    "donation": {
      "id": 1,
      "session_id": "1",
      "tenant_id": "1",
      "donor_name": "Ahmad Fauzi",
      "campaign_id": "1",
      "amount": "50000.00",
      "payment_method": "qris",
      "reference": "DON-20260727-a1b2c3d4",
      "qr_data": "0002010102125303360...",
      "status": "pending",
      "xendit_payment_request_id": "pr_5f8e...",
      "qr_type": "dynamic",
      "expires_at": "2026-07-28 06:55:00"
    },
    "payment": {
      "payment_request_id": "pr_5f8e...",
      "status": "ACTIVE",
      "qr_string": "0002010102125303360...",
      "qr_image": "data:image/png;base64,...",
      "amount": 50000,
      "currency": "IDR"
    }
  }
}
```

> **Simpan `reference`** untuk check status dan simulasi webhook.

---

## 2. Create Donation (VA BRI)

**POST** `/endpoint/public/donasi`

```json
{
  "amount": 100000,
  "payment_method": "va_bri",
  "tenant_id": 2,
  "donor_name": "Siti Rahma"
}
```

### Response (201)

```json
{
  "data": {
    "donation": {
      "id": 2,
      "tenant_id": "2",
      "donor_name": "Siti Rahma",
      "amount": "100000.00",
      "payment_method": "va_bri",
      "reference": "DON-20260727-e5f6g7h8",
      "status": "pending",
      "va_number": "1234567890123",
      "bank_code": "bri",
      "channel_code": "BRI",
      "expires_at": "2026-07-28 06:55:00"
    },
    "payment": {
      "va_number": "1234567890123",
      "channel_code": "BRI",
      "amount": 100000
    }
  }
}
```

---

## 3. Create Donation (VA BCA)

**POST** `/endpoint/public/donasi`

```json
{
  "amount": 250000,
  "payment_method": "va_bca",
  "tenant_id": 1,
  "donor_name": "Budi Santoso",
  "campaign_id": 3
}
```

---

## 4. Check Payment Status

**GET** `/endpoint/public/payment-status/{reference}`

### Response - Pending (200)

```json
{
  "success": true,
  "message": "OK",
  "data": {
    "reference": "DON-20260727-a1b2c3d4",
    "status": "pending",
    "paid_at": null,
    "expires_at": "2026-07-28 06:55:00",
    "tenant_id": "1"
  }
}
```

### Response - Paid (200)

```json
{
  "data": {
    "reference": "DON-20260727-a1b2c3d4",
    "status": "paid",
    "paid_at": "2026-07-27 07:10:00",
    "tenant_id": "1"
  }
}
```

### Response - Not Found (404)

```json
{
  "success": false,
  "message": "Donation not found."
}
```

---

## 5. Webhook - Payment Success

**POST** `/endpoint/webhook/payment`
**Header:** `x-callback-token: <HMAC-SHA256>`

```json
{
  "event": "payment.succeeded",
  "data": {
    "id": "pr_5f8e...",
    "reference_id": "DON-20260727-a1b2c3d4",
    "status": "SUCCEEDED",
    "amount": 50000,
    "payment_method": {
      "type": "QR_CODE",
      "qr_code": { "channel_code": "QRIS" }
    }
  }
}
```

### Response (200)

```json
{ "success": true, "message": "Webhook processed." }
```

### Verify DB

```sql
SELECT reference, status, paid_at, tenant_id, donor_name
FROM donations WHERE reference = 'DON-20260727-a1b2c3d4';

SELECT * FROM payment_webhooks ORDER BY id DESC LIMIT 1;
```

---

## 6. Webhook - Payment Failed

```json
{
  "event": "payment.failed",
  "data": {
    "id": "pr_7a3b...",
    "reference_id": "DON-20260727-e5f6g7h8",
    "status": "FAILED",
    "failure_code": "INSUFFICIENT_FUNDS"
  }
}
```

### DB Check

```sql
SELECT reference, status, failure_code FROM donations
WHERE reference = 'DON-20260727-e5f6g7h8';
-- status: 'failed', failure_code: 'INSUFFICIENT_FUNDS'
```

---

## 7. Webhook - Duplicate Event (Idempotency Test)

### Request 1 - First time

```json
{
  "event": "payment.succeeded",
  "data": { "id": "pr_5f8e...", "reference_id": "DON-20260727-a1b2c3d4", "status": "SUCCEEDED" }
}
```

**Response:** `"Webhook processed."`

### Request 2 - Duplicate

```json
{
  "event": "payment.succeeded",
  "data": { "id": "pr_5f8e...", "reference_id": "DON-20260727-a1b2c3d4", "status": "SUCCEEDED" }
}
```

**Response:** `"Duplicate webhook, already processed."`

---

## 8. Webhook - Invalid Signature

**Header:** `x-callback-token: signature_yang_salah`

### Response (401)

```json
{ "success": false, "message": "Invalid webhook signature" }
```

---

## 9. Webhook - Invalid JSON

### Request Body

```
this is not json
```

### Response (400)

```json
{ "success": false, "message": "Invalid JSON" }
```

---

## 10. Admin: List Donations

**GET** `/endpoint/admin/donations`
**Header:** `Authorization: Bearer <token>`

### Query Parameters

| Param | Type | Example |
|-------|------|---------|
| `page` | int | `1` |
| `per_page` | int | `20` |
| `status` | string | `pending`, `paid`, `expired`, `failed` |
| `payment_method` | string | `qris`, `va_bri` |
| `tenant_id` | int | `1` |
| `campaign_id` | int | `1` |
| `start_date` | string | `2026-07-01` |
| `end_date` | string | `2026-07-31` |
| `search` | string | `ahmad` |

### Response (200)

```json
{
  "success": true,
  "data": [
    {
      "id": 1,
      "tenant_id": "1",
      "donor_name": "Ahmad Fauzi",
      "amount": "50000.00",
      "payment_method": "qris",
      "reference": "DON-20260727-a1b2c3d4",
      "status": "paid"
    }
  ],
  "meta": { "current_page": 1, "last_page": 1, "per_page": 20, "total": 3 }
}
```

---

## 11. Admin: Get Donation Detail

**GET** `/endpoint/admin/donations/{id}`
**Header:** `Authorization: Bearer <token>`

### Response (200)

```json
{
  "data": {
    "id": 1,
    "tenant_id": "1",
    "donor_name": "Ahmad Fauzi",
    "campaign_id": "1",
    "amount": "50000.00",
    "reference": "DON-20260727-a1b2c3d4",
    "status": "paid",
    "payment_details": { "type": "QR_CODE", "qr_code": { "channel_code": "QRIS" } },
    "paid_at": "2026-07-27 07:10:00"
  }
}
```

---

## 12. Admin: Cancel Donation

**POST** `/endpoint/admin/donations/{id}/cancel`
**Header:** `Authorization: Bearer <token>`

### Response - Success (200)

```json
{
  "success": true,
  "message": "Donation cancelled and payment voided on Xendit.",
  "data": { "xendit_cancelled": true }
}
```

### Response - Cancel Locally (200)

```json
{
  "success": true,
  "message": "Donation cancelled locally. Warning: Xendit void may have failed.",
  "data": { "xendit_cancelled": false }
}
```

### Response - Wrong Status (400)

```json
{ "success": false, "message": "Only pending donations can be cancelled." }
```

---

## 13. Validation Errors

### Amount = 0

```json
{ "amount": 0, "payment_method": "qris" }
```

**Response (400):** `"Amount must be greater than 0."`

### Invalid Method

```json
{ "amount": 50000, "payment_method": "bitcoin" }
```

**Response (400):** `"Invalid payment_method. Allowed: qris, va_bri, va_bni, ..."`

### Below Minimum (QRIS)

```json
{ "amount": 500, "payment_method": "qris" }
```

**Response (400):** `"Amount must be between 1500 and 10000000 for qris."`

### Below Minimum (VA)

```json
{ "amount": 5000, "payment_method": "va_bri" }
```

**Response (400):** `"Amount must be between 10000 and 50000000 for va_bri."`

---

## 14. Happy Path Test (End-to-End)

```bash
# Step 1: Create donation
curl -X POST http://localhost:8080/endpoint/public/donasi \
  -H "Content-Type: application/json" \
  -d '{"amount":50000,"payment_method":"qris","tenant_id":1,"donor_name":"Test"}'

# Step 2: Check status (should be pending)
curl http://localhost:8080/endpoint/public/payment-status/DON-xxxx

# Step 3: Simulate via Xendit Dashboard → payment.succeeded

# Step 4: Check status again (should be paid)
curl http://localhost:8080/endpoint/public/payment-status/DON-xxxx
```

---

## 15. Xendit Dashboard Simulation

1. Login **https://dashboard.xendit.co**
2. **Payment** → **Payment Requests** → find `pr_xxx`
3. Click **Simulate** → choose `SUCCEEDED` or `FAILED`
4. Webhook auto-fires to your endpoint

> For local dev, use **ngrok**: `ngrok http 8080`

---

## Payment Methods Reference

| Key | Description | Min | Max |
|-----|-------------|-----|-----|
| `qris` | QRIS | Rp 1.500 | Rp 10.000.000 |
| `va_bri` | BRI VA | Rp 10.000 | Rp 50.000.000 |
| `va_bni` | BNI VA | Rp 10.000 | Rp 50.000.000 |
| `va_mandiri` | Mandiri VA | Rp 10.000 | Rp 50.000.000 |
| `va_bsi` | BSI VA | Rp 10.000 | Rp 50.000.000 |
| `va_permata` | Permata VA | Rp 10.000 | Rp 50.000.000 |
| `va_muamalat` | Muamalat VA | Rp 10.000 | Rp 50.000.000 |
| `va_bjb` | BJB VA | Rp 10.000 | Rp 50.000.000 |
| `va_bnc` | BNC VA | Rp 10.000 | Rp 50.000.000 |
| `va_bss` | BSS VA | Rp 10.000 | Rp 50.000.000 |

## Status Flow

```
pending -> paid       (webhook: payment.succeeded)
pending -> failed     (webhook: payment.failed)
pending -> expired    (timeout / admin cancel)
pending -> refunded   (webhook: payment.refunded)
```

## HTTP Status Codes

| Code | Meaning |
|------|---------|
| 200 | Success / Already processed |
| 201 | Donation created |
| 400 | Invalid JSON / Validation error |
| 401 | Invalid webhook signature / JWT missing |
| 404 | Resource not found |
| 422 | Business rule violation |
| 429 | Rate limit hit |
| 500 | Internal error |
| 502 | Xendit API error |
