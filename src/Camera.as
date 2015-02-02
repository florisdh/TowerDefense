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
		
		public var MouseMoveArea:Number = 0.1;
		
		public var MoveSpeed:Number = 20;
		public var Acceleration:Number = 0.8;
		public var BreakSpeed:Number = 1;
		
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
			_pos = new Vector3D(0, 0);
		}
		
		// -- Methods -- //
		
		public function update(e:Event = null):void 
		{
			var screenMouseX:int = _game.mouseX + _game.x;
			
			// Movement
			if (Input.keyDown(LeftKey) || screenMouseX < Main.Window_Width * MouseMoveArea)
			{
				// Accelerate
				if (_velo.x > -MoveSpeed) _velo.x -= Acceleration;
				// Hold
				else if (_velo.x < -MoveSpeed) _velo.x = -MoveSpeed;
			}
			else if (Input.keyDown(RightKey) || screenMouseX > Main.Window_Width * (1 - MouseMoveArea))
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
			
			// Bound Position
			if (_pos.x + _velo.x < MinX)
			{
				_pos.x = MinX;
				_velo.x = 0;
			}
			else if (_pos.x + _velo.x > MaxX)
			{
				_pos.x = MaxX;
				_velo.x = 0;
			}
			
			// Apply Velo
			_pos = _pos.add(_velo);
			
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