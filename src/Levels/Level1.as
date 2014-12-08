package Levels 
{
	import Factories.BuildingFactory;
	import flash.display.MovieClip;
	import flash.geom.Vector3D;
	/**
	 * ...
	 * @author FDH
	 */
	public class Level1 extends Level 
	{
		
		public function Level1() 
		{
			super();
		}
		
		override public function init():void 
		{
			super.init();
			
			var bg1:MovieClip = new TempArt_BG1_1();
			bg1.x = 0;
			bg1.y = Main.HEIGHT - bg1.height;
			addChild(bg1);
			
			_castle = _buildingFactory.create(BuildingFactory.CASTLE, _engine);
			_castle.x = bg1.width - _castle.width;
			_castle.y = bg1.y + bg1.height / 2;
			
			_camera.MinX = 0;
			_camera.MaxX = bg1.width - Main.WIDTH;
			_camera.Position = new Vector3D(_camera.MaxX);
		}
		
	}

}