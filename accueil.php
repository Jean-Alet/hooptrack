<?php
session_start();

if (!isset($_SESSION['mdp'], $_SESSION['login']) || $_SESSION['mdp'] !== 'dupont' || $_SESSION['login'] !== 'jean') {
    header('Location: authentificationrate.php');
    exit;
}
?>