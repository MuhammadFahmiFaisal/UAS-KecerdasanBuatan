 # UAS - Prediksi Tingkat Depresi Menggunakan K-Nearest Neighbors
## Anggota Kelompok

1. Muhammad Fahmi Faisal - 2306061  
2. Irham Sugriantha - 2306048  

---

## Tujuan Proyek
Proyek ini bertujuan untuk membangun model klasifikasi tingkat depresi berdasarkan data profesional, dengan menggunakan algoritma **K-Nearest Neighbors (KNN)**. Data diproses, divisualisasikan, dan dimodelkan dalam Google Colab menggunakan Python dan pustaka scikit-learn, seaborn, serta SHAP untuk interpretabilitas.

## 📊 Struktur Dataset

Berikut adalah struktur dataset yang digunakan dalam proyek prediksi tingkat depresi:

| No. | Kolom                                     | Non-Null Count | Tipe Data  | Deskripsi Singkat                                       |
|-----|-------------------------------------------|----------------|------------|----------------------------------------------------------|
| 0   | Gender                                    | 2054           | object     | Jenis kelamin responden (`Male`, `Female`)              |
| 1   | Age                                       | 2054           | int64      | Usia responden                                           |
| 2   | Work Pressure                             | 2054           | float64    | Tingkat tekanan kerja (skala 1–5)                        |
| 3   | Job Satisfaction                          | 2054           | float64    | Tingkat kepuasan kerja (skala 1–5)                       |
| 4   | Sleep Duration                            | 2054           | object     | Durasi tidur (`5-6 hours`, `7-8 hours`, dll.)            |
| 5   | Dietary Habits                            | 2054           | object     | Pola makan (`Healthy`, `Moderate`, `Unhealthy`)         |
| 6   | Have you ever had suicidal thoughts?      | 2054           | object     | Pernahkah memiliki pikiran bunuh diri? (`Yes` / `No`)   |
| 7   | Work Hours                                | 2054           | int64      | Jumlah jam kerja per hari                                |
| 8   | Financial Stress                          | 2054           | int64      | Tingkat stres finansial (skala 1–5)                      |
| 9   | Family History of Mental Illness          | 2054           | object     | Riwayat penyakit mental dalam keluarga (`Yes` / `No`)   |
| 10  | Depression                                | 2054           | object     | Label target (`Yes` = depresi, `No` = tidak)             |

📌 **Total entri**: 2054  
✅ **Tidak terdapat missing value**

## 🧰 Library yang Digunakan
- `pandas`, `numpy`
- `seaborn`, `matplotlib`
- `scikit-learn`
- `imblearn (SMOTE)`
- `shap` (interpretasi model)

## ⚙️ Langkah-langkah Pengerjaan

### 1. Import Library
Mengimpor seluruh pustaka Python yang diperlukan untuk proses pemodelan dan visualisasi.

### 2. Load Dataset
- Dataset dimuat dari Google Drive.
- Menampilkan dimensi dan 5 baris pertama dataset.

### 3. Eksplorasi Data
- Menampilkan informasi struktur dan statistik dataset (`data.info()`, `describe()`).
- Visualisasi distribusi fitur kategorikal dan numerik.
- Mengecek nilai kosong dan duplikat.

### 4. Visualisasi Data
- Bar chart untuk fitur kategorikal.
- Histogram dan boxplot untuk fitur numerik.
- Heatmap korelasi antar fitur numerik.

### 5. Pra-Pemrosesan Data
- **Encoding**: Label Encoding pada fitur kategorikal.
- **Normalisasi**: MinMaxScaler digunakan untuk skala fitur numerik.
- **Splitting**: Membagi data menjadi data latih dan uji (80:20).
- **SMOTE**: Menangani ketidakseimbangan data dengan oversampling.

### 6. Model KNN + GridSearchCV
- Model KNN dilatih dengan pencarian parameter `k` terbaik menggunakan GridSearchCV.
- Parameter terbaik yang diperoleh: `n_neighbors = 4`.

### 7. Evaluasi Model
- Menggunakan `classification_report` dan `confusion_matrix`.
- Akurasi model: **90%**, recall depresi: **78%**.
- ROC Curve dan nilai AUC divisualisasikan.

### 8. Visualisasi Tambahan
- Korelasi semua fitur.
- Visualisasi Decision Tree sebagai referensi interpretasi struktur.
- PCA: Reduksi dimensi untuk visualisasi data dalam 2D.
- SHAP: Menampilkan pentingnya fitur dalam model.

### 9. Pairplot
- Visualisasi hubungan antar fitur numerik berdasarkan label depresi.

## Kesimpulan & Rekomendasi

### Keberhasilan
- Akurasi model **90%**
- **SMOTE** efektif dalam menangani ketidakseimbangan
- Visualisasi dan interpretasi model lengkap

### Keterbatasan
- **Recall** pada kelas minoritas masih rendah meski sudah ditangani SMOTE
- KNN sensitif terhadap outlier dan noise
- Ukuran dataset masih terbatas

### Rekomendasi
- Tambahkan lebih banyak fitur (psikologi, sosial, dsb)
- Gunakan algoritma lain: Random Forest, XGBoost
- Coba ensemble learning atau stacking
- Lakukan evaluasi lanjutan dengan data real-world

