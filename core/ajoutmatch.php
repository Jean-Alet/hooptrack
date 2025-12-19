<?php include '../includes/_linkpdo.php';

if (!empty($_POST)) {

    $date = $_POST['date_match'];
    $adv = $_POST['equipe_adverse'];
    $lieu = $_POST['lieu'];
    $resultat = $_POST['resultat'] ?: null;

    $req = $linkpdo->prepare(
        'INSERT INTO `match` (date_match, equipe_adverse, lieu, resultat)
         VALUES (?, ?, ?, ?)'
    );

    $req->execute([$date, $adv, $lieu, $resultat]);
}

header('Location: ../pages/match.php');
exit;