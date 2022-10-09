package com.moviestarplanet.Components
{
   import flash.display.Graphics;
   import flash.geom.Matrix;
   import mx.containers.Canvas;
   import mx.utils.ArrayUtil;
   
   public class GradientCanvas extends Canvas
   {
      
      public static const DEFAULT_CORNERRADIUS:Number = 0;
      
      public static const DEFAULT_OFFSETX:Number = 0;
      
      public static const DEFAULT_OFFSETY:Number = 0;
      
      public static const DEFAULT_BORDERTHICKNESS:Number = 0;
      
      public static const DEFAULT_GRADIENTTYPE:String = "linear";
      
      public static const DEFAULT_FILLCOLORS:String = "0xFFFFFF";
      
      public static const DEFAULT_INTERPOLATIONMETHOD:String = "rgb";
      
      public static const DEFAULT_COLORSCONFIGURATION:Number = 1;
      
      public static const DEFAULT_BOTTOMLEFTRADIUS:Number = 0;
      
      public static const DEFAULT_ANGLE:Number = 0;
      
      public static const DEFAULT_GRADIENTRATIO:Number = 255;
      
      public static const DEFAULT_TOPRIGHTRADIUS:Number = 0;
      
      public static const DEFAULT_BOTTOMRIGHTRADIUS:Number = 0;
      
      public static const DEFAULT_TOPLEFTRADIUS:Number = 0;
      
      public static const DEFAULT_FOCALPOINTRATIO:Number = 0;
      
      public static const DEFAULT_SPREADMETHOD:String = "pad";
      
      public static const DEFAULT_FILLALPHAS:Number = 1;
       
      
      private var _boffsetx:Number;
      
      private var _boffsety:Number;
      
      private var _offsetx:Array;
      
      private var _offsety:Array;
      
      private var _colorsconfig:Array;
      
      private var _spreadMethod:String;
      
      private var _bspreadMethod:String;
      
      private var _bottomRightRadius:Number;
      
      private var _topLeftRadius:Number;
      
      private var _ngradients:Number;
      
      private var _bgradientRatio:Array;
      
      private var _gradientRatio:Array;
      
      private var _bangle:Number;
      
      private var _angle:Array;
      
      private var _fillAlphas:Array;
      
      private var _topRightRadius:Number;
      
      private var _bfillAlphas:Array;
      
      private var _bfocalPointRatio:Number;
      
      private var _focalPointRatio:Array;
      
      private var _binterpolationMethod:String;
      
      private var _bottomLeftRadius:Number;
      
      private var _interpolationMethod:String;
      
      private var _gradientType:String;
      
      private var _bgradientType:String;
      
      private var _borderThickness:Number;
      
      private var bStylePropChanged:Boolean = true;
      
      private var _fillColors:Array;
      
      private var _bfillColors:Array;
      
      public function GradientCanvas()
      {
         _colorsconfig = new Array(1);
         _ngradients = _colorsconfig.length;
         super();
      }
      
      private function getAllStyles() : void
      {
         var _loc1_:Array = null;
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Array = null;
         if(getStyle("gradientType") != undefined)
         {
            _gradientType = getStyle("gradientType");
         }
         else
         {
            _gradientType = DEFAULT_GRADIENTTYPE;
         }
         if(getStyle("bordergradientType") != undefined)
         {
            _bgradientType = getStyle("bordergradientType");
         }
         else
         {
            _bgradientType = DEFAULT_GRADIENTTYPE;
         }
         if(getStyle("colorsConfiguration") != undefined)
         {
            _colorsconfig = ArrayUtil.toArray(getStyle("colorsConfiguration"));
         }
         else
         {
            _ngradients = _colorsconfig.length;
         }
         if(getStyle("fillColors") != undefined)
         {
            _fillColors = new Array();
            _loc1_ = new Array();
            _loc1_ = getStyle("fillColors").toString().split(",");
            _loc2_ = 0;
            while(_loc2_ < _colorsconfig.length)
            {
               _fillColors.push(_loc1_.slice(0,_colorsconfig[_loc2_]));
               _loc1_ = _loc1_.slice(_colorsconfig[_loc2_]);
               _loc2_++;
            }
         }
         else
         {
            _fillColors = new Array(DEFAULT_FILLCOLORS);
         }
         if(getStyle("borderColors") != undefined)
         {
            _bfillColors = getStyle("borderColors");
         }
         else
         {
            _bfillColors = new Array(DEFAULT_FILLCOLORS);
         }
         if(getStyle("borderThickness") != undefined)
         {
            _borderThickness = getStyle("borderThickness");
         }
         else
         {
            _borderThickness = DEFAULT_BORDERTHICKNESS;
         }
         if(getStyle("fillAlphas") != undefined)
         {
            _fillAlphas = new Array();
            _loc1_ = new Array();
            _loc1_ = getStyle("fillAlphas").toString().split(",");
            _loc2_ = 0;
            while(_loc2_ < _colorsconfig.length)
            {
               _fillAlphas.push(_loc1_.slice(0,_colorsconfig[_loc2_]));
               _loc1_ = _loc1_.slice(_colorsconfig[_loc2_]);
               _loc2_++;
            }
         }
         else
         {
            _fillAlphas = new Array();
            _loc2_ = 0;
            while(_loc2_ < _colorsconfig.length)
            {
               _loc1_ = new Array();
               _loc3_ = 0;
               while(_loc3_ < _colorsconfig[_loc2_])
               {
                  _loc1_.push(DEFAULT_FILLALPHAS);
                  _loc3_++;
               }
               _fillAlphas.push(_loc1_);
               _loc2_++;
            }
         }
         if(getStyle("borderAlphas") != undefined)
         {
            _bfillAlphas = getStyle("borderAlphas");
         }
         else
         {
            _bfillAlphas = new Array();
            _loc2_ = 0;
            while(_loc2_ < _bfillColors.length)
            {
               _bfillAlphas.push(DEFAULT_FILLALPHAS);
               _loc2_++;
            }
         }
         if(getStyle("gradientRatio") != undefined)
         {
            _gradientRatio = getStyle("gradientRatio");
            _loc1_ = new Array();
            _loc1_ = getStyle("gradientRatio").toString().split(",");
            _loc4_ = new Array();
            _loc2_ = 0;
            while(_loc2_ < _colorsconfig.length)
            {
               _loc4_.push(_loc1_.slice(0,_colorsconfig[_loc2_]));
               _loc1_ = _loc1_.slice(_colorsconfig[_loc2_]);
               _loc2_++;
            }
            _gradientRatio = _loc4_;
         }
         else
         {
            _gradientRatio = new Array();
            _loc2_ = 0;
            while(_loc2_ < _colorsconfig.length)
            {
               _gradientRatio.push(generateDefaultRatio(_colorsconfig[_loc2_]));
               _loc2_++;
            }
         }
         if(getStyle("bordergradientRatio") != undefined)
         {
            _bgradientRatio = getStyle("bordergradientRatio");
         }
         else
         {
            _bgradientRatio = new Array();
            _loc2_ = 0;
            while(_loc2_ < _bfillColors.length)
            {
               _bgradientRatio = generateDefaultRatio(_bfillColors.length);
               _loc2_++;
            }
         }
         if(getStyle("angle") != undefined)
         {
            _loc1_ = new Array();
            _loc1_.push(getStyle("angle"));
            _angle = _loc1_[0].toString().split(",");
         }
         else
         {
            _angle = new Array();
            _loc2_ = 0;
            while(_loc2_ < _colorsconfig.length)
            {
               _angle.push(DEFAULT_ANGLE);
               _loc2_++;
            }
         }
         if(getStyle("borderAngle") != undefined)
         {
            _bangle = getStyle("borderAngle");
         }
         else
         {
            _bangle = DEFAULT_ANGLE;
         }
         if(getStyle("spreadMethod") != undefined)
         {
            _spreadMethod = getStyle("spreadMethod");
         }
         else
         {
            _spreadMethod = DEFAULT_SPREADMETHOD;
         }
         if(getStyle("borderSpreadMethod") != undefined)
         {
            _bspreadMethod = getStyle("borderSpreadMethod");
         }
         else
         {
            _bspreadMethod = DEFAULT_SPREADMETHOD;
         }
         if(getStyle("interpolationMethod") != undefined)
         {
            _interpolationMethod = getStyle("interpolationMethod");
         }
         else
         {
            _interpolationMethod = DEFAULT_INTERPOLATIONMETHOD;
         }
         if(getStyle("borderInterpolationMethod") != undefined)
         {
            _binterpolationMethod = getStyle("borderInterpolationMethod");
         }
         else
         {
            _binterpolationMethod = DEFAULT_INTERPOLATIONMETHOD;
         }
         if(getStyle("focalPointRatio") != undefined)
         {
            _focalPointRatio = new Array();
            _loc1_ = new Array();
            _loc1_.push(getStyle("focalPointRatio"));
            _focalPointRatio = _loc1_[0].toString().split(",");
         }
         else
         {
            _focalPointRatio = new Array();
            _loc2_ = 0;
            while(_loc2_ < _colorsconfig.length)
            {
               _focalPointRatio.push(DEFAULT_FOCALPOINTRATIO);
               _loc2_++;
            }
         }
         if(getStyle("borderfocalPointRatio") != undefined)
         {
            _bfocalPointRatio = getStyle("borderfocalPointRatio");
         }
         else
         {
            _bfocalPointRatio = DEFAULT_FOCALPOINTRATIO;
         }
         if(getStyle("offsetX") != undefined)
         {
            _loc1_ = new Array();
            _loc1_.push(getStyle("offsetX"));
            _offsetx = _loc1_[0].toString().split(",");
         }
         else
         {
            _offsetx = new Array();
            _loc2_ = 0;
            while(_loc2_ < _colorsconfig.length)
            {
               _offsetx.push(DEFAULT_OFFSETX);
               _loc2_++;
            }
         }
         if(getStyle("borderOffsetX") != undefined)
         {
            _boffsetx = getStyle("borderOffsetX");
         }
         else
         {
            _boffsetx = DEFAULT_OFFSETX;
         }
         if(getStyle("offsetY") != undefined)
         {
            _loc1_ = new Array();
            _loc1_.push(getStyle("offsetY"));
            _offsety = _loc1_[0].toString().split(",");
         }
         else
         {
            _offsety = new Array();
            _loc2_ = 0;
            while(_loc2_ < _colorsconfig.length)
            {
               _offsety.push(DEFAULT_OFFSETY);
               _loc2_++;
            }
         }
         if(getStyle("borderOffsetY") != undefined)
         {
            _boffsety = getStyle("borderOffsetY");
         }
         else
         {
            _boffsety = DEFAULT_OFFSETY;
         }
         if(getStyle("topLeftRadius") != 0 && getStyle("topLeftRadius") != undefined || getStyle("topRightRadius") != 0 && getStyle("topRightRadius") != undefined || getStyle("bottomLeftRadius") != 0 && getStyle("bottomLeftRadius") != undefined || getStyle("bottomRightRadius") != 0 && getStyle("bottomRightRadius") != undefined)
         {
            if(getStyle("topLeftRadius") != undefined)
            {
               _topLeftRadius = getStyle("topLeftRadius");
            }
            else
            {
               _topLeftRadius = DEFAULT_TOPLEFTRADIUS;
            }
            if(getStyle("topRightRadius") != undefined)
            {
               _topRightRadius = getStyle("topRightRadius");
            }
            else
            {
               _topRightRadius = DEFAULT_TOPRIGHTRADIUS;
            }
            if(getStyle("bottomLeftRadius") != undefined)
            {
               _bottomLeftRadius = getStyle("bottomLeftRadius");
            }
            else
            {
               _bottomLeftRadius = DEFAULT_BOTTOMLEFTRADIUS;
            }
            if(getStyle("bottomRightRadius") != undefined)
            {
               _bottomRightRadius = getStyle("bottomRightRadius");
            }
            else
            {
               _bottomRightRadius = DEFAULT_BOTTOMRIGHTRADIUS;
            }
         }
         else
         {
            _topLeftRadius = getStyle("cornerRadius");
            _topRightRadius = getStyle("cornerRadius");
            _bottomLeftRadius = getStyle("cornerRadius");
            _bottomRightRadius = getStyle("cornerRadius");
         }
      }
      
      override public function styleChanged(param1:String) : void
      {
         super.styleChanged(param1);
         if(param1 == "fillColors" || param1 == "fillAlphas" || param1 == "cornerRadius" || param1 == "angle" || param1 == "spreadMethod" || param1 == "gradientType" || param1 == "gradientRatio" || param1 == "offsetX" || param1 == "offsetY" || param1 == "interpolationMethod" || param1 == "topLeftRadius" || param1 == "topRightRadius" || param1 == "bottomLeftRadius" || param1 == "bottomRightRadius" || param1 == "focalPointRatio" || param1 == "gradientType" || param1 == "borderColors" || param1 == "borderAlphas" || param1 == "bordergradientRatio" || param1 == "borderThickness" || param1 == "borderOffsetX" || param1 == "borderOffsetY" || param1 == "borderfocalPointRatio" || param1 == "borderSpreadMethod" || param1 == "borderInterpolationMethod" || param1 == "borderAngle" || param1 == "colorsConfiguration")
         {
            bStylePropChanged = true;
            invalidateDisplayList();
            return;
         }
      }
      
      private function drawRect(param1:Number, param2:Number, param3:Number, param4:Number, param5:Object = null, param6:Object = null, param7:Object = null, param8:Object = null, param9:String = null, param10:Array = null, param11:String = null, param12:String = null, param13:Number = 0, param14:Object = null) : void
      {
         if(!param3 || !param4)
         {
            return;
         }
         var _loc15_:Graphics;
         (_loc15_ = graphics).beginGradientFill(param9,param6 as Array,param7 as Array,param10,param8 as Matrix,param11,param12,param13);
         _loc15_.drawRoundRectComplex(param1,param2,param3,param4,param5.tl,param5.tr,param5.bl,param5.br);
         if(param14)
         {
            _loc15_.drawRoundRectComplex(param14.x,param14.y,param14.w,param14.h,param5.tl,param5.tr,param5.bl,param5.br);
         }
         _loc15_.endFill();
      }
      
      public function set colorsConfiguration(param1:Array) : void
      {
         _colorsconfig = param1;
         invalidateDisplayList();
      }
      
      private function generateDefaultRatio(param1:Number) : Array
      {
         var _loc5_:Number = NaN;
         var _loc2_:Number = 255 / (param1 - 1);
         var _loc3_:Array = new Array();
         var _loc4_:Number = 0;
         while(_loc4_ < param1)
         {
            _loc5_ = 255 - _loc2_ * _loc4_;
            _loc3_.push(_loc5_);
            _loc3_.sort(Array.NUMERIC);
            _loc4_++;
         }
         return _loc3_;
      }
      
      public function get colorsConfiguration() : Array
      {
         return _colorsconfig;
      }
      
      public function get numberGradients() : Number
      {
         return _colorsconfig.length;
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         var _loc3_:Graphics = null;
         var _loc4_:Object = null;
         var _loc5_:Number = NaN;
         var _loc6_:Matrix = null;
         var _loc7_:Matrix = null;
         var _loc8_:Object = null;
         super.updateDisplayList(param1,param2);
         if(bStylePropChanged == true)
         {
            getAllStyles();
            _loc3_ = graphics;
            _loc3_.clear();
            _loc4_ = {
               "tl":_topLeftRadius,
               "tr":_topRightRadius,
               "bl":_bottomLeftRadius,
               "br":_bottomRightRadius
            };
            _loc5_ = 0;
            while(_loc5_ < _colorsconfig.length)
            {
               (_loc6_ = new Matrix()).createGradientBox(param1,param2,Math.PI * _angle[_loc5_] / 180,_offsetx[_loc5_],_offsety[_loc5_]);
               drawRect(0,0,param1,param2,_loc4_,_fillColors[_loc5_],_fillAlphas[_loc5_],_loc6_,_gradientType.split(",")[_loc5_],_gradientRatio[_loc5_],_spreadMethod.split(",")[_loc5_],_interpolationMethod.split(",")[_loc5_],_focalPointRatio[_loc5_]);
               _loc5_++;
            }
            if(_borderThickness > 0)
            {
               (_loc7_ = new Matrix()).createGradientBox(param1 + 2 * _borderThickness,param2 + 2 * _borderThickness,Math.PI * _bangle / 180,_boffsetx,_boffsety);
               (_loc8_ = new Object()).x = 0;
               _loc8_.y = 0;
               _loc8_.w = param1;
               _loc8_.h = param2;
               drawRect(-_borderThickness,-_borderThickness,param1 + 2 * _borderThickness,param2 + 2 * _borderThickness,_loc4_,_bfillColors,_bfillAlphas,_loc7_,_bgradientType,_bgradientRatio,_bspreadMethod,_binterpolationMethod,_bfocalPointRatio,_loc8_);
            }
         }
      }
   }
}