<?php

try {
    $linkpdo = new PDO('mysql:host=localhost;dbname=basketball;charset=utf8mb4', 'root', '');
    $linkpdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (Exception $e) {
    die('Erreur BDD');
}

if (!isset($_GET['var1'])) { header('Location: match.php'); exit; }
$id = (int)$_GET['var1'];

if (!empty($_POST)) {
    if (isset($_POST['confirm'])) {
        $sup = $linkpdo->prepare('DELETE FROM `match` WHERE id_match = ?');
        $sup->execute([$id]);
    }
    header('Location: match.php'); exit;
}
?>
<!doctype html>
<html><head><meta charset="utf-8"><title>Supprimer match</title><link rel="stylesheet" href="/assets/style.css"></head>
<body>
<form method="post">
    <p>Confirmer suppression du match #<?php echo htmlspecialchars($id); ?> ?</p>
    <button type="submit" name="confirm" value="1">Valider suppression</button>
    <button type="submit" name="cancel" value="1">Annuler</button>
</form>
</body></html>