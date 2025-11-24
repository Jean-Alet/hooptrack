<?php
session_start();

if (empty($_SESSION['login'])) {
    header('Location: authentification.php');
    exit;
}

?>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>Accueil</title>
    <link rel="stylesheet" href="/assets/style.css">
</head>
<body>
<header class="container" style="display:flex;align-items:center;justify-content:space-between;margin-bottom:18px;">
    <div>
        <h1 style="margin:0;font-size:20px;">Gestion équipe</h1>
        <div style="color:#555;font-size:13px;">Connecté : <?php echo htmlspecialchars($_SESSION['login']); ?></div>
    </div>
    <nav>
        <a href="accueil.php" class="btn">Accueil</a>
        <a href="equipe.php" class="btn">Équipe</a>
        <a href="match.php" class="btn">Matchs</a>
        <a href="feuille_match.php" class="btn">Feuille</a>
        <a href="statistiques.php" class="btn">Stats</a>
        <a href="../core/déconnecter.php" class="boutondeco">Déconnexion</a>
    </nav>
</header>

<main class="container">
    <h2>Accueil</h2>
    <p>Bienvenue, <?php echo htmlspecialchars($_SESSION['login']); ?>.</p>

    <div class="actions">
        <a href="equipe.php" class="btn">Consulter l'équipe</a>
        <a href="match.php" class="btn">Consulter les matchs</a>
        <a href="feuille_match.php" class="btn">Préparer feuille</a>
        <a href="statistiques.php" class="btn">Statistiques</a>
    </div>
</main>

<footer class="container" style="margin-top:14px;text-align:center;color:#666;font-size:13px;">
    &copy; <?php echo date('Y'); ?> - Application Entraîneur
</footer>
</body>
</html>