modulejs.define('plays', function() {
	return function() {			
		var answers  = [];
		$questionMax = $('#question_max').val();

		for(var i = 1; i <= $questionMax; i++) {
			for(var j = 1; j <= 5; j++) {
				(function(i, j, answers) {
					$('#btn_play_' + i + '_' + j).click(function() {						
						answers.forEach(function(answer) {							
							if(answer.question == i) {
								index = answers.indexOf(answer);	
								answers.splice(index, 1);

								$('#btn_play_' + answer.question + '_' + answer.answer).css({
									'background-color':'white', 
									'color':'black'
								});
								return false;
							}
						});
						$(this).css({
							'background-color':'#5CB85C', 
							'color':'white'
						});
						answers.push({
							'question': i, 
							'answer': j
						});												
					});
				}(i, j, answers));
			}
		}

		$('#up_cloud').click(function() {
			$.ajax({
				type: 'POST',
				url: '/plays',
				data: 'key_master='+$('#key_master').val() +
					'&phase_id=' + $('#phase_id').val() +
					'&plays=' + JSON.stringify(answers),
				success: function(result) {
					console.log(result);
				},
				error: function(error) {
					console.log(error);
				},
			});
		});

		var	clsStopwatch = function() {
			// Private vars
			var	startAt	= 0;	// Time of last start / resume. (0 if not running)
			var	lapTime	= 0;	// Time on the clock when last stopped in milliseconds

			var	now	= function() {
				return (new Date()).getTime(); 
			}; 
	 
			// Public methods
			// Start or resume
			this.start = function() {
				startAt	= startAt ? startAt : now();
			};

			// Stop or pause
			this.stop = function() {
				// If running, update elapsed time otherwise keep it
				lapTime	= startAt ? lapTime + now() - startAt : lapTime;
				startAt	= 0; // Paused
			};

			// Reset
			this.reset = function() {
				lapTime = startAt = 0;
			};

			// Duration
			this.time = function() {
				return lapTime + (startAt ? now() - startAt : 0); 
			};
		};

		var gamestart = new clsStopwatch();
		var $time     = document.getElementById('time');
		var clocktimer;

		function pad(num, size) {
			var s = "0000" + num;
			return s.substr(s.length - size);
		}

		function formatTime(time) {
			var h = m = s = ms = 0;
			var newTime = '';

			h = Math.floor( time / (60 * 60 * 1000) );
			time = time % (60 * 60 * 1000);
			m = Math.floor( time / (60 * 1000) );
			time = time % (60 * 1000);
			s = Math.floor( time / 1000 );
			ms = time % 1000;

			newTime = pad(h, 2) + ':' + pad(m, 2) + ':' + pad(s, 2) + ':' + pad(ms, 3);
			return newTime;
		}

		function show() {
			$time = document.getElementById('time');
			update();
		}

		function update() {
			console.log('passou');
			$time.innerHTML = formatTime(gamestart.time());
		}

		function start() {
			clocktimer = setInterval(update, 1);
			gamestart.start();
		}

		function stop() {
			gamestart.stop();
			clearInterval(clocktimer);
		}

		function reset() {
			stop();
			gamestart.reset();
			update();
		}

		start();
	}
});	