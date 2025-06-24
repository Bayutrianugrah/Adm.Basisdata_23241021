-- Modul    : 5 : JOIN, UNION,LIMIT.
-- Nama     : Bayu Tri Anugrah
-- NIM      : 23241021
-- Kelas    : A/4

-- menggunakan database
USE pti_mart;
-- JOIN
-- Menggabungkan dua buah tabel berdasarkan kolom yang sama

-- Ambil nama pelanggan yg pernah bertransaksi beserta qty
-- arti nya amnil kolom kode_pelanggan, nam_pelanggan, dan qty dari
-- penggabungan tabel penjualan dan tabel pelangan

-- praktek 1
SELECT tp.code_pelanggan,mp_pelanggan,tp.qty
FROM tr_penjualan as tp
JOIN ms_planggan as mp
ON tp.kode_pelanggan = mp.kode_pelanggan;

-- praktek 2
-- Menggabungkan dua tabel tanpa merperhatikan relatiomal keys
-- Ambil nama pelanggan yang pernah berteransaksi beserta qty nya
-- menggabungkan tabel penjualan dan tabel pelanggan tanpa
-- memperhatikan kolom yang menjadi primary key
SELECT tp.kode_pelanggan,mp.nama_pelanggan,tp.qty
FROM tr_penjualan as tp
JOIN ms_pelanggan as mp
ON TRUE;

-- INNER JOIN
-- join yg mengambil data dari dua sisi tabel yang berhubungan

-- praktek 3
-- ambil kode pelanggan, nama pelanggan, nama produk,qty
-- dari hasil join tabel penjualan dan tabel pelangan
SELECT tp.kode_pelanggan, mp.nam_pelangan, tp.nama_produk, tp.qty
FROM tr_penjualan as tp
INNER JOIN ms_pelanggan as mp
ON tp.code_pelanggan = mp.kode_pelanggan;

-- LEFT JOIN
-- Join yang menggambil seluruh data pADA sisi tabel sebelah kiri
-- dan yang hanya mengambil sebagian data pada sisi tabel kanan
-- yang berelasi saja . bagian yg tidak berelasi akan di tampilkan
-- sebagai NULL

-- praktek 4
-- ambil semua nama pelanggan yg pernah bertransaksi + qty
SELECT tp.code_pelanggan, mp.nam_pelangan, tp.nama_produk, tp.qty
FROM tr_penjualan as tp
LEFT JOIN ms_pelanggan as mp
ON tp.kode_pelanggan = mp.code_pelanggan;

-- RIGHT JOIN
-- Join yg mengambil seluruh data tabel sebelah kanan
-- tabel sebelah kiri hanya di ambil yg berelasi, jika tidak NULL

-- praktek 5
-- Ambil semua pelanggan yang pernah bertransaksi
SELECT kode_pelanggan, tp.qty
FROM tr_penjualan as tp
RIGHT JOIN ms_pelanggan as mp
ON mp.kode_pelanggan = tp.kode_pelanggan
WHERE tp.qty is NULL;

-- praktek 6
-- ambil kategori produk dan nama produk yg di beli oleh pelanggan
-- tampilkan pelanggan beserta nama nya

-- alur berfikir cari kolom -kolom yang di butuhkan
SELECT kode_pelanggan,nama_pelanggan,kategori_produk,nama_produk,qty
FROM ms_pelanggan as mp
LEFT JOIN tr_penjualan as tp
ON mp.kode_pelanggan = tp.kode_pelanggan
LEFT JOIN ms_produk as mpd
ON mpd.kode_produk = tp.kode_produk
WHERE tp.code_pelanggan is NOT NULL
GROUP BY tp.kode_pelanggan, mpd.kategori_produk
HAVING SUM(tp.qty) > 4
ORDER BY SUM(tp.qty) DESC;



-- latihan mandiri

-- latihan  1
-- Buatlah join untuk ketiga table yang terdapat pada dbqlambartbasic dengan INNER JOIN.
SELECT *
FROM ms_pelanggan_dqlab AS mp
INNER JOIN tr_penjualan_dqlab AS tp
ON mp.kode_pelanggan = tp.kode_pelanggan
INNER JOIN ms_produk_dqlab AS mpd 
ON tp.kode_produk = mpd.kode_produk;

-- latihan 2
-- Buatlah join untuk ketiga table dengan urutan ms_pelanggan, tr_penjualan dan ms_produk yang
-- terdapat pada dbqlambartbasic dengan LEFT JOIN, kemudian filter untuk qty yang tidak bernilai NULL dengan operator IS NOT NULL.
SELECT tp.kode_pelanggan, 
mp.nama_pelanggan, 
mpd.kategori_produk, 
tp.nama_produk, 
tp.qty
FROM ms_pelanggan_dqlab as mp
LEFT JOIN tr_penjualan_dqlab as tp
ON mp.kode_pelanggan = tp.kode_pelanggan
LEFT JOIN ms_produk_dqlab as mpd
ON mpd.kode_produk = tp.kode_produk
WHERE tp.kode_produk is NOT NULL;

-- latihan 3
-- Buatlah join untuk ketiga table dengan urutan ms_pelanggan, tr_penjualan dan ms_produk yang terdapat pada
-- dbqlambartbasic dengan INNER JOIN, kemudian tampilkan grouping untuk kolom kategori produk dan penjumlahan qty.
SELECT tp.kode_pelanggan, 
mp.nama_pelanggan, 
mpd.kategori_produk, 
tp.nama_produk, 
tp.qty
FROM ms_pelanggan_dqlab as mp
INNER JOIN tr_penjualan_dqlab as tp
ON mp.kode_pelanggan = tp.kode_pelanggan
INNER JOIN ms_produk_dqlab as mpd
ON mpd.kode_produk = tp.kode_produk
GROUP BY mpd.kategori_produk;

-- latihan 4
-- Latihan khusus: Cobalah lakukan JOIN ms_produk dengan table ms_pelanggan (benar, Anda tidak salah baca) 
-- – ini kita lakukan join dengan kolom relationship kode_produk, dan jangan lupa untuk menggunakan alias.
SELECT 
A.kode_produk AS kode_1,
A.nama_produk AS produk_1,
B.kode_produk AS kode_2,
B.nama_produk AS produk_2
FROM ms_produk_dqlab AS A
JOIN ms_produk_dqlab AS B
ON A.kode_produk = B.kode_produk;








