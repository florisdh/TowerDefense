package GameObjects.Units.Allies 
{
	import flash.display.MovieClip;
	
	/**
	 * ...
	 * @author FDH
	 */
	public class Ally_Knight extends Ally 
	{
		// -- Properties -- //
		
		// -- Vars -- //
		
		// -- Construct -- //
		
		public function Ally_Knight()
		{
			MoveSpeed = 4;
			//super(new TempArt_Minion(), 100);
			super(new Art_Knight(), 150);
			AttackDamage = 14;
			AttackInterval = 1200;
			
			// Anim frames
			_anim_walk_begin = 35;
			_anim_walk_end = 60;
			_anim_attack_begin = 65;
			_anim_attack_end = 100;
			_anim_death_begin = 105;
			_anim_death_end = 143;
			
			_attackRange = 70;
		}
		
		// -- Methods -- //
		
	}

}