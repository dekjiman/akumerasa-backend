# Xendit Payment Gateway Integration

## Overview

Integrasi Xendit Payment Gateway untuk menangani pembayaran donasi pada Refleksi Diri.
Mendukung **QRIS** (Dynamic & Static) dan **Virtual Account** semua bank Indonesia.

---

## Daftar Isi

1. [Arsitektur](#arsitektur)
2. [Metode Pembayaran](#metode-pembayaran)
3. [Flow Pembayaran](#flow-pembayaran)
4. [API Endpoints](#api-endpoints)
5. [Database Schema](#database-schema)
6. [Konfigurasi](#konfigurasi)
7. [Webhook Handling](#webhook-handling)
8. [Testing](#testing)
9. [Troubleshooting](#troubleshooting)

---

## Arsitektur

```
┌─────────────┐     ┌──────────────────┐     ┌─────────────┐
│   Kiosk UI   │────▶│  Refleksi API     │────▶│   Xendit     │
│  (QRIS only) │     │  (CodeIgniter 4)  │     │  Payment GW  │
└─────────────┘     └──────────────────┘     └─────────────┘
                           │                        │
                           ▼                        ▼
                    ┌──────────────┐         ┌──────────────┐
                    │   MySQL DB    │         │   Webhook     │
                    │  (donations)  │◀────────│   Callback    │
                    └──────────────┘         └──────────────┘
```

### Komponen

| Komponen | Deskripsi |
|----------|-----------|
| `PaymentService` | Service layer yang handle semua logika Xendit API |
| `Donasi` controller | Public endpoint untuk membuat donasi |
| `PaymentStatus` controller | Public endpoint untuk poll status pembayaran |
| `Payment` webhook | Handler untuk callback dari Xendit |
| `Donations` admin | Admin CRUD donasi + cancel payment |

---

## Metode Pembayaran

### 1. QRIS Dynamic (Online)

| Aspek | Detail |
|-------|--------|
| **Kapan digunakan** | Kiosk terkoneksi internet |
| **Xendit API** | QR Code V1 `type: DYNAMIC` |
| **Amount** | Di-embed di QR (user tidak input) |
| **Single/Multi use** | Sekali pakai → INACTIVE setelah paid |
| **Min/Max** | Rp 1,500 - Rp 10,000,000 |
| **Webhook** | `qr.payment` event |
| **Flow** | Generate real-time → user scan → bayar → selesai |

### 2. QRIS Static (Offline)

| Aspek | Detail |
|-------|--------|
| **Kapan digunakan** | Kiosk tanpa internet / cetak QR fisik |
| **Xendit API** | QR Code V1 `type: STATIC` |
| **Amount** | Tidak di-embed (user input sendiri) |
| **Single/Multi use** | Multi-use (selalu ACTIVE) |
| **Min/Max** | Tidak ada limit (user input) |
| **Webhook** | `qr.payment` event (banyak per QR) |
| **Flow** | Pre-generated → cetak/tampilkan → user scan kapan saja |
| **Limit** | 1 static QR per merchant (aturan Xendit/DANA) |

### 3. Virtual Account (Bank Transfer)

| Bank | Channel Code | Min | Max |
|------|-------------|-----|-----|
| BCA | `BCA_VIRTUAL_ACCOUNT` | Rp 10,000 | Rp 50,000,000 |
| BRI | `BRI_VIRTUAL_ACCOUNT` | Rp 10,000 | Rp 50,000,000 |
| BNI | `BNI_VIRTUAL_ACCOUNT` | Rp 10,000 | Rp 50,000,000 |
| Mandiri | `MANDIRI_VIRTUAL_ACCOUNT` | Rp 10,000 | Rp 50,000,000 |
| BSI | `BSI_VIRTUAL_ACCOUNT` | Rp 10,000 | Rp 50,000,000 |
| Permata | `PERMATA_VIRTUAL_ACCOUNT` | Rp 10,000 | Rp 50,000,000 |
| Muamalat | `MUAMALAT_VIRTUAL_ACCOUNT` | Rp 10,000 | Rp 50,000,000 |
| INA | `INA_VIRTUAL_ACCOUNT` | Rp 10,000 | Rp 50,000,000 |
| BJB | `BJB_VIRTUAL_ACCOUNT` | Rp 10,000 | Rp 50,000,000 |
| BNC | `BNC_VIRTUAL_ACCOUNT` | Rp 10,000 | Rp 50,000,000 |
| BSS | `BSS_VIRTUAL_ACCOUNT` | Rp 10,000 | Rp 50,000,000 |

---

## Flow Pembayaran

### Flow 1: QRIS Dynamic (Online Kiosk)

```
1. Kiosk: User pilih nominal donasi
2. Kiosk: POST /endpoint/public/donasi
          { amount: 50000, payment_method: "qris", mode: "online", session_id: 123 }
3. Backend:
   a. Insert donation ke DB (status: pending, qr_type: dynamic)
   b. Call Xendit: POST /qr_codes { type: DYNAMIC, amount: 50000 }
   c. Simpan qr_string, xendit_qr_id ke DB
   d. Return { reference, qr_string, amount, expires_at }
4. Kiosk: Render QR code dari qr_string
5. User: Scan QR dari e-wallet/banking app → bayar
6. Xendit: Kirim webhook POST /endpoint/webhook/payment
           { event: "qr.payment", status: "COMPLETED", amount: 50000 }
7. Backend: Update donation status → "paid"
8. Kiosk: Poll status GET /endpoint/public/donasi/:reference/status
          → { status: "paid" }
9. Kiosk: Tampilkan layar thank you
```

### Flow 2: QRIS Static (Offline)

```
1. Setup (sekali):
   a. Backend: Generate static QR via Xendit
              POST /qr_codes { type: STATIC, external_id: "STATIC_QR_TENANT_1" }
   b. Simpan xendit_qr_id, qr_string ke tabel xendit_static_qrs
   c. Cetak/tampilkan QR di kiosk atau lokasi fisik

2. Saat user mau bayar:
   a. User: Scan static QR dari e-wallet/banking app
   b. User: Input nominal donasi (misal Rp 50.000)
   c. User: Konfirmasi bayar

3. Backend:
   a. Xendit: Kirim webhook
              { event: "qr.payment", qr_code: { external_id: "STATIC_QR_TENANT_1" }, amount: 50000 }
   b. Backend: Create donation record dari webhook data
              { amount: 50000, status: paid, qr_type: static }
   c. Simpan ke DB

4. Admin: Lihat donasi masuk di dashboard
```

### Flow 3: Virtual Account (Bank Transfer)

```
1. User: Pilih nominal + bank (BCA, BRI, BNI, dll)
2. User: POST /endpoint/public/donasi
         { amount: 100000, payment_method: "va_bca", customer_name: "Budi" }
3. Backend:
   a. Insert donation ke DB (status: pending)
   b. Call Xendit: POST /payment_requests
                  { type: PAY, channel_code: "BCA_VIRTUAL_ACCOUNT",
                    request_amount: 100000 }
   c. Simpan va_number, xendit_payment_request_id ke DB
   d. Return { reference, va_number: "3816523906568", bank_name: "BCA", amount, expires_at }
4. User: Transfer ke VA number via ATM/mobile banking
5. Xendit: Kirim webhook
           { event: "payment.capture", status: "SUCCEEDED", reference_id: "DON-xxx" }
6. Backend: Update donation status → "paid"
```

---

## API Endpoints

### Public (Unauthenticated)

| Method | Endpoint | Deskripsi |
|--------|----------|-----------|
| `POST` | `/endpoint/public/donasi` | Buat donasi baru + initiate payment |
| `GET` | `/endpoint/public/donasi/:reference/status` | Poll status pembayaran |

### Webhook (Token-verified)

| Method | Endpoint | Deskripsi |
|--------|----------|-----------|
| `POST` | `/endpoint/webhook/payment` | Xendit callback handler |

### Admin (JWT-authenticated)

| Method | Endpoint | Deskripsi |
|--------|----------|-----------|
| `GET` | `/endpoint/admin/donations` | List donasi (dengan filter) |
| `GET` | `/endpoint/admin/donations/:id` | Detail donasi |
| `POST` | `/endpoint/admin/donations/:id/cancel` | Batalkan pembayaran |

---

## Request/Response Examples

### POST /endpoint/public/donasi

**Request (QRIS Dynamic):**
```json
{
  "amount": 50000,
  "payment_method": "qris",
  "mode": "online",
  "session_id": 123
}
```

**Response:**
```json
{
  "success": true,
  "message": "Donation created.",
  "data": {
    "id": 1,
    "reference": "DON-20260725-a1b2c3d4",
    "amount": 50000,
    "payment_method": "qris",
    "qr_type": "dynamic",
    "qr_string": "000201010212...",
    "qr_image": "data:image/png;base64,...",
    "status": "pending",
    "expires_at": "2026-07-27T11:59:59Z"
  }
}
```

**Request (QRIS Static / Offline):**
```json
{
  "amount": 50000,
  "payment_method": "qris",
  "mode": "offline",
  "session_id": 123
}
```

**Response:**
```json
{
  "success": true,
  "message": "Donation created. Scan QR and enter amount.",
  "data": {
    "id": 2,
    "reference": "DON-20260725-e5f6g7h8",
    "amount": 50000,
    "payment_method": "qris",
    "qr_type": "static",
    "qr_string": "000201010212...",
    "qr_image": "data:image/png;base64,...",
    "status": "pending",
    "note": "Scan QR dan masukkan nominal donasi"
  }
}
```

**Request (Virtual Account BCA):**
```json
{
  "amount": 100000,
  "payment_method": "va_bca",
  "customer_name": "Budi Santoso"
}
```

**Response:**
```json
{
  "success": true,
  "message": "Donation created.",
  "data": {
    "id": 3,
    "reference": "DON-20260725-i9j0k1l2",
    "amount": 100000,
    "payment_method": "va_bca",
    "bank_code": "BCA_VIRTUAL_ACCOUNT",
    "va_number": "3816523906568",
    "bank_name": "BCA",
    "status": "pending",
    "expires_at": "2026-07-26T11:59:59Z"
  }
}
```

### GET /endpoint/public/donasi/:reference/status

**Response:**
```json
{
  "success": true,
  "data": {
    "reference": "DON-20260725-a1b2c3d4",
    "status": "paid",
    "amount": 50000,
    "paid_at": "2026-07-25T10:30:00Z",
    "payment_method": "qris",
    "qr_type": "dynamic"
  }
}
```

---

## Database Schema

### Tabel: donations (updated)

| Kolom | Type | Notes |
|-------|------|-------|
| `id` | INT UNSIGNED PK | Auto increment |
| `session_id` | INT UNSIGNED | FK ke reflection_sessions |
| `amount` | DECIMAL(12,2) | Nominal donasi |
| `payment_method` | VARCHAR(50) | qris / va_bca / va_bri / dll |
| `reference` | VARCHAR(100) UNIQUE | DON-YYYYMMDD-xxxxxxx |
| `qr_data` | TEXT | Legacy (deprecated, gunakan qr_string) |
| `status` | VARCHAR(20) | pending / paid / expired / failed / refunded |
| `provider_ref` | VARCHAR(255) | Legacy |
| `paid_at` | DATETIME | Waktu pembayaran berhasil |
| `created_at` | DATETIME | |
| `updated_at` | DATETIME | |
| **Kolom baru:** | | |
| `xendit_qr_id` | VARCHAR(100) | ID dari Xendit QR (qr-xxx) |
| `xendit_external_id` | VARCHAR(100) | external_id untuk Xendit |
| `xendit_payment_request_id` | VARCHAR(100) | ID payment request (VA) |
| `qr_type` | ENUM('dynamic','static') | Tipe QR IS |
| `channel_code` | VARCHAR(50) | QRIS / BCA_VIRTUAL_ACCOUNT / dll |
| `va_number` | VARCHAR(100) | Nomor VA (untuk bank transfer) |
| `bank_code` | VARCHAR(50) | BCA / BRI / BNI / dll |
| `payment_details` | JSON | Detail dari webhook |
| `expires_at` | DATETIME | Kapan QR/VA expired |
| `failure_code` | VARCHAR(100) | Kode error Xendit |

### Tabel baru: xendit_static_qrs

| Kolom | Type | Notes |
|-------|------|-------|
| `id` | INT UNSIGNED PK | Auto increment |
| `xendit_qr_id` | VARCHAR(100) | ID dari Xendit |
| `external_id` | VARCHAR(100) UNIQUE | Static QR identifier |
| `qr_string` | TEXT | QR string untuk render |
| `tenant_id` | INT UNSIGNED | FK ke tenants |
| `location_id` | INT UNSIGNED | FK ke locations |
| `status` | ENUM('active','inactive') | Status QR |
| `created_at` | DATETIME | |
| `updated_at` | DATETIME | |

---

## Konfigurasi

### .env

```ini
# Xendit Payment Gateway
xendit.apiKey = xnd_development_xxxxxxxxxxxxx
xendit.webhookToken = your_webhook_verification_token
xendit.environment = development
```

### Config/Xendit.php

```php
class Xendit {
    public string $apiKey = '';
    public string $webhookToken = '';
    public string $environment = 'development';
    public string $callbackUrl = '';
}
```

### Bank Code Mapping

| Internal | Xendit channel_code |
|----------|---------------------|
| `bca` | `BCA_VIRTUAL_ACCOUNT` |
| `bri` | `BRI_VIRTUAL_ACCOUNT` |
| `bni` | `BNI_VIRTUAL_ACCOUNT` |
| `mandiri` | `MANDIRI_VIRTUAL_ACCOUNT` |
| `bsi` | `BSI_VIRTUAL_ACCOUNT` |
| `permata` | `PERMATA_VIRTUAL_ACCOUNT` |
| `muamalat` | `MUAMALAT_VIRTUAL_ACCOUNT` |
| `ina` | `INA_VIRTUAL_ACCOUNT` |
| `bjb` | `BJB_VIRTUAL_ACCOUNT` |
| `bnc` | `BNC_VIRTUAL_ACCOUNT` |
| `bss` | `BSS_VIRTUAL_ACCOUNT` |

---

## Webhook Handling

### Xendit Webhook Events

| Event | Description | Handler |
|-------|-------------|---------|
| `qr.payment` | QRIS payment completed | `PaymentService::handleQRWebhook()` |
| `payment.capture` | VA payment completed | `PaymentService::handlePaymentRequestWebhook()` |
| `payment.failure` | Payment failed | `PaymentService::handlePaymentRequestWebhook()` |

### Webhook Verification

```
Header: x-callback-token: <token>
→ Compare dengan xendit.webhookToken dari .env
```

### Deduplication

- Cek `payment_id` atau `qr_code.id` sudah diproses
- Xendit retry sampai 6x dengan exponential backoff
- Selalu return HTTP 200 SEGERA

---

## Testing

### Sandbox Mode

- Gunakan API key `xnd_development_...`
- Base URL: `https://api.xendit.co` (sama, beda key)
- Simulasi pembayaran: `POST /qr_codes/{external_id}/payments/simulate`

### Test Scenarios

| # | Scenario | Expected |
|---|----------|----------|
| 1 | Create QRIS dynamic donation | qr_string returned |
| 2 | Simulate QRIS payment | Webhook → status paid |
| 3 | Create QR static (first time) | QR created & stored |
| 4 | Reuse existing static QR | Same QR returned |
| 5 | Simulate static QR payment | Webhook → donation created |
| 6 | Create VA donation | va_number returned |
| 7 | Simulate VA payment | Webhook → status paid |
| 8 | Poll payment status | Correct status returned |
| 9 | Cancel pending payment | Status → canceled |
| 10 | Reject invalid webhook token | HTTP 401 |

---

## Troubleshooting

### Common Issues

| Issue | Cause | Solution |
|-------|-------|----------|
| `DUPLICATE_ERROR` | reference_id sudah ada | Generate reference baru |
| `API_VALIDATION_ERROR` | Field wajib kosong | Cek request body |
| Webhook tidak masuk | URL salah / token salah | Cek callback URL di dashboard |
| QR tidak bisa scan | Key production belum aktif | Hubungi Xendit support |
| VA expired | Melewati expires_at | Buat payment request baru |

### Logs

- Application logs: `writable/logs/`
- Payment webhooks: `payment_webhooks` table
- Xendit dashboard: `https://dashboard.xendit.co/transactions`

---

## Changelog

### v1.0.0 (2026-07-25)

- Initial integration dengan Xendit
- Support QRIS Dynamic (online)
- Support QRIS Static (offline)
- Support Virtual Account (11 bank)
- Webhook handling dengan signature verification
- Payment status polling
- Admin cancel payment
