package GameObjects.Buidings 
{
	import Factories.UnitFactory;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import GameObjects.Units.Unit;
	/**
	 * ...
	 * @author FDH
	 */
	public class SpawnTower extends Tower 
	{
		// -- Properties -- //
		
		// -- Vars -- //
		
		protected var _spawnUnitIndex:int;
		private var _unitFactory:UnitFactory;
		private var _spawnTimer:Timer;
		
		// -- Construct -- //
		
		public function SpawnTower(health:Number, interval:int) 
		{
			_unitFactory = new UnitFactory();
			_spawnTimer = new Timer(interval);
			_spawnTimer.addEventListener(TimerEvent.TIMER, onSpawnTick);
			
			super(health);
		}
		
		// -- Methods -- //
		
		private function onSpawnTick(e:TimerEvent):void 
		{
			// Create unit
			var newUnit:Unit = _unitFactory.create(_spawnUnitIndex, ParentEngine);
			newUnit.Position = Position;
			newUnit.start();
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