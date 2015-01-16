package GameObjects.Projectiles 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.geom.Vector3D;
	import GameObjects.GameObj;
	import GameObjects.MovingGameObj;
	import GameObjects.Units.Enemies.Enemy;
	
	/**
	 * ...
	 * @author FDH
	 */
	public class Projectile extends MovingGameObj 
	{
		// -- Properties -- //
		
		public var Damage:int = 10;
		public var Speed:Number = 10;
		
		// -- Vars -- //
		
		// Angle offset for art with invalid default angle offset
		protected var _angleOffset:Number = 180;
		
		// -- Construct -- //
		
		public function Projectile(art:MovieClip, speed:Number, damage:Number) 
		{
			super(art);
			_art.x = -_art.width / 2;
			_art.y = -_art.height / 2;
			Speed = speed;
			Damage = damage;
		}
		
		// -- Methods -- //
		
		override public function update(e:Event = null):void 
		{
			super.update(e);
			
			var rad:Number = Math.atan2(_velocity.y, _velocity.x);
			rotation = rad * 180 / Math.PI + _angleOffset;
		}
		
		public function shoot(direction:Vector3D):void 
		{
			// Apply speed
			direction.normalize();
			direction.scaleBy(Speed);
			
			// Apply to velo
			_velocity = direction;
		}
		
		override public function willCollide(other:GameObj):Boolean 
		{
			if (!(other is Enemy)) return false;
			
			var dis:Number = other.Position.subtract(Position).length;
			
			return(dis < other.width / 4 + width / 2);
		}
		
		override public function onCollide(other:GameObj):void 
		{
			if (!(other is Enemy)) return;
			
			// Check for humanoid
			if (other.hasOwnProperty("Human") && other["Human"] is Humanoid && !other["Human"].Died)
			{
				var human:Humanoid = other["Human"];
				human.damage(Damage);
			}
			
			// Remove self
			destroy();
		}
	}

}