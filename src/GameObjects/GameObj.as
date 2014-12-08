package GameObjects 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Rectangle;
	import flash.geom.Vector3D;
	
	/**
	 * ...
	 * @author FDH
	 */
	public class GameObj extends Sprite
	{
		// -- Properties -- //
		
		public var Collide:Boolean = true;
		public var ParentEngine:Engine;
		public var AutoStart:Boolean = true;

		// -- Vars -- //
		
		protected var _art:MovieClip;
		protected var _started:Boolean = false;
		protected var _destroyed:Boolean = false;
		
		protected var _position:Vector3D = new Vector3D();
		
		
		// -- Construct -- //
		
		public function GameObj(art:MovieClip = null) 
		{
			if (art)
			{
				_art = art;
				addChild(_art);
			}
		}
		
		public function destroy():void 
		{
			if (_destroyed) return;
			_destroyed = true;
			
			if (ParentEngine) ParentEngine.removeObject(this);
		}
		
		// -- Methods -- //
		
		public function update(e:Event = null):void 
		{
		}
		
		public function willCollide(other:GameObj):Boolean
		{
			return hitTestObject(other);
		}
		
		public function onCollide(other:GameObj):void 
		{
		}
		
		public function start(e:Event = null):void 
		{
			if (_started) return;
			_started = true;
			
		}
		
		public function stop(e:Event = null):void 
		{
			if (!_started) return;
			_started = false;
		}
		
		// -- Get & Set -- //
		
		public function get Position():Vector3D
		{
			return _position;
		}
		
		public function set Position(newVal:Vector3D):void 
		{
			_position = newVal;
			x = newVal.x;
			y = newVal.y;
		}
		
		override public function set x(value:Number):void 
		{
			super.x = value;
			_position.x = x;
		}
		
		override public function set y(value:Number):void 
		{
			super.y = value;
			_position.y = y;
		}
	}

}