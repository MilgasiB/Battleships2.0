package  
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author Benjamin
	 */
	public class Tiles extends Sprite
	{
		private static const BOX_SIDE:int = 32;
		
		public static const WATER:int = 1;
		public static const MISS:int = 2;
		public static const HIT:int = 3;
		
		public var isBoat:Boolean = false;
		
		public function Tiles(type:int) 
		{
			switch (type) 
			{
				case WATER:
					this.graphics.beginFill(0x0080FF);
					this.graphics.drawRect(0, 0, BOX_SIDE, BOX_SIDE);
					this.graphics.endFill();
				break;
				case MISS:
					this.graphics.beginFill(0xFFFF80);
					this.graphics.drawRect(0, 0, BOX_SIDE, BOX_SIDE);
					this.graphics.endFill();
				break;
				case HIT:
					this.graphics.beginFill(0xFF0000);
					this.graphics.drawRect(0, 0, BOX_SIDE, BOX_SIDE);
					this.graphics.endFill();
				break;
				default:
			}	
		}
		
		public function clicked():void
		{
			var tileType:int = 0; 
			
			this.graphics.clear();
			
			if (isBoat)
			{	
				tileType = Tiles.HIT;
				var h:Tiles = new Tiles(tileType);
				addChild(h);
				
			}
			else 
			{
				tileType = Tiles.MISS;
				var p:Tiles = new Tiles(tileType);
				addChild(p);
			}
		}	
	}
}