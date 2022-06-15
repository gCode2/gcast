<?php


namespace app\controllers;

use app\forms\PodcastEditForm;
use core\App;
use core\Message;
use core\Utils;
use core\ParamUtils;
use core\SessionUtils;
use core\Router;
use core\CheckSession;
use PDOException;


class EditCtrl{
    private $form;
    public $podcast;
    public function __construct(){
    $this->form = new PodcastEditForm();
    }





    public function action_editView(){
        CheckSession::checkSession();
        if(!isset($_GET["id"]) || !is_numeric($_GET["id"])){
            App::getRouter()->redirectTo("profile");
        }
        try{
            $this->podcast = App::getDB()->get("podcasts", ["id","title","description","filename","category_id"],["AND" => ["user_id" => $_SESSION["id"], "id" => $_GET["id"]]]);
        }catch(PDOException $e){
            Utils::addErrorMessage("Couldn't fetch podcast from DB");
        }
        App::getSmarty()->assign('podcast', $this->podcast);
        if($this->validate()){

            try{
                App::getDB()->update("podcasts", ["title"=>$this->form->title, "description"=>$this->form->description, "category_id"=>$this->form->category, "last_edit" => date("Y-m-d H:i:s", time())], ["id" => $_GET["id"]]);
                if(isset($_FILES['podcast'])){
                    $saveDir = "uploads/";
                    $targetFile = $saveDir.$this->podcast["filename"];

                    if (move_uploaded_file($_FILES["podcast"]["tmp_name"], $targetFile)) {
                        Utils::addInfoMessage("File updated!");
                    }
                    else{
                        // Utils::addErrorMessage("Something's wrong!");
                    }
                    
                }
                Utils::addInfoMessage("Podcast edited!");
                App::getRouter()->forwardTo('profile');
                }
            catch(PDOException $e){
                Utils::addErrorMessage("Couldn't update database!");
            }

        }
        else{
            // Utils::addErrorMessage("Something's wrong");
        }
        App::getSmarty()->display("editView.tpl");


    }
    function validate(){

        $this->form->title = ParamUtils::getFromRequest('title');
        $this->form->description = ParamUtils::getFromRequest('description');
        $this->form->category = ParamUtils::getFromRequest('category');
        
        


        if(!isset($this->form->title) || !isset($this->form->description) || !isset($this->form->category)) return false;
        
        if(empty($this->form->title)){
            Utils::addErrorMessage("No title provided");
        }
        if(strlen($this->form->title)<3){
            Utils::addErrorMessage("Title should be at least 3 characters long!");
        }
        if(empty($this->form->description)){
            Utils::addErrorMessage("No description");
        }
        if(empty($this->form->category)){
            Utils::addErrorMessage("Please choose a category!");
        }
        if(App::getMessages()->isError()) return false;

        return !App::getMessages()->isError();


    }

}




?>