package Factories 
{
	import GameObjects.Buidings.ArcheryTower;
	import GameObjects.Buidings.BarrackTower;
	import GameObjects.Buidings.BarricadeTower;
	import GameObjects.Buidings.Building;
	import GameObjects.Buidings.Castle;
	import GameObjects.Buidings.RangedTower;
	import GameObjects.Buidings.TowerBase;
	import GameObjects.GameObj;
	/**
	 * ...
	 * @author FDH
	 */
	public class BuildingFactory extends Factory 
	{
		// -- Types -- //
		
		public static const CASTLE:int = 0;
		public static const TOWER_BASE:int = 1;
		public static const TOWER_BARRACK:int = 2;
		public static const TOWER_ARCHERY:int = 3;
		public static const TOWER_SHOOT:int = 4;
		public static const TOWER_BARRICADE:int = 5;
		
		// -- Methods -- //
		
		override public function create(type:int, engine:Engine):* 
		{
			var newBuilding:GameObj;
			
			switch (type)
			{
				case CASTLE:
					newBuilding = new Castle();
				break;
				case TOWER_BASE:
					newBuilding = new TowerBase();
				break;
				case TOWER_BARRACK:
					newBuilding = new BarrackTower();
				break;
				case TOWER_SHOOT:
					newBuilding = new RangedTower();
				break;
				case TOWER_BARRICADE:
					newBuilding = new BarricadeTower();
				break;
				case TOWER_ARCHERY:
					newBuilding = new ArcheryTower();
				break;
				default:
					return null;
				break;
			}
			
			engine.addObject(newBuilding, 10);
			return newBuilding;
		}
		
	}

}