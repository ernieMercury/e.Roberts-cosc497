package  
{
	import flash.display.Bitmap;
	/**
	 * ...
	 * @author Ernest Roberts
	 */
	public class Alert 
	{
		
		public var bmpAlert:Bitmap = new Bitmap();
		public var bmpX:Bitmap = new Resource.imgRedX();		
		public var bmpCheck:Bitmap = new Resource.imgGrnCheck();
		
		public var speed:Number = 0;
		
		public var isRight:Boolean = false;
		
		public function Alert() 
		{
			bmpAlert.bitmapData = bmpX.bitmapData;
			bmpAlert.visible = false;
			
			

			
			bmpAlert.x = 550;
			bmpAlert.y = 200;

		}
		
		public function update():void {
			
			if (isRight)
				bmpAlert.bitmapData = bmpCheck.bitmapData;
			else
				bmpAlert.bitmapData = bmpX.bitmapData;
				
			bmpAlert.y -= speed;
			
			if (bmpAlert.y < 180) {
				bmpAlert.visible = false
				bmpAlert.y = 200;
				speed = 0;
			}
			
		}
		
	}

}