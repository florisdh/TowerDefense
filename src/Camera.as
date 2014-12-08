package  
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Vector3D;
	import Tools.Input;
	/**
	 * ...
	 * @author FDH
	 */
	public class Camera 
	{
		// -- Properties -- //
		
		public var LeftKey:int = 37;
		public var RightKey:int = 39;
		
		public var MoveSpeed:Number = 20;
		public var Acceleration:Number = 1;
		public var BreakSpeed:Number = 2;
		
		public var MinX:int = -100;
		public var MaxX:int = 0;
		
		// -- Vars -- //
		
		private var _game:Sprite;
		private var _velo:Vector3D;
		private var _pos:Vector3D;
		
		// -- Construct -- //
		
		public function Camera(rootObject:Sprite)
		{
			_game = rootObject;
			_velo = new Vector3D();
			_pos = new Vector3D(rootObject.x, rootObject.y);
		}
		
		// -- Methods -- //
		
		public function update(e:Event = null):void 
		{
			// Movement
			if (Input.keyDown(RightKey))
			{
				// Accelerate
				if (_velo.x > -MoveSpeed) _velo.x -= Acceleration;
				// Hold
				else if (_velo.x < -MoveSpeed) _velo.x = -MoveSpeed;
			}
			else if (Input.keyDown(LeftKey))
			{
				// Accelerate
				if (_velo.x < MoveSpeed) _velo.x += Acceleration;
				// Hold
				else if (_velo.x > MoveSpeed) _velo.x = MoveSpeed;
			}
			// Break
			else if (Math.abs(_velo.x) > BreakSpeed)
			{
				_velo.x += _velo.x > 0 ? -BreakSpeed : BreakSpeed;
			}
			// Stop
			else
			{
				_velo.x = 0;
			}
			
			// Apply Velo
			_pos = _pos.add(_velo);
			
			// Bound Position
			if (_pos.x < MinX)
			{
				_pos.x = MinX;
				_velo.x = 0;
			}
			if (_pos.x > MaxX)
			{
				_pos.x = MaxX;
				_velo.x = 0;
			}
			
			// Apply position
			_game.x = -_pos.x;
			_game.y = -_pos.y;
		}
		
		// -- Get & Set -- //
		
		public function set Position(newVal:Vector3D):void 
		{
			_pos = newVal;
		}
		
	}

}