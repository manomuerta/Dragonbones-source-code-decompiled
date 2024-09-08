package _844
{
   import _97._100;
   import egret.core._1140;
   import flash.display.Graphics;
   import flash.events.MouseEvent;
   import flash.filters.DropShadowFilter;
   
   public class _850 extends _1140
   {
      protected static var _6271:DropShadowFilter = new DropShadowFilter(0,0,3355443,0.8,4,4,2);
      
      private var _6285:Number = 14;
      
      private var _4367:Boolean = false;
      
      private var _4366:Boolean = false;
      
      private var _6278:Boolean = true;
      
      private var _6272:Boolean = false;
      
      public function _850()
      {
         super();
         width = 0;
         height = 0;
         addEventListener(MouseEvent.ROLL_OVER,this._6283);
         addEventListener(MouseEvent.ROLL_OUT,this._6284);
         filters = [_6271];
      }
      
      public function _4365(param1:Boolean, param2:Boolean) : void
      {
         this._6278 = false;
         this._4367 = param1;
         this._4366 = param2;
         this.update();
      }
      
      public function _4337() : void
      {
         this._6278 = true;
         this.update();
      }
      
      override protected function _5823(param1:Number, param2:Number) : void
      {
         super._5823(param1,param2);
         this._10812(graphics,this._6285);
      }
      
      private function _6283(param1:MouseEvent) : void
      {
         this._6272 = true;
         this.update();
      }
      
      private function _6284(param1:MouseEvent) : void
      {
         this._6272 = false;
         this.update();
      }
      
      private function update() : void
      {
         if(this._6278)
         {
            this._4367 = this._6272;
            this._4366 = this._6272;
         }
      }
      
      public function get _4368() : Boolean
      {
         return this._4367;
      }
      
      public function get _4369() : Boolean
      {
         return this._4366;
      }
      
      public function get _5122() : Boolean
      {
         return this._6278;
      }
      
      public function _10812(param1:Graphics, param2:Number, param3:int = 3, param4:Number = 0.1) : void
      {
         param1.beginFill(_100._2264);
         param1.drawCircle(0,0,param2);
         param1.drawCircle(0,0,param2 - param3);
         param1.endFill();
         param1.beginFill(_100._2264);
         param1.moveTo(param2 + 10,0);
         this._10813(param1,0,0,param2 + 3,-20,20);
         param1.lineTo(param2 + 10,0);
         param1.endFill();
      }
      
      public function _10813(param1:Graphics, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number = 1) : void
      {
         var _loc8_:int = 0;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = 3;
         var _loc13_:Number = 6;
         var _loc14_:Number = 6;
         param5 %= 360;
         param6 %= 360;
         var _loc15_:Number = 0.0174532925;
         var _loc16_:Number = (param6 - param5) % 360;
         var _loc17_:Number = Math.abs(Math.round(_loc16_ * param7));
         var _loc18_:Number = param6;
         var _loc19_:Number = param2 + param4 * Math.cos(_loc18_ * _loc15_);
         var _loc20_:Number = param3 + param4 * Math.sin(_loc18_ * _loc15_);
         _loc8_ = _loc17_;
         while(_loc8_ >= 1)
         {
            _loc9_ = (param5 + _loc16_ / _loc17_ * _loc8_) * _loc15_;
            param1.lineTo(param2 + param4 * Math.cos(_loc9_),param3 + param4 * Math.sin(_loc9_));
            _loc8_--;
         }
      }
      
      public function _10811(param1:Graphics, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number = 0.1) : void
      {
         var _loc8_:int = 0;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = 3;
         var _loc13_:Number = 6;
         var _loc14_:Number = 6;
         param5 %= 360;
         param6 %= 360;
         var _loc15_:Number = 0.0174532925;
         var _loc16_:Number = (param6 - param5) % 360;
         var _loc17_:Number = Math.abs(Math.round(_loc16_ * param7));
         var _loc18_:Number = param6;
         var _loc19_:Number = param2 + param4 * Math.cos(_loc18_ * _loc15_);
         var _loc20_:Number = param3 + param4 * Math.sin(_loc18_ * _loc15_);
         param1.moveTo(_loc19_,_loc20_);
         _loc8_ = _loc17_;
         while(_loc8_ >= 1)
         {
            _loc9_ = (param5 + _loc16_ / _loc17_ * _loc8_) * _loc15_;
            param1.lineTo(param2 + param4 * Math.cos(_loc9_),param3 + param4 * Math.sin(_loc9_));
            _loc8_--;
         }
         param4 -= _loc12_;
         _loc8_ = 1;
         while(_loc8_ <= _loc17_)
         {
            _loc9_ = (param5 + _loc16_ / _loc17_ * _loc8_) * _loc15_;
            param1.lineTo(param2 + param4 * Math.cos(_loc9_),param3 + param4 * Math.sin(_loc9_));
            _loc8_++;
         }
         param1.lineTo(_loc19_,_loc20_ + _loc12_ + _loc14_);
         param1.lineTo(_loc19_ + _loc13_,_loc20_ + _loc12_ / 2);
         param1.lineTo(_loc19_,_loc20_ - _loc14_);
         param1.lineTo(_loc19_,_loc20_);
      }
   }
}

