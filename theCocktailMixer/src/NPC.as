package  
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.display.Graphics;
	
	/**
	 * ...
	 * @author Ernest Roberts
	 */
	public class NPC
	{
		
		public var bmpNPC:Bitmap = new Bitmap();
		public var bmpNPC0:Bitmap = new Resource.imgNPC0();
		public var bmpNPC1:Bitmap = new Resource.imgNPC1();
		
		public function NPC() 
		{
			bmpNPC.bitmapData = bmpNPC0.bitmapData;
			
			bmpNPC.x = 400+bmpNPC.width;
			bmpNPC.y = 200;
			
			bmpNPC.scaleX = -1;
		}
		
		public function update():void {
			
			var r:int = Math.floor(Math.random() * 100);
			
			if ( r == 7) {
				
				if (bmpNPC.bitmapData != bmpNPC1.bitmapData)
					bmpNPC.bitmapData = bmpNPC1.bitmapData;
				else
					bmpNPC.bitmapData = bmpNPC0.bitmapData;
			}
			
		}
		
	}

}