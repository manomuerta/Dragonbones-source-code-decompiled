package _51
{
   import _13492._14034;
   import _13505._14035;
   import _35.HashObject;
   import _81._88;
   import _81._90;
   import flash.geom.Matrix;
   import flash.geom.Point;
   
   public class _77 extends HashObject implements _90
   {
      private var _name:String;
      
      private var _2138:Vector.<_52>;
      
      private var _target:_52;
      
      private var _2137:int;
      
      private var _weight:Number;
      
      public var _2134:int = 0;
      
      public var _2133:Number = -1;
      
      public var _1903:_14035;
      
      public function _77(param1:int = 0, param2:Object = null)
      {
         super(param1,param2);
      }
      
      public static function _2132(param1:Object, param2:int = 0, param3:Object = null) : _77
      {
         var _loc4_:_77;
         (_loc4_ = new _77(param2,param3)).name = param1.name;
         _loc4_.bones = param1.bones;
         _loc4_.target = param1._1897;
         _loc4_.bendDirection = param1.bendDirection;
         _loc4_.weight = param1.weight;
         return _loc4_;
      }
      
      public function _14305(param1:_52) : Boolean
      {
         return this._2138.indexOf(param1) >= 0 || this._target == param1;
      }
      
      public function compute() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:int = 0;
         var _loc3_:Number = NaN;
         var _loc4_:Point = null;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         switch(this.bones.length)
         {
            case 1:
               if(this._2133 >= 0)
               {
                  _loc1_ = this._2133;
               }
               else if(this._1903 && this._1903._13680 is _14034 && this._1903._13680._13664)
               {
                  _loc1_ = (this._1903._13680 as _14034)._14279;
               }
               else
               {
                  _loc1_ = this.weight;
               }
               this.compute1(this.bones[0],this.target,_loc1_);
               break;
            case 2:
               _loc2_ = this._2137;
               _loc3_ = this.weight;
               if(this._2134 != 0)
               {
                  _loc2_ = this._2134;
               }
               else if(this._1903 && this._1903._13680 is _14034 && this._1903._13680._13664)
               {
                  _loc2_ = (this._1903._13680 as _14034).bend;
               }
               else
               {
                  _loc2_ = this._2137;
               }
               if(this._2133 >= 0)
               {
                  _loc3_ = this._2133;
               }
               else if(this._1903 && this._1903._13680 is _14034 && this._1903._13680._13664)
               {
                  _loc3_ = (this._1903._13680 as _14034)._14279;
               }
               else
               {
                  _loc3_ = this.weight;
               }
               _loc4_ = this.compute2(this.bones[0],this.bones[1],this.target.globalTransform.x,this.target.globalTransform.y,_loc2_,_loc3_);
               _loc5_ = this.normalize(_loc4_.x - this.bones[0].currentLocalTransform.rotation);
               _loc6_ = this.normalize(_loc4_.y - this.bones[1].currentLocalTransform.rotation);
               this.bones[0]._14290 = this.bones[0].currentLocalTransform.rotation + _loc5_ + this.bones[0].parentBoneData._1997;
               this.bones[1]._14290 = this.bones[1].currentLocalTransform.rotation + _loc6_ + this.bones[0]._14290;
               this.bones[0]._1997 = this.bones[0].currentLocalTransform.rotation + _loc5_ * _loc3_ + this.bones[0].parentBoneData._1997;
               this.bones[1]._1997 = this.bones[1].currentLocalTransform.rotation + _loc6_ * _loc3_ + this.bones[0]._1997;
         }
      }
      
      public function compute1(param1:_52, param2:_52, param3:Number) : void
      {
         var _loc4_:Number = !param1.inheritRotation || param1.parentBoneData == null ? 0 : param1.parentBoneData.globalTransform.rotation;
         var _loc5_:Number = param1.globalTransform.rotation;
         var _loc6_:Number = Math.atan2(param2.globalTransform.y - param1.globalTransform.y,param2.globalTransform.x - param1.globalTransform.x);
         param1._14290 = _loc6_;
         param1._1997 = _loc5_ + this.normalize(_loc6_ - _loc5_) * param3;
      }
      
      public function compute2(param1:_52, param2:_52, param3:Number, param4:Number, param5:int, param6:Number) : Point
      {
         var _loc18_:Number = NaN;
         var _loc19_:Number = NaN;
         var _loc26_:Number = NaN;
         var _loc27_:Number = NaN;
         var _loc28_:Number = NaN;
         var _loc29_:Number = NaN;
         var _loc30_:Number = NaN;
         var _loc31_:Number = NaN;
         var _loc32_:Number = NaN;
         var _loc33_:Number = NaN;
         var _loc34_:Number = NaN;
         var _loc35_:Number = NaN;
         var _loc36_:Number = NaN;
         var _loc37_:Number = NaN;
         var _loc38_:Number = NaN;
         var _loc39_:Number = NaN;
         var _loc40_:Number = NaN;
         var _loc41_:Number = NaN;
         var _loc42_:Number = NaN;
         var _loc43_:Number = NaN;
         var _loc44_:Number = NaN;
         var _loc45_:Number = NaN;
         var _loc46_:Number = NaN;
         var _loc47_:Number = NaN;
         var _loc48_:Number = NaN;
         var _loc49_:Number = NaN;
         var _loc50_:Number = NaN;
         var _loc51_:Number = NaN;
         var _loc52_:Number = NaN;
         var _loc53_:Number = NaN;
         var _loc54_:Number = NaN;
         var _loc55_:Number = NaN;
         var _loc56_:Number = NaN;
         var _loc57_:Number = NaN;
         var _loc58_:Number = NaN;
         var _loc59_:Number = NaN;
         var _loc60_:Number = NaN;
         var _loc61_:Number = NaN;
         var _loc62_:Number = NaN;
         var _loc63_:Number = NaN;
         var _loc7_:Point = new Point();
         var _loc8_:Point = new Point(param1.globalTransform.x,param1.globalTransform.y);
         var _loc9_:Point = new Point(param2.globalTransform.x,param2.globalTransform.y);
         var _loc10_:Matrix = param1.parentBoneData._2009.clone();
         _loc10_.invert();
         var _loc11_:Point = _88._2135(new Point(param3,param4),_loc10_,true);
         param3 = _loc11_.x;
         param4 = _loc11_.y;
         _loc8_ = _88._2135(_loc8_,_loc10_,true);
         _loc9_ = _88._2135(_loc9_,_loc10_,true);
         var _loc12_:Number = param1._2005.scaleX;
         var _loc13_:Number = param1._2005.scaleY;
         var _loc14_:Number = param2._2005.scaleX;
         var _loc15_:Number = _loc9_.x - _loc8_.x;
         var _loc16_:Number = _loc9_.y - _loc8_.y;
         var _loc17_:Number = Math.sqrt(_loc15_ * _loc15_ + _loc16_ * _loc16_);
         var _loc20_:int = 1;
         var _loc21_:Number = 0;
         var _loc22_:Number = 0;
         if(_loc12_ < 0)
         {
            _loc12_ = -_loc12_;
            _loc21_ = Math.PI;
            _loc20_ = -1;
         }
         else
         {
            _loc21_ = 0;
            _loc20_ = 1;
         }
         if(_loc13_ < 0)
         {
            _loc13_ = -_loc13_;
            _loc20_ = -_loc20_;
         }
         if(_loc14_ < 0)
         {
            _loc14_ = -_loc14_;
            _loc22_ = Math.PI;
         }
         else
         {
            _loc22_ = 0;
         }
         param5 = _loc20_ * param5;
         if(Math.abs(_loc12_ - _loc13_) <= 0.001)
         {
            _loc26_ = param2.length;
            _loc27_ = _loc26_ * _loc14_;
            param3 -= _loc8_.x;
            param4 -= _loc8_.y;
            _loc28_ = 2 * _loc17_ * _loc27_;
            _loc29_ = (param3 * param3 + param4 * param4 - _loc17_ * _loc17_ - _loc27_ * _loc27_) / _loc28_;
            if(_loc29_ < -1)
            {
               _loc29_ = -1;
            }
            else if(_loc29_ > 1)
            {
               _loc29_ = 1;
            }
            _loc19_ = Math.acos(_loc29_) * param5;
            _loc30_ = _loc17_ + _loc27_ * _loc29_;
            _loc31_ = _loc27_ * Math.sin(_loc19_);
            _loc18_ = Math.atan2(param4 * _loc30_ - param3 * _loc31_,param3 * _loc30_ + param4 * _loc31_);
         }
         else
         {
            _loc32_ = _loc17_;
            _loc33_ = param3 - _loc8_.x;
            _loc34_ = param4 - _loc8_.y;
            _loc35_ = param2.length * param2._1724.scaleX;
            _loc36_ = _loc12_ * _loc35_;
            _loc37_ = _loc13_ * _loc35_;
            _loc38_ = Math.atan2(_loc34_,_loc33_);
            _loc39_ = _loc36_ * _loc36_;
            _loc40_ = _loc37_ * _loc37_;
            _loc41_ = _loc32_ * _loc32_;
            _loc42_ = _loc33_ * _loc33_ + _loc34_ * _loc34_;
            _loc43_ = _loc40_ * _loc41_ + _loc39_ * _loc42_ - _loc39_ * _loc40_;
            _loc44_ = -2 * _loc40_ * _loc32_;
            _loc45_ = _loc40_ - _loc39_;
            _loc46_ = _loc44_ * _loc44_ - 4 * _loc45_ * _loc43_;
            if(_loc46_ >= 0)
            {
               _loc59_ = Math.sqrt(_loc46_);
               if(_loc44_ < 0)
               {
                  _loc59_ = -_loc59_;
               }
               _loc59_ = -(_loc44_ + _loc59_) / 2;
               _loc60_ = _loc59_ / _loc45_;
               _loc61_ = _loc43_ / _loc59_;
               _loc62_ = Math.abs(_loc60_) < Math.abs(_loc61_) ? _loc60_ : _loc61_;
               if(_loc62_ * _loc62_ <= _loc42_)
               {
                  _loc63_ = Math.sqrt(_loc42_ - _loc62_ * _loc62_) * param5;
                  _loc18_ = _loc38_ - Math.atan2(_loc63_,_loc62_);
                  _loc19_ = Math.atan2(_loc63_ / _loc13_,(_loc62_ - _loc32_) / _loc12_);
               }
               §§goto(addr710);
            }
            _loc47_ = 0;
            _loc48_ = Number.MAX_VALUE;
            _loc49_ = 0;
            _loc50_ = 0;
            _loc51_ = 0;
            _loc52_ = 0;
            _loc53_ = 0;
            _loc54_ = 0;
            _loc55_ = _loc32_ + _loc36_;
            _loc56_ = _loc55_ * _loc55_;
            if(_loc56_ > _loc52_)
            {
               _loc51_ = 0;
               _loc52_ = _loc56_;
               _loc53_ = _loc55_;
            }
            _loc55_ = _loc32_ - _loc36_;
            _loc56_ = _loc55_ * _loc55_;
            if(_loc56_ < _loc48_)
            {
               _loc47_ = Math.PI;
               _loc48_ = _loc56_;
               _loc49_ = _loc55_;
            }
            _loc57_ = Math.acos(-_loc36_ * _loc32_ / (_loc39_ - _loc40_));
            _loc55_ = _loc36_ * Math.cos(_loc57_) + _loc32_;
            _loc58_ = _loc37_ * Math.sin(_loc57_);
            _loc56_ = _loc55_ * _loc55_ + _loc58_ * _loc58_;
            if(_loc56_ < _loc48_)
            {
               _loc47_ = _loc57_;
               _loc48_ = _loc56_;
               _loc49_ = _loc55_;
               _loc50_ = _loc58_;
            }
            if(_loc56_ > _loc52_)
            {
               _loc51_ = _loc57_;
               _loc52_ = _loc56_;
               _loc53_ = _loc55_;
               _loc54_ = _loc58_;
            }
            if(_loc42_ <= (_loc48_ + _loc52_) / 2)
            {
               _loc18_ = _loc38_ - Math.atan2(_loc50_ * param5,_loc49_);
               _loc19_ = _loc47_ * param5;
            }
            else
            {
               _loc18_ = _loc38_ - Math.atan2(_loc54_ * param5,_loc53_);
               _loc19_ = _loc51_ * param5;
            }
         }
         addr710:
         var _loc23_:Number = param2._1724.x;
         var _loc24_:Number = param2._1724.y * _loc13_;
         var _loc25_:Number = Math.atan2(_loc24_,_loc23_) * _loc20_;
         _loc7_.x = _loc18_ - _loc25_ + _loc21_;
         _loc7_.y = (_loc19_ + _loc25_) * _loc20_ + _loc22_;
         _loc7_.x = this.normalize(_loc7_.x);
         _loc7_.y = this.normalize(_loc7_.y);
         return _loc7_;
      }
      
      private function normalize(param1:Number) : Number
      {
         if(param1 > Math.PI)
         {
            param1 -= Math.PI * 2;
         }
         else if(param1 < -Math.PI)
         {
            param1 += Math.PI * 2;
         }
         return param1;
      }
      
      public function get _14311() : Number
      {
         if(this._2133 >= 0)
         {
            return this._2133;
         }
         if(this._1903 && this._1903._13680 is _14034 && this._1903._13680._13664)
         {
            return (this._1903._13680 as _14034)._14279;
         }
         return this._weight;
      }
      
      public function get weight() : Number
      {
         return this._weight;
      }
      
      public function set weight(param1:Number) : void
      {
         this._weight = param1;
      }
      
      public function get _14310() : int
      {
         if(this._2134 != 0)
         {
            return this._2134;
         }
         if(this._1903 && this._1903._13680 is _14034 && this._1903._13680._13664)
         {
            return (this._1903._13680 as _14034).bend;
         }
         return this._2137;
      }
      
      public function get bendDirection() : int
      {
         return this._2137;
      }
      
      public function set bendDirection(param1:int) : void
      {
         this._2137 = param1;
      }
      
      public function get target() : _52
      {
         return this._target;
      }
      
      public function set target(param1:_52) : void
      {
         this._target = param1;
      }
      
      public function get bones() : Vector.<_52>
      {
         return this._2138;
      }
      
      public function set bones(param1:Vector.<_52>) : void
      {
         this._2138 = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get rootBone() : _52
      {
         return this.bones[0];
      }
   }
}

