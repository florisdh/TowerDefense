package GameObjects.Units {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.geom.Vector3D;
	import flash.utils.Timer;
	import GameObjects.GameObj;
	import GameObjects.MovingGameObj;
	import UI.InGame.HealthBar;
	
	/**
	 * ...
	 * @author FDH
	 */
	public class Unit extends MovingGameObj 
	{
		// -- Properties -- //
		
		public var Human:Humanoid;
		public var AttackDamage:Number = 10;
		public var Speed:Number = 4;
		
		// -- Vars -- //
		
		// TODO: Target Points
		//protected var _updateTargetDir:Boolean = true;
		//protected var _targetPoints:Vector.<Vector3D>;
		//protected var _cTargetPointInd:int = -1;
		
		protected var _healthBar:HealthBar;
		protected var _canAttack:Boolean = true;
		protected var _hasCollision:Boolean = false;
		private var _attackTimer:Timer;
		
		// -- Construct -- //
		
		public function Unit(art:MovieClip, health:Number) 
		{
			super(art);
			Human = new Humanoid(health); 
			Human.addEventListener(Humanoid.DIED, destroy);
			
			_healthBar = new HealthBar(Human);
			_healthBar.y = -height;
			addChild(_healthBar);
			
			_attackTimer = new Timer(1000, 1);
			_attackTimer.addEventListener(TimerEvent.TIMER, onAttackTick);
		}
		
		// -- Methods -- //
		
		protected function attack(other:GameObj):void 
		{
			if (!_canAttack) return;
			_canAttack = false;
			
			if (other.hasOwnProperty("Human") && other["Human"] is Humanoid)
			{
				var human:Humanoid = other["Human"];
				human.damage(AttackDamage);
				
				//trace("hit: " + other + " | " + human.Health);
			}
			
			_attackTimer.start();
		}
		
		private function onAttackTick(e:TimerEvent):void 
		{
			_canAttack = true;
		}
		
		override public function update(e:Event = null):void 
		{
			if (!_hasCollision)
			{
				super.update(e);
			}
			
			// For checking if collision stays
			_hasCollision = false;
		}
		
		override public function onCollide(other:GameObj):void 
		{
			_hasCollision = true;
			
			if (_canAttack) attack(other);
			
			super.onCollide(other);
		}
		
		// -- Get & Set -- //
		
		public function get AttackInterval():int
		{
			return _attackTimer.delay;
		}
		
		public function set AttackInterval(newVal:int):void
		{
			_attackTimer.delay = newVal;
		}
	}

}