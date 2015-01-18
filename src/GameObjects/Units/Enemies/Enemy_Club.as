package GameObjects.Units.Enemies {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.geom.ColorTransform;
	import GameObjects.Buidings.Tower;
	import GameObjects.GameObj;
	import GameObjects.Units.Allies.Ally_Farmer;
	
	/**
	 * ...
	 * @author FDH
	 */
	public class Enemy_Club extends Enemy 
	{
		// -- Properties -- //
		
		// -- Vars -- //
		
		// -- Construct -- //
		
		public function Enemy_Club() 
		{
			super(new Art_OrcKnuppelman(), 150);
			AttackDamage = 15;
			AttackInterval = 1000;
			
			// Anim frames
			_anim_idle_begin = 0;
			_anim_idle_end = 35;
			_anim_walk_begin = 0;
			_anim_walk_end = 35;
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