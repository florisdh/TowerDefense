package GameObjects.Bullets {
	import Factories.CoinFactory;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.geom.Vector3D;
	import GameObjects.Bosses.Boss;
	import GameObjects.Coins.Coin;
	import GameObjects.GameObj;
	
	/**
	 * ...
	 * @author FDH
	 */
	public class PlayerBullet extends Bullet 
	{
		// -- Properties -- //
		
		// -- Vars -- //
		
		private var _coinFactory:CoinFactory;
		
		// -- Construct -- //
		
		public function PlayerBullet() 
		{
			super(new Art_Bullet());
			_art.x = -_art.width / 2;
			_art.y = -_art.height / 2;
			
			_coinFactory = new CoinFactory();
			
			Damage = UserStats.Damage;
			
			_velo = new Vector3D(0, -30);
		}
		
		// -- Methods -- //
		
		// -- Overrides -- //
		
		override public function onCollide(other:GameObj):void 
		{
			if (other is Boss)
			{
				var boss:Boss = (other as Boss);
				boss.Health.damage(Damage);
				boss.pushBack(Position, 8);
				
				// Create coin
				var amt:int = Math.floor(Math.random() * 3);
				for (var i:int = 0; i < amt; i++) 
				{
					var newCoin:Coin = _coinFactory.create(CoinFactory.BRONZECOIN, ParentEngine);
					newCoin.Position = Position.clone();
					var targetPos:Vector3D = newCoin.Position.add(new Vector3D(-40 + Math.random() * 80, 20));
					newCoin.jump(targetPos, 5);
				}
				
				destroy();
			}
		}
	}

}