package GameObjects.Buidings {
	import Factories.BuildingFactory;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import GameObjects.Buidings.Tower;
	import GameObjects.GameObj;
	import UI.InGame.TowerSpawnMenu;
	/**
	 * ...
	 * @author FDH
	 */
	//public class TowerBase extends Building
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
			super(new Tower_Building());
			
			Collide = false;
			
			_buildingFactory = new BuildingFactory();
			
			_spawnMenu = new TowerSpawnMenu();
			_spawnMenu.y = -50;
			_spawnMenu.addEventListener(TowerSpawnMenu.SECLECTED_TOWER, createTower);
			
			addEventListener(MouseEvent.CLICK, onMouseClick);
		}
		
		// -- Methods -- //
		
		override public function update(e:Event = null):void 
		{
			super.update(e);
			
			// Animation
			var currentFrame:int = _art.currentFrame;
			if (_menuOpen)
			{
				// Play normal anim
				if (currentFrame < 31) _art.gotoAndPlay(31);
			}
			else
			{
				// Play hammer anim
				if (currentFrame > 30) _art.gotoAndPlay(0);
			}
		}
		
		private function createTower(e:Event):void 
		{
			// Create Tower
			var towerInd:int = _spawnMenu.SelectedTowerIndex + 2;
			var newTower:Tower = _buildingFactory.create(towerInd, ParentEngine);
			newTower.Position = Position;
			newTower.start();
			
			// Remove Self
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