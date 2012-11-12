package 
{
	import flash.text.TextField;
	import engine.maketf;
	
	/**
	 * Holds objects globally accessible.
	 */
	public class Global 
	{
		public static const MAX_DEPTHS:int = 10;
		
		public static var player:Player 	= new Player();
		public static var npc:NPC 			= new NPC();
		public static var alert:Alert		= new Alert();
		
		public static var depthID:int;
		public static var currDepth:int; 
		public static var prevDepth:int; 		
		
		public static var vGameDepths:Vector.<Depth>;
			
		public static var rspString:String = " ";
		public static var responseTf:TextField = maketf(16);
		
		/// CTOR: Instances not allowed.
		public function Global() 
		{
			throw new Error("Global is a static; it cannot be instantiated.");
		}
		
	}

}