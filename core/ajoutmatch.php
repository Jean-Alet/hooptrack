<?php
try {
    $linkpdo = new PDO('mysql:host=localhost;dbname=basketball', 'root', '');
    $linkpdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (Exception $e) {
    die('Erreur BDD');
}

if (!empty($_POST)) {
    $date_match = $_POST['date_match'] ?? '';
    $equipe = $_POST['equipe_adverse'] ?? '';
    $lieu = $_POST['lieu'] ?? 'Domicile';
    $resultat = $_POST['resultat'] ?? null;

    $ins = $linkpdo->prepare('INSERT INTO `match` (date_match, equipe_adverse, lieu, resultat) VALUES (?, ?, ?, ?)');
    $ins->execute([$date_match, $equipe, $lieu, $resultat === '' ? null : $resultat]);

    header('Location: ../pages/match.php'); exit;
}
?>
<!doctype html>
<html><head><meta charset="utf-8"><title>Ajouter match</title>
<link rel="stylesheet" href="../css/style.css"></head>
<body>
<form method="post">
    Date et heure: <input type="datetime-local" name="date_match" required><br>
    Equipe adverse: <input type="text" name="equipe_adverse" required><br>
    Lieu: <select name="lieu"><option>Domicile</option><option>Extérieur</option></select><br>
    Résultat: <select name="resultat"><option value="">--</option><option>Victoire</option><option>Défaite</option></select><br>
    <input type="submit" value="Ajouter">
</form>
<form action="../pages/match.php" method="get"><button type="submit">Retour</button></form>
</body></html>