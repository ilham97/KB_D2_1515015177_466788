DOMAINS
nama,jender,pekerjaan,benda,alasan,zat = symbol /* symbol sebagai kumpulan karakter atau dengan huruf kecil. memakai int karena menggunakan angka*/
umur=integer
PREDICATES
nondeterm orang(nama, umur, jender, pekerjaan) /* sebagai nama simbolik untuk relasi dan kata nondeterm ini berfungsi untuk memberitahu bahwa predikat tsb mempunyai lebih dari 1 kemungkinan.*/
nondeterm selingkuh(nama, nama) /* dalam predikat di awali huruf kecil dan dapat di ikuti oleh huruf, bilangan dll. */
terbunuh_dengan(nama, benda) 
terbunuh(nama)
nondeterm pembunuh(nama)
motif(alasan)
ternodai(nama, zat)
milik(nama, benda)
nondeterm cara_kerja_mirip(benda, benda)
nondeterm kemungkinan_milik(nama, benda)
nondeterm dicurigai(nama)
/* * * Fakta-fakta tentang pembunuhan * * */
CLAUSES
orang(budi,55,m,tukang_kayu). /* budi adalah orang berumur 55. gender laki-laki dan pekerjaan tukang kayu */
orang(aldi,25,m,pemain_sepak_bola). /* aldi adalah orang berumur 25 gender laki-laki pekerjaan pemain sepak bola */
orang(aldi,25,m,tukang_jagal). /* aldi adalah orang berumur 25 gender laki-laki pekerjaan tukang jagal */
orang(joni,25,m,pencopet). /* joni adlah orang berumur 25 gender laki-laki pekerjaan pencopet */
selingkuh(ina,joni). /* ina selingkuh dengan joni */
selingkuh(ina,budi). /* ina selingkuh dengan budi */
selingkuh(siti,joni). /* siti selingkuh dengan joni */
terbunuh_dengan(siti,pentungan). /* siti terbunuh dengan pentungan */
terbunuh(siti). /* siti terbunuh */
motif(uang). /* uang adalah motifnya */
motif(cemburu). /* cemburu adalah motifnya */
motif(dendam). /* dendam adalah motifnya */
ternodai(budi, darah). /* budi ternodai darah */
ternodai(siti, darah). /* siti ternodai darah*/
ternodai(aldi, lumpur). /* aldi ternodai lumpur*/
ternodai(joni, coklat). /* joni ternodai coklat*/
ternodai(ina, coklat). /* ina ternodai coklat*/
milik(budi,kaki_palsu). /* budi memiliki kaki palsu*/
milik(joni,pistol). /* joni memiliki pistol*/
/* * * Basis Pengetahuan * * */
cara_kerja_mirip(kaki_palsu, pentungan). /* kaki palsu cara krjanya mirip dengan pentungan*/
cara_kerja_mirip(balok, pentungan). /* balok cara kerjanya mirip pentungan*/
cara_kerja_mirip(gunting, pisau). /* gunting cara kerjanya mirip pisau*/
cara_kerja_mirip(sepatu_bola, pentungan). /* sepatu bola cara kerjanya mirip pentungan*/
kemungkinan_milik(X,sepatu_bola):- /* X kemungkinan milik sepatu bola jika */ 
orang(X,_,_,pemain_sepak_bola). /* X adalah oramg pemain sepak bola*/
kemungkinan_milik(X,gunting):- /* X kemungkinan memiliki gunting jika*/
orang(X,_,_,pekerja_salon). /* X orang yang bekerja di salon*/
kemungkinan_milik(X,Benda):- /* X kemungkinan memiliki benda jika*/
milik(X,Benda). /* X memiliki benda*/
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * *
* dicurigai semua orang yang memiliki senjata yang *
* kerjanya mirip dengan senjata penyebab siti terbunuh. *
* * * * * * * * * * * * * * * * * * * * * * * * * * * * */
dicurigai(X):- /* X dicurigai jika*/
terbunuh_dengan(siti,Senjata) , /* sititerbunuh dengan senjata*/
cara_kerja_mirip(Benda,Senjata) , /* bemda yang cara kerjanya mirip senjata */
kemungkinan_milik(X,Benda). /* dan X kemungkinan memiliki benda*/
/* * * * * * * * * * * * * * * * * * * * * * * * * *
* dicurigai laki-laki yang selingkuh dengan siti. *
* * * * * * * * * * * * * * * * * * * * * * * * * */
dicurigai(X):- /* X dicurigai jika*/
motif(cemburu), /* cemburu adalah motifnya*/
orang(X,_,m,_), /* siapa orangnya*/
selingkuh(siti,X). /* siti selingkuh dengan siapa*/
/* * * * * * * * * * * * * * * * * * * * * * *
* dicurigai perempuan yang selingkuh dengan *
* laki-laki yang juga selingkuh dengan siti *
* * * * * * * * * * * * * * * * * * * * * * */
dicurigai(X):- /* X dicurigai jika */
motif(cemburu), /*cemburu adalah motifnya*/ 
orang(X,_,f,_), /* siapa orangnya*/
selingkuh(X,Lakilaki), /* X selingkuhannya laki-laki*/
selingkuh(siti,Lakilaki). /* siti selingkuh dengan laki-laki*/
/* * * * * * * * * * * * * * * * * * * * * * * * * * *
* dicurigai pencopet yang mempunyai motif uang. *
* * * * * * * * * * * * * * * * * * * * * * * * * * */
dicurigai(X):- /*X dicurigai jika */
motif(uang), /* uang adalah motifnya*/
orang(X,_,_,pencopet). /* X adalah orang .... pencopet*/
pembunuh(Pembunuh):- /* pembunuh adalah pembunuhnya jika*/
orang(Pembunuh,_,_,_), /* pembunuh adalah orang yang */
terbunuh(Terbunuh), /* terbunuh jka terbunuh*/
Terbunuh <> Pembunuh, /* Bukan bunuh diri */
dicurigai(Pembunuh), /* pembunh di curigai*/
ternodai(Pembunuh,Zat), /* pembunh di curigai zat*/
ternodai(Terbunuh,Zat). /* terbunuh dicurigai zat*/
GOAL
pembunuh(X). /* siapa pembunuhnya*/
 /* budi adalah pembunuhnya karene budi adalah tukang kayu, karena siti terbunuh dengan pentungan, motif cemburu karena siti selingkuh dengan joni, budi ternodai zat darah sama seperti siti*/
