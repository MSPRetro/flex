package com.moviestarplanet.Components
{
   import flash.events.MouseEvent;
   import mx.controls.Button;
   import mx.events.FlexEvent;
   import mx.styles.CSSStyleDeclaration;
   
   public class VipButton extends Button
   {
       
      
      private var _disableClick:Boolean;
      
      public function VipButton()
      {
         super();
         if(!this.styleDeclaration)
         {
            this.styleDeclaration = new CSSStyleDeclaration();
         }
         this.styleDeclaration.defaultFactory = function():void
         {
            this.fontSize = 12;
            this.fillAlphas = [1,1,1,1];
            this.fillColors = [16777215,16770048,16777215,16770048];
            this.color = 0;
            this.borderColor = 16777215;
            this.themeColor = 16777215;
            this.cornerRadius = 4;
            this.paddingLeft = 0;
            this.paddingRight = 0;
            this.fontWeight = "normal";
         };
         this.width = 28;
         this.height = 16;
         this.label = "VIP";
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
         if(disableClick == false)
         {
            //Main.Instance.ShowBuyVIP();
         }
      }
      
      private function updateToolTip() : void
      {
         if(!initialized)
         {
            return;
         }
         if(disableClick)
         {
            toolTip = "Is Vip member";
         }
         else if(Main.Instance)
         {
            toolTip = false ? resourceManager.getString("myResources","YOU_VIP") : resourceManager.getString("myResources","YOU_NOT_VIP");
         }
      }
   }
}
