<?php
// Fungsi untuk menghasilkan password berdasarkan username
function generatePassword($username) {
    $password = $username . "_bps12345"; // Menggabungkan username dengan kata tambahan "_bps12345"
    return $password;
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Pastikan untuk melakukan validasi pada data yang dimasukkan sebelum menyimpannya ke database
    
    // Buat password berdasarkan username
    $password = generatePassword($_POST['username']);

    // Melanjutkan proses penyimpanan data ke database tanpa hash password
    $sql_simpan = "INSERT INTO tb_pengguna (nip_pegawai, nip_bps, nama_pegawai, kode_org, pangkat, jabatan, username, password, level, status, jenis) VALUES (
        '" . $_POST['nip_pegawai'] . "',
        '" . $_POST['nip_bps'] . "',
        '" . $_POST['nama_pegawai'] . "',
        '" . $_POST['kode_org'] . "',
        '" . $_POST['pangkat'] . "',
        '" . $_POST['jabatan'] . "',
        '" . $_POST['username'] . "',
        '" . $password . "', 
        '" . $_POST['level'] . "',
        '1',
        'PST')";
    $query_simpan = mysqli_query($koneksi, $sql_simpan);

    if ($query_simpan) {
        echo "<script>
      Swal.fire({title: 'Tambah Data Berhasil',text: '',icon: 'success',confirmButtonText: 'OK'
      }).then((result) => {if (result.value){
          window.location = 'index.php?page=data-pemilih';
          }
      })</script>";
    } else {
        //$err =  mysqli_error($koneksi);
        //$errstr = 'Tambah Data Gagal' . $err;
        echo "<script>
      Swal.fire({title: 'Tambah Data Gagal',text: '',icon: 'error',confirmButtonText: 'OK'
      }).then((result) => {if (result.value){
          window.location = 'index.php?page=add-pemilih';
          }
      })</script>";
    }
    mysqli_close($koneksi);
}
?>

<div class="card card-primary">
    <div class="card-header">
        <h3 class="card-title">
            <i class="fa fa-edit"></i> Tambah Data
        </h3>
    </div>
    <form action="" method="post" enctype="multipart/form-data">
        <div class="card-body">

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">NIP Pegawai</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" id="nip_pegawai" name="nip_pegawai" placeholder="NIP Pegawai" required>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">NIP BPS</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" id="nip_bps" name="nip_bps" placeholder="NIP BPS" required>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Nama Pegawai</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" id="nama_pegawai" name="nama_pegawai" placeholder="Nama Pegawai" required>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Kode Org</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" id="kode_org" name="kode_org" placeholder="Kode Org" required>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Pangkat/Gol Ruang</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" id="pangkat" name="pangkat" placeholder="Pangkat/Gol Ruang" required>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Jabatan</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" id="jabatan" name="jabatan" placeholder="Jabatan" required>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Username</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" id="username" name="username" placeholder="Username" required>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Level</label>
                <div class="col-sm-6">
                    <select class="form-control" id="level" name="level" required>
                        <option value="">Pilih Level</option>
                        <option value="administrator">Administrator</option>
                        <option value="pemilih">Pemilih</option>
                    </select>
                </div>
            </div>


        </div>
        <div class="card-footer">
            <input type="submit" name="Simpan" value="Simpan" class="btn btn-info">
            <a href="index.php?page=data-pemilih" title="Kembali" class="btn btn-secondary">Batal</a>
        </div>
    </form>
</div>
