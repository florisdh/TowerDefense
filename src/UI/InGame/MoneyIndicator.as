package UI.InGame 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	/**
	 * ...
	 * @author FDH
	 */
	public class MoneyIndicator extends Sprite 
	{
		// -- Properties -- //
		
		// -- Vars -- //
		
		private var _textField:TextField;
		
		// -- Construct -- //
		
		public function MoneyIndicator() 
		{
			_textField = new TextField();
			_textField.autoSize = TextFieldAutoSize.LEFT;
			_textField.defaultTextFormat = new TextFormat("Ariel Black", 30, 0x222222, true);
			_textField.text = UserStats.Money + "$";
			addChild(_textField);
		}
		
		// -- Methods -- //
		
		public function update(e:Event):void 
		{
			_textField.text = UserStats.Money + "$";
		}
		
	}

}