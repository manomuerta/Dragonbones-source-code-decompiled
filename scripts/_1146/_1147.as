package _1146
{
   import _1148._1149;
   import _1148._1150;
   import _1155.Linear;
   import _1162._1163;
   import _1177.EffectEvent;
   import avmplus.getQualifiedClassName;
   import egret.core.ns_egret;
   import flash.geom.Point;
   import flash.utils.Dictionary;
   
   use namespace ns_egret;
   
   public class _1147 extends _1145
   {
      private static var _8479:Linear = new Linear();
      
      private static var _8773:Dictionary = new Dictionary(true);
      
      private static var _8766:Dictionary = new Dictionary(true);
      
      public var _8768:Boolean = false;
      
      public var _8779:Number;
      
      public var _8780:Number;
      
      public function _1147(param1:Object = null)
      {
         super(param1);
         _8757 = _1163;
      }
      
      private static function _8772(param1:_1176, param2:Object) : _1172
      {
         var _loc3_:Dictionary = null;
         if(param1 != null)
         {
            _loc3_ = Dictionary(_8773[param1]);
            if(_loc3_ != null)
            {
               return _loc3_[param2];
            }
         }
         return null;
      }
      
      private static function _8767(param1:_1176, param2:Object) : void
      {
         var _loc3_:Dictionary = null;
         if(param1 != null)
         {
            _loc3_ = _8773[param1];
            if(!_loc3_)
            {
               return;
            }
            if(_loc3_[param2])
            {
               delete _loc3_[param2];
               _8766[param1] = _8766[param1] - 1;
               if(_8766[param1] <= 0)
               {
                  delete _8773[param1];
                  delete _8766[param1];
               }
            }
         }
      }
      
      private static function _8769(param1:_1176, param2:Object, param3:_1172) : void
      {
         var _loc4_:Dictionary = null;
         if(param1 != null)
         {
            _loc4_ = _8773[param1];
            if(!_loc4_)
            {
               _loc4_ = new Dictionary();
               _8773[param1] = _loc4_;
            }
            if(!_loc4_[param2])
            {
               if(!_8766[param1])
               {
                  _8766[param1] = 1;
               }
               else
               {
                  _8766[param1] += 1;
               }
            }
            _loc4_[param2] = param3;
         }
      }
      
      private function _8764() : _1176
      {
         var _loc1_:_1176 = null;
         var _loc2_:Effect = ns_egret::_8765;
         while(_loc2_)
         {
            if(_loc2_ is Sequence)
            {
               break;
            }
            _loc1_ = _1176(_loc2_);
            _loc2_ = _loc2_.ns_egret::_8765;
         }
         return _loc1_;
      }
      
      override public function _8777(param1:Object = null) : _1172
      {
         var _loc4_:_1172 = null;
         if(!param1)
         {
            param1 = this.target;
         }
         var _loc2_:_1172 = null;
         var _loc3_:_1176 = this._8764();
         if(_loc3_ != null)
         {
            _loc2_ = _1172(_8772(_loc3_,param1));
         }
         if(!_loc2_)
         {
            _loc4_ = super._8777(param1);
            if(_loc3_)
            {
               _8769(_loc3_,param1,_loc4_);
            }
            return _loc4_;
         }
         this._8760(_loc2_);
         return null;
      }
      
      override protected function _8771(param1:EffectEvent) : void
      {
         super._8771(param1);
         var _loc2_:_1176 = this._8764();
         if(_loc2_ != null)
         {
            _8767(_loc2_,param1._8775.target);
         }
      }
      
      private function _8763(param1:Object, param2:Object = null) : Point
      {
         var _loc3_:Point = null;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         if(this._8768)
         {
            _loc4_ = param2 != null && param2["width"] !== undefined ? Number(param2["width"]) : Number(param1.width);
            _loc5_ = param2 != null && param2["height"] !== undefined ? Number(param2["height"]) : Number(param1.height);
            _loc3_ = new Point(_loc4_ / 2,_loc5_ / 2);
         }
         else
         {
            _loc3_ = new Point(0,0);
            if(!isNaN(this._8779))
            {
               _loc3_.x = this._8779;
            }
            if(!isNaN(this._8780))
            {
               _loc3_.y = this._8780;
            }
         }
         return _loc3_;
      }
      
      private function _8776(param1:Vector.<_1149>, param2:_1149) : void
      {
         var _loc3_:int = 0;
         while(_loc3_ < param1.length)
         {
            if(param1[_loc3_].time > param2.time)
            {
               param1.splice(_loc3_,0,param2);
               return;
            }
            _loc3_++;
         }
         param1.push(param2);
      }
      
      ns_egret function _8778(param1:String, param2:Number = NaN, param3:Number = NaN, param4:Number = NaN) : void
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:_1150 = null;
         var _loc9_:int = 0;
         if(isNaN(param2))
         {
            if(!isNaN(param3) && !isNaN(param4))
            {
               param2 = param3 - param4;
            }
         }
         var _loc5_:_1150;
         (_loc5_ = new _1150(param1))._8781 = new <_1149>[new _1149(0,param2),new _1149(duration,param3,param4)];
         _loc5_._8781[1]._3772 = _3772;
         if(motionPaths)
         {
            _loc6_ = int(motionPaths.length);
            _loc7_ = 0;
            while(_loc7_ < _loc6_)
            {
               _loc8_ = _1150(motionPaths[_loc7_]);
               if(_loc8_.property == _loc5_.property)
               {
                  _loc9_ = 0;
                  while(_loc9_ < _loc5_._8781.length)
                  {
                     this._8776(_loc8_._8781,_loc5_._8781[_loc9_]);
                     _loc9_++;
                  }
                  return;
               }
               _loc7_++;
            }
         }
         else
         {
            motionPaths = new Vector.<_1150>();
         }
         motionPaths.push(_loc5_);
      }
      
      override protected function _8760(param1:_1172) : void
      {
         var _loc2_:int = 0;
         var _loc7_:Array = null;
         var _loc8_:Number = NaN;
         var _loc9_:_1150 = null;
         var _loc10_:int = 0;
         var _loc11_:_1149 = null;
         var _loc3_:Number = duration;
         var _loc4_:_1163 = _1163(param1);
         if(motionPaths)
         {
            _loc7_ = [];
            _loc2_ = 0;
            while(_loc2_ < motionPaths.length)
            {
               _loc7_[_loc2_] = motionPaths[_loc2_].clone();
               _loc9_ = _1150(_loc7_[_loc2_]);
               if(_loc9_._8781)
               {
                  _loc10_ = 0;
                  while(_loc10_ < _loc9_._8781.length)
                  {
                     _loc11_ = _1149(_loc9_._8781[_loc10_]);
                     if(isNaN(_loc11_.time))
                     {
                        _loc11_.time = duration;
                     }
                     if(startDelay != 0)
                     {
                        _loc11_.time += startDelay;
                     }
                     _loc10_++;
                  }
                  _loc3_ = Math.max(_loc3_,_loc9_._8781[_loc9_._8781.length - 1].time);
               }
               _loc2_++;
            }
            _loc8_ = this._8770();
            _loc2_ = 0;
            while(_loc2_ < _loc7_.length)
            {
               _loc4_._8778(_loc7_[_loc2_],_loc8_);
               _loc2_++;
            }
         }
         if(_loc4_.initialized)
         {
            return;
         }
         _loc4_.initialized = true;
         if(!this._8768)
         {
            _loc4_._8774 = this._8763(param1.target);
         }
         _loc4_._8768 = this._8768;
         var _loc5_:Number = startDelay;
         startDelay = 0;
         var _loc6_:Vector.<_1150> = motionPaths;
         motionPaths = null;
         super._8760(param1);
         startDelay = _loc5_;
         motionPaths = _loc6_;
         _loc4_.duration = Math.max(duration,_loc3_);
         if(getQualifiedClassName(this) != getQualifiedClassName(_1147))
         {
            _loc4_._3772 = _8479;
         }
      }
      
      private function _8770() : Number
      {
         var _loc3_:Sequence = null;
         var _loc4_:int = 0;
         var _loc5_:Effect = null;
         var _loc1_:Number = 0;
         var _loc2_:Effect = ns_egret::_8765;
         while(_loc2_)
         {
            _loc1_ += _loc2_.startDelay;
            if(_loc2_ is Sequence)
            {
               _loc3_ = Sequence(_loc2_);
               _loc4_ = 0;
               while(_loc4_ < _loc3_.children.length)
               {
                  _loc5_ = _loc3_.children[_loc4_];
                  if(_loc5_ == this)
                  {
                     break;
                  }
                  if(_loc5_ is _1153)
                  {
                     _loc1_ += _1153(_loc5_)._8310;
                  }
                  else
                  {
                     _loc1_ += _loc5_.startDelay + _loc5_.duration * _loc5_.repeatCount + (_loc5_.repeatDelay + (_loc5_.repeatCount - 1));
                  }
                  _loc4_++;
               }
            }
            _loc2_ = _loc2_.ns_egret::_8765;
         }
         return _loc1_;
      }
   }
}

