package  
{
	import engine.Display;
	import engine.IState;
	import engine.maketf
	
	import flash.text.TextField;
	
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
			var tf		:TextField;

			tf = maketf();
			tf.text = "Win";
			tf.y = 10;
			Display.ui.addChild( tf );
		}
		
		public function update():void {
			
		}
		
		public function end():void {
			
		}
	}

}