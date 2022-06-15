<?php

use core\App;
use core\Utils;

App::getRouter()->setDefaultRoute('index'); #default action
App::getRouter()->setLoginRoute('login'); #action to forward if no permissions
App::getRouter()->setLoggedinRoute('profile');

Utils::addRoute('index', 'GCastCtrl');
//Utils::addRoute('action_name', 'controller_class_name');
Utils::addRoute('login', 'LoginCtrl');
Utils::addRoute('loginShow', 'LoginCtrl');
Utils::addRoute('logout', 'LoginCtrl');

Utils::addRoute('register', 'RegisterCtrl');


Utils::addRoute('profile', 'ProfileCtrl');
Utils::addRoute('profileView', 'ProfileCtrl');
Utils::addRoute('createView', 'CreateCtrl');
Utils::addRoute('editData', 'ProfileCtrl');

Utils::addRoute('wallView', 'ProfileCtrl');
Utils::addRoute('wallViewList','ProfileCtrl');
Utils::addRoute('showMore','ProfileCtrl');
Utils::addRoute('follow','ProfileCtrl');

Utils::addRoute('delete', 'ProfileCtrl');


Utils::addRoute('editView', 'EditCtrl');

Utils::addRoute('podcastView', 'PodcastViewCtrl');
Utils::addRoute('like', 'PodcastViewCtrl');
Utils::addRoute('updateLikes', 'PodcastViewCtrl');
Utils::addRoute('addComment', 'PodcastViewCtrl');
Utils::addRoute('commentsList', 'PodcastViewCtrl');