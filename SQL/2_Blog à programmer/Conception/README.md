# Programmation SQL : Conception

Votre mission pour ce nouveau projet est de créer une base de données d’un site de blog.

Voici les informations nécessaires à la création de la base de données :

Il s’agit donc d’un blog.
Sur ce blog sont publiés des <b>articles</b>, composé d’un <b>titre</b>, d’un <b>texte</b> et d’un <b>résumé</b> (ou extrait).
Ils sont écrits par des <b>utilisateurs</b> (<b>pseudo, email, mot de passe</b>).

Les articles doivent appartenir à au moins une <b>catégorie</b>.
Chaque catégorie est composée d’un <b>nom</b> et d’une <b>description</b>.

Il est possible de commenter les articles.
Si le commentateur est un utilisateur enregistré, le <b>commentaire</b> est lié à son compte.
Mais il est aussi possible de commenter un article sans être connecté, sans même avoir de compte.

Sur la page d’accueil, les articles sont affichés (titre, date, auteur et résumé).
Ils sont triés par <b>date de publication</b>.

En dehors de la page principale, il existe trois types de pages :

- une page utilisateur, reprenant les articles écrits par un utilisateur triés par date,
- une page catégorie, qui affiche les articles d’une catégorie, également triés par date,
- et enfin une page article, qui affiche un article complet ainsi que ses commentaires par ordre chronologique.

Merci de relever ce nouveau défi !

> Proposez un MCD <b>AVANT</b> de voir la correction à l'étape 2
