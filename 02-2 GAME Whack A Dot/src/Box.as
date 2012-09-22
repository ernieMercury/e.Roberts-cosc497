package  
{
	/**
	 * ...
	 * @author Ernest Roberts
	 */
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent; 
	
	public class Box extends Sprite
	{
		private const MAX_FRAMES_ALIVE:int = 60;
		
		private var main		:Main;		// Reference back to main (game) class.
		private var frame		:int = 0;	// Internal counter
		private var isClicked	:Boolean = false;
		
		private var bWidth		:int;
		private var bHeight		:int;
		
		public function Box( main:Main ) 
		{
			this.main = main;
			
			addEventListener( Event.ENTER_FRAME, onFrame );				// animation
			addEventListener( MouseEvent.MOUSE_DOWN, onMouseDown );		// input listening
			
		}
		
		public function onFrame( e:Event ):void {
			
			frame++;
			
			bWidth 	= frame * 3;
			bHeight 	= frame * 3;
			
			if (frame == MAX_FRAMES_ALIVE )
				destroy();
			
			graphics.clear();
			
			// The size and alpha of dot are both based on the frame # it has been alived.
			var percent:Number = (MAX_FRAMES_ALIVE - frame) / MAX_FRAMES_ALIVE;
			graphics.beginFill( 0xcc00ee, percent);
			graphics.drawRect(-bWidth/2, -bHeight/2, bWidth, bHeight);
			graphics.endFill();
		}
		
		private function destroy():void
		{
			if (!isClicked) {
				main.subtractFromScore();
			}
			
			// Remove listeners			
			removeEventListener( Event.ENTER_FRAME, onFrame );
			removeEventListener( MouseEvent.MOUSE_DOWN, onMouseDown );
			
			// Tell whatever is holding this in the display list to disconnect this 
			// sprite from the draw calls
			parent.removeChild( this );
		}
		
		private function onMouseDown( e:MouseEvent ):void 
		{
			isClicked = true;
			main.addToScore();
			destroy();
		}
		
	}

}