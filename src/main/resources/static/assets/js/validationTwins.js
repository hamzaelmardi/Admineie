        function validateEmail($email) {
    	  var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
    	  return emailReg.test( $email );
    	}


function valideMe(val){
	if( !validateEmail(val)) {
		swal("Merci de respecter le format d'email")
	}}