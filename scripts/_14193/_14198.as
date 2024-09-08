package _14193
{
   import _14169._14168;
   import _14169._14170;
   import _14169._14171;
   import _14201._14213;
   import _14223._14222;
   import _14229.SVGEvent;
   import _14231._14232;
   import _14240.StringUtil;
   import _14240._14245;
   import _14240._14246;
   import flash.display.BitmapData;
   import flash.display.CapsStyle;
   import flash.display.GradientType;
   import flash.display.Graphics;
   import flash.display.InterpolationMethod;
   import flash.display.JointStyle;
   import flash.display.LineScaleMode;
   import flash.events.Event;
   import flash.geom.Matrix;
   
   public class _14198 extends _14197
   {
      private var _15269:Boolean = false;
      
      public function _14198(param1:String)
      {
         super(param1);
      }
      
      public function _15272() : void
      {
         if(!this._15269)
         {
            this._15269 = true;
            _2466();
         }
      }
      
      override protected function _2476() : void
      {
         super._2476();
         if(this._15269)
         {
            this.render();
         }
      }
      
      override protected function _15244(param1:String, param2:String, param3:String) : void
      {
         super._15244(param1,param2,param3);
         switch(param1)
         {
            case "stroke":
            case "stroke-opacity":
            case "stroke-width":
            case "stroke-linecap":
            case "stroke-linejoin":
            case "stroke-dasharray":
            case "stroke-dashoffset":
            case "stroke-dashalign":
            case "fill":
            case "marker":
            case "marker-start":
            case "marker-mid":
            case "marker-end":
               this._15272();
         }
      }
      
      protected function render() : void
      {
         this._15269 = false;
      }
      
      protected function get _15280() : Boolean
      {
         var _loc1_:String = _15259._15181("fill");
         return _loc1_ != "" && _loc1_ != "none";
      }
      
      protected function get _15278() : Boolean
      {
         var _loc1_:String = _15259._15181("stroke");
         return _loc1_ != null && _loc1_ != "" && _loc1_ != "none";
      }
      
      protected function get _15274() : Boolean
      {
         var _loc1_:String = _15259._15181("stroke-dasharray");
         return _loc1_ != null && _loc1_ != "none";
      }
      
      protected function _15268(param1:_14222) : void
      {
         var _loc3_:String = null;
         var _loc4_:String = null;
         if(!this._15274)
         {
            return;
         }
         var _loc2_:Array = [];
         for each(_loc3_ in _14232._15273(_15259._15181("stroke-dasharray")))
         {
            _loc2_.push(_15258(_loc3_,_14246.WIDTH_HEIGHT));
         }
         param1._15279 = _loc2_;
         param1._15277 = Number(_15259._15181("stroke-dashoffset") || 0);
         _loc4_ = String(_15259._15181("stroke-dashalign") || "none").toLowerCase();
         param1._15275 = _loc4_ == "corners";
      }
      
      protected function beginFill(param1:Graphics = null, param2:Function = null) : void
      {
         var fill:String = null;
         var fillOpacity:Number = NaN;
         var id:String = null;
         var grad:_14168 = null;
         var pattern:_14213 = null;
         var rgrad:_14171 = null;
         var patternValidated:Function = null;
         var color:uint = 0;
         var g:Graphics = param1;
         var callBack:Function = param2;
         if(this._15280)
         {
            fill = _15259._15181("fill");
            fillOpacity = Number(_15259._15181("fill-opacity") || 1);
            if(fill == null)
            {
               g.beginFill(0,fillOpacity);
            }
            else if(fill.indexOf("url") > -1)
            {
               id = _14246._15251(fill);
               grad = document.getDefinition(id) as _14168;
               if(grad != null)
               {
                  switch(grad.type)
                  {
                     case GradientType.LINEAR:
                        this._15270(grad as _14170,g,true);
                        break;
                     case GradientType.RADIAL:
                        rgrad = grad as _14171;
                        if(rgrad.r == "0")
                        {
                           g.beginFill(grad.colors[grad.colors.length - 1],grad.alphas[grad.alphas.length - 1]);
                        }
                        else
                        {
                           this._15271(rgrad,g,true);
                        }
                  }
                  if(callBack != null)
                  {
                     callBack();
                  }
                  return;
               }
               pattern = document._15206(id) as _14213;
               if(pattern)
               {
                  _15201(pattern);
                  patternValidated = function(param1:Event):void
                  {
                     var _loc3_:Matrix = null;
                     pattern.removeEventListener(SVGEvent.VALIDATED,patternValidated);
                     var _loc2_:BitmapData = pattern._5907();
                     if(_loc2_)
                     {
                        _loc3_ = new Matrix();
                        if(pattern.patternTransform)
                        {
                           _loc3_ = _14232._15220(pattern.patternTransform);
                        }
                        g.beginBitmapFill(_loc2_,_loc3_);
                     }
                     _15200(pattern);
                     if(callBack != null)
                     {
                        callBack();
                     }
                  };
                  pattern.addEventListener(SVGEvent.VALIDATED,patternValidated);
                  pattern.validate();
                  return;
               }
            }
            else
            {
               color = _14245._15276(fill);
               g.beginFill(color,fillOpacity);
            }
         }
         if(callBack != null)
         {
            callBack();
         }
      }
      
      protected function lineStyle(param1:Graphics) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:String = null;
         var _loc5_:String = null;
         var _loc6_:String = null;
         var _loc7_:String = null;
         var _loc8_:_14168 = null;
         var _loc9_:_14171 = null;
         var _loc10_:uint = 0;
         if(this._15278)
         {
            _loc2_ = Number(_15259._15181("stroke-opacity") || 1);
            _loc3_ = 1;
            if(_15259._15181("stroke-width"))
            {
               _loc3_ = _15258(_15259._15181("stroke-width"),_14246.WIDTH_HEIGHT);
            }
            _loc4_ = CapsStyle.NONE;
            if(_15259._15181("stroke-linecap"))
            {
               switch(StringUtil.trim(_15259._15181("stroke-linecap")).toLowerCase())
               {
                  case "round":
                     _loc4_ = CapsStyle.ROUND;
                     break;
                  case "square":
                     _loc4_ = CapsStyle.SQUARE;
               }
            }
            _loc5_ = JointStyle.MITER;
            if(_15259._15181("stroke-linejoin"))
            {
               switch(StringUtil.trim(_15259._15181("stroke-linejoin")).toLowerCase())
               {
                  case "round":
                     _loc5_ = JointStyle.ROUND;
                     break;
                  case "bevel":
                     _loc5_ = JointStyle.BEVEL;
               }
            }
            _loc6_ = _15259._15181("stroke");
            if(_loc6_.indexOf("url") > -1)
            {
               _loc7_ = _14246._15251(_loc6_);
               _loc8_ = document.getDefinition(_loc7_) as _14168;
               if(_loc8_ != null)
               {
                  switch(_loc8_.type)
                  {
                     case GradientType.LINEAR:
                        this._15270(_loc8_ as _14170,param1,false);
                        break;
                     case GradientType.RADIAL:
                        _loc9_ = _loc8_ as _14171;
                        if(_loc9_.r == "0")
                        {
                           param1.lineStyle(_loc3_,_loc8_.colors[_loc8_.colors.length - 1],_loc8_.alphas[_loc8_.alphas.length - 1],true,LineScaleMode.NORMAL,_loc4_,_loc5_);
                        }
                        else
                        {
                           this._15271(_loc9_,param1,false);
                        }
                  }
               }
            }
            else
            {
               _loc10_ = _14245._15276(_loc6_);
               param1.lineStyle(_loc3_,_loc10_,_loc2_,true,LineScaleMode.NORMAL,_loc4_,_loc5_);
            }
         }
         else
         {
            param1.lineStyle();
         }
      }
      
      private function _15270(param1:_14170, param2:Graphics, param3:Boolean = true) : void
      {
         var _loc4_:Number = _15258(param1.x1,_14246.WIDTH);
         var _loc5_:Number = _15258(param1.y1,_14246.HEIGHT);
         var _loc6_:Number = _15258(param1.x2,_14246.WIDTH);
         var _loc7_:Number = _15258(param1.y2,_14246.HEIGHT);
         var _loc8_:Matrix = _14246._15266(_loc4_,_loc5_,_loc6_,_loc7_);
         if(param1.transform)
         {
            _loc8_.concat(param1.transform);
         }
         if(param3)
         {
            param2.beginGradientFill(param1.type,param1.colors,param1.alphas,param1.ratios,_loc8_,param1.spreadMethod,InterpolationMethod.RGB);
         }
         else
         {
            param2.lineGradientStyle(param1.type,param1.colors,param1.alphas,param1.ratios,_loc8_,param1.spreadMethod,InterpolationMethod.RGB);
         }
      }
      
      private function _15271(param1:_14171, param2:Graphics, param3:Boolean = true) : void
      {
         var _loc4_:Number = _15258(param1.cx,_14246.WIDTH);
         var _loc5_:Number = _15258(param1.cy,_14246.HEIGHT);
         var _loc6_:Number = _15258(param1.r,_14246.WIDTH);
         var _loc7_:Number = _15258(param1.fx,_14246.WIDTH);
         var _loc8_:Number = _15258(param1.fy,_14246.HEIGHT);
         var _loc9_:Matrix = _14246._15267(_loc4_,_loc5_,_loc6_,_loc7_,_loc8_);
         if(param1.transform)
         {
            _loc9_.concat(param1.transform);
         }
         var _loc10_:Number = _loc7_ - _loc4_;
         var _loc11_:Number = _loc8_ - _loc5_;
         var _loc12_:Number = Math.sqrt(_loc10_ * _loc10_ + _loc11_ * _loc11_) / _loc6_;
         if(param3)
         {
            param2.beginGradientFill(param1.type,param1.colors,param1.alphas,param1.ratios,_loc9_,param1.spreadMethod,InterpolationMethod.RGB,_loc12_);
         }
         else
         {
            param2.lineGradientStyle(param1.type,param1.colors,param1.alphas,param1.ratios,_loc9_,param1.spreadMethod,InterpolationMethod.RGB,_loc12_);
         }
      }
   }
}

