package com.moviestarplanet.Components
{
   import flash.events.MouseEvent;
   import mx.controls.Button;
   import mx.events.FlexEvent;
   import mx.styles.CSSStyleDeclaration;
   
   public class JuryButton extends Button
   {
       
      
      private var _disableClick:Boolean;
      
      public function JuryButton()
      {
         super();
         if(!this.styleDeclaration)
         {
            this.styleDeclaration = new CSSStyleDeclaration();
         }
         this.styleDeclaration.defaultFactory = function():void
         {
            this.fontSize = 11;
            this.fillAlphas = [1,1,1,1];
            this.fillColors = [16777215,14324460,16777215,13197284];
            this.color = 0;
            this.borderColor = 16777215;
            this.themeColor = 16777215;
            this.cornerRadius = 4;
            this.paddingLeft = 0;
            this.paddingRight = 0;
            this.fontWeight = "normal";
         };
         this.width = 36;
         this.height = 16;
         this.label = "JURY";
         this.addEventListener("click", onClick);
         this.addEventListener("creationComplete", onCreationComplete);
      }
      
      override public function initialize() : void
      {
         super.initialize();
      }
      
      public function set disableClick(param1:Boolean) : void
      {
         _disableClick = param1;
         updateToolTip();
      }
      
      private function onCreationComplete(event:Object) : void
      {
         updateToolTip();
      }
      
      public function get disableClick() : Boolean
      {
         return _disableClick;
      }
      
      private function onClick() : void
      {
         Main.showAlert(resourceManager.getString("myResources","JURY_DESC"),resourceManager.getString("myResources","JURY"));
      }
      
      private function updateToolTip() : void
      {
         if(!initialized)
         {
            return;
         }
         toolTip = resourceManager.getString("myResources","JURY_DESC");
      }
   }
}
