package GameObjects.Buidings 
{
	import Factories.ProjectileFactory;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.geom.Vector3D;
	import flash.utils.Timer;
	import GameObjects.GameObj;
	import GameObjects.Projectiles.Projectile;
	import GameObjects.Units.Enemies.Enemy;
	
	/**
	 * ...
	 * @author FDH
	 */
	public class RangedTower extends Tower 
	{
		// -- Properties -- //
		
		public static var MONEY_COST:int = 150;
		public static var UPGRADE_COST:int = 50;
		
		public var AttackInterval:int = 2000;
		
		// -- Vars -- //
		
		private var _projectileFactory:ProjectileFactory;
		
		// Minimum range to attack target and stop walking
		private var _attackRange:Number = 1024;
		
		// Closest target of attacktype within attackrange
		private var _closestTarget:Enemy;
		
		// Rotating part to shoot
		private var _arm:MovieClip;
		private var _armPos:Vector3D;
		
		// Shoot cooldown
		private var _canShoot:Boolean = true;
		private var _shootCooldownTimer:Timer;
		
		private var _projectTileType:int;
		
		// -- Construct -- //
		
		public function RangedTower() 
		{
			super(200);
			_projectileFactory = new ProjectileFactory();
			_shootCooldownTimer = new Timer(AttackInterval, 1);
			_shootCooldownTimer.addEventListener(TimerEvent.TIMER, onShootCooldown);
		}
		
		// -- Methods -- //
		
		override protected function applyUpgrade():void 
		{
			if (_art) removeChild(_art);
			if (_arm) removeChild(_arm);
			
			// Select tower & arm for this upgrade
			switch (_upgradeLevel) 
			{
				case 0:
					_art = new Art_Tower_Ranged_1();
					_arm = new Art_Tower_Crossbow();
					_armPos = new Vector3D( -80, -500);
					_projectTileType = ProjectileFactory.EGG;
				break;
				case 1:
					_art = new Art_Tower_Ranged_2();
					_arm = new Art_Tower_Balista();
					_armPos = new Vector3D(0, -500);
					_projectTileType = ProjectileFactory.CHICKEN;
				break;
				case 2:
					_art = new Art_Tower_Cannon();
					_arm = new Art_Tower_Ranged_Cannon();
					_armPos = new Vector3D(0, -500);
					_projectTileType = ProjectileFactory.CHICKEN;
				break;
				default:
			}
			
			_arm.x = _armPos.x;
			_arm.y = _armPos.y;
			
			_art.stop();
			
			addChild(_art);
			addChild(_arm);
			
			// Reposition healthbar
			_healthBar.y = -height - _healthBar.height / 2;
		}
		
		override public function update(e:Event = null):void 
		{
			super.update(e);
			
			// Search for target
			if (!Human.Died)
			{
				// Find closest target to attack
				_closestTarget = null;
				var closestDis:Number = -1;
				var l:int = ParentEngine.Items.length;
				for (var i:int = 0; i < l; i++) 
				{
					var other:GameObj = ParentEngine.Items[i];
					
					// Skip if has no health
					if (!other.hasOwnProperty("Human") || !(other["Human"] is Humanoid) || other["Human"].Died)
					{
						continue;
					}
					
					if (other is Enemy)
					{
						// Calc dis
						var dis:Number = Math.abs(other.x - x);
						
						// If target is within attack range and closer than closest selected target
						if (dis < _attackRange && (closestDis < 0 || closestDis < closestDis))
						{
							closestDis = dis;
							_closestTarget = other as Enemy;
							break;
						}
					}
				}
				
				// If target found
				if (_closestTarget)
				{
					// Rotate to target
					var offset:Vector3D = _closestTarget.Position.add(new Vector3D(0, -_closestTarget.height / 4)).subtract(ArmPos);
					var angle:Number = Math.atan2(offset.y, offset.x) * 180 / Math.PI + 180;
					_arm.rotation = angle;
					
					// Shoot
					if (_canShoot) shoot(offset);
				}
				else
				{
					_arm.rotation = 0;
				}
			}
		}
		
		private function shoot(direction:Vector3D):void 
		{
			if (!_canShoot) return;
			_canShoot = false;
			
			// Create projectile
			var newProjectile:Projectile = _projectileFactory.create(_projectTileType, ParentEngine);
			
			// Position
			var spawnPos:Vector3D = direction.clone();
			spawnPos.normalize();
			spawnPos.scaleBy(50);
			spawnPos = spawnPos.add(ArmPos);
			newProjectile.Position = spawnPos;
			
			// Shoot
			newProjectile.shoot(direction);
			newProjectile.start();
			
			// Start cooldown
			_shootCooldownTimer.start();
		}
		
		private function onShootCooldown(e:TimerEvent):void 
		{
			_canShoot = true;
		}
		
		override public function upgrade(e:Event = null):void 
		{
			if (UserStats.Money < MONEY_COST) return;
			UserStats.Money -= MONEY_COST;
			super.upgrade(e);
		}
		
		override public function start(e:Event = null):void 
		{
			super.start(e);
		}
		
		override public function stop(e:Event = null):void 
		{
			super.stop(e);
		}
		
		// -- Get & Set -- //
		
		private function get ArmPos():Vector3D
		{
			return Position.add(_armPos);
		}
	}

}