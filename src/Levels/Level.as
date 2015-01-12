package Levels 
{
	import Factories.BuildingFactory;
	import Factories.UnitFactory;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Vector3D;
	import GameObjects.Buidings.Building;
	import GameObjects.Buidings.TowerBase;
	import GameObjects.GameObj;
	import Tools.Input;
	
	/**
	 * ...
	 * @author FDH
	 */
	public class Level extends Sprite 
	{
		// -- Events -- //
		
		public static const DONE:String = "Done";
		
		// -- Properties -- //
		
		// -- Vars -- //
		
		private var _started:Boolean = false;
		private var _engine:Engine;
		private var _buildingFactory:BuildingFactory;
		private var _camera:Camera;
		private var _enemySpawner:EnemySpawner;
		private var _castle:Building;
		private var _groundY:int = 700;
		private var _levelWidth:int = 5120;
		
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
			_camera = new Camera(this);
			
			// Add BG
			var groundTiles:Vector.<Class> = new <Class>[Art_grastile1, Art_grastile2, Art_grastile3];
			for (var j:int = 0; j < 5; j++) 
			{
				var rndInd:int = Math.random() * groundTiles.length;
				var chunk:MovieClip = new groundTiles[rndInd];
				chunk.x = chunk.width * j;
				chunk.y = _groundY - 30;
				addChildAt(chunk, 0);
			}
			
			// Create Castle
			_castle = _buildingFactory.create(BuildingFactory.CASTLE, _engine);
			_castle.x = _levelWidth - _castle.width / 2;
			_castle.y = _groundY;
			
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
			_enemySpawner.EnemyTypes = new <int> [ UnitFactory.ENEMY_SWORD, UnitFactory.ENEMY_CLUB, UnitFactory.ENEMY_BEASTRIDER, UnitFactory.ENEMY_GOBLIN, UnitFactory.ENEMY_ELITEGOBLIN ];
			//_enemySpawner.EnemyTypes = new <int> [ UnitFactory.ENEMY_ELITEGOBLIN ];
			_enemySpawner.MinSpawnAmount = 1;
			_enemySpawner.MaxSpawnAmount = 1;
			_enemySpawner.SpawnInterval = 2000;
			
			// Move Camera
			_camera.MinX = 0;
			_camera.MaxX = _levelWidth - Main.WINDOW_WIDTH;
			//_camera.Position = new Vector3D(_camera.MaxX);
		}
		
		public function destroy():void 
		{
			_engine.destroy();
		}
		
		public function start():void 
		{
			if (_started) return;
			_started = true;
			
			_engine.start();
			_enemySpawner.start();
		}
		
		public function stop():void 
		{
			if (!_started) return;
			_started = false;
			
			_engine.stop();
			_enemySpawner.stop();
		}
		
		public function update(e:Event = null):void 
		{
			if (!_started) return;
			
			_engine.update();
			_camera.update();
		}
		
		// -- Get & Set -- //
		
		public function get Started():Boolean
		{
			return _started;
		}
		
	}

}