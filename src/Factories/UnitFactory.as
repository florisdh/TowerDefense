package Factories 
{
	import GameObjects.Units.Allies.Ally_Archer;
	import GameObjects.Units.Allies.Ally_BufferArcher;
	import GameObjects.Units.Allies.Ally_Knight;
	import GameObjects.Units.Allies.Ally_Palladin;
	import GameObjects.Units.Enemies.Enemy_BeastRider;
	import GameObjects.Units.Enemies.Enemy_Club;
	import GameObjects.Units.Enemies.Enemy_EliteGoblin;
	import GameObjects.Units.Enemies.Enemy_Goblin;
	import GameObjects.Units.Enemies.Enemy_Ram;
	import GameObjects.Units.Enemies.Enemy_Sword;
	import GameObjects.Units.Allies.Ally_Farmer;
	import GameObjects.Units.Unit;
	/**
	 * ...
	 * @author FDH
	 */
	public class UnitFactory extends Factory 
	{
		// -- Types -- //
		
		public static const ALLY_FARMER:int = 0;
		public static const ALLY_KNIGHT:int = 1;
		public static const ALLY_PALADIN:int = 2;
		public static const ALLY_ARCHER:int = 3;
		public static const ALLY_BUFFEDARCHER:int = 4;
		public static const ENEMY_CLUB:int = 5;
		public static const ENEMY_SWORD:int = 6;
		public static const ENEMY_BEASTRIDER:int = 7;
		public static const ENEMY_GOBLIN:int = 8;
		public static const ENEMY_ELITEGOBLIN:int = 9;
		public static const ENEMY_RAM:int = 10;
		
		// -- Methods -- //
		
		override public function create(type:int, engine:Engine):* 
		{
			var newUnit:Unit;
			
			switch (type)
			{
				case ALLY_FARMER:
					newUnit = new Ally_Farmer();
				break;
				case ALLY_KNIGHT:
					newUnit = new Ally_Knight();
				break;
				case ALLY_PALADIN:
					newUnit = new Ally_Palladin();
				break;
				case ALLY_ARCHER:
					newUnit = new Ally_Archer();
				break;
				case ALLY_BUFFEDARCHER:
					newUnit = new Ally_BufferArcher();
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
				case ENEMY_RAM:
					newUnit = new Enemy_Ram();
				break;
				case ENEMY_RAM:
					newUnit = new Enemy_Ram();
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