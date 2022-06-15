<?php

namespace app\controllers;

// use app\transfer\User;
use app\forms\RegisterForm;
use core\App;
use core\ParamUtils;
use core\Utils;
use core\Router;
use PDOException;

class RegisterCtrl{
    private $form;

    public function __construct(){
        $this->form = new RegisterForm();
    }

    function generateView(){
        //App::getSmarty()->assign('form',$this->form);
        App::getSmarty()->display("regView.tpl");
    }

    public function validate(){
        $this->form->name = ParamUtils::getFromRequest('name');
        $this->form->surname = ParamUtils::getFromRequest('surname');
        $this->form->email = ParamUtils::getFromRequest('email');
        $this->form->username = ParamUtils::getFromRequest('username');
        $this->form->phone = ParamUtils::getFromRequest('phone');
        $this->form->password = ParamUtils::getFromRequest('password');
        $this->form->password2 = ParamUtils::getFromRequest('password2');

        if(!isset($this->form->name) || !isset($this->form->surname) || !isset($this->form->email)||!isset($this->form->username)||!isset($this->form->phone)||!isset($this->form->password)) return false;

        if(empty($this->form->name) || empty($this->form->surname) || empty($this->form->email)||empty($this->form->username)||empty($this->form->phone)||empty($this->form->password)){
            Utils::addErrorMessage("Provide all data!");
        }

        try{
            $email = App::getDB()->get("users", "email",["email"=>$this->form->email]);
            if($email !== null){
                Utils::addErrorMessage("There is account using provided email");
            }
            $username = App::getDB()->get("users", "display_name",["display_name"=>$this->form->username]);
            if($username !== null){
                Utils::addErrorMessage("Username already exist!");
            }
            $phone = App::getDB()->get("users","phone",["phone"=>$this->form->phone]);
            if($phone !== null){
                Utils::addErrorMessage("Someone is using this phone number already!");
            }
        }
        catch(PDOException $e){

        }

        if($this->form->password !== $this->form->password2){
            Utils::addErrorMessage("Passwords do not match!");
        }

        return !App::getMessages()->isError();
    }

    public function action_register(){
        // $this->getParams();
        if(isset($_SESSION["id"])){
            App::getRouter()->redirectTo("wallView");
        }
        if($this->validate()){
            try{
                $newAcc = App::getDB()->insert("users",[
                            "name" => $this->form->name,
							"surname" => $this->form->surname,
							"email" => strtolower($this->form->email),
                            "display_name" => strtolower($this->form->username),
							"phone" => $this->form->phone,
							"password" => $this->form->password,
                            "role" => "user",
                            "created_at" => date("Y-m-d")
                ]);
            }
            catch(PDOException $e){
                Utils::addErrorMessage('Unexpected error has occured when tried to create an account');
            }
            App::getRouter()->redirectTo("login");
        }else{
            $this->generateView();
        }
    }

}



?>