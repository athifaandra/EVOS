<div class="card card-info">
	<div class="card-header">
		<h3 class="card-title">
			<i class="fa fa-table"></i> Data Kandidat
		</h3>
	</div>
	<!-- /.card-header -->
	<div class="card-body">
		<div class="table-responsive">
			<div>
				<a href="?page=add-calon" class="btn btn-primary">
					<i class="fa fa-edit"></i> Tambah Data</a>
			</div>
			<br>
			<table id="example1" class="table table-bordered table-striped">
				<thead>
					<tr>
						<th>No Urut</th>
						<th>NIP BPS</th>
						<th>Nama Kandidat</th>
						<th>Jabatan</th>
						<th>Status</th>
						<th>Aksi</th>
					</tr>
				</thead>
				<tbody>

					<?php
					$no = 1;
					$sql = $koneksi->query("SELECT * FROM tb_calon ORDER BY nama_pegawai");
					while ($data = $sql->fetch_assoc()) {
					?>

						<tr>
							<td>
								<?php echo $no++; ?>
							</td>
							<td>
								<?php echo $data['nip_bps']; ?>
							</td>
							<td>
								<?php echo $data['nama_pegawai']; ?>
							</td>
							<td>
								<?php echo $data['jabatan']; ?>
							</td>
							<td>
								<?php $status = $data['status']; ?>
								<?php if ($status == '1') { ?>
									<span class="badge badge-success">Aktif</span>
								<?php } elseif ($status == '0') { ?>
									<span class="badge badge-danger">Inaktif</span>
								<?php } ?>
							</td>
							<td>
								<a href="?page=del-calon&kode=<?php echo $data['id_calon']; ?>" onclick="return confirm('Apakah anda yakin hapus data ini ?')" title="Hapus" class="btn btn-danger btn-sm">
									<i class="fa fa-trash"></i>
								</a>
							</td>
						</tr>

					<?php
					}
					?>
				</tbody>
			</table>
		</div>
	</div>
	<!-- /.card-body -->
	<script>
		$(document).ready(function() {

			$('#example1').DataTable({
				"dom": 'Bfrtip',
				"paging": true,
				"lengthChange": false,
				"searching": true,
				"ordering": true,
				"info": true,
				"autoWidth": false,
				"buttons": [
					'excelHtml5'
				]
			});

		});
	</script>
