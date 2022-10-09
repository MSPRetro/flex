package com.moviestarplanet.Components.ViewComponent
{
	public interface IViewComponent
	{
		function Enter() : void;
      
    	function RequestExit(callback:Function) : void;
      
    	function Exit() : void;
	}
}