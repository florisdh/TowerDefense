package UI.Menus 
{
	import flash.display.SimpleButton;
	import flash.events.Event;

	/**
	 * ...
	 * @author FDH
	 */
	public class StartMenu extends Menu 
	{
		// -- Events -- //
		
		public static const START:String = "Start";
		
		// -- Vars -- //
		private var _startButton:SimpleButton;
		
		// -- Construct -- //
		
		public function StartMenu() 
		{
			super();
			
			addChild(new TempArt_MainMenuBG());
			addButton(new TempArt_StartButton(), 250, 350, START);
			
		}
	}

}