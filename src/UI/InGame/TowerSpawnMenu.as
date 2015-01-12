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
			
			_bg = new TempArt_TowerMenu();
			//_bg.y = -_bg.height / 2;
			addChild(_bg);
			
			addSpriteButton(new TempArt_Tower1_Icon(), -width / 4, -height / 6 * 5);
			addSpriteButton(new TempArt_Tower1_Icon(), width / 4, -height / 6 * 5);
			
			addEventListener(MouseEvent.CLICK, onButtonClick);
		}
		
		// -- Methods -- //
		
		private function onButtonClick(e:Event):void 
		{
			var arrInd:int = _spriteButtons.indexOf(e.target);
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