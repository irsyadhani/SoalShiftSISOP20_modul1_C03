# SoalShiftSISOP20_modul1_C03

### Soal Shift Sistem Operasi 2020

Soal Shift Modul 1:
1. [Soal 1](#1-soal-1)
2. [Soal 2](#2-soal-2)
3. [Soal 3](#3-soal-3)

#### 1. Soal 1
Whits adalah seorang mahasiswa teknik informatika. Dia mendapatkan tugas praktikum untuk membuat laporan berdasarkan data yang ada pada file “Sample-Superstore.tsv”. Namun dia tidak dapat menyelesaikan tugas tersebut. Laporan yang diminta berupa :
1. a. Tentukan wilayah bagian (region) mana yang memiliki keuntungan (profit) paling sedikit
2. b. Tampilkan 2 negara bagian (state) yang memiliki keuntungan (profit) paling sedikit berdasarkan hasil poin a
3. c. Tampilkan 10 produk (product name) yang memiliki keuntungan (profit) paling sedikit berdasarkan 2 negara bagian (state) hasil poin b
Whits memohon kepada kalian yang sudah jago mengolah data untuk mengerjakan laporan tersebut.
*Gunakan Awk dan Command pendukung

File *Sample-Superstore.tsv* disimpan dalam `/home/irsyad`. File nya terdapat di `/home/irsyad/Sistem Operasi/Soal Modul 1/soal1` yang didalam teradapat file `jawabansoal1a`
Isi dari bash script `jawabansoal1a` :

soal 1a:
```sh
awk -F "\t" 'NR > 1 {a[$13]=a[$13]+$21} END {for(i in a) print i}' Sample-Superstore.tsv | sort -g | head -1
```
soal 1b:
```sh
awk -F "\t" '{if($13=="Central") a[$11]=a[$11]+$21} END {for(i in a) print a[i], i}' Sample-Superstore.tsv | sort -g | head -2
```
soal 1c:
```sh
awk -F "\t" '{if($11=="Texas" || $11=="Illinois") a[$17]=a[$17]+$21} END {for(i in a) print a[i], i}' Sample-Superstore.tsv | sort -g | head -10
```
Penjelasan Soal 1a
+ ###### `awk -F "\t"` 
Artinya tab menjadi field separatornya
+ ###### `'NR > 1 {a[$13]=a[$13]+$21} END {for(i in a) print i}' Sample-Superstore.tsv | sort -g | head -1` 
Artinya pencarian dilakukan file Sample-Superstore.tsv, filter pencarian dimulai dari baris ke 2. Membuat sebuah array a indeksnya di kolom 13 (kolom region) serta menjumlahkan di kolom 21 (kolom profit), setelah itu disimpan di array a di indeks yang disesuaiakan di data kolom 13 (kolom region). Setelah itu dilooping untuk mengoutputkan data generic-numeric-value fungsi untuk memfilter nilai minimum, mengambil output 2 teratas terkecil. Output keluar di terminal.

![alt text](https://github.com/irsyadhani22/SoalShiftSISOP20_modul1_C03/blob/master/soal1/gambar_soal1/soal1a.png "Hasil Soal 1")

Penjelasan Soal 1b
+ ###### `awk -F "\t"` 
Artinya tab menjadi field separatornya
+ ###### `'{if($13=="Central") a[$11]=a[$11]+$21} END {for(i in a) print a[i], i}' Sample-Superstore.tsv | sort -g | head -2` 
Artinya pencarian dilakukan file Sample-Superstore.tsv.Setelah itu dicek pada field ke-13 apakah merupakan `Central`. Dibuat array a yang indeksnya di field 11 (kolom state) berikutnya menjumlahkan indeksnya di field 21 (kolom profit), disimpan di indeks 11 (kolom state).Setelah itu dilooping untuk mengoutputkan data generic-numeric-value fungsi untuk memfilter nilai minimum, mengambil output 2 teratas terkecil.Output keluar di terminal.

![alt text](https://github.com/irsyadhani22/SoalShiftSISOP20_modul1_C03/blob/master/soal1/gambar_soal1/soal1b.png "Hasil Soal 1b")

Penjelasan Soal 1c
+ ###### `awk -F "\t"` 
Artinya tab menjadi field separatornya
+ ###### `'{if($11=="Texas" || $11=="Illinois") a[$17]=a[$17]+$21} END {for(i in a) print a[i], i}' Sample-Superstore.tsv | sort -g | head -10` 
Artinya pencarian dilakukan file Sample-Superstore.tsv.Setelah itu dicek pada field ke-11 apakah merupakan `Texas` dan `Illinois`. Dibuat array a yang indeksnya di field 17 (kolom produk) berikutnya menjumlahkan indeksnya di field 21 (kolom profit), disimpan di indeks 17 (kolom produk).Setelah itu dilooping untuk mengoutputkan data generic-numeric-value fungsi untuk memfilter nilai minimum, mengambil output 10 teratas terkecil. Output keluar di terminal.

![alt text](https://github.com/irsyadhani22/SoalShiftSISOP20_modul1_C03/blob/master/soal1/gambar_soal1/soal1c.png "Hasil Soal 1c")

2. Soal 2
Pada suatu siang, laptop Randolf dan Afairuzr dibajak oleh seseorang dan kehilangan data-data penting. Untuk mencegah kejadian yang sama terulang kembali mereka meminta bantuan kepada Whits karena dia adalah seorang yang punya banyak ide. Whits memikirkan sebuah ide namun dia meminta bantuan kalian kembali agar ide tersebut cepat diselesaikan. Idenya adalah kalian (a) membuat sebuah script bash yang dapat menghasilkan password secara acak sebanyak 28 karakter yang terdapat huruf besar, huruf kecil, dan angka. (b) Password acak tersebut disimpan pada file berekstensi .txt dengan nama berdasarkan argumen yang diinputkan dan HANYA berupa alphabet. (c) Kemudian supaya file .txt tersebut tidak mudah diketahui maka nama filenya akan di enkripsi dengan menggunakan konversi huruf (string manipulation) yang disesuaikan dengan jam(0-23) dibuatnya file tersebut dengan program terpisah dengan (misal: password.txt dibuat pada jam 01.28 maka namanya berubah menjadi qbttxpse.txt dengan perintah ‘bash soal2_enkripsi.sh password.txt’. Karena p adalah huruf ke 16 dan file dibuat pada jam 1 maka 16+1=17 dan huruf ke 17 adalah q dan begitu pula seterusnya. Apabila melebihi z, akan kembali ke a, contoh: huruf w dengan jam 5.28, maka akan menjadi huruf b.) dan (d) jangan lupa untuk membuat dekripsinya supaya nama file bisa kembali. HINT: enkripsi yang digunakan adalah caesar cipher. *Gunakan Bash Script

soal 2a-c:
```sh
cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 28 | head -n 1 >"$file.txt"
```
```sh
#!/bin/bash

file=$1
jam=$(date +%H)


for ((i=1;i<=jam;i++)) 
do
        file=$(echo "$file" | tr '[a-zA-Z]' '[b-zaB-ZA]')
done


```
2. Penjelasan Soal 2a-c
+ ###### `cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 28 | head -n 1 >"$file.txt"`
Artinya melakukan randomize untuk password dengan format alphanumeric dan memasukkan password ke dalam file yang sudah dibuat.

![alt text](https://github.com/irsyadhani22/SoalShiftSISOP20_modul1_C03/blob/master/soal2/soal_2_github/1582970690705.jpg "Password yang sudah jadi.")

+ ###### `file=$1 jam=$(date +%H)`
Artinya memasukkan argumen dengan input file=$1 dan membuat fungsi caesar cipher dimana mengambil jam untuk ditambahkan kepada tiap abjad nama file. (contoh, jam 16 dimana ini akan ditambahkan ke tiap abjad pada file yang bernama password.txt lalu nama filenya akan berubah menjadi fqiimeht.txt) 

![alt text](https://github.com/irsyadhani22/SoalShiftSISOP20_modul1_C03/blob/master/soal2/soal_2_github/1582969750727.jpg "File yang sudah di enkripsi dengan password di dalamnya.")

+ ###### `for ((i=1;i<=jam;i++)) do file=$(echo "$file" | tr '[a-zA-Z]' '[b-zaB-ZA]') done`
Artinya fungsi ini untuk melakukan randomize nama file nya dimana fungsi tr '[a-zA-Z]' '[b-zaB-ZA]' ini untuk menggeser abjad sebanyak satu kali ke sebelah kanan. Argumen '[b-zaB-ZA]' berfungsi untuk mengembalikan geseran looping ke abjad awal lagi, yaitu a dan A agar bisa menggeser lagi. Fungsi Looping ((i=1;i<=jam;i++)) ini untuk melakukan looping sebanyak jam yang sudah di detect oleh rumus caesar ciphernya. Jika jam menunjukkan jam 17, maka looping akan berjalan sebanyak 17 kali serta abjad akan bergeser sebanyak 17 kali.

![alt text](https://github.com/irsyadhani22/SoalShiftSISOP20_modul1_C03/blob/master/soal2/soal_2_github/1582971163522.jpg "Hasil penggeseran abjad oleh waktu.")

##### Soal 2d belum menemukan cara untuk dekripsi


3. Soal 3
1 tahun telah berlalu sejak pencampakan hati Kusuma. Akankah sang pujaan hati kembali ke naungan Kusuma? Memang tiada maaf bagi Elen. Tapi apa daya hati yang sudah hancur, Kusuma masih terguncang akan sikap Elen. Melihat kesedihan Kusuma, kalian mencoba menghibur Kusuma dengan mengirimkan gambar kucing. `[a] Maka dari itu, kalian mencoba membuat script untuk mendownload 28 gambar dari "https://loremflickr.com/320/240/cat" menggunakan command wget dan menyimpan file dengan nama "pdkt_kusuma_NO" (contoh: pdkt_kusuma_1, pdkt_kusuma_2, pdkt_kusuma_3) serta jangan lupa untuk menyimpan log messages wget kedalam sebuah file "wget.log"`. Karena kalian gak suka ribet, kalian membuat penjadwalan untuk menjalankan script download gambar tersebut. Namun, script download tersebut hanya berjalan`[b] setiap 8 jam dimulai dari jam 6.05 setiap hari kecuali hari Sabtu` Karena gambar yang didownload dari link tersebut bersifat random, maka ada kemungkinan gambar yang terdownload itu identik. Supaya gambar yang identik tidak dikira Kusuma sebagai spam, maka diperlukan sebuah script untuk memindahkan salah satu gambar identik. Setelah memilah gambar yang identik, maka dihasilkan gambar yang berbeda antara satu dengan yang lain. Gambar yang berbeda tersebut, akan kalian kirim ke Kusuma supaya hatinya kembali ceria. Setelah semua gambar telah dikirim, kalian akan selalu menghibur Kusuma, jadi gambar yang telah terkirim tadi akan kalian simpan kedalam folder /kenangan dan kalian bisa mendownload gambar baru lagi. `[c] Maka dari itu buatlah sebuah script untuk mengidentifikasi gambar yang identik dari keseluruhan gambar yang terdownload tadi. Bila terindikasi sebagai gambar yang identik, maka sisakan 1 gambar dan pindahkan sisa file identik tersebut ke dalam folder ./duplicate dengan format filename "duplicate_nomor" (contoh : duplicate_200, duplicate_201). Setelah itu lakukan pemindahan semua gambar yang tersisa kedalam folder ./kenangan dengan format filename "kenangan_nomor" (contoh: kenangan_252, kenangan_253). Setelah tidak ada gambar di current directory, maka lakukan backup seluruh log menjadi ekstensi ".log.bak"`. Hint : Gunakan wget.log untuk membuat location.log yang isinya merupakan hasil dari grep "Location". *Gunakan Bash, Awk dan Crontab

3. a. Bash script *jawabansoal3a.sh* :

```sh
#!bin/bash
mkdir /home/irsyad/no3/kenangan
mkdir /home/irsyad/no3/duplicate

> /home/irsyad/no3/wget.log
> /home/irsyad/no3/location.log

for ((n=1; n<29; n=n+1))
do
wget -a /home/irsyad/no3/wget.log "https://loremflickr.com/320/240/cat" -O /home/irsyad/no3/pdkt_kusuma_"$n".jpg
done

grep "Location" /home/irsyad/no3/wget.log > /home/irsyad/no3/location.log

```

Penjelasan Soal 3a
+ ###### `mkdir /home/irsyad/no3/kenangan`
Membuat folder kenangan
+ ###### `mkdir /home/irsyad/no3/duplicate`
Membuat folder duplicate
+ ###### `> /home/irsyad/no3/wget.log`
Membuat file wget.log sesuai dengan folder yang didentukan
+ ###### `> /home/irsyad/no3/location.log`
Membuat file location.log sesuai dengan folder yang didentukan
+ ###### `for ((n=1; n<29; n=n+1)) do`
Membuat looping sampai 28 
+ ###### `wget -a /home/irsyad/no3/wget.log "https://loremflickr.com/320/240/cat" -O /home/irsyad/no3/pdkt_kusuma_"$n".jpg done`
Menggunakan fungsi wget -a untuk mengambil proses tulisan dari link `https://loremflickr.com/320/240/cat` dan fungsi wget -O untuk penamaan serta memakai variabel n untuk penomoran yang urut 
+ ###### `grep "Location" /home/irsyad/no3/wget.log > /home/irsyad/no3/location.log`
Mencari tulisan `Location` dari link yang sudah ditentukan lalu dipindahkan ke file location untuk perbedaannya

Hasil dari soal 3a:

![alt text](https://github.com/irsyadhani22/SoalShiftSISOP20_modul1_C03/blob/master/soal3/gambar_soal3/jawabansoal3a.png "Hasil Soal 3a")

3. b. crontab script *jawabansoal3b* :

```sh
05 06,*/8 * * 1-5,7 bash /home/irsyad/no3/jawabansoal3a.sh
```
Penjelasan Soal 3b
+ ###### `05 06,*/8 * * 1-5,7`
Akan menjadwalkan pada pukul 06.05 setiap 8 jam di hari sabtu setiap hari
+ ###### `bash`
Pendownloadan gambar dari file yang berada `jawabansoal3a.sh`
+ ###### `/home/irsyad/no3/jawabansoal3a.sh`
link yang dituju

Hasil dari soal 3b:

![alt text](https://github.com/irsyadhani22/SoalShiftSISOP20_modul1_C03/blob/master/soal3/gambar_soal3/jawabansoal3b.png "Hasil Soal 3b")

3. c. Bash script *jawabansoal3c.sh* :

```sh
#!/bin/bash
readarray -t arr < /home/irsyad/no3/location.log
flag=0
for((n=0; n<28; n=n+1))
do
        nomor=$(ls -1 /home/irsyad/no3/kenangan | wc -l)
        nomor2=$(ls -1 /home/irsyad/no3/duplicate | wc -l)
        flag=$((0))

        for((i=0; i<$n; i=i+1))
                do
                if [ $n -eq 0 ]
                        then mv /home/irsyad/no3/pdkt_kusuma_1.jpg kenangan/kenangan_1.jpg

                elif [ "${arr[$n]}" == "${arr[$i]}" ]
                then
                        flag=$((1))
                        break
                elif [ "${arr[$n]}" == "((${arr[$i]}-1))" ]
                        then
                        flag=$((0))
                fi
done

        if [ $flag -eq 0 ]
        then
                mv /home/irsyad/no3/pdkt_kusuma_"$(($n+1))".jpg /home/irsyad/no3/kenangan/kenangan_"$(($nomor+1))".jpg
        else
                mv /home/irsyad/no3/pdkt_kusuma_"$(($n+1))".jpg /home/irsyad/no3/duplicate/duplicate_"$(($nomor2+1))".jpg
        fi

done
```

Penjelasan Soal 3c:
+ ###### `readarray -t arr < /home/irsyad/no3/location.log`
Menyimpan isi `location.log` di sebuah array
+ ###### `flag=0`
Untuk mendeteksi apakah duplicate atau kenangan
+ ###### `for((n=0; n<28; n=n+1)) do`
Membuat perulangan sebanyak 28 
+ ###### `nomor=$(ls -1 /home/irsyad/no3/kenangan | wc -l)`
Membuat variabel nomor untuk me-list file di dalam folder kenangan
+ ###### `nomor2=$(ls -1 /home/irsyad/no3/duplicate | wc -l)
Membuat variabel nomor2 untuk me-list file di dalam folder duplicate
+ ###### `flag=$((0))`
Membuat variabel flag 
+ ###### `for((i=0; i<$n; i=i+1)) do`
Melakukan looping sesuai dengan variabel n
+ ###### `if [ $n -eq 0 ]`
Jika n sama dengan 0
+ ###### `then mv /home/irsyad/no3/pdkt_kusuma_1.jpg kenangan/kenangan_1.jpg`
Memindahkan file pertama `pdkt_kusuma_1.jpg` ke folder kenangan  dengan penamaan `kenangan_1.jpg` 
+ ###### `elif [ "${arr[$n]}" == "${arr[$i]}" ]`
Jika perbandingan array n sama dengan array i 
+ ###### `then flag=$((1)) break`
Memberikan nilai flag = 1 dan langsung di break agar perbandingan jika tidak dijalankan dan kembali langsung ke looping
+ ###### `elif [ "${arr[$n]}" == "((${arr[$i]}-1))" ]`
Jika perbandingan array n sama dengan array i yang di -1 supaya bisa membandingkan file yang lain pada saat looping
+ ###### `then flag=$((0)) fi done`
Diberikan nilai flag = 0 agar file asli langsung masuk ke folder kenangan
+ ###### `if [ $flag -eq 0 ]`
Perbandingan jika nilai flag = 0
+ ###### `mv /home/irsyad/no3/pdkt_kusuma_"$(($n+1))".jpg /home/irsyad/no3/kenangan/kenangan_"$(($nomor+1))".jpg`
Memindahkan file `pdkt_kusuma_.jpg` ke folder kenangan karena tidak duplicate serta diberikan nilai +1 karena array dimulai dari 0
+ ###### `else mv /home/irsyad/no3/pdkt_kusuma_"$(($n+1))".jpg /home/irsyad/no3/duplicate/duplicate_"$(($nomor2+1))".jpg done`
Jika selain nilai flag = 0, Maka memindahkan file `pdkt_kusuma_.jpg` ke folder duplicate karena sama gambarnya serta diberikan nilai +1 karena array dimulai dari 0

Hasil dari soal 3c:

![alt text](https://github.com/irsyadhani22/SoalShiftSISOP20_modul1_C03/blob/master/soal3/gambar_soal3/jawabansoal3c1.png "Hasil Soal 3c1")
![alt text](https://github.com/irsyadhani22/SoalShiftSISOP20_modul1_C03/blob/master/soal3/gambar_soal3/jawabansoal3c2.png "Hasil Soal 3c2")
![alt text](https://github.com/irsyadhani22/SoalShiftSISOP20_modul1_C03/blob/master/soal3/gambar_soal3/jawabansoal3c3.png "Hasil Soal 3c3")
