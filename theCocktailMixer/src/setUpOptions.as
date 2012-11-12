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
						Global.vGameDepths[i].setOptions(tStrings.gGreet, tStrings.bGreet, tStrings.rsp0);
						break;
					case 1:
						Global.vGameDepths[i].setOptions(tStrings.gD1, tStrings.bD1, tStrings.rsp1);
						break;
					case 2:
						Global.vGameDepths[i].setOptions(tStrings.gD2, tStrings.bD2, tStrings.rsp2);
						break;
					case 3:
						Global.vGameDepths[i].setOptions(tStrings.gD3, tStrings.bD3, tStrings.rsp3);
						break;
					case 4:
						Global.vGameDepths[i].setOptions(tStrings.gD4, tStrings.bD4, tStrings.rsp4);
						break;
					case 5:
						Global.vGameDepths[i].setOptions(tStrings.gD5, tStrings.bD5, tStrings.rsp5);
						break;	
					case 6:
						Global.vGameDepths[i].setOptions(tStrings.gD6, tStrings.bD6, tStrings.rsp6);
						break;
					case 7:
						Global.vGameDepths[i].setOptions(tStrings.gReDo, tStrings.bReDo, tStrings.rsp7);
						break;
					case 8:
						Global.vGameDepths[i].setOptions(tStrings.gReDo1, tStrings.bReDo1, tStrings.rsp7);
						break;
					case 9:
						Global.vGameDepths[i].setOptions(tStrings.gReDo2, tStrings.bReDo2, tStrings.rsp7);
						break;						
					default:
						break;
				}
			}
		}
}