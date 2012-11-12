package  
{
	import engine.center;
	import engine.Systems;
	import flash.display.Bitmap;
	
	import engine.Display;
	
	import engine.State;	
	import engine.IState;

	
	import engine.Time;
	
	import engine.maketf;
	import flash.display.SpreadMethod;
	import flash.display.Sprite;
	import flash.geom.Point;
	import flash.display.Graphics;
	import engine.makeButton;
	import engine.ButtonPure;
	import flash.text.TextField;

	
	public class GameState implements IState
	{

		private var rgbColor:uint = 0xff0000;
		
		private var isAdded:Boolean = false;
		
		private var numSec:Number = 0;
		
		private var bmpBG:Bitmap = new Resource.imgBkg();
		
				
		/// CTOR - minimize putting any code in here!
		public function GameState() 
		{
			
		}
		
		/// @see IState
		public function start():void
		{
			Global.depthID = 0;
			Global.currDepth = Global.prevDepth = 0;
			Global.rspString = " ";
			
			Global.alert.bmpAlert.visible = false;
			
			setUpOptions();			
			
			Display.bg.addChild(bmpBG);
			bmpBG.x = -3;
			bmpBG.y = 10;
			
			var responseField:Sprite = new Sprite();
			
			var rf:Graphics = responseField.graphics;	
			rf.beginFill(0x00ff00);
			rf.drawRect(0, 0, 500, 25);
			rf.endFill();
			
			Display.main.addChild(responseField);
			
			responseField.x = 50;
			Global.responseTf.width 		= 300;
			
			Global.responseTf.text 		= Global.rspString;
			Global.responseTf.x			= Display.stage.width/2;
			Global.responseTf.y 			= 0;
			Global.responseTf.mouseEnabled = false;
			
			Display.ui.addChild(Global.responseTf);
			
			Display.main.addChild( Global.player.bmpPlayer );
			Display.main.addChild(Global.npc.bmpNPC);
			Display.main.addChild(Global.alert.bmpAlert);
			
/////////////////////////////////////////////////////////////////////////////////////////////////	
			
			for (var b:int = 0; b < Global.vGameDepths[Global.currDepth].Options.length; b++) {
				Display.ui.addChild(Global.vGameDepths[Global.currDepth].Options[b].button);
			}
			
////////////////////////////////////////////////////////////////////////////////////////////////
			/*var cocktailButton:Sprite = new Sprite();
			cocktailButton = makeButton("C", clickCocktail, 50, 60);
			
			cocktailButton.x = 310;
			cocktailButton.y = 110;
			
			Display.ui.addChild(cocktailButton);*/
			
			Systems.sound.play( Resource.sndCrowd );
		}
				
		/// @see IState
		public function update():void
		{			
			var delta:Number = Time.deltaTime;	// cache delta value, used frequently
			
			numSec += delta;
						
			Global.player.update();
			Global.npc.update();
			Global.alert.update();
			
			if (Global.currDepth != Global.depthID){
				Global.vGameDepths[Global.currDepth].endDepth();
				
				if(Global.currDepth < 7)
					Global.prevDepth = Global.currDepth;
				
				Global.currDepth = Global.depthID;
				isAdded = false;
				
			}
			else {
				if (!isAdded) {
								
					Global.responseTf.text = Global.rspString;
					
					for (var b:int = 0; b < Global.vGameDepths[Global.currDepth].Options.length; b++) {
						Display.ui.addChild(Global.vGameDepths[Global.currDepth].Options[b].button);
					}
					isAdded = true;
				}
			}			
		}
		
		/// @see IState
		public function end():void
		{
			Systems.sound.stop();
			Display.clear();
		}
	}

}