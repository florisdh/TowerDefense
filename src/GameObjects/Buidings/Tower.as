package GameObjects.Buidings 
{
	import Factories.BuildingFactory;
	import flash.display.MovieClip;
	import flash.events.Event;
	import GameObjects.Units.Enemies.Enemy;
	import GameObjects.GameObj;
	import GameObjects.Units.Minion;
	
	/**
	 * ...
	 * @author FDH
	 */
	public class Tower extends Building 
	{
		// -- Properties -- //
		
		// -- Vars -- //
		
		private var _buildingFactory:BuildingFactory;
		private var _upgradeLevel:uint = 0;
		private var _maxUpgrade:uint = 3;
		
		// -- Construct -- //
		
		public function Tower(art:MovieClip, health:Number) 
		{
			super(art, health);
			
			Human.addEventListener(Humanoid.DIED, destroy);
			_buildingFactory = new BuildingFactory();
		}
		
		// -- Methods -- //
		
		public function Upgrade():void
		{
			if (_upgradeLevel < _maxUpgrade)
			{
				_upgradeLevel++;
			}
		}
		
		override public function destroy(e:Event = null):void 
		{
			var newBase:GameObj = _buildingFactory.create(BuildingFactory.TOWER_BASE, ParentEngine);
			newBase.Position = Position;
			newBase.start();
			
			stop();
			super.destroy(e);
		}
		
		// -- Get & Set -- //
		
	}

}