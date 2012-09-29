package  
{
	import flash.display.Bitmap;
	/**
	 * ...
	 * @author Ernest Roberts
	 */
	public class Resource 
	{
		//// Player Bitmaps////////////////////////////////
		[Embed(source = "../lib/playerBlueBack.jpg")]
		static public var pbBack:Class;
		
		[Embed(source = "../lib/playerBlueFront.jpg")]
		static public var pbFront:Class;
		
		[Embed(source = "../lib/playerBlueLeft.jpg")]
		static public var pbLeft:Class;
		
		[Embed(source = "../lib/playerBlueRight.jpg")]
		static public var pbRight:Class;
		
		[Embed(source="../lib/playerRedBack.jpg")]
		static public var prBack:Class;
		
		[Embed(source = "../lib/playerRedFront.jpg")]
		static public var prFront:Class;
		
		[Embed(source = "../lib/playerRedLeft.jpg")]
		static public var prLeft:Class;
		
		[Embed(source = "../lib/playerRedRight.jpg")]
		static public var prRight:Class;
		
		/// Blue Enemey Bitmaps////////////////////////////////
		[Embed(source = "../lib/enemyBlueBack.jpg")]
		static public var ebBack:Class;
		
		[Embed(source = "../lib/enemyBlueFront.jpg")]
		static public var ebFront:Class;
		
		[Embed(source = "../lib/enemyBlueRight.jpg")]
		static public var ebRight:Class;
		
		[Embed(source = "../lib/enemyBlueLeft.jpg")]
		static public var ebLeft:Class;
		
		/// Red Enemy Bitmaps/////////////////////////////////
		[Embed(source = "../lib/enemyRedBack.jpg")]
		static public var erBack:Class;
		//public var bmpERBack:Bitmap = new erBack();
		
		[Embed(source = "../lib/enemyRedFront.jpg")]
		static public var erFront:Class;
		
		[Embed(source = "../lib/enemyRedLeft.jpg")]
		static public var erLeft:Class;
		
		[Embed(source = "../lib/enemyRedRight.jpg")]
		static public var erRight:Class;
		//public var bmpERRight:Bitmap = new erRight();
		
		
		public function Resource() 
		{
			
			
		}
		
	}

}