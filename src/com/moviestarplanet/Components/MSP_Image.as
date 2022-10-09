package com.moviestarplanet.Components
{
   import flash.events.MouseEvent;
   import mx.controls.Image;
   
   public class MSP_Image extends Image
   {
       
      
      public function MSP_Image()
      {
         super();
         addEventListener(MouseEvent.CLICK,clickHandler);
      }
      
      protected function clickHandler(param1:MouseEvent) : void
      {
         if(!enabled)
         {
            param1.stopImmediatePropagation();
         }
      }
   }
}
