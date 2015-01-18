package GameObjects.Units.Allies 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import GameObjects.Units.Enemies.Enemy;
	import GameObjects.Units.Unit;
	
	/**
	 * ...
	 * @author FDH
	 */
	public class Ally extends Unit 
	{
		// -- Properties -- //
		
		public var FrontLineX:int;
		
		// -- Vars -- //
		
		// -- Construct -- //
		
		public function Ally(art:MovieClip, health:Number) 
		{
			super(art, health);
			
			// Attack types
			_attackTypes.push(Enemy);
			
			MoveDir = -1;
		}
		
		// -- Methods -- //
		
		override public function update(e:Event = null):void 
		{
			super.update(e);
			
			// At target frontline
			if (_closestTarget) return;
			
			var offset:Number = FrontLineX - x;
			var moveDir:int = MoveDir;
			if (Math.abs(offset) > MoveSpeed)
			{
				// Too far to the left
				if (offset > 0 && moveDir != 1)
				{
					MoveDir = 1;
					_art.scaleX = -1;
				}
				// Too far to the right
				else if (offset < 0 && moveDir != -1)
				{
					MoveDir = -1;
					_art.scaleX = 1;
				}
			}
			else if (moveDir != 0)
			{
				MoveDir = 0;
				_art.scaleX = 1;
			}
			
		}
		
	}

}