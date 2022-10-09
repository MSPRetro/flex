package com.moviestarplanet.Components.ViewComponent
{
	import mx.containers.ViewStack;

	public class ViewComponentViewStack extends ViewStack
	{
		public var CloseMainPopupWhenChanging:Boolean = true;
      
		public function ViewComponentViewStack()
		{
		   super();
		   horizontalScrollPolicy = "off";
		   verticalScrollPolicy = "off";
		}	
			
	}
}