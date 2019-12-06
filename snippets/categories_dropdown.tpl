{strip}
{assign var=max_subsub_items value=5}
{if $Einstellungen.template.megamenu.megaHome == 0}
<li{if $nSeitenTyp == 18} class="active"{/if}>
	<a href="{$ShopURL}" title="{$Einstellungen.global.global_shopname}" class="home-icon mm-mainlink hidden-xs">
		<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 30 26.25"><path d="M3.75 26.25h9.37v-7.5h3.76v7.5h9.37V15H30L15 0 0 15h3.75z"/></svg>
	</a>
	<a href="{$ShopURL}" title="{$Einstellungen.global.global_shopname}" class="hidden visible-xs mm-mainlink">{lang key="linkHome" section="custom"}</a>
</li>
{else if $Einstellungen.template.megamenu.megaHome == 1}
<li{if $nSeitenTyp == 18} class="active"{/if}>
	<a href="{$ShopURL}" title="{$Einstellungen.global.global_shopname}" class="mm-mainlink">
		{lang key="linkHome" section="custom"}
	</a>
</li>
{/if}
{if isset($Einstellungen.template.megamenu.show_pages) && $Einstellungen.template.megamenu.show_pages !== 'N'}
    {include file='snippets/linkgroup_list.tpl' linkgroupIdentifier='megamenu_start' dropdownSupport=true tplscope='megamenu_start'}
{/if}

{block name="megamenu-categories"}
{if isset($Einstellungen.template.megamenu.show_categories) && $Einstellungen.template.megamenu.show_categories !== 'N' && isset($Einstellungen.global.global_sichtbarkeit) && ($Einstellungen.global.global_sichtbarkeit != 3 || isset($smarty.session.Kunde->kKunde) && $smarty.session.Kunde->kKunde != 0)}
    {assign var='show_subcategories' value=false}
    {if isset($Einstellungen.template.megamenu.show_subcategories) && $Einstellungen.template.megamenu.show_subcategories !== 'N'}
        {assign var='show_subcategories' value=true}
    {/if}

    {get_category_array categoryId=0 assign='categories'}
    {if !empty($categories)}
        {if !isset($activeId)}
            {if isset($NaviFilter->Kategorie) && intval($NaviFilter->Kategorie->kKategorie) > 0}
                {$activeId = $NaviFilter->Kategorie->kKategorie}
            {elseif $nSeitenTyp == 1 && isset($Artikel)}
                {assign var='activeId' value=$Artikel->gibKategorie()}
            {elseif $nSeitenTyp == 1 && isset($smarty.session.LetzteKategorie)}
                {$activeId = $smarty.session.LetzteKategorie}
            {else}
                {$activeId = 0}
            {/if}
        {/if}
        {if !isset($activeParents) && ($nSeitenTyp == 1 || $nSeitenTyp == 2)}
            {get_category_parents categoryId=$activeId assign='activeParents'}
        {/if}
		{if $Einstellungen.template.megamenu.drodownMaincat == 1}
            {assign var='isDropdown' value=false}
			<li class="megamenu-fw dropdown-style">
			<span class="no-link mm-mainlink"{if $isDropdown} data-toggle="dropdown" data-hover="dropdown" data-delay="300" data-hover-delay="100" data-close-others="true"{/if}>
				{lang key="allCats" section="custom"}
				<span class="caret hidden-xs"></span>{include file='snippets/mobile-menu-arrow.tpl'}
			</span>
			<ul class="dropdown-menu keepopen{if $categories|@count > 40} items-threecol{else if $categories|@count > 20} items-twocol{/if}">
		{/if}
        {foreach name='categories' from=$categories item='category'}
            {if isset($category->bUnterKategorien) && !empty($category->Unterkategorien)}
                {assign var='isDropdown' value=true}
            {/if}
            <li class="{if $isDropdown && $category->Unterkategorien|@count gt 0}megamenu-fw dropdown-style{/if}{if $category->kKategorie == $activeId || (isset($activeParents[0]) && $activeParents[0]->kKategorie == $category->kKategorie)} active{/if}">
                <a href="{$category->cURL}" class="{if $Einstellungen.template.megamenu.drodownMaincat == 0}mm-mainlink{else}dropdown-link defaultlink{/if}"{if $isDropdown} data-toggle="dropdown" data-hover="dropdown" data-delay="300" data-hover-delay="100" data-close-others="true"{/if}>
                    <span class="notextov">{$category->cKurzbezeichnung}</span>
                    {if $isDropdown && $category->Unterkategorien|@count gt 0}
						{if $Einstellungen.template.megamenu.drodownMaincat == 0}
						<span class="caret hidden-xs"></span>{include file='snippets/mobile-menu-arrow.tpl'}
						{else}
						<span class="css-arrow css-arrow-right hidden-xs"></span>{include file='snippets/mobile-menu-arrow.tpl'}
						{/if}
					{/if}
                </a>
                {if $isDropdown && $category->bUnterKategorien && $category->Unterkategorien|@count gt 0}
                    <ul class="dropdown-menu keepopen">
						{if $category->bUnterKategorien}
							{if !empty($category->Unterkategorien)}
								{assign var=sub_categories value=$category->Unterkategorien}
							{else}
								{get_category_array categoryId=$category->kKategorie assign='sub_categories'}
							{/if}
							{foreach name='sub_categories' from=$sub_categories item='sub'}
								<li class="title{if $show_subcategories && $sub->bUnterKategorien} megamenu-fw keepopen{/if}">
									{if !empty($sub->Unterkategorien)}
										{assign var=subsub_categories value=$sub->Unterkategorien}
									{else}
										{get_category_array categoryId=$sub->kKategorie assign='subsub_categories'}
									{/if}
									<a href="{$sub->cURL}" class="dropdown-link defaultlink">
										<span class="notextov">
											{$sub->cKurzbezeichnung}
										</span>
										{if $show_subcategories && $sub->bUnterKategorien && count($subsub_categories)  > 0}
										<span class="css-arrow css-arrow-right hidden-xs"></span>{include file='snippets/mobile-menu-arrow.tpl'}
										{/if}
									</a>
									{if $show_subcategories && $sub->bUnterKategorien && count($subsub_categories)  > 0}
										<ul class="dropdown-menu keepopen">
											{foreach name='subsub_categories' from=$subsub_categories item='subsub'}
													<li{if $subsub->kKategorie == $activeId || (isset($activeParents[2]) && $activeParents[2]->kKategorie == $subsub->kKategorie)} class="active"{/if}>
														<a href="{$subsub->cURL}" class="dropdown-link defaultlink notextov">
															{$subsub->cKurzbezeichnung}
														</a>
													</li>
											{/foreach}
										</ul>
									{/if}
								</li>
							{/foreach}
						{/if}
                    </ul>
                {/if}
            </li>
        {/foreach}
					
		{if $Einstellungen.template.megamenu.drodownMaincat == 1}
		</ul>	
		</li>
		{/if}
    {/if}
{/if}
{/block}{* /megamenu-categories*}

{block name="megamenu-pages"}
{if isset($Einstellungen.template.megamenu.show_pages) && $Einstellungen.template.megamenu.show_pages !== 'N'}
    {include file='snippets/linkgroup_list.tpl' linkgroupIdentifier='megamenu' dropdownSupport=true tplscope='megamenu'}
{/if}
{/block}{* megamenu-pages *}

{block name="megamenu-manufacturers"}
{if isset($Einstellungen.template.megamenu.show_manufacturers) && $Einstellungen.template.megamenu.show_manufacturers !== 'N' && isset($Einstellungen.global.global_sichtbarkeit) && ($Einstellungen.global.global_sichtbarkeit != 3 || isset($smarty.session.Kunde->kKunde) && $smarty.session.Kunde->kKunde != 0)}
    {get_manufacturers assign='manufacturers'}
    {if !empty($manufacturers)}
        <li class="dropdown-style megamenu-fw{if (isset($NaviFilter->Hersteller) && !empty($NaviFilter->Hersteller->kHersteller)) || $nSeitenTyp == PAGE_HERSTELLER} active{/if}">
            {assign var="linkKeyHersteller" value=LinkHelper::getInstance()->getSpecialPageLinkKey(LINKTYP_HERSTELLER)}
            {if !empty($linkKeyHersteller)}{assign var="linkSEOHersteller" value=LinkHelper::getInstance()->getPageLinkLanguage($linkKeyHersteller)}{/if}
            {if isset($linkSEOHersteller)}
                <a href="{$linkSEOHersteller->cSeo}" class="mm-mainlink" data-toggle="dropdown" data-hover="dropdown" data-delay="300" data-hover-delay="100" data-close-others="true">
                    {$linkSEOHersteller->cName}
                    <span class="caret hidden-xs"></span>{include file='snippets/mobile-menu-arrow.tpl'}
                </a>
            {else}
                <span class="mm-mainlink" data-toggle="dropdown" data-hover="dropdown" data-delay="300" data-hover-delay="100" data-close-others="true">
                    {lang key="manufacturers" section="global"}
                    <span class="caret hidden-xs"></span>{include file='snippets/mobile-menu-arrow.tpl'}
                </span>
            {/if}
            <ul class="dropdown-menu keepopen{if $manufacturers|@count > 40} items-threecol{else if $manufacturers|@count > 20} items-twocol{/if}">
				{foreach name=hersteller from=$manufacturers item=hst}
					<li class="title"><a href="{$hst->cSeo}" class="dropdown-link defaultlink"><span class="notextov">{$hst->cName}</span></a></li>
				{/foreach}
            </ul>
        </li>
    {/if}
{/if}
{/block}{* megamenu-manufacturers *}
{/strip}
