package UI.InGame 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import UI.Menus.Menu;
	
	/**
	 * ...
	 * @author FDH
	 */
	public class TowerSpawnMenu extends Menu 
	{
		// -- Events -- //
		
		public static const SECLECTED_TOWER:String = "SelectedTower";
		private static const BUTTON_CLICK:String = "btClick";
		
		// -- Properties -- //
		
		// -- Vars -- //
		
		private var _bg:Sprite;
		private var _selectedTowerIndex:int;
		
		// -- Construct -- //
		
		public function TowerSpawnMenu() 
		{
			super();
			
			//_bg = new TempArt_TowerMenu();
			_bg = new Art_Banner();
			addChild(_bg);
			
			addButton(new Art_BarrackButton(), -50, -315);
			addButton(new Art_Archerbarracksbutton(), 50, -315);
			addButton(new Art_RangedtowerButton(), -50, -215);
			addButton(new Art_Barricadebutton(), 50, -215);
			
			addEventListener(MouseEvent.CLICK, onButtonClick);
		}
		
		// -- Methods -- //
		
		private function onButtonClick(e:Event):void 
		{
			var arrInd:int = _buttons.indexOf(e.target);
			_selectedTowerIndex = arrInd;
			
			if (_selectedTowerIndex != -1)
				dispatchEvent(new Event(SECLECTED_TOWER));
		}
		
		// -- Get & Set -- //
		
		public function get SelectedTowerIndex():int
		{
			return _selectedTowerIndex;
		}
	}

}