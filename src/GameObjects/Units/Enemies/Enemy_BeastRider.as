package GameObjects.Units.Enemies 
{
	import GameObjects.Buidings.Tower;
	/**
	 * ...
	 * @author FDH
	 */
	public class Enemy_BeastRider extends Enemy 
	{
		// -- Properties -- //
		
		// -- Vars -- //
		
		// -- Construct -- //
		
		public function Enemy_BeastRider() 
		{
			super(new Art_Beastrider(), 200);
			AttackDamage = 25;
			AttackInterval = 2500;
			
			// Anim frames
			_anim_idle_begin = 0;
			_anim_idle_end = 50;
			_anim_walk_begin = 55;
			_anim_walk_end = 92;
			_anim_attack_begin = 100;
			_anim_attack_end = 175;
			_anim_death_begin = 185;
			_anim_death_end = 300;
			
			_attackRange = 100;
		}
		
		// -- Methods -- //
		
		// -- Get & Set -- //
		
	}

}