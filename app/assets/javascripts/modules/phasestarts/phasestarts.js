modulejs.define('phasestarts', ['startgame'], 
	function(startgame) {
	return function() {	
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

		$('#start_game').click(function() {
			promise = startgame.execute();

			promise.done(function(result) {
				if(result) {
					start();
					$('#start_game').prop("disabled",true);
				}
			});

		});
	}
});	