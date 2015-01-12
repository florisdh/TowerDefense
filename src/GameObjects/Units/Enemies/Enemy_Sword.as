package GameObjects.Units.Enemies 
{
	import GameObjects.Buidings.Tower;
	import GameObjects.Units.Minion;
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
			super(new Art_OrcSwordman(), 100);
			AttackDamage = 10;
			AttackInterval = 1250;
			
			// Attack types
			_attackTypes.push(Minion);
			_attackTypes.push(Tower);
			
			// Anim frames
			_anim_walk_begin = 0;
			_anim_walk_end = 34;
			_anim_attack_begin = 40;
			_anim_attack_end = 59;
			_anim_death_begin = 65;
			_anim_death_end = 109;
			
			_attackRange = 100;
		}
		
		// -- Methods -- //
		
		// -- Get & Set -- //
		
	}

}