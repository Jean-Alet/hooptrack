<?php
include '../includes/_session.php';
include '../includes/_linkpdo.php';
include '../includes/_queries.php';

if (!empty($_POST)) {

    $date = $_POST['date_match'] ?? '';
    $adv = trim($_POST['equipe_adverse'] ?? '');
    $lieu = $_POST['lieu'] ?? '';
    $resultat = $_POST['resultat'] ?: null;

    $lieux_valides = ['Domicile', 'Extérieur'];
    $resultats_valides = [null, 'Victoire', 'Défaite'];

    if ($date && $adv && in_array($lieu, $lieux_valides) && in_array($resultat, $resultats_valides)) {
        insertMatch($linkpdo, $date, $adv, $lieu, $resultat);
    }
}

header('Location: ../pages/match_disp.php');
exit;