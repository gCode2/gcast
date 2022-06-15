<?php

namespace app\controllers;

use core\App;
use core\Message;
use core\Utils;

/**
 * HelloWorld built in Amelia - sample controller
 *
 * @author Przemysław Kudłacik
 */
class GCastCtrl {
    
    public function action_index() {
        if(isset($_SESSION["id"])){
            App::getRouter()->redirectTo("wallView");
        }
        App::getSmarty()->display("index.tpl");
    }
    
}
