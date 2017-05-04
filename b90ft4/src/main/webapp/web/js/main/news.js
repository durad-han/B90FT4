/**
 * http://usejsdoc.org/
 */


$(document).ready(function() {
$('#pinBoot').pinterest_grid({
no_columns: 4,
padding_x: 10,
padding_y: 10,
margin_bottom: 50,
single_column_breakpoint: 700
});
});

/*
Ref:
Thanks to:
http://www.jqueryscript.net/layout/Simple-jQuery-Plugin-To-Create-Pinterest-Style-Grid-Layout-Pinterest-Grid.html
*/


/*
    Pinterest Grid Plugin
    Copyright 2014 Mediademons
    @author smm 16/04/2014

    usage:

     $(document).ready(function() {

        $('#blog-landing').pinterest_grid({
            no_columns: 4
        });

    });


*/
(function ($, window, document, undefined) {
    var pluginName = 'pinterest_grid',
        defaults = {
            padding_x: 10,
            padding_y: 10,
            no_columns: 3,
            margin_bottom: 50,
            single_column_breakpoint: 700
        },
        columns,
        $article,
        article_width;

    function Plugin(element, options) {
        this.element = element;
        this.options = $.extend({}, defaults, options) ;
        this._defaults = defaults;
        this._name = pluginName;
        this.init();
    }

    Plugin.prototype.init = function () {
        var self = this,
            resize_finish;

        $(window).resize(function() {
            clearTimeout(resize_finish);
            resize_finish = setTimeout( function () {
                self.make_layout_change(self);
            }, 11);
        });

        self.make_layout_change(self);

        setTimeout(function() {
            $(window).resize();
        }, 500);
    };

    Plugin.prototype.calculate = function (single_column_mode) {
        var self = this,
            tallest = 0,
            row = 0,
            $container = $(this.element),
            container_width = $container.width();
            $article = $(this.element).children();

        if(single_column_mode === true) {
            article_width = $container.width() - self.options.padding_x;
        } else {
            article_width = ($container.width() - self.options.padding_x * self.options.no_columns) / self.options.no_columns;
        }

        $article.each(function() {
            $(this).css('width', article_width);
        });

        columns = self.options.no_columns;

        $article.each(function(index) {
            var current_column,
                left_out = 0,
                top = 0,
                $this = $(this),
                prevAll = $this.prevAll(),
                tallest = 0;

            if(single_column_mode === false) {
                current_column = (index % columns);
            } else {
                current_column = 0;
            }

            for(var t = 0; t < columns; t++) {
                $this.removeClass('c'+t);
            }

            if(index % columns === 0) {
                row++;
            }

            $this.addClass('c' + current_column);
            $this.addClass('r' + row);

            prevAll.each(function(index) {
                if($(this).hasClass('c' + current_column)) {
                    top += $(this).outerHeight() + self.options.padding_y;
                }
            });

            if(single_column_mode === true) {
                left_out = 0;
            } else {
                left_out = (index % columns) * (article_width + self.options.padding_x);
            }

            $this.css({
                'left': left_out,
                'top' : top
            });
        });

        this.tallest($container);
        $(window).resize();
    };

    Plugin.prototype.tallest = function (_container) {
        var column_heights = [],
            largest = 0;

        for(var z = 0; z < columns; z++) {
            var temp_height = 0;
            _container.find('.c'+z).each(function() {
                temp_height += $(this).outerHeight();
            });
            column_heights[z] = temp_height;
        }

        largest = Math.max.apply(Math, column_heights);
        _container.css('height', largest + (this.options.padding_y + this.options.margin_bottom));
    };

    Plugin.prototype.make_layout_change = function (_self) {
        if($(window).width() < _self.options.single_column_breakpoint) {
            _self.calculate(true);
        } else {
            _self.calculate(false);
        }
    };

    $.fn[pluginName] = function (options) {
        return this.each(function () {
            if (!$.data(this, 'plugin_' + pluginName)) {
                $.data(this, 'plugin_' + pluginName,
                new Plugin(this, options));
            }
        });
    }

})(jQuery, window, document);



function makeNews(category) {
	
		var html="";
		
		$.ajax({
			url:"http://192.168.0.60:10001/news?category="+category,
			dataType:"json",
			async:false
		}).done(function(result) {

			   var items = result.rss.channel[0].item;
			   
		   console.log(items[0]);		     	
		   
		   for(var i=0; i < items.length; i ++ ) {
			   
			   
			    // 이미지 있을 경우 처리.
				if(items[i].description[0].indexOf("</table>") != -1 ) {
	     		
					var arr = (items[i].description[0]).split("</table>");
	     			arr[0] = arr[0].substring( arr[0].indexOf("<img") , arr[0].indexOf(">",arr[0].indexOf("<img"))+1);                
	         		
	     			html+='<article class="white-panel">';
	     			
	     			if(items[i].pubDate){
		               	 html+= "<h4>"+items[i].pubDate[0].substring(0,17)+"</h4>";
	                }
	     			
	     			
	     			// 파싱한 뉴스 이미지.
	     			html+= arr[0];
	     			
	     			// 이미지 받아오기 끝
	                
	     			// 뉴스 작성 날짜
//		                if(items[i].pubDate){
//	                		html+=      '<p>'+items[i].pubDate[0]+'</p>';
//		                }
	                
	     			// 기사 제목
	                html+='<h4><a href='+items[i].link[0]+' target="blank">'+items[i].title[0]+'</a></h4>';
	                html+='<p>'+arr[1].substring(0,50)+'....</p>';
	                html+='</article>';
	                
	                
				} else{
					// 이미지 없을 경우 처리.
					
					
					html+='<article class="white-panel">';

				    if(items[i].pubDate){
		               	 html+= "<h4>"+items[i].pubDate[0].substring(0,17)+"</h4>";
	                }
					
	     			// 기사 제목
	                html+='<h4><a href='+items[i].link[0]+' onClick="window.open(this.href,"", "width=400, height=430"); return false;">';
	                html+= items[i].title[0]+'</a></h4>';

	                html+='<p>'+items[i].description[0].substring(0,50)+'....</p>';
	                html+='</article>';
					
				}
 	  	   }
 			$("#pinBoot").html(html);
		});

}

$("#IT").trigger("click");