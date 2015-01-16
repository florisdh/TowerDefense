package GameObjects.Buidings 
{
	import Factories.UnitFactory;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author FDH
	 */
	public class BarrackTower extends SpawnTower 
	{
		// -- Properties -- //
		
		public static var MONEY_COST:int = 100;
		public static var UPGRADE_COST:int = 100;
		
		// -- Construct -- //
		
		public function BarrackTower() 
		{
			super(300, 8000);
			
		}
		
		// -- Methods -- //
		
		override protected function applyUpgrade():void 
		{
			if (_art) removeChild(_art);
			
			switch (_upgradeLevel) 
			{
				case 0:
					_art = new Art_Barrack1();
					_spawnUnitIndex = UnitFactory.ALLY_FARMER;
					SpawnInterval = 8000;
				break;
				case 1:
					_art = new Art_Barrack2();
					_spawnUnitIndex = UnitFactory.ALLY_KNIGHT;
					SpawnInterval = 10000;
				break;
				case 2:
					_art = new Art_Barrack3();
					_spawnUnitIndex = UnitFactory.ALLY_PALADIN;
					SpawnInterval = 12000;
				break;
				default:
			}
			
			addChild(_art);
			
			// Reposition healthBar
			_healthBar.y = -height - _healthBar.height / 2;
		}
		
		override public function upgrade(e:Event = null):void 
		{
			if (UserStats.Money < MONEY_COST) return;
			UserStats.Money -= MONEY_COST;
			super.upgrade(e);
		}
		
	}

}