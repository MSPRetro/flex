package com.moviestarplanet.Components.ViewComponent
{
	import mx.containers.Canvas;

	public class ViewComponentCanvas extends Canvas implements IViewComponent
	{
		public function ViewComponentCanvas()
		{
			super();
         	horizontalScrollPolicy = "off";
         	verticalScrollPolicy = "off";
		}
		
		public function Enter():void
		{
		}
		
		public function RequestExit(callback:Function):void
		{
			callback(true);
		}
		
		public function Exit():void
		{
		}
		
	}
}