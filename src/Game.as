package  
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.utils.Timer;
	import Levels.Level;
	
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
		
		private var _level:Level;
		
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
			// Load Level
			_level = new Level();
			addChild(_level);
		}
		
		private function destroy():void 
		{
			
		}
		
		// -- Methods -- //
		
		public function update(e:Event = null):void 
		{
			if (!_started) return;
			
			_level.update();
		}
		
		public function start(e:Event = null):void 
		{
			if (_started) return;
			_started = true;
			
			init();
			_level.start();
		}
		
		public function stop(e:Event = null):void 
		{
			if (!_started) return;
			_started = false;
			
			_level.stop();
			destroy();
		}
		
		// -- Get & Set -- //
		
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