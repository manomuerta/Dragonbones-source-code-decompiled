package egret.utils
{
   import egret.core._1129;
   import flash.display.BitmapData;
   import flash.display.Graphics;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class _1290
   {
      private static var matrix:Matrix = new Matrix();
      
      private static var _9085:Array = [];
      
      private static var _9082:Rectangle = new Rectangle();
      
      private static var _9080:Rectangle = new Rectangle();
      
      private static var _9081:Rectangle = new Rectangle();
      
      public function _1290()
      {
         super();
      }
      
      public static function _9084(param1:Graphics, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number = 8, param7:Number = 2) : void
      {
         var _loc8_:Number = Math.atan2(param5 - param3,param4 - param2);
         var _loc9_:Number = param6 + param7;
         var _loc10_:Number = param6 * Math.cos(_loc8_);
         var _loc11_:Number = param6 * Math.sin(_loc8_);
         var _loc12_:Number = param7 * Math.cos(_loc8_);
         var _loc13_:Number = param7 * Math.sin(_loc8_);
         var _loc14_:Number = _loc9_ * Math.cos(_loc8_);
         var _loc15_:Number = _loc9_ * Math.sin(_loc8_);
         var _loc16_:Number = Math.sqrt(Math.pow(param4 - param2,2) + Math.pow(param5 - param3,2));
         var _loc17_:int = _loc9_;
         var _loc18_:Number = param2;
         var _loc19_:Number = param3;
         while(_loc17_ < _loc16_)
         {
            param1.moveTo(_loc18_ + _loc12_,_loc19_ + _loc13_);
            param1.lineTo(_loc18_ + _loc10_,_loc19_ + _loc11_);
            _loc18_ += _loc14_;
            _loc19_ += _loc15_;
            _loc17_ += _loc9_;
         }
      }
      
      public static function drawRoundRectComplex(param1:Graphics, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number, param9:Number) : void
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
      
      public static function _8582(param1:Graphics, param2:Array, param3:Rectangle, param4:Object, param5:int, param6:int, param7:Boolean = false, param8:Number = 1) : void
      {
         var _loc10_:BitmapData = null;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc16_:int = 0;
         var _loc17_:int = 0;
         var _loc18_:int = 0;
         var _loc26_:Number = NaN;
         var _loc27_:Number = NaN;
         var _loc28_:Number = NaN;
         var _loc29_:Number = NaN;
         var _loc30_:int = 0;
         var _loc9_:_1129 = param4 as _1129;
         if(_loc9_)
         {
            _loc10_ = _loc9_.bitmapData;
            _loc11_ = _loc9_.bitmapHeight;
            _loc12_ = _loc9_.bitmapWidth;
            _loc13_ = _loc9_._8606;
            _loc14_ = _loc9_._8605;
            _loc15_ = _loc9_.offsetX;
            _loc16_ = _loc9_.offsetY;
            _loc17_ = _loc9_._8595;
            _loc18_ = _loc9_._8596;
         }
         else
         {
            _loc10_ = param4 as BitmapData;
            _loc11_ = _loc10_.height * param8;
            _loc12_ = _loc10_.width * param8;
            _loc17_ = _loc10_.height * param8;
            _loc18_ = _loc10_.width * param8;
         }
         var _loc19_:Rectangle = _9082;
         _loc19_.setTo(param3.x - _loc15_,param3.y - _loc16_,param3.width,param3.height);
         param5 -= _loc18_ - _loc12_;
         param6 -= _loc17_ - _loc11_;
         if(_loc19_.top == _loc19_.bottom)
         {
            if(_loc19_.bottom < _loc11_)
            {
               ++_loc19_.bottom;
            }
            else
            {
               --_loc19_.top;
            }
         }
         if(_loc19_.left == _loc19_.right)
         {
            if(_loc19_.right < _loc12_)
            {
               ++_loc19_.right;
            }
            else
            {
               --_loc19_.left;
            }
         }
         if(param2.length == 0)
         {
            param2.push([new Point(0,0),new Point(_loc19_.left,0),new Point(_loc19_.right,0),new Point(_loc12_,0)]);
            param2.push([new Point(0,_loc19_.top),new Point(_loc19_.left,_loc19_.top),new Point(_loc19_.right,_loc19_.top),new Point(_loc12_,_loc19_.top)]);
            param2.push([new Point(0,_loc19_.bottom),new Point(_loc19_.left,_loc19_.bottom),new Point(_loc19_.right,_loc19_.bottom),new Point(_loc12_,_loc19_.bottom)]);
            param2.push([new Point(0,_loc11_),new Point(_loc19_.left,_loc11_),new Point(_loc19_.right,_loc11_),new Point(_loc12_,_loc11_)]);
         }
         var _loc20_:Number = param6 - (_loc11_ - _loc19_.bottom);
         var _loc21_:Number = param5 - (_loc12_ - _loc19_.right);
         if(_loc12_ - _loc19_.width > param5)
         {
            _loc26_ = (_loc12_ - _loc19_.right) / _loc19_.left;
            _loc27_ = param5 / (1 + _loc26_);
            _loc21_ = _loc19_.left = _loc19_.right = Math.round(isNaN(_loc27_) ? 0 : _loc27_);
         }
         if(_loc11_ - _loc19_.height > param6)
         {
            _loc28_ = (_loc11_ - _loc19_.bottom) / _loc19_.top;
            _loc29_ = param6 / (1 + _loc28_);
            _loc20_ = _loc19_.top = _loc19_.bottom = Math.round(isNaN(_loc29_) ? 0 : _loc29_);
         }
         var _loc22_:Array = _9085;
         if(_loc22_.length == 0)
         {
            _9079();
         }
         _loc22_[0][1].setTo(_loc19_.left,0);
         _loc22_[0][2].setTo(_loc21_,0);
         _loc22_[0][3].setTo(param5,0);
         _loc22_[1][0].setTo(0,_loc19_.top);
         _loc22_[1][1].setTo(_loc19_.left,_loc19_.top);
         _loc22_[1][2].setTo(_loc21_,_loc19_.top);
         _loc22_[1][3].setTo(param5,_loc19_.top);
         _loc22_[2][0].setTo(0,_loc20_);
         _loc22_[2][1].setTo(_loc19_.left,_loc20_);
         _loc22_[2][2].setTo(_loc21_,_loc20_);
         _loc22_[2][3].setTo(param5,_loc20_);
         _loc22_[3][0].setTo(0,param6);
         _loc22_[3][1].setTo(_loc19_.left,param6);
         _loc22_[3][2].setTo(_loc21_,param6);
         _loc22_[3][3].setTo(param5,param6);
         var _loc23_:Rectangle = _9080;
         var _loc24_:Rectangle = _9081;
         var _loc25_:int = 0;
         while(_loc25_ < 3)
         {
            _loc30_ = 0;
            while(_loc30_ < 3)
            {
               _loc23_.topLeft = param2[_loc25_][_loc30_];
               _loc23_.bottomRight = param2[_loc25_ + 1][_loc30_ + 1];
               _loc23_.x += _loc13_;
               _loc23_.y += _loc14_;
               _loc24_.topLeft = _loc22_[_loc25_][_loc30_];
               _loc24_.bottomRight = _loc22_[_loc25_ + 1][_loc30_ + 1];
               if(!(_loc24_.width == 0 || _loc24_.height == 0 || _loc23_.width == 0 || _loc23_.height == 0))
               {
                  matrix.identity();
                  matrix.scale(_loc24_.width / _loc23_.width * param8,_loc24_.height / _loc23_.height * param8);
                  matrix.translate(_loc24_.x - _loc23_.x * matrix.a,_loc24_.y - _loc23_.y * matrix.d);
                  matrix.translate(_loc15_,_loc16_);
                  param1.beginBitmapFill(_loc10_,matrix,false,param7);
                  param1.drawRect(_loc24_.x + _loc15_,_loc24_.y + _loc16_,_loc24_.width,_loc24_.height);
                  param1.endFill();
               }
               _loc30_++;
            }
            _loc25_++;
         }
      }
      
      private static function _9079() : void
      {
         var _loc3_:Array = null;
         var _loc4_:int = 0;
         var _loc1_:Array = _9085;
         var _loc2_:int = 0;
         while(_loc2_ < 4)
         {
            _loc3_ = [];
            _loc4_ = 0;
            while(_loc4_ < 4)
            {
               _loc3_.push(new Point());
               _loc4_++;
            }
            _loc1_.push(_loc3_);
            _loc2_++;
         }
      }
   }
}

