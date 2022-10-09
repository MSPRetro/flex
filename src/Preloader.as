package
{
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.ProgressEvent;
   import mx.events.FlexEvent;
   import mx.preloaders.DownloadProgressBar;
   import mx.resources.ResourceManager;
   
   public class Preloader extends DownloadProgressBar
   {
       
      
      public var wcs:MovieClip;
      
      [Embed("assets/WelcomeScreenGraphic.swf")]
      public var WelcomeScreenGraphic:Class;
      
      public function Preloader()
      {
         WelcomeScreenGraphic = Preloader_WelcomeScreenGraphic;
         super();
         wcs = new WelcomeScreenGraphic();
         addChild(wcs);
         wcs.gotoAndStop(0);
      }
      
      private function onFlexInitComplete(param1:FlexEvent) : void
      {
         wcs.gotoAndStop(100);
         dispatchEvent(new Event(Event.COMPLETE));
      }
      
      private function centerPreloader() : void
      {
         x = stageWidth / 2 - wcs.width / 2;
         y = stageHeight / 2 - wcs.height / 2;
      }
      
      private function onFlexInitProgress(param1:FlexEvent) : void
      {
         wcs.gotoAndStop(100);
         trace("initializing...");
         //wcs.amount_txt.text = "Initializing...";
      }
      
      private function onSWFDownloadComplete(param1:Event) : void
      {
         wcs.gotoAndStop(100);
         trace("100%");
         //wcs.amount_txt.text = "100%";
      }
      
      private function onSWFDownloadProgress(param1:ProgressEvent) : void
      {
         var _loc2_:Number = param1.bytesTotal;
         var _loc3_:Number = param1.bytesLoaded;
         var _loc4_:Number = Math.round(_loc3_ / _loc2_ * 19);
         var _loc5_:int = Math.floor(_loc4_ * 5);
         wcs.gotoAndStop(_loc4_);
         trace(String(_loc5_) + "%");
         //wcs.amount_txt.text = String(_loc5_) + "%";
      }
      
      override public function set preloader(param1:Sprite) : void
      {
         param1.addEventListener(ProgressEvent.PROGRESS,onSWFDownloadProgress);
         param1.addEventListener(Event.COMPLETE,onSWFDownloadComplete);
         param1.addEventListener(FlexEvent.INIT_PROGRESS,onFlexInitProgress);
         param1.addEventListener(FlexEvent.INIT_COMPLETE,onFlexInitComplete);
         centerPreloader();
      }
   }
}
