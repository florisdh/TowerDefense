package UI.InGame 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import GameObjects.Buidings.Tower;
	import UI.Menus.Menu;
	
	/**
	 * ...
	 * @author FDH
	 */
	public class TowerEditMenu extends Menu 
	{
		// -- Events -- //
		
		public static const UPGRADE_CLICK:String = "UPGRADE_CLICK";
		public static const REPAIR_CLICK:String = "REPAIR_CLICK";
		public static const DESTROY_CLICK:String = "DESTROY_CLICK";
		
		// -- Properties -- //
		
		// -- Vars -- //
		
		private var _bg:Sprite;
		
		// -- Construct -- //
		
		public function TowerEditMenu() 
		{
			//_bg = new TempArt_TowerMenu();
			_bg = new Art_Banner();
			//_bg.scaleX = 0.5;
			addChild(_bg);
			
			addButton(new Art_BuildButton(), -50, -315);
			addButton(new Art_BuildButton(), 50, -315);
			addButton(new Art_RangedtowerButton(), -50, -215);
			
			addEventListener(MouseEvent.CLICK, onButtonClick);
		}
		
		// -- Methods -- //
		
		private function onButtonClick(e:Event):void 
		{
			var arrInd:int = _buttons.indexOf(e.target);
			
			switch (arrInd) 
			{
				case 0:
					dispatchEvent(new Event(UPGRADE_CLICK));
				break;
				case 1:
					dispatchEvent(new Event(REPAIR_CLICK));
				break;
				case 2:
					dispatchEvent(new Event(DESTROY_CLICK));
				break;
				default:
			}
		}
		
		// -- Get & Set -- //
		
	}

}