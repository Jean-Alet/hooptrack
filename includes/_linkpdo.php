<?php
try {
    $linkpdo = new PDO('mysql:host=sql206.infinityfree.com;dbname=if0_40935009_basketball', 'if0_40935009', 'Xlt2oYkV9shoJ');
    $linkpdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (Exception $e) {
    die('Erreur BDD');
}
?>