package  
{
	import engine.ButtonPure;
	import engine.Display;
	import engine.IState;
	import engine.makeButton;
	import engine.maketf;
	import engine.State;
	import engine.Systems;
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.text.TextField;
	/**
	 * ...
	 * @author Ernest Roberts
	 */
	public class LoseState implements IState
	{
		
		public function LoseState() 
		{
			
		}
		public function start():void {
				
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
						
			var tf		:TextField;

			tf = maketf(64, 0xff0000, "MainFont");
			tf.text = "Game Over";
			tf.x = Display.stage.width/4;
			tf.y = 15;
			Display.ui.addChild( tf );
			
			tf = maketf(64, 0xff0000, "MainFont");
			tf.text = "\nYou lost the date.";
			tf.x = 30;
			tf.y = 15;
			Display.ui.addChild( tf );
			
			var button	:Sprite;	// temporary variable, re-used in composing buttons

			button = makeButton("Try Again", clickBack );
			Display.ui.addChild( button );
			button.x = 5;
			button.y = 160;
			
			button = makeButton("Main Menu", clickMenu );
			Display.ui.addChild( button );
			button.x = 5;
			button.y = 215;
			
			Systems.sound.play( Resource.sndSad );
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