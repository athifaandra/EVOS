<?php
if (isset($_GET['kode'])) {
    $id_daftar_vote = $_GET['kode'];
    
    // Hapus data daftar vote dari database
    $sql_hapus = "DELETE FROM tb_daftarvote WHERE daftarvote_id = $id_daftar_vote";
    $query_hapus = mysqli_query($koneksi, $sql_hapus);

    if ($query_hapus) {
        echo "<script>
                Swal.fire({title: 'Hapus Data Berhasil', text: '', icon: 'success', confirmButtonText: 'OK'
                }).then((result) => {
                    if (result.value) {
                        window.location = 'index.php?page=data-daftarvote';
                    }
                })</script>";
    } else {
        echo "<script>
                Swal.fire({title: 'Hapus Data Gagal', text: '', icon: 'error', confirmButtonText: 'OK'
                }).then((result) => {
                    if (result.value) {
                        window.location = 'index.php?page=data-daftarvote';
                    }
                })</script>";
    }
}