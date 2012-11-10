package  
{
	import engine.center;
	
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

		private var rwColor:uint = 0xff0000;
		
		private var isAdded:Boolean = false;
		
		private var currentDepth:int = 0; 
				
		/// CTOR - minimize putting any code in here!
		public function GameState() 
		{
			
		}
		
		/// @see IState
		public function start():void
		{
			
			var responseField:Sprite = new Sprite();
			
			var rf:Graphics = responseField.graphics;	
			rf.beginFill(0x00ff00);
			rf.drawRect(0, 0, 500, 25);
			rf.endFill();
			
			Display.main.addChild(responseField);
			
			responseField.x = 50;
			
			
			
			Global.responseTf.width 		= 300;
			//responseTf.scaleY 		= SCALE;
			
			//responseTf.text 		= Global.rspString;
			Global.responseTf.x			= 300;
			Global.responseTf.y 			= 0;
			Global.responseTf.mouseEnabled = false;
			
			
			var rwIndicator:Sprite = new Sprite();
			
			var rw:Graphics = rwIndicator.graphics;	
			rw.beginFill(rwColor);
			rw.drawRect(0, 0, 32, 32);
			rw.endFill();
			
			Display.main.addChild(rwIndicator);
			
			//var npc:Sprite = new Sprite();
			
			
			

			
			Display.main.addChild( Global.player );
			Display.main.addChild(Global.npc);
			
			trace("player drawn");
			//center( player );
			
			/*npc.x = player.x +(player.x/2);
			npc.y = 225;*/
			
			rwIndicator.x = (Global.npc.x + Global.npc.width)+ 5;
			rwIndicator.y = 200;
			
			/*player.x *= 0.5;
			player.y = 225;*/
			
			//trace("playerY: " + player.y);
/////////////////////////////////////////////////////////////////////////////////////////////////			
			/*var greet:Depth = new Depth();
			
			greet.setDepth(Global.depthID);
			
			for (var b:int = 0; b < greet.Options.length; b++) {
				Display.ui.addChild(greet.Options[b].button);
				trace(greet.Options[b].text);
			}*/
			//Display.ui.addChild
			setUpOptions();
			
			for (var b:int = 0; b < Global.vGameDepths[currentDepth].Options.length; b++) {
				Display.ui.addChild(Global.vGameDepths[currentDepth].Options[b].button);
			}
////////////////////////////////////////////////////////////////////////////////////////			
			var cocktailButton:Sprite = new Sprite();
			cocktailButton = makeButton("C", clickCocktail, 50, 60);
			
			cocktailButton.x = 310;
			cocktailButton.y = 110;
			
			Display.ui.addChild(cocktailButton);
			/*tempOption.button.x = 5;
			tempOption.button.y = 150;*/
			//Display.ui.addChild(tempOption.button);
		}
		
		
		/// @see IState
		public function update():void
		{
			var delta:Number = Time.deltaTime;	// cache delta value, used frequently
			
			if (currentDepth != Global.depthID){
				Global.vGameDepths[currentDepth].endDepth();
				currentDepth = Global.depthID;
				isAdded = false;
			}
			else {
				if (!isAdded){
					for (var b:int = 0; b < Global.vGameDepths[currentDepth].Options.length; b++) {
						Display.ui.addChild(Global.vGameDepths[currentDepth].Options[b].button);
					}
					isAdded = true;
				}
			}
			
			if (Global.depthID > 6)
				State.current = new WinState();
			
		}
		
		/// @see IState
		public function end():void
		{
			Display.clear();
		}
		
		public function clickCocktail( button:ButtonPure ):void
		{
			//trace("clickOption");

			//State.current = new GameState();
			// WARNING: Be aware that end() was just called on this state!
		}
	}

}