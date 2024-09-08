package _521
{
   import _51._52;
   import _6._7;
   import _648._649;
   import _81._85;
   import flash.geom.Point;
   
   public class _526 extends _7
   {
      public function _526()
      {
         super();
      }
      
      public function _3798(param1:Array) : Array
      {
         var _loc5_:uint = 0;
         var _loc2_:Array = [];
         var _loc3_:int = int(param1.length);
         _loc5_ = 0;
         while(_loc5_ < _loc3_)
         {
            if(param1[_loc5_] is _52)
            {
               _loc2_.push(param1[_loc5_]);
            }
            _loc5_++;
         }
         _loc3_ = int(_loc2_.length);
         var _loc4_:Array = [];
         _loc5_ = 1;
         _loc5_ = 0;
         while(_loc5_ < _loc3_)
         {
            _loc4_[_loc5_] = true;
            _loc5_++;
         }
         var _loc6_:int = -1;
         _loc5_ = 0;
         while(_loc5_ < _loc3_)
         {
            _loc6_ = this._3793(_loc2_[_loc5_],_loc2_);
            if(_loc6_ > -1)
            {
               _loc4_[_loc6_] = false;
            }
            _loc5_++;
         }
         var _loc7_:Array = [];
         _loc5_ = 0;
         while(_loc5_ < _loc3_)
         {
            if(_loc4_[_loc5_] == true)
            {
               _loc7_.push(this._3794(_loc2_[_loc5_],_loc2_));
            }
            _loc5_++;
         }
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         _loc5_ = 0;
         while(_loc5_ < _loc7_.length)
         {
            if(_loc9_ < _loc7_[_loc5_].length)
            {
               _loc9_ = int(_loc7_[_loc5_].length);
               _loc8_ = int(_loc5_);
            }
            _loc5_++;
         }
         return _loc7_[_loc8_];
      }
      
      public function _3795(param1:Point, param2:Array) : Array
      {
         var _loc8_:_52 = null;
         var _loc9_:_649 = null;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc3_:uint = 1;
         var _loc4_:int = int(param2.length);
         var _loc5_:Array = [];
         var _loc6_:int = _loc4_;
         var _loc7_:Number = 0;
         _loc3_ = 0;
         while(_loc3_ < param2.length)
         {
            _loc8_ = param2[_loc3_];
            (_loc9_ = new _649())._3800 = _loc8_.globalTransform;
            _loc9_._2194 = _loc8_._2009;
            _loc9_.x = _loc8_.globalTransform.x;
            _loc9_.y = _loc8_.globalTransform.y;
            if(param2[_loc3_ + 1])
            {
               _loc9_.bone = param2[_loc3_];
               _loc9_.child = param2[_loc3_ + 1];
               _loc9_._3799(param2[_loc3_ + 1].globalTransform.x,param2[_loc3_ + 1].globalTransform.y);
            }
            else
            {
               _loc9_.bone = param2[_loc3_];
               _loc9_.child = null;
               _loc9_.rotation = _loc8_.globalTransform.rotation * 180 / Math.PI;
            }
            _loc7_ += _loc9_.length;
            _loc9_._2136 = _loc8_.globalTransform.rotation * 180 / Math.PI - _loc9_.rotation;
            _loc5_[param2.length - _loc3_ - 1] = _loc9_;
            _loc3_++;
         }
         if(_85._2185(param1,new Point(param2[0].globalTransform.x,param2[0].globalTransform.y)) >= _loc7_)
         {
            _loc10_ = param1.x - param2[0].globalTransform.x;
            _loc11_ = param1.y - param2[0].globalTransform.y;
            _loc12_ = Math.atan2(_loc11_,_loc10_);
            _loc3_ = 0;
            while(_loc3_ < _loc5_.length)
            {
               _loc5_[_loc3_].rotation = _loc12_ * 180 / Math.PI;
               _loc3_++;
            }
         }
         else
         {
            this._3797(_loc5_,param1);
         }
         _loc5_.reverse();
         return _loc5_;
      }
      
      public function _3796(param1:Point, param2:Array) : Array
      {
         var _loc8_:_52 = null;
         var _loc9_:_649 = null;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc3_:uint = 1;
         var _loc4_:int = int(param2.length);
         var _loc5_:Array = [];
         var _loc6_:int = _loc4_;
         var _loc7_:Number = 0;
         _loc3_ = 0;
         while(_loc3_ < param2.length)
         {
            _loc8_ = param2[_loc3_];
            (_loc9_ = new _649()).x = _loc8_.globalTransform.x;
            _loc9_.y = _loc8_.globalTransform.y;
            if(param2[_loc3_ + 1])
            {
               _loc9_.bone = param2[_loc3_];
               _loc9_.child = param2[_loc3_ + 1];
               _loc9_._3799(param2[_loc3_ + 1].globalTransform.x,param2[_loc3_ + 1].globalTransform.y);
            }
            else
            {
               _loc9_.bone = param2[_loc3_];
               _loc9_.child = null;
               _loc9_.rotation = _loc8_.globalTransform.rotation * 180 / Math.PI;
            }
            _loc7_ += _loc9_.length;
            _loc9_._2136 = _loc8_.globalTransform.rotation * 180 / Math.PI - _loc9_.rotation;
            _loc5_[param2.length - _loc3_ - 1] = _loc9_;
            _loc3_++;
         }
         if(_85._2185(param1,new Point(param2[0].globalTransform.x,param2[0].globalTransform.y)) >= _loc7_)
         {
            _loc10_ = param1.x - param2[0].globalTransform.x;
            _loc11_ = param1.y - param2[0].globalTransform.y;
            _loc12_ = Math.atan2(_loc11_,_loc10_);
            _loc3_ = 0;
            while(_loc3_ < _loc5_.length)
            {
               _loc5_[_loc3_].rotation = _loc12_ * 180 / Math.PI;
               _loc3_++;
            }
         }
         else
         {
            this._3797(_loc5_,param1);
         }
         _loc5_.reverse();
         return _loc5_;
      }
      
      private function _3797(param1:Array, param2:Point) : void
      {
         var _loc5_:_649 = null;
         var _loc6_:_649 = null;
         var _loc7_:_649 = null;
         var _loc3_:int = 0;
         var _loc4_:Point = this._3802(param1[0],param2.x,param2.y);
         _loc3_ = 1;
         while(_loc3_ < param1.length)
         {
            _loc5_ = param1[_loc3_];
            _loc4_ = this._3802(_loc5_,_loc4_.x,_loc4_.y);
            _loc3_++;
         }
         _loc3_ = int(param1.length - 1);
         while(_loc3_ > 0)
         {
            _loc6_ = param1[_loc3_ - 1];
            _loc7_ = param1[_loc3_];
            this.position(_loc6_,_loc7_);
            _loc3_--;
         }
      }
      
      private function _3802(param1:_649, param2:Number, param3:Number) : Point
      {
         var _loc4_:Number = param2 - param1.x;
         var _loc5_:Number = param3 - param1.y;
         var _loc6_:Number = Math.atan2(_loc5_,_loc4_);
         param1.rotation = _loc6_ * 180 / Math.PI;
         var _loc7_:Number = param1._3801().x - param1.x;
         var _loc8_:Number = param1._3801().y - param1.y;
         var _loc9_:Number = param2 - _loc7_;
         var _loc10_:Number = param3 - _loc8_;
         return new Point(_loc9_,_loc10_);
      }
      
      private function position(param1:_649, param2:_649) : void
      {
         param1.x = param2._3801().x;
         param1.y = param2._3801().y;
      }
      
      private function _3794(param1:_52, param2:Array) : Array
      {
         var _loc3_:Array = [];
         _loc3_.unshift(param1);
         var _loc4_:int = this._3793(param1,param2);
         while(_loc4_ > -1)
         {
            _loc3_.unshift(param2[_loc4_]);
            _loc4_ = this._3793(param2[_loc4_],param2);
         }
         return _loc3_;
      }
      
      private function _3793(param1:_52, param2:Array) : int
      {
         var _loc3_:int = 0;
         while(_loc3_ < param2.length)
         {
            if(param1.parentBoneData != null && param1.parentBoneData.name == param2[_loc3_].name)
            {
               return _loc3_;
            }
            _loc3_++;
         }
         return -1;
      }
   }
}

