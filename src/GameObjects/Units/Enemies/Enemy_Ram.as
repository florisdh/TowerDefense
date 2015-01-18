package GameObjects.Units.Enemies 
{
	import flash.display.MovieClip;
	
	/**
	 * ...
	 * @author FDH
	 */
	public class Enemy_Ram extends Enemy 
	{
		// -- Properties -- //
		
		// -- Vars -- //
		
		// -- Construct -- //
		
		public function Enemy_Ram() 
		{
			super(new Art_Ogre(), 300);
			AttackDamage = 70;
			AttackInterval = 5000;
			
			// Anim frames
			_anim_idle_begin = 0;
			_anim_idle_end = 31;
			_anim_walk_begin = 35;
			_anim_walk_end = 87;
			_anim_attack_begin = 90;
			_anim_attack_end = 160;
			_anim_death_begin = 165;
			_anim_death_end = 227;
			
			_attackRange = 150;
		}
		
		// -- Methods -- //
		
		// -- Get & Set -- //
		
	}

}