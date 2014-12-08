package Levels 
{
	import Factories.BuildingFactory;
	import flash.display.MovieClip;
	import flash.geom.Vector3D;
	import GameObjects.Buidings.Building;
	import GameObjects.TowerBase;
	/**
	 * ...
	 * @author FDH
	 */
	public class Level1 extends Level 
	{
		// -- Properties -- //
		
		// -- Vars -- //
		
		private var _castle:Building;
		
		// -- Construct -- //
		
		public function Level1() 
		{
			super();
		}
		
		// -- Methods -- //
		
		override public function init():void 
		{
			super.init();
			
			var bg1:MovieClip = new TempArt_BG1_1();
			bg1.x = 0;
			bg1.y = Main.HEIGHT - bg1.height;
			addChild(bg1);
			
			// Create Castle
			_castle = _buildingFactory.create(BuildingFactory.CASTLE, _engine);
			_castle.x = bg1.width - _castle.width / 2;
			_castle.y = bg1.y + bg1.height / 2;
			
			// Add Base Towers
			for (var i:int = 1; i <= 6; i++ )
			{
				var newBase:TowerBase = new TowerBase();
				newBase.x = _castle.x - i * 650;
				newBase.y = _castle.y;
				_engine.addObject(newBase);
			}
			
			// Move Camera
			_camera.MinX = 0;
			_camera.MaxX = bg1.width - Main.WIDTH;
			_camera.Position = new Vector3D(_camera.MaxX);
		}
		
		// -- Get & Set -- //
		
	}

}