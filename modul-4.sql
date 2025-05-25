-- Nama: Bayu Tri Anugrah
-- Nim: 23241021
-- Kelas: A
-- Modul: 4


USE pti_mart;
-- Praktek 1 ORDER BY
SELECT * FROM tr_penjualan_dqlab ORDER BY qty;
SELECT nama_produk, qty FROM tr_penjualan_dqlab;
SELECT nama_produk, qty FROM tr_penjualan_dqlab ORDER BY qty;

-- Praktek 2 ORDER BY 2 KOLOM
SELECT nama_produk, qty FROM tr_penjualan_dqlab ORDER BY qty, nama_produk;

-- Latihan Mandiri
-- nomer 1
SELECT * FROM tr_penjualan_dqlab ORDER BY qty, tgl_transaksi;
-- nomer 2
SELECT * FROM ms_pelanggan_dqlab ORDER BY nama_pelanggan;
-- nomer 3
SELECT * FROM ms_pelanggan_dqlab ORDER BY alamat;

-- ASC/Ascending (kecil ke besar) dan DESC/Descending (besar ke kecil)
-- Praktek 3
SELECT nama_produk, qty FROM tr_penjualan_dqlab ORDER BY qty DESC;
SELECT nama_produk, qty FROM tr_penjualan_dqlab ORDER BY qty DESC, nama_produk DESC;

-- Latihan Mandiri 2
-- nomer 1
SELECT * FROM tr_penjualan_dqlab ORDER BY tgl_transaksi DESC, qty ASC;
-- nomer 2
SELECT * FROM ms_pelanggan_dqlab ORDER BY nama_pelanggan DESC;
-- nomer 3
SELECT * FROM ms_pelanggan_dqlab ORDER BY alamat DESC;

-- Praktek 5
SELECT nama_produk, qty, harga, qty*harga AS total
FROM tr_penjualan_dqlab
ORDER BY qty*harga DESC;

-- Latihan Mandiri 3
SELECT * FROM tr_penjualan_dqlab;

SELECT nama_produk, qty, harga, diskon_persen, qty*harga-diskon_persen AS total
FROM tr_penjualan_dqlab
ORDER BY qty*harga-diskon_persen;

SELECT 
  nama_produk,
  qty,
  harga,
  diskon_persen,
  harga * (diskon_persen / 100) AS diskon,
  harga - (harga * (diskon_persen / 100)) AS harga_setelah_diskon
FROM tr_penjualan_dqlab
ORDER BY diskon;

-- praktek 6: menggunakan Where dengan Order by
SELECT nama_produk, qty FROM tr_penjualan_dqlab 
WHERE nama_produk LIKE 'F%'
ORDER BY qty DESC;
 -- Latihan Mandiri 4
-- nomer 1
SELECT * FROM tr_penjualan_dqlab
WHERE diskon_persen > 0
ORDER BY harga DESC;
-- nomer 2
SELECT nama_produk, qty, harga FROM tr_penjualan_dqlab
WHERE harga >= 100000
ORDER BY harga DESC;
-- nomer 3
SELECT nama_produk, qty, harga FROM tr_penjualan_dqlab
WHERE harga >= 100000 OR nama_produk LIKE 'T%'
ORDER BY diskon_persen DESC;

SELECT * FROM tr_penjualan_dqlab ORDER BY diskon_persen DESC;