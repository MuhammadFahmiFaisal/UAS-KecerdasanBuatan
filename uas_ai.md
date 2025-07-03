# Laporan Proyek Machine Learning - Prediksi Tingkat Depresi

## 1. Judul Proyek

**Prediksi Risiko Depresi pada Profesional Berdasarkan Faktor Gaya Hidup dan Tekanan Kerja Menggunakan Algoritma K-Nearest Neighbors (KNN)**

## Anggota Kelompok

1. Muhammad Fahmi Faisal - 2306061  
2. Irham Sugriantha - 2306048  

---

## 2. Business Understanding

### Permasalahan Dunia Nyata
Depresi merupakan gangguan mental yang memengaruhi jutaan orang di seluruh dunia. Menurut Organisasi Kesehatan Dunia (WHO), lebih dari 280 juta orang mengalami depresi secara global, dan kasus ini meningkat tiap tahunnya (World Health Organization, 2023). Depresi tidak hanya berdampak pada kesehatan individu, tetapi juga menurunkan produktivitas kerja dan meningkatkan risiko penyakit kronis lainnya. Sayangnya, banyak kasus depresi yang tidak terdeteksi sejak dini, terutama di lingkungan kerja yang menuntut tekanan tinggi dan jam kerja panjang (Harvey et al., 2017).

### Tujuan Proyek
Tujuan utama dari proyek ini adalah membangun model kecerdasan buatan berbasis algoritma K-Nearest Neighbors (KNN) untuk memprediksi risiko depresi berdasarkan faktor-faktor seperti tekanan kerja, kepuasan kerja, durasi tidur, kebiasaan makan, stres finansial, serta riwayat keluarga terkait kesehatan mental. Dengan deteksi dini, diharapkan organisasi atau institusi dapat memberikan intervensi tepat waktu.

### Pengguna Sistem
Pengguna sistem ini terdiri dari:
- Divisi HRD pada perusahaan yang ingin mengelola kesehatan mental karyawan secara proaktif.
- Psikolog atau konselor yang memerlukan alat bantu diagnostik awal.
- Instansi pendidikan atau organisasi sosial yang fokus pada kesehatan mental.
- Peneliti yang ingin melakukan analisis lebih lanjut berdasarkan data gejala psikologis.

### Manfaat Implementasi AI
Penerapan model kecerdasan buatan dalam mendeteksi depresi memberikan sejumlah manfaat nyata :
- **Deteksi Dini dan Cepat** – AI mampu mengolah ribuan data dengan cepat untuk menghasilkan prediksi depresi, bahkan sebelum individu menyadari gejala mereka (Shatte et al., 2019).
- **Pengambilan Keputusan Berbasis Data** – Model prediksi memberikan informasi tambahan bagi profesional kesehatan mental untuk pengambilan keputusan lebih baik.
- **Skalabilitas dan Efisiensi** – Sistem ini dapat digunakan untuk skrining massal di tempat kerja atau pendidikan secara efisien dan berbiaya rendah.
- **Peningkatan Kesadaran dan Pencegahan** – Dengan mengetahui faktor risiko yang relevan, organisasi dapat menyusun program pencegahan yang lebih terarah.

---

## 3. Data Understanding

### Sumber Dataset
Dataset yang digunakan dalam proyek ini diperoleh dari platform Kaggle, sebuah situs berbagi data dan kompetisi machine learning yang banyak digunakan secara global. Dataset ini berjudul “Depression Professional Dataset”, dan dapat diakses melalui tautan berikut: https://www.kaggle.com/datasets/ikynahidwin/depression-professional-dataset. Dataset ini dikembangkan untuk mendeteksi tingkat depresi individu berdasarkan berbagai faktor psikososial dan gaya hidup. Platform seperti Kaggle telah banyak digunakan untuk mengakses dataset open source berkualitas tinggi dalam pengembangan sistem berbasis kecerdasan buatan (Sirsat et al., 2020).

### Deskripsi Setiap Fitur

| Fitur                          | Tipe     | Deskripsi |
|-------------------------------|----------|-----------|
| Gender                        | Object   | Jenis kelamin responden (Male/Female). |
| Age                           | Integer  | Usia responden dalam tahun |
| Work Pressure                 | Float    | Tingkat tekanan pekerjaan (1: rendah – 5: tinggi). |
| Job Satisfaction              | Float    | Tingkat kepuasan kerja (1: sangat tidak puas – 5: sangat puas). |
| Sleep Duration                | Object   | Durasi tidur harian (misal: 5-6 hours, 7-8 hours). |
| Dietary Habits               | Object   | Pola makan responden (Unhealthy, Moderate, Healthy). |
| Suicidal Thoughts             | Object   | Pikiran bunuh diri (Yes/No) |
| Work Hours                    | Integer  | Jam kerja per hari |
| Financial Stress              | Integer  | Stres finansial (1–5) |
| Family History                | Object   | Riwayat mental dalam keluarga |
| Depression                    | Object   | Label target, yaitu apakah responden mengalami depresi (Yes/No). |

Atribut-atribut ini mencerminkan elemen penting dari dimensi psikologis dan kondisi sosial-ekonomi yang sering kali dikaitkan dengan gangguan depresi, sebagaimana dijelaskan dalam literatur psikologi kesehatan (American Psychiatric Association, 2022).


### Ukuran dan Format Data
Dataset memiliki total 2054 entri (baris) dan 11 kolom fitur. Format file adalah CSV (Comma Separated Values), yang mudah diproses oleh perangkat lunak analisis data seperti Python, R, atau Excel.

### Tipe Data dan Target Klasifikasi
Tipe data pada dataset terdiri dari:

- **Numerik**, : Age, Work Pressure, Job Satisfaction, Work Hours, Financial Stress
- **Kategorikal** : Gender, Sleep Duration, Dietary Habits, Have you ever had suicidal thoughts?, Family History of Mental Illness

**Label Target (Output)** : Depression → Biner: 0 (Tidak depresi), 1 (Depresi)

Karena nilai target merupakan label biner, maka pendekatan klasifikasi biner seperti K-Nearest Neighbors (KNN) sangat sesuai dalam proyek ini (Dwyer et al., 2018).

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
