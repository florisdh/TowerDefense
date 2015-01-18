package GameObjects.Units.Enemies 
{
	import GameObjects.Buidings.Tower;
	import GameObjects.Units.Allies.Ally_Farmer;
	/**
	 * ...
	 * @author FDH
	 */
	public class Enemy_Sword extends Enemy
	{
		// -- Properties -- //
		
		// -- Vars -- //
		
		// -- Construct -- //
		
		public function Enemy_Sword() 
		{
			super(new Art_OrcSwordman(), 150);
			AttackDamage = 10;
			AttackInterval = 1250;
			
			// Attack types
			_attackTypes.push(Ally_Farmer);
			_attackTypes.push(Tower);
			
			// Anim frames
			_anim_idle_begin = 0;
			_anim_idle_end = 35;
			_anim_walk_begin = 0;
			_anim_walk_end = 34;
			_anim_attack_begin = 40;
			_anim_attack_end = 61;
			_anim_death_begin = 65;
			_anim_death_end = 110;
			
			_attackRange = 100;
		}
		
		// -- Methods -- //
		
		// -- Get & Set -- //
		
	}

}