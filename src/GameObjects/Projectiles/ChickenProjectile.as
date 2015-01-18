package GameObjects.Projectiles 
{
	import flash.display.MovieClip;
	import flash.media.Sound;
	import flash.media.SoundTransform;
	
	/**
	 * ...
	 * @author FDH
	 */
	public class ChickenProjectile extends Projectile 
	{
		
		public function ChickenProjectile() 
		{
			super(new Kip1_ART(), 30, 60);
			
			// Play Sound
			var sound:Sound = new Audio_Chickenscream();
			sound.play(0, 0, new SoundTransform(1));
		}
		
	}

}