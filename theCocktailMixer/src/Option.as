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
			var index:int;
			
			
			if (isGood) {
				//show response based on text
			switch(Global.depthID) {
				case 0:
						for (var i:int = 0; Global.goodGreetings.length; i++) {
							if (this.text == Global.goodGreetings[i] && i & 1) {
								Global.rspString = Global.rsp0[0];
								break;
							}
							else {
								Global.rspString = Global.rsp0[1];
								break;
							}
						}
						
						trace(Global.rspString);
					break;
			}
				
			}
			else
				trace("Bad option");
				
				
			Global.responseTf.text = Global.rspString;
			Display.ui.addChild(Global.responseTf);
			//State.current = new GameState();
			// WARNING: Be aware that end() was just called on this state!
		}
		
	}

}