<?php
try {
    $linkpdo = new PDO('mysql:host=localhost;dbname=basketball', 'root', '');
    $linkpdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (Exception $e) {
    die('Erreur BDD');
}

if (!empty($_POST)) {
    $original_num = $_POST['original_num'] ?? null;
    $num = $_POST['num_licence'] ?? '';
    $nom = $_POST['nom'] ?? '';
    $prenom = $_POST['prenom'] ?? '';
    $date_naiss = $_POST['date_naissance'] ?? null;
    $taille = $_POST['taille'] ?? null;
    $poids = $_POST['poids'] ?? null;
    $statut = $_POST['statut'] ?? 'Actif';
    $com = $_POST['commentaires'] ?? '';

    if ($original_num) {
        // si numéro change on suppr l'ancien et puis on insere le nouveau
        if ($original_num !== $num) {
            $linkpdo->beginTransaction();
            try {
                $suppr = $linkpdo->prepare('DELETE FROM joueur WHERE num_licence = ?');
                $suppr->execute([$original_num]);
                $ins = $linkpdo->prepare('INSERT INTO joueur (num_licence, nom, prenom, date_naissance, taille, poids, statut, commentaires) VALUES (?,?,?,?,?,?,?,?)');
                $ins->execute([$num, $nom, $prenom, $date_naiss, $taille, $poids, $statut, $com]);
                $linkpdo->commit();
            } catch (Exception $e) {
                $linkpdo->rollBack();
                die('Erreur BDD');
            }
        } else {
            $maj = $linkpdo->prepare('UPDATE joueur SET nom = ?, prenom = ?, date_naissance = ?, taille = ?, poids = ?, statut = ?, commentaires = ? WHERE num_licence = ?');
            $maj->execute([$nom, $prenom, $date_naiss, $taille, $poids, $statut, $com, $num]);
        }
    } else {
        $ins = $linkpdo->prepare('INSERT INTO joueur (num_licence, nom, prenom, date_naissance, taille, poids, statut, commentaires) VALUES (?,?,?,?,?,?,?,?)');
        $ins->execute([$num, $nom, $prenom, $date_naiss, $taille, $poids, $statut, $com]);
    }
}

header('Location: equipe.php');
exit;
?>