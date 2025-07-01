# UAS Kecerdasan Buatan - Prediksi Depresi

Repositori ini merupakan hasil dari proyek Ujian Akhir Semester (UAS) mata kuliah **Kecerdasan Buatan**. Proyek ini bertujuan untuk membangun model klasifikasi yang dapat memprediksi risiko depresi pada kalangan profesional berdasarkan berbagai faktor gaya hidup dan tekanan kerja.

## Struktur Folder

```
UAS-KecerdasanBuatan/
├── README.md               # Penjelasan umum proyek
├── uas_ai.md               # Laporan lengkap UAS (format markdown)
├── notebook_model.ipynb    # Notebook Jupyter dengan implementasi kode
└── data/
    ├── Depression_Professional_Dataset.csv   # Dataset asli
    └── jurnal/                               # Referensi jurnal ilmiah
```

## Deskripsi Proyek

- **Judul:** Prediksi Risiko Depresi pada Profesional Berdasarkan Faktor Gaya Hidup dan Tekanan Kerja Menggunakan Algoritma K-Nearest Neighbors (KNN)
- **Anggota Kelompok:** Leni Fitriani, [Nama lainnya]
- **Algoritma:** K-Nearest Neighbors (KNN)
- **Teknik Penanganan Imbalanced Data:** SMOTE (Synthetic Minority Oversampling Technique)
- **Metrik Evaluasi:** Accuracy, Precision, Recall, F1-Score, Confusion Matrix, ROC AUC

## Langkah-Langkah Proyek

1. **Business Understanding:** Merumuskan masalah dan tujuan proyek.
2. **Data Understanding:** Eksplorasi dataset, identifikasi fitur dan target.
3. **EDA (Exploratory Data Analysis):** Visualisasi dan insight awal dari data.
4. **Data Preparation:** Encoding, normalisasi, split data, dan SMOTE.
5. **Modeling:** Pelatihan model KNN dan tuning parameter dengan GridSearchCV.
6. **Evaluation:** Evaluasi model menggunakan confusion matrix dan metrik lainnya.
7. **Kesimpulan dan Rekomendasi:** Ringkasan hasil dan potensi pengembangan.

## Cara Menjalankan

1. Clone repositori:
```bash
git clone https://github.com/username/UAS-KecerdasanBuatan.git
cd UAS-KecerdasanBuatan
```

2. Buka file `notebook_model.ipynb` di Google Colab atau Jupyter Notebook.

3. Pastikan dataset berada di folder `data/`.

## Referensi

Referensi lengkap tersedia dalam file `uas_ai.md`, bagian Referensi (menggunakan gaya APA).

---

© 2025 Leni Fitriani. Untuk keperluan akademik UAS.
