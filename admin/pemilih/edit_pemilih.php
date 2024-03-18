<?php

    if(isset($_GET['kode'])){
        $sql_cek = "SELECT * FROM tb_pengguna WHERE id_pengguna='".$_GET['kode']."'";
        $query_cek = mysqli_query($koneksi, $sql_cek);
        $data_cek = mysqli_fetch_array($query_cek,MYSQLI_BOTH);
    }
?>

<div class="card card-success">
	<div class="card-header">
		<h3 class="card-title">
			<i class="fa fa-edit"></i> Ubah Data</h3>
	</div>
	<form action="" method="post" enctype="multipart/form-data">
		<div class="card-body">

			<input type='hidden' class="form-control" name="id_pengguna" value="<?php echo $data_cek['id_pengguna']; ?>"
			 readonly/>

             <div class="form-group row">
                <label class="col-sm-2 col-form-label">NIP Pegawai</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" id="nip_pegawai" name="nip_pegawai" value="<?php echo $data_cek['nip_pegawai']; ?>" readonly/>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">NIP BPS</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" id="nip_bps" name="nip_bps" value="<?php echo $data_cek['nip_bps']; ?>" readonly/>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Nama Pegawai</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" id="nama_pegawai" name="nama_pegawai" value="<?php echo $data_cek['nama_pegawai']; ?>" />
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Kode ORG</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" id="kode_org" name="kode_org" value="<?php echo $data_cek['kode_org']; ?>" />
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Pangkat/Gol Ruang</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" id="pangkat" name="pangkat" value="<?php echo $data_cek['pangkat']; ?>" />
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Jabatan</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" id="jabatan" name="jabatan" value="<?php echo $data_cek['jabatan']; ?>" />
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Level</label>
                <div class="col-sm-6">
                    <select class="form-control" id="level" name="level" required>
                        <option value="">Pilih Level</option>
                        <option value="administrator" <?php if($data_cek['level'] == "administrator") echo "selected"; ?>>Administrator</option>
                        <option value="pemilih" <?php if($data_cek['level'] == "pemilih") echo "selected"; ?>>Pemilih</option>
                    </select>
                </div>
            </div>


		</div>
		<div class="card-footer">
			<input type="submit" name="Ubah" value="Simpan" class="btn btn-success">
			<a href="?page=data-pemilih" title="Kembali" class="btn btn-secondary">Batal</a>
		</div>
	</form>
</div>



<?php

    if (isset ($_POST['Ubah'])){
    $sql_ubah = "UPDATE tb_pengguna SET
        nama_pegawai='".$_POST['nama_pegawai']."',
        username='".$_POST['username']."',
        password='".$_POST['password']."',
        nip_pegawai='".$_POST['nip_pegawai']."',
        nip_bps='".$_POST['nip_bps']."',
        kode_org='".$_POST['kode_org']."',
        pangkat='".$_POST['pangkat']."',
        jabatan='".$_POST['jabatan']."',
        level='".$_POST['level']."'
        WHERE id_pengguna='".$_POST['id_pengguna']."'";
    $query_ubah = mysqli_query($koneksi, $sql_ubah);
    mysqli_close($koneksi);

    if ($query_ubah) {
        echo "<script>
      Swal.fire({title: 'Ubah Data Berhasil',text: '',icon: 'success',confirmButtonText: 'OK'
      }).then((result) => {if (result.value)
        {window.location = 'index.php?page=data-pemilih';
        }
      })</script>";
      }else{
      echo "<script>
      Swal.fire({title: 'Ubah Data Gagal',text: '',icon: 'error',confirmButtonText: 'OK'
      }).then((result) => {if (result.value)
        {window.location = 'index.php?page=data-pemilih';
        }
      })</script>";
    }}
?>

<script type="text/javascript">
    function change()
    {
    var x = document.getElementById('pass').type;

    if (x == 'password')
    {
        document.getElementById('pass').type = 'text';
        document.getElementById('mybutton').innerHTML;
    }
    else
    {
        document.getElementById('pass').type = 'password';
        document.getElementById('mybutton').innerHTML;
    }
    }
</script>