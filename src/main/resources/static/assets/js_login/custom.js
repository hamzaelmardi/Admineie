jQuery(document).ready(function($) {
	$("#modal_conx").modal({backdrop: 'static', keyboard: false});
	$("#modal_conx").modal("show");

	
	function validateEmail($email) {
	  var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
	  return emailReg.test( $email );
	}
	
	$("#userName").on("change",function(){
		var nom = $(this).val();
		if(nom.length==0){
			$("#err_username").removeClass("hidden");
		}else if(nom.length!=0){
			$("#err_username").addClass("hidden");
		}
	})
	
	
	$("#prenom").on("change",function(){
		var pren = $(this).val();
		if(pren.length==0 ){
			$("#err_prenom").removeClass("hidden");
		}else if(pren.length!=0){
			$("#err_prenom").addClass("hidden");
		}
	})
	
	$('#userEmail').on("change",function(){
		var email = $('#userEmail').val();
		if(email.length==0 || !validateEmail(email) ){
			$("#err_email").removeClass("hidden");
		}else{
			$("#err_email").addClass("hidden");
			
			$.ajax({
					  url: '/FootFans/checkEmailIndex',
					  type: 'post',
					  data: {"userEmail": email },
					  
				}).done(function(data) {
					  if(data=="true"){
					  		$("#err_email").addClass("hidden");
					  }else if(data=="false"){
					  	$("#err_email").removeClass("hidden");
					  }
				}).fail(function() {
					  alert("error");
				}).always(function() {
					  console.log("complete");
				});
			
			
		}
	});
});

function ferme_modal(){
	$("#modal_conx").modal("hide");
}

function validateEmail($email) {
	  var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
	  return emailReg.test( $email );
}

function verifier_form(form){

	var res = false;
	var nom = $("#userName").val();
	var pren = $("#prenom").val();
	var email = $('#userEmail').val();
	
	if(nom.length==0){
		$("#err_username").removeClass("hidden");
	}else if(nom.length!=0){
		$("#err_username").addClass("hidden");
	}
	
	if(pren.length==0 ){
		$("#err_prenom").removeClass("hidden");
	}else if(pren.length!=0){
		$("#err_prenom").addClass("hidden");
	}
	
	if(email.length==0 ){
		$("#err_email").removeClass("hidden");
	}else if(email.length!=0){
		$("#err_email").addClass("hidden");
	}
	
	if(!validateEmail(email)){
		$("#err_email").removeClass("hidden");
	}else if(email.length>0 && validateEmail(email)){
		$("#err_email").addClass("hidden");
	}

	
	if(!$("#err_username").hasClass('hidden') && !res){
    res = true;
  }

  if(!$("#err_prenom").hasClass('hidden') && !res){
    res = true;
  }
  
   if(!$("#err_email").hasClass('hidden') && !res){
    res = true;
  }
  
	
	return res;
}

function affiche_frm(id){
	var form = $(event.target).attr("data-form");
	event.preventDefault();
	
	var test = verifier_form(form);
	if(form!="" && test){
		return false;
	}
	
	
	$(".zone_frm").hide();
	$(id).show();
	
	if(id=="#frm1"){
		$("#signeup").addClass("text-dark");
		$("#login").removeClass("text-dark");
		
		$("#signeup").removeClass("text_gray");
		$("#login").addClass("text_gray");
		$(".img_cover2").hide();
		$(".img_cover").show();
	}else if(id=="#frm3"){
		$("#login").addClass("text-dark");
		$("#signeup").removeClass("text-dark");
		
		$("#login").removeClass("text_gray");
		$("#signeup").addClass("text_gray");
		$(".img_cover2").hide();
		$(".img_cover").show();
		
	}else if(id=="#frm2"){
		$("#inputSearchFan").val("real");
		$("#inputSearchFan").keyup();
		$("#inputSearchFan").val("");
		$(".img_cover").hide();
		$(".img_cover2").show();
	}
}








    
