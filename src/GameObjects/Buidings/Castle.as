package GameObjects.Buidings 
{
	import flash.display.MovieClip;
	
	/**
	 * ...
	 * @author FDH
	 */
	public class Castle extends Building 
	{
		// -- Properties -- //
		
		// -- Vars -- //
		
		private var _king:MovieClip;
		
		// -- Construct -- //
		
		public function Castle() 
		{
			super(new Art_Castle(), 1000);
			_king = new Art_King();
			_king.x = 50;
			_king.y = -180;
			addChild(_king);
		}
		
		// -- Methods -- //
		
	}

}