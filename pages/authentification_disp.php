<?php include '../core/authentification.php'; ?>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>Authentification</title>
    <link rel="stylesheet" href="../css/style.css">
</head>
<body>
<?php include '../includes/_error.php'; ?>

    <form action="" method="post">
        Login : <input type="text" name="login">
        Mot de passe : <input type="password" name="mdp">
        <input type="submit" value="Envoyer">
    </form>
    <br />
</body>
</html>