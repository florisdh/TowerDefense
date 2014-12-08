package GameObjects 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.geom.Vector3D;
	
	/**
	 * ...
	 * @author FDH
	 */
	public class Character extends MovingGameObj 
	{
		// -- Properties -- //
		
		public var MoveSpeed:Number = 10;
		public var Acceleration:Number = 0.8;
		public var BrakeSpeed:Number = 0.5;
		
		// -- Vars -- //
		
		// Movement Direction
		protected var _moveDir:Vector3D = new Vector3D();
		
		// -- Construct -- //
		
		public function Character(art:MovieClip=null) 
		{
			super(art);
		}
		
		// -- Methods -- //
		
		override public function update(e:Event = null):void 
		{
			if (!_started) return;
			
			//if (_moveDir.x != 0 || _moveDir.y != 0)
			//{
				//var veloLength:Number = _velocity.length;
				//if (veloLength < MoveSpeed)
				//{
					//_velocity.x += Acceleration * _moveDir.x * MoveSpeed;
					//_velocity.y += Acceleration * _moveDir.y * MoveSpeed;
				//}
				//else if (veloLength > MoveSpeed)
				//{
					//_velocity.x = _moveDir.x * MoveSpeed;
					//_velocity.y = _moveDir.y * MoveSpeed;
				//}
			//}
			
			// Calc Target Velo
			var targetVelo:Vector3D = _moveDir.clone();
			targetVelo.scaleBy(MoveSpeed);
			var targetAcc:Vector3D = _moveDir.clone();
			targetAcc.scaleBy(Acceleration);
			var targetBreak:Vector3D = _velocity.clone();
			targetBreak.normalize();
			targetBreak.negate();
			targetBreak.scaleBy(BrakeSpeed);
			
			var offset:Number = Vector3D.distance(targetVelo, _velocity);
			
			if (targetVelo.length > 0)
			{
				if (offset < Acceleration)
					_velocity = _velocity.add(targetAcc);
				else
					_velocity = targetVelo;
			}
			else
			{
				if (offset > BrakeSpeed) _velocity = _velocity.add(targetBreak);
				else if (offset > 0) _velocity = targetVelo;
			}
			
			//// Move Horizontal
			//if (_moveDir.x != 0)
			//{
				//// Accelerate Horizontal
				////if (Math.abs(_velocity.x) < MoveSpeed)
				//if (Math.abs(_velocity.x) < Math.abs(targetVelo.x))
				//{
					////_velocity.x += _moveDir.x > 0 ? Acceleration : -Acceleration;
					//_velocity.x += targetAcc.x;
				//}
				//
				//// Corrent Speed & Hold
				//else
				//{
					//_velocity.x = targetVelo.x;
				//}
			//}
			//else
			//{
				//// Break
				//if (Math.abs(_velocity.x) > Math.abs(targetBreak.x))
				//{
					//_velocity.x += targetBreak.x;
				//}
				//
				//// Stop
				//else _velocity.x = 0;
			//}
			//
			//// Move Vertical
			//if (_moveDir.y != 0)
			//{
				//// Accelerate Vertical
				////if (Math.abs(_velocity.y) < MoveSpeed)
				////if (Math.abs(targetVelo.y - _velocity.y) > Acceleration)
				//if (Math.abs(_velocity.y) < Math.abs(targetAcc.y))
				//{
					////_velocity.y += _moveDir.y > 0 ? Acceleration : -Acceleration;
					//_velocity.y += targetAcc.y;
				//}
				//
				//// Corrent Speed & Hold	
				//else
				//{
					//_velocity.y = targetVelo.y;
				//}
			//}
			//else
			//{
				//// Break Vertical
				//if (Math.abs(_velocity.y) > Math.abs(targetBreak.y))
				//{
					//_velocity.y += targetBreak.y;
				//}
				//
				//// Stop Vertical
				//else
				//{
					//_velocity.y = 0;
				//}
			//}
			
			// Add Velo
			super.update(e);
		}
		
	}

}