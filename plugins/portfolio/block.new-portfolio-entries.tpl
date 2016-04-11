{if isset($block_portfolio_entries) && $block_portfolio_entries}
	<div class="ia-items portfolio-entries m-b" id="portfolio">
		<div class="row">
			{foreach $block_portfolio_entries as $pf_entry}
				<div class="col-md-4 portfolio-item">
					<a href="{$smarty.const.IA_URL}portfolio/{$pf_entry.id}-{$pf_entry.alias}" class="portfolio-link" data-toggle="modal">
						<div class="portfolio-hover">
							<div class="portfolio-hover-content">
								<i class="fa fa-plus fa-3x"></i>
							</div>
						</div>
						{if $pf_entry.image}
							{printImage imgfile=$pf_entry.image title=$pf_entry.title fullimage=true class='img-responsive'}
						{/if}
					</a>
					<div class="portfolio-caption">
						<h4>{$pf_entry.title|escape: html}</h4>
						<p class="text-muted">{$pf_entry.body|strip_tags|truncate:50}</p>
					</div>
				</div>

				{if $pf_entry@iteration % 3 == 0}
					</div>
					<div class="row">
				{/if}
			{/foreach}
		</div>

		<p class="m-t-md text-center">
			<a class="btn btn-primary-outline m-r" href="{$smarty.const.IA_URL}portfolio/">{lang key='pf_view_all'}</a>
		</p>
	</div>
{else}
	<div class="alert alert-info">{lang key='pf_no_entries'}</div>
{/if}

{ia_add_media files='css: _IA_URL_plugins/portfolio/templates/front/css/style'}