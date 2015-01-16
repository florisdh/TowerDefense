package  
{
	import flash.net.SharedObject;
	/**
	 * ...
	 * @author FDH
	 */
	public class UserStats 
	{
		// -- INFO -- //
		/*
		 *	Full static class to make access and life more easy
		*/
		
		// -- Properties -- //
		
		public static var Score:int = 0;
		public static var HighScore:int = 0;
		public static var Money:int = 200;
		
		// -- Methods -- //
		
		public static function load():void 
		{
			var shared:SharedObject = SharedObject.getLocal("sharedStorage");
			if (shared.data.HighScore) HighScore = shared.data.HighScore;
		}
		
		public static function save():void 
		{
			var shared:SharedObject = SharedObject.getLocal("sharedStorage");
			shared.data.HighScore = HighScore;
		}
		
	}

}