package 
{
	import engine.*;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.ui.Keyboard;
	import flash.ui.Mouse;
	

	public class Main extends Sprite 
	{
		private const MAX_LINES	:int = 24;
		
		private const MAX_FRAMES:int = 10;
		
		public var frameCount	:int = 0;
		
		private var getFrame1	:int = 0;
		private var getFrame2	:int = 0;
		
		private var frameSet	:Boolean = true;
		
		private var outString	:String = "false";
				
		private var outLines	:Vector.<TextField>;
		
		public var tf:TextField

		/// CTOR
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);

			Time.init( stage );
			Input.init( stage );
			Display.init( stage );
			
			/// Make screen output lines
			outLines = new Vector.<TextField>();
			var tf:TextField;
			for (var i:int = 0; i < MAX_LINES; i++)
			{
				tf = maketf( 16 );
				Display.ui.addChild( tf );
				tf.y = i * 20;
				outLines.push( tf );
				tf.text = "Default!";
			}
			
			addEventListener( Event.ENTER_FRAME, update );
		}
		
		/// Main update loop
		private function update( e:Event ):void
		{

			// Generate a string based on the input state of Spacebar
			var out:String =
				String( Time.frameCount ) + ": " + 
			  /*"getKeyDown: " + outString + 
				"    getKey: " + outString;*/
			    "getKeyDown: " + Input.getKeyDown( Keyboard.SPACE ) + 
				"    getKey: " + Input.getKey( Keyboard.SPACE );

			// Populate a textfield on the screen based on the frame
			tf= outLines[ Time.frameCount % MAX_LINES ];
			tf.text = out;
			
			// Update sub-systems
			Time.update();
			Input.update();
			
			if (Input.isMouseDown && (Input.inputCount == Time.frameCount)) {
				
				tf.textColor = 0x00ff00;
			}
			else if (Input.isMouseDown && (Input.inputCount != Time.frameCount))
				tf.textColor = 0xff00ff;

			
			// Change the color of the text field based on the Spacebar's state
			else if ( Input.getKeyDown( Keyboard.SPACE ) ) {
				
				/*if (!frameSet) {
					getFrame1 = Time.frameCount;
					frameSet = true;
				}
				else {
					
				}*/
				
				outString = "Space";
				tf.textColor = 0xff0000;	
			}
			else if ( Input.getKey( Keyboard.SPACE ) ) {
				
				tf.textColor = 0xccff00;
			}
			else {
				
				tf.textColor = 0x000000;
				outString = "false";
			}
			

			
			//if ( Input.onMouseDown(Mouse.) )
			
			//trace( out );
		}
		
		public function checkDoubleTap():void {
			if ((getFrame2 - getFrame1) <= MAX_FRAMES) {
				
			}
			else
				frameSet = false;
		}
		
		
	}
}
