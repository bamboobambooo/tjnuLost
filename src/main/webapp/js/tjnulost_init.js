			/**
			 *下方分页预定义常量
			 **/
			 var currUrl = window.location.href;
			 var currPage = 1;//当前页
			 var currUrlNoPage = currUrl.replace(/[&,\?]p=(\d)*/g,"");
			 if(currUrl.indexOf("p=")>0){
			     currPage = currUrl.substring(currUrl.indexOf("p=")+2, currUrl.length);
			 }
			 
			 var ppp = "";
			 if(currUrlNoPage.indexOf("?")>=0){
			     ppp = "&p=";
			  }else{
			     ppp += "?p=";
			  }
			jQuery.noConflict();
			jQuery(document).ready(function($){
				if(typeof(template) != 'undefined'){
					var html = template('header');
					$('.header').html(html);
				}

			
				var minht = document.body.clientHeight-$('.header').height()-$('.footer').height();
				var navShowed = 0;//判断nav是否展开,默认为关 0
				initSize();
				$(".navbtn").click(function(){
					showhideNav("click");
				});
				
				$(window).resize(function(){
					minht = document.body.clientHeight-$('.header').height()-$('.footer').height();
					initSize();
					if( document.body.clientWidth<720){
						showhideNav();
					}else{						
						var h = $('.main').height();
						$('.leftnav').height(h);
						
					}	
					
				});
				
				function showhideNav(cc) {						
					if( document.body.clientWidth<720){
						if((cc=="click") && (!navShowed) && ($(".leftnav").is(':hidden'))){	
							$('.leftnav').removeAttr("style");
							$(".leftnav").css("min-height",100+"px");
							$(".leftnav").slideDown(600,function(){
								navShowed = 1;
							});
							$("#navbtn").css("color","#C38186");
						}else if(navShowed){
							$(".leftnav").slideUp(300,"linear",function(){
								navShowed = 0;
								$("#navbtn").css("color","#ADC1F4");
								var h = $('.main').height();
								$('.leftnav').removeAttr("style");
								//$('.leftnav').height(h);
							});
							
						}
					}			
				}
				
				function initSize(){
					$('.main').css({
						"min-height": minht+""+"px"
					});
					$('.leftnav').height($('.main').height());
					
					//首页Lost和Found区域高度设定
					$('.main .lost').css("min-height",minht/2.0+"px");
					$('.main .found').css("min-height",minht/2.0+"px");
	                if( c = $(".subbtn")){
	                	c.each(function(){
	                        $(this).css({
	                            "position":"relative",
	                            "left":($(this).parent().outerWidth()-$(this).outerWidth())/2.0 + "px" 
	                        });	
	                	});

	                }
				}
				
			
				
				
			});