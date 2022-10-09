package com.moviestarplanet.Components
{
   import mx.controls.Button;
   import mx.styles.CSSStyleDeclaration;
   
   public class CloseButton extends Button
   {
       
      
      public function CloseButton()
      {
         super();
         if(!this.styleDeclaration)
         {
            this.styleDeclaration = new CSSStyleDeclaration();
         }
         this.styleDeclaration.defaultFactory = function():void
         {
            this.right = "5";
            this.top = "5";
            this.paddingLeft = 0;
            this.paddingRight = 0;
            this.color = 16777215;
            this.fillAlphas = [1,1];
            this.fillColors = [15974912,12817152,15251968,13279745];
            this.fontFamily = "Verdana";
            this.fontWeight = "bold";
            this.fontSize = 15;
            this.paddingBottom = 3;
            this.paddingTop = 0;
            this.themeColor = 16777215;
            this.textRollOverColor = 16777215;
            this.fontStyle = "normal";
         };
         this.label = "X";
         this.width = 20;
         this.height = 20;
      }
      
      override public function initialize() : void
      {
         super.initialize();
      }
   }
}
