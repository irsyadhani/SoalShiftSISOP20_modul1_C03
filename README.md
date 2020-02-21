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

File *Sample-Superstore.tsv* disimpan dalam folder `/home/irsyad`. File nya terdapat di `/home/irsyad/Sistem Operasi/Soal Modul 1/soal1` yang didalam teradapat file `jawabansoal1a`
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
+ ##### Penjelasan Soal 1a
+ ###### `awk -F "\t"` artinya tab menjadi field separatornya
+ ###### `'NR > 1 {a[$13]=a[$13]+$21} END {for(i in a) print i}' Sample-Superstore.tsv | sort -g | head -1` 
##### Output keluar di terminal.
