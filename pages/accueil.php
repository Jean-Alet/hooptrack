<?php include '../includes/_session.php'; ?>

<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>Accueil</title>
    <link rel="stylesheet" href="../css/style.css">
</head>
<body>
<header class="container">
    <div>
        <h1>Gestion équipe</h1>
        <div>Connecté : <?php echo htmlspecialchars($_SESSION['login']); ?></div>
    </div>
    <nav>
        <a href="accueil.php" class="button">Accueil</a>
        <a href="equipe.php" class="button">Équipe</a>
        <a href="match.php" class="btn">Matchs</a>
        <a href="feuille_match.php" class="btn">Feuille</a>
        <a href="statistiques.php" class="btn">Stats</a>
        <a href="../core/déconnecter.php" class="boutondeco">Déconnexion</a>
    </nav>
</header>

<?php include '../includes/_footer.php'; ?>
</body>
</html>