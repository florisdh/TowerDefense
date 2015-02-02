package  
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.geom.Vector3D;
	import flash.media.Sound;
	import flash.media.SoundTransform;
	import flash.utils.Timer;
	import Levels.Level;
	import UI.InGame.CountDownIndicator;
	import UI.InGame.MoneyIndicator;
	
	/**
	 * ...
	 * @author FDH
	 */
	public class Game extends Sprite
	{
		// -- Events -- //
		
		public static const FAILED:String = "FAILED";
		
		// -- Properties -- //
		
		// -- Vars -- //
		
		private var _level:Level;
		
		private var _camera:Camera;
		
		// GUI
		private var _moneyIndicator:MoneyIndicator;
		private var _countDown:CountDownIndicator;
		
		// State
		private var _started:Boolean = false;
		
		private var _sound:Sound;
		
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
			_level.addEventListener(Level.FAILED, onFailed);
			addChild(_level);
			
			// Camera
			_camera = new Camera(_level);
			_camera.MinX = 0;
			_camera.MaxX = _level.LevelWidth - Main.Window_Width;
			_camera.Position = new Vector3D(_camera.MaxX);
			
			// Play sound track
			_sound = new Audio_Soundtrack();
			_sound.play(0, 999, new SoundTransform(1));
			
			// GUI
			
			_moneyIndicator = new MoneyIndicator();
			_moneyIndicator.x = 10;
			_moneyIndicator.y = 10;
			addChild(_moneyIndicator);
			
			_countDown = new CountDownIndicator(5);
			_countDown.x = (stage.stageWidth - _countDown.width) / 2;
			_countDown.y = (stage.stageHeight - _countDown.height) / 2;
			_countDown.addEventListener(CountDownIndicator.DONE, onCountDownDone);
			addChild(_countDown);
		}
		
		// -- Methods -- //
		
		private function destroy():void 
		{
			if (_level)
			{
				removeChild(_level);
				_level = null;
			}
		}
		
		public function update(e:Event = null):void 
		{
			if (!_started) return;
			
			_level.update();
			_camera.update();
			_moneyIndicator.update(e);
		}
		
		private function onFailed(e:Event):void 
		{
			dispatchEvent(new Event(FAILED));
		}
		
		private function onCountDownDone(e:Event):void 
		{
			removeChild(_countDown);
			_level.start();
		}
		
		public function start(e:Event = null):void 
		{
			if (_started) return;
			_started = true;
			
			init();
			_countDown.start();
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