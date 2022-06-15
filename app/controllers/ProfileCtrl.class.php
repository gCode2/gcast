<?php

namespace app\controllers;

use core\App;
use core\Message;
use core\Utils;
use core\SessionUtils;
use core\ParamUtils;
use app\forms\SearchForm;
use app\forms\EditForm;

use core\CheckSession;
use PDOException;
/**
 * HelloWorld built in Amelia - sample controller
 *
 * @author Przemysław Kudłacik
 */
class ProfileCtrl {
public $data;
public $role;
public $podcasts;
public $isMore;
private $form;
private $editForm;
private $records;
private $user;
private $userData;
private $PodcastCategories;
private $followers;
private $following;
private $podcastsToShow;

    public function __construct(){
        $this->form = new SearchForm();
        $this->editForm = new EditForm();
    }

    public function validate(){
        // searching
        $this->form->search = ParamUtils::getFromRequest('searchPodcasts');
        
        // editing user data
        $this->editForm->name = ParamUtils::getFromRequest('name');
        $this->editForm->surname = ParamUtils::getFromRequest('surname');
        $this->editForm->email = ParamUtils::getFromRequest('email');
        $this->editForm->bio = ParamUtils::getFromRequest('bio');
        $this->editForm->phone = ParamUtils::getFromRequest('phone');
        $this->editForm->password = ParamUtils::getFromRequest('password');
        $this->editForm->password2 = ParamUtils::getFromRequest('password2');

        

        if(!isset($this->editForm->name) || !isset($this->editForm->surname) || !isset($this->editForm->email)||!isset($this->editForm->phone)||!isset($this->editForm->password)) return false;

        if(empty($this->editForm->name) || empty($this->editForm->surname) || empty($this->editForm->email)||empty($this->editForm->phone)||empty($this->editForm->password)){
            Utils::addErrorMessage("Provide all data!");
        }

        if($this->editForm->password !== $this->editForm->password2){
            Utils::addErrorMessage("Passwords do not match!");
        }

        
        

        return !App::getMessages()->isError();
    }
    public function load_data(){
        $this->validate();
        // echo $this->form->search;
        
        if(str_starts_with($this->form->search, "@")){
            App::getSmarty()->assign('searchType', 'users');
            if(strlen($this->form->search) > 1){
            try{
                $this->records = App::getDB()->select("users", ["id","name","surname","display_name"],["display_name[~]"=>ltrim($this->form->search,"@")."%"]);
            }
            catch(PDOException $e){
                Utils::addErrorMessage('Unknown database error has occured');
            if (App::getConf()->debug)
                Utils::addErrorMessage($e->getMessage());
            }
        }
        }
        else{
            App::getSmarty()->assign('searchType', 'podcasts');
            if(strlen($this->form->search) > 2){
            try{
                $this->records = App::getDB()->select("podcasts",["[><]categories"=>["category_id"=>"id"]], ["podcasts.id","podcasts.title","categories.cat_name"],["podcasts.title[~]"=>"%".$this->form->search."%"]);
            }
            catch(PDOException $e){
                Utils::addErrorMessage('Unknown database error has occured');
            if (App::getConf()->debug)
                Utils::addErrorMessage($e->getMessage());
            }
        }
        else{
            $this->form->search = "";
        }
    }
    }
    

    public function action_profile() {
        
        CheckSession::checkSession();
        try{
        $this->userData = App::getDB()->get("users",["name", "surname", "email", "bio", "phone", "password"], ["id" => $_SESSION["id"]]);

        $this->podcasts = App::getDB()->select("podcasts", ["[><]categories" => ["category_id"=>"id"]], ["podcasts.id","podcasts.description","podcasts.title","podcasts.filename", "podcasts.category_id","categories.cat_name", "podcasts.user_id"],["user_id" => $_SESSION["id"], "ORDER" =>["created_at" => "DESC"]]);
        foreach($this->podcasts as $key=>$value){
                        $this->podcasts[$key]["likes"] = App::getDB()->count("likes",["podcast_id"=>$value["id"]]);
                        $this->podcasts[$key]["views"] = App::getDB()->count("views",["podcast_id"=>$value["id"]]);
                        $this->podcasts[$key]["comments"] = App::getDB()->count("comments",["podcast_id"=>$value["id"]]);
                    }


        $this->userStats["views"] = App::getDB()->count("views",["[><]podcasts"=>["podcast_id"=>"id"]],"*",["podcasts.user_id"=>$_SESSION["id"]]);
        $this->userStats["likes"] = App::getDB()->count("likes",["[><]podcasts"=>["podcast_id"=>"id"]],"*",["podcasts.user_id"=>$_SESSION["id"]]);
        $this->userStats["comments"] = App::getDB()->count("comments",["[><]podcasts"=>["podcast_id"=>"id"]],"*",["podcasts.user_id"=>$_SESSION["id"]]);
        $this->userStats["followers"] = App::getDB()->count("followers",["user_id"=>$_SESSION["id"]]);
        $this->userStats["viewed"] = App::getDB()->count("views",["user_id"=>$_SESSION["id"]]);
        $this->userStats["liked"] = App::getDB()->count("likes",["user_id"=>$_SESSION["id"]]);
        $this->userStats["commented"] = App::getDB()->count("comments",["user_id"=>$_SESSION["id"]]);
        $this->userStats["followed"] = App::getDB()->count("followers",["follower_id"=>$_SESSION["id"]]);
        }
        catch(PDOException $e){
            Utils::addErrorMessage("Couldn't load user info!");
        }
        App::getSmarty()->assign('userStats', $this->userStats);
        App::getSmarty()->assign('userData', $this->userData);
        App::getSmarty()->assign('podcasts', $this->podcasts);
        App::getSmarty()->display("profile.tpl");
    }

    public function action_editData(){
        
        CheckSession::checkSession();
         if($this->validate()){
             try{
                $updated = App::getDB()->update("users",[
                            "name" => $this->editForm->name,
							"surname" => $this->editForm->surname,
							"email" => $this->editForm->email,
                            "bio" => $this->editForm->bio,
							"phone" => $this->editForm->phone,
							"password" => $this->editForm->password
                ],["id" => $_SESSION["id"]]);
            }
            catch(PDOException $e){
                Utils::addErrorMessage('Unexpected error has occured when tried to create an account');
            }
            
         Utils::addInfoMessage("Your data has been edited!");
         }
         App::getRouter()->forwardTo("profile");
    }

    public function action_wallView(){
        
        $role = App::getSmarty()->getTemplateVars('role');
        $id = App::getSmarty()->getTemplateVars('id');
        $_SESSION["toShow"] = 10;
        CheckSession::checkSession();
        try{
            $this->user = App::getDB()->get("users","name",["id" => $_SESSION["id"]]);
            
        }
        catch(PDOException $e){
            Utils::addErrorMessage("Couldn't load user data!");
        }
        
        $this->load_podcasts();

        $this->load_data();
        App::getSmarty()->assign('isMore', $this->isMore);
        App::getSmarty()->assign('podcastsCats', $this->PodcastsCategories);
        App::getSmarty()->assign('podcastsToShow', $this->podcastsToShow);
        App::getSmarty()->assign('followers', $this->followers);
        App::getSmarty()->assign('following', $this->following);
        App::getSmarty()->assign('searchForm', $this->form);
        App::getSmarty()->assign('results', $this->records);
        App::getSmarty()->assign('user', $this->user);
        App::getSmarty()->display("mainPage.tpl");
        
    }
    private static function podcastSort($a,$b) {
        $datetime1 = strtotime($a['created_at']);
        $datetime2 = strtotime($b['created_at']);
        return $datetime2 - $datetime1;
    }

    public function action_showMore(){
        
        CheckSession::checkSession();
        $_SESSION["toShow"]+=10;
        $this->load_podcasts();
        App::getSmarty()->assign('isMore', $this->isMore);
        App::getSmarty()->assign('podcastsToShow', $this->podcastsToShow);
        App::getSmarty()->display("podcastsList.tpl");
    }
    public function load_podcasts(){
        try{
            $this->following= App::getDB()->select("followers",["[>]users" => ["user_id" => "id"]],["users.id","users.name","users.surname", "users.display_name"], ["follower_id"=>$_SESSION["id"],"ORDER"=>["followers.follow_date"=>"DESC"]]);
            $this->followers = App::getDB()->select("followers",["[>]users" => ["follower_id" => "id"]],["users.id","users.name","users.surname", "users.display_name"], ["user_id"=>$_SESSION["id"],"ORDER"=>["followers.follow_date"=>"DESC"]]);

        }catch(PDOException $e){
            Utils::addErrorMessage("Couldn't fetch followers!");
        }
        $mainPagePodcasts = [];
        $count = 0;
        $this->podcastsToShow = [];
        $this->PodcastsCategories = array("1","2","3","4","5","6","7","8","9","10","11","12");
        $this->PodcastsCategories = array_fill_keys($this->PodcastsCategories, 0);
        $PodcastsCategories2 = [];
        try{
            //getting all podcasts from followed people
            foreach($this->following as $key=>$value){
               $r = App::getDB()->select("podcasts", ["[><]categories" => ["category_id"=>"id"], "[><]users"=>["user_id"=>"id"]], ["users.name", "users.surname", "users.display_name","podcasts.id","podcasts.description","podcasts.title","categories.id(cat_id)","categories.cat_name", "podcasts.created_at", "podcasts.user_id"],["user_id" => $value["id"], 'ORDER'=>["podcasts.created_at" => "DESC"]]);
               if($r == null){
                   continue;
               }
               else{
                array_push($mainPagePodcasts, $r);
               }
               
            }
            foreach($mainPagePodcasts as $key=>$value){
                
                foreach($value as $k=>$v){
                    array_push($this->podcastsToShow, $v);
                    array_push($PodcastsCategories2,$v["cat_id"]);
                }

            }
            
            $count = count($this->podcastsToShow);
            
            if($count > $_SESSION["toShow"]){
                $this->isMore = true;
            }
            else{
                $this->isMore = false;
            }
            // echo $count;
            usort($this->podcastsToShow, array($this, "podcastSort"));
            $PodcastsCategories2 = array_count_values($PodcastsCategories2);
            $this->PodcastsCategories = $PodcastsCategories2 + $this->PodcastsCategories;
            $this->podcastsToShow = array_splice($this->podcastsToShow, 0, $_SESSION["toShow"]);
            // print_r($podcastsToShow);
        }catch(PDOException $e){
            Utils::addErrorMessage("Couldn't load podcasts from database");
        }
    }

    public function action_wallViewList(){
        
        CheckSession::checkSession();
        $this->load_data();
        App::getSmarty()->assign('searchForm', $this->form);
        App::getSmarty()->assign('results', $this->records);
        App::getSmarty()->display("searchList.tpl");
    }


    public function action_profileView(){
        
        CheckSession::checkSession();
        if(!isset($_GET["user_id"])){
            App::getRouter()->redirectTo('wallView');
        }
        if(!is_numeric($_GET["user_id"])){
            App::getRouter()->redirectTo('wallView');
        }
        else{
            try{
                $user = App::getDB()->get("users", ["id","name","surname","display_name","bio", "id"], ["id" => $_GET["user_id"]]);
            }
            catch(PDOException $e){
                Utils::addErrorMessage("Couldn't connect to the database!");
            }
            if($user == null){
                Utils::addErrorMessage("No user found!");
                App::getRouter()->forwardTo("wallView");
            }
            else{
                try{
                    $userPodcasts = App::getDB()->select("podcasts",["id","title","description"],["user_id" => $user["id"], "ORDER" =>["created_at" => "DESC"]]);
                    $userFollows = App::getDB()->select("followers", ["[><]users"=>["user_id"=>"id"]],["users.id","users.name","users.surname","users.display_name"],["follower_id"=>$_GET["user_id"], "ORDER"=>["followers.follow_date"=>"DESC"]]);
                    foreach($userPodcasts as $key=>$value){
                        $userPodcasts[$key]["likes"] = App::getDB()->count("likes",["podcast_id"=>$value["id"]]);
                        $userPodcasts[$key]["views"] = App::getDB()->count("views",["podcast_id"=>$value["id"]]);
                        $userPodcasts[$key]["comments"] = App::getDB()->count("comments",["podcast_id"=>$value["id"]]);
                    }
                }
                catch(PDOException $e){
                    Utils::addErrorMessage("Couldn't connect to the database!");
                }
                try{
                    $follows = App::getDB()->get("followers","*",["user_id"=>$_GET["user_id"], "follower_id"=>$_SESSION["id"]]);
                    if($follows !== null){
                        $follows = true;
                    }
                    else{
                        $follows = false;
                    }
                }
                catch(PDOException $e){
                    Utils::addErrorMessage("Couldn't connect to the database!");
                }
            }
            App::getSmarty()->assign("userFollows", $userFollows);
            App::getSmarty()->assign("follows", $follows);
            App::getSmarty()->assign("user", $user);
            App::getSmarty()->assign("userPodcasts", $userPodcasts);
            App::getSmarty()->display("profileView.tpl");

        }
    }
    
    public function action_delete(){
        
        CheckSession::checkSession();
        try{

            $filename = App::getDB()->get("podcasts", "filename", ["AND" => ["user_id" => $_SESSION["id"], "id" => $_GET["id"]]]);
            $podcast = App::getDB()->delete("podcasts", ["AND" => ["user_id" => $_SESSION["id"], "id" => $_GET["id"]]]);
            unlink("uploads/".$filename);
            if($podcast == null){
                App::getRouter()->redirectTo("logout");
            }
            Utils::addInfoMessage("Podcast deleted succesfully!");
        }catch(PDOException $e){
            Utils::addErrorMessage("Something went wrong with the DB connection");
        }
        App::getRouter()->forwardTo("profile");

    }

    public function action_follow(){
        
        CheckSession::checkSession();
        if($_GET["user_id"] == $_SESSION["id"]){
            Utils::addErrorMessage("You can't follow yourself!");
            App::getRouter()->forwardTo("profile");
            echo "<i class='icon-user-following icons'></i> following";
        }
        if(!isset($_GET["user_id"]) || !is_numeric($_GET["user_id"])){
            Utils::addErrorMessage("There's no such user!");
            App::getRouter()->forwardTo("wallView");
        }
        try{
            $r = App::getDB()->get("users","*",["id"=>$_GET["user_id"]]);
            if($r == null){
                Utils::addErrorMessage("There's no such user!");
                App::getRouter()->forwardTo("wallView");
            }
        }
        catch(PDOException $e){
            Utils::addErrorMessage("Couldn't reach database!");
        }



        try{
            $f = App::getDB()->get("followers","*",["user_id"=>$_GET["user_id"], "follower_id"=>$_SESSION["id"]]);
        }catch(PDOException $e){
            Utils::addErrorMessage("Couldn't reach database!");
        }
        if($f == null){
            try{
                App::getDB()->insert("followers", ["user_id"=>$_GET["user_id"], "follower_id"=>$_SESSION["id"], "follow_date"=>date("Y-m-d H:i:s", time())]);
                echo "<i class='icon-user-following icons'></i> following";
            }catch(PDOException $e){
                Utils::addErrorMessage("Couldn't reach database!");
            }
        }
        else{
            try{
                App::getDB()->delete("followers", ["AND"=>["user_id"=>$_GET["user_id"], "follower_id"=>$_SESSION["id"]]]);
                echo "<i class='icon-user-follow icons'></i> follow";
            }catch(PDOException $e){
                Utils::addErrorMessage("Couldn't reach database!");
            }
                
        }

    }

    
}
