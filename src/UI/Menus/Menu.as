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
		// -- Properties -- //
		
		// -- Vars -- //
		
		protected var _buttons:Vector.<SimpleButton>;
		protected var _spriteButtons:Vector.<Sprite>;
		
		// -- Construct -- //
		
		public function Menu() 
		{
			_buttons = new Vector.<SimpleButton>();
			_spriteButtons = new Vector.<Sprite>();
		}
		
		// -- Methods -- //
		
		protected function addButton(button:SimpleButton, xPos:int, yPos:int, onClick:String = null):void
		{
			button.x = xPos;
			button.y = yPos;
			
			if (onClick) button.addEventListener(MouseEvent.CLICK, function():void 
			{
				dispatchEvent(new Event(onClick));
			});
			
			_buttons.push(button);
			addChild(button);
		}
		
		protected function addSpriteButton(button:Sprite, x:int, y:int, clickEvent:String = ""):Sprite
		{
			button.x = x;
			button.y = y;
			
			// ClickEvent
			if (clickEvent != "") button.addEventListener(MouseEvent.CLICK, function(e:Event):void
			{
				dispatchEvent(new Event(clickEvent));
			});
			
			// Add
			_spriteButtons.push(button);
			addChild(button);
			
			return button;
		}
	}

}