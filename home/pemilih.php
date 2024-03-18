<div class="form-group row">
	<div class="card-header">
		<h3 class="card-title">
			<i class="fa fa-fa-vote-yea"></i> Daftar Vote
		</h3>
		<?php
		if (isset($_GET['kode'])) {
			$kode = $_GET['kode'];
		} else {
			$kode = 0;
			$waktu = 0;
		}
		?>
		<select name="daftar_vote" id="daftar_vote" class="form-control" onchange="DaftarVote(this.value)">
			<option value="0">- Pilih -</option>
			<?php
			$data_id = $_SESSION["ses_id"];
			$sql = "select distinct a.* from tb_daftarvote a
			join tb_votepemilih b on a.daftarvote_id=b.daftarvote_id
			where a.flag_id=1 and a.status_id='1' and 
			(now() between tanggal_mulai and tanggal_selesai) and b.id_pemilih=" . $data_id;
			//echo $sql;
			$row = $koneksi->query($sql);
			//echo $kode;
			while ($data = $row->fetch_assoc()) {
				//$id = $data['daftarvote_id'];
				//	echo '<p>data id=' . $id . '</p>';
				//	echo '<p>data kode=' . $kode . '</p>';
				if ($kode != $data['daftarvote_id']) {
					$selected = "";
					$waktu = 0;
				} else {
					$selected = "selected";
					//	$waktu = $data['tanggal_selesai'];
				}
				$waktu = $data['tanggal_selesai'];
				echo '<option value="' . $data['daftarvote_id'] . '" ' . $selected . '>' . $data['nama'] . '</option>';
			}
			?>
		</select>

	</div>
</div>
<script>
	function DaftarVote(value) {
		var url = '?page=pemilih&kode=' + value;
		//alert(url);
		window.location = url;
	}
	// Set the date we're counting down to

	var countDownDate = new Date("<?php echo $waktu; ?>").getTime();
	// Update the count down every 1 second
	var x = setInterval(function() {
		// Get today's date and time
		var now = new Date().getTime();
		// Find the distance between now and the count down date
		var distance = countDownDate - now;

		// Time calculations for days, hours, minutes and seconds
		var days = Math.floor(distance / (1000 * 60 * 60 * 24));
		var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
		var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
		var seconds = Math.floor((distance % (1000 * 60)) / 1000);
		if (hours < 10) {
			hours = '0' + hours;
		}
		if (minutes < 10) {
			minutes = '0' + minutes;
		}
		if (seconds < 10) {
			seconds = '0' + seconds;
		}

		// Display the result in the element with id="demo"
		document.getElementById("demo").innerHTML = "Sisa Waktu : " + days + " Hari " + hours + ":" +
			minutes + ":" + seconds;

		// If the count down is finished, write some text
		if (distance < 0) {
			clearInterval(x);
			document.getElementById("demo").innerHTML = "Waktu vote sudah habis!";
			$('#datacalon').hide();
		}
	}, 1000);
</script>
<?php
$_SESSION['URL'] = substr($_SERVER['REQUEST_URI'], strrpos($_SERVER['REQUEST_URI'], '/') + 1, strlen($_SERVER['REQUEST_URI']));
$sql = $koneksi->query("select b.*, a.status_id from tb_votepemilih a 
	join tb_pengguna b on a.id_pemilih=b.id_pengguna 
	where id_pengguna=" . $data_id . " and daftarvote_id=" . $kode);
$rowcount = mysqli_num_rows($sql);
//echo $rowcount;
$status = 0;
if (($rowcount == 0) && ($kode != 0)) {
	$status = 0;
} else {
	while ($data = $sql->fetch_assoc()) {
		$status = $data['status_id'];
	}
}
?>

<?php switch ($status) {
    case '1': ?>
        <div class="col-12">
            <div class="card-header">
                <h3 class="card-title">
                    <i class="fa fa-fa-vote-yea">
                        <div id="demo" style="text-align: center; font-size: 40px; "></div>
                    </i>
                </h3>
            </div>
        </div>
        <div id="datacalon">
            <div class="row">
                <tbody>
                    <?php
                    $sql = $koneksi->query("SELECT a.*, b.no_urut, b.daftarvote_id FROM tb_calon a 
                                            JOIN tb_votekandidat b ON a.id_calon=b.id_calon 
                                            WHERE b.flag_id<>9 AND daftarvote_id=" . $kode);
                    $jumlah = mysqli_num_rows($sql);
                    if ($jumlah > 0) {
                        echo '<table class="table">';
                        echo '<thead><tr><th>No Urut</th><th>NIP BPS</th><th>Nama Pegawai</th><th>Action</th></tr></thead>';
                        echo '<tbody>';
                        while ($data = $sql->fetch_assoc()) {
                            echo '<tr>';
                            echo '<td>' . $data['no_urut'] . '</td>';
                            echo '<td>' . $data['nip_bps'] . '</td>';
                            echo '<td>' . $data['nama_pegawai'] . '</td>';
                            echo '<td><a href="?page=PsSQBpL&kode=' . $data['id_calon'] . '&id=' . $data['daftarvote_id'] . '" class="btn btn-primary"><i class="fa fa-edit"></i> Pilih</a></td>';
                            echo '</tr>';
                        }
                        echo '</tbody>';
                        echo '</table>';
                    } else {
                        echo '<div class="alert alert-info alert-warning">';
                        echo '<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>';
                        echo '<h4><i class="icon fas fa-info"></i>Info</h4>';
                        echo '<h3>Belum ada data calon. Silahkan masukan data calon terlebih dahulu!</h3>';
                        echo '</div>';
                    }
                    ?>
                </tbody>
            </div>
        </div>
	<?php
		break;
	case '2': ?>

		<div class="alert alert-info alert-default-dark">
			<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
			<h4>
				<i class="icon fas fa-info"></i>Info
			</h4>
			<h3>Anda sudah menggunakan Hak Suara dengan baik, Terimakasih.</h3>
		</div>
	<?php
		break;
	case '0': ?>

		<div class="alert alert-info alert-primary">
			<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
			<h4>
				<i class="icon fas fa-info"></i>Info
			</h4>
			<h3>Pilih daftar vote terlebih dahulu! Terimakasih.</h3>
		</div>

	<?php
		break;
	default:
	?>
		<div class="alert alert-info alert-danger">
			<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
			<h4>
				<i class="icon fas fa-danger"></i>Info
			</h4>
			<h3>Anda tidak berhak menggunakan Hak Suara untuk vote ini! Terimakasih.</h3>
		</div>
<?php
		break;
}
