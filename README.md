# SoalShiftSISOP20_modul1_C03

### SoalShiftSISOP20_modul1_C03:

Soal Shift Modul 1:
1. [Soal 1](#1-soal-1)

#### 1. Soal 1
##### Whits adalah seorang mahasiswa teknik informatika. Dia mendapatkan tugas praktikum untuk membuat laporan berdasarkan data yang ada pada file “Sample-Superstore.tsv”. Namun dia tidak dapat menyelesaikan tugas tersebut. Laporan yang diminta berupa :
##### a. Tentukan wilayah bagian (region) mana yang memiliki keuntungan (profit) paling sedikit
##### b. Tampilkan 2 negara bagian (state) yang memiliki keuntungan (profit) paling sedikit berdasarkan hasil poin a
##### c. Tampilkan 10 produk (product name) yang memiliki keuntungan (profit) paling sedikit berdasarkan 2 negara bagian (state) hasil poin b
##### Whits memohon kepada kalian yang sudah jago mengolah data untuk mengerjakan laporan tersebut.
##### *Gunakan Awk dan Command pendukung

File *Sample-Superstore.tsv* disimpan dalam `/home/irsyad`. File nya terdapat di `/home/irsyad/Sistem Operasi/Soal Modul 1/soal1` yang didalam teradapat file `jawabansoal1a`
Isi dari bash script `jawabansoal1a` :

soal 1a:
```sh
awk -F "\t" 'NR > 1 {a[$13]=a[$13]+$21} END {for(i in a) print i}' Sample-Superstore.tsv | sort -g | head -1
```
soal 1b:
```sh
awk -F "\t" '{if($13=="Central") a[$11]=a[$11]+$21} END {for(i in a) print i}' Sample-Superstore.tsv | sort -g | head -2
```
soal 1c:
```sh
awk -F "\t" '{if($13=="Central" || $13=="Central") a[$17]=a[$17]+$21} END {for(i in a) print i}' Sample-Superstore.tsv | sort -g | head -10
```
##### Penjelasan Soal 1a
+ ###### `awk -F "\t"` 
##### Artinya tab menjadi field separatornya
+ ###### `'NR > 1 {a[$13]=a[$13]+$21} END {for(i in a) print i}' Sample-Superstore.tsv | sort -g | head -1` 
##### Artinya pencarian dilakukan file Sample-Superstore.tsv, filter pencarian dimulai dari baris ke 2. Membuat sebuah array a indeksnya di kolom 13 (kolom region) serta menjumlahkan di kolom 21 (kolom profit), setelah itu disimpan di array a di indeks yang disesuaiakan di data kolom 13 (kolom region). Setelah itu dilooping untuk mengoutputkan data generic-numeric-value fungsi untuk memfilter nilai minimum. Output keluar di terminal.
![alt text](https://github.com/irsyadhani22/SoalShiftSISOP20_modul1_C03/blob/master/soal1/gambar_soal1/soal1a.png "Hasil Soal 1")

##### Penjelasan Soal 1b
+ ###### `awk -F "\t"` 
##### Artinya tab menjadi field separatornya
+ ###### `'{if($13=="Central") a[$11]=a[$11]+$21} END {for(i in a) print i}' Sample-Superstore.tsv | sort -g | head -2` 
##### Artinya pencarian dilakukan file Sample-Superstore.tsv, filter pencarian dimulai dari baris ke 2.Setelah itu dicek pada field ke-13 apakah merupakan `Central`. Dibuat array a yang indeksnya di field 11 (kolom state) berikutnya menjumlahkan indeksnya di field 21 (kolom profit), disimpan di indeks 11 (kolom state).Setelah itu dilooping untuk mengoutputkan data generic-numeric-value fungsi untuk memfilter nilai minimum, mengambil output 2 teratas.Output keluar di terminal.
![alt text](https://github.com/irsyadhani22/SoalShiftSISOP20_modul1_C03/blob/master/soal1/gambar_soal1/soal1b.png "Hasil Soal 1b")

##### Penjelasan Soal 1c
+ ###### `awk -F "\t"` 
##### Artinya tab menjadi field separatornya
+ ###### `'{if($13=="Central" || $13=="Central") a[$17]=a[$17]+$21} END {for(i in a) print i}' Sample-Superstore.tsv | sort -g | head -10` 
##### Artinya pencarian dilakukan file Sample-Superstore.tsv, filter pencarian dimulai dari baris ke 2.Setelah itu dicek pada field ke-1q apakah merupakan `Texas` dan `Illinois`. Dibuat array a yang indeksnya di field 17 (kolom produk) berikutnya menjumlahkan indeksnya di field 21 (kolom profit), disimpan di indeks 17 (kolom produk).Setelah itu dilooping untuk mengoutputkan data generic-numeric-value fungsi untuk memfilter nilai minimum, mengambil output 2 teratas. Output keluar di terminal.
![alt text](https://github.com/irsyadhani22/SoalShiftSISOP20_modul1_C03/blob/master/soal1/gambar_soal1/soal1c.png "Hasil Soal 1c")
