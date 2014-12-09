package GameObjects.Units 
{
	import flash.display.MovieClip;
	import flash.geom.Vector3D;
	import GameObjects.GameObj;
	import GameObjects.Units.Enemies.Enemy;
	
	/**
	 * ...
	 * @author FDH
	 */
	public class Minion extends Unit 
	{
		
		public function Minion()
		{
			super(new TempArt_Minion(), 100);
			_velocity = new Vector3D( -Speed);
			AttackDamage = 10;
		}
		
		override public function onCollide(other:GameObj):void 
		{
			if (other is Enemy)
			{
				super.onCollide(other);
			}
		}
		
	}

}