<?php
include "db_config.php";
class Db
{
    protected $p;
    protected $dbh;

    public function __construct()
    {
        if (!isset($this->dbh)) {
            // Connect to the database
            try {

                date_default_timezone_set('America/Caracas');
                setlocale(LC_ALL, "es_VE.UTF-8", "es_VE", "esp");

                $conn = new PDO(
                    "mysql:host=" . DB_HOST . ";dbname=" . DB_DATA_BASE,
                    DB_USER,
                    DB_PASSWORD,
                    array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8")
                );
                $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                $this->dbh = $conn;
            } catch (PDOException $e) {
                die("Failed to connect with MySQL: " . $e->getMessage());
            }
        }
    }

    public function SetNames()
    {
        return $this->dbh->query("SET NAMES 'utf8'");
    }

    public function getConection()
    {
        return $this->dbh;
    }

    ###### FIN DE CLASE #####	

}
