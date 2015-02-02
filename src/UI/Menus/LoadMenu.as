package UI.Menus 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	/**
	 * ...
	 * @author FDH
	 */
	public class LoadMenu extends Menu 
	{
		// -- Events -- //
		
		public static const LOADED:String = "LOADED";
		
		// -- Vars -- //
		
		private var _statusBarBack:MovieClip;
		private var _statusBarTop:MovieClip;
		
		// -- Construct -- //
		
		public function LoadMenu() 
		{
			super();
			
			_statusBarBack = new TempArt_StatusBar_Back();
			_statusBarTop = new TempArt_StatusBar_Top();
			
			_statusBarBack.x = _statusBarTop.x = (Main.Window_Width - _statusBarBack.width) / 2;
			_statusBarBack.y = _statusBarTop.y = (Main.Window_Height - _statusBarBack.height) / 2;
			
			addChild(_statusBarBack);
			addChild(_statusBarTop);
			
			
			addEventListener(Event.ENTER_FRAME, update);
		}
		
		// -- Methods -- //
		
		private function update(e:Event):void
		{
			// Wait untill added to stage
			if (!stage) return;
			
			// Calculate percentage loaded
			var scaleLoaded:Number = stage.loaderInfo.bytesLoaded / stage.loaderInfo.bytesTotal;
			
			trace(scaleLoaded);
			
			// Scale Statusbar
			_statusBarTop.scaleX = scaleLoaded;
			
			// Done
			if (scaleLoaded >= 1)
			{
				removeEventListener(Event.ENTER_FRAME, update);
				dispatchEvent(new Event(LOADED));
			}
		}
		
	}

}