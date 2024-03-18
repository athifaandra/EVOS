<?php
$kode = isset($_GET['kode']) ? $_GET['kode'] : 0;
include dirname(__FILE__) . '/../../inc/koneksi.php';

// Proses penambahan calon
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (isset($_POST['tambah_calon'])) {
        $id_pengguna = $_POST['id_pengguna'];
        tambahCalon($id_pengguna, $kode, $koneksi);
    } elseif (isset($_POST['tambah_semua_calon'])) {
        tambahSemuaCalon($kode, $koneksi);
    }
}

function tambahCalon($id_pengguna, $kode, $koneksi) {
    // Ambil data pengguna yang akan ditambahkan sebagai calon
    $query_pengguna = "SELECT * FROM tb_pengguna WHERE id_pengguna = $id_pengguna";
    $result_pengguna = mysqli_query($koneksi, $query_pengguna);

    if ($result_pengguna && mysqli_num_rows($result_pengguna) > 0) {
        $data_pengguna = mysqli_fetch_assoc($result_pengguna);
        $nama_calon = $data_pengguna['nama_pegawai'];
        $nip_bps = $data_pengguna['nip_bps'];
        $jabatan = $data_pengguna['jabatan'];

        // Pastikan nama calon belum ada dalam daftar calon
        $query_check_existing_candidate = "SELECT id_calon FROM tb_calon WHERE nama_pegawai = '$nama_calon' AND id_calon = $kode";
        $result_check_existing_candidate = mysqli_query($koneksi, $query_check_existing_candidate);

        if ($result_check_existing_candidate && mysqli_num_rows($result_check_existing_candidate) == 0) {
            // Lakukan penambahan kandidat ke dalam tabel calon
            $sql = "INSERT INTO tb_calon (id_calon, id_pengguna, nip_bps, nama_pegawai, jabatan, status) 
            VALUES ('$kode', '$id_pengguna', '$nip_bps', '$nama_calon', '$jabatan', '1')";
            $query = mysqli_query($koneksi, $sql);

            // Berikan respons
            if ($query) {
                // Set status secara otomatis menjadi 'Aktif' saat menambahkan data baru
                $sql_update_status = "UPDATE tb_calon SET status = '1' WHERE id_calon = '$kode'";
                $query_update_status = mysqli_query($koneksi, $sql_update_status);
                if (!$query_update_status) {
                    // Jika gagal mengatur status, tampilkan pesan kesalahan
                    $message .= " Gagal mengatur status: " . mysqli_error($koneksi);
                }

                $message = "Data berhasil ditambahkan.";
                echo "<script>alert('$message'); window.location.href = 'index.php?page=data-calon&kode=$kode';</script>";
            } else {
                $message = "Gagal menambahkan data: " . mysqli_error($koneksi);
                echo "<script>alert('$message');</script>";
            }
        } else {
            $message = "Kandidat dengan nama yang sama sudah ada.";
            echo "<script>alert('$message');</script>";
        }
    } else {
        $message = "Data pengguna tidak ditemukan.";
        echo "<script>alert('$message');</script>";
    }
}

function tambahSemuaCalon($kode, $koneksi) {
    $query = "SELECT id_pengguna FROM tb_pengguna WHERE status='1' AND level = 'Pemilih' 
              AND id_pengguna NOT IN (SELECT id_pengguna FROM tb_calon WHERE id_calon = $kode)
              AND id_pengguna NOT IN (SELECT id_pengguna FROM tb_calon WHERE id_calon <> $kode)";
    $sql = mysqli_query($koneksi, $query);

    if ($sql && mysqli_num_rows($sql) > 0) {
        while ($data = mysqli_fetch_assoc($sql)) {
            tambahCalon($data['id_pengguna'], $kode, $koneksi);
        }
    } else {
        $message = "Data tidak ditemukan";
        echo "<script>alert('$message');</script>";
    }
}

function hapusSemuaCalon($kode, $koneksi) {
    $query = "DELETE FROM tb_calon WHERE id_calon = $kode";
    $result = mysqli_query($koneksi, $query);

    if ($result) {
        $message = "Semua data berhasil dihapus.";
    } else {
        $message = "Gagal menghapus data: " . mysqli_error($koneksi);
    }
    echo "<script>alert('$message'); window.location.href = 'index.php?page=data-calon&kode=$kode';</script>";
}
?>

<div class="card card-primary">
    <div class="modal-content">
        <div class="modal-header">
            <h5 class="modal-title">Daftar Kandidat (Calon)</h5>
        </div>
        <div class="modal-body">
            <div>
                <form method="post">
                    <input type="hidden" name="kode" value="<?php echo $kode ?>">
                    <button type="submit" name="tambah_semua_calon" class="btn btn-primary">
                        Tambah Semua Data
                    </button>
                </form>
            </div>
            <table id="example4" class="table table-bordered table-striped">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Nama Kandidat</th>
                        <th>NIP BPS</th>
                        <th>Jabatan</th>
                        <th>Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    $no = 1;
                    $query = "SELECT id_pengguna, nama_pegawai, nip_bps, jabatan, status 
                              FROM tb_pengguna 
                              WHERE status='1' 
                              AND level = 'Pemilih' 
                              AND id_pengguna NOT IN (SELECT id_pengguna FROM tb_calon WHERE id_calon = $kode)
                              AND id_pengguna NOT IN (SELECT id_pengguna FROM tb_calon WHERE id_calon <> $kode)";
                    $sql = mysqli_query($koneksi, $query);
                    if ($sql && mysqli_num_rows($sql) > 0) {
                        while ($data = mysqli_fetch_assoc($sql)) {
                    ?>
                            <tr>
                                <td><?php echo $no++; ?></td>
                                <td><?php echo $data['nama_pegawai']; ?></td>
                                <td><?php echo $data['nip_bps']; ?></td>
                                <td><?php echo $data['jabatan']; ?></td>
                                <td>
                                    <form method="post" action="">
                                        <input type="hidden" name="id_pengguna" value="<?php echo $data['id_pengguna']; ?>">
                                        <button type="submit" name="tambah_calon" class="btn btn-success btn-sm">Tambah</button>
                                    </form>
                                </td>
                            </tr>
                    <?php
                        }
                    } else {
                        echo "<tr><td colspan='5'>Data tidak ditemukan</td></tr>";
                    }
                    ?>
                </tbody>
            </table>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-secondary" onclick="TutupKandidat(<?php echo $kode ?>)" data-dismiss="modal">Kembali</button>
        </div>
    </div>
</div>

<script>
    function TutupKandidat(value) {
        window.location = 'index.php?page=data-calon&kode=' + value;
    }
</script>
