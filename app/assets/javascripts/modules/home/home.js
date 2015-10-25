modulejs.define('', function() {
	return function() {
		// jQuery
		// $(function() {
		// 	// Vars
		// 	var $login = $('#new_user');
			
		// 	// New Insurance			
		// 	$login.on('ajax:complete', function(jEvent, data){				
		// 		var domain = window.location.href.toString()
		// 			.split(window.location.host + '/')[0] +
		// 			window.location.host + '/user';	
		// 		if(data.responseJSON.fail === false){						
		// 			window.location.href = domain;  
		// 		}
		// 		else if(data.responseJSON.fail === true) {						
		// 			window.location.href = domain;
		// 			$('#output_message_login').addClass('alert alert-danger');
		// 			$('#output_message_login').css('display', 'block');
		// 			$('#output_message_login').empty().append(data.responseJSON.response);
		// 		}
		// 		else {
		// 			console.log('IMPLEMENT LOG');
		// 		}
		// 	});
		// 	$login.on('ajax:error', function(error){
		// 		console.log(error);
		// 	});
		// });
	}
});