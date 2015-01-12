package GameObjects.Buidings 
{
	import Factories.UnitFactory;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import GameObjects.GameObj;
	import GameObjects.Units.Minion;
	import GameObjects.Units.Unit;
	
	/**
	 * ...
	 * @author FDH
	 */
	public class BarrackTower extends Tower 
	{
		// -- Properties -- //
		
		public var MaxMinions:int = 5;
		
		// -- Vars -- //
		
		private var _minions:Vector.<Minion>;
		private var _unitFactory:UnitFactory;
		private var _spawnTimer:Timer;
		
		// -- Construct -- //
		
		public function BarrackTower() 
		{
			super(new Barracks_3(), 300);
			
			_minions = new Vector.<Minion>();
			_unitFactory = new UnitFactory();
			_spawnTimer = new Timer(4000, 1);
			_spawnTimer.addEventListener(TimerEvent.TIMER, onSpawnTick);
		}
		
		// -- Methods -- //
		
		private function onSpawnTick(e:TimerEvent):void 
		{
			// Create unit
			var newUnit:Unit = _unitFactory.create(UnitFactory.MINION, ParentEngine);
			newUnit.Position = Position;
			
			// Add to array
			var arrInd:int = _minions.push(newUnit);
			newUnit.addEventListener(GameObj.DESTROYED, function():void 
			{
				_minions.splice(arrInd, 1);
				checkForRespawn();
			});
			
			newUnit.start();
			
			checkForRespawn();
		}
		
		private function checkForRespawn():void 
		{
			if (_destroyed) return;
			if (!_spawnTimer.running && _minions.length < MaxMinions)
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
		
	}

}