package  
{
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import GameObjects.GameObj;
	/**
	 * ...
	 * @author FDH
	 */
	public class Engine
	{
		// -- Properties -- //
		
		public var ParentItem:Sprite;
		
		// -- Vars -- //
		
		private var _gameObjs:Vector.<GameObj>;
		
		private var _started:Boolean = false;
		private var _paused:Boolean = false;
		
		// -- Construct -- //
		
		public function Engine(stage:Sprite) 
		{
			ParentItem = stage;
			init();
		}
		
		public function init():void 
		{
			_gameObjs = new Vector.<GameObj>();
		}
		
		public function destroy():void 
		{
			
		}
		
		// -- Methods -- //
		
		public function addObject(obj:GameObj, zInd:int = -1):void 
		{
			_gameObjs.push(obj);
			obj.ParentEngine = this;
			
			if (zInd >= 0)
				ParentItem.addChildAt(obj, Math.min(zInd, ParentItem.numChildren));
			else
				ParentItem.addChild(obj);
			
		}
		
		private function onObjectDestroy(e:Event):void 
		{
			removeObject(e.target as GameObj);
		}
		
		public function removeObject(obj:GameObj):void 
		{
			var ind:int = _gameObjs.indexOf(obj);
			removeObjectFromId(ind);
		}
		
		public function removeObjectFromId(ind:int):void 
		{
			// Validate
			if (ind < 0 || ind >= _gameObjs.length) return;
			
			// Remove from stage
			ParentItem.removeChild(_gameObjs[ind]);
			
			// Remove from array
			_gameObjs.splice(ind, 1);
		}
		
		public function update(e:Event = null):void 
		{
			if (!_started) return;
			
			// Update all
			var l:int = _gameObjs.length;
			for (var i:int = l - 1; i >= 0; i-- )
			{
				if (!_started) return;
				_gameObjs[i].update();
			}
			
			// Check for col | I used for instead of foreach becouse some where skipped
			for (var cI:int = 0; cI < _gameObjs.length; cI++ )
			{
				var current:GameObj = _gameObjs[cI];
				
				// Check for collision
				if (!current.Collide) continue;
				
				for (var oI:int = 0; oI < _gameObjs.length; oI++ )
				{
					// Skip self
					if (cI == oI) continue;
					
					// Skip No colliding parts
					var other:GameObj = _gameObjs[oI];
					if (!other.Collide) continue;
					
					// Check for col
					if (current.willCollide(other) && other.willCollide(current))
					{
						current.onCollide(other);
						other.onCollide(current);
					}
				}
			}
			
		}
		
		public function start(e:Event = null):void 
		{
			if (_started) return;
			_started = true;
			
			for (var i:int = _gameObjs.length - 1; i >= 0; i-- )
			{
				if (_gameObjs[i].AutoStart)
					_gameObjs[i].start();
			}
		}
		
		public function stop(e:Event = null):void 
		{
			if (!_started) return;
			_started = false;
			
			for (var i:int = _gameObjs.length - 1; i >= 0; i-- )
			{
				_gameObjs[i].stop();
				removeObjectFromId(i);
			}
		}
		
		public function getItemsFromType(type:Class):Vector.<GameObj> 
		{
			var l:int = _gameObjs.length;
			var items:Vector.<GameObj> = new Vector.<GameObj>();
			
			for (var i:int = 0; i < l; i++) 
			{
				if (_gameObjs[i] is type) items.push(_gameObjs[i]);
			}
			
			return items;
		}
		
		// -- Get & Set -- //
		
		public function get Items():Vector.<GameObj>
		{
			return _gameObjs;
		}
	}

}