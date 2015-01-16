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
			_front = new TempArt_HealthBar_Top();
			
			_back.x = _front.x = -_back.width / 2;
			_back.y = _front.y = -_back.height / 2;
			
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