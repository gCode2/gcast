<?php

namespace app\controllers;

use core\App;
use core\Message;
use core\Utils;
use core\SessionUtils;
use core\ParamUtils;
use core\CheckSession;
use app\forms\CommentForm;
use PDOException;

class PodcastViewCtrl{
    private $commForm;
    private $comments;
    public $likes;
    public function __construct(){
        $this->commForm = new CommentForm();
    }

    public function validate(){
        //validating comment (for example bad words filter)
        $this->commForm->content = ParamUtils::getFromRequest("comment");

        if(!isset($this->commForm->content)) return false;
        if(empty($this->commForm->content)){
            Utils::addErrorMessage("Comment cannot be empty!");
        }

        return !App::getMessages()->isError();
    }

    public function load_data(){
        $this->validate();

        try{
            $this->comments = App::getDB()->select("comments",["[><]users" => ["user_id" => "id"]],["comments.content","comments.date","users.name","users.surname","users.display_name"],["podcast_id"=>$_GET["p_id"], "ORDER"=>["comments.date"=>"DESC"]]);
        }catch(PDOException $e){
            Utils::addErrorMessage("Couldn't update comments");
        }
        
    }



    public function generateView(){
        App::getSmarty()->display("podcastView.tpl");
    }

    public function action_podcastView(){
        CheckSession::checkSession();
        if(!is_numeric($_GET["id"])){
            App::getRouter()->redirectTo("wallView");
        }
        try{
            $podcast = App::getDB()->get("podcasts", ["[><]categories" => ["category_id"=>"id"], "[><]users"=>["user_id"=>"id"]],["podcasts.id","podcasts.description","podcasts.title","podcasts.filename", "podcasts.created_at","podcasts.category_id","categories.cat_name", "podcasts.user_id", "users.name", "users.surname","users.display_name"],["podcasts.id" => $_GET["id"]]);
            $v = App::getDB()->get("views","*",["user_id"=>$_SESSION["id"], "podcast_id"=>$podcast["id"]]);
            $podcast["likes"] = App::getDB()->count("likes",["podcast_id"=>$podcast["id"]]);
            $podcast["views"] = App::getDB()->count("views",["podcast_id"=>$podcast["id"]]);
            $podcast["comments"] = App::getDB()->count("comments",["podcast_id"=>$podcast["id"]]);
            
            $comments = App::getDB()->select("comments",["[><]users" => ["user_id" => "id"]],["comments.content","comments.date","users.name","users.surname","users.display_name"],["podcast_id"=>$_GET["id"], "ORDER"=>["comments.date"=>"DESC"]]);
            if($v == null){
                $v = App::getDB()->insert("views", ["user_id"=>$_SESSION["id"], "podcast_id"=>$podcast["id"]]);
                $vC = App::getDB()->count("views", ["podcast_id"=>$podcast["id"]]);
            }
            else{
                // counter can't go up twice as you watch second time
            }

            if($podcast == null){
                App::getRouter()->redirectTo("wallView");
            }
            $this->likes = App::getDB()->get("likes","*",["user_id"=>$_SESSION["id"], "podcast_id"=>$_GET["id"]]);
                    if($this->likes !== null){
                        $this->likes = true;
                    }
                    else{
                        $this->likes = false;
                    }
        }
        catch(PDOException $e){
            Utils::addErrorMessage("Couldn't fetch podcast information:(");
        }
        App::getSmarty()->assign('comments', $comments);
        App::getSmarty()->assign('likes', $this->likes);
        App::getSmarty()->assign('podcast', $podcast);

        $this->generateView();
    }

    


    public function action_like(){
        CheckSession::checkSession();
        if(!isset($_GET["p_id"]) || !is_numeric($_GET["p_id"])){
            Utils::addErrorMessage("There's no such podcast!");
            App::getRouter()->forwardTo("wallView");
        }
        try{
            $r = App::getDB()->get("podcasts","*",["id"=>$_GET["p_id"]]);
            if($r == null){
                Utils::addErrorMessage("There's no such podcast!");
                App::getRouter()->forwardTo("wallView");
            }
        }
        catch(PDOException $e){
            Utils::addErrorMessage("Couldn't reach database!");
        }


        try{
            $f = App::getDB()->get("likes","*",["user_id"=>$_SESSION["id"], "podcast_id"=>$_GET["p_id"]]);
        }catch(PDOException $e){
            Utils::addErrorMessage("Couldn't reach database!");
        }
        if($f == null){
            try{
                App::getDB()->insert("likes", ["user_id"=>$_SESSION["id"], "podcast_id"=>$_GET["p_id"]]);
                echo "<i class='fas fa-heart' style='color:#ff6363'></i>";
                // App::getDB()->update("podcasts", ["likes[+]"=>1],["id"=>$_GET["p_id"]]);
            }catch(PDOException $e){
                Utils::addErrorMessage("Couldn't reach database!");
            }
        }
        else{
            try{
                App::getDB()->delete("likes", ["AND"=>["user_id"=>$_SESSION["id"], "podcast_id"=>$_GET["p_id"]]]);
                echo "<i class='fas fa-heart text-light'></i>";
                // App::getDB()->update("podcasts", ["likes[-]"=>1],["id"=>$_GET["p_id"]]);
            }catch(PDOException $e){
                Utils::addErrorMessage("Couldn't reach database!");
            }
                
        }


    }
    public function action_updateLikes(){
        CheckSession::checkSession();
        try{
            $lC = App::getDB()->count("likes",["podcast_id"=>$_GET["p_id"]]);
            echo "<i class='fas fa-heart'></i> ".$lC;
        }
        catch(PDOException){
            Utils::addErrorMessage("Couldn't update like counter");
        }
    }

    public function action_addComment(){
        CheckSession::checkSession();
        if($this->validate()){
            try{
                $newComment = App::getDB()->insert("comments", ["content"=>$this->commForm->content, "date"=>date("Y-m-d H:i:s", time()), "parent_id"=>-1, "user_id"=>$_SESSION["id"], "podcast_id"=>$_GET["p_id"]]);
            }
            catch(PDOException $e){
                Utils::addErrorMessage("Couldn't reach the database");
            }
        }
        else{
         Utils::addErrorMessage("Comment cannot be empty!");   
        }
    }

    public function action_commentsList(){
        CheckSession::checkSession();
        $this->load_data();
        App::getSmarty()->assign('comments', $this->comments);
        App::getSmarty()->display("commentsList.tpl");
    }

}


?>