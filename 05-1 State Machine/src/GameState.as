package  
{
	import engine.*;
	import flash.geom.Point;
	import flash.ui.Keyboard;

	
	public class GameState implements IState
	{
		private const ZOMBIE_BASE		:int = 50;	// guaranteed # of zombies
		private const ZOMBIE_MULTIPLIER	:int = 5;	// how many more zombies per level
		
		
		private var player	:Player;
		private var zombies	:Vector.<Zombie>;
		private var bullets	:Vector.<Bullet>;
		
		
		/// CTOR - minimize putting any code in here!
		public function GameState() 
		{
		}

		
		/// @see IState
		public function start():void
		{
			player = new Player();
			Display.main.addChild( player );			
			center( player );
			
			bullets = new Vector.<Bullet>();
			zombies = new Vector.<Zombie>();
			var zombie:Zombie;
			var point:Point;
			for ( var i:int = 0; i < (ZOMBIE_BASE + (Global.level * ZOMBIE_MULTIPLIER) ); i++ )
			{
				zombie = new Zombie( player );
				zombies.push( zombie );			// track all zombies outselves

				// Layout zombie on the screen
				point = getRandomPointOnRect( Display.width, Display.height );
				Display.main.addChild( zombie );
				zombie.x = point.x;
				zombie.y = point.y;
			}

			//Display.console.visible = false;
			
		}
		
		
		/// @see IState
		public function update():void
		{
			var delta:Number = Time.deltaTime;	// cache delta value, used frequently
			
			player.update();
			
			var len:int = zombies.length;
			for ( var i:int = len - 1; i >= 0; i-- )
			{
				if ( zombies[i].isDisposed )
				{
					// Remove object from both vector and display list
					Display.main.removeChild( zombies.splice( i, 1 )[0] );
				}
				else
				{
					zombies[i].update( delta );
				}
			}
			len = bullets.length;
			for ( i = len - 1; i >= 0; i-- )
			{
				if ( bullets[i].update( zombies ) )
					bullets.splice( i, 1 );
			}
			
			
			//***Change Level
			if (zombies.length == 0) {
				if (Global.level < 3) {
					//end();
					State.current = new NextState();
				}
				else
				State.current = new WinState();
			}
			
			if (Input.getKeyDown(192)) {
				//if (!Display.console.visible)
					//Display.console.visible = true;
				/*else
					Display.console.visible = false;*/
					trace("~ Hit");
					out("BLAH");
			}
		}
		
		
		public function addBullet( bullet:Bullet ):void
		{
			bullets.push( bullet );
			Display.main.addChild( bullet );
		}
		
		
		/// @see IState
		public function end():void
		{
			Display.clear();
		}
	}

}