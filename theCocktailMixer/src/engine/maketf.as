package engine
{
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	

	/// Helper function that makes a textfield for a consisent style throughout program.
	public function maketf( size:int = 64, rgbColor:uint = 0xffffff, stFont:String = "Arial" ):TextField
	{
		var tf:TextField = new TextField();			
		tf.defaultTextFormat 		= new TextFormat(stFont, size, rgbColor, true );
		tf.defaultTextFormat.align 	= TextFormatAlign.CENTER;
		
		if(stFont == "Arial")
			tf.embedFonts   = false;
		else
			tf.embedFonts   = true;
			
		tf.autoSize 	= TextFieldAutoSize.CENTER;
		tf.y 			= size * 0.5;
		tf.mouseEnabled = false;
		
		return tf;
	}
}