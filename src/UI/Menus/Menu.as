package UI.Menus 
{
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author FDH
	 */
	public class Menu extends Sprite 
	{
		
		public function Menu() 
		{
			super();
		}
		
		protected function addButton(button:SimpleButton, xPos:int, yPos:int, onClick:String = null):void
		{
			button.x = xPos;
			button.y = yPos;
			if (onClick) button.addEventListener(MouseEvent.CLICK, function():void 
			{
				dispatchEvent(new Event(onClick));
			});
			addChild(button);
		}
	}

}