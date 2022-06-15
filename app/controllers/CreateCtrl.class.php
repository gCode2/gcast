<?php

namespace app\controllers;

use app\forms\CreateForm;
use core\App;
use core\Message;
use core\Utils;
use core\ParamUtils;
use core\SessionUtils;
use core\Router;
use core\CheckSession;
use PDOException;

/**
 * HelloWorld built in Amelia - sample controller
 *
 * @author Przemysław Kudłacik
 */
class CreateCtrl {
    private $form;
    private $user;
    public function __construct(){
        $this->form = new CreateForm();
    }
    
    public function action_createView(){
        CheckSession::checkSession();
        try{
           $this->user = App::getDB()->get("users", "name", ["id" => $_SESSION["id"]]);
        }catch(PDOException){
            Utils::addErrorMessage("Couldn't fetch user data!");
        }
        App::getSmarty()->assign("user", $this->user);
        
        if($this->validate()){
            $saveDir = "uploads/";
            $randomFileName = $this->generateFileName(). ".".pathinfo($_FILES["podcast"]["name"], PATHINFO_EXTENSION);
            $targetFile = $saveDir . $randomFileName;
            if (move_uploaded_file($_FILES["podcast"]["tmp_name"], $targetFile)) {

                try{
                App::getDB()->insert("podcasts", [
                    "title" => $this->form->title,
                    "description" => $this->form->description,
                    "filename" => $randomFileName,
                    "created_at" => date("Y-m-d H:i:s", time()),
                    "last_edit" => date("Y-m-d H:i:s", time()),
                    "user_id" => $_SESSION["id"],
                    "category_id"=>$this->form->category
                ]);
            }
            catch(PDOException $e){
                Utils::addErrorMessage("Couldn't create a podcast!");
            }
                Utils::addInfoMessage("Podcast created!");
            }
            else{
                Utils::addWarningMessage("Something went wrong...");
            }

            App::getRouter()->forwardTo("profile");
        }
        
        App::getSmarty()->display("createView.tpl");
    }

    function generateFileName($length = 12) {
    $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    $charactersLength = strlen($characters);
    $randomString = '';
    for ($i = 0; $i < $length; $i++) {
        $randomString .= $characters[rand(0, $charactersLength - 1)];
    }
    return $randomString;
}

    public function validate(){
        $this->form->title = ParamUtils::getFromRequest('title');
        $this->form->description = ParamUtils::getFromRequest('description');
        $this->form->category = ParamUtils::getFromRequest('category');
        if(!isset($_FILES['podcast'])){
            $this->form->file = "";
        }
        else{
            $this->form->file = $_FILES['podcast'];
        }
        


        if(!isset($this->form->title) || !isset($this->form->description) || !isset($this->form->category) || !isset($this->form->file)) return false;
        
        if(strlen($this->form->title)<3){
            Utils::addErrorMessage("Title should be at least 3 characters long!");
        }

        if(empty($this->form->title)){
            Utils::addErrorMessage("No title provided");
        }
        if(empty($this->form->description)){
            Utils::addErrorMessage("No description");
        }
        if(empty($this->form->category)){
            Utils::addErrorMessage("Please choose a category!");
        }
        if(empty($this->form->file)){
            Utils::addErrorMessage("Please select a valid audio file!");
        }
        if(App::getMessages()->isError()) return false;

        return !App::getMessages()->isError();

    }

    
}
