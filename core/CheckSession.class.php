<?php

namespace core;
class CheckSession{
    public static function checkSession(){
        if(!isset($_SESSION["role"]) || ($_SESSION["role"] !== "user" && $_SESSION["role"] !== "admin")){
            App::getRouter()->redirectTo("logout");
        }
    }
}

?>