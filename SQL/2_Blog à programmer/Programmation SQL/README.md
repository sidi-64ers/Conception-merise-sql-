# Programmation SQL
  
## Exercice 1 : FONCTION

Créer une fonction « DateFrench » qui permet d’afficher une date de type « datetime » au format français DD/MM/YYYY. Ex : 13/04/2018.

> Mots clés : DATE_FORMAT, CREATE FUNCTION ...

## Exercice 2 : VUE

Afin d’afficher la liste des derniers articles sur la page d’accueil, créez une vue « vueArticles » qui retourne l’identifiant, la date de publication (format français), le pseudo de l’auteur, le titre et le résumé de chaque article (triés du plus récent au plus vieux). Sans oublier le nombre de commentaires liés à ces articles.

> Mot clé : CREATE VIEW ...

## Exercice 3 : PROCEDURE STOCKEE

Pour afficher un article en particulier sur une page du blog, créez une procédure stockée « psArticle » qui retourne l’article complet : titre, résumé, contenu, date de publication au format français et pseudo de l’auteur.

> Mot clé : CREATE PROCEDURE ...

L'intérêt de créer une proc sto est de pouvoir regrouper plusieurs actions au sein d'un seul bloc de code SQL. Par exemple, trouvez une solution qui permettent de comptabiliser le nombre de lecture d'un article ... Indication : Vous aurez probablement besoin d'ajouter une colonne à la table articles.

## Exercice 4 : TRIGGER

Les auteurs d’articles n’écrivent pas systématiquement un résumé de leur article.
Créez donc deux Trigger « trArticlesBeforeInsert » et « trArticlesBeforeUpdate » sur ajout et sur modification d’un article pour créer automatiquement un résumé en prenant les 150 premiers caractères de l’article, si l’auteur n’en a pas écrit.

> Mot clé : CREATE TRIGGER ...

## Exercice 5 :VARABLES ET CURSEUR

Pour compléter l'article, ajoutez à la procsto « psArticle » les catégories de l'article dans une colonne virtuelle "catégories", en y concaténant les noms des catégories de l'article.

> Mots clés : DECLARE, CURSOR FOR ...

## Exercice 6 : TRANSACTION ET GESTION DES ERREURS

Il ne reste plus, pour que ce soit parfait, à intégrer une gestion d'erreur pour ne jamais planter la base dans une procsto !

> Mots clés : START TRANSACTION, COMMIT, ROLLBACK, DECLARE EXIT HANDLER FOR SQLEXCEPTION ...
