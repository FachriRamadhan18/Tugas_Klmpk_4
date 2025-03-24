# 1. Login
```php
<?php

session_start();

  

$servername = "localhost";

$username = "root";

$password = "";

$database = "event_sekolah";

  

$conn = new mysqli($servername, $username, $password, $database);

if ($conn->connect_error) {

    die("Koneksi gagal: " . $conn->connect_error);

}

  

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $username = $_POST['username'];

    $password = $_POST['password'];

  

    $sql = "SELECT * FROM user WHERE username='$username' AND password='$password'";

    $result = $conn->query($sql);

  

    if ($result->num_rows > 0) {

        $user = $result->fetch_assoc();

        $_SESSION['username'] = $user['username'];

        $_SESSION['role'] = $user['role'];

        header("Location: dashboard.php");

    } else {

        echo "Login gagal!";

    }

}

?>

  

<!DOCTYPE html>

<html>

<head>

    <title>Login</title>

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">

    <style>

        /* General Styles */

        body {

            font-family: 'Poppins', sans-serif;

            background: linear-gradient(135deg, #6a11cb, #2575fc);

            display: flex;

            justify-content: center;

            align-items: center;

            height: 100vh;

            margin: 0;

            color: #fff;

            overflow: hidden;

        }

  

        /* Background Animation */

        body::before {

            content: '';

            position: absolute;

            width: 200%;

            height: 200%;

            background: radial-gradient(circle, rgba(255, 255, 255, 0.1) 10%, transparent 10.01%);

            background-size: 20px 20px;

            animation: moveBackground 10s linear infinite;

            z-index: -1;

        }

  

        @keyframes moveBackground {

            from {

                transform: translate(0, 0);

            }

            to {

                transform: translate(-50%, -50%);

            }

        }

  

        /* Container for the Login Form */

        .login-container {

            background: rgba(255, 255, 255, 0.1);

            backdrop-filter: blur(10px);

            border: 1px solid rgba(255, 255, 255, 0.2);

            padding: 40px;

            border-radius: 20px;

            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);

            width: 100%;

            max-width: 400px;

            text-align: center;

            animation: fadeIn 1s ease-in-out;

            position: relative;

            overflow: hidden;

        }

  

        /* Glassmorphism Effect */

        .login-container::before {

            content: '';

            position: absolute;

            top: -50%;

            left: -50%;

            width: 200%;

            height: 200%;

            background: linear-gradient(45deg, rgba(255, 255, 255, 0.1), rgba(255, 255, 255, 0.05));

            transform: rotate(45deg);

            z-index: -1;

        }

  

        /* Title */

        h2 {

            margin-bottom: 20px;

            font-size: 2rem;

            color: #fff;

            font-weight: 600;

        }

  

        /* Input Fields */

        input[type="text"], input[type="password"] {

            width: 100%;

            padding: 12px;

            margin: 10px 0;

            border: 1px solid rgba(255, 255, 255, 0.3);

            border-radius: 8px;

            font-size: 1rem;

            outline: none;

            background: rgba(255, 255, 255, 0.1);

            color: #fff;

            transition: all 0.3s ease;

        }

  

        input[type="text"]::placeholder, input[type="password"]::placeholder {

            color: rgba(255, 255, 255, 0.7);

        }

  

        input[type="text"]:focus, input[type="password"]:focus {

            border-color: rgba(255, 255, 255, 0.7);

            background: rgba(255, 255, 255, 0.2);

        }

  

        /* Button */

        button {

            width: 100%;

            padding: 12px;

            background: linear-gradient(135deg, #6a11cb, #2575fc);

            color: white;

            border: none;

            border-radius: 8px;

            font-size: 1rem;

            cursor: pointer;

            transition: all 0.3s ease;

            margin-top: 10px;

        }

  

        button:hover {

            background: linear-gradient(135deg, #2575fc, #6a11cb);

            transform: translateY(-2px);

            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);

        }

  

        /* Error Message */

        .error-message {

            color: #ff4d4d;

            margin-top: 10px;

            font-size: 0.9rem;

        }

  

        /* Animation */

        @keyframes fadeIn {

            from {

                opacity: 0;

                transform: translateY(-20px);

            }

            to {

                opacity: 1;

                transform: translateY(0);

            }

        }

  

        /* Responsive Design */

        @media (max-width: 480px) {

            .login-container {

                padding: 20px;

            }

  

            h2 {

                font-size: 1.5rem;

            }

  

            input[type="text"], input[type="password"], button {

                padding: 10px;

                font-size: 0.9rem;

            }

        }

    </style>

</head>

<body>

    <div class="login-container">

        <h2>Login</h2>

        <form method="POST" action="">

            <input type="text" name="username" placeholder="Username" required>

            <input type="password" name="password" placeholder="Password" required>

            <button type="submit">Login</button>

        </form>

        <?php if (isset($error_message)) : ?>

            <div class="error-message"><?= $error_message ?></div>

        <?php endif; ?>

    </div>

</body>

</html>
```
# 2. Log Out
```php
<?php

session_start();

session_destroy();

header("Location: login.php");

exit();

?>
```
# 3. Dahboard 
```php
<?php

$servername = "localhost";

$username = "root";

$password = "";

$database = "event_sekolah";

  

$conn = new mysqli($servername, $username, $password, $database);

if ($conn->connect_error) {

    die("Koneksi gagal: " . $conn->connect_error);

}

  

$sql = "SELECT * FROM event_sekolah";

$result = $conn->query($sql);

?>

  

<!DOCTYPE html>

<html lang="id">

<head>

    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Dashboard Event Sekolah</title>

    <link rel="stylesheet" href="navbar.css">

    <style>

        body {

            font-family: 'Arial', sans-serif;

            margin: 0;

            padding: 0;

            background-color: #f9f9f9;

        }

  

        /* Beri jarak antar elemen utama */

        nav {

            margin-bottom: 20px;

        }

  

        /* Slider Container */

        .slider-container {

            width: 100%;

            overflow: hidden;

            position: relative;

            height: 400px;

            margin-bottom: 30px; /* Tambahkan jarak bawah */

        }

        .slider {

            display: flex;

            transition: transform 1s ease-in-out;

        }

  

        .slider img {

            width: 100%;

            height: 400px;

            object-fit: cover;

            flex-shrink: 0;

        }

  

        /* Tombol Navigasi */

        .prev, .next {

            position: absolute;

            top: 50%;

            transform: translateY(-50%);

            background-color: rgba(0, 0, 0, 0.5);

            color: white;

            border: none;

            padding: 10px 15px;

            cursor: pointer;

            z-index: 10;

        }

        .prev { left: 10px; }

        .next { right: 10px; }

  

        .container {

            width: 80%;

            margin: auto;

            padding: 20px;

            background: white;

            border-radius: 10px;

            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);

            margin-bottom: 30px; /* Tambahkan jarak bawah */

        }

  

        h2 {

            text-align: center;

            margin-bottom: 20px;

        }

  

        table {

            width: 100%;

            border-collapse: collapse;

            margin-top: 10px;

        }

        th, td {

            padding: 10px;

            border: 1px solid #ddd;

            text-align: left;

        }

        th {

            background-color: #007bff;

            color: white;

        }

  

        /* Tambahkan margin ke footer */

        footer {

            text-align: center;

            padding: 15px;

            background: #007bff;

            color: white;

            margin-top: 40px; /* Tambahkan jarak atas */

        }

    </style>

</head>

<body>

  

<?php include 'navbar.php'; ?>

  

<!-- Slider -->

<div class="slider-container">

    <div class="slider">

        <img src="https://www.whiteboardjournal.com/wp-content/uploads/2019/12/OYF-PerayaanBayangan-17.jpg" alt="Event 1">

        <img src="https://www.whiteboardjournal.com/wp-content/uploads/2019/12/OYF-PerayaanBayangan-17.jpg" alt="Event 2">

        <img src="https://www.whiteboardjournal.com/wp-content/uploads/2019/12/OYF-PerayaanBayangan-17.jpg" alt="Event 3">

    </div>

    <button class="prev" onclick="moveSlide(-1)">&#10094;</button>

    <button class="next" onclick="moveSlide(1)">&#10095;</button>

</div>

  

<!-- Daftar Event -->

<div class="container">

    <h2>Daftar Event Sekolah</h2>

    <table>

        <tr>

            <th>ID</th>

            <th>Nama Event</th>

            <th>Tanggal</th>

            <th>Deskripsi</th>

        </tr>

        <?php while ($row = $result->fetch_assoc()) { ?>

            <tr>

                <td><?= $row["ID_Event"] ?></td>

                <td><?= $row["Nama_Event"] ?></td>

                <td><?= $row["Tanggal"] ?></td>

                <td><?= $row["Deskripsi"] ?></td>

            </tr>

        <?php } ?>

    </table>

</div>

  

<footer>

    <p>&copy; 2025 Event Sekolah. All Rights Reserved.</p>

</footer>

  

<script>

    let currentIndex = 0;

    const slider = document.querySelector(".slider");

    const totalSlides = slider.children.length;

    function moveSlide(step) {

        currentIndex = (currentIndex + step + totalSlides) % totalSlides;

        updateSlide();

    }

  

    function updateSlide() {

        slider.style.transform = `translateX(-${currentIndex * 100}%)`;

    }

  

    // Auto-slide tiap 20 detik

    setInterval(() => moveSlide(1), 20000);

</script>

  

</body>

</html>

  

<?php $conn->close(); ?>
```

# 4. NavBar
```php
<!DOCTYPE html>

<html lang="id">

<head>

    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Navbar</title>

    <style>

        /* Navbar Styling */

        .navbar {

            background: #007bff;

            padding: 15px 20px;

            display: flex;

            justify-content: space-between;

            align-items: center;

        }

        .navbar .logo {

            font-size: 22px;

            color: white;

            font-weight: bold;

        }

        .navbar ul {

            list-style: none;

            display: flex;

            gap: 15px;

            margin: 0;

            padding: 0;

        }

        .navbar ul li {

            display: inline;

        }

        .navbar ul li a {

            color: white;

            text-decoration: none;

            font-size: 16px;

            padding: 8px 0px;

            border-radius: 5px;

            transition: background 0.3s;

        }

        .navbar ul li a:hover {

            background: rgba(255, 255, 255, 0.2);

        }

    </style>

</head>

<body>

    <nav class="navbar">

        <div class="logo">Event Sekolah</div>

        <ul>

            <li><a href="dashboard.php">Dashboard</a></li>

            <li><a href="tambah_event.php">Buat Event</a></li>

            <li><a href="pendaftaran.php">Pendaftaran Peserta</a></li>

            <li><a href="sponsor.php">Masukkan Sponsor</a></li>

            <li><a href="logout.php">Log Out</a></li>

        </ul>

    </nav>

</body>

</html>
```
# 5. Tambah_Event
```php
<?php

session_start();

  

// Redirect ke halaman login jika pengguna belum login

if (!isset($_SESSION['username'])) {

    header("Location: login.php");

    exit();

}

  

$servername = "localhost";

$username = "root";

$password = "";

$database = "event_sekolah";

  

$conn = new mysqli($servername, $username, $password, $database);

if ($conn->connect_error) {

    die("Koneksi gagal: " . $conn->connect_error);

}

  

// Konversi bulan dari Indonesia ke Inggris

$bulan_indo_to_eng = [

    'januari' => 'january', 'februari' => 'february', 'maret' => 'march',

    'april' => 'april', 'mei' => 'may', 'juni' => 'june',

    'juli' => 'july', 'agustus' => 'august', 'september' => 'september',

    'oktober' => 'october', 'november' => 'november', 'desember' => 'december'

];

  

// Ambil input pencarian

$search_bulan = isset($_GET['search_bulan']) ? strtolower(trim($_GET['search_bulan'])) : '';

$search_bulan_eng = $bulan_indo_to_eng[$search_bulan] ?? $search_bulan;

  

// Query statistik event berdasarkan bulan

$sql_statistik = "SELECT YEAR(Tanggal) AS Tahun, MONTHNAME(Tanggal) AS Bulan, COUNT(*) AS Jumlah_Event

                  FROM event_sekolah

                  WHERE (? = '' OR LOWER(MONTHNAME(Tanggal)) = ?)

                  GROUP BY Tahun, Bulan

                  ORDER BY Tahun DESC, Bulan ASC";

  

// Eksekusi query dengan prepared statement

$stmt = $conn->prepare($sql_statistik);

$stmt->bind_param("ss", $search_bulan_eng, $search_bulan_eng);

$stmt->execute();

$result_statistik = $stmt->get_result();

  

// Konversi nama bulan ke bahasa Indonesia

$bulan_eng_to_indo = [

    'january' => 'Januari', 'february' => 'Februari', 'march' => 'Maret',

    'april' => 'April', 'may' => 'Mei', 'june' => 'Juni',

    'july' => 'Juli', 'august' => 'Agustus', 'september' => 'September',

    'october' => 'Oktober', 'november' => 'November', 'december' => 'Desember'

];

  

// Inisialisasi variabel untuk edit

$id_event = "";

$nama_event = "";

$tanggal = "";

$deskripsi = "";

$is_edit = false;

  

// Tambah atau Update Event

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $nama = $_POST['nama_event'];

    $tanggal = $_POST['tanggal'];

    $deskripsi = $_POST['deskripsi'];

  

    if (isset($_POST['id_event']) && !empty($_POST['id_event'])) {

        // Update event

        $id = $_POST['id_event'];

        $sql = "UPDATE event_sekolah SET Nama_Event='$nama', Tanggal='$tanggal', Deskripsi='$deskripsi' WHERE ID_Event=$id";

        echo "<script>alert('Event berhasil diperbarui!'); window.location='tambah_event.php';</script>";

    } else {

        // Tambah event baru

        $sql = "INSERT INTO event_sekolah (Nama_Event, Tanggal, Deskripsi) VALUES ('$nama', '$tanggal', '$deskripsi')";

        echo "<script>alert('Event berhasil ditambahkan!'); window.location='tambah_event.php';</script>";

    }

  

    if (!$conn->query($sql)) {

        echo "Error: " . $sql . "<br>" . $conn->error;

    }

}

  

// Hapus Event

if (isset($_GET['hapus'])) {

    $id = $_GET['hapus'];

    $sql = "DELETE FROM event_sekolah WHERE ID_Event=$id";

    if ($conn->query($sql) === TRUE) {

        $conn->query("SET @count = 0;");

        $conn->query("UPDATE event_sekolah SET ID_Event = @count := @count + 1;");

        $conn->query("ALTER TABLE event_sekolah AUTO_INCREMENT = 1;");

  

        echo "<script>alert('Event berhasil dihapus!'); window.location='tambah_event.php';</script>";

    }

}

  

// Ambil data event untuk diedit

if (isset($_GET['edit'])) {

    $id = $_GET['edit'];

    $edit_sql = "SELECT * FROM event_sekolah WHERE ID_Event=$id";

    $edit_result = $conn->query($edit_sql);

    $edit_data = $edit_result->fetch_assoc();

  

    $id_event = $edit_data['ID_Event'];

    $nama_event = $edit_data['Nama_Event'];

    $tanggal = $edit_data['Tanggal'];

    $deskripsi = $edit_data['Deskripsi'];

    $is_edit = true;

}

  

// Ambil semua data event beserta jumlah peserta

$sql = "SELECT event_sekolah.*, (SELECT COUNT(*) FROM pendaftaran_peserta WHERE pendaftaran_peserta.ID_Event = event_sekolah.ID_Event) AS Jumlah_Peserta FROM event_sekolah";

$result = $conn->query($sql);

?>

  

<!DOCTYPE html>

<html>

<head>

    <title>Kelola Event Sekolah</title>

    <link rel="stylesheet" href="navbar.css">

    <style>

        body {

            font-family: 'Arial', sans-serif;

            margin: 0;

            padding: 0;

            background-color: #f9f9f9;

        }

        .container {

            max-width: 950px;

            margin: 50px auto;

            background: white;

            padding: 20px;

            border-radius: 10px;

            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);

        }

        h2 {

            text-align: center;

            color: #2c3e50;

            margin-bottom: 20px;

        }

        form {

            display: flex;

            flex-direction: column;

            gap: 10px;

        }

        input, textarea {

            width: 97.5%;

            padding: 10px;

            border: 1px solid #ccc;

            border-radius: 5px;

            font-size: 16px;

        }

        button {

            background: #3498db;

            color: white;

            padding: 10px;

            border: none;

            border-radius: 5px;

            cursor: pointer;

            font-size: 16px;

            transition: 0.3s;

        }

        button:hover {

            background: #2980b9;

        }

        table {

            width: 100%;

            border-collapse: collapse;

            margin-top: 20px;

        }

        table th, table td {

            padding: 10px;

            border: 1px solid #ddd;

            text-align: left;

        }

        table th {

            background: #3498db;

            color: white;

        }

        table tr:hover {

            background: #f1f1f1;

        }

        .action-buttons a {

            display: inline-block;

            padding: 5px 10px;

            margin: 2px;

            border-radius: 5px;

            text-decoration: none;

            font-weight: bold;

            color: white;

        }

        .edit {

            background: #f1c40f;

        }

        .edit:hover {

            background: #f39c12;

        }

        .delete {

            background: #e74c3c;

        }

        .delete:hover {

            background: #c0392b;

        }

        .detail {

            background: #3498db;

        }

        .detail:hover {

            background: #2980b9;

        }

    </style>

</head>

<body>

<?php include 'navbar.php'; ?>

  

<div class="container">

    <?php if ($_SESSION['role'] == 'admin'): ?>

        <h2><?= $is_edit ? "Edit" : "Tambah" ?> Event</h2>

        <form method="POST" action="">

            <input type="hidden" name="id_event" value="<?= $id_event ?>">

            <input type="text" name="nama_event" placeholder="Nama Event" value="<?= $nama_event ?>" required>

            <input type="date" name="tanggal" value="<?= $tanggal ?>" required>

            <textarea name="deskripsi" placeholder="Deskripsi" required><?= $deskripsi ?></textarea>

            <button type="submit">Simpan</button>

        </form>

        <br>

        <br>

    <?php endif; ?>

  

    <h2>Daftar Event</h2>

    <table>

        <tr>

            <th>ID</th>

            <th>Nama Event</th>

            <th>Tanggal</th>

            <th>Deskripsi</th>

            <th>Peserta</th>

            <?php if ($_SESSION['role'] == 'admin'): ?>

                <th>Aksi</th>

            <?php endif; ?>

            <th>Detail</th>

        </tr>

        <?php while ($row = $result->fetch_assoc()) { ?>

            <tr>

                <td><?= $row["ID_Event"] ?></td>

                <td><?= $row["Nama_Event"] ?></td>

                <td><?= $row["Tanggal"] ?></td>

                <td><?= $row["Deskripsi"] ?></td>

                <td><?= $row["Jumlah_Peserta"] ?></td>

                <?php if ($_SESSION['role'] == 'admin'): ?>

                    <td class="action-buttons">

                        <a href="?edit=<?= $row['ID_Event'] ?>" class="edit">Edit</a>

                        <a href="?hapus=<?= $row['ID_Event'] ?>" class="delete" onclick="return confirm('Hapus event ini?')">Hapus</a>

                    </td>

                <?php endif; ?>

                <td class="action-buttons">

                    <a href="detail_event.php?id=<?= $row['ID_Event'] ?>" class="detail">Detail</a>

                </td>

            </tr>

        <?php } ?>

    </table>

    <br>

    <br>

    <h2>Statistik Event Bulanan</h2>

    <form method="GET" action="">

        <label for="search_bulan">Pilih Bulan:</label>

        <select name="search_bulan" id="search_bulan">

            <option value="">Semua Bulan</option>

            <?php

            $bulan_list = [

                'januari' => 'Januari', 'februari' => 'Februari', 'maret' => 'Maret',

                'april' => 'April', 'mei' => 'Mei', 'juni' => 'Juni',

                'juli' => 'Juli', 'agustus' => 'Agustus', 'september' => 'September',

                'oktober' => 'Oktober', 'november' => 'November', 'desember' => 'Desember'

            ];

            foreach ($bulan_list as $key => $bulan) {

                $selected = ($search_bulan == $key) ? "selected" : "";

                echo "<option value='$key' $selected>$bulan</option>";

            }

            ?>

        </select>

        <button type="submit">Cari</button>

    </form>

  

    <br>

    <table>

        <tr>

            <th>Tahun</th>

            <th>Bulan</th>

            <th>Jumlah Event</th>

        </tr>

        <?php

        while ($row = $result_statistik->fetch_assoc()) {

            $bulan_tampil = strtolower($row["Bulan"]);

            ?>

            <tr>

                <td><?= $row["Tahun"] ?></td>

                <td><?= $bulan_eng_to_indo[$bulan_tampil] ?? ucfirst($bulan_tampil) ?></td>

                <td><?= $row["Jumlah_Event"] ?></td>

            </tr>

        <?php } ?>

    </table>

</div>

</body>

</html>

<?php $conn->close(); ?>
```
# 6. Pendaftaran
```php
<?php

// Koneksi ke database

$host = "localhost";

$user = "root";

$pass = "";

$db   = "event_sekolah";

  

$koneksi = new mysqli($host, $user, $pass, $db);

if ($koneksi->connect_error) {

    die("Koneksi gagal: " . $koneksi->connect_error);

}

  

// Tambah / Edit Peserta

if (isset($_POST['tambah_peserta']) || isset($_POST['edit_peserta'])) {

    $id = $_POST['id'] ?? '';

    $nama = $_POST['nama'];

    $kelas = $_POST['kelas'];

    $kontak = $_POST['kontak'];

    $role = $_POST['role'];

  

    if (isset($_POST['tambah_peserta'])) {

        $query = "INSERT INTO peserta (Nama_Peserta, Kelas, Kontak, Role) VALUES ('$nama', '$kelas', '$kontak', '$role')";

    } else {

        $query = "UPDATE peserta SET Nama_Peserta='$nama', Kelas='$kelas', Kontak='$kontak', Role='$role' WHERE ID_Peserta=$id";

    }

    $koneksi->query($query);

    header("Location: pendaftaran.php");

}

  

// Hapus Peserta

if (isset($_GET['hapus_peserta'])) {

    $id = $_GET['hapus_peserta'];

    $koneksi->query("DELETE FROM peserta WHERE ID_Peserta = $id");

    header("Location: pendaftaran.php");

}

  

// Tambah / Edit Pendaftaran

if (isset($_POST['tambah_pendaftaran']) || isset($_POST['edit_pendaftaran'])) {

    $id_peserta_event = $_POST['id_peserta_event'] ?? '';

    $id_peserta = $_POST['id_peserta'];

    $id_event = $_POST['id_event'];

  

    if (isset($_POST['tambah_pendaftaran'])) {

        $query = "INSERT INTO pendaftaran_peserta (ID_Peserta, ID_Event) VALUES ('$id_peserta', '$id_event')";

    } else {

        $query = "UPDATE pendaftaran_peserta SET ID_Peserta='$id_peserta', ID_Event='$id_event' WHERE ID_Peserta_Event='$id_peserta_event'";

    }

    $koneksi->query($query);

    header("Location: pendaftaran.php");

}

  

// Hapus Pendaftaran

if (isset($_GET['hapus_pendaftaran'])) {

    $id_peserta_event = $_GET['hapus_pendaftaran'];

    $koneksi->query("DELETE FROM pendaftaran_peserta WHERE ID_Peserta_Event = $id_peserta_event");

    header("Location: pendaftaran.php");

}

  

// Ambil data peserta dan pendaftaran

$peserta = $koneksi->query("SELECT * FROM peserta");

$pendaftaran = $koneksi->query("SELECT pendaftaran_peserta.ID_Peserta_Event, peserta.Nama_Peserta, event_sekolah.Nama_Event

                                FROM pendaftaran_peserta

                                JOIN peserta ON pendaftaran_peserta.ID_Peserta = peserta.ID_Peserta

                                JOIN event_sekolah ON pendaftaran_peserta.ID_Event = event_sekolah.ID_Event");

  

// Ambil data peserta untuk dropdown

$peserta_list = $koneksi->query("SELECT ID_Peserta, Nama_Peserta FROM peserta");

  

// Ambil data peserta untuk edit

if (isset($_GET['edit_peserta'])) {

    $id_edit = $_GET['edit_peserta'];

    $peserta_edit = $koneksi->query("SELECT * FROM peserta WHERE ID_Peserta = $id_edit")->fetch_assoc();

}

?>

  

<!DOCTYPE html>

<html lang="id">

<head>

    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>CRUD Peserta & Pendaftaran</title>

    <!-- Select2 CSS -->

    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />

    <style>

        body {

            font-family: 'Arial', sans-serif;

            margin: 0;

            padding: 0;

            background-color: #f9f9f9;

        }

  

        .container {

            max-width: 950px;

            margin: 50px auto;

            background: white;

            padding: 20px;

            border-radius: 10px;

            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);

        }

  

        h2 {

            text-align: center;

            color: #333;

            font-size: 24px;

            margin-bottom: 30px;

            margin-top: 30px;

        }

  

        table {

            width: 100%;

            border-collapse: collapse;

            margin-top: 20px;

            padding: 20px;

            border-radius: 8px;

            overflow: hidden;

        }

        th, td {

            padding: 12px 15px;

            border: 1px solid #ddd;

            text-align: center;

        }

        th {

            background-color: #007bff;

            color: white;

        }

  

        .card {

            background: #fff;

            border-radius: 10px;

            padding: 25px;

            margin-bottom: 30px;

        }

  

        .card-header {

            font-size: 20px;

            font-weight: bold;

            color: #007bff;

            margin-bottom: 20px;

        }

  

        input, select {

            width: 98%;

            padding: 12px;

            margin-top: 8px;

            border: 1px solid #ddd;

            border-radius: 5px;

        }

  

        .btn {

            display: inline-block;

            padding: 5px 10px;

            margin: 5px;

            border-radius: 5px;

            text-decoration: none;

            font-weight: bold;

            color: white;

        }

        .btn-success {

            background-color: #28a745;

        }

        .btn-danger {

            background-color: #dc3545;

        }

        .btn-warning {

            background-color: #ffc107;

        }

    </style>

</head>

<body>

<?php include 'navbar.php'; ?>

  

    <div class="container">

        <h2>Data Peserta</h2>

  

        <div class="card mb-4">

            <div class="card-header"><?= isset($_GET['edit_peserta']) ? 'Edit Peserta' : 'Tambah Peserta' ?></div>

            <div class="card-body">

                <form method="POST">

                    <input type="hidden" name="id" value="<?= isset($peserta_edit) ? $peserta_edit['ID_Peserta'] : '' ?>">

                    <div class="mb-3">

                        <label>Nama Peserta :</label>

                        <input type="text" name="nama" class="form-control" placeholder="Masukkan Nama Peserta" value="<?= isset($peserta_edit) ? $peserta_edit['Nama_Peserta'] : '' ?>" required>

                    </div>

                    <br>

                    <div class="mb-3">

                        <label>Kelas :</label>

                        <input type="text" name="kelas" class="form-control" placeholder="Masukkan Kelas Peserta" value="<?= isset($peserta_edit) ? $peserta_edit['Kelas'] : '' ?>" required>

                    </div>

                    <br>

                    <div class="mb-3">

                        <label>Kontak :</label>

                        <input type="number" name="kontak" class="form-control" placeholder="Masukkan Kontak Peserta" value="<?= isset($peserta_edit) ? $peserta_edit['Kontak'] : '' ?>" required>

                    </div>

                    <br>

                    <?php

                    $button_name = isset($_GET['edit_peserta']) ? 'edit_peserta' : 'tambah_peserta';

                    $button_class = isset($_GET['edit_peserta']) ? 'btn-warning' : 'btn-success';

                    $button_text = isset($_GET['edit_peserta']) ? 'Edit' : 'Tambah';

                    ?>

                    <button type="submit" name="<?= $button_name ?>" class="btn <?= $button_class ?>"><?= $button_text ?></button>

                </form>

            </div>

        </div>

  

        <table class="table table-bordered">

            <thead>

                <tr>

                    <th>Nama</th>

                    <th>Kelas</th>

                    <th>Kontak</th>

                    <th>Aksi</th>

                </tr>

            </thead>

            <tbody>

                <?php while ($row = $peserta->fetch_assoc()) : ?>

                    <tr>

                        <td><?= $row['Nama_Peserta'] ?></td>

                        <td><?= $row['Kelas'] ?></td>

                        <td><?= $row['Kontak'] ?></td>

                        <td>

                            <a href="pendaftaran.php?edit_peserta=<?= $row['ID_Peserta'] ?>" class="btn btn-warning btn-sm">Edit</a>

                            <a href="pendaftaran.php?hapus_peserta=<?= $row['ID_Peserta'] ?>" class="btn btn-danger btn-sm" onclick="return confirm('Yakin ingin menghapus?')">Hapus</a>

                        </td>

                    </tr>

                <?php endwhile; ?>

            </tbody>

        </table>

        <br>

        <br>

  

        <h2 class="mt-5">Pendaftaran Peserta ke Event</h2>

  

        <div class="card mb-4">

            <div class="card-header">Tambah Pendaftaran</div>

            <div class="card-body">

                <form method="POST">

                    <label>Nama Peserta:</label>

                    <select id="select-peserta" name="id_peserta" class="form-control mb-3" required>

                        <option value="">Pilih Nama Peserta</option>

                        <?php while ($row = $peserta_list->fetch_assoc()) : ?>

                            <option value="<?= $row['ID_Peserta'] ?>"><?= $row['Nama_Peserta'] ?></option>

                        <?php endwhile; ?>

                    </select>

                    <br>

                    <br>

                    <label>Event:</label>

                    <select name="id_event" class="form-control mb-3">

                        <?php

                        $event = $koneksi->query("SELECT * FROM event_sekolah");

                        while ($row = $event->fetch_assoc()) {

                            echo "<option value='{$row['ID_Event']}'>{$row['Nama_Event']}</option>";

                        }

                        ?>

                    </select>

                    <br>

                    <br>

  

                    <button type="submit" name="tambah_pendaftaran" class="btn btn-success">Simpan</button>

                </form>

            </div>

        </div>

  

        <table class="table table-bordered">

            <thead>

                <tr>

                    <th>No</th>

                    <th>Nama Peserta</th>

                    <th>Nama Event</th>

                    <th>Aksi</th>

                </tr>

            </thead>

            <tbody>

                <?php while ($row = $pendaftaran->fetch_assoc()) : ?>

                    <tr>

                        <td><?= $row['ID_Peserta_Event'] ?></td>

                        <td><?= $row['Nama_Peserta'] ?></td>

                        <td><?= $row['Nama_Event'] ?></td>

                        <td>

                            <a href="pendaftaran.php?hapus_pendaftaran=<?= $row['ID_Peserta_Event'] ?>" class="btn btn-danger btn-sm" onclick="return confirm('Yakin ingin menghapus?')">Hapus</a>

                        </td>

                    </tr>

                <?php endwhile; ?>

            </tbody>

        </table>

    </div>

  

    <!-- jQuery (diperlukan oleh Select2) -->

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <!-- Select2 JS -->

    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

    <script>

        $(document).ready(function() {

            // Inisialisasi Select2 pada dropdown

            $('#select-peserta').select2({

                placeholder: "Cari Nama Peserta",

                allowClear: true

            });

        });

    </script>

</body>

</html>
```
# 7. Sponsor
```php
<?php

session_start();

  

// Redirect ke halaman login jika pengguna belum login

if (!isset($_SESSION['username'])) {

    header("Location: login.php");

    exit();

}

  

$servername = "localhost";

$username = "root";

$password = "";

$database = "event_sekolah";

  

// Koneksi ke database

$conn = new mysqli($servername, $username, $password, $database);

if ($conn->connect_error) {

    die("Koneksi gagal: " . $conn->connect_error);

}

  

// Tambah / Edit Sponsor

if (isset($_POST['submit'])) {

    $id_sponsor = isset($_POST['id_sponsor']) ? $_POST['id_sponsor'] : '';

    $id_event = $_POST['id_event'];

    $nama_sponsor = $_POST['nama_sponsor'];

    $no_hp = $_POST['no_hp'];

  

    if (!empty($id_sponsor)) {

        // Jika ID Sponsor ada, lakukan UPDATE

        $query = "UPDATE sponsor SET ID_Event='$id_event', Nama_Sponsor='$nama_sponsor', no_hp='$no_hp' WHERE ID_Sponsor='$id_sponsor'";

    } else {

        // Jika tidak ada ID Sponsor, lakukan INSERT

        $query = "INSERT INTO sponsor (ID_Event, Nama_Sponsor, no_hp) VALUES ('$id_event', '$nama_sponsor', '$no_hp')";

    }

    mysqli_query($conn, $query);

    header("Location: sponsor.php");

}

  

// Hapus Sponsor

if (isset($_GET['hapus'])) {

    $id = $_GET['hapus'];

  

    // Hapus data berdasarkan ID_Sponsor

    mysqli_query($conn, "DELETE FROM sponsor WHERE ID_Sponsor='$id'");

  

    // Reset auto-increment

    mysqli_query($conn, "ALTER TABLE sponsor AUTO_INCREMENT = 1");

  

    // Re-sequence IDs (optional, but recommended)

    $result = mysqli_query($conn, "SELECT @count := 0");

    if ($result) {

        mysqli_query($conn, "UPDATE sponsor SET ID_Sponsor = @count := @count + 1");

    }

  

    header("Location: sponsor.php");

}

  

// Ambil data Sponsor

$sponsor = mysqli_query($conn, "SELECT sponsor.*, event_sekolah.Nama_Event FROM sponsor JOIN event_sekolah ON sponsor.ID_Event = event_sekolah.ID_Event ORDER BY ID_Sponsor ASC");

  

// Ambil data Event untuk dropdown

$events = mysqli_query($conn, "SELECT * FROM event_sekolah");

?>

<!DOCTYPE html>

<html>

<head>

    <title>CRUD Sponsor</title>

    <style>

        * {

            margin: 0;

            padding: 0;

            box-sizing: border-box;

        }

        body {

            font-family: Arial, sans-serif;

            background-color: #f8f9fa;

        }

        .navbar {

            background-color: #007bff;

            color: white;

            display: flex;

            align-items: center;

            justify-content: space-between;

            padding: 15px 20px;

        }

        .logo {

            font-size: 20px;

            font-weight: bold;

        }

        .nav-links {

            list-style: none;

            display: flex;

        }

        .nav-links li {

            margin: 0 15px;

        }

        .nav-links a {

            color: white;

            text-decoration: none;

        }

        .container {

            max-width: 800px;

            margin: 30px auto;

            background: white;

            padding: 20px;

            border-radius: 8px;

            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);

        }

        h2 {

            text-align: center;

            color: #333;

        }

        input, select {

            width: 100%;

            padding: 10px;

            margin: 10px 0;

            border: 1px solid #ccc;

            border-radius: 5px;

        }

        button {

            width: 100%;

            background-color: #007bff;

            color: white;

            padding: 10px;

            border: none;

            border-radius: 5px;

            font-size: 16px;

            cursor: pointer;

        }

        button:hover {

            background-color: #0056b3;

        }

        table {

            width: 100%;

            border-collapse: collapse;

            margin-top: 20px;

        }

        th, td {

            padding: 10px;

            text-align: center;

            border: 1px solid #ddd;

        }

        th {

            background-color: #007bff;

            color: white;

        }

        .edit, .hapus {

            padding: 5px 10px;

            text-decoration: none;

            border-radius: 5px;

            display: inline-block;

        }

        .edit { background-color: #ffc107; color: black; }

        .hapus { background-color: #dc3545; color: white; }

        .edit:hover { background-color: #e0a800; }

        .hapus:hover { background-color: #c82333; }

    </style>

</head>

<body>

<?php include 'navbar.php'; ?>

  

    <div class="container">

        <?php if ($_SESSION['role'] == 'admin'): ?>

            <h2><?php echo isset($_GET['edit']) ? 'Edit Sponsor' : 'Tambah Sponsor'; ?></h2>

            <?php

            $editData = ['ID_Sponsor' => '', 'ID_Event' => '', 'Nama_Sponsor' => '', 'no_hp' => ''];

            if (isset($_GET['edit'])) {

                $id = $_GET['edit'];

                $result = mysqli_query($conn, "SELECT * FROM sponsor WHERE ID_Sponsor='$id'");

                $editData = mysqli_fetch_assoc($result);

            }

            ?>

            <form method="POST">

                <input type="hidden" name="id_sponsor" value="<?= $editData['ID_Sponsor']; ?>">

                <label>Nama Event:</label>

                <select name="id_event" required>

                    <?php while ($event = mysqli_fetch_assoc($events)) : ?>

                        <option value="<?= $event['ID_Event']; ?>" <?= ($editData['ID_Event'] == $event['ID_Event']) ? 'selected' : ''; ?>>

                            <?= $event['Nama_Event']; ?>

                        </option>

                    <?php endwhile; ?>

                </select><br>

                <label>Nama Sponsor:</label>

                <input type="text" name="nama_sponsor" value="<?= $editData['Nama_Sponsor']; ?>" required><br>

                <label>No HP:</label>

                <input type="text" name="no_hp" value="<?= $editData['no_hp']; ?>"><br>

                <button type="submit" name="submit">Simpan</button>

            </form>

        <?php endif; ?>

    </div>

  

    <div class="container">

        <h2>Daftar Sponsor</h2>

        <table border="1">

            <tr>

                <th>ID Sponsor</th>

                <th>Nama Event</th>

                <th>Nama Sponsor</th>

                <th>No HP</th>

                <?php if ($_SESSION['role'] == 'admin'): ?>

                    <th>Aksi</th>

                <?php endif; ?>

            </tr>

            <?php while ($row = mysqli_fetch_assoc($sponsor)) : ?>

                <tr>

                    <td><?= $row['ID_Sponsor']; ?></td>

                    <td><?= $row['Nama_Event']; ?></td>

                    <td><?= $row['Nama_Sponsor']; ?></td>

                    <td><?= $row['no_hp']; ?></td>

                    <?php if ($_SESSION['role'] == 'admin'): ?>

                        <td>

                            <a class="edit" href="sponsor.php?edit=<?= $row['ID_Sponsor']; ?>">Edit</a>

                            <a class="hapus" href="sponsor.php?hapus=<?= $row['ID_Sponsor']; ?>" onclick="return confirm('Hapus data?');">Hapus</a>

                        </td>

                    <?php endif; ?>

                </tr>

            <?php endwhile; ?>

        </table>

    </div>

</body>

</html>
```
# 8. Detail_Event
```php
<?php

$servername = "localhost";

$username = "root";

$password = "";

$database = "event_sekolah";

  

$conn = new mysqli($servername, $username, $password, $database);

if ($conn->connect_error) {

    die("Koneksi gagal: " . $conn->connect_error);

}

  

if (isset($_GET['id'])) {

    $id = $_GET['id'];

    $sql = "SELECT * FROM event_sekolah WHERE ID_Event=$id";

    $result = $conn->query($sql);

  

    if ($result->num_rows > 0) {

        $row = $result->fetch_assoc();

    } else {

        echo "Event tidak ditemukan.";

        exit;

    }

} else {

    echo "ID event tidak diberikan.";

    exit;

}

  

// Hapus Pendaftaran Peserta

if (isset($_GET['hapus_peserta'])) {

    $id_peserta_event = $_GET['hapus_peserta'];

    $sql_hapus_peserta = "DELETE FROM pendaftaran_peserta WHERE ID_Peserta_Event = $id_peserta_event";

    if ($conn->query($sql_hapus_peserta) === TRUE) {

        // Reset auto_increment

        $conn->query("SET @count = 0;");

        $conn->query("UPDATE pendaftaran_peserta SET ID_Peserta_Event = @count:= @count + 1;");

        $conn->query("ALTER TABLE pendaftaran_peserta AUTO_INCREMENT = 1;");

  

        echo "<script>alert('Pendaftaran peserta berhasil dihapus!'); window.location='detail_event.php?id=" . $_GET['id'] . "';</script>";

    } else {

        echo "Error: " . $sql_hapus_peserta . "<br>" . $conn->error;

    }

}

  

// Tambah Pendaftaran Peserta

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['tambah_peserta'])) {

    $id_peserta = $_POST['id_peserta'];

    $id_event = $_GET['id'];

  

    // Tambahkan pendaftaran peserta ke tabel pendaftaran_peserta

    $sql_tambah_pendaftaran = "INSERT INTO pendaftaran_peserta (ID_Peserta, ID_Event) VALUES ($id_peserta, $id_event)";

    if ($conn->query($sql_tambah_pendaftaran) === TRUE) {

        echo "<script>alert('Peserta berhasil didaftarkan!'); window.location='detail_event.php?id=$id_event';</script>";

    } else {

        echo "Error: " . $sql_tambah_pendaftaran . "<br>" . $conn->error;

    }

}

  

// Ambil Data Pendaftaran Peserta

$sql_pendaftaran = "SELECT pendaftaran_peserta.*, peserta.Nama_Peserta FROM pendaftaran_peserta JOIN peserta ON pendaftaran_peserta.ID_Peserta = peserta.ID_Peserta WHERE ID_Event = " . $_GET['id'];

$result_pendaftaran = $conn->query($sql_pendaftaran);

  

// Ambil Data Peserta untuk Dropdown

$sql_peserta = "SELECT ID_Peserta, Nama_Peserta FROM peserta";

$result_peserta = $conn->query($sql_peserta);

?>

  

<!DOCTYPE html>

<html>

<head>

    <title>Detail Event</title>

    <link rel="stylesheet" href="navbar.css">

    <!-- Select2 CSS -->

    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />

    <style>

        body {

            font-family: 'Arial', sans-serif;

            margin: 0;

            padding: 0;

            background-color: #f9f9f9;

        }

        .container {

            max-width: 950px;

            margin: 50px auto;

            background: white;

            padding: 20px;

            border-radius: 10px;

            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);

        }

        h2 {

            text-align: center;

            color: #2c3e50;

            margin-bottom: 20px;

        }

        table {

            width: 100%;

            border-collapse: collapse;

            margin-top: 20px;

        }

        table th, table td {

            padding: 10px;

            border: 1px solid #ddd;

            text-align: left;

        }

        table th {

            background: #3498db;

            color: white;

        }

        table tr:hover {

            background: #f1f1f1;

        }

        form {

            display: flex;

            flex-direction: column;

            gap: 10px;

            margin-top: 20px;

        }

        input, select {

            /* width: 100%; */

            padding: 10px;

            border: 1px solid #ccc;

            border-radius: 5px;

            font-size: 16px;

        }

        button {

            background: #3498db;

            color: white;

            padding: 10px;

            border: none;

            border-radius: 5px;

            cursor: pointer;

            font-size: 16px;

            transition: 0.3s;

        }

        button:hover {

            background: #2980b9;

        }

        .action-buttons a {

            display: inline-block;

            padding: 5px 10px;

            margin: 2px;

            border-radius: 5px;

            text-decoration: none;

            font-weight: bold;

            color: white;

        }

        .delete:hover {

            background: #c0392b;

        }

  

        .kembali-button {

            position: absolute;

            /* top: 20px; */

            /* left: 20px; */

            background: #3498db;

            color: white;

            padding: 10px;

            border: none;

            border-radius: 5px;

            cursor: pointer;

            font-size: 16px;

            transition: 0.3s;

        }

        .kembali-button:hover {

            background: #2980b9;

        }

    </style>

</head>

<body>

<?php include 'navbar.php'; ?>

  

<div class="container">

    <a href="tambah_event.php" class="kembali-button">Kembali</a>

    <h2>Detail Event</h2>

    <table>

        <tr>

            <th>ID</th>

            <td><?= $row["ID_Event"] ?></td>

        </tr>

        <tr>

            <th>Nama Event</th>

            <td><?= $row["Nama_Event"] ?></td>

        </tr>

        <tr>

            <th>Tanggal</th>

            <td><?= $row["Tanggal"] ?></td>

        </tr>

        <tr>

            <th>Deskripsi</th>

            <td><?= $row["Deskripsi"] ?></td>

        </tr>

    </table>

    <br>

    <br>

  

    <h2>Pendaftaran Peserta Event</h2>

    <form method="POST" action="">

        <select id="select-peserta" name="id_peserta" class="form-control" required>

            <option value="">Pilih Nama Peserta</option>

            <?php while ($row_peserta = $result_peserta->fetch_assoc()) : ?>

                <option value="<?= $row_peserta['ID_Peserta'] ?>"><?= $row_peserta['Nama_Peserta'] ?></option>

            <?php endwhile; ?>

        </select>

        <button type="submit" name="tambah_peserta">Daftarkan Peserta</button>

    </form>

    <br>

    <br>

  

    <h2>Daftar Peserta Terdaftar</h2>

    <table>

        <thead>

            <tr>

                <th>ID Pendaftaran</th>

                <th>Nama Peserta</th>

                <th>Aksi</th>

            </tr>

        </thead>

        <tbody>

            <?php while ($row_pendaftaran = $result_pendaftaran->fetch_assoc()) : ?>

                <tr>

                    <td><?= $row_pendaftaran['ID_Peserta_Event'] ?></td>

                    <td><?= $row_pendaftaran['Nama_Peserta'] ?></td>

                    <td>

                        <a href="detail_event.php?id=<?= $_GET['id'] ?>&hapus_peserta=<?= $row_pendaftaran['ID_Peserta_Event'] ?>" class="delete" onclick="return confirm('Yakin ingin menghapus?')">Hapus</a>

                    </td>

                </tr>

            <?php endwhile; ?>

        </tbody>

    </table>

</div>

  

<!-- jQuery (diperlukan oleh Select2) -->

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- Select2 JS -->

<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

<script>

    $(document).ready(function() {

        // Inisialisasi Select2 pada dropdown

        $('#select-peserta').select2({

            placeholder: "Cari Nama Peserta",

            allowClear: true

        });

    });

</script>

</body>

</html>

<?php $conn->close(); ?>
```