package 
{
	import flash.display.Sprite;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import Tools.Input;
	import UI.Menus.DeathMenu;
	import UI.Menus.LoadMenu;
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
		public static var Window_Width:int;
		public static var Window_Height:int;
		
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
			
			Window_Width = stage.stageWidth;
			Window_Height = stage.stageHeight;
			
			Input.setStage(stage);
			
			// Create game
			_game = new Game();
			_game.addEventListener(Game.FAILED, onFailed);
			
			showLoadMenu();
			
			// Event listeners
			stage.addEventListener(Event.ENTER_FRAME, update);
		}
		
		private function onFailed(e:Event):void 
		{
			stop();
			showDeathMenu();
		}
		
		private function update(e:Event):void 
		{
			if (_game && _game.Started) _game.update();
		}
		
		public function start(e:Event = null):void 
		{
			if (_game.Started) return;
			
			closeMenu();
			
			UserStats.Money = 200;
			
			addChild(_game);
			_game.start();
		}
		
		public function stop(e:Event = null):void 
		{
			if (!_game.Started) return;
			
			_game.stop();
			removeChild(_game);
		}
		
		private function showLoadMenu(e:Event = null):void 
		{
			closeMenu();
			
			_menu = new LoadMenu();
			_menu.addEventListener(LoadMenu.LOADED, showStartMenu);
			addChild(_menu);
		}
		
		private function showStartMenu(e:Event = null):void 
		{
			closeMenu();
			
			_menu = new StartMenu();
			_menu.addEventListener(StartMenu.START, start);
			addChild(_menu);
		}
		
		private function showDeathMenu(e:Event = null):void
		{
			closeMenu();
			
			_menu = new DeathMenu();
			_menu.addEventListener(DeathMenu.CONTINUE, showStartMenu);
			addChild(_menu);
		}
		
		private function closeMenu(e:Event = null):void 
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