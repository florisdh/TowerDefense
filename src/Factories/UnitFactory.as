package Factories 
{
	import GameObjects.Units.Enemies.Enemy_BeastRider;
	import GameObjects.Units.Enemies.Enemy_Club;
	import GameObjects.Units.Enemies.Enemy_EliteGoblin;
	import GameObjects.Units.Enemies.Enemy_Goblin;
	import GameObjects.Units.Enemies.Enemy_Sword;
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
		public static const ENEMY_SWORD:int = 2;
		public static const ENEMY_BEASTRIDER:int = 3;
		public static const ENEMY_GOBLIN:int = 4;
		public static const ENEMY_ELITEGOBLIN:int = 5;
		
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
				case ENEMY_SWORD:
					newUnit = new Enemy_Sword();
				break;
				case ENEMY_BEASTRIDER:
					newUnit = new Enemy_BeastRider();
				break;
				case ENEMY_GOBLIN:
					newUnit = new Enemy_Goblin();
				break;
				case ENEMY_ELITEGOBLIN:
					newUnit = new Enemy_EliteGoblin();
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