package GameObjects.Projectiles 
{
	import flash.display.MovieClip;
	
	/**
	 * ...
	 * @author FDH
	 */
	public class EggProjectile extends Projectile 
	{
		
		public function EggProjectile() 
		{
			super(new EI_ART(), 30, 30);
			_art.scaleX = _art.scaleY = 0.5;
		}
		
	}

}