package com.moviestarplanet.Components
{
   import flash.events.MouseEvent;
   import mx.controls.Button;
   import mx.events.FlexEvent;
   import mx.styles.CSSStyleDeclaration;
   
   public class AdminButton extends Button
   {
       
      
      private var _disableClick:Boolean;
      
      public function AdminButton()
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
            this.fillColors = [9276813,3815223,11842483,9341321];
            this.color = 16777215;
            this.borderColor = 16777215;
            this.themeColor = 16777215;
            this.cornerRadius = 4;
            this.paddingLeft = 0;
            this.paddingRight = 0;
            this.fontWeight = "normal";
         };
         this.width = 44;
         this.height = 16;
         this.label = "ADMIN";
         this.addEventListener("click",___AdminButton_Button1_click);
         this.addEventListener("creationComplete",___AdminButton_Button1_creationComplete);
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
      
      public function ___AdminButton_Button1_creationComplete(param1:FlexEvent) : void
      {
         onCreationComplete();
      }
      
      private function onCreationComplete() : void
      {
         updateToolTip();
      }
      
      public function get disableClick() : Boolean
      {
         return _disableClick;
      }
      
      private function onClick() : void
      {
         Main.showAlert(resourceManager.getString("myResources","ADMIN_DESC"),"MSP");
      }
      
      private function updateToolTip() : void
      {
         if(!initialized)
         {
            return;
         }
         toolTip = resourceManager.getString("myResources","ADMIN_DESC");
      }
      
      public function ___AdminButton_Button1_click(param1:MouseEvent) : void
      {
         onClick();
      }
   }
}
