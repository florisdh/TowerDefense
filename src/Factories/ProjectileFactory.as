package Factories 
{
	import GameObjects.Projectiles.ChickenProjectile;
	import GameObjects.Projectiles.EggProjectile;
	import GameObjects.Projectiles.Projectile;
	/**
	 * ...
	 * @author FDH
	 */
	public class ProjectileFactory extends Factory 
	{
		// -- Types -- //
		
		public static const CHICKEN:int = 0;
		public static const EGG:int = 1;
		
		// -- Methods -- //
		
		override public function create(type:int, engine:Engine):* 
		{
			var newProjectile:Projectile;
			
			switch (type) 
			{
				case CHICKEN:
					newProjectile = new ChickenProjectile();
				break;
				case EGG:
					newProjectile = new EggProjectile();
				break;
				default:
					return null;
			}
			
			engine.addObject(newProjectile);
			
			return newProjectile;
		}
	}

}