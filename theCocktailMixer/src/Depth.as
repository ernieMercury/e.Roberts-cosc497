package  
{
	import flash.utils.Dictionary;
	import engine.makeButton;	
	/**
	 * ...
	 * @author Ernest Roberts
	 */
	public class Depth 
	{
		/*public static var goodGreetings:Array = ["Hello", "Hey how's it going?", "Hi", "How are you?"];
		
		public static var badGreetings:Array = ["Sup?", "What's happening?", "Yo", "Yo what's sup?"];
		
		public static var rsp0:Array = ["Hi", "Not bad.", "Uh nothing.", "Um hi."];
		
		/*public static var d2:Array = ["Enjoying the party?"];
	
		public static var d3:Array = ["Is this one?"];
		
		public static var d4:Array = ["I think your beautiful."];
		
		public static var d5:Array = ["Your the best looking girl here."];
		
		public static var d6:Array = ["Thanks for the compliment."];
		
		public static var d7:Array = ["Maybe we could go out sometime?"];*/
		
		public var numID:int;
		
		public var Options :Vector.<Option> = new Vector.<Option>(3);
		
		public function Depth() 
		{
			
		}
		
		public function setDepth(depthID:int):void {
			
			var rand:int = Math.floor(Math.random() * 4);
			
			var previousR:int = -1;
			
			var op:Option = new Option();
			
			var tmpOptions :Vector.<Option> = new Vector.<Option>(3);
			
			switch(depthID) {
				case 0:
					
					op.text = Global.goodGreetings[rand];
					op.isGood = true;
			
					tmpOptions[0] = op;
			
					for (var i:int = 2; i > 0; i--) {
				
						var r:int = Math.floor(Math.random() * 4);
				
						if (previousR == r) {
							i++;
							continue;
						}
				
						op = new Option();
				
						op.text = Global.badGreetings[r];
						op.isGood = false;
				
						tmpOptions[i] = op;
				
						previousR = r;
					}
			
					Options = randomizeVector(tmpOptions);
					
					var x:int = 5;
					var y:int = 100;
					
					for (var z:int = 0; z < Options.length; z++) {
				
						Options[z].createButton();
						Options[z].button.x = x;
						Options[z].button.y = y;
						//Display.ui.addChild(Options[z].button);
						y += 30;
						
					}
					
					break;
				default:
					break;
			}
		}
		
		//author Tonypee @ http://mrsteel.wordpress.com/2007/06/15/randomize-array-shuffle-an-array-in-flash/

		public function randomizeVector(vector:Vector.<Option>):Vector.<Option> {
			
			var l:Number = vector.length - 1;
			
			for (var it:int = 0; it < l; it++) {
				
				var r:int = Math.round(Math.random()*l)
				var tmp:* = vector[it]; //Change tmp type
				vector[it] = vector[r];
				vector[r] = tmp;
			}
			return vector;
		}
	}

}