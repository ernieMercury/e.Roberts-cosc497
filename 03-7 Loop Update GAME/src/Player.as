package  
{
	import flash.display.Bitmap;
	import flash.display.Graphics;
	import flash.ui.Keyboard;
	import utils.Display;
	import utils.Input;

	
	/**
	 * ...
	 */
	public class Player 
	{
		public var x			: Number = 0;
		public var y			: Number = 0;		
		public var halfWidth	: Number = 30;
		public var halfHeight	: Number = 30;
		public var color		: uint = 0xff0000;
		
		
		public const BACK		:int = 0;
		public const LEFT		:int = 1;
		public const FRONT		:int = 2;		
		public const RIGHT		:int = 3;
		
		public var previousChild	:int = 2;
		
		public var isRed		:Boolean = true;

		public var bmpBBack		:Bitmap = new Resource.pbBack();
		public var bmpBLeft		:Bitmap = new Resource.pbLeft();
		public var bmpBFront	:Bitmap = new Resource.pbFront();
		public var bmpBRight	:Bitmap = new Resource.pbRight();
		
		public var bmpRBack		:Bitmap = new Resource.prBack();
		public var bmpRLeft		:Bitmap = new Resource.prLeft();
		public var bmpRFront	:Bitmap = new Resource.prFront();
		public var bmpRRight	:Bitmap = new Resource.prRight();
		
		
		
		public var redMaps	 	: Vector.<Bitmap>;
		public var blueMaps	 	: Vector.<Bitmap>;
		
		/// CTOR
		public function Player() 
		{
			redMaps = new Vector.<Bitmap>();
			
			redMaps.push(bmpRBack);
			redMaps.push(bmpRLeft);
			redMaps.push(bmpRFront);
			redMaps.push(bmpRRight);
			
			blueMaps = new Vector.<Bitmap>();
			
			blueMaps.push(bmpBBack);
			blueMaps.push(bmpBLeft);
			blueMaps.push(bmpBFront);
			blueMaps.push(bmpBRight);
			
			// Start player 75% of the way across the screen and
			// half way (50%) down the screen.
			
			x = Display.width * 0.75;
			y = Display.height * 0.5;
		}
		
		
		
		public function update():void
		{
			// Check input if movement should occur.
			if ( Input.isDown( Keyboard.DOWN ) ) {
				y += 10;
				if (isRed) {
					bmpRFront.visible = true;
					bmpRBack.visible = false;
					bmpRLeft.visible = false;
					bmpRRight.visible = false;
				}
				else {
					bmpBFront.visible = true;
					bmpBBack.visible = false;
					bmpBLeft.visible = false;
					bmpBRight.visible = false;
				}
			}
			if ( Input.isDown( Keyboard.UP ) ) {
				y -= 10;
				if (isRed) {
					bmpRFront.visible = false;
					bmpRBack.visible = true;
					bmpRLeft.visible = false;
					bmpRRight.visible = false;
				}
				else {
					bmpBFront.visible = false;
					bmpBBack.visible = true;
					bmpBLeft.visible = false;
					bmpBRight.visible = false;
				}
			}
			if ( Input.isDown( Keyboard.LEFT ) ) {
				x -= 10;
				if (isRed) {
					bmpRFront.visible = false;
					bmpRBack.visible = false;
					bmpRLeft.visible = true;
					bmpRRight.visible = false;
				}
				else {
					bmpBFront.visible = false;
					bmpBBack.visible = false;
					bmpBLeft.visible = true;
					bmpBRight.visible = false;
				}
				
			}
			if ( Input.isDown( Keyboard.RIGHT ) ) {
				x += 10;
				if (isRed) {
					bmpRFront.visible = false;
					bmpRBack.visible = false;
					bmpRLeft.visible = false;
					bmpRRight.visible = true;
				}
				else {
					bmpBFront.visible = false;
					bmpBBack.visible = false;
					bmpBLeft.visible = false;
					bmpBRight.visible = true;
				}
			}
			
			// Change color
			if ( Input.isDown( Keyboard.Z ) ) {
				if(!isRed){
				isRed = true;
				for (var z:int = 0; z < blueMaps.length; z++) {
					blueMaps[z].visible = false;
				}
				bmpRFront.visible = true
				color = 0xff0000;
				}
			}
			if ( Input.isDown( Keyboard.X ) ) {
				if(isRed){
				isRed = false;
				for (var j:int = 0; j < redMaps.length; j++) {
					redMaps[j].visible = false;
				}
				
				bmpBFront.visible = true
				color = 0x0000ff;
				}
			}
			
			// Draw self into graphics
			/*var graphics:Graphics = Display.game.graphics;
			graphics.lineStyle( 2, 0x0 );
			graphics.beginFill( color );
			graphics.drawRect( x - halfWidth, y - halfHeight, halfWidth * 2, halfHeight * 2);			
			graphics.endFill();*/
			
			/*bmpRBack.x = x - halfWidth;
			bmpRBack.y = y - halfHeight;*/
			
			for (var i:int = 0; i < redMaps.length; i++)
			{
				redMaps[i].x = x - halfWidth;
				redMaps[i].y = y - halfHeight;	
				
				blueMaps[i].x = x - halfWidth;
				blueMaps[i].y = y - halfHeight;
			}
			
		}
		
		
		/// Simple AABB collision 
		public function isColliding( enemy:Enemy ) :Boolean
		{			
			// First check horizontal...
			var length	: Number = halfWidth + enemy.halfWidth;	// minimum distance between centers before collision
			var diff	: Number = Math.abs( x - enemy.x);		// actual distance between centers
			
			if ( diff < length )
			{
				// Horizon is overlapping, now check vertical.
				
				length 	= halfHeight + enemy.halfHeight;
				diff	= Math.abs( y - enemy.y );
				
				// If vertically shorter, there is collision
				if ( diff < length )
					return true;
			}
			
			return false;
		}
		
	}

}