<div class="card card-info">
	<div class="card-header">
		<h3 class="card-title">
			<i class="fa fa-table"></i> Kotak Suara
		</h3>
	</div>
	<?php

	if (isset($_GET['kode'])) {
		$kode = $_GET['kode'];
	} else {
		$kode = 0;
	}
	?>
	<div class="form-group row">
		<div class="card-header">
			<h3 class="card-title">
				<i class="fa fa-fa-vote-yea"></i> Daftar Vote
			</h3>


			<select name="daftar_vote" id="daftar_vote" class="form-control" onchange="DaftarVote(this.value)">
				<option value="0">- Pilih -</option>
				<?php
				$sql = "select * from tb_daftarvote where status_id='1' and flag_id=1";
				$row = $koneksi->query($sql);
				//echo $kode;
				while ($data = $row->fetch_assoc()) {
					//$id = $data['daftarvote_id'];
					//	echo '<p>data id=' . $id . '</p>';
					//	echo '<p>data kode=' . $kode . '</p>';
					if ($kode != $data['daftarvote_id']) {
						$selected = "";
					} else {
						$selected = "selected";
					}
					echo '<option value="' . $data['daftarvote_id'] . '" ' . $selected . '>' . $data['nama'] . '</option>';
				}
				?>
			</select>

		</div>
	</div>

	<!-- /.card-header -->
	<div class="card-body">
		<div class="table-responsive">
			<table id="data_kotak" class="table table-bordered table-striped">
				<thead>
					<tr>
						<th>No</th>
						<th>NIP BPS</th>
						<th>Nama Pemilih</th>
						<th>Username</th>
						<th>Waktu Memilih</th>
					</tr>
				</thead>
				<tbody>
					<?php
					$no = 1;
					// Eksekusi query dengan penanganan kesalahan
					$sql = $koneksi->query("SELECT `a`.`id_vote` AS `id_vote`,`a`.`daftarvote_id` AS `daftarvote_id`,
						`a`.`id_calon` AS `id_calon`,`a`.`id_pemilih` AS `id_pemilih`,`a`.`date` AS `date`,
						`b`.`nama_pegawai` AS `nama_pegawai`,
						`c`.`nama_pegawai` AS `nama_pegawai`, c.username, c.nip_bps
						FROM `tb_vote` `a` JOIN `tb_calon` `b` ON `a`.`id_calon` = `b`.`id_calon`
						JOIN `tb_pengguna` `c` ON `a`.`id_pemilih` = `c`.`id_pengguna` 
						WHERE a.daftarvote_id=" .  $kode . " ORDER BY a.date DESC, b.nama_pegawai");

					// Periksa apakah query berhasil dieksekusi
					if ($sql) {
						// Loop melalui hasil query
						while ($data = $sql->fetch_assoc()) {
					?>
							<tr>
								<td><?php echo $no++; ?></td>
								<td><?php echo $data['nip_bps']; ?></td>
								<td><?php echo $data['nama_pegawai']; ?></td>
								<td><?php echo $data['username']; ?></td>
								<td><?php echo $data['date']; ?></td>
							</tr>
					<?php
						}
					} else {
						// Jika query gagal, tampilkan pesan kesalahan
						echo '<tr><td colspan="4">Tidak ada data yang tersedia.</td></tr>';
					}
					?>
				</tbody>
			</table>
		</div>
	</div>
	<!-- /.card-body -->
	<script>
		function DaftarVote(value) {
			var url = '?page=data-kotak&kode=' + value;
			window.location = url;
		}
	</script>
