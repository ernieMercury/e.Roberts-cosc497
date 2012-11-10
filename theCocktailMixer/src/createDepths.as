package  
{
	/**
	 * ...
	 * @author Ernest Roberts
	 */
	
		public function createDepths():Vector.<Depth>
		{
			var vDepths:Vector.<Depth> = new Vector.<Depth>;
			
			var depthID:int = 0;
			
			for (var i:int = 0; i < Global.MAX_DEPTHS; i++) {
				
				/*if (i == 7)
					depthID = -3;*/
				//////////////////////////////////	
				var tmpDepth:Depth = new Depth();
				tmpDepth.depthID = depthID;
					
				vDepths.push(tmpDepth);
					
				/////////////////////////////////	
				depthID++;
				
			}
			
			return vDepths;
		}
		

}