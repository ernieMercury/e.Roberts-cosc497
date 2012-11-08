package 
{
	import flash.text.TextField;
	import engine.maketf;
	
	/**
	 * Holds objects globally accessible.
	 */
	public class Global 
	{
		public static var player		: Player;
		
		public static var goodGreetings:Array = ["Hello", "Hey how's it going?", "Hi", "How are you?"];
		
		public static var badGreetings:Array = ["Sup?", "What's happening?", "Yo", "Yo what's sup?"];
		
		public static var rsp0:Array = ["Hi", "Not bad.", "Uh nothing.", "Um hi."];
		
		public static var depthID:int = 0;
		
		public static var rspString:String = "null";
		
		public static var responseTf:TextField = maketf(16);
		
		/// CTOR: Instances not allowed.
		public function Global() 
		{
			throw new Error("Global is a static; it cannot be instantiated.");
		}
		
	}

}