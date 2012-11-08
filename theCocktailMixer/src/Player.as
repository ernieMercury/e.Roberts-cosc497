package 
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.geom.Matrix;
	import flash.geom.Vector3D;
	import flash.ui.Keyboard;
	import flash.utils.getTimer;
	import engine.*;

	
	public class Player extends Sprite
	{
		private static const SPEED 			: Number = 300.0;
		private static const JUMP_MAX_MS	: uint = 600;
		
		private static const STATE_RUNNING		: uint = 0;
		private static const STATE_JUMPING		: uint = 1;
		private static const STATE_DOUBLEJUMPING: uint = 2;
		private static const STATE_LANDING		: uint = 3;
		private static const STATE_DEAD			: uint = 4;
				
		public var state:uint = STATE_RUNNING;
		
		private var jumpStart:uint = 0;
		
		public function get isJumping():Boolean { return ( state != STATE_RUNNING ); }
		
		
		//HACK
		public var v:Vector3D = new Vector3D();
		
		/// CTOR
		public function Player() 
		{
			// Draw once			
			
			var g:Graphics = this.graphics;	
			g.beginFill( 0x00aaff );
			g.drawRect(0, 0, 64, 175);
			g.endFill();
			
		}
		
		
		
		public function update():void
		{
			var delta:Number = Time.deltaTime;
			
			
			/*if ( state == STATE_DEAD )
				return;
			
			if ( state == STATE_JUMPING || state == STATE_DOUBLEJUMPING )
			{	
				var now:uint = getTimer();
				var jumpTime:int = now - jumpStart;
				
				if ( jumpTime > JUMP_MAX_MS )
					state = STATE_LANDING;
				else if ( jumpTime > (JUMP_MAX_MS * 0.8 ))
					this.y -= ( delta * (SPEED * 0.5) );
				else if ( jumpTime > (JUMP_MAX_MS * 0.5 ))
					this.y -= ( delta * (SPEED * 0.75) );
				else 
					this.y -= ( delta * SPEED );
			}
			if ( state == STATE_LANDING )	//HACK
			{
				this.y += (delta * SPEED );
			}
			
			//HACK
			if(Global.world.isColliding(this)){
				v.y = Global.world.v.y; // isColliding( this );
				state = STATE_RUNNING;
			}
			
			//HACK
			if ( y+height > Global.world.FLOOR_Y )
			{
				x 	= Display.width * 0.25;
				y 	= Global.world.FLOOR_Y - height;
				state = STATE_RUNNING;
			}
			
			// Space to jump
			if ( state == STATE_JUMPING && Input.getKeyDown( Keyboard.SPACE ) )
			{
				state = STATE_DOUBLEJUMPING;
				jumpStart = getTimer();
			}*/
			
			
		}
		
		public function die():void
		{
			//state = STATE_DEAD;
		}
	}

}