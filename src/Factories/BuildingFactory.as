package Factories 
{
	import GameObjects.Buidings.BarrackTower;
	import GameObjects.Buidings.Building;
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
		public static const TOWER_SPAWN:int = 2;
		public static const TOWER_SHOOT:int = 3;
		public static const TOWER_BLOCK:int = 4;
		
		// -- Methods -- //
		
		override public function create(type:int, engine:Engine):* 
		{
			var newBuilding:GameObj;
			
			switch (type)
			{
				case CASTLE:
					newBuilding = new Building(new TempArt_Castle1(), 1000);
				break;
				case TOWER_BASE:
					newBuilding = new TowerBase();
				break;
				case TOWER_SPAWN:
					newBuilding = new BarrackTower();
				break;
				case TOWER_SHOOT:
					newBuilding = new RangedTower();
				break;
				default:
					return null;
				break;
			}
			
			engine.addObject(newBuilding, 5);
			return newBuilding;
		}
		
	}

}