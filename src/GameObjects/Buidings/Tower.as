package GameObjects.Buidings 
{
	import flash.display.MovieClip;
	import GameObjects.Units.Enemies.Enemy;
	import GameObjects.GameObj;
	import GameObjects.Units.Minion;
	
	/**
	 * ...
	 * @author FDH
	 */
	public class Tower extends Building 
	{
		// -- Properties -- //
		
		// -- Vars -- //
		
		// -- Construct -- //
		
		public function Tower(art:MovieClip, health:Number) 
		{
			super(art, health);
			Human.addEventListener(Humanoid.DIED, destroy);
		}
		
		// -- Methods -- //
		
		override public function onCollide(other:GameObj):void 
		{
			if (other is Enemy)
			{
				while (willCollide(other)) other.x--;
			}
		}
		
		// -- Get & Set -- //
		
	}

}