package  
{
	import Factories.UnitFactory;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.geom.Vector3D;
	import flash.utils.Timer;
	import GameObjects.GameObj;
	import GameObjects.Units.Enemies.Enemy;
	/**
	 * ...
	 * @author FDH
	 */
	public class EnemySpawner 
	{
		// -- Properties -- //
		
		public var MinSpawnAmount:int = 1;
		public var MaxSpawnAmount:int = 5;
		public var EnemyTypes:Vector.<int> = new Vector.<int>();
		public var MaxEnemies:int = 5;
		public var SpawnedEnemies:Vector.<Enemy>;
		public var EnemySpawnPosition:Vector3D;
		public var EnemySpacing:Vector3D = new Vector3D(200, 0);
		
		// -- Vars -- //
		
		private var _engine:Engine;
		private var _started:Boolean = false;
		private var _spawnTimer:Timer;
		private var _unitFactory:UnitFactory;
		
		// -- Construct -- //
		
		public function EnemySpawner(engine:Engine, spawnPos:Vector3D) 
		{
			_engine = engine;
			EnemySpawnPosition = spawnPos;
			
			SpawnedEnemies = new Vector.<Enemy>();
			_unitFactory = new UnitFactory();
			_spawnTimer = new Timer(12000);
			_spawnTimer.addEventListener(TimerEvent.TIMER, onSpawnTick);
		}
		
		// -- Methods -- //
		
		private function spawnNext():void 
		{
			// Calculate amount of units to spawn
			var amount:int = MinSpawnAmount + Math.random() * (MaxSpawnAmount - MinSpawnAmount);
			
			// Apply max units
			if (SpawnedEnemies.length + amount > MaxEnemies) amount = MaxEnemies - SpawnedEnemies.length;
			
			// Too much enemies
			if (amount <= 0) return;
			
			for (var i:int = 0; i < amount; i++) 
			{
				// Calc spawn position
				var spawnPos:Vector3D = EnemySpacing.clone();
				spawnPos.scaleBy(i);
				spawnPos = spawnPos.add(EnemySpawnPosition);
				
				// Create Enemy
				var rndInd:int = Math.random() * EnemyTypes.length;
				var newEnemy:Enemy = _unitFactory.create(EnemyTypes[rndInd], _engine);
				newEnemy.Position = spawnPos;
				newEnemy.start();
				
				newEnemy.addEventListener(GameObj.DESTROYED, onEnemyDied);
				
				SpawnedEnemies.push(newEnemy);
			}
		}
		
		private function onSpawnTick(e:Event):void 
		{
			spawnNext();
		}
		
		public function start():void 
		{
			if (_started) return;
			_started = true;
			
			_spawnTimer.start();
		}
		
		public function stop():void
		{
			if (!_started) return;
			_started = false;
			
			_spawnTimer.stop();
		}
		
		private function onEnemyDied(e:Event):void 
		{
			// Get index
			var ind:int = SpawnedEnemies.indexOf(e.target);
			
			// Remove from array
			SpawnedEnemies.splice(ind, 1);
		}
		
		// -- Get & Set -- //
		
		public function get SpawnInterval():int
		{
			return _spawnTimer.delay;
		}
		
		public function set SpawnInterval(newVal:int):void 
		{
			_spawnTimer.delay = newVal;
		}
		
	}

}