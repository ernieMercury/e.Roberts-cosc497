package engine 
{
	import flash.events.MouseEvent;
	import flash.display.Graphics;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.text.TextField;

	public function makeButton( text:String, callback:Function, rgbColor:uint = 0x909090, scale:Number = 1.0, height:int = 50, width:int = 300 ) :Sprite
	{
		var bp:ButtonPure = new ButtonPure( text, callback, width, height, scale, rgbColor );
		return bp;
	}
}