> **Une version améliorée de ce projet est disponible sur GitHub : [Jean-Alet/hooptrack_v2](https://github.com/Jean-Alet/hooptrack_v2)**  
> Elle repose sur une architecture API REST avec une sécurité renforcée.

# HoopTrack

**HoopTrack** est une application web PHP/MySQL de gestion d'une équipe de basketball, couvrant l'effectif, les matchs, les feuilles de match, les évaluations et les statistiques.

**Démo en ligne :** https://appbasket.infinityfreeapp.com/ — identifiants : `coach` / `basket`

## Fonctionnalités principales

1. **Joueurs** — ajouter, modifier, supprimer un joueur ; suivi des statuts (Actif, Blessé, Suspendu, Absent)
2. **Matchs** — planifier, modifier et supprimer des matchs ; saisie du score et du résultat (overtime inclus)
3. **Feuilles de match** — constituer le groupe, affecter un rôle (Titulaire / Remplaçant) et un poste à chaque joueur
4. **Évaluations** — attribuer une note (/10) et un commentaire par joueur après chaque match
5. **Statistiques** — bilan victoires/défaites de l'équipe ; par joueur : titularisations, remplacements, moyenne de note, % de victoires, matchs consécutifs
6. **Authentification** — connexion par login/mot de passe (bcrypt), session PHP, déconnexion

## Structure du projet

- `index.php` — redirige vers la page de connexion
- `pages/` — pages d'affichage (`*_disp.php`)
- `core/` — traitements POST (un fichier par action)
- `includes/` — composants réutilisables : connexion PDO (`_linkpdo.php`), requêtes SQL (`_queries.php`), protection de session (`_session.php`), fragments HTML
- `css/` — feuille de style et logo
- `data/basketball.sql` — dump complet de la base de données

### Flux d'une requête

```
Navigateur → pages/*_disp.php  →  core/*.php  →  includes/_queries.php  →  MySQL
```

## Base de données

Quatre tables composent le schéma :

- `joueur` — num_licence (PK), nom, prénom, date de naissance, taille, poids, nationalité, statut, commentaires
- `match` — id_match (PK auto), date, équipe adverse, lieu, résultat, scores, overtime
- `feuille_match` — clé primaire composée (id_match, num_licence), rôle, poste, note, commentaire ; suppressions en cascade
- `utilisateur` — login, hash bcrypt du mot de passe

## Installation locale

Prérequis : PHP 8.x, MySQL / MariaDB, serveur web local (XAMPP, Laragon…)

```bash
# Cloner le dépôt dans le dossier web du serveur
git clone https://github.com/Jean-Alet/hooptrack.git

# Créer la base et importer le schéma
mysql -u root -e "CREATE DATABASE basketball CHARACTER SET utf8mb4;"
mysql -u root basketball < data/basketball.sql

# Adapter la connexion PDO dans includes/_linkpdo.php
# puis ouvrir http://localhost/hooptrack/
```

## Sécurité

- Pages protégées par vérification de session (`_session.php`)
- Mots de passe hachés avec `password_hash` (bcrypt), vérifiés avec `password_verify`
- Requêtes SQL via PDO avec paramètres liés — aucune concaténation directe
- Valeurs HTML échappées avec `htmlspecialchars`
- Validation des données POST avant toute insertion (champs obligatoires, valeurs d'enum, types numériques)

## Technologies

- PHP 8.x, MySQL / MariaDB, PDO
- HTML / CSS (sans framework JS)

## Licence

Ce projet est sous licence **CC BY-NC 4.0** — utilisation personnelle et académique autorisée avec attribution ; toute utilisation commerciale est interdite sans accord explicite de l'auteur.
