domains
 nilai = integer
 
 
predicates
 nama(symbol,symbol) - nondeterm (i,i) nondeterm (o,o) nondeterm (i,o) nondeterm (o,i)
 matkulintel(symbol) - nondeterm (o)
 
 
clauses
nama(intel, irfan).
nama(intel, komeng).
nama(intel, dati).
nama(intel, fatima).
nama(intel, maspion).
nama(pde, ricky).
nama(pde, embang).
nama(pde, salmin).
nama(pde, vina).
nama(pde, sondang).
nama(soos, pamuji).
nama(soos, luki).
nama(soos, sadek).
nama(soos, yusida).
nama(soos, eka).

/*A, D, C, 
B, C, E, A, D, B, C, D, E, B, A, dan A. Mahasiwa yang tidak  lulus adalah mahasiswa yang 
nilainya di bawah C (D dan E tidak lulus). */

 matkulintel(Y):-
 	nama(intel,Y);
 	nama(pde,Y);
 	nama(soos,Y).
 	


goal
  matkulintel(All),
  
  write("Nama Seluruh Mahasiswa : ",All,"\n").


/*Intelejensi Buatan (Irfan, Komeng, Dati, Fatima, dan Maspion); 5 mahasiswa mengambil
mata  kuliah  PDE  (Ricky,  Embang,  Salmin,  Vina,  dan  Sondang)  dan  5  mahasiswa  lagi
mengambil mata  kuliah  Sistem Operasi  (Pamuji,  Luki,  Sadek,  Yusida  dan  Eka).  Setelah*/