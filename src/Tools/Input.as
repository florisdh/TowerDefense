package Tools 
{
	import flash.display.Stage;
	import flash.events.KeyboardEvent;
	import flash.utils.Dictionary;
	/**
	 * ...
	 * @author FDH
	 */
	public class Input 
	{
		// -- Events -- //
		
		// -- Vars -- //
		
		private static var _keysDown:Dictionary;
		private static var _stage:Stage;
		
		// -- Methods -- //
		
		public static function setStage(s:Stage):void 
		{
			_keysDown = new Dictionary();
			_stage = s;
			_stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			_stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
		}
		
		public static function keyDown(keyCode:int):Boolean
		{
			return _keysDown[keyCode];
		}
		
		private static function onKeyDown(e:KeyboardEvent):void 
		{
			_keysDown[e.keyCode] = true;
		}
		
		private static function onKeyUp(e:KeyboardEvent):void 
		{
			_keysDown[e.keyCode] = false;
		}
	}

}