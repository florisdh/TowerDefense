package GameObjects.Units.Allies 
{
	import Factories.ProjectileFactory;
	import flash.display.MovieClip;
	import flash.geom.Vector3D;
	import GameObjects.GameObj;
	import GameObjects.Projectiles.Projectile;
	
	/**
	 * ...
	 * @author FDH
	 */
	public class Ally_Archer extends Ally 
	{
		// -- Properties -- //
		
		// -- Vars -- //
		
		private var _arm:MovieClip;
		private var _projectileFactory:ProjectileFactory;
		private var _arrowSpawnOffset:Vector3D;
		
		// -- Construct -- //
		
		public function Ally_Archer() 
		{
			MoveSpeed = 3;
			super(new Art_Archer(), 100);
			AttackDamage = 0; // 0 direct hit damage, damage will be applied when arrow hits
			AttackInterval = 3000;
			
			// Anim frames
			_anim_walk_begin = 35;
			_anim_walk_end = 60;
			_anim_attack_begin = 70;
			_anim_attack_end = 80;
			_anim_death_begin = 90;
			_anim_death_end = 125;
			
			_attackRange = 1024;
			
			_arrowSpawnOffset = new Vector3D(0, -height / 4);
			
			_arm = new Art_Tower_Crossbow();
			_arm.x = _arrowSpawnOffset.x;
			_arm.y = _arrowSpawnOffset.y;
			addChild(_arm);
			
			_projectileFactory = new ProjectileFactory();
		}
		
		// -- Methods -- //
		
		override protected function attack(other:GameObj):void 
		{
			super.attack(other);
			
			// Spawn arrow
			var newProjectile:Projectile = _projectileFactory.create(ProjectileFactory.EGG, ParentEngine);
			newProjectile.Position = Position.add(_arrowSpawnOffset);
			newProjectile.shoot(other.Position.subtract(Position));
			newProjectile.start();
		}
		
	}

}