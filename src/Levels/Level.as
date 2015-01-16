package Levels 
{
	import Factories.BuildingFactory;
	import Factories.UnitFactory;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.geom.Vector3D;
	import flash.utils.Timer;
	import GameObjects.Buidings.Building;
	import GameObjects.Buidings.TowerBase;
	import GameObjects.GameObj;
	import Tools.Input;
	import UI.InGame.CountDownIndicator;
	
	/**
	 * ...
	 * @author FDH
	 */
	public class Level extends Sprite 
	{
		// -- Events -- //
		
		public static const FAILED:String = "Failed";
		
		// -- Properties -- //
		
		public var LevelWidth:int = 5120;
		
		// -- Vars -- //
		
		private var _started:Boolean = false;
		private var _engine:Engine;
		private var _buildingFactory:BuildingFactory;
		private var _enemySpawner:EnemySpawner;
		private var _castle:Building;
		private var _groundY:int = 700;
		private var _moneyGainTimer:Timer;
		
		// -- Construct -- //
		
		public function Level() 
		{
			super();
			init();
		}
		
		// -- Methods -- //
		
		public function init():void 
		{
			_engine = new Engine(this);
			_buildingFactory = new BuildingFactory();
			
			// Add BG Tiles
			var bgTiles:Vector.<Class> = new <Class>[ ART_BG1, ART_BG2, ART_BG3 ];
			for (var j:int = 0; j < 5; j++) 
			{
				var rndInd:int = Math.random() * bgTiles.length;
				var chunk:MovieClip = new bgTiles[rndInd];
				//chunk.cacheAsBitmap = true;
				chunk.x = chunk.width * j;
				chunk.y = 0;
				addChild(chunk);
			}
			
			// Add Ground Tiles
			var groundTiles:Vector.<Class> = new <Class>[Art_grastile1, Art_grastile2, Art_grastile3];
			for (var k:int = 0; k < 5; k++) 
			{
				var rndInd:int = Math.random() * groundTiles.length;
				var chunk:MovieClip = new groundTiles[rndInd];
				chunk.x = chunk.width * k;
				chunk.y = _groundY - 30;
				addChild(chunk);
			}
			
			// Create Castle
			_castle = _buildingFactory.create(BuildingFactory.CASTLE, _engine);
			_castle.x = LevelWidth - _castle.width / 2;
			_castle.y = _groundY;
			_castle.Human.addEventListener(Humanoid.DIED, onCastleDestroyed);
			
			// Add Tower Bases
			for (var i:int = 1; i <= 6; i++ )
			{
				var newBase:TowerBase = _buildingFactory.create(BuildingFactory.TOWER_BASE, _engine);
				newBase.x = _castle.x - i * 600;
				newBase.y = _groundY;
				newBase.start();
			}
			
			// Add Enemies
			_enemySpawner = new EnemySpawner(_engine, new Vector3D(0, _castle.y));
			_enemySpawner.EnemyTypes = new <int> [ UnitFactory.ENEMY_SWORD, UnitFactory.ENEMY_CLUB, UnitFactory.ENEMY_BEASTRIDER, UnitFactory.ENEMY_GOBLIN, UnitFactory.ENEMY_ELITEGOBLIN, UnitFactory.ENEMY_RAM ];
			//_enemySpawner.EnemyTypes = new <int> [ UnitFactory.ENEMY_SWORD ];
			_enemySpawner.MaxEnemies = 5;
			_enemySpawner.MinSpawnAmount = 1;
			_enemySpawner.MaxSpawnAmount = 2;
			_enemySpawner.SpawnInterval = 3000;
			
			_moneyGainTimer = new Timer(400);
			_moneyGainTimer.addEventListener(TimerEvent.TIMER, gainMoneyTick);
			
		}
		
		public function destroy():void 
		{
			_engine.destroy();
		}
		
		private function onCastleDestroyed(e:Event):void 
		{
			dispatchEvent(new Event(FAILED));
		}
		
		private function gainMoneyTick(e:TimerEvent):void 
		{
			UserStats.Money++;
		}
		
		public function start():void 
		{
			if (_started) return;
			_started = true;
			
			_engine.start();
			_enemySpawner.start();
			_moneyGainTimer.start();
		}
		
		public function stop():void 
		{
			if (!_started) return;
			_started = false;
			
			_moneyGainTimer.stop();
			_enemySpawner.stop();
			_engine.stop();
		}
		
		public function update(e:Event = null):void 
		{
			if (!_started) return;
			
			_engine.update();
		}
		
		// -- Get & Set -- //
		
		public function get Started():Boolean
		{
			return _started;
		}
		
	}

}