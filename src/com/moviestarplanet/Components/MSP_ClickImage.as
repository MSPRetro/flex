package com.moviestarplanet.Components
{
   import flash.events.MouseEvent;
   import flash.filters.BitmapFilter;
   import mx.effects.Glow;
   import mx.events.EffectEvent;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   
   public class MSP_ClickImage extends MSP_Image
   {
       
      
      private var isInRollOver:Boolean;
      
      private var restorefiltersNotCopied:Boolean = true;
      
      private var originalAlpha:Number = -1;
      
      private var restorefilters:Array = null;
      
      private var isFirstRollOver:Boolean = true;
      
      private var _207684226glowEffect:Glow;
      
      public function MSP_ClickImage()
      {
         super();
         this.buttonMode = true;
         _MSP_ClickImage_Glow1_i();
         this.addEventListener("rollOver",___MSP_ClickImage_MSP_Image1_rollOver);
         this.addEventListener("rollOut",___MSP_ClickImage_MSP_Image1_rollOut);
         this.addEventListener("creationComplete",___MSP_ClickImage_MSP_Image1_creationComplete);
      }
      
      override public function set enabled(param1:Boolean) : void
      {
         if(param1 != enabled)
         {
            mouseEnabled = param1;
            super.enabled = param1;
            SetEnabledState();
         }
      }
      
      public function set glowEffect(param1:Glow) : void
      {
         var _loc2_:Object = this._207684226glowEffect;
         if(_loc2_ !== param1)
         {
            this._207684226glowEffect = param1;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"glowEffect",_loc2_,param1));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get glowEffect() : Glow
      {
         return this._207684226glowEffect;
      }
      
      private function onCreationComplete() : void
      {
         originalAlpha = alpha;
         SetEnabledState();
         mouseEnabled = enabled;
         cacheAsBitmap = true;
      }
      
      private function effectEnd() : void
      {
         if(!isInRollOver)
         {
            filters = CloneFilters(restorefilters);
         }
      }
      
      public function ___MSP_ClickImage_MSP_Image1_rollOut(param1:MouseEvent) : void
      {
         onRollOut(param1);
      }
      
      override public function initialize() : void
      {
         super.initialize();
      }
      
      public function __glowEffect_effectEnd(param1:EffectEvent) : void
      {
         effectEnd();
      }
      
      private function onRollOver() : void
      {
         if(enabled)
         {
            if(isFirstRollOver)
            {
               restorefilters = CloneFilters(filters);
               isFirstRollOver = false;
            }
            glowEffect.play([this]);
            isInRollOver = true;
         }
      }
      
      private function SetEnabledState() : void
      {
         if(initialized)
         {
            if(enabled && originalAlpha != -1)
            {
               alpha = originalAlpha;
            }
            else
            {
               originalAlpha = alpha;
               alpha *= 0.35;
            }
         }
      }
      
      public function ___MSP_ClickImage_MSP_Image1_rollOver(param1:MouseEvent) : void
      {
         onRollOver();
      }
      
      private function _MSP_ClickImage_Glow1_i() : Glow
      {
         var _loc1_:Glow = new Glow();
         glowEffect = _loc1_;
         _loc1_.alphaFrom = 0;
         _loc1_.alphaTo = 1;
         _loc1_.blurXTo = 8;
         _loc1_.blurYTo = 8;
         _loc1_.color = 16777215;
         _loc1_.duration = 1;
         _loc1_.addEventListener("effectEnd",__glowEffect_effectEnd);
         return _loc1_;
      }
      
      private function onRollOut(param1:MouseEvent) : void
      {
         if(isInRollOver)
         {
            glowEffect.play([this],true);
            isInRollOver = false;
         }
      }
      
      public function ___MSP_ClickImage_MSP_Image1_creationComplete(param1:FlexEvent) : void
      {
         onCreationComplete();
      }
      
      private function CloneFilters(param1:Array) : Array
      {
         var _loc2_:Array = new Array(param1.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            _loc2_[_loc3_] = BitmapFilter(param1[_loc3_]).clone();
            _loc3_++;
         }
         return _loc2_;
      }
   }
}
