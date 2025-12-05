<?php
session_start();
if (empty($_SESSION['login'])) {
    header('Location: ../pages/authentification.php');
    exit;
}
try {
    $linkpdo = new PDO('mysql:host=localhost;dbname=basketball', 'root', '');
    $linkpdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (Exception $e) {
    die('Erreur BDD');
}

?>