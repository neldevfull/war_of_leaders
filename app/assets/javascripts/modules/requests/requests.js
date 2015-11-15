modulejs.define('startgame', function() {
	return {
		execute: function() {
			date = new Date();

			return $.ajax({
				type: 'POST',
				url: '/phasestarts',
				data: 'phase_id='+$('#phase_id').val()+
					'&key_master='+$('#key_master').val()+
					'&day='+date+
					'&time='+'00:00:00:00',
				success: function(result) {
					result.error;
				},
				error: function(error) {
					error;
				},  
			});
		}
	}
});

// Request Games
// modulejs.define('games', function() {
// 	return {
// 		execute: function() {
// 			return $.get('games');
// 		}
// 	}
// });
