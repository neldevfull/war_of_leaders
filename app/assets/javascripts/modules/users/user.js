modulejs.define('user', function() {
	return function() {
/*
		// Form
		var userForm = {
			cleanFields: function() {
				$('#user_name').val('');
				$('#user_email').val('');
				this.cleanPassw();
				$('#user_privilege').removeAttr('checked');
				$("input:radio").attr("checked", false);
			},
			cleanPassw: function() {
				$('#user_password').val('');
				$('#user_password_confirmation').val('');				
			}
		};

		// jQuery Exec
		$(function() {
			// Vars
			var $user = $('#form_user');

			// New User
			$user.on('ajax:complete', function(jEvent, data) {
				if(data.responseJSON.fail === false){
					$('#output_message').removeClass('alert alert-warning alert-danger');
					$('#output_message').addClass('alert alert-success');
					$('#output_message').empty().append(data.responseJSON.response);
					if(data.responseJSON.verb === 'post')
						userForm.cleanFields();
					else if(data.responseJSON.verb === 'put')
						userForm.cleanPassw();

				}
				else if(data.responseJSON.fail === true) {
					$('#output_message').removeClass('alert alert-warning alert-success');
					$('#output_message').addClass('alert alert-danger');
					$('#output_message').empty().append('Erro ao Salvar Usuario: ' + data.responseJSON.response);
					userForm.cleanPassw();
				}
				else {
					console.log('IMPLEMENT LOG');
				}
			});
			$user.on('ajax:error', function(error) {
				console.log(error);
			});
		});
*/
	}

});
