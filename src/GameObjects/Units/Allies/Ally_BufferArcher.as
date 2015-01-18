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
	public class Ally_BufferArcher extends Ally 
	{
		// -- Properties -- //
		
		// -- Vars -- //
		
		private var _arm:MovieClip;
		private var _projectileFactory:ProjectileFactory;
		private var _arrowSpawnOffset:Vector3D;
		
		// -- Construct -- //
		
		public function Ally_BufferArcher() 
		{
			MoveSpeed = 2;
			super(new Art_Buffedarcher(), 200);
			AttackDamage = 0; // 0 direct hit damage, damage will be applied when arrow hits
			AttackInterval = 2000;
			
			// Anim frames
			_anim_idle_begin = 0;
			_anim_idle_end = 30;
			_anim_walk_begin = 35;
			_anim_walk_end = 55;
			_anim_attack_begin = 60;
			_anim_attack_end = 80;
			_anim_death_begin = 85;
			_anim_death_end = 125;
			
			_attackRange = 1024;
			
			_arrowSpawnOffset = new Vector3D(0, -height/4);
			
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