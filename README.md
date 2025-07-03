 # UAS - Prediksi Tingkat Depresi Menggunakan K-Nearest Neighbors
## Anggota Kelompok

1. Muhammad Fahmi Faisal - 2306061  
2. Irham Sugriantha - 2306048  

---

## Tujuan Proyek
Proyek ini bertujuan untuk membangun model klasifikasi tingkat depresi berdasarkan data profesional, dengan menggunakan algoritma **K-Nearest Neighbors (KNN)**. Data diproses, divisualisasikan, dan dimodelkan dalam Google Colab menggunakan Python dan pustaka scikit-learn, seaborn, serta SHAP untuk interpretabilitas.

## 🔍 Deskripsi Dataset
Dataset berisi 2054 entri dengan 11 fitur, meliputi:
- Gender
- Usia
- Tekanan Kerja
- Kepuasan Kerja
- Durasi Tidur
- Pola Makan
- Riwayat Pikiran Bunuh Diri
- Jam Kerja
- Stres Finansial
- Riwayat Kesehatan Mental Keluarga
- Label target: **Depression** (`Yes` / `No`)

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

## 📈 Hasil Evaluasi

### Confusion Matrix  
![Confusion Matrix](https://github.com/user-attachments/assets/805e0a6b-8b5f-456f-9d60-702106ce2a43)

### Classification Report
```
              precision    recall  f1-score   support
           0       0.97      0.91      0.94       370
           1       0.48      0.78      0.60        41

    accuracy                           0.90       411
   macro avg       0.73      0.84      0.77       411
weighted avg       0.93      0.90      0.91       411
```

### ROC Curve
- AUC: **0.89**  
- Interpretasi: Model sangat baik dalam membedakan kelas meski data tidak seimbang.

### Visual Tambahan
- Decision Tree Visualization  
- SHAP Feature Importance  
- PCA 2D Scatter Plot  

---

## 8. Kesimpulan & Rekomendasi

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

