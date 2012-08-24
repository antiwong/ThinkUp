            <style type="text/css">
            {literal}
            .map-image-container { width: 130px; height: 130px; padding-bottom : 30px; }
            img.map-image2 {float:left;margin:6px 0 0 0;width:150px;height:150px;}
            img.place-icon2 {position: relative;width: 32px;height: 32px;top: -146px;left: 5px;}
            {/literal}
            </style>

{if $all_checkins|@count >0}
    <div class="section">
        <h2>Your Checkins</h2>
        {foreach from=$all_checkins item=current}
            <div class="clearfix article"> 
            <div class="individual-tweet post clearfix">
            <div class="grid_4 alpha">
                <div class="map-image-container">
                {if $current->place_obj->map_image}
                    <a href="http://maps.google.com/maps?q={$current->geo}"><img src="{$current->place_obj->map_image}" class="map-image2"/>
                    <img src="{$current->place_obj->icon}" class="place-icon2"/></a>
                {/if}
                </div>
            </div>

            <div class="grid_10">
            {if $current->post_text != " "}{$current->post_text}<br><br>{/if}
            {foreach from=$current->links item=current_link}
               <a href="{$current_link->url}"><img src="{$current_link->url}" width=100px height=100px}></a><br> 
            {/foreach}

            {$current->place} <br> {$current->location} <br>
            <small><a href="{$site_root_path}post/?t={$current->post_id}&n={$current->network|urlencode}">{$current->adj_pub_date|relative_datetime} ago</a> via {$current->source}</small>
            </div>

            <div class="grid_2 omega">
            {if $current->reply_count_cache > 0}
                <span class="reply-count">
                <a href="{$site_root_path}post/?t={$current->post_id}&n={$current->network|urlencode}">{$current->reply_count_cache|number_format}</a></span>
            {else}
                &#160;
            {/if}

        </div>
        </div>
        </div>

        {/foreach}
    </div>
{else}
    <div class="alert urgent">
        No posts to display. {if $logged_in_user}Update your data and try again.{/if}
    </div>
{/if}

<div class="view-all" id="older-posts-div">
{if $next_page}
    <a href="{$site_root_path}?{if $smarty.get.v}v={$smarty.get.v}&{/if}
    {if $smarty.get.u}u={$smarty.get.u}&{/if}
    {if $smarty.get.n}n={$smarty.get.n|urlencode}&{/if}page={$next_page}"id="next_page">&#60; Older Posts</a>
{/if}
{if $last_page}
    | <a href="{$site_root_path}?{if $smarty.get.v}v={$smarty.get.v}&{/if}
    {if $smarty.get.u}u={$smarty.get.u}&{/if}
    {if $smarty.get.n}n={$smarty.get.n|urlencode}&{/if}page={$last_page}"id="last_page">Newer Posts  &#62;</a>
{/if}
</div>
