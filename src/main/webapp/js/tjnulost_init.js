			
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
					if( c = document.getElementById("subbtn")){
						$(c).css({
							"position":"relative",
							"left":($(c).parent().outerWidth()-$(c).outerWidth())/2.0 + "px" 
						});
					}
				}
				
			
				
				
			});