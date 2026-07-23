# FMCG Sales & Consumer Behavior Analysis

Proyek analisis data industri *Fast-Moving Consumer Goods* (FMCG) secara *end-to-end* yang berfokus pada evaluasi performa penjualan, analisis elastisitas harga, efektivitas kampanye musiman, serta penyusunan rekomendasi bisnis strategis untuk mengoptimalkan pendapatan (*revenue*) dan loyalitas pelanggan.

---

## 📌 Latar Belakang & Masalah Bisnis
Perusahaan FMCG menghadapi tantangan penjualan pada beberapa kategori produk yang mengalami stagnasi, efektivitas kampanye promosi yang belum optimal, adanya anomali produk bervolume tinggi namun bermargin rendah, serta ketimpangan sebaran distribusi penjualan antar wilayah geografis.

**Tujuan Utama Analisis & KPI:**
* **Financial KPIs:** Menilai kinerja *Total Revenue* (**Rp821 Juta**) dan *Total Profit* (**Rp318 Juta**).
* **Transaction KPIs:** Menganalisis *Total Orders* (**5.000 Transaksi**), *Total Quantity* (**27.358 Unit**), dan *Average Order Value / AOV* (**Rp164.314**).
* **Strategic Goals:** Meningkatkan efektivitas promosi, mendorong pertumbuhan di saluran *Modern Trade*, mengalokasikan distribusi wilayah secara presisi, serta mengunci loyalitas pelanggan kelompok *High Spender*.

---

## 🛠️ Metodologi & Alur Kerja Pipeline

Proyek ini menggunakan pendekatan *Data Warehouse & Pipeline Stack* 4 tahap:

1. **Data Storage Layer (`3_sql_analysis/`):**
   * Pengelolaan 3 tabel data mentah (*raw tables*): `campaign_dataset`, `product_dataset`, dan `sales_dataset` (`master_data_fmcg.sql`).
2. **Data Cleaning Layer (`3_sql_analysis/`):**
   * Pembuatan *Data View* `v_sales_clean` (`create_view_sales.sql`) untuk mengecek integritas *Primary Key* (`transaction_id`) serta standardisasi format tanggal `order_date` menjadi tipe `DATE`.
3. **Business Logic Layer (`3_sql_analysis/`):**
   * Menjalankan kueri tersimpan (*saved query*) `master_data_fmcg` yang menggabungkan `v_sales_clean` dengan `product_dataset` guna menghitung `calc_revenue` dan `total_profit` secara presisi di level transaksi tanpa bias agregasi.
4. **Ingestion, Analytics, & Visualization (`1_data/`, `2_python_processing/`, `4_dashboard_&_reports/`):**
   * Ekspor dataset final ke `master_data_final.xlsx`.
   * Analisis statistik & regresi di Jupyter Notebook (`Statistical_Analysis.ipynb`).
   * Visualisasi dasbor interaktif *Glassmorphism Style* di Power BI (`dashboard.pbix`).
   * Penyusunan laporan presentasi eksekutif (`FMCG Company Analysis.pdf`).

---

## 💡 Temuan Utama (*Key Findings*)

* **Uji Elastisitas Harga (Python Statistical Analysis):**
  * Hasil grafik regresi linear membuktikan bahwa produk FMCG bersifat **Inelastis Sempurna** terhadap harga (*flat trend* stabil di angka **5,4 unit** per transaksi pada rentang harga Rp10.000–Rp45.000). Konsumen tidak mengurangi kuantitas pembelian meskipun harga berada di segmen premium, memvalidasi bahwa daya beli didominasi oleh kelompok *High Spender*.
* **Tren Pendapatan & Musim Puncak (Revenue & Time Series):**
  * Penjualan bulanan berada pada kisaran stabil **Rp60 Juta – Rp70 Juta**, namun mengalami lonjakan *peak season* yang masif pada bulan **Maret (Rp76 Juta - Ramadan)** dan **Agustus (Rp75 Juta - Kemerdekaan)** akibat respon pasar yang sangat reaktif terhadap promosi musiman.
* **Kontribusi Kategori & Produk Unggulan:**
  * Kategori **Personal Care** memimpin volume penjualan sebesar **36%**, disusul **Home Care (33%)** dan **Food (31%)**.
  * Produk **Dove Variant 1 (Rp57 Juta)** dan **Dove Variant 2 (Rp53 Juta)** bertindak sebagai penyumbang profit terbesar bagi perusahaan.
* **Struktur Perilaku & Sebaran Wilayah:**
  * Pasar didorong secara dominan oleh segmen **High Spender** (**11.799 Unit**).
  * Sebaran omset masih terpusat kaku di **Pulau Jawa** (Jakarta, Bandung, Surabaya), sedangkan wilayah **Medan dan Makassar** masih berstatus *under-performing*.

---

## 🚀 Rekomendasi Strategis (*Actionable Business Recommendations*)

1. **Strategi Bundling Silang (*Cross-Category Bundling*):**
   * Menggabungkan katalog produk *Personal Care* bervolume tinggi (seperti *Dove Series*) dengan kategori *Home Essentials* via paket bundling diskon untuk mendongkrak nilai AOV di atas **Rp164.314**.
2. **Optimasi Kampanye Musiman (*Time-Gated Ad Spend*):**
   * Memfokuskan alokasi anggaran iklan (*ad-spend*) secara masif pada periode musiman **Maret (Ramadan)** dan **Agustus (Kemerdekaan)** untuk mengeksploitasi lonjakan daya beli musiman (*seasonal demand*).
3. **Penyelarasan Logistik & Distribusi Wilayah (*Geographic Supply Realignment*):**
   * Mengalihkan fokus ekspansi logistik dan distribusi dari Pulau Jawa ke wilayah berpotensi tinggi seperti **Medan dan Makassar**, khususnya pada kategori produk *Food*.
4. **Program Retensi Pelanggan (*High Spender Privilege Program*):**
   * Meluncurkan program loyalitas eksklusif di kanal *Modern Trade* khusus untuk kelompok **High Spender** (kontributor 11.799 Unit) guna mengunci basis pelanggan utama dari ancaman kompetitor.

---

## 📂 Struktur Repositori

```text
.
├── 1_data/
│   └── master_data_final.xlsx                                 # Dataset final hasil pembersihan & agregasi
│
├── 2_python_processing/
│   └── Statistical_Analysis.ipynb                             # Notebook analisis statistik, regresi & elastisitas harga
│
├── 3_sql_analysis/
│   ├── master_data_fmcg.sql                                   # Script DDL/DML & saved query logika bisnis
│   └── create_view_sales.sql                                  # Script SQL view v_sales_clean untuk pembersihan data
│
├── 4_dashboard_&_reports/
│   ├── dashboard.pbix                                         # Dasbor interaktif Power BI (Glassmorphism Style)
│   └── FMCG Company Analysis.pdf                              # Laporan presentasi eksekutif (PDF)
│
└── README.md                                                  # Dokumentasi utama repositori
