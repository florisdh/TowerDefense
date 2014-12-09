package Factories 
{
	import GameObjects.Units.Enemies.Enemy_Club;
	import GameObjects.Units.Minion;
	import GameObjects.Units.Unit;
	/**
	 * ...
	 * @author FDH
	 */
	public class UnitFactory extends Factory 
	{
		// -- Types -- //
		
		public static const MINION:int = 0;
		public static const ENEMY_CLUB:int = 1;
		//public static const TOWER_SHOOT:int = 2;
		//public static const TOWER_BLOCK:int = 3;
		
		// -- Methods -- //
		
		override public function create(type:int, engine:Engine):* 
		{
			var newUnit:Unit;
			
			switch (type)
			{
				case MINION:
					newUnit = new Minion();
				break;
				case ENEMY_CLUB:
					newUnit = new Enemy_Club();
				break;
				default:
					return null;
				break;
			}
			
			engine.addObject(newUnit);
			return newUnit;
		}
		
	}

}