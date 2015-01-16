package GameObjects.Units.Allies 
{
	import flash.display.MovieClip;
	
	/**
	 * ...
	 * @author FDH
	 */
	public class Ally_Palladin extends Ally 
	{
		// -- Properties -- //
		
		// -- Vars -- //
		
		// -- Construct -- //
		
		public function Ally_Palladin()
		{
			MoveSpeed = 3;
			//super(new TempArt_Minion(), 100);
			super(new Art_Paladin(), 200);
			AttackDamage = 20;
			AttackInterval = 2000;
			
			// Anim frames
			_anim_walk_begin = 45;
			_anim_walk_end = 75;
			_anim_attack_begin = 80;
			_anim_attack_end = 115;
			_anim_death_begin = 120;
			_anim_death_end = 170;
			
			_attackRange = 100;
		}
		
		// -- Methods -- //
		
	}

}