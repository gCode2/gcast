<?php

namespace app\controllers;

// use app\transfer\User;


use app\forms\LoginForm;
use core\App;
use core\ParamUtils;
use core\Utils;
use core\SessionUtils;
use core\Router;
use PDOException;

class LoginCtrl{
    private $form;
    public function __construct(){
        $this->form = new LoginForm();
    }
    public function validate(){
        $this->form->username = ParamUtils::getFromRequest('username');
        $this->form->password = ParamUtils::getFromRequest('password');
        
        if(!isset($this->form->username)) return false;
        if (empty($this->form->username)) {
			Utils::addErrorMessage("No username provided");
		}
		if (empty($this->form->password)) {
			Utils::addErrorMessage("No password provided");
		}
        if (App::getMessages()->isError()) return false;
            try{
                $this->record = App::getDB()->get("users", ["id", "email", "display_name", "name", "surname", "phone", "role", "created_at"], ["AND" => [
            "OR" =>[
            "email" => $this->form->username,
            "display_name" => $this->form->username
            ],
            "password" => $this->form->password
                ]]);
            }
            catch(PDOException $e){
                Utils::addErrorMessage("Couldn't search for users!");
            }
     if($this->record == null){
      Utils::addErrorMessage("Wrong login or password!");
    }
    
    return !App::getMessages()->isError();
    }

    function generateView(){
        //App::getSmarty()->assign('form',$this->form);
        App::getSmarty()->display("loginView.tpl");
    }

    public function action_loginShow(){
        $this->generateView();
    }

    public function action_logout(){
        session_destroy();
        App::getRouter()->redirectTo("index");
    }

    public function action_login(){
        if(isset($_SESSION["id"])){
            App::getRouter()->redirectTo("wallView");
        }
        if($this->validate()){
        SessionUtils::store('role', $this->record["role"]);
        SessionUtils::store('id', $this->record["id"]);
        SessionUtils::store('name', $this->record["name"]);
        Utils::addInfoMessage("Logged in successfully");
        App::getRouter()->forwardTo("wallView");
        }else{
            $this->generateView();
        }            
        }

}



?>