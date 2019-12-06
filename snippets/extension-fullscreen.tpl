{if $snackyConfig.fullscreenElement == 0}
	{if !empty($snackyConfig.youtubeID)}
		{include file="snippets/video.tpl"}
	{else}
		<div class="video-background dpflex-a-center dpflex-j-center alert"><h2 class="m0">No Video found</h2></div>
	{/if}
{else if $snackyConfig.fullscreenElement == 1}
	{if isset($oSlider) && count($oSlider->oSlide_arr) > 0}
		{include file="snippets/slider.tpl"}
	{else}
		<div class="video-background dpflex-a-center dpflex-j-center alert"><h2 class="m0">No Slider found</h2></div>
	{/if}
{else if $snackyConfig.fullscreenElement == 2}
	{if isset($oImageMap)}
		{include file="snippets/banner.tpl"}
	{else}
		<div class="video-background dpflex-a-center dpflex-j-center alert"><h2 class="m0">No Banner found</h2></div>
	{/if}
{/if}