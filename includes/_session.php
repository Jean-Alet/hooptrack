<?php
session_start();
if (empty($_SESSION['login'])) {
    header('Location: /php_project/pages/authentification_disp.php');
    exit;
}
?>