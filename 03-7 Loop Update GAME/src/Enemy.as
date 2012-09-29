package  
{
	import flash.display.Bitmap;
	import flash.display.Graphics;
	import flash.geom.Vector3D;
	import utils.Display;
	
	
	/**
	 * Tiny square that moves around, like the punk it is!
	 */
	public class Enemy 
	{
		public var x			: Number = 0;
		public var y			: Number = 0;
		public var halfWidth	: Number = 15;
		public var halfHeight	: Number = 15;
		public var color		: uint;
		
		
		private var dirx	: Number = 0;
		private var diry	: Number = 0;
		
		public var isMovingX	:Boolean = false;
		public var isRed		:Boolean = false;
		
		public var enemyBMP:Bitmap;// = new Bitmap();
		
		
		/// CTOR
		public function Enemy() 
		{
			// set random position on left side of the screen.
			x = Math.random() * (Display.width / 2);
			y = Math.random() * Display.height;
			
			
			// Pick # at random; if 1 set color to red, otherwise make it blue.
			color = int( Math.random() * 2 ) ? 0xff0000 : 0x0000ff;
			
			if (color == 0xff0000) isRed = true;
			else isRed = false;
			
			// Pick a random direction to move by first choosing an angle, and then
			// doing some slick (yet simple) trig to figure out the X, Y.
			var degrees:Number = Math.random() * 360;
			
			// First convert "degrees" to radians
			var radians:Number = degrees * 0.017453;
			
			dirx = Math.cos( radians );
			diry = Math.sin( radians );
			
			checkDirection();
			
			if (isMovingX) {
				if (isRed) {
					if (dirx > 0) enemyBMP = new Resource.erRight();
					else enemyBMP = new Resource.erLeft();				
				}
				else {
					if (dirx > 0) enemyBMP = new Resource.ebRight();
					else enemyBMP = new Resource.ebLeft();
				}
			}
			else {
				if (isRed) {
					if (diry > 0) enemyBMP = new Resource.erFront();
					else enemyBMP = new Resource.erBack();		
				}
				else {
					if (diry > 0) enemyBMP = new Resource.ebFront();
					else enemyBMP = new Resource.ebBack();	
				}
			}
		}
		
		
		/// Called from somewhere else
		public function update():void
		{
			// Change location
			x += dirx;
			y += diry;
			
			// Check for screen wrapping
			if ( x < 0 )
				x += Display.width;
			
			if ( x > Display.width )
				x -= Display.width;
				
			if ( y < 0 )
				y += Display.height;
				
			if ( y > Display.height )
				y -= Display.height;
				
				
			// Draw self into graphics
			/*var graphics:Graphics = Display.game.graphics;
			graphics.beginFill( color );
			graphics.drawRect( x - halfWidth, y - halfHeight, halfWidth * 2, halfHeight * 2);
			graphics.endFill();*/
			
			enemyBMP.scaleX = 0.5;
			enemyBMP.scaleY = 0.5;
			
			enemyBMP.x = x - halfWidth;
			enemyBMP.y = y - halfHeight;
		}
		public function checkDirection():void {
			var xTemp:Number;
			var yTemp:Number;
			
			if (dirx < 0) xTemp = dirx * -1;
			else xTemp = dirx;
			
			if (diry < 0) yTemp = diry * -1;
			else yTemp = diry;
			
			if (xTemp > yTemp) isMovingX = true;
			else isMovingX = false;
		}
	}

}