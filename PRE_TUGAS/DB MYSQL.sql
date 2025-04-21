CREATE TABLE kategori (
    id_kategori INT PRIMARY KEY AUTO_INCREMENT,
    nama_kategori VARCHAR(100)
);

CREATE TABLE toko (
    id_toko INT PRIMARY KEY AUTO_INCREMENT,
    nama_toko VARCHAR(100)
);

CREATE TABLE produk (
    id_produk INT PRIMARY KEY AUTO_INCREMENT,
    nama VARCHAR(255),
    deskripsi TEXT,
    harga FLOAT,
    id_toko INT,
    id_kategori INT,
    FOREIGN KEY (id_toko) REFERENCES toko(id_toko),
    FOREIGN KEY (id_kategori) REFERENCES kategori(id_kategori)
);

CREATE TABLE pelanggan (
    id_pelanggan INT PRIMARY KEY AUTO_INCREMENT,
    nama VARCHAR(100),
    no_telp VARCHAR(20),
    email VARCHAR(100),
    alamat VARCHAR(255),
    password VARCHAR(100)
);

CREATE TABLE membeli (
    id_pelanggan INT,
    id_produk INT,
    PRIMARY KEY (id_pelanggan, id_produk),
    FOREIGN KEY (id_pelanggan) REFERENCES pelanggan(id_pelanggan),
    FOREIGN KEY (id_produk) REFERENCES produk(id_produk)
);

CREATE TABLE mengulas (
    id_pelanggan INT,
    id_produk INT,
    ulasan TEXT,
    PRIMARY KEY (id_pelanggan, id_produk),
    FOREIGN KEY (id_pelanggan) REFERENCES pelanggan(id_pelanggan),
    FOREIGN KEY (id_produk) REFERENCES produk(id_produk)
);