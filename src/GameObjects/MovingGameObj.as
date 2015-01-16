package GameObjects 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.geom.Vector3D;
	
	/**
	 * ...
	 * @author FDH
	 */
	public class MovingGameObj extends GameObj 
	{
		// -- Properties -- //
		
		// -- Vars -- //
		
		protected var _velocity:Vector3D;
		
		// -- Construct -- //
		
		public function MovingGameObj(art:MovieClip=null) 
		{
			super(art);
			_velocity = new Vector3D();
		}
		
		// -- Methods -- //
		
		public function pushBack(from:Vector3D, dis:Number):void 
		{
			var offset:Vector3D = Position.subtract(from);
			offset.normalize();
			offset.scaleBy(dis);
			Position = Position.add(offset);
		}
		
		// -- Overrides -- //
		
		override public function update(e:Event = null):void 
		{
			if (!_started) return;
			super.update();
			
			// Apply velocity
			Position = Position.add(_velocity);
		}
		
	}

}