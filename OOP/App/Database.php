<?php
    namespace OOP\App;

class Database{
    protected static $conn;
    protected static $username = 'root';
    protected static $password = '';
    protected static $hostname = 'localhost';
    protected static $dbname = 'staditek2';
    public function __construct(){
        Database::setConn();
    }
    public static function setConn(){
        self::$conn = new \PDO(
            "mysql:host=".self::$hostname.";dbname=".
            self::$dbname,
            self::$username,
            self::$password
        );

        self::$conn -> setAttribute(\PDO::ATTR_ERRMODE, \PDO::ERRMODE_EXCEPTION);
    }

    public function getConn(){
        return self::$conn;
    }
}

try{
    $db = Database::setConn();
    print "berhasil<br>";

}catch(\Throwable $th){

}
 