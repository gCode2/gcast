{if $searchForm->search !== ""}
{if $results == null}
    <li>No results</li>
{else}

{if $searchType == "users"}
        {* {foreach $results as $record} *}
        {* {foreach from=$results key=$k item=$i name="user"} *}
        {* {if $smarty.foreach.user.index == 10}
        {break}
        <li>Show more results</li> *}
        {foreach from=$results|@array_slice:0:5 item=user}
        
            <a href="{$conf->action_url}profileView&user_id={$user["id"]}"><li>{$user["name"]} {$user["surname"]} @{$user["display_name"]}</li></a>
        {/foreach}
        {if $results|@count > 5}<li>Show more results</li>{/if}

{elseif $searchType == "podcasts"}
        {* {foreach $results as $record} *}

        {foreach from=$results|@array_slice:0:5 item=podcast}
            <a href="{$conf->action_url}podcastView&id={$podcast["id"]}"> <li>{$podcast["title"]} <span class="text-1" style="color:#777">#{$podcast["cat_name"]}</span></li></a>
        {/foreach}
{/if}



{/if}





{/if}