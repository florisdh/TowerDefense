package GameObjects.Units.Enemies {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.geom.Vector3D;
	import GameObjects.Buidings.Building;
	import GameObjects.Buidings.Tower;
	import GameObjects.GameObj;
	import GameObjects.MovingGameObj;
	import GameObjects.Units.Minion;
	import GameObjects.Units.Unit;
	
	/**
	 * ...
	 * @author FDH
	 */
	public class Enemy extends Unit 
	{
		// -- Properties -- //
		
		// -- Vars -- //
		
		// -- Construct -- //
		
		public function Enemy(art:MovieClip, health:Number)
		{
			MoveDir = 1;
			super(art, health);
			
			// Attack types
			_attackTypes.push(Minion);
			_attackTypes.push(Tower);
			
		}
		
		// -- Methods -- //
		
		override public function onCollide(other:GameObj):void 
		{
			if (other is Building || other is Minion)
			{
				super.onCollide(other);
			}
		}
		
		// -- Get & Set -- //
		
		
	}

}