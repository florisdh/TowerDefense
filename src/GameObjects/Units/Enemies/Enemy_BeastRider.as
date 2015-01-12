package GameObjects.Units.Enemies 
{
	import GameObjects.Buidings.Tower;
	import GameObjects.Units.Minion;
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
			super(new Art_Beastrider(), 100);
			AttackDamage = 15;
			AttackInterval = 1500;
			
			// Anim frames
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