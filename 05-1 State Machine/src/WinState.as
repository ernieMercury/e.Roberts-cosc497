package  
{
	import engine.*;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	/**
	 * ...
	 * @author Ernest Roberts
	 */
	public class WinState implements IState
	{
		
		public function WinState() 
		{
			
		}
		
		public function start():void {
			
			var txtFormat:TextFormat = new TextFormat();
			txtFormat.align = TextFormatAlign.CENTER;
			
			var tf		:TextField;
			
			tf = maketf();
			tf.defaultTextFormat = txtFormat;
			
			tf.text = "You Win!!! \nYour Score is " + Global.score;
			
			/*tf.y = Display.height/2;
			tf.x = Display.width/2;*/
			Display.ui.addChild( tf );
			
			//Display.console.visible = false;
			
		}
		
		public function update():void {
			
		}
		
		public function end():void {
			
		}
	}

}