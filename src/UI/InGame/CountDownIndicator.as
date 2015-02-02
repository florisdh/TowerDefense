package UI.InGame 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.utils.Timer;
	
	/**
	 * ...
	 * @author FDH
	 */
	public class CountDownIndicator extends Sprite 
	{
		// -- Events -- //
		
		public static const DONE:String = "DONE";
		
		// -- Vars -- //
		
		private var _textField:TextField;
		private var _countDownTimer:Timer;
		
		// -- Construct -- //
		
		public function CountDownIndicator(seconds:int)
		{
			_textField = new TextField();
			_textField.autoSize = TextFieldAutoSize.LEFT;
			_textField.defaultTextFormat = new TextFormat("Ariel Black", 30, 0x222222, true);
			_textField.text = seconds.toString();
			addChild(_textField);
			
			_countDownTimer = new Timer(1000, seconds);
			_countDownTimer.addEventListener(TimerEvent.TIMER, onTick);
			_countDownTimer.addEventListener(TimerEvent.TIMER_COMPLETE, onComplete);
		}
		
		// -- Methods -- //
		
		public function start():void 
		{
			_countDownTimer.start();
		}
		
		private function onTick(e:TimerEvent):void 
		{
			_textField.text = (_countDownTimer.repeatCount - _countDownTimer.currentCount).toString();
		}
		
		private function onComplete(e:TimerEvent):void 
		{
			dispatchEvent(new Event(DONE));
		}
		
	}

}