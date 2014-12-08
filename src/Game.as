package  
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.utils.Timer;
	import Levels.Level;
	import Levels.Level1;
	
	/**
	 * ...
	 * @author FDH
	 */
	public class Game extends Sprite
	{
		// -- Events -- //
		
		public static const FAILED:String = "Failed";
		public static const SUCCEED:String = "Susseed";
		
		// -- Properties -- //
		
		// -- Vars -- //
		
		private var _levels:Vector.<Level>;
		private var _levelIndex:int;
		
		// State
		private var _started:Boolean = false;
		
		// UI
		
		// -- Construct -- //
		
		public function Game() 
		{
			super();
		}
		
		private function init():void 
		{
			_levelIndex = -1;
			
			// Load Levels
			_levels = new Vector.<Level>();
			_levels.push(new Level1());
			
			nextLevel();
		}
		
		private function destroy():void 
		{
			var cLevel:Level = CurrentLevel;
			if (cLevel) cLevel.stop();
		}
		
		// -- Methods -- //
		
		public function update(e:Event = null):void 
		{
			if (!_started) return;
			
			var cLevel:Level = CurrentLevel;
			if (cLevel) cLevel.update();
		}
		
		public function start(e:Event = null):void 
		{
			if (_started) return;
			_started = true;
			
			init();
			CurrentLevel.start();
		}
		
		public function stop(e:Event = null):void 
		{
			if (!_started) return;
			_started = false;
			
			CurrentLevel.stop();
			destroy();
		}
		
		public function nextLevel(e:Event = null):void 
		{
			// Stop Current Level if started
			var cLevel:Level = CurrentLevel;
			if (cLevel)
			{
				cLevel.stop();
				cLevel.removeEventListener(Level.DONE, onLevelDone);
				removeChild(cLevel);
			}
			
			// Increase level and check if level is the last level
			_levelIndex++;
			if (_levelIndex >= _levels.length)
			{
				dispatchEvent(new Event(SUCCEED));
				return;
			}
			
			// Get Next Level
			cLevel = CurrentLevel;
			cLevel.addEventListener(Level.DONE, onLevelDone);
			addChild(cLevel);
			
			// Start Next Level
			cLevel.start();
		}
		
		private function onLevelDone(e:Event = null):void 
		{
			nextLevel();
		}
		
		// -- Get & Set -- //
		
		public function get CurrentLevel():Level
		{
			if (_levelIndex >= 0 && _levelIndex < _levels.length)
				return _levels[_levelIndex];
			else
				return null;
		}
		
		public function get Started():Boolean 
		{
			return _started;
		}
		
		public function set Started(newVal:Boolean):void 
		{
			_started = newVal;
		}
	}

}