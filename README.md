# SoalShiftSISOP20_modul1_C03

### SoalShiftSISOP20_modul1_C03:

Soal Shift Modul 1:
1. [Soal 1](#1-soal-1)
3. [Soal 3](#3-soal-3)

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












#### 3. Soal 3
##### 1 tahun telah berlalu sejak pencampakan hati Kusuma. Akankah sang pujaan hati kembali ke naungan Kusuma? Memang tiada maaf bagi Elen. Tapi apa daya hati yang sudah hancur, Kusuma masih terguncang akan sikap Elen. Melihat kesedihan Kusuma, kalian mencoba menghibur Kusuma dengan mengirimkan gambar kucing. `[a] Maka dari itu, kalian mencoba membuat script untuk mendownload 28 gambar dari "https://loremflickr.com/320/240/cat" menggunakan command wget dan menyimpan file dengan nama "pdkt_kusuma_NO" (contoh: pdkt_kusuma_1, pdkt_kusuma_2, pdkt_kusuma_3) serta jangan lupa untuk menyimpan log messages wget kedalam sebuah file "wget.log"`. Karena kalian gak suka ribet, kalian membuat penjadwalan untuk menjalankan script download gambar tersebut. Namun, script download tersebut hanya berjalan`[b] setiap 8 jam dimulai dari jam 6.05 setiap hari kecuali hari Sabtu` Karena gambar yang didownload dari link tersebut bersifat random, maka ada kemungkinan gambar yang terdownload itu identik. Supaya gambar yang identik tidak dikira Kusuma sebagai spam, maka diperlukan sebuah script untuk memindahkan salah satu gambar identik. Setelah memilah gambar yang identik, maka dihasilkan gambar yang berbeda antara satu dengan yang lain. Gambar yang berbeda tersebut, akan kalian kirim ke Kusuma supaya hatinya kembali ceria. Setelah semua gambar telah dikirim, kalian akan selalu menghibur Kusuma, jadi gambar yang telah terkirim tadi akan kalian simpan kedalam folder /kenangan dan kalian bisa mendownload gambar baru lagi. `[c] Maka dari itu buatlah sebuah script untuk mengidentifikasi gambar yang identik dari keseluruhan gambar yang terdownload tadi. Bila terindikasi sebagai gambar yang identik, maka sisakan 1 gambar dan pindahkan sisa file identik tersebut ke dalam folder ./duplicate dengan format filename "duplicate_nomor" (contoh : duplicate_200, duplicate_201). Setelah itu lakukan pemindahan semua gambar yang tersisa kedalam folder ./kenangan dengan format filename "kenangan_nomor" (contoh: kenangan_252, kenangan_253). Setelah tidak ada gambar di current directory, maka lakukan backup seluruh log menjadi ekstensi ".log.bak"`. Hint : Gunakan wget.log untuk membuat location.log yang isinya merupakan hasil dari grep "Location". *Gunakan Bash, Awk dan Crontab

Bash script *jawabansoal3a.sh* :

```sh
#!/bin/bash
a=1

while [ $a -lt 29 ]
do
echo $a
wget -O pdkt_kusuma_$a.jpg "https://loremflickr.com/320/240/cat"
  a=$((a + 1))
done
```

##### Penjelasan Soal 3a
+ ###### `a=1`
##### Artinya menentukan nilai awal 1
+ ###### `while [ $a -lt 29 ]do`
##### Artinya memulai nilai 1 sampai 29
+ ###### `echo $a`
##### Artinya menampilkan nilai
+ ###### `wget -O pdkt_kusuma_$a.jpg "https://loremflickr.com/320/240/cat"`
##### Artinya mendownload file gambar dari `https://loremflickr.com/320/240/cat` serta untuk penamaan pakai `-O`. Terdapat `$a` untuk memanggil variabel a.
+ ###### ` a=$((a + 1))done`
##### Artinya menambah nilai looping a sampai dengan syarat yang ditentukan tadi.
###### Hasil dari soal 3a:
![alt text](https://github.com/irsyadhani22/SoalShiftSISOP20_modul1_C03/blob/master/soal3/gambar_soal3/soal3a.png "Hasil Soal 3a")

crontab script *jawabansoal3b* :

```sh
05 06,*/8 * * 1-5,7 ls /home/irsyad/gambar_kusuma > /home/irsyad/log_kusuma/wget.log
```
##### Penjelasan Soal 3b
+ ###### `05 06,*/8 * * 1-5,7`
##### Artinya akan menjadwalkan pada pukul 06.05 setiap 8 jam di hari sabtu setiap hari
+ ###### `ls`
##### Artinya menampilkan list
+ ###### `/home/irsyad/gambar_kusuma >`
##### Artinya melist di folder /home/irsyad/gambar_kusuma dan tanda `>` fungsi untuk copy namanya ditumpuk
+ ###### `/home/irsyad/log_kusuma/wget.log`
##### Artinya disimpan di folder /home/irsyad/log_kusuma/wget.log disimpan di log wget.log.
###### hasil dari soal 3b:
![alt text](https://github.com/irsyadhani22/SoalShiftSISOP20_modul1_C03/blob/master/soal3/gambar_soal3/soal3b.png "Hasil Soal 3b")

##### Soal 3c belum menemukan cara untuk mendeteksi gambar yang sama(duplicate) pada saat mendownload
