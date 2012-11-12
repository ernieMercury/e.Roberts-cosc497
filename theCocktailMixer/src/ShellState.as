package  
{
	import engine.*;
	import flash.display.Bitmap;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.ui.Keyboard;
	
	
	/**
	 * ...
	 * @author Ernest Roberts
	 */
	public class ShellState implements IState
	{
		private var bmpBkg:Bitmap = new Resource.imgCocktail0;
		
		public function ShellState() 
		{
			
		}
		
public function start():void
		{
			Display.bg.addChild(bmpBkg);
			bmpBkg.x = (Display.width / 2 - bmpBkg.width / 2)+15;
			bmpBkg.y = 10;
			
			var tf		:TextField;

			tf = maketf(64, 0x000000, "MainFont");
			tf.text = "the Cocktail Mixer";
			tf.x = (Display.width/2)-(tf.width/2);
			tf.y = 80;
			Display.ui.addChild( tf );
			
			
			tf = maketf(32, 0x000000, "MainFont");
			tf.text = "Woo the girl. Get the date.";
			tf.x = (Display.width / 2)-(tf.width/2);
			tf.y = 300;
			Display.ui.addChild( tf );

			var button	:Sprite;	// temporary variable, re-used in composing buttons

			button = makeButton("Play", clickPlay, 0x8e8e38 );
			Display.ui.addChild( button );
			button.x = 5;
			button.y = 150;
			
			Systems.sound.play( Resource.sndIntro );
			
		}

		/// @see IState
		public function update():void
		{
			
			
			
		}

		/// @see IState
		public function end():void
		{
			Systems.sound.stop();
			Display.clear();
		}

		public function clickPlay( button:ButtonPure ):void
		{
			State.current = new GameState();
			// WARNING: Be aware that end() was just called on this state!
		}
		
	}

}