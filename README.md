
---

[![Deploy on Railway](https://railway.com/button.svg)](https://railway.com/deploy/qVOm00?referralCode=Dua68s&utm_medium=integration&utm_source=template&utm_campaign=generic)

# PocketBase Railway Template

Template deploy **PocketBase** ke **Railway** menggunakan Dockerfile dengan:

* ✅ Auto create superuser saat first deploy
* ✅ Persistent volume
* ✅ Production ready setup
* ✅ Support Railway dynamic `$PORT`

---

# 🚀 Deploy ke Railway

1. Fork / Clone repo ini
2. Push ke GitHub kamu
3. Masuk ke Railway
4. **New Project → Deploy from GitHub**
5. Pilih repo ini

---

# ⚙️ Setup Environment Variables

Masuk ke:

```
Service → Variables
```

Tambahkan:

```
ADMIN_EMAIL=admin@demo.demo
ADMIN_PASSWORD=demo12345
```

⚠️ Gunakan password kuat untuk production.

---

# 💾 Setup Persistent Volume (WAJIB)

Masuk ke:

```
Service → Settings → Volumes → Add Volume
```

Isi Mount Path:

```
/pb_data
```

Tanpa volume ini, database akan hilang setiap redeploy.

---

# 🌐 Akses Aplikasi

Setelah deploy berhasil, Railway akan memberikan URL seperti:

```
https://your-project.up.railway.app
```

---

# 🔐 Login Admin

Admin panel tersedia di:

```
https://your-project.up.railway.app/_/
```

Login menggunakan:

```
Email: ADMIN_EMAIL
Password: ADMIN_PASSWORD
```

(Values sesuai Environment Variables yang kamu set.)

---

# 🧠 Cara Kerja Auto Superuser

Saat container pertama kali jalan:

* Jika `/pb_data/data.db` belum ada
* Maka akan otomatis menjalankan:

```
pocketbase superuser upsert ADMIN_EMAIL ADMIN_PASSWORD
```

Setelah database dibuat, superuser tidak akan dibuat ulang.

---

# 🛠 Development Lokal (Opsional)

Untuk test lokal:

```bash
docker build -t pocketbase-railway .
docker run -p 8090:8090 \
  -e ADMIN_EMAIL=admin@demo.demo \
  -e ADMIN_PASSWORD=demo12345 \
  -v $(pwd)/pb_data:/pb_data \
  pocketbase-railway
```

Akses di:

```
http://localhost:8090/_/
```

---

# 🔒 Production Notes

Disarankan untuk:

* Gunakan password kuat
* Aktifkan backup (Railway Volume snapshot / external storage)
* Lock down public API rules di PocketBase
* Gunakan custom domain

---
