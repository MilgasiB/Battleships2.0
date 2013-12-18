package 
{
	import flash.desktop.ClipboardTransferMode;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.external.ExternalInterface;
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author Benjamin
	 */
	public class Main extends Sprite 
	{
		private var map:Vector.<Vector.<Sprite>> = new Vector.<Vector.<Sprite>>();
		
		private var scoreBoard:TextField = new TextField();
		
		private const BOX_SIDE:int = 32;
		
		
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			scoreBoard.selectable = false;
			scoreBoard.x = 0;
			scoreBoard.width = 100;
			scoreBoard.text = " Score: 0";
			scoreBoard.addEventListener(Event.ENTER_FRAME,scoreUpdate)
			
			addChild(scoreBoard);
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, spacePressed);
			
			//stage.addEventListener(KeyboardEvent.KEY_DOWN, newGame)
		}
		
		public function spacePressed(key:KeyboardEvent):void 
		{
			clearMapVector();
			makeTileMap();
			spawnBoats();
			
		}
		
		public function makeTileMap():void 
		{
			for (var i:int = 0; i < 10; i++) 
			{
				var enRad:Vector.<Sprite> = new Vector.<Sprite>();
				for (var j:int = 0; j < 10; j++) 
				{
					var t:Tiles = new Tiles(1);
					t.x = 100 + j * (t.width + 1);
					t.y = 100 + i * (t.height + 1);
					this.addChild(t);
					enRad.push(t);
					t.addEventListener(MouseEvent.CLICK, clickTile)
					
				}
				map.push(enRad);
			}
		}
		public function clearMapVector():void
		{
			for each (var row:Vector.<Tiles> in map)
			{
				while (row.length > 0)
				{
					removeChild(row[0]);
					row.splice(0, 1);
				}
			}
			while (map.length > 0)
			{
				map.splice(0, 1);
			}
			
			
		}
		
		public function spawnBoats():void 
		{
			var randX:int = Math.random() * map[0].length;
			var randY:int = Math.random() * map.length;
			
			Tiles(map[randY][randX]).isBoat = true;
		}
		
		private function scoreUpdate(i:int):void
		{
			scoreBoard.text = "Score: "; //+ currentScore;
		}
		private function clickTile(e:MouseEvent):void
		{
			Tiles(e.target).clicked();
			Tiles(e.target).removeEventListener(MouseEvent.CLICK, clickTile);
		}
		/*private function newGame(k:KeyboardEvent):void
		{
			if (k.keyCode == 32)
			{
				
			}
		}*/
		
	
	}
}