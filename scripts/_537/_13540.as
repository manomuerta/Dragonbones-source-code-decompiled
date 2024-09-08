package _537
{
   import _1038._1042;
   import _13492._13496;
   import _13505._13510;
   import _13545._13544;
   import _13545._13547;
   import _13545._13548;
   import _6._7;
   import _783.TimelineNotification;
   import flash.utils.Dictionary;
   
   public class _13540 extends _7
   {
      protected var _3783:_13496;
      
      protected var _3780:Vector.<_13496>;
      
      protected var _3889:_1042;
      
      protected var _3896:_13544;
      
      protected var _3902:Vector.<_539>;
      
      protected var _3930:Vector.<_539>;
      
      protected var _3901:_539;
      
      protected var _13774:Vector.<_13496>;
      
      public function _13540()
      {
         this._3902 = new Vector.<_539>();
         this._3930 = new Vector.<_539>();
         super();
         this._3780 = new Vector.<_13496>();
      }
      
      public function set _3912(param1:_1042) : void
      {
         this._3889 = param1;
         this._3896 = this._3889.source as _13544;
      }
      
      public function stop() : void
      {
         dispose();
      }
      
      public function get _3053() : _13496
      {
         return this._3783;
      }
      
      public function set _3053(param1:_13496) : void
      {
         if(this._3783 != param1)
         {
            this._3783 = param1;
            this._3777(this._3783);
         }
      }
      
      public function get _3915() : Boolean
      {
         return this._3780.length > 0;
      }
      
      public function get _2889() : Vector.<_13496>
      {
         return this._3780;
      }
      
      public function isSelected(param1:_13496) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         return this._3780.indexOf(param1) != -1;
      }
      
      public function _13776(param1:Vector.<_13496>) : Boolean
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(param1)
         {
            _loc2_ = 0;
            _loc3_ = int(param1.length);
            while(_loc2_ < _loc3_)
            {
               if(this._3780.indexOf(param1[_loc2_]) == -1)
               {
                  return false;
               }
               _loc2_++;
            }
         }
         return true;
      }
      
      public function _3024() : void
      {
         if(this._3780.length > 0)
         {
            this._6122();
            this._3778();
         }
      }
      
      public function _2986(param1:Vector.<_13496>, param2:_13496 = null) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(param1 == null && param2 == null && this._3780.length == 0)
         {
            return;
         }
         if(Boolean(param2) && this._3780.length == 1)
         {
            if(this._3780[0] == param2)
            {
               return;
            }
         }
         this._6122();
         if(param2)
         {
            param2.selected = true;
            this._3780.push(param2);
         }
         else if(param1)
         {
            _loc3_ = 0;
            _loc4_ = int(param1.length);
            while(_loc3_ < _loc4_)
            {
               param1[_loc3_].selected = true;
               this._3780.push(param1[_loc3_]);
               _loc3_++;
            }
         }
         this._3778();
      }
      
      public function _3877(param1:Vector.<_13496>, param2:_13496 = null) : void
      {
         var _loc3_:Boolean = false;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(param2)
         {
            if(this._3780.indexOf(param2) == -1)
            {
               param2.selected = true;
               this._3780.push(param2);
               _loc3_ = true;
            }
         }
         else if(param1)
         {
            _loc4_ = 0;
            _loc5_ = int(param1.length);
            while(_loc4_ < _loc5_)
            {
               if(this._3780.indexOf(param1[_loc4_]) == -1)
               {
                  param1[_loc4_].selected = true;
                  this._3780.push(param1[_loc4_]);
                  _loc3_ = true;
               }
               _loc4_++;
            }
         }
         if(_loc3_)
         {
            this._3778();
         }
      }
      
      public function _3876(param1:Vector.<_13496>, param2:_13496 = null) : void
      {
         var _loc3_:Boolean = false;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         if(param2)
         {
            _loc4_ = int(this._3780.indexOf(param2));
            if(_loc4_ != -1)
            {
               param2.selected = false;
               this._3780.splice(_loc4_,1);
               _loc3_ = true;
            }
         }
         else if(param1)
         {
            _loc5_ = 0;
            _loc6_ = int(param1.length);
            while(_loc5_ < _loc6_)
            {
               _loc4_ = int(this._3780.indexOf(param1[_loc5_]));
               if(_loc4_ != -1)
               {
                  param1[_loc5_].selected = false;
                  this._3780.splice(_loc4_,1);
                  _loc3_ = true;
               }
               _loc5_++;
            }
         }
         if(_loc3_)
         {
            this._3778();
         }
      }
      
      public function _3874(param1:Vector.<_13496>, param2:_13496 = null) : void
      {
         var _loc3_:Boolean = false;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(param2)
         {
            if(!this.isSelected(param2))
            {
               this._3877(null,param2);
            }
         }
         else if(param1)
         {
            _loc3_ = false;
            _loc4_ = 0;
            _loc5_ = int(param1.length);
            while(_loc4_ < _loc5_)
            {
               if(!this.isSelected(param1[_loc4_]))
               {
                  _loc3_ = true;
                  break;
               }
               _loc4_++;
            }
            if(_loc3_)
            {
               this._3877(param1,param2);
            }
            else if(param1.length != this._3780.length)
            {
               this._3875(param1,param2);
            }
         }
      }
      
      public function _3875(param1:Vector.<_13496>, param2:_13496 = null) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(param2)
         {
            _loc3_ = int(this._3780.indexOf(param2));
            if(_loc3_ != -1)
            {
               param2.selected = false;
               this._3780.splice(_loc3_,1);
            }
            else
            {
               param2.selected = true;
               this._3780.push(param2);
            }
         }
         else if(param1)
         {
            _loc4_ = 0;
            _loc5_ = int(param1.length);
            while(_loc4_ < _loc5_)
            {
               _loc3_ = int(this._3780.indexOf(param1[_loc4_]));
               if(_loc3_ != -1)
               {
                  param1[_loc4_].selected = false;
                  this._3780.splice(_loc3_,1);
               }
               else
               {
                  param1[_loc4_].selected = true;
                  this._3780.push(param1[_loc4_]);
               }
               _loc4_++;
            }
         }
         this._3778();
      }
      
      private function _6122() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         _loc1_ = 0;
         _loc2_ = int(this._3780.length);
         while(_loc1_ < _loc2_)
         {
            this._3780[_loc1_].selected = false;
            _loc1_++;
         }
         this._3780.length = 0;
      }
      
      protected function _3777(param1:_13496) : void
      {
      }
      
      protected function _3778() : void
      {
         _1567(new TimelineNotification(TimelineNotification.UPDATE_SELECT_FRAMES));
      }
      
      public function _13775() : void
      {
         this._13774 = this._3780.concat();
      }
      
      public function _3900(param1:int, param2:int, param3:int, param4:int, param5:int, param6:Boolean) : Boolean
      {
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:_13547 = null;
         var _loc15_:_13548 = null;
         var _loc16_:Vector.<_13547> = null;
         var _loc14_:Vector.<_13496> = new Vector.<_13496>();
         _loc7_ = 0;
         while(_loc7_ < param4)
         {
            if(param3 == -1)
            {
               _loc15_ = this._3896;
            }
            else
            {
               _loc15_ = this._3889.getItemAt(_loc7_ + param3) as _13548;
            }
            if(_loc15_)
            {
               _loc16_ = _loc15_._1944(param1,param2);
               _loc9_ = 0;
               _loc10_ = int(_loc16_.length);
               while(_loc9_ < _loc10_)
               {
                  _loc13_ = _loc16_[_loc9_];
                  _loc11_ = 0;
                  _loc12_ = int(_loc13_.frames.length);
                  while(_loc11_ < _loc12_)
                  {
                     if(param6)
                     {
                        if(this._13774.indexOf(_loc13_.frames[_loc11_]) == -1)
                        {
                           if(_loc14_.indexOf(_loc13_.frames[_loc11_]) == -1)
                           {
                              _loc14_.push(_loc13_.frames[_loc11_]);
                           }
                        }
                     }
                     else if(_loc14_.indexOf(_loc13_.frames[_loc11_]) == -1)
                     {
                        _loc14_.push(_loc13_.frames[_loc11_]);
                     }
                     _loc11_++;
                  }
                  _loc9_++;
               }
            }
            _loc7_++;
         }
         this._3899(param5);
         this._3901._3897 = _loc14_.concat();
         this._3901.startIndex = param1;
         this._3901.endIndex = param2;
         if(param6 && Boolean(this._13774))
         {
            _loc7_ = 0;
            _loc8_ = int(this._13774.length);
            while(_loc7_ < _loc8_)
            {
               _loc14_.push(this._13774[_loc7_]);
               _loc7_++;
            }
            this._2986(_loc14_);
         }
         else
         {
            this._2986(_loc14_);
         }
         if(param6)
         {
         }
         return this._3901._3897.length > 0;
      }
      
      public function _3920() : void
      {
         var _loc1_:_13496 = null;
         var _loc2_:_13510 = null;
         var _loc3_:Vector.<_13510> = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(this._3780.length > 0)
         {
            _loc4_ = 0;
            _loc5_ = int(this._3780.length);
            while(_loc4_ < _loc5_)
            {
               this._3780[_loc4_].startDrag();
               _loc4_++;
            }
            _loc3_ = this._3906(this._3780);
            _loc4_ = 0;
            _loc5_ = int(_loc3_.length);
            while(_loc4_ < _loc5_)
            {
               _loc2_ = _loc3_[_loc4_];
               _loc2_.startDrag();
               _loc4_++;
            }
         }
      }
      
      public function _3926() : void
      {
         var _loc1_:_13496 = null;
         var _loc2_:_13510 = null;
         var _loc3_:Vector.<_13510> = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(this._3780.length > 0)
         {
            _loc4_ = 0;
            _loc5_ = int(this._3780.length);
            while(_loc4_ < _loc5_)
            {
               this._3780[_loc4_].endDrag();
               _loc4_++;
            }
            _loc3_ = this._3906(this._3780);
            _loc4_ = 0;
            _loc5_ = int(_loc3_.length);
            while(_loc4_ < _loc5_)
            {
               _loc2_ = _loc3_[_loc4_];
               _loc2_._1939();
               _loc2_.endDrag();
               _loc4_++;
            }
         }
      }
      
      public function _3921(param1:Vector.<_13496>, param2:int) : Boolean
      {
         var _loc3_:_13496 = null;
         var _loc4_:_13510 = null;
         var _loc6_:Vector.<_13510> = null;
         var _loc7_:Boolean = false;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc5_:Object = {};
         var _loc10_:int = 0;
         var _loc11_:int = int(param1.length);
         while(_loc10_ < _loc11_)
         {
            _loc3_ = param1[_loc10_];
            _loc8_ = _loc3_.duration;
            _loc3_.startPos += param2;
            _loc10_++;
         }
         _loc6_ = this._3906(param1);
         _loc10_ = 0;
         _loc11_ = int(_loc6_.length);
         while(_loc10_ < _loc11_)
         {
            _loc4_ = _loc6_[_loc10_];
            _loc4_._1939();
            _loc10_++;
         }
         this._3924(param2);
         return true;
      }
      
      public function _3927(param1:int, param2:Boolean) : Boolean
      {
         var _loc3_:Boolean = false;
         var _loc4_:_539 = null;
         var _loc5_:int = 0;
         var _loc6_:int = int(this._3902.length);
         while(_loc5_ < _loc6_)
         {
            _loc4_ = this._3902[_loc5_];
            _loc3_ = this._3919(_loc4_._3897,param1,_loc4_.startIndex,_loc4_.endIndex,param2) || _loc3_;
            if(param2)
            {
               _loc4_._3925 = _loc4_.endIndex + param1;
            }
            else
            {
               _loc4_._3923 = _loc4_.startIndex + param1;
            }
            _loc5_++;
         }
         return _loc3_;
      }
      
      public function _3919(param1:Vector.<_13496>, param2:int, param3:int, param4:int, param5:Boolean) : Boolean
      {
         var _loc6_:_13496 = null;
         var _loc7_:_13510 = null;
         var _loc9_:Vector.<_13510> = null;
         var _loc10_:Boolean = false;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc16_:int = 0;
         var _loc8_:Object = {};
         var _loc13_:Number = param2 / (param4 - param3);
         var _loc14_:int = 0;
         var _loc15_:int = int(param1.length);
         while(_loc14_ < _loc15_)
         {
            _loc6_ = param1[_loc14_];
            _loc11_ = _loc6_.duration;
            _loc16_ = param5 ? int(Math.round((_loc6_._1916 - param3) * _loc13_)) : int(Math.round((param4 - _loc6_._1916) * _loc13_));
            _loc6_.startPos = _loc6_._1916 + _loc16_;
            if(_loc6_.startPos < 0)
            {
               _loc6_.startPos = 0;
            }
            _loc12_ = _loc6_.duration;
            if((_loc11_ == 0 || _loc12_ == 0) && _loc11_ != _loc12_)
            {
               _loc10_ = true;
            }
            _loc14_++;
         }
         _loc9_ = this._3906(param1);
         _loc14_ = 0;
         _loc15_ = int(_loc9_.length);
         while(_loc14_ < _loc15_)
         {
            _loc7_ = _loc9_[_loc14_];
            _loc7_._1939();
            _loc14_++;
         }
         return _loc10_;
      }
      
      private function _3906(param1:Vector.<_13496>) : Vector.<_13510>
      {
         var _loc4_:_13510 = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc2_:Vector.<_13510> = new Vector.<_13510>();
         var _loc3_:Dictionary = new Dictionary();
         _loc5_ = 0;
         _loc6_ = int(param1.length);
         while(_loc5_ < _loc6_)
         {
            _loc4_ = param1[_loc5_].parent;
            if(_loc3_[_loc4_] == null)
            {
               _loc3_[_loc4_] = 1;
               _loc2_.push(_loc4_);
            }
            _loc5_++;
         }
         return _loc2_;
      }
      
      public function _3922() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = int(this._3902.length);
         while(_loc1_ < _loc2_)
         {
            this._3902[_loc1_]._3928();
            _loc1_++;
         }
      }
      
      public function _3924(param1:int) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = int(this._3902.length);
         while(_loc2_ < _loc3_)
         {
            this._3902[_loc2_]._3924(param1);
            _loc2_++;
         }
      }
      
      protected function _3899(param1:int) : _539
      {
         var _loc2_:int = 0;
         var _loc3_:int = int(this._3902.length);
         while(_loc2_ < _loc3_)
         {
            if(this._3902[_loc2_].id == param1)
            {
               this._3901 = this._3902[_loc2_];
               return this._3901;
            }
            _loc2_++;
         }
         if(this._3930.length > 0)
         {
            this._3901 = this._3930.pop();
         }
         else
         {
            this._3901 = new _539();
         }
         this._3901.id = param1;
         this._3902.push(this._3901);
         return this._3901;
      }
      
      public function _3904() : Dictionary
      {
         var _loc1_:_13496 = null;
         var _loc2_:_13510 = null;
         var _loc3_:Dictionary = new Dictionary();
         var _loc4_:int = 0;
         var _loc5_:int = int(this._3780.length);
         while(_loc4_ < _loc5_)
         {
            _loc1_ = this._3780[_loc4_];
            _loc2_ = _loc1_.parent;
            if(_loc3_[_loc2_] == null)
            {
               _loc3_[_loc2_] = [];
            }
            _loc3_[_loc2_].push(_loc1_);
            _loc4_++;
         }
         return _loc3_;
      }
      
      public function get _3907() : Boolean
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:_13496 = null;
         var _loc4_:_13510 = null;
         _loc1_ = 0;
         _loc2_ = int(this._3780.length);
         while(_loc1_ < _loc2_)
         {
            _loc3_ = this._3780[_loc1_];
            _loc4_ = _loc3_.parent;
            if(_loc4_._1936(_loc3_.startPos - 1).length > 0)
            {
               return true;
            }
            _loc1_++;
         }
         return false;
      }
      
      public function get _3913() : Boolean
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:_13496 = null;
         var _loc4_:_13510 = null;
         _loc1_ = 0;
         _loc2_ = int(this._3780.length);
         while(_loc1_ < _loc2_)
         {
            _loc3_ = this._3780[_loc1_];
            if(_loc3_.startPos == 0)
            {
               return false;
            }
            _loc1_++;
         }
         return this._3780.length > 0;
      }
      
      public function _3903() : Dictionary
      {
         var _loc1_:_13496 = null;
         var _loc2_:_13510 = null;
         var _loc6_:* = 0;
         var _loc7_:Object = null;
         var _loc3_:Dictionary = new Dictionary();
         var _loc4_:int = 0;
         var _loc5_:int = int(this._3780.length);
         while(_loc4_ < _loc5_)
         {
            _loc1_ = this._3780[_loc4_];
            _loc2_ = _loc1_.parent;
            if(_loc2_ != null)
            {
               if(_loc3_[_loc2_] == null)
               {
                  _loc3_[_loc2_] = _loc1_.startPos;
               }
               else if(_loc3_[_loc2_] > _loc1_.startPos)
               {
                  _loc3_[_loc2_] = _loc1_.startPos;
               }
            }
            _loc4_++;
         }
         for(_loc7_ in _loc3_)
         {
            _loc2_ = _loc7_ as _13510;
            if(_loc2_)
            {
               _loc6_ = int(_loc3_[_loc2_]);
               _loc6_ = _loc6_ - 1;
               _loc3_[_loc2_] = _loc2_._1936(_loc6_);
            }
         }
         return _loc3_;
      }
   }
}

