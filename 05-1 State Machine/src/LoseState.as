package  
{
	import engine.*;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.MouseEvent;
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
			var tf		:TextField;
			
			tf = maketf();
			tf.text = "You Lose \nYour score is " + Global.score;
			tf.y = 150;
			tf.x = 150;
			Display.ui.addChild( tf );
			
			//Display.console.visible = false;
		}
		
		public function update():void {
			
		}
		
		public function end():void {
			Display.clear();
		}
	}

}