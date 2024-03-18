<?php
if (isset($_GET['kode'])) {
    $id_calon = $_GET['kode'];

    // Hapus data dari database
    $sql_hapus = "DELETE FROM tb_calon WHERE id_calon='$id_calon'";
    $query_hapus = mysqli_query($koneksi, $sql_hapus);

    if ($query_hapus) {
        // Jika penghapusan berhasil, kirimkan respons ke browser
        echo "<script>
            Swal.fire({
                title: 'Hapus Data Berhasil',
                text: '',
                icon: 'success',
                confirmButtonText: 'OK'
            }).then((result) => {
                if (result.value) {
                    // Redirect ke halaman data-calon setelah menekan tombol OK
                    window.location = 'index.php?page=data-calon';
                }
            });
        </script>";
    } else {
        // Jika penghapusan gagal, kirimkan respons ke browser
        echo "<script>
            Swal.fire({
                title: 'Hapus Data Gagal',
                text: '',
                icon: 'error',
                confirmButtonText: 'OK'
            }).then((result) => {
                if (result.value) {
                    // Redirect ke halaman data-calon setelah menekan tombol OK
                    window.location = 'index.php?page=data-calon';
                }
            });
        </script>";
    }
}
?>
