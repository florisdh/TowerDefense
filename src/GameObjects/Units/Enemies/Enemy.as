package GameObjects.Units.Enemies {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.geom.Vector3D;
	import GameObjects.Buidings.Building;
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
			super(art, health);
			_velocity = new Vector3D(4, 0);
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