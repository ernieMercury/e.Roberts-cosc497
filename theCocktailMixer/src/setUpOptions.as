package  
{
	/**
	 * ...
	 * @author Ernest Roberts
	 */

		public function setUpOptions():void 
		{
			for (var i:int = 0; i < Global.MAX_DEPTHS; i++) {
				switch(Global.vGameDepths[i].depthID) {
					case 0:
						Global.vGameDepths[i].setOptions(tStrings.gGreet, tStrings.bGreet);
						break;
					case 1:
						Global.vGameDepths[i].setOptions(tStrings.gD1, tStrings.bD1);
						break;
					case 2:
						Global.vGameDepths[i].setOptions(tStrings.gD2, tStrings.bD2);
						break;
					case 3:
						Global.vGameDepths[i].setOptions(tStrings.gD3, tStrings.bD3);
						break;
					case 4:
						Global.vGameDepths[i].setOptions(tStrings.gD4, tStrings.bD4);
						break;
					case 5:
						Global.vGameDepths[i].setOptions(tStrings.gD5, tStrings.bD5);
						break;	
					case 6:
						Global.vGameDepths[i].setOptions(tStrings.gD6, tStrings.bD6);
						break;
					case -1:
						Global.vGameDepths[i].setOptions(tStrings.gReDo, tStrings.bReDo);
						break;
					case -2:
						Global.vGameDepths[i].setOptions(tStrings.gReDo, tStrings.bReDo);
						break;
					case -3:
						Global.vGameDepths[i].setOptions(tStrings.gReDo, tStrings.bReDo);
						break;						
					default:
						break;
				}
			}
		}
}