-- Nama: Agus Setiawan
-- Nim: 23241016
-- Kelas: A/4
-- Modul: Modul 1 - SELECT Statement, Prefic dan Alias

-- Membuat database baru
CREATE DATABASE IF NOT EXISTS PTI_SMART;
USE PTI_SMART;

-- melihat detail kolom dalam tiap tabel
DESCRIBE ms_pelanggan_dqlab;
DESCRIBE ms_produk_dqlab;
DESCRIBE tr_penjualan_dqlab;

-- select statement
-- mengambil satu kolom dalam tabel produk
SELECT nama_produk FROM ms_produk_dqlab;

-- mengambil lebih dari satu kolom dalam tabel produk
SELECT nama_produk, harga FROM ms_produk_dqlab;

-- mengambil semua kolom dalam tabel produk
SELECT * FROM ms_produk_dqlab;

-- select kolom kodew produk & nama produk dari ms produk
SELECT kode_produk, nama_produk FROM ms_produk_dqlab;

-- select semua kolom dari tr penjualan
SELECT * FROM tr_penjualan_dqlab;

-- prefic dan alias
--
--
SELECT ms_produk_dqlab.nama_produk FROM ms_produk_dqlab;

-- menggunakan trafix nama database dan tabel pada kolom nama produk dari tabel produk
SELECT pti_smart.ms_produk_dqlab.nama_produk FROM ms_produk_dqlab;

-- alias
-- menggunakan nama alias dengan as
SELECT nama_produk as np FROM ms_produk_dqlab;
SELECT nama_produk np FROM ms_produk_dqlab;

-- menggunakan alias pada tabel produk dan juga kolom
SELECT nama_produk as np FROM ms_produk_dqlab as msp;

-- menggunakan alias untuk trafic
SELECT msp.nama_produk FROM ms_produk_dqlab as msp;

-- Case 1
SELECT nama_pelanggan as nmp, alamat as alt FROM ms_pelanggan_dqlab as msplg;
-- Case 2
SELECT nama_produk as nmpk, harga as hrg FROM ms_produk_dqlab as msp;