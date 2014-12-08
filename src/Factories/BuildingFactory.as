package Factories 
{
	import GameObjects.Buidings.Building;
	/**
	 * ...
	 * @author FDH
	 */
	public class BuildingFactory extends Factory 
	{
		// -- Types -- //
		
		public static const CASTLE:int = 0;
		public static const TOWER_SHOOT:int = 1;
		public static const TOWER_SPAWN:int = 2;
		public static const TOWER_BLOCK:int = 3;
		
		// -- Methods -- //
		
		override public function create(type:int, engine:Engine):* 
		{
			var newBuilding:Building;
			
			switch (type)
			{
				case CASTLE:
					newBuilding = new Building(new TempArt_Castle1(), 1000);
				break;
				default:
					return null;
				break;
			}
			
			engine.addObject(newBuilding);
			return newBuilding;
		}
		
	}

}