<?php
if (isset($_GET['kode'])) {
    $kode = $_GET['kode'];
    $sql_hapus = "DELETE FROM tb_pengguna WHERE id_pengguna='$kode'";
    $query_hapus = mysqli_query($koneksi, $sql_hapus);

    if ($query_hapus) {
        // Hapus data berhasil, arahkan kembali ke halaman yang sama
        echo "<script>
                Swal.fire({title: 'Hapus Data Berhasil',text: '',icon: 'success',confirmButtonText: 'OK'
                }).then((result) => {
                    if (result.value) {
                        window.location = 'index.php?page=data-pemilih';
                    }
                })</script>";
    } else {
        // Gagal menghapus data
        echo "<script>
                Swal.fire({title: 'Hapus Data Gagal',text: '',icon: 'error',confirmButtonText: 'OK'
                }).then((result) => {
                    if (result.value) {
                        window.location = 'index.php?page=data-pemilih';
                    }
                })</script>";
    }
}
