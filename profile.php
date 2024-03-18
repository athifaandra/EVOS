<?php
// Periksa apakah sesi sudah dimulai sebelumnya
if (session_status() == PHP_SESSION_NONE) {
    // Jika tidak, mulai sesi
    session_start();
}

// Periksa apakah pengguna sudah login
if (!isset($_SESSION["ses_username"]) || empty($_SESSION["ses_username"])) {
    // Jika tidak, arahkan ke halaman login
    header("location: login.php");
    exit; // Pastikan tidak ada kode lain yang dijalankan setelah ini
}

// Jika pengguna sudah login, dapatkan data pengguna dari sesi
$data_id = $_SESSION["ses_id"];
$data_nama = $_SESSION["ses_nama"];
$data_user = $_SESSION["ses_username"];
$data_level = $_SESSION["ses_level"];

// KONEKSI DB
include "inc/koneksi.php";

// Proses jika tombol "Simpan" ditekan
if(isset($_POST['simpan'])) {
    $nama_pegawai = $_POST['nama_pegawai'];
    $username = $_POST['username'];
    $password = $_POST['password'];
    $new_password = $_POST['new_password']; // Tambahkan ini

    // Periksa apakah password baru disediakan
    if (!empty($new_password)) {
        // Jika ada, gunakan password baru
        $password = $new_password;
    }

    // Query untuk mengupdate data pengguna
    $update_sql = "UPDATE tb_pengguna SET nama_pegawai='$nama_pegawai', username='$username', password='$password' WHERE id_pengguna = $data_id";
    $update_result = mysqli_query($koneksi, $update_sql);

    if($update_result) {
        echo "<script>alert('Data pegawai berhasil diperbarui');</script>";
    } else {
        echo "<script>alert('Gagal memperbarui data pegawai');</script>";
    }
}

// Query untuk mendapatkan data pengguna
$sql = "SELECT * FROM tb_pengguna WHERE id_pengguna = $data_id";
$result = mysqli_query($koneksi, $sql);
$row = mysqli_fetch_assoc($result);
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile</title>
    <style>
        .profile-form {
            max-width: 400px;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #f9f9f9;
        }

        .profile-form label {
            display: block;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .profile-form input[type="text"],
        .profile-form input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        .profile-form input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #4caf50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .profile-form input[type="submit"]:hover {
            background-color: #45a049;
        }

        /* Tambahkan CSS untuk ikon yang akan ditambahkan */
        .profile-form .eye-icon {
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
        }
    </style>
</head>

<body>
    <h1>Profil Pengguna</h1>
    <form class="profile-form" method="post">
        <label for="nama_pegawai">Nama Pengguna:</label>
        <input type="text" id="nama_pegawai" name="nama_pegawai" value="<?php echo $row['nama_pegawai']; ?>">

        <label for="username">Username:</label>
        <input type="text" id="username" name="username" value="<?php echo $row['username']; ?>">

        <label for="password">Password Lama:</label>
        <div style="position: relative;">
            <input type="password" id="password" name="password" value="<?php echo $row['password']; ?>">
            <input id="mybutton" type="checkbox" class="form-checkbox" onclick="togglePassword('password')"> Lihat Password
        </div>

        <label for="new_password">Password Baru:</label>
        <input type="password" id="new_password" name="new_password">

        <input type="submit" name="simpan" value="Simpan">
    </form>

    <!-- Tambahkan script JavaScript untuk mengatur fungsi togglePassword -->
    <script>
        function togglePassword(inputId) {
            var passwordField = document.getElementById(inputId);
            var eyeIcon = passwordField.parentElement.querySelector('.eye-icon');

            if (passwordField.type === "password") {
                passwordField.type = "text";
            } else {
                passwordField.type = "password";
            }
        }
    </script>

</body>

</html>
