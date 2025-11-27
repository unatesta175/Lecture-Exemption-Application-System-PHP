<?php

include 'components/connect.php';

session_start();

if (isset($_SESSION['trhea_id'])) {
    $trhea_id = $_SESSION['trhea_id'];
    $trhea_name = $_SESSION['trhea_name'];

} else {
    $trhea_id = '';
    $trhea_name = '';

}
;

if (isset($_POST['submit'])) {

    $email = htmlspecialchars(strip_tags(trim($_POST['email'])), ENT_QUOTES, 'UTF-8');
    $pass = sha1(htmlspecialchars(strip_tags(trim($_POST['pass'])), ENT_QUOTES, 'UTF-8'));

    $select_user = $conn->prepare("SELECT * FROM `trhea` WHERE email = ? AND password = ?");
    $select_user->execute([$email, $pass]);
    $row = $select_user->fetch(PDO::FETCH_ASSOC);





    if ($select_user->rowCount() > 0) {
        $_SESSION['trhea_id'] = $row['trhea_id'];
        $_SESSION['trhea_name'] = $row['trhea_name'];
        header('location:trhea_home.php');




    } else {
        $message[] = 'incorrect username or password!';
    }

}


?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>login</title>

    <!--Bootstrap CSS-->
    <!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous" /> -->

    <!--Bootstrap CSS latest(jangan guna nanti coding berubah)-->
    <!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous"> -->

    <!--stylesheet CSS-->
    <link rel="stylesheet" href="css/style.css">

    <!--editable Bootstrap CSS-->
    <!-- <link rel="stylesheet" href="css/bootstrap.css"> -->

    <!--import box icons-->
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

    <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />

    <!-- font awesome cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

    <!-- AKU RASA NI JANGAN BUKA LANGSUNG baik buang -->
    <!-- <link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css"> -->

</head>

<body>

    <?php include 'components/trhea_header.php'; ?>



    })
    </script>
    <br>
    <section class="form-container" styles="border-radius: 15px">

        <form action="" method="post">
            <h3 style="font-weight:bold">LOGIN</h3>
            <br>
            <br>
            <label class="larger-font bigger" style="display: flex;flex-direction: row;" for="emailLogin">Alamat
                emel</label>
            <input type="email" id="emailLogin" name="email" required placeholder="" maxlength="70" class="box"
                aria-describedby="emailHelp" oninput="this.value = this.value.replace(/\s/g, '')">
            <label class="larger-font bigger" style="display: flex;flex-direction: row;" for="passLogin">Kata
                Laluan</label>
            <input type="password" id="passLogin" name="pass" required placeholder="" maxlength="40" class="box"
                oninput="this.value = this.value.replace(/\s/g, '')">
            <input id="btnLogin" type="submit" style="border-radius:15px; text-transform:uppercase;" value="login"
                class="btn" name="submit">
            <p>Anda tidak memiliki akaun?</p>
            <a style="border-radius:15px; text-transform:uppercase;" href="trhea_register.php"
                class="underline option-btn">Daftar</a>
            <select name="category" class="box" style="display: flex;flex-direction: row; margin-top: 15px;" onchange="redirectToLoginPage(this.value)">
                <option value="">Tukar kategori pengguna anda</option>
                <option value="student">Pelajar</option>
                <option value="lecturer">Pensyarah</option>
                <option value="kpp">Ketua Pusat Pengajian</option>
                <option value="admin">Admin</option>
            </select>
            <script>
                function redirectToLoginPage(category) {
                    if (category === "lecturer") {
                        window.location.href = "l_login.php";
                    } else if (category === "kpp") {
                        window.location.href = "kpp_login.php";
                    } else if (category === "student") {
                        window.location.href = "user_login.php";
                    } else if (category === "admin") {
                        window.location.href = "admin_login.php";
                    }
                }
            </script>
        </form>

    </section>
    <br>


    <?php include 'components/trhea_footer.php';
    include 'components/scripts.php'; ?>

    <script src="js/script.js"></script>
    <!-- import javascript and css bootsrap bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
    <!-- import popper to use dropdowns, popovers, or tooltips-->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js"
        integrity="sha384-zYPOMqeu1DAVkHiLqWBUTcbYfZ8osu1Nd6Z89ify25QV9guujx43ITvfi12/QExE"
        crossorigin="anonymous"></script>

</body>

</html>