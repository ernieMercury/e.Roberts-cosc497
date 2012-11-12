package  
{
	import engine.State;
	import engine.Systems;
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
		public var isGood:Boolean	= false;
		
		public var text:String		= "null";
		public var stRsp:String		= " ";
		
		public var button:Sprite	= new Sprite();
		
		public function Option() 
		{
			
		}
		
		public function createButton():void {
					
			button = makeButton(text, clickOption, 0xed9121, 0.5, 20, 300); //0xa0a0ff - lavender
		}
		
		public function clickOption( button:ButtonPure ):void
		{	
			
			if (isGood) {
			
				if (Global.currDepth > 6) {
					
					Global.depthID = Global.prevDepth -1;
				}
				
				Global.depthID++;
				
				Global.alert.isRight = true;

				Systems.sound.play( Resource.sndGood );
				
				if (Global.depthID > 6)
					State.current = new WinState();

			}
			

			else {
				
				var r:int = Math.floor(Math.random() * 2);
				
				Global.alert.isRight = false;
				
				if (Global.depthID < 7) {
					
					stRsp = tStrings.bRsp0[r];	
					Global.depthID = 7;
				}
				else if (Global.depthID < 8) {
					
					stRsp = tStrings.bRsp1[r];
					Global.depthID = 8;
				}
				else if (Global.depthID < 9) {
					
					stRsp = tStrings.bRsp2[r];					
					Global.depthID = 9;		
				}
				else {
					
					Global.rspString = stRsp;
					State.current = new LoseState();
				}
				
				Systems.sound.play( Resource.sndBad );
			}
			
			Global.alert.bmpAlert.visible = true;
			Global.alert.speed = 0.5;
			
			Global.rspString = stRsp;
			/*Global.responseTf.text = Global.rspString;
			Display.ui.addChild(Global.responseTf);*/
		}
		
	}

}