package GameObjects 
{
	import Factories.BuildingFactory;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import GameObjects.Buidings.Tower;
	import UI.InGame.TowerSpawnMenu;
	/**
	 * ...
	 * @author FDH
	 */
	public class TowerBase extends GameObj
	{
		// -- Properties -- //
		
		// -- Vars -- //
		
		private var _buildingFactory:BuildingFactory;
		private var _menuOpen:Boolean = false;
		private var _spawnMenu:TowerSpawnMenu;
		
		// -- Construct -- //
		
		public function TowerBase()
		{
			addChild(new TempArt_TowerBase());
			
			_buildingFactory = new BuildingFactory();
			
			_spawnMenu = new TowerSpawnMenu();
			_spawnMenu.y = -height - 10;
			_spawnMenu.addEventListener(TowerSpawnMenu.SECLECTED_TOWER, createTower);
			
			addEventListener(MouseEvent.CLICK, onMouseClick);
		}
		
		// -- Methods -- //
		
		private function createTower(e:Event):void 
		{
			var towerInd:int = _spawnMenu.SelectedTowerIndex + 1;
			var newTower:Tower = _buildingFactory.create(towerInd, ParentEngine);
			newTower.Position = Position;
			destroy();
		}
		
		private function onMouseClick(e:MouseEvent):void 
		{
			if (_menuOpen) hideMenu();
			else showMenu();
		}
		
		private function showMenu():void 
		{
			if (_menuOpen) return;
			_menuOpen = true;
			
			addChild(_spawnMenu);
		}
		
		private function hideMenu():void 
		{
			if (!_menuOpen) return;
			_menuOpen = false;
			
			removeChild(_spawnMenu);
		}
		
		// -- Get & Set -- //
	}

}