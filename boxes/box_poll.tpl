{if ($oBox->ePosition == 'left' && !$device->isMobile()) || $oBox->ePosition != 'left'}
{if isset($oBox->oUmfrage_arr) && $oBox->oUmfrage_arr|@count > 0}
    <section class="panel panel-default box box-poll" id="sidebox{$oBox->kBox}">
        <div class="panel-heading">
            <span class="panel-title h5 m0 dpflex-a-center dpflex-j-between">
				{lang key="BoxPoll" section="global"}
				{include file="snippets/careticon.tpl"}
			</span>
        </div>
        <div class="box-body">
            <ul class="nav nav-list tree blanklist">
                {foreach name=umfragen from=$oBox->oUmfrage_arr item=oUmfrageItem}
                    <li><a href="{$oUmfrageItem->cURL}">{$oUmfrageItem->cName}</a></li>
                {/foreach}
            </ul>
        </div>
    </section>
{elseif isset($Boxen.Umfrage->oUmfrage_arr) && $Boxen.Umfrage->oUmfrage_arr|@count > 0}
    <section class="panel panel-default box box-poll" id="sidebox{$oBox->kBox}">
        <div class="panel-heading">
            <span class="panel-title h5 m0 dpflex-a-center dpflex-j-between">
				{lang key="BoxPoll" section="global"}
				{include file="snippets/careticon.tpl"}
			</span>
        </div>
        <div class="box-body">
            <ul class="nav nav-list tree blanklist">
                {foreach name=umfragen from=$Boxen.Umfrage->oUmfrage_arr item=oUmfrageItem}
                    <li>
                        <a href="{$oUmfrageItem->cURL}">{$oUmfrageItem->cName}</a>
                    </li>
                {/foreach}
            </ul>
        </div>
    </section>
{/if}
{/if}