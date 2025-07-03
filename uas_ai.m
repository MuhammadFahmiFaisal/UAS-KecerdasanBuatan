
# Laporan Proyek Machine Learning - Prediksi Tingkat Depresi

## 1. Judul Proyek

**Prediksi Risiko Depresi pada Profesional Berdasarkan Faktor Gaya Hidup dan Tekanan Kerja Menggunakan Algoritma K-Nearest Neighbors (KNN)**

## Anggota Kelompok

1. Muhammad Fahmi Faisal - 2306061  
2. Irham Sugriantha - 2306048  

---

## 2. Business Understanding

### Problem Statements
1. Bagaimana memanfaatkan data gaya hidup dan pekerjaan untuk memprediksi risiko depresi pada kalangan profesional?
2. Apa saja faktor dominan yang berkontribusi terhadap kondisi depresi berdasarkan data yang tersedia?
3. Bagaimana mengoptimalkan performa model prediksi depresi terhadap data tidak seimbang?

### Goals
- Membangun model klasifikasi untuk mendeteksi risiko depresi.
- Menerapkan teknik normalisasi dan penyeimbangan data (SMOTE).
- Menyediakan sistem prediksi yang dapat digunakan sebagai alat skrining awal.

### Solution Approach
- Eksplorasi dan analisis data (EDA).
- Encoding untuk fitur kategorikal, normalisasi untuk fitur numerik.
- Penggunaan KNN dengan hyperparameter tuning (GridSearchCV).
- Evaluasi dengan confusion matrix, classification report, ROC curve.
- Penggunaan SMOTE untuk menangani ketidakseimbangan data.

---

## 3. Data Understanding

### Dataset
- **Sumber**: [Kaggle - Depression Professional Dataset](https://www.kaggle.com/datasets/ikynahidwin/depression-professional-dataset)
- **Ukuran Data**: 2054 baris, 11 kolom

### Fitur

| Fitur                          | Tipe     | Deskripsi |
|-------------------------------|----------|-----------|
| Gender                        | Object   | Jenis kelamin |
| Age                           | Integer  | Usia responden |
| Work Pressure                 | Float    | Tekanan kerja (1–5) |
| Job Satisfaction              | Float    | Kepuasan kerja (1–5) |
| Sleep Duration                | Object   | Lama tidur |
| Dietary Habits               | Object   | Pola makan |
| Suicidal Thoughts             | Object   | Pikiran bunuh diri (Yes/No) |
| Work Hours                    | Integer  | Jam kerja per hari |
| Financial Stress              | Integer  | Stres finansial (1–5) |
| Family History                | Object   | Riwayat mental dalam keluarga |
| Depression                    | Object   | Target: Ya / Tidak |

### Target
- `Depression`: 203 (Yes), 1851 (No) → **Kelas tidak seimbang**

---

## 4. Exploratory Data Analysis (EDA)

- **Distribusi Kategorikal**: Visualisasi bar chart (`Gender`, `Sleep Duration`, `Dietary Habits`, dll).
- **Distribusi Numerik**: Histogram & boxplot (`Age`, `Work Pressure`, dll).
- **Korelasi**: Heatmap antar fitur numerik (`Work Hours`, `Financial Stress`, dsb).
- **Keseimbangan Kelas**: Visualisasi distribusi sebelum & sesudah SMOTE.
- **Pairplot**: Hubungan antar fitur numerik terhadap kelas target.

---

## 5. Data Preparation

- Tidak ada **missing value** atau **duplikat**.
- **Label Encoding**: Fitur kategorikal dikonversi menjadi numerik.
- **Normalisasi**: MinMaxScaler untuk fitur numerik.
- **Split**: Train-test (80:20) dengan stratifikasi.
- **SMOTE**: Untuk oversampling data depresi (kelas minoritas).

---

## 6. Modeling

- **Algoritma**: K-Nearest Neighbors (KNN)
- **Tuning**: GridSearchCV → Best `k = 4`
- **Model Lain**: Decision Tree digunakan sebagai pembanding dan visualisasi pohon keputusan.
- **PCA**: Reduksi dimensi → Visualisasi data 2D
- **Interpretabilitas**: SHAP untuk menunjukkan fitur penting

---

## 7. Evaluation

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

---
