// JavaScript Document


//add query string to filter groups

$(document).ready(function(){
	//Taxon URL processing
    $("[data-stat='to_update']").each(function(){
      console.log($(this).attr('href'));
      $(this).attr('href',document.URL + '&perm[]=' + $(this).data('id') );
    });
    // Current shopping by - url creation
    $("[data-stat='to_remove']").each(function(){
    	console.log($(this).attr('href'));
    	var url = document.URL;
    	var remove_param = 'perm[]=' + $(this).data('id');
    	var new_link = paramArrayProcess(url,remove_param);
 		$(this).attr('href', new_link);
    })


});
//To remove the clicked param from url
function paramArrayProcess(url,remove_param)
{
    var total_array =  url.split('?')[1].split('&'); //['kdjfkl','kdflj','dkjflf']
    var index = total_array.indexOf(remove_param);
    total_array.splice(index, 1);
    return url.split('?')[0]+ '?' + total_array.join('&')
}

//('[id^="myCarousel"]').carousel();

//$(document).ready(function(){
//		$("#login_btt").click(function(){
//		$("#login_hidden").toggle();
//	  });
//	  $( "#tabs").tabs();
//	});


//$(function() {
//			
//				var $ibWrapper	= $('#ib-main-wrapper'),
//				 
//					Template	= (function() {
//							
//							// true if dragging the container
//						var kinetic_moving				= false,
//							// current index of the opened item
//							current						= -1,
//							// true if the item is being opened / closed
//							isAnimating					= false,
//							// items on the grid
//							$ibItems					= $ibWrapper.find('div.ib-main > a'),
//							// image items on the grid
//							$ibImgItems					= $ibItems.not('.ib-content'),
//							// total image items on the grid
//							imgItemsCount				= $ibImgItems.length,
//							init						= function() {
//								
//								// add a class ib-image to the image items
//								$ibImgItems.addClass('ib-image');
//								// apply the kinetic plugin to the wrapper
//								loadKinetic();
//								// load some events
//								initEvents();
//						
//							},
//							loadKinetic					= function() {
//								
//								setWrapperSize();
//								
//								$ibWrapper.kinetic({
//									moved	: function() {
//										
//										kinetic_moving = true;
//										
//									},
//									stopped	: function() {
//										
//										kinetic_moving = false;
//										
//									}
//								});
//								
//							},
//							setWrapperSize				= function() {
//								
//								var containerMargins	= $('#ib-top').outerHeight(true) + $('#header').outerHeight(true) + parseFloat( $ibItems.css('margin-top') );
//								$ibWrapper.css( 'height', $(window).height() - containerMargins )
//								
//							},
//							initEvents					= function() {
//							
//								// open the item only if not dragging the container
//								$ibItems.bind('click.ibTemplate', function( event ) {
//									
//									if( !kinetic_moving )
//										openItem( $(this) );
//								
//									return false;	
//								
//								});
//								
//								// on window resize, set the wrapper and preview size accordingly
//								$(window).bind('resize.ibTemplate', function( event ) {
//									
//									setWrapperSize();
//									
//									$('#ib-img-preview, #ib-content-preview').css({
//										width	: $(window).width(),
//										height	: $(window).height()
//									})
//									
//								});
//							
//							},
//							openItem					= function( $item ) {
//								
//								if( isAnimating ) return false;
//								
//								// if content item
//								if( $item.hasClass('ib-content') ) {
//									
//									isAnimating	= true;
//									current	= $item.index('.ib-content');
//									loadContentItem( $item, function() { isAnimating = false; } );
//									
//								}
//							},
//							// opens one content item (fullscreen)
//							loadContentItem				= function( $item, callback ) {
//								
//								var hasContentPreview	= ( $('#ib-content-preview').length > 0 ),
//									teaser				= $item.children('div.ib-teaser').html(),
//									content				= $item.children('div.ib-content-full').html(),
//									contentData			= {
//										teaser		: teaser,
//										content		: content
//									};
//									
//								if( !hasContentPreview )
//									$('#contentTmpl').tmpl( contentData ).insertAfter( $ibWrapper );
//									
//								//set the returned values and show/animate preview
//								$('#ib-content-preview').css({
//									width	: $item.width(),
//									height	: $item.height(),
//									left	: $item.offset().left,
//									top		: $item.offset().top
//								}).show().animate({
//									width	: $(window).width(),
//									left	: 0
//								}, 500, 'easeOutExpo', function() {
//								
//									$(this).animate({
//										height	: $(window).height(),
//										top		: 0
//									}, 400, function() {
//										
//										var $this	= $(this),
//											$teaser	= $this.find('div.ib-teaser'),
//											$content= $this.find('div.ib-content-full'),
//											$close	= $this.find('span.ib-close');
//											
//										if( hasContentPreview ) {
//											$teaser.html( teaser )
//											$content.html( content )
//										}
//									
//										//$teaser.show();
//										$content.show();
//										$close.show();
//
//										
//										if( callback ) callback.call();
//									
//									});
//								
//								});
//								
//								if( !hasContentPreview )
//									initContentPreviewEvents();	
//								
//							},
//							
//							// load the events for the content preview : close button
//							initContentPreviewEvents	= function() {
//							
//								$('#ib-content-preview').find('span.ib-close').bind('click.ibTemplate', function( event ) {
//									
//									closeContentPreview();
//									
//								});
//								
//							},
//							
//							// closes the fullscreen content item
//							closeContentPreview			= function() {
//								
//								if( isAnimating ) return false;
//								
//								isAnimating	= true;
//								
//								var $item	= $ibItems.not('.ib-image').eq( current );
//								
//								$('#ib-content-preview').find('div.ib-teaser, div.ib-content-full, span.ib-close')
//														.hide()
//														.end()
//														.animate({
//															height	: $item.height(),
//															top		: $item.offset().top
//														}, 500, 'easeOutExpo', function() {
//															
//															$(this).animate({
//																width	: $item.width(),
//																left	: $item.offset().left
//															}, 400, function() {
//																
//																$(this).fadeOut(function() {isAnimating	= false;});
//																
//															} );
//														
//														});
//							
//							},
//							// get the size of one image to make it full size and centered
//							getImageDim					= function( src ) {
//								
//								var img     	= new Image();
//								img.src     	= src;
//								
//								var w_w	= $(window).width(),
//									w_h	= $(window).height(),
//									r_w	= w_h / w_w,
//									i_w	= img.width,
//									i_h	= img.height,
//									r_i	= i_h / i_w,
//									new_w, new_h,
//									new_left, new_top;
//								
//								if( r_w > r_i ) {
//								
//									new_h	= w_h;
//									new_w	= w_h / r_i;
//								
//								}	
//								else {
//								
//									new_h	= w_w * r_i;
//									new_w	= w_w;
//								
//								}
//								
//								return {
//									width	: new_w,
//									height	: new_h,
//									left	: (w_w - new_w) / 2,
//									top		: (w_h - new_h) / 2
//								};
//							
//							};
//						
//						return { init : init };
//						
//					})();
//				
//				Template.init();
//				
//            });






