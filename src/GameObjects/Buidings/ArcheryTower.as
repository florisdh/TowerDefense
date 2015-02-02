package GameObjects.Buidings 
{
	import Factories.UnitFactory;
	import flash.events.Event;
	/**
	 * ...
	 * @author FDH
	 */
	public class ArcheryTower extends SpawnTower 
	{
		// -- Properties -- //
		
		public static var MONEY_COST:int = 100;
		public static var UPGRADE_COST:int = 100;
		
		// -- Construct -- //
		
		public function ArcheryTower() 
		{
			super(300, 12000);
			_maxUpgrade = 2;
			MaxUnits = 2;
		}
		
		// -- Methods -- //
		
		override protected function applyUpgrade():void 
		{
			if (_art) removeChild(_art);
			
			switch (_upgradeLevel) 
			{
				case 0:
					_art = new Art_Archery_1();
				_spawnUnitIndex = UnitFactory.ALLY_ARCHER;
				break;
				case 1:
					_art = new Art_Archery_2();
				_spawnUnitIndex = UnitFactory.ALLY_BUFFEDARCHER;
				break;
				default:
			}
			
			addChild(_art);
			
			// Reposition healthBar
			_healthBar.y = -height - _healthBar.height / 2;
		}
		
		override public function upgrade(e:Event = null):void 
		{
			if (UserStats.Money < MONEY_COST && _upgradeLevel < _maxUpgrade) return;
			UserStats.Money -= MONEY_COST;
			super.upgrade(e);
		}
		
	}

}