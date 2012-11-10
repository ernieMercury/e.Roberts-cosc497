package  
{
	import flash.display.Sprite;
	import engine.makeButton;
	import flash.display.SimpleButton;
	import engine.Display;
	import engine.ButtonPure;
	/**
	 * ...
	 * @author Ernest Roberts
	 */
	public class Option
	{
		public var isGood:Boolean	=false;
		public var text:String	= "null";
		public var button:Sprite =  new Sprite();
		
		public function Option() 
		{

			///Display.ui.addChild( button );
			
		}
		
		public function createButton():void {
					
			button = makeButton(text, clickOption, 300, 20, 0.5);
		}
		
		public function clickOption( button:ButtonPure ):void
		{
			if (isGood) {
				Global.depthID++;

			}
			else {
				if (Global.depthID < 7)
					Global.depthID = 7;
				else if (Global.depthID < 8)
					Global.depthID = 8;
				else if (Global.depthID < 9)
					Global.depthID = 9;					
			}
				trace(Global.depthID);
				
			/*Global.responseTf.text = Global.rspString;
			Display.ui.addChild(Global.responseTf);*/
			//State.current = new GameState();
			// WARNING: Be aware that end() was just called on this state!
		}
		
	}

}