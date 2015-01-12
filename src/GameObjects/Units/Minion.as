package GameObjects.Units 
{
	import flash.display.MovieClip;
	import flash.geom.Vector3D;
	import GameObjects.GameObj;
	import GameObjects.Units.Enemies.Enemy;
	
	/**
	 * ...
	 * @author FDH
	 */
	public class Minion extends Unit 
	{
		// -- Properties -- //
		
		// -- Vars -- //
		
		// -- Methods -- //
		
		public function Minion()
		{
			MoveDir = -1;
			MoveSpeed = 3;
			//super(new TempArt_Minion(), 100);
			super(new Art_Knight(), 100);
			AttackDamage = 10;
			
			// Attack types
			_attackTypes.push(Enemy);
			
			// Anim frames
			_anim_walk_begin = 35;
			_anim_walk_end = 60;
			_anim_attack_begin = 65;
			_anim_attack_end = 100;
			_anim_death_begin = 105;
			_anim_death_end = 143;
			
			_attackRange = 100;
		}
		
		// -- Methods -- //
		
	}

}