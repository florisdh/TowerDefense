package UI.Menus 
{
	import flash.events.Event;
	import Tools.Input;
	/**
	 * ...
	 * @author FDH
	 */
	public class DeathMenu extends Menu 
	{
		// -- Events -- //
		
		public static const CONTINUE:String = "CONTINUE";
		
		// -- Vars -- //
		
		// -- Construct -- //
		
		public function DeathMenu() 
		{
			super();
			
			addChild(new Art_Eindscherm());
			addEventListener(Event.ENTER_FRAME, update);
		}
		
		private function update(e:Event):void 
		{
			if (Input.keyDown(13))
			{
				removeEventListener(Event.ENTER_FRAME, update);
				dispatchEvent(new Event(CONTINUE));
			}
		}
	}

}