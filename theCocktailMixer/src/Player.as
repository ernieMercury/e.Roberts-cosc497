package 
{
	import flash.display.Sprite;
	import flash.display.Graphics;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;

	import engine.*;

	
	public class Player extends Sprite
	{

		/// CTOR
		public function Player() 
		{
			// Draw once			
			
			var g:Graphics = this.graphics;	
			g.beginFill( 0x00aaff );
			g.drawRect(0, 0, 64, 175);
			g.endFill();
			
			
			
			x = 150-width;
			y = 225;
			
		}
		
		
		
		public function update():void
		{
			var delta:Number = Time.deltaTime;
			
			
			
		}
		
		public function die():void
		{
			//state = STATE_DEAD;
		}
	}

}