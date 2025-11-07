# UTS-text-mining
24.01.53.7009
Laporan Analisis Klasifikasi Biaya Medis (Expenses)
1. Deskripsi Dataset
Dataset ini berisi informasi demografis dan finansial terkait pemegang polis asuransi medis. Analisis ini bertujuan mengklasifikasikan apakah pengeluaran medis seseorang tergolong tinggi atau rendah.
2. Tujuan Analisis
Memprediksi kategori pengeluaran medis (High/Low) menggunakan model klasifikasi Random Forest.
3. Metodologi
Langkah-langkah yang dilakukan: pembersihan data, encoding fitur kategorikal, pembentukan label target berdasarkan median expenses, dan pelatihan model Random Forest.
4. Hasil Evaluasi
Akurasi Model: 0.9888
Laporan Klasifikasi:
              precision    recall  f1-score   support

        High       0.99      0.99      0.99       134
         Low       0.99      0.99      0.99       134

    accuracy                           0.99       268
   macro avg       0.99      0.99      0.99       268
weighted avg       0.99      0.99      0.99       268

5. Confusion Matrix
 
6. Feature Importances
premium: 0.6399
age: 0.2033
discount_eligibility_yes: 0.1283
bmi: 0.0159
children: 0.0064
7. Kesimpulan
Model Random Forest berhasil mengklasifikasikan biaya medis dengan akurasi tinggi. Faktor yang paling berpengaruh terhadap klasifikasi adalah kolom premium, usia, dan BMI. Namun, karena premium berkorelasi langsung dengan biaya, hasil ini perlu dievaluasi untuk menghindari data leakage.
