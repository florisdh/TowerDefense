package UI.Menus 
{
	import flash.display.SimpleButton;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import Tools.Input;

	/**
	 * ...
	 * @author FDH
	 */
	public class StartMenu extends Menu 
	{
		// -- Events -- //
		
		public static const START:String = "START";
		
		// -- Vars -- //
		
		// -- Construct -- //
		
		public function StartMenu() 
		{
			super();
			
			addChild(new Art_Startscherm());
			addEventListener(Event.ENTER_FRAME, update);
		}
		
		// -- Methods -- //
		
		private function update(e:Event):void 
		{
			if (Input.keyDown(13))
			{
				removeEventListener(Event.ENTER_FRAME, update);
				dispatchEvent(new Event(START));
			}
		}
	}

}