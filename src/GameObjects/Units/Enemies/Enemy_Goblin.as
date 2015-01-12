package GameObjects.Units.Enemies 
{
	import flash.display.MovieClip;
	
	/**
	 * ...
	 * @author FDH
	 */
	public class Enemy_Goblin extends Enemy 
	{
		// -- Properties -- //
		
		// -- Vars -- //
		
		// -- Construct -- //
		
		public function Enemy_Goblin() 
		{
			super(new Art_Goblin(), 100);
			AttackDamage = 5;
			AttackInterval = 3500;
			
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