<!-- Form untuk menampilkan daftar vote -->
<div class="form-group row">
    <div class="card-header">
        <h3 class="card-title">
            <i class="fa fa-fa-vote-yea"></i> Daftar Vote
        </h3>
        <?php
        $kode = isset($_GET['kode']) ? $_GET['kode'] : 0;
        ?>
        <select name="daftar_vote" id="daftar_vote" class="form-control" onchange="DaftarVote(this.value)">
            <option value="-1">- Pilih -</option>
            <?php
            $data_id = $_SESSION["ses_id"];
            $sql = "SELECT DISTINCT a.* FROM tb_daftarvote a
                    JOIN tb_votepemilih b ON a.daftarvote_id=b.daftarvote_id
                    WHERE a.flag_id=1 AND a.status_id='1' AND (NOW() BETWEEN tanggal_mulai AND tanggal_selesai)  
                    AND b.id_pemilih=" . $data_id;

            $row = $koneksi->query($sql);
            while ($data = $row->fetch_assoc()) {
                $selected = ($kode == $data['daftarvote_id']) ? "selected" : "";
                echo '<option value="' . $data['daftarvote_id'] . '" ' . $selected . '>' . $data['nama'] . '</option>';
            }
            ?>
        </select>

    </div>
</div>

<!-- JavaScript untuk mengatur waktu -->
<script>
    function DaftarVote(value) {
        var url = '?page=PsSQBpL&kode=' + value;
        window.location = url;
    }

    var countDownDate = new Date("<?php echo $waktu; ?>").getTime();
    var x = setInterval(function() {
        var now = new Date().getTime();
        var distance = countDownDate - now;
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
        document.getElementById("demo").innerHTML = "Sisa Waktu : " + days + " Hari " + hours + ":" +
            minutes + ":" + seconds;
        if (distance < 0) {
            clearInterval(x);
            document.getElementById("demo").innerHTML = "Waktu vote sudah habis!";
            $('#datacalon').hide();
        }
    }, 1000);
</script>

<!-- PHP untuk mengecek status pemilih dan menampilkan data calon -->
<?php
$_SESSION['URL'] = substr($_SERVER['REQUEST_URI'], strrpos($_SERVER['REQUEST_URI'], '/') + 1, strlen($_SERVER['REQUEST_URI']));
$sql = $koneksi->query("SELECT b.*, a.status_id FROM tb_votepemilih a 
                        JOIN tb_pengguna b ON a.id_pemilih=b.id_pengguna 
                        WHERE id_pengguna=" . $data_id . " AND daftarvote_id=" . $kode);
$rowcount = mysqli_num_rows($sql);
$status = 0;
if (($rowcount == 0) && ($kode != 0)) {
    $status = 0;
} else {
    while ($data = $sql->fetch_assoc()) {
        $status = $data['status_id'];
    }
}
?>

<!-- Switch untuk menampilkan data calon sesuai status pemilih -->
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
                            echo '</tr>';
                        }
                        echo '</tbody>';
                        echo '</table>';
                        // Tampilkan tombol submit
                        echo '<button type="submit" class="btn btn-primary">Submit</button>';
                        echo '</form>';
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

    case '2': { ?>
        <div class="alert alert-info alert-default-dark">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
            <h4>
                <i class="icon fas fa-info"></i>Info
            </h4>
            <h3>Anda sudah menggunakan Hak Suara dengan baik, Terimakasih.</h3>
        </div>
    <?php
        break;
    }
    case '-1': { ?>
        <div class="alert alert-info alert-primary">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
            <h4>
                <i class="icon fas fa-info"></i>Info
            </h4>
            <h3>Pilih daftar vote terlebih dahulu! Terimakasih.</h3>
        </div>
    <?php
        break;
    }
}
?>