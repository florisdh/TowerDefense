package GameObjects.Units.Allies 
{
	import flash.display.MovieClip;
	import GameObjects.Units.Enemies.Enemy;
	import GameObjects.Units.Unit;
	
	/**
	 * ...
	 * @author FDH
	 */
	public class Ally extends Unit 
	{
		// -- Properties -- //
		
		// -- Vars -- //
		
		// -- Construct -- //
		
		public function Ally(art:MovieClip, health:Number) 
		{
			MoveDir = -1;
			super(art, health);
			
			// Attack types
			_attackTypes.push(Enemy);
			
		}
		
		// -- Methods -- //
		
	}

}