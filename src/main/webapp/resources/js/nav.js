$(function(){
    $(".s_home").hide();
    $("#menu_home").on("mouseenter",function(){
        if (!$(".s_home").is(":animated")){
// 				$(".s_home").stop().fadeTo("swing",1);
            $(".s_home").stop().show(500);
            // $(this).css({"background-color":"gray"});
        }});
    $("#menu_home").on("mouseleave",function(){
            // $(this).css({"background-color":"lightgray"});
        });
    $(".menu1").on("mouseleave",function(){
// 				$(".s_home").stop().fadeTo("swing",0);
            $(".s_home").stop().hide(500);
    });
    $(".s_top").hide();
    $("#menu_top").on("mouseenter",function(){
        if (!$(".s_top").is(":animated")){
            $(".s_top").stop().show(500);
            // $(this).css({"background-color":"gray"});
        }
    });
    $(".menu2").on("mouseleave",function(){
            $(".s_top").stop().hide(500);
    });
    $("#menu_top").on("mouseleave",function(){
        // $(this).css({"background-color":"lightgray"});
    });
    
    $(".s_bottom").hide();
    $("#menu_bottom").on("mouseenter",function(){
        if (!$(".s_bottom").is(":animated")){
            $(".s_bottom").stop().show(500);
            // $(this).css({"background-color":"gray"});
        }
    });
    $(".menu3").on("mouseleave",function(){
            $(".s_bottom").stop().hide(500);
    });
    $("#menu_bottom").on("mouseleave",function(){
        // $(this).css({"background-color":"lightgray"});
    });

    $(".s_shoes").hide();
    $("#menu_shoes").on("mouseenter",function(){
        if (!$(".s_shoes").is(":animated")){
            $(".s_shoes").stop().show(500);
            // $(this).css({"background-color":"gray"});
        }
    });
    $(".menu4").on("mouseleave",function(){
            $(".s_shoes").stop().hide(500);
    });
    $("#menu_bottom").on("mouseleave",function(){
        // $(this).css({"background-color":"lightgray"});
    });
    
    $(".s_comm").hide();
    $("#menu_comm").on("mouseenter",function(){
        if (!$(".s_comm").is(":animated")){
            $(".s_comm").stop().show(500);
            // $(this).css({"background-color":"gray"});
        }
    });
    $(".menu5").on("mouseleave",function(){
            $(".s_comm").stop().hide(500);
    });
    $("#menu_comm").on("mouseleave",function(){
        // $(this).css({"background-color":"lightgray"});
    });
});