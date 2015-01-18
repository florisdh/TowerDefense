package GameObjects.Units.Enemies {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.geom.Vector3D;
	import GameObjects.Buidings.Building;
	import GameObjects.Buidings.Castle;
	import GameObjects.Buidings.Tower;
	import GameObjects.GameObj;
	import GameObjects.MovingGameObj;
	import GameObjects.Projectiles.Projectile;
	import GameObjects.Units.Allies.Ally;
	import GameObjects.Units.Unit;
	
	/**
	 * ...
	 * @author FDH
	 */
	public class Enemy extends Unit 
	{
		// -- Properties -- //
		
		public var Loot:int = 10;
		
		// -- Vars -- //
		
		// -- Construct -- //
		
		public function Enemy(art:MovieClip, health:Number)
		{
			super(art, health);
			
			Human.addEventListener(Humanoid.DIED, onDied);
			
			MoveDir = 1;
			
			// Attack types
			_attackTypes.push(Ally);
			_attackTypes.push(Tower);
			_attackTypes.push(Castle);
		}
		
		// -- Methods -- //
		
		override public function onCollide(other:GameObj):void 
		{
			if (other is Building || other is Ally)
			{
				super.onCollide(other);
			}
		}
		
		private function onDied(e:Event):void 
		{
			UserStats.Money += Loot;
		}
		
		// -- Get & Set -- //
		
		
	}

}