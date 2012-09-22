package 
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Rectangle;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.utils.getTimer;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	//import flash.display.BitmapDataChannel;
	
	
	/// Game to "whack" a dot by clicking on it
	public class Main extends Sprite 
	{	
		// -- CONSTANTS --
		
		private const FLASH_FRAMES		:int = 5;	// # of frames flashing a color when successfully clicking
		private const POINTS_PER_CLICK	:int = 10;	// # of points per successful click
		private const TIME_READY		:int = 2000;
		private const TIME_SET			:int = 3000;
		private const TIME_GO			:int = 4000;
		

		// -- MEMBERS --
		
		private var score		:int = 0;
		private var nextAppear	:int = 0;
		private var threshold	:int = 1500;
		private var bgFlash		:int = 0;
		
		
		private var sf			:TextField 		= new TextField();
	  /*private var bData1		:BitmapData;
		private var bData2		:BitmapData;
		private var bData3		:BitmapData;
		
		private var sunRect		:Rectangle;
		private var skyRect		:Rectangle;
		private var groundRect	:Rectangle;*/
		
		
		/// CTOR
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			//sunRect		
			/*skyRect		= new Rectangle(0, 0, stage.stageWidth, 400);	
			groundRect 	= new Rectangle(0, 400, stage.stageWidth, 200);
			
			var bOne:Bitmap = new Bitmap();
			bData1 = new BitmapData( 200, 200, false, 0x0 );
			bOne.bitmapData = bData1;
			bOne.x = 600;
			
			
			var bTwo:Bitmap = new Bitmap();
			bData2 = new BitmapData( stage.stageWidth, 400, false, 0x0 );
			bTwo.bitmapData = bData2;
			addChild(bTwo);
			
			var bThree:Bitmap = new Bitmap();
			bData3 = new BitmapData( stage.stageWidth, 200, false, 0x0 );
			bThree.bitmapData = bData3;
			bThree.y = 400;
			addChild(bThree);
			addChild(bOne);
			bData1.perlinNoise(32, 32, 13, 123, false, false, 3);
			bData2.noise( 123, 0, 255, 4, false );
			bData3.noise( 123, 0, 155, 2, false );*/
			
			
			//trace(stage.stageWidth.toString());
			
			sf.defaultTextFormat 	= new TextFormat( "Arial", 32 );
			sf.autoSize 			= TextFieldAutoSize.LEFT;
			sf.text 				= "Score: " + score;
			//trace(sf.text);
			addChild(sf);
		
			nextAppear = threshold * 2;
			addEventListener( Event.ENTER_FRAME, onFrame );
		}
		
		
		/// Called once every frame
		private function onFrame( e:Event ):void
		{
			var now:int = getTimer();	// get the # of milliseconds since program started
			graphics.clear();			// remove anything on the screen (that was drawn into this sprite's vector graphics layer.)
			
			/// Use conditionals for a street-light start, flashing and dot spawning logic
			if ( now < TIME_READY )
			{
				graphics.beginFill( 0xff0000 );
				graphics.drawCircle( stage.stageWidth * 0.5, stage.stageHeight * 0.5, 100 );
				graphics.endFill();
			}
			else if ( now < TIME_SET )
			{
				graphics.beginFill( 0xffff00 );
				graphics.drawCircle( stage.stageWidth * 0.5, stage.stageHeight * 0.5, 100 );
				graphics.endFill();
			}
			else if ( now < TIME_GO )
			{
				graphics.beginFill( 0x00ff00 );
				graphics.drawCircle( stage.stageWidth * 0.5, stage.stageHeight * 0.5, 100 );
				graphics.endFill();
				
				//addChild(sf);
			}
			else
			{
				sf.text 				= "Score: " + score;
				
				
				// Only create a new dot if the time is past when it's suppose to next appear.
				if ( now > nextAppear )
				{
					// Shrink the threshold, which determins how soon the next dot will appear.
					threshold -= 50;
					
					// If threshhold is less than half a second, don't create any more dots
					// as the game is about to end...
					if ( threshold < 500 )
					{
						// Make sure last dot is gone before showing game over
						if ( numChildren == 1 )
						{
							removeEventListener( Event.ENTER_FRAME, onFrame ); 	// stop frame updates
							gameOver();											// perform game over actions
							return;
						}
					}
					else
					{
						var r:int = Math.random() * 2;
						
						trace(r.toString());
						
						switch(r) {
							case 0:
								var dot :Dot = new Dot( this );
								addChild( dot );
								dot.x = Math.random() * stage.stageWidth;
								dot.y = Math.random() * stage.stageHeight;
								break;
							case 1:
								var box :Box = new Box( this );
								addChild( box );
								box.x = Math.random() * stage.stageWidth;
								box.y = Math.random() * stage.stageHeight;
								break;
						}
						
						// Compute when the next dot will appear after this one.
						nextAppear = now + threshold;
					}
				}
			}
			
			// If a flash is suppose to be up on the screen...
			if ( bgFlash > 0 ) 
			{
				// reduce the # of frames flash should occur.
				bgFlash--;
				
				// draw a giant rectangle the complete size of the screen
				graphics.beginFill( 0x00ff00 );
				graphics.drawRect(0, 0, stage.stageWidth, stage.stageHeight );
				graphics.endFill();
			}
		}
		
		
		/// Show game over information
		private function gameOver() :void
		{
			removeChild(sf);
			
			// Create text field (assume system has Arial font installed.)
			var tf:TextField 		= new TextField();
			tf.defaultTextFormat 	= new TextFormat( "Arial", 64 );
			tf.autoSize 			= TextFieldAutoSize.CENTER;
			tf.text 				= "Score: " + score;
			addChild( tf );
			
			// Center text field
			tf.x = (stage.stageWidth * 0.5) - (tf.textWidth * 0.5);
			tf.y = (stage.stageHeight * 0.5) - (tf.textHeight * 0.5);
		}
		
		
		/// Add to score, setup a flash to occur
		public function addToScore():void {
			score += POINTS_PER_CLICK;
			bgFlash = FLASH_FRAMES;
		}
		
		public function subtractFromScore():void {
			if (score > 0) {
				score -= POINTS_PER_CLICK;
			}
		}
		
		/*public function drawBackground():void {
			
			
		}*/
		
	}
	
}