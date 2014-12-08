package Levels 
{
	import Factories.BuildingFactory;
	import flash.display.Sprite;
	import flash.events.Event;
	import GameObjects.Buidings.Building;
	import GameObjects.GameObj;
	import Tools.Input;
	
	/**
	 * ...
	 * @author FDH
	 */
	public class Level extends Sprite 
	{
		// -- Events -- //
		
		public static const DONE:String = "Done";
		
		// -- Properties -- //
		
		// -- Vars -- //
		
		protected var _started:Boolean = false;
		protected var _engine:Engine;
		protected var _buildingFactory:BuildingFactory;
		protected var _castle:Building;
		protected var _camera:Camera;
		
		// -- Construct -- //
		
		public function Level() 
		{
			super();
			init();
		}
		
		// -- Methods -- //
		
		public function init():void 
		{
			_engine = new Engine(this);
			_buildingFactory = new BuildingFactory();
			_camera = new Camera(this);
		}
		
		public function destroy():void 
		{
			_engine.destroy();
		}
		
		public function start():void 
		{
			if (_started) return;
			_started = true;
			
			_engine.start();
		}
		
		public function stop():void 
		{
			if (!_started) return;
			_started = false;
			
			_engine.stop();
		}
		
		public function update(e:Event = null):void 
		{
			if (!_started) return;
			
			_engine.update();
			_camera.update();
		}
		
		// -- Get & Set -- //
		
		public function get Started():Boolean
		{
			return _started;
		}
		
	}

}