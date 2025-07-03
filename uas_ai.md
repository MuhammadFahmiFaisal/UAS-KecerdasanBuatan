# Laporan Proyek Machine Learning - Prediksi Tingkat Depresi

## 1. Judul Proyek

**Prediksi Risiko Depresi pada Profesional Berdasarkan Faktor Gaya Hidup dan Tekanan Kerja Menggunakan Algoritma K-Nearest Neighbors (KNN)**

## Anggota Kelompok

1. Muhammad Fahmi Faisal - 2306061  
2. Irham Sugriantha - 2306048  

---

## 2. Business Understanding

### Permasalahan Dunia Nyata
Depresi merupakan gangguan mental yang memengaruhi jutaan orang di seluruh dunia. Menurut Organisasi Kesehatan Dunia (WHO), lebih dari 280 juta orang mengalami depresi secara global, dan kasus ini meningkat tiap tahunnya (World Health Organization, 2023). Depresi tidak hanya berdampak pada kesehatan individu, tetapi juga menurunkan produktivitas kerja dan sering tidak terdeteksi secara dini, terutama di kalangan profesional (Astuti & Mahmudah, 2022).

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
- **Deteksi Dini dan Cepat** – Kecerdasan buatan dapat mendeteksi gejala depresi secara dini berdasarkan pola data perilaku dan gaya hidup (Syafitri & Risnandar, 2020).
- **Pengambilan Keputusan Berbasis Data** – Model prediksi memberikan informasi tambahan bagi profesional kesehatan mental untuk pengambilan keputusan lebih baik.
- **Skalabilitas dan Efisiensi** – Sistem ini dapat digunakan untuk skrining massal di tempat kerja atau pendidikan secara efisien dan berbiaya rendah.
- **Peningkatan Kesadaran dan Pencegahan** – Dengan mengetahui faktor risiko yang relevan, organisasi dapat menyusun program pencegahan yang lebih terarah.

---

## 3. Data Understanding

### Sumber Dataset
Dataset yang digunakan dalam proyek ini diperoleh dari platform Kaggle, sebuah situs berbagi data dan kompetisi machine learning yang banyak digunakan secara global. Dataset ini berjudul “Depression Professional Dataset”, dan dapat diakses melalui tautan berikut: https://www.kaggle.com/datasets/ikynahidwin/depression-professional-dataset. Dataset ini dikembangkan untuk mendeteksi tingkat depresi individu berdasarkan berbagai faktor psikososial dan gaya hidup. 

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

Karena nilai target merupakan label biner, maka pendekatan klasifikasi biner seperti K-Nearest Neighbors (KNN) sangat sesuai dalam proyek ini.

---

## 4. Exploratory Data Analysis (EDA)

### Visualisasi Distribusi Data
Langkah awal dalam proses EDA adalah menganalisis distribusi data untuk memahami sebaran nilai dari masing-masing fitur. Distribusi fitur numerik seperti usia, tekanan kerja, kepuasan kerja, jam kerja, dan stres finansial divisualisasikan menggunakan histogram dan boxplot, sementara fitur kategorikal divisualisasikan dalam bentuk bar chart.

![image](https://github.com/user-attachments/assets/0b7c395d-9901-49f6-89df-4561cb8b878e)
*Gambar 1 : Visualisasi Distribusi Fitur Numerik*

![image](https://github.com/user-attachments/assets/7df73193-2188-4f46-b9ef-173c0608cee7)
*Gambar 2 : Visualisasi Distribusi Fitur Kategorikal*

Visualisasi seperti histogram dan bar chart sangat penting dalam memahami skala dan frekuensi masing-masing fitur serta mendeteksi outlier (Waskom, 2021).

### Analisis korelasi antar fitur
Untuk mengetahui hubungan antara fitur numerik, digunakan visualisasi heatmap korelasi Pearson.

![image](https://github.com/user-attachments/assets/fa41dc97-721b-4aa9-9656-5b172ba43a3d)
*Gambar 3 : Korelasi Antar Fitur Numerik*

Hasil menunjukkan:
- Korelasi positif sedang antara stres finansial dan tekanan kerja.
- Korelasi negatif lemah antara jam kerja dan kepuasan kerja.

Selain itu, digunakan boxplot untuk melihat distribusi dan pola hubungan antar pasangan fitur numerik. Ini membantu mengidentifikasi fitur yang memiliki potensi diskriminatif terhadap kelas target (depresi).

![image](https://github.com/user-attachments/assets/7221e2a0-ce46-41b5-a66b-ee8cb47143db)
*Gambar 4 : Boxplot Fitur Numerik*

Analisis korelasi penting untuk menyaring fitur yang redundan atau terlalu berkaitan, serta sebagai dasar pemilihan fitur dalam pemodelan (Kassambara, 2018).

### Deteksi data tidak seimbang 
Distribusi label target (Depression) menunjukkan ketidakseimbangan data :
- Tidak depresi: 1851 sampel (±90%)
- Depresi: 203 sampel (±10%)

Hal ini dikonfirmasi melalui visualisasi bar chart terhadap kolom Depression. Karena ini adalah kasus klasifikasi biner yang tidak seimbang, dilakukan penanganan menggunakan metode SMOTE (Synthetic Minority Over-sampling Technique) pada data latih untuk menyeimbangkan distribusi kelas.

![image](https://github.com/user-attachments/assets/7e758180-5d88-4c9c-8785-311417bb6040)
*Gambar 5 : Penanganan Data Tidak Seimbang (Imbalance)*

Metode SMOTE telah terbukti meningkatkan akurasi klasifikasi depresi dalam kondisi data tidak seimbang (Dewi & Wulandari, 2021).

### Insight awal dari pola data 
Berdasarkan eksplorasi awal, ditemukan beberapa temuan penting:
- Responden dengan durasi tidur kurang dari 6 jam dan tingkat stres keuangan tinggi memiliki kemungkinan lebih besar mengalami depresi.
- Responden yang pernah memiliki pikiran bunuh diri atau memiliki riwayat keluarga dengan gangguan mental lebih sering diklasifikasikan sebagai depresi.
- Fitur tekanan kerja, jam kerja berlebih, dan kepuasan kerja rendah juga tampak menjadi indikator awal potensi depresi.

---

## 5. Data Preparation

### Pembersihan data (null value, duplikasi) 
Tahap pertama dalam persiapan data adalah melakukan pemeriksaan terhadap data yang hilang (missing values) dan duplikat. Berdasarkan hasil eksplorasi:
- Tidak ditemukan nilai kosong pada seluruh 11 fitur.
- Tidak terdapat data duplikat berdasarkan pengecekan data.duplicated().sum() yang menghasilkan nilai 0.

Hal ini menunjukkan bahwa dataset dalam kondisi bersih dan siap digunakan untuk proses selanjutnya.

### Encoding data kategorik
Dataset ini mengandung sejumlah fitur kategorikal yang perlu dikonversi ke bentuk numerik agar dapat diproses oleh algoritma machine learning. Dalam proyek ini digunakan teknik Label Encoding dari pustaka scikit-learn, yang mengubah setiap kategori menjadi angka integer:

Fitur yang dikodekan:
- Gender
- Sleep Duration
- Dietary Habits
- Have you ever had suicidal thoughts?
- Family History of Mental Illness
- Depression (sebagai target klasifikasi)

Label encoding dipilih karena seluruh fitur kategorikal memiliki jumlah kategori terbatas dan tidak bersifat ordinal kompleks.

### Normalisasi / standardisasi data numerik
Untuk menghindari bias skala antar fitur numerik, dilakukan proses normalisasi menggunakan metode Min-Max Scaling. Proses ini mengubah nilai fitur menjadi rentang [0, 1] agar model KNN yang berbasis jarak tidak mendistorsi hasil karena perbedaan skala antar fitur.

Fitur yang dinormalisasi:
- Age
- Work Pressure
- Job Satisfaction
- Work Hours
- Financial Stress

### Split data (train-test) 
Setelah proses pembersihan dan transformasi, data dibagi menjadi data latih (train) dan data uji (test) dengan perbandingan 80:20, menggunakan fungsi train_test_split dari scikit-learn. Pembagian dilakukan dengan parameter stratify=y untuk memastikan proporsi kelas (depresi/tidak depresi) tetap seimbang pada kedua subset. 

```python
X_train, X_test, y_train, y_test = train_test_split(X_scaled, y, test_size=0.2, stratify=y, random_state=42)
```
---

## 6. Modeling

### Pemilihan algoritma 
Dalam proyek ini digunakan algoritma K-Nearest Neighbors (KNN) sebagai model utama untuk klasifikasi tingkat depresi. Selain itu, juga dilakukan eksplorasi visualisasi menggunakan model Decision Tree untuk memahami logika pengambilan keputusan model.

### Alasan Pemilihan KNN:
- **Sederhana namun efektif** KNN merupakan algoritma non-parametrik yang populer dan efektif dalam klasifikasi gangguan mental (Astuti & Mahmudah, 2022).
- **Cocok untuk data dengan skala terbatas** Dataset yang digunakan memiliki jumlah fitur dan sampel yang masih terkelola, sehingga performa KNN tetap optimal tanpa beban komputasi tinggi.
- **Interpretabilitas** Model KNN memungkinkan pelacakan keputusan berdasarkan tetangga terdekat, sehingga dapat dijelaskan kepada pengguna non-teknis.

Selain itu, digunakan GridSearchCV untuk memilih nilai k terbaik berdasarkan validasi silang.

### Implementasi Model
```python

# Hyperparameter tuning untuk nilai k
param_grid = {'n_neighbors': range(3, 20)}
grid = GridSearchCV(KNeighborsClassifier(), param_grid, cv=5)
grid.fit(X_train_sm, y_train_sm)

print("Best K:", grid.best_params_)  # Output contoh: {'n_neighbors': 4}

# Evaluasi model
from sklearn.metrics import classification_report

y_pred = grid.predict(X_test)
print(classification_report(y_test, y_pred))

```

### Visualisasi Model
Untuk meningkatkan interpretabilitas, proyek ini juga menyertakan visualisasi Decision Tree sederhana yang dilatih pada data yang sama. Decision Tree adalah salah satu metode populer untuk visualisasi logika klasifikasi dalam deteksi gejala depresi (Hidayat & Afifuddin, 2022). Walaupun bukan model utama, visualisasi ini membantu memahami logika fitur dalam menentukan prediksi depresi.

![image](https://github.com/user-attachments/assets/2241daf4-0b86-4655-9aba-d36a942c7f68)
*Gambar 6 : Visualisasi Decision Tree)*

---

## 7. Evaluation

### Confusion Matrix 
Evaluasi model dimulai dengan membangun confusion matrix, yang menampilkan perbandingan prediksi model terhadap label aktual pada data uji. Berikut adalah hasil visualisasi confusion matrix :

![Confusion Matrix](https://github.com/user-attachments/assets/805e0a6b-8b5f-456f-9d60-702106ce2a43)
*Gambar 7 : Confusion Matrix*

### Metrik evaluasi
Hasil evaluasi model KNN terhadap data uji :
```
              precision    recall  f1-score   support
           0       0.97      0.91      0.94       370
           1       0.48      0.78      0.60        41

    accuracy                           0.90       411
   macro avg       0.73      0.84      0.77       411
weighted avg       0.93      0.90      0.91       411
```
**Penjelasan metrik:**
- Accuracy: 90% — model secara keseluruhan memprediksi dengan benar pada 90% kasus.
- Precision (kelas 1/depresi): 48% — dari semua prediksi "depresi", hanya 48% yang benar-benar depresi.
- Recall (kelas 1/depresi): 78% — dari semua orang yang benar-benar depresi, 78% berhasil dikenali oleh model.
- F1-Score (kelas 1/depresi): 60% — harmonisasi antara precision dan recall.

### Penjelasan Kinerja Model
Model KNN menunjukkan akurasi tinggi dalam mengklasifikasikan data secara umum, terutama pada kelas mayoritas (tidak depresi). Namun, performa pada kelas minoritas (depresi) lebih menantang. Hal ini tercermin dari:
- Precision yang rendah (banyak false positives).
- Recall yang relatif tinggi (banyak kasus depresi berhasil dideteksi).
- F1-score yang moderat (menyeimbangkan precision dan recall).
Ini menunjukkan bahwa model cenderung lebih baik dalam mendeteksi kasus depresi daripada mencegah false alarm, yang sebenarnya sesuai untuk konteks medis di mana false negative (gagal deteksi) lebih berisiko daripada false positive.

---

## 8. Kesimpulan & Rekomendasi

### Ringkasan Hasil Modeling dan Evaluasi
Proyek ini telah berhasil membangun model prediksi tingkat depresi berdasarkan data psikososial dan gaya hidup, menggunakan algoritma K-Nearest Neighbors (KNN) sebagai metode utama. Hasil evaluasi menunjukkan bahwa model mencapai akurasi 90%, dengan recall sebesar 78% untuk kelas "depresi", yang menunjukkan kemampuan cukup baik dalam mendeteksi individu yang berisiko mengalami depresi.

Visualisasi melalui confusion matrix dan metrik evaluasi lainnya menunjukkan bahwa model cenderung sensitif terhadap kasus depresi, meskipun precision masih dapat ditingkatkan.

### Apakah tujuan proyek tercapai? 
Tujuan utama dari proyek ini adalah memprediksi risiko depresi secara dini dengan menggunakan pendekatan kecerdasan buatan berdasarkan faktor-faktor personal dan sosial. Berdasarkan hasil evaluasi:

- ✅ Model mampu mengenali pola dari individu yang berisiko tinggi terhadap depresi.
- ✅ Sistem berhasil dibangun dan diimplementasikan secara lengkap dari preprocessing hingga evaluasi.

Dengan demikian, tujuan proyek dinyatakan tercapai, terutama dari sisi kemampuan deteksi dan potensi penerapan dalam konteks organisasi kerja, kampus, atau komunitas kesehatan mental.

### Kelebihan dan keterbatasan model
✅ Kelebihan:
- Menggunakan fitur-fitur relevan yang didukung literatur psikologis dan klinis.
- Hasil recall tinggi pada kelas minoritas (depresi) — penting untuk deteksi dini.
- Implementasi sederhana dan dapat diulang dengan dataset serupa.

⚠️ Keterbatasan:
- Precision untuk kelas "depresi" masih rendah (48%), menunjukkan banyak false positive.
- Dataset tidak terlalu besar dan seimbang, meskipun telah ditangani dengan SMOTE.
- Fitur yang digunakan belum mencakup dimensi lain seperti tingkat aktivitas fisik, kondisi medis, atau dukungan sosial secara langsung.

### Rekomendasi perbaikan
Untuk meningkatkan kinerja dan validitas model, berikut adalah beberapa rekomendasi ke depan : 
- **Perluasan Dataset** Gunakan data dengan jumlah sampel yang lebih besar dan representatif secara demografis agar model lebih generalisasi.
- **Eksplorasi Algoritma Lain** Uji algoritma lain seperti Random Forest, Support Vector Machine (SVM), atau XGBoost untuk membandingkan performa.
- **Penambahan Fitur** Sertakan fitur tambahan seperti riwayat penyakit, skor kecemasan, gaya hidup (merokok/olahraga), dan dukungan sosial.
- **Optimasi Handling Imbalance** Selain SMOTE, eksplorasi teknik lain seperti ADASYN atau ensemble sampling.
- **Model Interpretability** Gunakan metode interpretasi seperti SHAP secara lebih dalam agar hasil lebih transparan dan dapat dipercaya pengguna.

---

## 9. Referensi
Astuti, P. Y., & Mahmudah, F. N. (2022). Penerapan Metode K-Nearest Neighbor (KNN) Untuk Klasifikasi Tingkat Depresi Mahasiswa. Jurnal Ilmiah Informatika Komputer, 27(1), 54–60. https://doi.org/10.35760/ik.2022.v27i1.3793

Putra, I. P., & Krisnandi, P. (2021). Analisis Prediksi Gangguan Kesehatan Mental Menggunakan Data Mining. Jurnal RESTI (Rekayasa Sistem dan Teknologi Informasi), 5(1), 102–108. https://doi.org/10.29207/resti.v5i1.2802

Syafitri, R., & Risnandar, A. (2020). Deteksi Dini Gejala Depresi Menggunakan Metode Machine Learning. Jurnal Teknologi dan Sistem Komputer, 8(4), 257–262. https://doi.org/10.14710/jtsiskom.8.4.2020.257-262

Hidayat, R., & Afifuddin, M. (2022). Prediksi Gangguan Depresi Menggunakan Metode Decision Tree dan Naïve Bayes. Jurnal Teknologi dan Informatika, 4(2), 112–120. https://ejurnal.mercubuana-yogya.ac.id/index.php/technoinformatika/article/view/2645

Dewi, L. A., & Wulandari, F. (2021). Penanganan Data Tidak Seimbang Menggunakan SMOTE untuk Klasifikasi Depresi. Jurnal Mantik, 5(2), 677–683. https://iocscience.org/ejournal/index.php/mantik/article/view/1234


### Ringkasan Hasil Modeling dan Evaluasi

### Rekomendasi perbaikan
Untuk meningkatkan kinerja dan validitas model, berikut adalah beberapa rekomendasi ke depan : 
- **Perluasan Dataset** Gunakan data dengan jumlah sampel yang lebih besar dan representatif secara demografis agar model lebih generalisasi.
- **Eksplorasi Algoritma Lain** Uji algoritma lain seperti Random Forest, Support Vector Machine (SVM), atau XGBoost untuk membandingkan performa.
- **Penambahan Fitur** Sertakan fitur tambahan seperti riwayat penyakit, skor kecemasan, gaya hidup (merokok/olahraga), dan dukungan sosial.
- **Optimasi Handling Imbalance** Selain SMOTE, eksplorasi teknik lain seperti ADASYN atau ensemble sampling.
- **Model Interpretability** Gunakan metode interpretasi seperti SHAP secara lebih dalam agar hasil lebih transparan dan dapat dipercaya pengguna.

---

## 10. Lampiran

### Dataset

### Visualisasi Tambahan
**1. PCA (Principal Component Analysis)**
![image](https://github.com/user-attachments/assets/16d8efff-a0f9-4935-a8e9-51bbaf8f5eb7)
*Gambar 8 : Visualisasi PCA*

Visualisasi ini mengubah data berdimensi tinggi menjadi dua dimensi utama agar dapat divisualisasikan secara grafis. PCA membantu melihat apakah kelas target (Depression) memiliki pemisahan visual yang jelas.
- Titik-titik berwarna menunjukkan label depresi (0 = tidak, 1 = depresi).
- Tidak ada pemisahan yang sangat jelas, namun terdapat kecenderungan beberapa kelompok data membentuk klaster.


**2. SHAP Summary Plot (Interpretabilitas Model)**
![image](https://github.com/user-attachments/assets/18c01976-11ac-466f-9e24-f4ee4afe197e)
*Gambar 9 : Visualisasi SHAP*

Visualisasi ini menunjukkan kontribusi masing-masing fitur terhadap prediksi model menggunakan metode SHAP (SHapley Additive exPlanations).
- Sumbu vertikal : fitur-fitur input.
- Warna : nilai fitur (merah = tinggi, biru = rendah).
- Posisi horizontal : seberapa besar pengaruh fitur tersebut pada probabilitas prediksi depresi.
- Fitur seperti Financial Stress, Job Satisfaction, Work Pressure berkontribusi signifikan dalam keputusan model — fitur ini banyak mempengaruhi output prediksi.

**3. Pairplot Antar Fitur Numerik Berdasarkan Label Depresi**
![image](https://github.com/user-attachments/assets/e1cac945-851f-40b7-a0b4-aa6171ee7184)
*Gambar 10 : Visualisasi Pairplot Antar Fitur*

Visualisasi ini menunjukkan hubungan antar fitur numerik, dibedakan berdasarkan label Depression.
- Digunakan untuk mendeteksi klaster atau korelasi visual antara kombinasi dua fitur.
- Misalnya, individu dengan stres finansial tinggi dan kepuasan kerja rendah lebih sering berada di area label Depression = 1.
---
