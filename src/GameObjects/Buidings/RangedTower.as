package GameObjects.Buidings 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author FDH
	 */
	public class RangedTower extends Tower 
	{
		// -- Properties -- //
		
		// -- Construct -- //
		
		public function RangedTower() 
		{
			super(new Art_Tower_Ranged_1, 200);
			
		}
		
		// -- Methods -- //
		
		override public function start(e:Event = null):void 
		{
			super.start(e);
		}
		
		override public function stop(e:Event = null):void 
		{
			super.stop(e);
		}
		
	}

}