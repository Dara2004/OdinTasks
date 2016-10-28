$(document).ready( function() {
	createDiv(57,50);
	hov();
//	alert("WARNING: Only tested on Chrome");
	
//clear button
	$("#clear").click(function() {
		$(".div_norm").css('background-color','white');

	}); 

//apply button
	$("#apply").click(function() {
		var wid = parseInt($('#widy').val());
		var hit = parseInt($('#hity').val());


		
		$(".mainWrapper>.main").empty();
		createDiv(wid,hit);
		hov();
	}); 

//random color button
    $("#rand").click(function() {
    	$('.div_norm').on('mouseover', function(){
    		$(this).css('background-color',randomColor() );

    	});
    });
//color black
    $("#blk").click(function() {
    	$('.div_norm').on('mouseover',function() {
    		$(this).css('background-color','black');
    	})


    });



});


// RGB randomize color
var safeColors = ['00','33','66','99','cc','ff'];
var rand = function() {
	return Math.floor(Math.random()*6);
};

var randomColor = function() {
	var r = safeColors[rand()];
	var g = safeColors[rand()];
	var b = safeColors[rand()];

	return "#"+r+g+b;
}


// Div Creator Functions
function createRow(height) {

	for(cntr = 0;cntr !== height; ++cntr) {
		var div = document.createElement("div");

		var attr = "wrappers" + cntr;        
		div.setAttribute('id', attr);

		document.querySelector(".main").appendChild(div);
	}
}

function createDiv(width,height) {
	createRow(height);

	for(ocntr = 0; ocntr !== height; ++ocntr){
	    for(cntr = 0; cntr !== width; ++cntr) {
	        var div = document.createElement("div");

	        var attr = "#wrappers" + ocntr;
	        div.setAttribute('class','div_norm');

	   	    document.querySelector(attr).appendChild(div);
	     
       }
    }
}

//---------------------------------------------------

// When Hovering
function hov() {
	$('.div_norm').on('mouseover', function() {
		$(this).css('background-color','black');

	});
}
	