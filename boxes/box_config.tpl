{if ($oBox->ePosition == 'left' && !$device->isMobile()) || $oBox->ePosition != 'left'}
<section class="panel panel-default box autoscroll box-config hidden" id="sidebox{$oBox->kBox}">
    <div class="panel-heading">
        <span class="panel-title h5 m0 dpflex-a-center dpflex-j-between">
			{lang key="yourConfiguration"}
			{include file="snippets/careticon.tpl"}
		</span>
    </div>
    <div class="panel-body">
        <div id="box_config_list">
            <!-- ul itemlist -->
        </div>
        <div id="box_config_price">
            <span class="price_div">{lang key="priceAsConfigured" section="productDetails"}</span>
            <span class="price updateable"><!-- price --></span>
            {if $Artikel->cLocalizedVPE[$NettoPreise]}
                <small class="price_base updateable">{$Artikel->cLocalizedVPE[$NettoPreise]}</small>
                <br />
            {/if}
            <span class="vat_info">
                {include file='snippets/shipping_tax_info.tpl' taxdata=$Artikel->taxData}
            </span>
        </div>
    </div>
</section>
{/if}