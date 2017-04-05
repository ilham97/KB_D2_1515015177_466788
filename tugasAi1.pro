predicates
  warna(symbol,symbol) - nondeterm (i,i)
 

clauses
  warna(biru,langit). %biru warna langit
  warna(hijau,rumput). %hijau warna rumput
  warna(putih,susu). %putih warna susu
  warna(hitam,rambut). %hitam warna rambut
  warna(merah,api). %merah warna api
  warna(putih,kertas):- %putuh warna kertas
	warna(hitam, pulpen). %jika hitam warna pulpen

goal
  warna(hijau,kertas). %hijau warna kertas
