package GameObjects.Buidings 
{
	import Factories.UnitFactory;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import GameObjects.GameObj;
	import GameObjects.Units.Unit;
	/**
	 * ...
	 * @author FDH
	 */
	public class SpawnTower extends Tower 
	{
		// -- Properties -- //
		
		public var MaxUnits:int;
		
		// -- Vars -- //
		
		protected var _spawnUnitIndex:int;
		private var _unitFactory:UnitFactory;
		private var _spawnTimer:Timer;
		private var _spawnedAmount:int = 0;
		
		// -- Construct -- //
		
		public function SpawnTower(health:Number, interval:int) 
		{
			_unitFactory = new UnitFactory();
			_spawnTimer = new Timer(interval, 1);
			_spawnTimer.addEventListener(TimerEvent.TIMER, onSpawnTick);
			
			super(health);
		}
		
		// -- Methods -- //
		
		private function spawnUnit():void 
		{
			// Create unit
			var newUnit:Unit = _unitFactory.create(_spawnUnitIndex, ParentEngine);
			newUnit.Position = Position;
			newUnit.start();
			
			// Max Spawn
			_spawnedAmount++;
			newUnit.addEventListener(GameObj.DESTROYED, function():void 
			{
				_spawnedAmount--;
				
				// Cancel out if tower is already destroyed
				if (_destroyed) return;
				
				// Restart when more to spawn
				if (_spawnedAmount < MaxUnits && !_spawnTimer.running)
				{
					_spawnTimer.start();
				}
			});
		}
		
		private function onSpawnTick(e:TimerEvent):void 
		{
			spawnUnit();
			
			// Restart when more to spawn
			if (_spawnedAmount < MaxUnits)
			{
				_spawnTimer.reset();
				_spawnTimer.start();
			}
		}
		
		override public function start(e:Event = null):void 
		{
			super.start(e);
			_spawnTimer.start();
		}
		
		override public function stop(e:Event = null):void 
		{
			super.stop(e);
			_spawnTimer.stop();
		}
		
		// -- Get & Set -- //
		
		public function set SpawnInterval(newVal:int):void 
		{
			_spawnTimer.delay = newVal;
		}
		
		public function get SpawnInterval():int
		{
			return _spawnTimer.delay;
		}
		
	}

}