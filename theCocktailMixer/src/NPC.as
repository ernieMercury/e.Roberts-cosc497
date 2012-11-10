package  
{
	import flash.display.Sprite;
	import flash.display.Graphics;
	
	/**
	 * ...
	 * @author Ernest Roberts
	 */
	public class NPC extends Sprite
	{
		
		public function NPC() 
		{
			var g:Graphics = this.graphics;	
			g.beginFill( 0xffaaaa);
			g.drawRect(0, 0, 64, 175);
			g.endFill();
			
			x = 450;
			y = 225;
		}
		
	}

}