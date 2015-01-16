package GameObjects.Units.Allies {
	import flash.display.MovieClip;
	import flash.geom.Vector3D;
	import GameObjects.GameObj;
	import GameObjects.Units.Enemies.Enemy;
	
	/**
	 * ...
	 * @author FDH
	 */
	public class Ally_Farmer extends Ally 
	{
		// -- Properties -- //
		
		// -- Vars -- //
		
		// -- Construct -- //
		
		public function Ally_Farmer()
		{
			MoveSpeed = 5;
			//super(new TempArt_Minion(), 100);
			super(new Art_Farmer(), 100);
			AttackDamage = 7;
			AttackInterval = 1000;
			
			// Anim frames
			_anim_walk_begin = 35;
			_anim_walk_end = 60;
			_anim_attack_begin = 113;
			_anim_attack_end = 138;
			_anim_death_begin = 65;
			_anim_death_end = 109;
			
			_attackRange = 50;
		}
		
		// -- Methods -- //
		
	}

}