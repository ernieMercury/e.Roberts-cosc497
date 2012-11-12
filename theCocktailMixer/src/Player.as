package 
{
	import flash.display.Sprite;
	import flash.display.Graphics;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;

	import engine.*;

	
	public class Player 
	{
		
		public var bmpPlayer:Bitmap = new Bitmap();
		public var bmpPlayer0:Bitmap = new Resource.imgPlayer0();
		public var bmpPlayer1:Bitmap = new Resource.imgPlayer1();

		private var isDrinking:Boolean = false;
		
		private var numSec:Number = 0;
		
		/// CTOR
		public function Player() 
		{
			// Draw once			
			
			bmpPlayer.bitmapData = bmpPlayer0.bitmapData;
			
			
			
			bmpPlayer.x = 86;// 150-width;
			bmpPlayer.y = 200;
			
			
		}
		
		
		
		public function update():void
		{
			var delta:Number = Time.deltaTime;
			//trace(delta);
			
			var r:int = Math.floor(Math.random() * 100);
			
			if ( r == 7) {
				isDrinking = true;
			}
			
			if (isDrinking) {
				bmpPlayer.bitmapData = bmpPlayer1.bitmapData;
				numSec += delta;
				if (numSec > 5) {
					numSec = 0;
					isDrinking = false;					
					bmpPlayer.bitmapData = bmpPlayer0.bitmapData;
				}
			}
			
					
			
		}
		
		public function die():void
		{
			//state = STATE_DEAD;
		}
	}

}