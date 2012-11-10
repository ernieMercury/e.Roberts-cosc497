package  
{
	import flash.utils.Dictionary;
	import engine.makeButton;	
	
	import engine.Display;
	/**
	 * ...
	 * @author Ernest Roberts
	 */
	public class Depth 
	{	
		public var depthID:int;
		
		public var Options :Vector.<Option> = new Vector.<Option>(3);
		
		public function Depth() 
		{
			
		}
		
		public function setOptions(good:Array, bad:Array):void {
			
			var rand:int = Math.floor(Math.random() * 4);
			var previousR:int = -1;
			
			var op:Option = new Option();
			var tmpOptions :Vector.<Option> = new Vector.<Option>(3);
			
			op.text = good[0];// rand];
			op.isGood = true;
			
			tmpOptions[0] = op;
			
			for (var i:int = 2; i > 0; i--) {
				
				var r:int = Math.floor(Math.random() * 4);
				
				if (previousR == r) {
					i++;
					continue;
				}
				
				op = new Option();
				
				op.text = bad[r];
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
				
				y += 30;
						
			}
		}
	
		public function endDepth():void {
			for (var i:int = 0; i< Options.length; i++){
				Display.ui.removeChild(Options[i].button);
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