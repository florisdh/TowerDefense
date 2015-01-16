package GameObjects.Buidings {
	import Audio_Towerconstruction;
	import Factories.BuildingFactory;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.media.Sound;
	import flash.media.SoundTransform;
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
			super(new Art_Buildplatvorm());
			
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
			var towerInd:int = _spawnMenu.SelectedTowerIndex;
			var newTower:Tower;
			
			switch (towerInd) 
			{
				case 0:
					if (UserStats.Money < BarrackTower.MONEY_COST) return;
					UserStats.Money -= BarrackTower.MONEY_COST;
					newTower = _buildingFactory.create(BuildingFactory.TOWER_BARRACK, ParentEngine);
				break;
				case 1:
					if (UserStats.Money < ArcheryTower.MONEY_COST) return;
					UserStats.Money -= ArcheryTower.MONEY_COST;
					newTower = _buildingFactory.create(BuildingFactory.TOWER_ARCHERY, ParentEngine);
				break;
				case 2:
					if (UserStats.Money < RangedTower.MONEY_COST) return;
					UserStats.Money -= RangedTower.MONEY_COST;
					newTower = _buildingFactory.create(BuildingFactory.TOWER_SHOOT, ParentEngine);
				break;
				case 3:
					if (UserStats.Money < BarricadeTower.MONEY_COST) return;
					UserStats.Money -= BarricadeTower.MONEY_COST;
					newTower = _buildingFactory.create(BuildingFactory.TOWER_BARRICADE, ParentEngine);
				break;
				default:
			}
			
			newTower.Position = Position;
			newTower.start();
			
			// Play sound
			var sound:Sound = new Audio_Towerconstruction();
			sound.play(0, 0, new SoundTransform(1));
			
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