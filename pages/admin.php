<?php
require '../config.php';
session_start();
if ($_SESSION['user_id'] == 1) {
    header('Location: ../index.php');
    exit();
}
$arrerr = [];
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $name = trim($_POST['name']);
    $description = trim($_POST['description']);
    $price = floatval($_POST['price']);
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel</title>
</head>

<body>
    welcome to admin panel <?php echo $_SESSION['user_name']; ?>
    <a href="../php/logout.php">Выйти из системы</a>
    <div class="product_container">
        <h1>Добавить новый товар</h1>
        <form action="" enctype="multipart/form-data" method="post">
            <div class="form-group">
                <p>Название товара</p>
                <input type="text" name="name" required id="">
            </div>
            <div class="form-group">
                <p>Описание товара</p>
                <textarea name="description" id=""></textarea>
            </div>
            <div class="form-group">
                <p>Цена товара</p>
                <input type="number" name="price" required id="">
            </div>
            <div class="form-group">
                <p>Изображение товара</p>
                <input type="file" name="image" required id="">
                <br>
                <i>Разрешены: png, jpg, jpeg, gif, webp (Максимально 10мб)</i>
            </div>
            <button>Добавить товар</button>
        </form>
    </div>
</body>

</html>