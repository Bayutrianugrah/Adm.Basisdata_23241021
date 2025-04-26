-- Membuat database baru
CREATE DATABASE IF NOT EXISTS ONLINE_MARKETPLACE;

USE ONLINE_MARKETPLACE;

-- Membuat tabel Pelanggan dengan IF NOT EXISTS
CREATE TABLE IF NOT EXISTS Pelanggan (
    id_pelanggan INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(255),
    no_telpon VARCHAR(20),
    email VARCHAR(255),
    alamat VARCHAR(255),
    password VARCHAR(255)
);

-- Membuat tabel Kategori dengan IF NOT EXISTS
CREATE TABLE IF NOT EXISTS Kategori (
    id_kategori INT AUTO_INCREMENT PRIMARY KEY,
    nama_kategori VARCHAR(100),
    deskripsi TEXT
);

-- Membuat tabel Toko dengan IF NOT EXISTS
CREATE TABLE IF NOT EXISTS Toko (
    id_toko INT AUTO_INCREMENT PRIMARY KEY,
    nama_toko VARCHAR(255),
    deskripsi TEXT,
    alamat VARCHAR(255),
    kontak VARCHAR(100)
);

-- Membuat tabel Produk dengan IF NOT EXISTS
CREATE TABLE IF NOT EXISTS Produk (
    id_produk INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(255),
    deskripsi TEXT,
    harga DECIMAL(10,2),
    stok INT,
    id_kategori INT,
    id_toko INT,
    FOREIGN KEY (id_kategori) REFERENCES Kategori(id_kategori),
    FOREIGN KEY (id_toko) REFERENCES Toko(id_toko)
);

-- Membuat tabel Transaksi dengan IF NOT EXISTS
CREATE TABLE IF NOT EXISTS Transaksi (
    id_transaksi INT AUTO_INCREMENT PRIMARY KEY,
    id_pelanggan INT,
    tanggal_transaksi DATETIME DEFAULT CURRENT_TIMESTAMP,
    total_harga DECIMAL(12,2),
    status VARCHAR(50),
    FOREIGN KEY (id_pelanggan) REFERENCES Pelanggan(id_pelanggan)
);

-- Membuat tabel Detail_Transaksi dengan IF NOT EXISTS
CREATE TABLE IF NOT EXISTS Detail_Transaksi (
    id_detail INT AUTO_INCREMENT PRIMARY KEY,
    id_transaksi INT,
    id_produk INT,
    jumlah INT,
    harga_satuan DECIMAL(10,2),
    diskon_persen DECIMAL(5,2) DEFAULT 0,
    subtotal DECIMAL(10,2),
    FOREIGN KEY (id_transaksi) REFERENCES Transaksi(id_transaksi),
    FOREIGN KEY (id_produk) REFERENCES Produk(id_produk)
);

-- Membuat tabel Ulasan dengan IF NOT EXISTS
CREATE TABLE IF NOT EXISTS Ulasan (
    id_ulasan INT AUTO_INCREMENT PRIMARY KEY,
    id_pelanggan INT,
    id_produk INT,
    rating INT,
    komentar TEXT,
    tanggal_ulasan DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_pelanggan) REFERENCES Pelanggan(id_pelanggan),
    FOREIGN KEY (id_produk) REFERENCES Produk(id_produk)
);

-- Untuk data yang akan dimasukkan, kita bisa menambahkan pengecekan untuk menghindari duplikasi
-- Contoh untuk tabel Kategori (dengan pendekatan INSERT IGNORE atau pengecekan)
INSERT IGNORE INTO Kategori (nama_kategori, deskripsi) VALUES
('Elektronik', 'Produk elektronik dan gadget'),
('Pakaian', 'Berbagai jenis pakaian dan fashion'),
('Makanan', 'Produk makanan dan minuman'),
('Buku', 'Buku dan alat tulis'),
('Perabot', 'Peralatan rumah tangga'),
('Kosmetik', 'Produk kecantikan dan kosmetik');

-- Memasukkan data ke tabel Toko
INSERT IGNORE INTO Toko (nama_toko, deskripsi, alamat, kontak) VALUES
('Toko Elektronik Maju', 'Menjual berbagai macam elektronik', 'Jl. Teknologi No. 123', '08123456789'),
('Fashion Kita', 'Toko fashion terlengkap', 'Jl. Mode No. 456', '08234567890'),
('Roti Enak', 'Toko roti dan kue', 'Jl. Kuliner No. 789', '08345678901'),
('Gramedia Online', 'Toko buku terlengkap', 'Jl. Literasi No. 101', '08456789012');

-- Memasukkan data ke tabel Pelanggan
INSERT IGNORE INTO Pelanggan (nama, no_telpon, email, alamat, password) VALUES
('Andi Wijaya', '081234567890', 'andi@gmail.com', 'Jl. Merdeka No. 10', 'password123'),
('Siti Rahma', '082134567891', 'siti@gmail.com', 'Jl. Sudirman No. 15', 'siti12345'),
('Budi Santoso', '083134567892', 'budi@gmail.com', 'Jl. Thamrin No. 20', 'budi456'),
('Dewi Lestari', '084134567893', 'dewi@gmail.com', 'Jl. Gajah Mada No. 25', 'dewi789'),
('Rizki Hidayat', '085134567894', 'rizki@gmail.com', 'Jl. Ahmad Yani No. 30', 'rizki000');

-- Memasukkan data ke tabel Produk
INSERT IGNORE INTO Produk (nama, deskripsi, harga, stok, id_kategori, id_toko) VALUES
('Smartphone XYZ', 'Smartphone dengan fitur canggih', 3500000.00, 25, 1, 1),
('Kaos Polos Putih', 'Kaos katun nyaman dipakai', 50000.00, 100, 2, 2),
('Roti Coklat', 'Roti dengan isi coklat lumer', 15000.00, 50, 3, 3),
('Buku Pemrograman', 'Buku belajar coding untuk pemula', 120000.00, 30, 4, 4),
('Blender Serbaguna', 'Blender untuk jus dan bumbu', 300000.00, 15, 5, 1),
('Lipstik Matte', 'Lipstik tahan lama', 85000.00, 40, 6, 2),
('Kemeja Formal', 'Kemeja untuk acara formal', 200000.00, 35, 2, 2),
('Kue Bolu', 'Kue bolu lembut', 25000.00, 25, 3, 3),
('Novel Bestseller', 'Novel terlaris tahun ini', 95000.00, 20, 4, 4),
('Rice Cooker', 'Penanak nasi otomatis', 450000.00, 10, 5, 1);

-- Gunakan ON DUPLICATE KEY UPDATE untuk Transaksi
INSERT INTO Transaksi (id_transaksi, id_pelanggan, tanggal_transaksi, total_harga, status) VALUES
(1, 1, '2024-04-01 10:30:00', 3500000.00, 'Selesai'),
(2, 2, '2024-04-02 14:15:00', 50000.00, 'Selesai'),
(3, 3, '2024-04-03 09:45:00', 15000.00, 'Selesai'),
(4, 4, '2024-04-04 16:20:00', 120000.00, 'Diproses'),
(5, 5, '2024-04-05 11:05:00', 300000.00, 'Dikirim')
ON DUPLICATE KEY UPDATE 
    id_pelanggan = VALUES(id_pelanggan),
    tanggal_transaksi = VALUES(tanggal_transaksi),
    total_harga = VALUES(total_harga),
    status = VALUES(status);

-- Untuk Detail_Transaksi
INSERT INTO Detail_Transaksi (id_transaksi, id_produk, jumlah, harga_satuan, diskon_persen, subtotal) VALUES
(1, 1, 1, 3500000.00, 0, 3500000.00),
(2, 2, 1, 50000.00, 0, 50000.00),
(3, 3, 1, 15000.00, 0, 15000.00),
(4, 4, 1, 120000.00, 0, 120000.00),
(5, 5, 1, 300000.00, 0, 300000.00)
ON DUPLICATE KEY UPDATE
    jumlah = VALUES(jumlah),
    harga_satuan = VALUES(harga_satuan),
    diskon_persen = VALUES(diskon_persen),
    subtotal = VALUES(subtotal);

-- Untuk Ulasan
INSERT INTO Ulasan (id_pelanggan, id_produk, rating, komentar, tanggal_ulasan) VALUES
(1, 1, 5, 'Smartphone bagus, sangat puas dengan pembelian ini', '2024-04-10 13:20:00'),
(2, 2, 4, 'Kaos nyaman dipakai, kualitas bagus', '2024-04-11 15:45:00'),
(3, 3, 5, 'Roti enak dan coklat di dalamnya lumer', '2024-04-12 10:30:00'),
(4, 4, 4, 'Buku sangat informatif untuk pemula', '2024-04-13 14:15:00'),
(5, 5, 5, 'Blender sangat berguna dan multifungsi', '2024-04-14 09:45:00')
ON DUPLICATE KEY UPDATE
    rating = VALUES(rating),
    komentar = VALUES(komentar),
    tanggal_ulasan = VALUES(tanggal_ulasan);

-- Menampilkan semua data
SELECT * FROM Pelanggan;
SELECT * FROM Produk;
SELECT * FROM Kategori;
SELECT * FROM Transaksi;
SELECT * FROM Detail_Transaksi;
SELECT * FROM Toko;
SELECT * FROM Ulasan;