package GameObjects.Buidings 
{
	import Factories.BuildingFactory;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.media.Sound;
	import flash.media.SoundTransform;
	import GameObjects.Units.Enemies.Enemy;
	import GameObjects.GameObj;
	import GameObjects.Units.Allies.Ally_Farmer;
	import UI.InGame.TowerEditMenu;
	
	/**
	 * ...
	 * @author FDH
	 */
	public class Tower extends Building 
	{
		// -- Properties -- //
		
		// -- Vars -- //
		
		private var _buildingFactory:BuildingFactory;
		
		// Upgrades
		protected var _upgradeLevel:uint = 0;
		protected var _maxUpgrade:uint = 3;
		
		// Upgrade Menu
		private var _menuOpen:Boolean = false;
		private var _editMenu:TowerEditMenu;
		
		// -- Construct -- //
		
		public function Tower(health:Number) 
		{
			super(null, health);
			
			applyUpgrade();
			
			_buildingFactory = new BuildingFactory();
			
			_editMenu = new TowerEditMenu();
			_editMenu.y = -200;
			_editMenu.addEventListener(TowerEditMenu.UPGRADE_CLICK, upgrade);
			_editMenu.addEventListener(TowerEditMenu.DESTROY_CLICK, destroy);
			
			Human.addEventListener(Humanoid.DIED, destroy);
			addEventListener(MouseEvent.CLICK, onMouseClick);
		}
		
		// -- Methods -- //
		
		override public function destroy(e:Event = null):void 
		{
			var newBase:GameObj = _buildingFactory.create(BuildingFactory.TOWER_BASE, ParentEngine);
			newBase.Position = Position;
			newBase.start();
			
			removeEventListener(MouseEvent.CLICK, onMouseClick);
			
			// Play sound
			var sound:Sound = new Audio_Towercollapse();
			sound.play(0, 0, new SoundTransform(1));
			
			stop();
			super.destroy(e);
		}
		
		public function upgrade(e:Event = null):void
		{
			if (_upgradeLevel < _maxUpgrade)
			{
				_upgradeLevel++;
				applyUpgrade();
			}
		}
		
		protected function applyUpgrade():void 
		{
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
			
			addChild(_editMenu);
		}
		
		private function hideMenu():void 
		{
			if (!_menuOpen) return;
			_menuOpen = false;
			
			removeChild(_editMenu);
		}
		
		// -- Get & Set -- //
		
	}

}