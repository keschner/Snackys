{* desktop navigation (> screen-min-sm) *}
{strip}
<div class="mgm mw-container{if isset($snackyConfig.show_category_images) && $snackyConfig.show_category_images !== 'N'} has-images{/if}{if $snackyConfig.headerType == 4 || $snackyConfig.headerType == 4.5 || $snackyConfig.headerType == 6} fullscreen-menu{/if}"{if $device->isMobile() || ($snackyConfig.megaStyle == 1 && $snackyConfig.headerType != 4 && $snackyConfig.headerType != 4.5 && $snackyConfig.headerType != 6)} id="mm-dropdown"{/if}>
	{block name="category-nav-megamenu"}
	<div class="hidden-sm hidden-md hidden-lg menu-title dpflex-a-center dpflex-j-between nowrap">
		<span class="m0 notextov block h3">{lang key="menu" section="custom"}</span>
		<button class="close-btn"></button>
	</div>
		<ul class="dpflex-a-center dpflex-j-center blanklist dpflex-wrap">
			{if $snackyConfig.headerType == 4 || $snackyConfig.headerType == 4.5 || $snackyConfig.headerType == 6}
				<div class="dpflex-a-center dpflex-j-between nowrap fullscreen-title">
					<span class="m0 notextov block h3">{lang key="menu" section="custom"}</span>
					<button class="close-btn"></button>
				</div>
			{/if}
			{if !$device->isMobile() && ($snackyConfig.megaStyle == 0 || $snackyConfig.headerType == 4 || $snackyConfig.headerType == 4.5 || $snackyConfig.headerType == 6)} 
				{include file='snippets/categories_mega.tpl'}
			{elseif $snackyConfig.megaStyle == 1 || $device->isMobile()}
				{include file='snippets/categories_dropdown.tpl'}
			{/if}
		</ul>
	{/block}
</div>
{/strip}