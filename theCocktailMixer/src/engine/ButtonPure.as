package engine 
{
	import flash.display.Sprite;
	import flash.display.Graphics;
	import flash.text.TextField;
	
	import flash.events.MouseEvent;

	
	/// Pure code based button
	public class ButtonPure extends Sprite
	{
		private var up	:Sprite;
		private var down:Sprite;
		
		private var callBack	:Function;
		
		
		/// CTOR
		public function ButtonPure( text:String, callBack:Function, width:int, height:int, scale:Number ) 
		{
			var WIDTH:int = width;
			var HEIGHT:int = height;
			var SCALE:Number = scale;
			
			this.callBack = callBack;
			
			up 		= makeButtonState( text, 0x909090, WIDTH, HEIGHT, SCALE );
			down	= makeButtonState( text, 0xf0f0f0, WIDTH, HEIGHT, SCALE );
			
			addChild( up );
			
			addEventListener( MouseEvent.MOUSE_UP, 		onUp );
			addEventListener( MouseEvent.MOUSE_DOWN, 	onDown );
		}
				
		private function onUp( e:MouseEvent ):void
		{
			removeChildren();
			callBack.call( this, this );	// make function call, first this = context, second this = paramater passed to function
			addChild( up );
		}
		
		
		private function onDown( e:MouseEvent ):void
		{
			removeChildren();
			addChild( down );
		}
		
		
		/// Helper function to make a button
		private function makeButtonState( text:String, rgb:uint, WIDTH:int, HEIGHT:int, SCALE:Number ) :Sprite
		{
			var tf :TextField;
			
			tf 				= maketf( 32 );
			tf.width 		= WIDTH;
			tf.scaleY 		= SCALE;
			
			tf.text 		= text;
			tf.x			= 10;
			tf.y 			= (HEIGHT / 2) - (tf.textHeight / 2);
			tf.mouseEnabled = false;
			
			var sprite	:Sprite = new Sprite();
			var graphics:Graphics = sprite.graphics;
			
			graphics.beginFill( rgb, 0.8 );
			graphics.drawRoundRect( 0, 0, WIDTH, HEIGHT, 16, 16 );
			graphics.endFill();
			sprite.addChild( tf );
			sprite.mouseEnabled = true;
			
			return sprite;
		}		
	}
}
