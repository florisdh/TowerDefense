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
			super(new Art_Elitegoblin(), 200);
			AttackDamage = 22;
			AttackInterval = 3000;
			
			// Anim frames
			_anim_idle_begin = 0;
			_anim_idle_end = 20;
			_anim_walk_begin = 95;
			_anim_walk_end = 120;
			_anim_attack_begin = 25;
			_anim_attack_end = 89;
			_anim_death_begin = 125;
			_anim_death_end = 167;
			
			_attackRange = 30;
		}
		
		// -- Methods -- //
		
		// -- Get & Set -- //
		
	}

}