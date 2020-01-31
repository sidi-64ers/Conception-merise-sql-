<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">


</head>
<body>
    
    <main>

    <?php
        require "classConnection.php";
        $conn = new Connexion(); 

        // ETAPE 1
        // 1. Lister les commandes de la table n°10, les trier par date chronologique (SELECT WHERE ORDER BY)
        $req1 = $conn->select("SELECT * from commandes WHERE idTable=10 ORDER BY dateCommande ASC");               
        $conn->tableIt($req1);

        // 2. Liste les commandes de la table n°10 ou n°6 pour le service du midi (AND, OR IN)
       $req2 = $conn->select("SELECT * FROM commandes WHERE idTable IN (6, 10) AND idService=1 ORDER BY dateCommande ASC");
       $conn->tableit($req2);

        // 3. Afficher le nb de commandes passé à la table n°10 (COUNT et AS)
   
        $req3= $conn->select("SELECT COUNT(idTable) FROM `commandes` WHERE idTable=10");
        $conn->tableit($req3);

        // 4. Afficher le nb de commande passé à la table n°10, pour chacun des services midi et soir (GROUP BY)
        
    $req4= $conn->select("SELECT COUNT(idTable) FROM `commandes` WHERE idTable=10 GROUP BY idService");
        $conn->tableit($req4);

        // 5. Reprendre la requête précédente et remplacer l'id du service par Midi ou Soir (CASE WHEN)
        

        //6. Afficher les commandes à venir, les trier par date anti-chronologique (NOW) 
       

        // 7. Afficher les commandes du dernier trimestre 2019 (YEAR, MONTH)
      

        // 8. Reprendre la requête précédente et remplacer la date de commande par le mois et l'année : octobre 2019 (DATE_FORMAT)
       

        // 9. Afficher le nb de commandes total pour chaque mois de l'année 2019
       

        // 10. Reprendre la requête précédente en n'affichant que les mois pour lesquels il y a au moins 5 commandes 
      


        // 1. Lister les noms des employés qui n'ont pris aucune commande
        
        
        // 2. Lister les noms des employés qui ont pris plus de 5 commandes en 2019
       

        // 3. Lister les noms des boissons qui n'ont jamais été commandées
        

        //   4. Afficher le nom des boisson qui ont été commandées au moins 10 fois


         // 1. Afficher la liste des plats avec comme colonnes : "Plat", "Type" et "Prix" (utilisez des alias)
        

       


       

       



        // 4. Afficher aussi les commandes pour lesquels aucun menu n’a été commandé (LEFT JOIN)

        // 5. Afficher la même chose pour les plats à la carte

        // 6. Afficher pour chaque mois de 2019 le CA total hors boisson (menu + plat à la carte)
    ?>

    </main>
</body>
</html>