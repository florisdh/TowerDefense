package 
{
	import flash.display.Sprite;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import Tools.Input;
	import UI.Menus.Menu;
	import UI.Menus.StartMenu;
	
	/**
	 * ...
	 * @author FDH
	 */
	public class Main extends Sprite
	{
		// -- Statics -- //
		
		// For those who want to know the size and are not added yet.
		public static var WINDOW_WIDTH:int;
		public static var WINDOW_HEIGHT:int;
		
		// -- Properties -- //
		
		// -- Vars -- //
		
		private var _menu:Menu;
		private var _game:Game;
		
		// -- Construct -- //
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		// -- Methods -- //
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			WINDOW_WIDTH = stage.stageWidth;
			WINDOW_HEIGHT = stage.stageHeight;
			
			Input.setStage(stage);
			
			// Create game
			_game = new Game();
			_game.addEventListener(Game.FAILED, onFailed);
			_game.addEventListener(Game.SUCCEED, onSucceed);
			
			showStartMenu();
			
			// Event listeners
			stage.addEventListener(Event.ENTER_FRAME, update);
		}
		
		private function onSucceed(e:Event):void 
		{
			stop();
			showStartMenu();
		}
		
		private function onFailed(e:Event):void 
		{
			stop();
			showStartMenu();
		}
		
		private function update(e:Event):void 
		{
			_game.update();
		}
		
		public function start(e:Event = null):void 
		{
			if (_game.Started) return;
			
			hideMenu();
			
			addChild(_game);
			_game.start();
		}
		
		public function stop(e:Event = null):void 
		{
			if (!_game.Started) return;
			
			_game.stop();
			removeChild(_game);
		}
		
		private function showStartMenu(e:Event = null):void 
		{
			hideMenu();
			
			_menu = new StartMenu();
			_menu.addEventListener(StartMenu.START, start);
			addChild(_menu);
		}
		
		private function hideMenu(e:Event = null):void 
		{
			if (_menu)
			{
				removeChild(_menu);
				_menu = null;
				stage.focus = null;
			}
		}
		
	}
}