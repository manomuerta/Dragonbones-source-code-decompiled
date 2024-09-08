package _1162
{
   import _1146.Sequence;
   import _1146._1169;
   import _1146._1172;
   import egret.core.ns_egret;
   
   use namespace ns_egret;
   
   public class _1167 extends _1164
   {
      private var _8884:Number = 0;
      
      private var _8888:Array;
      
      private var _8887:int = -1;
      
      private var _8840:Boolean = false;
      
      public function _1167(param1:Object)
      {
         super(param1);
      }
      
      override ns_egret function get _8871() : Number
      {
         var _loc4_:Array = null;
         var _loc1_:Number = 0;
         var _loc2_:int = int(ns_egret::_8878.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = ns_egret::_8878[_loc3_];
            _loc1_ += _loc4_[0]._8875;
            _loc3_++;
         }
         return _loc1_;
      }
      
      override public function set _8324(param1:Number) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:int = 0;
         var _loc15_:Array = null;
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc18_:Array = null;
         super._8324 = param1;
         var _loc6_:Number = Sequence(effect)._8310;
         var _loc7_:Number = _loc6_ + startDelay + repeatDelay;
         var _loc8_:Number = _loc6_ + repeatDelay;
         var _loc9_:Number = _loc7_ + _loc8_ * (repeatCount - 1);
         if(param1 <= _loc7_)
         {
            _loc10_ = Math.min(param1 - startDelay,_loc6_);
            _8883 = 1;
         }
         else if(param1 >= _loc9_ && repeatCount != 0)
         {
            _loc10_ = _loc6_;
            _8883 = repeatCount;
         }
         else
         {
            _loc11_ = param1 - _loc7_;
            _loc10_ = _loc11_ % _loc8_;
            _loc10_ = Math.min(_loc10_,_loc6_);
            _8883 = 1 + _loc11_ / _loc8_;
         }
         if(Boolean(ns_egret::_8873) && ns_egret::_8873.length > 0)
         {
            _loc12_ = 0;
            _loc13_ = Number(ns_egret::_8873.length);
            _loc2_ = 0;
            while(_loc2_ < _loc13_)
            {
               _loc14_ = !!ns_egret::_8807 ? int(_loc13_ - 1 - _loc2_) : _loc2_;
               _loc16_ = _loc12_;
               _loc12_ = _loc17_ = _loc12_ + ns_egret::_8878[_loc14_][0]._8875;
               if(_loc16_ <= _loc10_ && _loc10_ <= _loc17_)
               {
                  ns_egret::_8874 = true;
                  if(this._8887 == _loc14_)
                  {
                     _loc3_ = 0;
                     while(_loc3_ < this._8888.length)
                     {
                        this._8888[_loc3_]._8324 = _loc10_ - _loc16_;
                        _loc3_++;
                     }
                  }
                  else if(_loc14_ < this._8887)
                  {
                     if(ns_egret::_8807)
                     {
                        _loc3_ = 0;
                        while(_loc3_ < this._8888.length)
                        {
                           this._8888[_loc3_].end();
                           _loc3_++;
                        }
                        _loc3_ = this._8887 - 1;
                        while(_loc3_ > _loc14_)
                        {
                           _loc15_ = ns_egret::_8873[_loc3_];
                           _loc4_ = 0;
                           while(_loc4_ < _loc15_.length)
                           {
                              if(ns_egret::_8807)
                              {
                                 _loc15_[_loc4_]._8807 = true;
                              }
                              _loc15_[_loc4_].play();
                              _loc15_[_loc4_].end();
                              _loc4_++;
                           }
                           _loc3_--;
                        }
                     }
                     else
                     {
                        _loc3_ = 0;
                        while(_loc3_ < this._8888.length)
                        {
                           this._8888[_loc3_]._8324 = 0;
                           this._8888[_loc3_].stop();
                           _loc3_++;
                        }
                        _loc3_ = this._8887 - 1;
                        while(_loc3_ > _loc14_)
                        {
                           _loc15_ = ns_egret::_8873[_loc3_];
                           _loc4_ = 0;
                           while(_loc4_ < _loc15_.length)
                           {
                              _loc15_[_loc4_].play();
                              _loc15_[_loc4_].stop();
                              _loc4_++;
                           }
                           _loc3_--;
                        }
                     }
                     this._8887 = _loc14_;
                     this._8885();
                     _loc4_ = 0;
                     while(_loc4_ < this._8888.length)
                     {
                        this._8888[_loc4_]._8324 = _loc10_ - _loc16_;
                        if(this._8840)
                        {
                           this._8888[_loc4_].pause();
                        }
                        _loc4_++;
                     }
                  }
                  else
                  {
                     if(ns_egret::_8807)
                     {
                        _loc3_ = 0;
                        while(_loc3_ < this._8888.length)
                        {
                           this._8888[_loc3_]._8324 = 0;
                           this._8888[_loc3_].stop();
                           _loc3_++;
                        }
                        _loc4_ = this._8887 + 1;
                        while(_loc4_ < _loc14_)
                        {
                           _loc15_ = ns_egret::_8873[_loc4_];
                           _loc5_ = 0;
                           while(_loc5_ < _loc15_.length)
                           {
                              _loc15_[_loc5_]._8324 = 0;
                              _loc15_[_loc5_].stop();
                              _loc5_++;
                           }
                           _loc4_++;
                        }
                     }
                     else
                     {
                        _loc18_ = this._8888.concat();
                        _loc3_ = 0;
                        while(_loc3_ < _loc18_.length)
                        {
                           _loc18_[_loc3_].end();
                           _loc3_++;
                        }
                        _loc4_ = this._8887 + 1;
                        while(_loc4_ < _loc14_)
                        {
                           _loc15_ = ns_egret::_8873[_loc4_];
                           _loc5_ = 0;
                           while(_loc5_ < _loc15_.length)
                           {
                              _loc15_[_loc5_].play();
                              _loc15_[_loc5_].end();
                              _loc5_++;
                           }
                           _loc4_++;
                        }
                     }
                     this._8887 = _loc14_;
                     this._8885();
                     _loc4_ = 0;
                     while(_loc4_ < this._8888.length)
                     {
                        this._8888[_loc4_]._8324 = _loc10_ - _loc16_;
                        if(this._8840)
                        {
                           this._8888[_loc4_].pause();
                        }
                        _loc4_++;
                     }
                  }
                  ns_egret::_8874 = false;
                  break;
               }
               _loc2_++;
            }
         }
      }
      
      override public function play() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:Array = null;
         this._8840 = false;
         ns_egret::_8873 = [];
         this._8887 = !!ns_egret::_8807 ? int(ns_egret::_8878.length) : -1;
         _loc1_ = int(ns_egret::_8878.length);
         _loc2_ = 0;
         while(_loc2_ < _loc1_)
         {
            _loc3_ = ns_egret::_8878[_loc2_];
            ns_egret::_8873.push(_loc3_);
            _loc2_++;
         }
         super.play();
         if(ns_egret::_8873.length == 0)
         {
            _8881();
            return;
         }
         this._8886();
      }
      
      override public function pause() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         super.pause();
         this._8840 = true;
         if(Boolean(this._8888) && this._8888.length > 0)
         {
            _loc1_ = int(this._8888.length);
            _loc2_ = 0;
            while(_loc2_ < _loc1_)
            {
               this._8888[_loc2_].pause();
               _loc2_++;
            }
         }
      }
      
      override public function stop() : void
      {
         var _loc1_:Array = null;
         var _loc2_:Array = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:Array = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:_1172 = null;
         this._8840 = false;
         if(Boolean(ns_egret::_8873) && ns_egret::_8873.length > 0)
         {
            _loc1_ = ns_egret::_8873.concat();
            ns_egret::_8873 = null;
            _loc2_ = _loc1_[this._8887];
            if(_loc2_)
            {
               _loc5_ = int(_loc2_.length);
               _loc6_ = 0;
               while(_loc6_ < _loc5_)
               {
                  _loc2_[_loc6_].stop();
                  _loc6_++;
               }
            }
            _loc3_ = int(_loc1_.length);
            _loc4_ = this._8887 + 1;
            while(_loc4_ < _loc3_)
            {
               _loc7_ = _loc1_[_loc4_];
               _loc8_ = int(_loc7_.length);
               _loc9_ = 0;
               while(_loc9_ < _loc8_)
               {
                  _loc10_ = _loc7_[_loc9_];
                  _loc10_.effect._8835(_loc10_);
                  _loc9_++;
               }
               _loc4_++;
            }
         }
         super.stop();
      }
      
      override public function resume() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         super.resume();
         this._8840 = false;
         if(Boolean(this._8888) && this._8888.length > 0)
         {
            _loc1_ = int(this._8888.length);
            _loc2_ = 0;
            while(_loc2_ < _loc1_)
            {
               this._8888[_loc2_].resume();
               _loc2_++;
            }
         }
      }
      
      override public function reverse() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         super.reverse();
         if(Boolean(this._8888) && this._8888.length > 0)
         {
            _loc1_ = int(this._8888.length);
            _loc2_ = 0;
            while(_loc2_ < _loc1_)
            {
               this._8888[_loc2_].reverse();
               _loc2_++;
            }
         }
      }
      
      override public function end() : void
      {
         var _loc1_:Array = null;
         var _loc2_:Array = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:Array = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         ns_egret::_8874 = true;
         if(Boolean(ns_egret::_8873) && ns_egret::_8873.length > 0)
         {
            _loc1_ = ns_egret::_8873.concat();
            ns_egret::_8873 = null;
            _loc2_ = _loc1_[this._8887];
            if(_loc2_)
            {
               _loc5_ = int(_loc2_.length);
               _loc6_ = 0;
               while(_loc6_ < _loc5_)
               {
                  _loc2_[_loc6_].end();
                  _loc6_++;
               }
            }
            _loc3_ = int(_loc1_.length);
            _loc4_ = this._8887 + 1;
            while(_loc4_ < _loc3_)
            {
               _loc7_ = _loc1_[_loc4_];
               _loc8_ = int(_loc7_.length);
               _loc9_ = 0;
               while(_loc9_ < _loc8_)
               {
                  _1169(_loc7_[_loc9_]).ns_egret::_8872();
                  _loc9_++;
               }
               _loc4_++;
            }
         }
         this._8840 = false;
         super.end();
      }
      
      override protected function _8877(param1:_1172) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this._8888.length)
         {
            if(param1 == this._8888[_loc2_])
            {
               this._8888.splice(_loc2_,1);
               break;
            }
            _loc2_++;
         }
         if(ns_egret::_8874)
         {
            return;
         }
         if(this._8888.length == 0)
         {
            if(false == this._8886())
            {
               _8881();
            }
         }
      }
      
      private function _8885() : void
      {
         var _loc1_:_1169 = null;
         var _loc2_:Array = ns_egret::_8873[this._8887];
         this._8888 = [];
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            _loc1_ = _loc2_[_loc3_];
            this._8888.push(_loc1_);
            _loc1_.ns_egret::_8807 = ns_egret::_8807;
            _loc1_._8837();
            _loc3_++;
         }
         this._8884 += _loc1_.ns_egret::_8875;
      }
      
      private function _8886(param1:Number = 0) : Boolean
      {
         if(!ns_egret::_8807)
         {
            if(!ns_egret::_8873 || this._8887++ >= ns_egret::_8873.length - 1)
            {
               return false;
            }
         }
         else if(this._8887-- <= 0)
         {
            return false;
         }
         this._8885();
         return true;
      }
   }
}

