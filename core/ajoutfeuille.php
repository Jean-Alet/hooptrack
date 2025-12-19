<?php include '../includes/_linkpdo.php';

$entrees  = [];
$id_match = $_POST['id_match'] ?? 0;

for ($i = 0; $i < 12; $i++) {
    if (!isset($_POST["player_$i"])) {
        break;
    }

    if ($_POST["player_$i"] === '') {
        continue;
    }

    $entrees[] = [
        'num'   => $_POST["player_$i"],
        'role'  => $_POST["role_$i"],
        'poste' => $_POST["poste_$i"]
    ];
}

$nbTitulaires = 0;
foreach ($entrees as $e) {
    if ($e['role'] === 'Titulaire') {
        $nbTitulaires++;
    }
}
if ($nbTitulaires < 5) {
    $error = "Il faut au moins 5 titulaires";
    include '../pages/feuille_match.php';
    exit;
}

$nums = array_column($entrees, 'num');
if (count($nums) !== count(array_unique($nums))) {
    $error = "Un joueur est sélectionné plusieurs fois";
    include '../pages/feuille_match.php';
    exit;
}

$titulaires = [];
foreach ($entrees as $e) {
    if ($e['role'] === 'Titulaire') {
        if (isset($titulaires[$e['poste']])) {
            $error = "Un seul titulaire autorisé par poste";
            include '../pages/feuille_match.php';
            exit;
        }
        $titulaires[$e['poste']] = true;
    }
}

$linkpdo->beginTransaction();

$linkpdo->prepare(
    "DELETE FROM feuille_match WHERE id_match = ?"
)->execute([$id_match]);

$ins = $linkpdo->prepare(
    "INSERT INTO feuille_match (id_match, num_licence, role, poste)
     VALUES (?, ?, ?, ?)"
);

foreach ($entrees as $e) {
    $ins->execute([
        $id_match,
        $e['num'],
        $e['role'],
        $e['poste']
    ]);
}

$linkpdo->commit();

header("Location: ../pages/feuille_match.php?id_match=$id_match");
exit;