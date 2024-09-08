package _1045
{
   import egret.core._1140;
   import flash.display.BitmapData;
   import flash.display.Graphics;
   import flash.display.Shape;
   import flash.filters.DropShadowFilter;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class _1083 extends _1140
   {
      private var _8267:Boolean = false;
      
      private var _7319:Number = 0.4;
      
      private var _8282:Number = 45;
      
      private var _color:int = 0;
      
      private var _8277:Number = 4;
      
      private var _8276:Number = 0;
      
      private var _8275:Number = 0;
      
      private var _8274:Number = 0;
      
      private var _8273:Number = 0;
      
      private var _8283:Number = 4;
      
      private var _8284:Number = 4;
      
      private var shadow:BitmapData;
      
      private var _8271:BitmapData;
      
      private var _8269:BitmapData;
      
      private var _8272:BitmapData;
      
      private var _8268:BitmapData;
      
      public function _1083()
      {
         super();
         mouseEnabled = false;
         mouseChildren = false;
      }
      
      private static function drawRoundRectComplex(param1:Graphics, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number, param9:Number) : void
      {
         var _loc10_:Number = param2 + param4;
         var _loc11_:Number = param3 + param5;
         var _loc12_:Number = param4 < param5 ? param4 * 2 : param5 * 2;
         param6 = param6 < _loc12_ ? param6 : _loc12_;
         param7 = param7 < _loc12_ ? param7 : _loc12_;
         param8 = param8 < _loc12_ ? param8 : _loc12_;
         param9 = param9 < _loc12_ ? param9 : _loc12_;
         var _loc13_:Number = param9 * 0.292893218813453;
         var _loc14_:Number = param9 * 0.585786437626905;
         param1.moveTo(_loc10_,_loc11_ - param9);
         param1.curveTo(_loc10_,_loc11_ - _loc14_,_loc10_ - _loc13_,_loc11_ - _loc13_);
         param1.curveTo(_loc10_ - _loc14_,_loc11_,_loc10_ - param9,_loc11_);
         _loc13_ = param8 * 0.292893218813453;
         _loc14_ = param8 * 0.585786437626905;
         param1.lineTo(param2 + param8,_loc11_);
         param1.curveTo(param2 + _loc14_,_loc11_,param2 + _loc13_,_loc11_ - _loc13_);
         param1.curveTo(param2,_loc11_ - _loc14_,param2,_loc11_ - param8);
         _loc13_ = param6 * 0.292893218813453;
         _loc14_ = param6 * 0.585786437626905;
         param1.lineTo(param2,param3 + param6);
         param1.curveTo(param2,param3 + _loc14_,param2 + _loc13_,param3 + _loc13_);
         param1.curveTo(param2 + _loc14_,param3,param2 + param6,param3);
         _loc13_ = param7 * 0.292893218813453;
         _loc14_ = param7 * 0.585786437626905;
         param1.lineTo(_loc10_ - param7,param3);
         param1.curveTo(_loc10_ - _loc14_,param3,_loc10_ - _loc13_,param3 + _loc13_);
         param1.curveTo(_loc10_,param3 + _loc14_,_loc10_,param3 + param7);
         param1.lineTo(_loc10_,_loc11_ - param9);
      }
      
      override public function get alpha() : Number
      {
         return this._7319;
      }
      
      override public function set alpha(param1:Number) : void
      {
         if(this._7319 == param1)
         {
            return;
         }
         this._7319 = param1;
         this._8267 = true;
         invalidateDisplayList();
      }
      
      public function get angle() : Number
      {
         return this._8282;
      }
      
      public function set angle(param1:Number) : void
      {
         if(this._8282 == param1)
         {
            return;
         }
         this._8282 = param1;
         this._8267 = true;
         invalidateDisplayList();
      }
      
      public function get color() : int
      {
         return this._color;
      }
      
      public function set color(param1:int) : void
      {
         if(this._color == param1)
         {
            return;
         }
         this._color = param1;
         this._8267 = true;
         invalidateDisplayList();
      }
      
      public function get distance() : Number
      {
         return this._8277;
      }
      
      public function set distance(param1:Number) : void
      {
         if(this._8277 == param1)
         {
            return;
         }
         this._8277 = param1;
         this._8267 = true;
         invalidateDisplayList();
      }
      
      public function get _8279() : Number
      {
         return this._8276;
      }
      
      public function set _8279(param1:Number) : void
      {
         if(this._8276 == param1)
         {
            return;
         }
         this._8276 = param1;
         this._8267 = true;
         invalidateDisplayList();
      }
      
      public function get _8280() : Number
      {
         return this._8275;
      }
      
      public function set _8280(param1:Number) : void
      {
         if(this._8275 == param1)
         {
            return;
         }
         this._8275 = param1;
         this._8267 = true;
         invalidateDisplayList();
      }
      
      public function get _8281() : Number
      {
         return this._8274;
      }
      
      public function set _8281(param1:Number) : void
      {
         if(this._8274 == param1)
         {
            return;
         }
         this._8274 = param1;
         this._8267 = true;
         invalidateDisplayList();
      }
      
      public function get _8278() : Number
      {
         return this._8273;
      }
      
      public function set _8278(param1:Number) : void
      {
         if(this._8278 == param1)
         {
            return;
         }
         this._8273 = param1;
         this._8267 = true;
         invalidateDisplayList();
      }
      
      public function get blurX() : Number
      {
         return this._8283;
      }
      
      public function set blurX(param1:Number) : void
      {
         if(this._8283 == param1)
         {
            return;
         }
         this._8283 = param1;
         this._8267 = true;
         invalidateDisplayList();
      }
      
      public function get blurY() : Number
      {
         return this._8284;
      }
      
      public function set blurY(param1:Number) : void
      {
         if(this._8284 == param1)
         {
            return;
         }
         this._8284 = param1;
         this._8267 = true;
         invalidateDisplayList();
      }
      
      override protected function _5823(param1:Number, param2:Number) : void
      {
         super._5823(param1,param2);
         graphics.clear();
         if(this._8267)
         {
            this._8267 = false;
            this._8266();
         }
         this._8270(0,0,param1,param2);
      }
      
      private function _8270(param1:Number, param2:Number, param3:Number, param4:Number) : void
      {
         var _loc15_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc19_:Number = NaN;
         var _loc20_:Number = NaN;
         var _loc21_:Number = NaN;
         var _loc22_:Number = NaN;
         var _loc5_:Graphics = graphics;
         param3 = Math.ceil(param3);
         param4 = Math.ceil(param4);
         var _loc6_:int = !!this._8271 ? this._8271.width : 0;
         var _loc7_:int = !!this._8269 ? this._8269.width : 0;
         var _loc8_:int = !!this._8272 ? this._8272.height : 0;
         var _loc9_:int = !!this._8268 ? this._8268.height : 0;
         var _loc10_:int = _loc6_ + _loc7_;
         var _loc11_:int = _loc8_ + _loc9_;
         var _loc12_:Number = (param4 + _loc11_) / 2;
         var _loc13_:Number = (param3 + _loc10_) / 2;
         var _loc14_:Matrix = new Matrix();
         if(Boolean(this._8271) || Boolean(this._8272))
         {
            _loc15_ = Math.min(this._8279 + _loc10_,_loc13_);
            _loc16_ = Math.min(this._8279 + _loc11_,_loc12_);
            _loc14_.tx = param1 - _loc6_;
            _loc14_.ty = param2 - _loc8_;
            _loc5_.beginBitmapFill(this.shadow,_loc14_,false);
            _loc5_.drawRect(param1 - _loc6_,param2 - _loc8_,_loc15_,_loc16_);
            _loc5_.endFill();
         }
         if(Boolean(this._8269) || Boolean(this._8272))
         {
            _loc17_ = Math.min(this._8280 + _loc10_,_loc13_);
            _loc18_ = Math.min(this._8280 + _loc11_,_loc12_);
            _loc14_.tx = param1 + param3 + _loc7_ - this.shadow.width;
            _loc14_.ty = param2 - _loc8_;
            _loc5_.beginBitmapFill(this.shadow,_loc14_,false);
            _loc5_.drawRect(param1 + param3 + _loc7_ - _loc17_,param2 - _loc8_,_loc17_,_loc18_);
            _loc5_.endFill();
         }
         if(Boolean(this._8271) || Boolean(this._8268))
         {
            _loc19_ = Math.min(this._8281 + _loc10_,_loc13_);
            _loc20_ = Math.min(this._8281 + _loc11_,_loc12_);
            _loc14_.tx = param1 - _loc6_;
            _loc14_.ty = param2 + param4 + _loc9_ - this.shadow.height;
            _loc5_.beginBitmapFill(this.shadow,_loc14_,false);
            _loc5_.drawRect(param1 - _loc6_,param2 + param4 + _loc9_ - _loc20_,_loc19_,_loc20_);
            _loc5_.endFill();
         }
         if(Boolean(this._8269) || Boolean(this._8268))
         {
            _loc21_ = Math.min(this._8278 + _loc10_,_loc13_);
            _loc22_ = Math.min(this._8278 + _loc11_,_loc12_);
            _loc14_.tx = param1 + param3 + _loc7_ - this.shadow.width;
            _loc14_.ty = param2 + param4 + _loc9_ - this.shadow.height;
            _loc5_.beginBitmapFill(this.shadow,_loc14_,false);
            _loc5_.drawRect(param1 + param3 + _loc7_ - _loc21_,param2 + param4 + _loc9_ - _loc22_,_loc21_,_loc22_);
            _loc5_.endFill();
         }
         if(this._8271)
         {
            _loc14_.tx = param1 - _loc6_;
            _loc14_.ty = 0;
            _loc5_.beginBitmapFill(this._8271,_loc14_,false);
            _loc5_.drawRect(param1 - _loc6_,param2 - _loc8_ + _loc16_,_loc6_,param4 + _loc8_ + _loc9_ - _loc16_ - _loc20_);
            _loc5_.endFill();
         }
         if(this._8269)
         {
            _loc14_.tx = param1 + param3;
            _loc14_.ty = 0;
            _loc5_.beginBitmapFill(this._8269,_loc14_,false);
            _loc5_.drawRect(param1 + param3,param2 - _loc8_ + _loc18_,_loc7_,param4 + _loc8_ + _loc9_ - _loc18_ - _loc22_);
            _loc5_.endFill();
         }
         if(this._8272)
         {
            _loc14_.tx = 0;
            _loc14_.ty = param2 - _loc8_;
            _loc5_.beginBitmapFill(this._8272,_loc14_,false);
            _loc5_.drawRect(param1 - _loc6_ + _loc15_,param2 - _loc8_,param3 + _loc6_ + _loc7_ - _loc15_ - _loc17_,_loc8_);
            _loc5_.endFill();
         }
         if(this._8268)
         {
            _loc14_.tx = 0;
            _loc14_.ty = param2 + param4;
            _loc5_.beginBitmapFill(this._8268,_loc14_,false);
            _loc5_.drawRect(param1 - _loc6_ + _loc19_,param2 + param4,param3 + _loc6_ + _loc7_ - _loc19_ - _loc21_,_loc9_);
            _loc5_.endFill();
         }
      }
      
      private function _8266() : void
      {
         var _loc1_:Number = Math.max(this._8279,this._8281) + 3 * Math.max(Math.abs(this.distance),2) + Math.max(this._8280,this._8278);
         var _loc2_:Number = Math.max(this._8279,this._8280) + 3 * Math.max(Math.abs(this.distance),2) + Math.max(this._8281,this._8278);
         if(_loc1_ < 0 || _loc2_ < 0)
         {
            return;
         }
         var _loc3_:Shape = new Shape();
         var _loc4_:Graphics = _loc3_.graphics;
         _loc4_.beginFill(16777215);
         drawRoundRectComplex(_loc4_,0,0,_loc1_,_loc2_,this._8279,this._8280,this._8281,this._8278);
         _loc4_.endFill();
         var _loc5_:BitmapData = new BitmapData(_loc1_,_loc2_,true,0);
         _loc5_.draw(_loc3_,new Matrix());
         var _loc6_:DropShadowFilter;
         (_loc6_ = new DropShadowFilter(this.distance,this.angle,this.color,this.alpha,this.blurX,this.blurY)).knockout = true;
         var _loc7_:Rectangle = new Rectangle(0,0,_loc1_,_loc2_);
         var _loc8_:Rectangle = _loc5_.generateFilterRect(_loc7_,_loc6_);
         var _loc9_:Number = _loc7_.left - _loc8_.left;
         var _loc10_:Number = _loc8_.right - _loc7_.right;
         var _loc11_:Number = _loc7_.top - _loc8_.top;
         var _loc12_:Number = _loc8_.bottom - _loc7_.bottom;
         this.shadow = new BitmapData(_loc8_.width,_loc8_.height);
         this.shadow.applyFilter(_loc5_,_loc7_,new Point(_loc9_,_loc11_),_loc6_);
         var _loc13_:Point = new Point(0,0);
         var _loc14_:Rectangle = new Rectangle();
         if(_loc9_ > 0)
         {
            _loc14_.x = 0;
            _loc14_.y = this._8279 + _loc11_ + _loc12_;
            _loc14_.width = _loc9_;
            _loc14_.height = 1;
            this._8271 = new BitmapData(_loc9_,1);
            this._8271.copyPixels(this.shadow,_loc14_,_loc13_);
         }
         else
         {
            this._8271 = null;
         }
         if(_loc10_ > 0)
         {
            _loc14_.x = this.shadow.width - _loc10_;
            _loc14_.y = this._8280 + _loc11_ + _loc12_;
            _loc14_.width = _loc10_;
            _loc14_.height = 1;
            this._8269 = new BitmapData(_loc10_,1);
            this._8269.copyPixels(this.shadow,_loc14_,_loc13_);
         }
         else
         {
            this._8269 = null;
         }
         if(_loc11_ > 0)
         {
            _loc14_.x = this._8279 + _loc9_ + _loc10_;
            _loc14_.y = 0;
            _loc14_.width = 1;
            _loc14_.height = _loc11_;
            this._8272 = new BitmapData(1,_loc11_);
            this._8272.copyPixels(this.shadow,_loc14_,_loc13_);
         }
         else
         {
            this._8272 = null;
         }
         if(_loc12_ > 0)
         {
            _loc14_.x = this._8281 + _loc9_ + _loc10_;
            _loc14_.y = this.shadow.height - _loc12_;
            _loc14_.width = 1;
            _loc14_.height = _loc12_;
            this._8268 = new BitmapData(1,_loc12_);
            this._8268.copyPixels(this.shadow,_loc14_,_loc13_);
         }
         else
         {
            this._8268 = null;
         }
      }
   }
}

