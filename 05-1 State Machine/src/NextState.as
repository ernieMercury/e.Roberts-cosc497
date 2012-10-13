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
	public class NextState implements IState
	{
		
		
		public function NextState() 
		{
			
		}
		
		public function start():void {
			
			var button	:Sprite;	// temporary variable, re-used in composing buttons
						
			button = makeButton("Next Level", clickNext );
			Display.ui.addChild( button );
			button.x = 5;
			button.y = 150;
			
			//Display.console.visible = false;
		}
		
		/// @see IState
		public function update():void
		{
		}
		
		public function end():void {
			
			Display.clear();
			
		}
		
		public function clickNext( button:ButtonPure ):void
		{
			//trace("ShellState: play");
			Global.level++;
			State.current = new GameState();
			// WARNING: Be aware that end() was just called on this state!
		}
	}

}