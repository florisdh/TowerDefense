package GameObjects.Units.Enemies {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.geom.ColorTransform;
	import GameObjects.Buidings.Tower;
	import GameObjects.GameObj;
	import GameObjects.Units.Minion;
	
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
			super(new Art_Orcknuppelman(), 100);
			AttackDamage = 5;
			AttackInterval = 1000;
			
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