package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import engine.*;
	/**
	 * ...
	 * @author Ernest Roberts
	 */
	public class Main extends Sprite
	{
		
		public function Main() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			Systems.init( stage );
			
			//Global.level = 1;
			State.current = new GameState();
			
			addEventListener( Event.ENTER_FRAME, update );
			
		
		}
		
		private function update( e:Event ):void
		{
			engine.Time.update();
			Input.update();
			State.update();
		}
		
	}

}