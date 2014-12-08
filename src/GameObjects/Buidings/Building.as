package GameObjects.Buidings {
	import flash.display.MovieClip;
	import GameObjects.GameObj;
	
	/**
	 * ...
	 * @author FDH
	 */
	public class Building extends GameObj 
	{
		// -- Properties -- //
		
		public var Human:Humanoid;
		
		// -- Vars -- //
		
		// -- Construct -- //
		
		public function Building(art:MovieClip, health:Number) 
		{
			super(art);
			Human = new Humanoid(health);
		}
		
		// -- Methods -- //
		
		// -- Get & Set -- //
		
	}

}