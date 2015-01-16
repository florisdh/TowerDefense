package GameObjects.Units {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.geom.ColorTransform;
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
		public var MoveSpeed:Number = 4;
		public var MoveDir:int;
		
		// -- Vars -- //
		
		protected var _healthBar:HealthBar;
		
		// Types of units to attack
		protected var _attackTypes:Vector.<Class> = new Vector.<Class>();
		
		// Minimum range to attack target and stop walking
		protected var _attackRange:Number;
		
		// Closest target of attacktype within attackrange
		protected var _closestTarget:GameObj;
		
		// Attack cooldown
		protected var _canAttack:Boolean = true;
		private var _attackTimer:Timer;
		
		// Hit effect timer
		private var _hitTimer:Timer;
		
		// Anim frames
		private var _deathAnimStarted:Boolean = false;
		protected var _anim_walk_begin:int;
		protected var _anim_walk_end:int;
		protected var _anim_attack_begin:int;
		protected var _anim_attack_end:int;
		protected var _anim_death_begin:int;
		protected var _anim_death_end:int;
		
		// -- Construct -- //
		
		public function Unit(art:MovieClip, health:Number) 
		{
			super(art);
			
			Human = new Humanoid(health); 
			Human.addEventListener(Humanoid.CHANGED, onHit);
			Human.addEventListener(Humanoid.DIED, onDied);
			
			_healthBar = new HealthBar(Human);
			_healthBar.y = -height;
			addChild(_healthBar);
			
			//_attackRange = _art.width / 2;
			_attackTimer = new Timer(1000, 1);
			_attackTimer.addEventListener(TimerEvent.TIMER, onAttackTick);
			
			_hitTimer = new Timer(500, 1);
			_hitTimer.addEventListener(TimerEvent.TIMER, onHitDone);
			
			_velocity = new Vector3D(MoveDir * MoveSpeed);
		}
		
		// -- Methods -- //
		
		protected function attack(other:GameObj):void 
		{
			if (!_canAttack || !_started) return;
			_canAttack = false;
			
			// Damage if has health
			var human:Humanoid = other["Human"];
			human.damage(AttackDamage);
			
			// Anim
			_art.gotoAndPlay(_anim_attack_begin);
			
			// Restart cooldown
			_attackTimer.start();
		}
		
		protected function onAttackTick(e:TimerEvent):void 
		{
			_canAttack = true;
		}
		
		protected function onHit(e:Event):void 
		{
			// Apply red color overlay
			_art.transform.colorTransform = new ColorTransform(1.5, 0.5, 0.5);
			
			if (_hitTimer.running) _hitTimer.stop();
			_hitTimer.start();
		}
		
		private function onDied(e:Event):void 
		{
			_velocity.scaleBy(0);
		}
		
		protected function onHitDone(e:TimerEvent):void
		{
			// Reverse color overlay
			_art.transform.colorTransform = new ColorTransform(1, 1, 1);
		}
		
		override public function update(e:Event = null):void 
		{
			if (!_started) return;
			
			super.update(e);
			
			if (!Human.Died)
			{
				// Find closest target to attack
				_closestTarget = null;
				var closestDis:Number = _attackRange;
				var l:int = ParentEngine.Items.length;
				for (var i:int = 0; i < l; i++) 
				{
					var other:GameObj = ParentEngine.Items[i];
					
					// Skip if has no health
					if (!other.hasOwnProperty("Human") || !(other["Human"] is Humanoid) || other["Human"].Died)
					{
						continue;
					}
					
					for each (var cType:Class in _attackTypes) 
					{
						if (other is cType)
						{
							// Calc dis
							var dis:Number = Math.abs(other.x - x);
							
							// Remove half of other size to fix the bug: wide enemy size to the center is higher
							dis -= other.width / 2;
							
							// If target is within attack range and closer than closest selected target
							if (dis < closestDis)
							{
								closestDis = dis;
								_closestTarget = other;
								break;
							}
						}
					}
				}
				
				// If target found
				if (_closestTarget)
				{
					// Stop walking
					_velocity.scaleBy(0);
					
					// Attack
					if (_canAttack) attack(_closestTarget);
				}
				else if (!Human.Died)
				{
					// Walk
					_velocity = new Vector3D(MoveDir * MoveSpeed);
				}
			}
			
			// Animations
			
			// Death
			if (Human.Died)
			{
				if (!_deathAnimStarted)
				{
					_deathAnimStarted = true;
					_art.gotoAndPlay(_anim_death_begin);
				}
				else if (_art.currentFrame >= _anim_death_end || _art.currentFrame < _anim_death_begin)
				{
					destroy();
				}
			}
			
			// Attack
			else if (_closestTarget)
			{
				if (_art.currentFrame >= _anim_attack_end)
				{
					_art.stop();
				}
			}
			
			// Walk
			else
			{
				if (_art.currentFrame < _anim_walk_begin || _art.currentFrame >= _anim_walk_end)
				{
					_art.gotoAndPlay(_anim_walk_begin);
				}
			}
		}
		
		override public function start(e:Event = null):void 
		{
			super.start(e);
			if (!_canAttack) _attackTimer.start();
		}
		
		override public function stop(e:Event = null):void 
		{
			super.stop(e);
			_attackTimer.stop();
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