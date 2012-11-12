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
		
		public function setOptions(good:Array, bad:Array, rsp:Array):void {
			
			var rand:int = Math.floor(Math.random() * good.length);
			var rnd:int = Math.floor(Math.random() * rsp.length);
			var previousR:int = -1;
			
			var op:Option = new Option();
			var tmpOptions :Vector.<Option> = new Vector.<Option>(3);
			
			//Set Good Option
			op.text = good[rand];
			op.isGood = true;
			
			//Set Response
			op.stRsp = rsp[rnd];
			
			tmpOptions[0] = op;
			
			//Set 2 Bad Options
			for (var i:int = 2; i > 0; i--) {
				
				var r:int = Math.floor(Math.random() * bad.length);
				
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
			
			//Randomize final option vector
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