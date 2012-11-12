package  
{
	import engine.ButtonPure;
	import engine.Display;
	import engine.IState;
	import engine.makeButton;
	import engine.maketf
	import engine.State;
	import engine.Systems;
	import flash.display.Bitmap;
	import flash.display.Graphics;
	import flash.display.Sprite;
	
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author Ernest Roberts
	 */
	public class WinState implements IState
	{
		private var bmpBkg:Bitmap = new Resource.imgCocktail1();
		
		public function WinState() 
		{
			
		}
		
		public function start():void {
			
			Display.bg.addChild(bmpBkg);
			bmpBkg.y = 100;// Display.stage.height - bmpBkg.height;
			
			var responseField:Sprite = new Sprite();
			
			var rf:Graphics = responseField.graphics;	
			rf.beginFill(0x00ff00);
			rf.drawRect(0, 0, 500, 25);
			rf.endFill();
			
			//Display.main.addChild(responseField);
			
			responseField.x = 50;
			Global.responseTf.width 		= 300;
			
			Global.responseTf.text 		= Global.rspString;
			Global.responseTf.x			= Display.stage.width/2;
			Global.responseTf.y 			= 0;
			Global.responseTf.mouseEnabled = false;
			
			//Display.ui.addChild(Global.responseTf);
			
			var tf		:TextField;

			tf = maketf(64, 0x00ff00, "MainFont");
			tf.text = "Congratulations!";
			tf.x = Display.stage.width/5;
			tf.y = 15;
			Display.ui.addChild( tf );
			
			tf = maketf(64, 0x00ff00, "MainFont");
			tf.text = "\nYou won the date!!";
			tf.x = 10;
			tf.y = 15;
			Display.ui.addChild( tf );
			
			var button	:Sprite;	// temporary variable, re-used in composing buttons

			button = makeButton("Play Again", clickBack, 0xa0a0ff );
			Display.ui.addChild( button );
			button.x = 295;
			button.y = 180;
			
			button = makeButton("Main Menu", clickMenu, 0xa0a0ff);
			Display.ui.addChild( button );
			button.x = 295;
			button.y = 235;
			
			Systems.sound.play( Resource.sndCheer );
		}
		
		public function update():void {
			
		}
		
		public function end():void {
			
			Systems.sound.stop();
			Display.clear();			
		}
		
		public function clickBack( button:ButtonPure ):void
		{
			State.current = new GameState();
			// WARNING: Be aware that end() was just called on this state!
		}
		
		public function clickMenu( button:ButtonPure ):void
		{

			State.current = new ShellState();
			// WARNING: Be aware that end() was just called on this state!
		}
	}

}