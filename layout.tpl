<!DOCTYPE html>
<html lang="{$core.language.iso}" dir="{$core.language.direction}">
	<head>
		{ia_hooker name='smartyFrontBeforeHeadSection'}

		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=Edge">
		<title>{ia_print_title}</title>
		<meta name="description" content="{$core.page['meta-description']}">
		<meta name="keywords" content="{$core.page['meta-keywords']}">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="generator" content="Subrion CMS - Open Source Content Management System">
		<meta name="robots" content="index">
		<meta name="robots" content="follow">
		<meta name="revisit-after" content="1 day">
		<base href="{$smarty.const.IA_URL}">

		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
			<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->

		<link rel="shortcut icon" href="{if !empty($core.config.site_favicon)}{$core.page.nonProtocolUrl}uploads/{$core.config.site_favicon}{else}{$core.page.nonProtocolUrl}favicon.ico{/if}">

		{ia_add_media files='jquery, subrion, bootstrap' order=0}
		{ia_print_js files='_IA_TPL_app' order=999}

		{ia_hooker name='smartyFrontAfterHeadSection'}

		{ia_print_css display='on'}

		{ia_add_js}
			intelli.pageName = '{$core.page.name}';

			{foreach $core.customConfig as $key => $value}
				intelli.config.{$key} = '{$value}';
			{/foreach}
		{/ia_add_js}
	</head>
	<body class="page-{$core.page.name}">
		<header class="header"{if $core.config.website_bg} style="background-image: url('{$core.page.nonProtocolUrl}uploads/{$core.config.website_bg}');"{/if}>
			<nav class="navbar navbar-default">
				<div class="container">
					<!-- Brand and toggle get grouped for better mobile display -->
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse" aria-expanded="false">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
						 <a class="navbar-brand page-scroll" href="#page-top">
							{if $core.config.enable_text_logo}
								{$core.config.logo_text}
							{else}
								{if !empty($core.config.site_logo)}
									<img src="{$core.page.nonProtocolUrl}uploads/{$core.config.site_logo}" alt="{$core.config.site}">
								{else}
									<img src="{$img}logo.png" alt="{$core.config.site}">
								{/if}
							{/if}
						</a>
					</div>
					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse" id="navbar-collapse">
						{include 'language-selector.tpl'}
						{ia_blocks block='account'}
						{ia_blocks block='mainmenu'}
					</div>
				</div>
			</nav>
			{ia_blocks block='teaser'}
		</header>
		{ia_hooker name='smartyFrontBeforeBreadcrumb'}
		{include 'breadcrumb.tpl'}
		<!-- PORTFOLIO -->
		{if isset($iaBlocks.verytop)}
			<div class="verytop">
				<div class="container">{ia_blocks block='verytop'}</div>
			</div>
		{/if}
		<!-- SERVICE -->
		{if 'index' == $core.page.name}
			{if isset($iaBlocks.service1) || isset($iaBlocks.service2) || isset($iaBlocks.service3)}
				<div class="verytop1">
					<div class="container">
						{ia_blocks block="verytop1"}
						<div class="row">
							<div class="{width section='verytop1' position='service1' tag='col-md-'}">{ia_blocks block='service1'}</div>
							<div class="{width section='verytop1' position='service2' tag='col-md-'}">{ia_blocks block='service2'}</div>
							<div class="{width section='verytop1' position='service3' tag='col-md-'}">{ia_blocks block='service3'}</div>
						</div>
					</div>
				</div>
			{/if}
		{/if}
		{if 'index' != $core.page.name}
			<div class="content">
				<div class="container">
					<div class="row">
						<div class="{width section='content' position='left' tag='col-md-'} aside">
							{ia_blocks block='left'}
						</div>
						<div class="{width section='content' position='center' tag='col-md-'}">
							<div class="content__wrap">
								{ia_blocks block='top'}
								<div class="content__header">
									<h1>{$core.page.title}</h1>
									<ul class="content__actions">
										{foreach $core.actions as $name => $action}
											<li>
												{if 'action-favorites' == $name}
													{printFavorites item=$item itemtype=$item.item guests=true}
												{else}
													<a data-toggle="tooltip" title="{$action.title}" {foreach $action.attributes as $key => $value}{$key}="{$value}" {/foreach}>
														<span class="fa fa-{$name}"></span>
													</a>
												{/if}
											</li>
										{/foreach}
									</ul>
								</div>
								{ia_hooker name='smartyFrontBeforeNotifications'}
								{include 'notification.tpl'}
								{ia_hooker name='smartyFrontBeforeMainContent'}
								<div class="content__body">
									{$_content_}
								</div>
								{ia_hooker name='smartyFrontAfterMainContent'}
								{ia_blocks block='bottom'}
							</div>
						</div>
					</div>
				</div>
			</div>
		{/if}
		<!-- TEAM -->
		{if 'index' == $core.page.name}
			{if isset($iaBlocks.footer1) || isset($iaBlocks.footer2) || isset($iaBlocks.footer3)}
				<div class="footer-block">
					{ia_blocks block='footer-block'}
					<div class="footer-blocks">
						<div class="container">
							<div class="row">
								<div class="{width section='footer-blocks' position='footer1' tag='col-md-'}">{ia_blocks block='footer1'}</div>
								<div class="{width section='footer-blocks' position='footer2' tag='col-md-'}">{ia_blocks block='footer2'}</div>
								<div class="{width section='footer-blocks' position='footer3' tag='col-md-'}">{ia_blocks block='footer3'}</div>
							</div>
						</div>
					</div>
				</div>
			{/if}
		{/if}
		<!-- ABOUT -->
		{if 'index' == $core.page.name}
			{if isset($iaBlocks.text1) || isset($iaBlocks.text2) || isset($iaBlocks.text3)}
				<div class="text-block">
					<div class="container">{ia_blocks block='text-block'}</div>
					<div class="text-blocks">
						<div class="container">
							<div class="row">
								<div class="{width section='text-blocks' position='text1' tag='col-md-'}">{ia_blocks block='text1'}</div>
								<div class="{width section='text-blocks' position='text2' tag='col-md-'}">{ia_blocks block='text2'}</div>
								<div class="{width section='text-blocks' position='text3' tag='col-md-'}">{ia_blocks block='text3'}</div>
							</div>
						</div>
					</div>
				</div>
			{/if}
		{/if}
		{ia_hooker name='smartyFrontAfterFooterLinks'}
		<!-- FOOTER -->
		<div class="footer">
			<div class="container">
				<div class="row">
					<div class="col-md-4">
						<p>&copy; {$smarty.server.REQUEST_TIME|date_format:'%Y'} {lang key='powered_by_subrion'}</p>
					</div>
					<div class="col-md-4">
						{if $core.config.website_social}
							<ul class="list-inline social-buttons">
								{if $core.config.website_social_t}<li><a href="{$core.config.website_social_t}" class="twitter"><span class="fa fa-twitter"></span></a></li>{/if}
								{if $core.config.website_social_f}<li><a href="{$core.config.website_social_f}" class="facebook"><span class="fa fa-facebook"></span></a></li>{/if}
								{if $core.config.website_social_g}<li><a href="{$core.config.website_social_g}" class="google-plus"><span class="fa fa-google-plus"></span></a></li>{/if}
								{if $core.config.website_social_i}<li><a href="{$core.config.website_social_i}" class="linkedin"><span class="fa fa-linkedin"></span></a></li>{/if}
							</ul>
						{/if}
					</div>
					<div class="col-md-4 footer-links">
						{ia_blocks block='copyright'}
					</div>
				</div>
			</div>
		</div>
		<!-- SYSTEM STUFF -->
		{if $core.config.cron}
			<div style="display: none;">
				<img src="{$core.page.nonProtocolUrl}cron/?{randnum}" width="1" height="1" alt="">
			</div>
		{/if}

		{if isset($manageMode)}
			{include 'visual-mode.tpl'}
		{/if}

		{if isset($previewMode)}
			<p>{lang key='youre_in_preview_mode'}</p>
		{/if}

		{ia_print_js display='on'}

		{ia_hooker name='smartyFrontFinalize'}
	</body>
</html>