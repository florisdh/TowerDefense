package GameObjects.Buidings {
	import flash.display.MovieClip;
	import GameObjects.GameObj;
	import UI.InGame.HealthBar;
	
	/**
	 * ...
	 * @author FDH
	 */
	public class Building extends GameObj 
	{
		// -- Properties -- //
		
		public var Human:Humanoid;
		
		// -- Vars -- //
		
		protected var _healthBar:HealthBar;
		
		// -- Construct -- //
		
		public function Building(art:MovieClip, health:Number) 
		{
			super(art);
			
			Human = new Humanoid(health);
			
			_healthBar = new HealthBar(Human);
			_healthBar.y = -height - _healthBar.height / 2;
			addChild(_healthBar);
		}
		
		// -- Methods -- //
		
		// -- Get & Set -- //
		
	}

}