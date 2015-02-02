package GameObjects.Buidings 
{
	import flash.events.Event;
	/**
	 * ...
	 * @author FDH
	 */
	public class BarricadeTower extends Tower 
	{
		// -- Properties -- //
		
		public static var MONEY_COST:int = 50;
		public static var UPGRADE_COST:int = 100;
		
		// -- Vars -- //
		
		// -- Construct -- //
		
		public function BarricadeTower() 
		{
			super(500);
			_maxUpgrade = 2;
		}
		
		// -- Methods -- //
		
		override protected function applyUpgrade():void 
		{
			if (_art) removeChild(_art);
			
			// Select tower & arm for this upgrade
			switch (_upgradeLevel) 
			{
				case 0:
					_art = new Art_Wall();
					Human.MaxHealth = 500;
					Human.Health = Human.MaxHealth;
				break;
				case 1:
					_art = new Art_Wall2();
					Human.MaxHealth = 1000;
					Human.Health = Human.MaxHealth;
				break;
				default:
			}
			
			addChild(_art);
			
			// Reposition healthbar
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