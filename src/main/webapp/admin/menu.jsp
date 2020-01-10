<%@ page language="java" pageEncoding="UTF-8"%>

<style>
.onfocus-item {
    border: 1px solid #a5c7fe !important;
}

.container {
    transform: none;
    transition: none;
    height: auto;
}

.container.animate {
    transition: left 0.3s;
    transform: translate3d(0, 0, 0);
}
</style>    
<style>
body, html {
	width: 100%;
	height: 100%;
	overflow:hidden;
}

li {
	list-style: none;
}

.app {
	height: 100%;
}
</style>
</head>
<body id="t-beauty-v1">
	<div class="app wrapper-menu-expand">
		<div class="header-bar">
			<div class="wrapper">
				<div class="logo"><i class="iconfont icon-yunduanfuwu"></i></div>
				<input type="hidden" id="site_id_menu" value="">
				<input type="hidden" id="site_name_menu" value="">
				<input type="hidden" id="site_templateType_menu" value="">
				<a class="sys-index" href="#222">**后台管理</a>
				<a class="quit" href="/admin/logout">退出</a>
				<span class="user-message">${userRealName}&nbsp;|<label id="time" style="font-size: 14px;"></label></span>
			</div>
		</div>

		<div class="left-menu">

				<ul class="menu-list">
					<li class="system-item sys-mneu-name load" data-url="/user/listPage">
						<div class="item-inner">
							<span class="menu-name">个人中心模块</span>
						</div>
					</li>
					<li class="system-item sys-mneu-name load" data-url="/user/listPage">
						<div class="item-inner">
							<span class="menu-name">轮播图广告位</span>
						</div>
					</li>
					<li class="system-item sys-mneu-name load" data-url="/task/listPage">
						<div class="item-inner sys-menuChild-name">
							<span class="menu-name">政策资讯模块</span>
						</div>
					</li>
					<li class="system-item sys-mneu-name load" data-url="/task/listPage">
						<div class="item-inner sys-menuChild-name">
							<span class="menu-name">手动置顶</span>
						</div>
					</li>
					<li class="system-item sys-mneu-name load" data-url="/freeMessage/listPage">
						<div class="item-inner sys-menuChild-name">
							<span class="menu-name">发布信息</span>
						</div>
					</li>
					<li class="system-item sys-mneu-name load" data-url="/leaveMessage/listPage">
						<div class="item-inner sys-menuChild-name">
							<span class="menu-name">留言信息</span>
						</div>
					</li>
				</ul>
		</div>

		<div class="content-wrapper"></div>
	</div>
</body>
<script>
	$(function() {
		
		// 内容区域
		var $contentWrapper = $('.content-wrapper')

		var loadContent = function(path) {
			path = path || location.hash

			$.ajax({
				url : path,
				success : function(rst) {
					$contentWrapper.html(rst)
				}
			})
		}

        $('.left-menu').on('click','.item-inner',function() {
            $(this).addClass('checked').parent().toggleClass('checked').end()
                .parent().siblings().removeClass('checked').end()
                .siblings().find('.item-inner').removeClass('checked');
        })

		$('.left-menu').on('click','.load', function() {
			var $elmLink = $(this);
			var link = $elmLink.data('url');
			if(!link || link == ''){
				return;
			}
			window.location.hash = link;
			loadContent(link);
		})

		$('.system-menus .child-menu').on('click','li',function() {
			$(this).addClass('checked-child').siblings().removeClass(
					'checked-child');
			$('.hide-menu-name').html($(this).text());
		})

		$('.hide-menu').on('click', '.sys-menuChild-name', function() {
			$(this).addClass('checked').siblings().removeClass('checked');
		})

		//菜单收缩
		$('.switch-btn').click(function() {
			$('.app').toggleClass('wrapper-menu-expand').toggleClass(
					'wrapper-menu-huddle');
			var timer;
			function layoutFun(){
				
				if(window._currentGrid!=undefined) {
					let width = $(window._currentGrid).closest(".ui-jqgrid").parent().outerWidth(true);
					
					window._currentGrid.setGridWidth(width-40)
				}
				timer = setTimeout(function(){
					clearTimeout(timer);
					layoutFun();
				})
			}

			layoutFun()
			setTimeout(function(){
				clearTimeout(timer);
			},600)
			
		})
		//菜单收缩hover tip
		$('.system-menus .item-inner').live('mouseenter',function(e){
			e.stopPropagation();
			
			if($('.app').hasClass('wrapper-menu-huddle')) {
			var tip = '<div class="popTip">'+$(this).find('.menu-name').eq(0).text()+'</div>'
			$('body').append(tip);
			$('.popTip').css('top',$(this).position().top+56)
			}
		}).live('mouseleave',function(){
			$('body').find('.popTip').remove();
		});
		
		function startTime() {
			var today = new Date()
			var year = today.getFullYear()
			var month = today.getMonth() + 1
			var date = today.getDate()
			var day = today.getDay()
			document.getElementById('time').innerHTML = " " + year + "年" + month
					+ "月" + date + "日  ";
					+ " "
		}
		startTime();
           
	})

</script>