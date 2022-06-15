{extends file="main.tpl"}
{block name=header}
<header id="header" class="header-transparent header-effect-shrink header-no-border-bottom" data-plugin-options="{literal}{'stickyEnabled': true, 'stickyEffect': 'shrink', 'stickyEnableOnBoxed': true, 'stickyEnableOnMobile': false, 'stickyChangeLogo': true, 'stickyStartAt': 30, 'stickyHeaderContainerHeight': 70}{/literal}">
				<div class="header-body border-0 box-shadow-none bg-dark">
					<div class="header-container container container-xl-custom">
						<div class="header-row">
							<div class="header-column flex-row">
								<div class="header-logo d-lg-none">
									<a href="{$conf->action_url}wallView">
										<img src="img/gcast-white.png" class="img-fluid" style="max-height:60px;" alt="gCast logo" />
									</a>
								</div>
								<div class="header-nav p-0">
									<div class="header-nav header-nav-line header-nav-bottom-line header-nav-light-text header-nav-line-under-text header-nav-bottom-line-effect-1 justify-content-start">
										<div class="header-nav-main header-nav-main-mobile-dark header-nav-main-square header-nav-main-dropdown-no-borders header-nav-main-effect-2 header-nav-main-sub-effect-1">
											<nav class="collapse">
												<ul class="nav nav-pills flex-column flex-lg-row" id="mainNav">
													<li><a href="{$conf->action_url}wallView" class="nav-link">WALL</a></li>
													<li><a href="{$conf->action_url}createView" class="nav-link">CREATE</a></li>
                                                    <li><a href="{$conf->action_url}profile" class="nav-link">PROFILE</a></li>
													<li><a href="{$conf->action_url}logout" class="nav-link">LOGOUT</a></li>
												</ul>
											</nav>
										</div>
									</div>
								</div>
							</div>
							<div class="header-column flex-row flex-lg-column justify-content-end justify-content-lg-center align-items-center align-items-lg-end">
								<div class="logoHolder">
								<a href="{$conf->action_url}wallView">
										<img src="img/gcast-white.png" alt="gCast logo" class="d-none d-sm-none d-md-none d-lg-block" style="max-height:60px;"/>
								</a>
								</div>
								<button class="btn header-btn-collapse-nav ms-5" data-bs-toggle="collapse" data-bs-target=".header-nav-main nav">
									<i class="fas fa-bars"></i>
								</button>
							</div>
						</div>
					</div>
				</div>
			</header>

{/block}

{block name=content}<script src="https://unpkg.com/wavesurfer.js"></script>
<script src="https://unpkg.com/wavesurfer.js/dist/plugin/wavesurfer.cursor.min.js"></script>
<section class="page-header page-header-modern page-header-lg">
	<div class="container">
		<div class="row">
			<div class="col-md-12 align-self-center p-static order-2 text-center">
				<h1 class="font-weight-bold text-light">{$podcast["title"]}</h1>
			</div>
		</div>
						
	</div>
</section>
					
                <div class="container py-4">
                
                    <div id="waveform"></div>
                <div class="podcastContainer">
                <div class="row times"><span class="currTime">0:00</span> / <span class="totalTime">00:00</span></div>
                    <div class="row statistics my-2">
                        <div><i class="fas fa-eye"></i> {$podcast["views"]}</div>
                        <div id="lC"><i class="fas fa-heart"></i> {$podcast["likes"]}</div>
                        <div><i class="fas fa-comment"></i> {$podcast["comments"]}</div>
                    </div>
                    <div class="playControl d-flex w-100 mb-2">
                    <div class="volumeContainer"><span>Volume </span>
                    <input type="range" class="volume" min="0" max="1" step="0.05" value="1"/>
                    </div>
                    <button class="playStop"><span class="playText">Play </span><i class="fas fa-play"></i></button>

                    
                    <form action="" method="post" id="like">
                    {if $likes}
                    {* onclick="ajaxPostForm('like','{$conf->action_url}like&p_id={$smarty.get.id}','likeBtn');ajaxReloadElement('lC', '{$conf->action_url}updateLikes&p_id={$smarty.get.id}'); *}
                        <button type="button" class="btn btn-quaternary likeBtn" id="likeBtn"><i class="fas fa-heart" style="color:#ff6363"></i></button>
                        {else}
                        <button type="button" class="btn btn-quaternary likeBtn" id="likeBtn"><i class="fas fa-heart text-light"></i></button>
                        {/if}
                     </form>
                     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
                    <script>
                    {literal}
                    $("#likeBtn").click(function(){
                        
                    {/literal}
                        ajaxPostFormAsync('like','{$conf->action_url}like&p_id={$smarty.get.id}','likeBtn', function()
                        {
                            ajaxReloadElement('lC', '{$conf->action_url}updateLikes&p_id={$smarty.get.id}');
                        });
                        });


                    </script>
                    </div>
                </div>
					<div class="row pb-5 pt-2">
						<div class="col-md-7 mb-4 mb-md-0">

							<div class="overflow-hidden mb-2">
								<h2 class="text-light font-weight-normal text-5 mb-0 appear-animation animated maskUp appear-animation-visible" data-appear-animation="maskUp" data-plugin-options="{literal}{'accY': -150}{/literal}" style="animation-delay: 100ms;">Podcast <strong class="font-weight-extra-bold">Description</strong></h2>
							</div>

							<p class="appear-animation animated fadeInUpShorter appear-animation-visible" data-appear-animation="fadeInUpShorter" data-appear-animation-delay="200" style="animation-delay: 200ms;">{$podcast["description"]}</p>

							<hr class="solid my-5 appear-animation animated fadeInUpShorter appear-animation-visible" data-appear-animation="fadeInUpShorter" data-appear-animation-delay="500" style="animation-delay: 500ms;">


						</div>
						<div class="col-md-5 appear-animation animated fadeIn appear-animation-visible" data-appear-animation="fadeIn" data-appear-animation-delay="900" data-plugin-options="{literal}{'accY': -150}{/literal}" style="animation-delay: 900ms;">
							<h2 class="text-light font-weight-normal text-5 mb-2">Podcast <strong class="font-weight-extra-bold">Details</strong></h2>
							<ul class="list list-icons list-borders text-2 text-light">
								<li><i class="fas fa-caret-right left-10"></i> <strong class="text-light">Author: </strong><a href="{$conf->action_url}profileView&user_id={$podcast["user_id"]}" class="text-light">{$podcast["name"]} {$podcast["surname"]} <span style="color:#777;">@{$podcast["display_name"]}</span></a></li>
								<li><i class="fas fa-caret-right left-10"></i> <strong class="text-light">Date: </strong>{$podcast["created_at"]}</li>
								<li><i class="fas fa-caret-right left-10"></i> <strong class="text-light">Category: </strong>{$podcast["cat_name"]}</li>
							</ul>
						</div>
					</div>
                    <div class="row">
                    <h2 class="mb-2">Comments</h2>
                    <div class="commentForm">
                    <form class="d-flex flex-column align-items-end" method="post" id="commForm">
                    <textarea class="form-control text-light" placeholder="leave a comment (up to 300 characters)" aria-label="Description" maxlength="250" name="comment"></textarea>
                    <button class="btn btn-quaternary mt-2 text-light commentBtn">Add comment</button>
                    </form>
                    <script>
                    {literal}
                    $(".commentBtn").click(function(ev){
                        ev.preventDefault();
                    {/literal}
                         //ajaxPostForm('commForm','{$conf->action_url}commentsList&p_id={$smarty.get.id}','commContainer');
                    //});
                        
                            ajaxPostFormAsync('commForm','{$conf->action_url}addComment&p_id={$smarty.get.id}','commContainer', function()
                        {
                            ajaxReloadElement('commContainer', '{$conf->action_url}commentsList&p_id={$smarty.get.id}');
                        });
                        });
                        
                    </script>
                    </div>
                    </div>
                    <div class="commentsContainer" id="commContainer">
                    {include file="commentsList.tpl"}
				</div>
<script>

var btn = document.querySelector('.playStop');
var btnIcon = document.querySelector('.fas.fa-play');
var playText = document.querySelector('.playText');
var volume = document.querySelector('.volume');
var currTime = document.querySelector('.currTime');
var totalTime = document.querySelector('.totalTime');

var file = new Audio('uploads/{$podcast["filename"]}');

var wavesurfer = WaveSurfer.create({
        container: document.querySelector('#waveform'),
        waveColor: '#A8DBA8',
        progressColor: '#3B8686',
        cursorColor: '#FFF',
        {* to mozna *}
        barWidth: 3,
        barRadius: 3,
        cursorWidth: 1,
        height: 100,
        barGap: 3,
        {* usunac (normalny soundwave wtedy) *}
        plugins: [
        WaveSurfer.cursor.create({
            showTime: true,
            opacity: 1,
            customShowTimeStyle: {
                'background-color': '#fff',
                color: '#666',
                padding: '2px',
                'font-size': '10px'
            }
        })
    ]
    });
    

btn.addEventListener("click", function(e){
    wavesurfer.playPause();
    if(btnIcon.classList.contains("fa-play")){
         playText.innerHTML = "Pause ";
         btnIcon.classList.remove('fa-play');
         btnIcon.classList.add('fa-pause');
    }
    else{
        playText.innerHTML = "Play ";
        btnIcon.classList.remove('fa-pause');
        btnIcon.classList.add('fa-play');
    }
});


var formatTime = function (time) {
    return [
        Math.floor((time % 3600) / 60), // minutes
        ('00' + Math.floor(time % 60)).slice(-2) // seconds
    ].join(':');
};

// Show current time
wavesurfer.on('audioprocess', function () {
    $('.currTime').text( formatTime(wavesurfer.getCurrentTime()) );
});

// Show clip duration
wavesurfer.on('ready', function () {
    $('.totalTime').text( formatTime(wavesurfer.getDuration()) );
});

wavesurfer.on("finish", function(){
        playText.innerHTML = "Play ";
        btnIcon.classList.remove('fa-pause');
        btnIcon.classList.add('fa-play');
});

volume.addEventListener('input', function(ev){
    var val = volume.value;
    setVolume(val);
});

console.log(file);

function setVolume(val){
    wavesurfer.setVolume(val);
}
wavesurfer.load(file);
</script>

{/block}