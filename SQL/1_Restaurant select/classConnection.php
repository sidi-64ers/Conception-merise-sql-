<?php
class Connexion{
    private $user = "sidi";
    private $mdp = "ai31080412";
    private $dsn;

    private $cmdLibellé = ["idCommande", "dateCommande", "idEmploye", "idTable", "idService"];

    public function __construct(){
        $this->dsn = new PDO('mysql:host=localhost;dbname=restaurant;charset=UTF8', $this->user, $this->mdp);
    }

    public function select($stmt, $once = false){
        $this->req = $this->dsn->prepare($stmt);
        $this->req->execute();
        return $once == false ? $this->req->fetchAll(PDO::FETCH_ASSOC) : $this->req->fetch(PDO::FETCH_ASSOC);
    }

    public function tableit($datas, $cmd = false){
        echo "
            <table class='centered'><thead><tr>";
                if($cmd == false){
                    foreach($this->cmdLibellé as $name){
                        echo "<th>" . $name . "</th>";
                    }
                }else{
                    foreach($cmd as $name){
                        echo "<th>" . $name . "</th>";
                    }
                }

        echo "</tr></thead><tbody>";

        foreach($datas as $data){
            echo '<tr>';
            foreach($data as $val){   
                echo "<td>" . $val . "</td>";
            }

            echo "</tr>";
        }
    
    echo "</tbody></table>"; 
    }

}