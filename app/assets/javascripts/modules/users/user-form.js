modulejs.define('userForm', function() {
	return {
		openCloseKeyMaster: function() {
			var $userProfile   = $('#user_profile');
			var $userKeyMaster = $('#user_key_master');

			if($userProfile.val() === 'player') {
				$userKeyMaster.css('display', 'block');		
			}

			$userProfile.change(function() {
				if($userProfile.val() === 'player') 
					$userKeyMaster.css('display', 'block');				
				else
					$userKeyMaster.css('display', 'none');				
			});				
		}
	}
});