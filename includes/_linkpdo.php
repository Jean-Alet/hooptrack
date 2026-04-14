<?php
try {
    $linkpdo = new PDO("mysql:host=localhost;dbname=basketball;charset=utf8", 'root', '');
    $linkpdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("Erreur de connexion : " . $e->getMessage());
}
?>