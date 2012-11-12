package  
{
	import engine.AudioClip;
	import engine.SoundManager
	
	/**
	 * ...
	 * @author Ernest Roberts
	 */
	public class Resource 
	{
		[Embed(source = "../lib/imgBkg.jpg")]			static public var imgBkg:Class;
		
		[Embed(source = "../lib/imgCocktail0.png")]		static public var imgCocktail0:Class;
		[Embed(source = "../lib/imgCocktail1.png")]		static public var imgCocktail1:Class;
		
		[Embed(source = "../lib/imgGrnCheck.png")]		static public var imgGrnCheck:Class;
		[Embed(source = "../lib/imgRedX.png")]			static public var imgRedX:Class;
		
		[Embed(source = "../lib/imgPlayer0.png")]		static public var imgPlayer0:Class;
		[Embed(source = "../lib/imgPlayer1.png")]		static public var imgPlayer1:Class;
		
		[Embed(source = "../lib/imgNPC0.png")]			static public var imgNPC0:Class;
		[Embed(source = "../lib/imgNPC1.png")]			static public var imgNPC1:Class;
		
		[Embed(source = "../lib/Chunkfive.otf",
			fontName = "MainFont",
			mimeType = "application/x-font",
			advancedAntiAliasing = "true",
			embedAsCFF="false")]
		static public var MainFont :Class;
		
		[Embed(source = "../lib/sndIntro.mp3")]			static public var sndIntro:Class;
		
		[Embed(source="../lib/sndCrowd.mp3")]			static public var sndCrowd:Class;
		[Embed(source = "../lib/sndTalking.mp3")]		static public var sndTalking:Class;
		
		[Embed(source = "../lib/sndGood.mp3")]			static public var sndGood:Class;
		[Embed(source = "../lib/sndBad.mp3")]			static public var sndBad:Class;
		
		[Embed(source = "../lib/sndSad.mp3")]			static public var sndSad:Class;
		[Embed(source="../lib/sndCheer.mp3")]			static public var sndCheer:Class;
		
		static public function init():void 
		{
			SoundManager.add( new AudioClip( sndIntro, true)  );
			SoundManager.add( new AudioClip( sndCrowd, true)  );
			SoundManager.add( new AudioClip( sndTalking, true)  );
			
			SoundManager.add( new AudioClip( sndGood, 	false)  );
			SoundManager.add( new AudioClip( sndBad, 	false)	);
			SoundManager.add( new AudioClip( sndSad, 	false)	);
			SoundManager.add( new AudioClip( sndCheer, 	false)	);
		}
		
	}

}