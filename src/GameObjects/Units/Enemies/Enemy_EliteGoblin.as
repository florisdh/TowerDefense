package GameObjects.Units.Enemies 
{
	import flash.display.MovieClip;
	
	/**
	 * ...
	 * @author FDH
	 */
	public class Enemy_EliteGoblin extends Enemy 
	{
		// -- Properties -- //
		
		// -- Vars -- //
		
		// -- Construct -- //
		
		public function Enemy_EliteGoblin() 
		{
			super(new Art_EliteGoblin(), 100);
			AttackDamage = 8;
			AttackInterval = 3000;
			
			// Anim frames
			_anim_walk_begin = 95;
			_anim_walk_end = 120;
			_anim_attack_begin = 25;
			_anim_attack_end = 89;
			_anim_death_begin = 125;
			_anim_death_end = 167;
			
			_attackRange = 100;
		}
		
		// -- Methods -- //
		
		// -- Get & Set -- //
		
	}

}