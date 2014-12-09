package UI.InGame 
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author FDH
	 */
	public class HealthBar extends Sprite 
	{
		// -- Properties -- //
		
		// -- Vars -- //
		
		private var _back:Sprite;
		private var _front:Sprite;
		private var _human:Humanoid;
		
		// -- Construct -- //
		
		public function HealthBar(humanoid:Humanoid) 
		{
			_human = humanoid;
			_human.addEventListener(Humanoid.CHANGED, onHealthChanged);
			
			_back = new TempArt_HealthBar_Back();
			_back.x = -_back.width / 2;
			_back.y = -_back.height / 2;
			
			_front = new TempArt_HealthBar_Top();
			_front.x = -_front.width / 2;
			_front.y = -_front.height / 2;
			
			addChild(_back);
			addChild(_front);
		}
		
		// -- Methods -- //
		
		private function applyHealth():void 
		{
			_front.scaleX = _human.Health / _human.MaxHealth;
		}
		
		private function onHealthChanged(e:Event):void 
		{
			applyHealth();
		}
		
		// -- Get & Set -- //
		
	}

}