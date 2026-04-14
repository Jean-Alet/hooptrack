<?php
include '../includes/_session.php';
include '../includes/_linkpdo.php';
include '../includes/_queries.php';

if (!empty($_POST)) {

    $num = trim($_POST['num_licence'] ?? '');
    $nom = trim($_POST['nom'] ?? '');
    $prenom = trim($_POST['prenom'] ?? '');
    $date_naiss = $_POST['date_naissance'] ?? '';
    $taille = is_numeric($_POST['taille'] ?? '') ? (int)$_POST['taille'] : null;
    $poids = is_numeric($_POST['poids'] ?? '') ? (float)$_POST['poids'] : null;
    $nationalite = trim($_POST['nationalite'] ?? '');
    $statut = $_POST['statut'] ?? '';
    $commentaire = trim($_POST['commentaire'] ?? '');

    $statuts_valides = ['Actif', 'Blessé', 'Suspendu', 'Absent'];

    if ($num && $nom && $prenom && $date_naiss && in_array($statut, $statuts_valides)) {
        insertJoueur($linkpdo, $num, $nom, $prenom, $date_naiss, $taille, $poids, $nationalite, $statut, $commentaire);
    }
}

header('Location: ../pages/equipe_disp.php');
exit;