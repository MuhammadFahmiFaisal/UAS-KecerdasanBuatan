## Laporan Proyek Machine Learning - TB\_DEPRESI

### 1. Judul Proyek

**Prediksi Risiko Depresi pada Profesional Berdasarkan Faktor Gaya Hidup dan Tekanan Kerja Menggunakan Algoritma K-Nearest Neighbors (KNN)**

**Anggota Kelompok:**

* Leni Fitriani
* \[Nama anggota lainnya, jika ada]

---

### 2. Business Understanding

#### Problem Statements:

1. Bagaimana memanfaatkan data gaya hidup dan pekerjaan untuk memprediksi risiko depresi pada kalangan profesional?
2. Apa faktor dominan yang berkontribusi terhadap kondisi depresi berdasarkan data yang tersedia?
3. Bagaimana mengoptimalkan performa model prediksi depresi pada data yang tidak seimbang?

#### Goals:

* Mengembangkan model klasifikasi untuk mendeteksi risiko depresi menggunakan data profesional.
* Mengoptimalkan performa model melalui normalisasi dan penanganan data imbalance (SMOTE).
* Menyediakan sistem prediksi yang dapat membantu instansi atau profesional dalam skrining awal.

#### Solution Statement:

1. Melakukan eksplorasi dan analisis data (EDA).
2. Menangani data kategorik dan numerik melalui encoding dan normalisasi.
3. Menerapkan algoritma KNN dengan pencarian hyperparameter terbaik menggunakan GridSearchCV.
4. Mengevaluasi model menggunakan metrik klasifikasi.
5. Menangani ketidakseimbangan data dengan SMOTE.

---

### 3. Data Understanding

#### Dataset:

* Sumber: Kaggle - "Depression in Professional Dataset"
* Jumlah Data: 2054 baris, 11 kolom

#### Fitur:

| Kolom             | Tipe    | Deskripsi                                      |
| ----------------- | ------- | ---------------------------------------------- |
| Gender            | Object  | Jenis kelamin                                  |
| Age               | Integer | Usia responden                                 |
| Work Pressure     | Float   | Tekanan kerja (1-5)                            |
| Job Satisfaction  | Float   | Kepuasan kerja (1-5)                           |
| Sleep Duration    | Object  | Lama tidur (kategori)                          |
| Dietary Habits    | Object  | Pola makan                                     |
| Suicidal Thoughts | Object  | Pernahkah memiliki pikiran bunuh diri (Yes/No) |
| Work Hours        | Integer | Jam kerja per hari                             |
| Financial Stress  | Integer | Tingkat stres finansial (1-5)                  |
| Family History    | Object  | Riwayat mental dalam keluarga                  |
| Depression        | Object  | Target klasifikasi (Yes/No)                    |

#### Target:

* `Depression`: Ya (203), Tidak (1851) - kelas tidak seimbang.

---

### 4. Exploratory Data Analysis (EDA)

* **Distribusi Kategorikal**: Disajikan dalam bentuk bar chart untuk Gender, Sleep Duration, Dietary Habits, dll.
* **Distribusi Numerik**: Histogram dan boxplot untuk Age, Work Pressure, dll.
* **Korelasi Fitur**: Heatmap antar variabel numerik seperti Work Hours dan Financial Stress.
* **Class Imbalance**: Terlihat jelas ketidakseimbangan pada kelas target.

---

### 5. Data Preparation

* **Pembersihan Data**: Tidak ditemukan nilai kosong maupun data duplikat.
* **Encoding**: Label Encoding untuk semua kolom kategorik.
* **Normalisasi**: MinMaxScaler pada semua fitur numerik.
* **Split Data**: Train-test 80:20, stratify berdasarkan label.
* **SMOTE**: Digunakan untuk oversampling kelas minoritas (depresi).

---

### 6. Modeling

* **Algoritma**: K-Nearest Neighbors (KNN)
* **Alasan Pemilihan**:

  * Algoritma sederhana namun efektif untuk data dengan banyak fitur numerik.
  * Mudah diinterpretasi dan cocok untuk data kecil–menengah.
* **Tuning Hyperparameter**: GridSearchCV menemukan nilai `k = 4` terbaik.

```python
param_grid = {'n_neighbors': range(3, 20)}
grid = GridSearchCV(KNeighborsClassifier(), param_grid, cv=5)
grid.fit(X_train_sm, y_train_sm)
```

---

### 7. Evaluation

* **Confusion Matrix:**

```
Predicted  No   Yes
Actual
No         337   33
Yes         9    32
```

* **Classification Report:**

```
              precision    recall  f1-score   support
           0       0.97      0.91      0.94       370
           1       0.48      0.78      0.60        41

    accuracy                           0.90       411
   macro avg       0.73      0.84      0.77       411
weighted avg       0.93      0.90      0.91       411
```

* **AUC-ROC**: 0.89
* **Interpretasi**:

  * Model sangat baik dalam mengenali kelas mayoritas (No).
  * Cukup baik dalam mengenali kelas minoritas setelah SMOTE.

---

### 8. Kesimpulan dan Rekomendasi

* **Pencapaian**:

  * Model berhasil dibangun dengan akurasi 90%.
  * Teknik SMOTE efektif mengatasi class imbalance.

* **Kelebihan**:

  * Proses sederhana dan efisien.
  * Visualisasi EDA yang informatif.

* **Keterbatasan**:

  * Kinerja masih rendah pada kelas minoritas (Depresi).
  * Sensitivitas model terhadap noise dan outlier.

* **Rekomendasi**:

  * Gunakan lebih banyak fitur atau dataset.
  * Coba model alternatif seperti Random Forest atau XGBoost.
  * Terapkan ensemble learning.

---

### 9. Referensi (APA Style)

1. Zhang, Y., & Zheng, L. (2021). Machine learning for mental health prediction: A systematic review. *Computers in Human Behavior*, 115, 106651.
2. Choudhury, M. D., et al. (2013). Predicting Depression via Social Media. *ICWSM*.
3. Han, J., Kamber, M., & Pei, J. (2012). *Data Mining: Concepts and Techniques* (3rd ed.). Elsevier.
4. Aggarwal, C. C. (2015). *Data Mining: The Textbook*. Springer.
5. Pedregosa, F., et al. (2011). Scikit-learn: Machine Learning in Python. *JMLR*, 12, 2825–2830.

---

### 10. Lampiran (Opsional)

* Dataset: Depression\_Professional\_Dataset.csv
* Notebook: TB\_DEPRESI.ipynb
* Visualisasi tambahan: Bar chart, Heatmap, ROC Curve, dll.
