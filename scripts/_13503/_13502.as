package _13503
{
   import _13492._13496;
   import _13505._13504;
   import _13505._13506;
   import _13505._13507;
   import _13505._13508;
   import _13505._13509;
   import _13505._13510;
   import _13505._14035;
   import _51._50;
   import _51._52;
   import _51._70;
   import _51._77;
   import _51._79;
   import _73._74;
   import _81._90;
   import flash.utils.Dictionary;
   
   public class _13502 extends _13510 implements _90
   {
      private var _1865:Dictionary;
      
      private var _1864:Dictionary;
      
      private var _1867:Dictionary;
      
      private var _14303:Dictionary;
      
      private var _name:String;
      
      public var rootArmatureData:_50;
      
      public var frameRate:Number;
      
      public var fadeInTime:Number = 0;
      
      public var playTimes:int;
      
      public var _1746:Array;
      
      public var _1745:Array;
      
      public var _1753:Array;
      
      public var _14271:Array;
      
      public var _10657:_13509;
      
      public var _13597:_13506;
      
      private var _1892:int = 0;
      
      public var tweenEasing:Number;
      
      public var autoTween:Boolean;
      
      public function _13502(param1:Array = null)
      {
         this._1865 = new Dictionary();
         this._1864 = new Dictionary();
         this._1867 = new Dictionary();
         this._14303 = new Dictionary();
         super(param1);
         flag = FLAG_ANIMATION;
         this._14271 = [];
      }
      
      public static function _1869(param1:String, param2:Array = null) : _13502
      {
         var _loc3_:_13502 = new _13502(param2);
         _loc3_.name = param1;
         return _loc3_;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      override public function get duration() : int
      {
         this._13676();
         return this._1892;
      }
      
      public function set duration(param1:int) : void
      {
         this._1892 = param1;
      }
      
      public function _1874() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:_13504 = null;
         var _loc4_:_13508 = null;
         var _loc5_:_13507 = null;
         var _loc6_:_14035 = null;
         _loc1_ = 0;
         _loc2_ = int(this._1746.length);
         while(_loc1_ < _loc2_)
         {
            _loc3_ = this._1746[_loc1_];
            if(_loc3_)
            {
               _loc3_._1894();
            }
            _loc1_++;
         }
         _loc1_ = 0;
         _loc2_ = int(this._1745.length);
         while(_loc1_ < _loc2_)
         {
            _loc4_ = this._1745[_loc1_];
            if(_loc4_)
            {
               _loc4_._1895();
            }
            _loc1_++;
         }
         if(this._1753)
         {
            _loc1_ = 0;
            _loc2_ = int(this._1753.length);
            while(_loc1_ < _loc2_)
            {
               _loc5_ = this._1753[_loc1_];
               if(_loc5_)
               {
                  _loc5_._1893();
               }
               _loc1_++;
            }
         }
         if(this._14271)
         {
            _loc1_ = 0;
            _loc2_ = int(this._14271.length);
            while(_loc1_ < _loc2_)
            {
               _loc6_ = this._14271[_loc1_];
               if(_loc6_)
               {
                  _loc6_._14307();
               }
               _loc1_++;
            }
         }
      }
      
      public function _1868() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:_13504 = null;
         var _loc4_:_13508 = null;
         var _loc5_:_13507 = null;
         var _loc6_:_14035 = null;
         _loc1_ = 0;
         _loc2_ = int(this._1746.length);
         while(_loc1_ < _loc2_)
         {
            _loc3_ = this._1746[_loc1_];
            if(_loc3_)
            {
               _loc3_._1888();
            }
            _loc1_++;
         }
         _loc1_ = 0;
         _loc2_ = int(this._1745.length);
         while(_loc1_ < _loc2_)
         {
            _loc4_ = this._1745[_loc1_];
            if(_loc4_)
            {
               _loc4_._1889();
            }
            _loc1_++;
         }
         if(this._1753)
         {
            _loc1_ = 0;
            _loc2_ = int(this._1753.length);
            while(_loc1_ < _loc2_)
            {
               _loc5_ = this._1753[_loc1_];
               if(_loc5_)
               {
                  _loc5_._1887();
               }
               _loc1_++;
            }
         }
         if(this._14271)
         {
            _loc1_ = 0;
            _loc2_ = int(this._14271.length);
            while(_loc1_ < _loc2_)
            {
               _loc6_ = this._14271[_loc1_];
               if(_loc6_)
               {
                  _loc6_._14306();
               }
               _loc1_++;
            }
         }
         if(this._10657)
         {
            this._10657._10661();
         }
      }
      
      override public function _1858(param1:Number) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:_13504 = null;
         var _loc5_:_13508 = null;
         var _loc6_:_13507 = null;
         var _loc7_:_14035 = null;
         if(this._1746)
         {
            _loc2_ = 0;
            _loc3_ = int(this._1746.length);
            while(_loc2_ < _loc3_)
            {
               _loc4_ = this._1746[_loc2_];
               if(_loc4_)
               {
                  _loc4_._1858(param1);
               }
               _loc2_++;
            }
         }
         if(this._1745)
         {
            _loc2_ = 0;
            _loc3_ = int(this._1745.length);
            while(_loc2_ < _loc3_)
            {
               _loc5_ = this._1745[_loc2_];
               if(_loc5_)
               {
                  _loc5_._1858(param1);
               }
               _loc2_++;
            }
         }
         if(this._1753)
         {
            _loc2_ = 0;
            _loc3_ = int(this._1753.length);
            while(_loc2_ < _loc3_)
            {
               _loc6_ = this._1753[_loc2_];
               if(_loc6_)
               {
                  _loc6_._1858(param1);
               }
               _loc2_++;
            }
         }
         if(this._14271)
         {
            _loc2_ = 0;
            _loc3_ = int(this._14271.length);
            while(_loc2_ < _loc3_)
            {
               _loc7_ = this._14271[_loc2_];
               if(_loc7_)
               {
                  _loc7_._1858(param1);
               }
               _loc2_++;
            }
         }
         if(this._10657)
         {
            this._10657._1858(param1);
         }
      }
      
      public function _1873(param1:_52) : _13504
      {
         var _loc2_:int = 0;
         var _loc3_:int = int(this._1746.length);
         while(_loc2_ < _loc3_)
         {
            if(this._1746[_loc2_]._1823 == param1)
            {
               return this._1746[_loc2_];
            }
            _loc2_++;
         }
         return null;
      }
      
      public function _1860(param1:String) : _13504
      {
         var _loc2_:int = 0;
         var _loc3_:int = int(this._1746.length);
         while(_loc2_ < _loc3_)
         {
            if(this._1746[_loc2_]._1823.name == param1)
            {
               return this._1746[_loc2_];
            }
            _loc2_++;
         }
         return null;
      }
      
      public function _1875(param1:_79) : _13508
      {
         var _loc2_:int = 0;
         var _loc3_:int = int(this._1745.length);
         while(_loc2_ < _loc3_)
         {
            if(this._1745[_loc2_]._1824 == param1)
            {
               return this._1745[_loc2_];
            }
            _loc2_++;
         }
         return null;
      }
      
      public function _1859(param1:String) : _13508
      {
         var _loc2_:int = 0;
         var _loc3_:int = int(this._1745.length);
         while(_loc2_ < _loc3_)
         {
            if(this._1745[_loc2_]._1824.name == param1)
            {
               return this._1745[_loc2_];
            }
            _loc2_++;
         }
         return null;
      }
      
      public function _1881(param1:_70) : _13507
      {
         var _loc2_:int = 0;
         var _loc3_:int = int(this._1753.length);
         while(_loc2_ < _loc3_)
         {
            if(this._1753[_loc2_]._1826 == param1)
            {
               return this._1753[_loc2_];
            }
            _loc2_++;
         }
         return null;
      }
      
      public function _1862(param1:String, param2:String) : _13507
      {
         var _loc3_:_13507 = null;
         var _loc4_:int = 0;
         var _loc5_:int = int(this._1753.length);
         while(_loc4_ < _loc5_)
         {
            _loc3_ = this._1753[_loc4_] as _13507;
            if(_loc3_._1826._1760.name == param2 && _loc3_._1826.name == param1)
            {
               return _loc3_;
            }
            _loc4_++;
         }
         return null;
      }
      
      public function _14300(param1:_52) : _14035
      {
         var _loc2_:int = 0;
         var _loc3_:int = int(this._14271.length);
         while(_loc2_ < _loc3_)
         {
            if(this._14271[_loc2_]._2942.target == param1)
            {
               return this._14271[_loc2_];
            }
            _loc2_++;
         }
         return null;
      }
      
      public function _14304(param1:_77) : _14035
      {
         var _loc2_:int = 0;
         var _loc3_:int = int(this._14271.length);
         while(_loc2_ < _loc3_)
         {
            if(this._14271[_loc2_]._2942 == param1)
            {
               return this._14271[_loc2_];
            }
            _loc2_++;
         }
         return null;
      }
      
      public function _14301(param1:String) : _14035
      {
         var _loc2_:int = 0;
         var _loc3_:int = int(this._14271.length);
         while(_loc2_ < _loc3_)
         {
            if(this._14271[_loc2_]._2942.name == param1)
            {
               return this._14271[_loc2_];
            }
            _loc2_++;
         }
         return null;
      }
      
      private function _13676() : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc1_:Array = this._13675();
         this._1892 = 0;
         _loc2_ = 0;
         _loc3_ = int(_loc1_.length);
         while(_loc2_ < _loc3_)
         {
            _loc4_ = (_loc1_[_loc2_] as _13510).duration;
            if(_loc4_ > this._1892)
            {
               this._1892 = _loc4_;
            }
            _loc2_++;
         }
      }
      
      public function _13675() : Array
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:_13504 = null;
         var _loc4_:_13508 = null;
         var _loc5_:_13507 = null;
         var _loc6_:_14035 = null;
         var _loc7_:Array = [];
         _loc1_ = 0;
         _loc2_ = int(this._1746.length);
         while(_loc1_ < _loc2_)
         {
            _loc3_ = this._1746[_loc1_];
            if(_loc3_)
            {
               _loc7_.push(_loc3_._13581);
               _loc7_.push(_loc3_._13586);
               _loc7_.push(_loc3_._13598);
            }
            _loc1_++;
         }
         _loc1_ = 0;
         _loc2_ = int(this._1745.length);
         while(_loc1_ < _loc2_)
         {
            _loc4_ = this._1745[_loc1_];
            if(_loc4_)
            {
               _loc7_.push(_loc4_._13599);
               _loc7_.push(_loc4_._13572);
               _loc7_.push(_loc4_._13592);
            }
            _loc1_++;
         }
         if(this._1753)
         {
            _loc1_ = 0;
            _loc2_ = int(this._1753.length);
            while(_loc1_ < _loc2_)
            {
               _loc5_ = this._1753[_loc1_];
               if(_loc5_)
               {
                  _loc7_.push(_loc5_);
               }
               _loc1_++;
            }
         }
         if(this._14271)
         {
            _loc1_ = 0;
            _loc2_ = int(this._14271.length);
            while(_loc1_ < _loc2_)
            {
               _loc6_ = this._14271[_loc1_];
               if(_loc6_)
               {
                  _loc7_.push(_loc6_);
               }
               _loc1_++;
            }
         }
         if(this._13597)
         {
            _loc7_.push(this._13597);
         }
         if(this._10657)
         {
            _loc7_.push(this._10657);
         }
         return _loc7_;
      }
      
      public function _13672(param1:_52) : Array
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:_13508 = null;
         var _loc5_:Array = [];
         _loc2_ = 0;
         _loc3_ = int(this._1745.length);
         while(_loc2_ < _loc3_)
         {
            _loc4_ = this._1745[_loc2_];
            if((Boolean(_loc4_)) && _loc4_._1824.parentBoneData == param1)
            {
               _loc5_.push(_loc4_._13599);
               _loc5_.push(_loc4_._13572);
               _loc5_.push(_loc4_._13592);
            }
            _loc2_++;
         }
         return _loc5_;
      }
      
      public function _13673(param1:_52) : Array
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:_13507 = null;
         var _loc5_:Array = [];
         _loc2_ = 0;
         _loc3_ = int(this._1753.length);
         while(_loc2_ < _loc3_)
         {
            _loc4_ = this._1753[_loc2_];
            if((Boolean(_loc4_)) && _loc4_._1826._1760.parentBoneData == param1)
            {
               _loc5_.push(_loc4_);
            }
            _loc2_++;
         }
         return _loc5_;
      }
      
      public function _13674(param1:_52) : Array
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:_14035 = null;
         var _loc5_:Array = [];
         if(this._14271)
         {
            _loc2_ = 0;
            _loc3_ = int(this._14271.length);
            while(_loc2_ < _loc3_)
            {
               _loc4_ = this._14271[_loc2_];
               if((Boolean(_loc4_)) && _loc4_._2942._14305(param1))
               {
                  _loc5_.push(_loc4_);
               }
               _loc2_++;
            }
         }
         return _loc5_;
      }
      
      public function _13667() : Dictionary
      {
         var _loc2_:Array = null;
         var _loc3_:_13510 = null;
         var _loc4_:_13504 = null;
         var _loc5_:_13508 = null;
         var _loc6_:_52 = null;
         var _loc7_:_79 = null;
         var _loc8_:Boolean = false;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc1_:Dictionary = new Dictionary();
         _loc9_ = 0;
         _loc10_ = int(this._1746.length);
         while(_loc9_ < _loc10_)
         {
            _loc4_ = this._1746[_loc9_];
            if(_loc7_ = (_loc6_ = _loc4_._1823)._1882)
            {
               _loc5_ = this._1875(_loc7_);
            }
            if(Boolean(_loc4_) && Boolean(_loc5_))
            {
               _loc8_ = this._13668(_loc4_,_loc5_,_loc1_) || _loc8_;
            }
            _loc9_++;
         }
         _loc3_ = this._13597;
         _loc8_ = this._13670(_loc3_,_loc1_) || _loc8_;
         return _loc8_ ? _loc1_ : null;
      }
      
      public function _13669() : Dictionary
      {
         var _loc2_:Array = null;
         var _loc3_:_13510 = null;
         var _loc4_:_13504 = null;
         var _loc5_:_13508 = null;
         var _loc6_:Boolean = false;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc1_:Dictionary = new Dictionary();
         _loc7_ = 0;
         _loc8_ = int(this._1746.length);
         while(_loc7_ < _loc8_)
         {
            _loc4_ = this._1746[_loc7_];
            if(_loc4_)
            {
               _loc3_ = _loc4_._13581;
               _loc6_ = this._13670(_loc3_,_loc1_) || _loc6_;
               _loc3_ = _loc4_._13586;
               _loc6_ = this._13670(_loc3_,_loc1_) || _loc6_;
               _loc3_ = _loc4_._13598;
               _loc6_ = this._13670(_loc3_,_loc1_) || _loc6_;
            }
            _loc7_++;
         }
         _loc7_ = 0;
         _loc8_ = int(this._1745.length);
         while(_loc7_ < _loc8_)
         {
            _loc5_ = this._1745[_loc7_];
            if(_loc5_)
            {
               _loc3_ = _loc5_._13599;
               _loc6_ = this._13670(_loc3_,_loc1_) || _loc6_;
               _loc3_ = _loc5_._13572;
               _loc6_ = this._13670(_loc3_,_loc1_) || _loc6_;
               _loc3_ = _loc5_._13592;
               _loc6_ = this._13670(_loc3_,_loc1_) || _loc6_;
            }
            _loc7_++;
         }
         if(this._14271)
         {
            _loc7_ = 0;
            _loc8_ = int(this._14271.length);
            while(_loc7_ < _loc8_)
            {
               _loc3_ = this._14271[_loc7_];
               _loc6_ = this._13670(_loc3_,_loc1_) || _loc6_;
               _loc7_++;
            }
         }
         _loc3_ = this._10657;
         _loc6_ = this._13670(_loc3_,_loc1_) || _loc6_;
         _loc3_ = this._13597;
         _loc6_ = this._13670(_loc3_,_loc1_) || _loc6_;
         return _loc6_ ? _loc1_ : null;
      }
      
      private function _13668(param1:_13504, param2:_13508, param3:Dictionary) : Boolean
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:Array = [];
         var _loc7_:Array = [];
         var _loc8_:Array = [];
         var _loc9_:Array = [];
         var _loc10_:Array = [];
         var _loc11_:Array = [];
         var _loc12_:_13510 = param1._13581;
         var _loc13_:_13510 = param1._13586;
         var _loc14_:_13510 = param1._13598;
         var _loc15_:_13510 = param2._13599;
         var _loc16_:_13510 = param2._13572;
         var _loc17_:_13510 = param2._13592;
         if(_loc12_._1816.length == _loc13_._1816.length == _loc14_._1816.length == _loc15_._1816.length == _loc16_._1816.length == _loc17_._1816.length)
         {
            if(Boolean(_loc12_._1816) && _loc12_._1816.length > 2)
            {
               _loc4_ = 1;
               _loc5_ = int(_loc12_._1816.length);
               while(_loc4_ < _loc5_)
               {
                  if(this._13671(_loc12_._1816[_loc4_ - 1] as _13496,_loc12_._1816[_loc4_] as _13496,_loc4_ < _loc5_ - 1 ? _loc12_._1816[_loc4_ + 1] as _13496 : null) && this._13671(_loc13_._1816[_loc4_ - 1] as _13496,_loc13_._1816[_loc4_] as _13496,_loc4_ < _loc5_ - 1 ? _loc13_._1816[_loc4_ + 1] as _13496 : null) && this._13671(_loc14_._1816[_loc4_ - 1] as _13496,_loc14_._1816[_loc4_] as _13496,_loc4_ < _loc5_ - 1 ? _loc14_._1816[_loc4_ + 1] as _13496 : null) && this._13671(_loc15_._1816[_loc4_ - 1] as _13496,_loc15_._1816[_loc4_] as _13496,_loc4_ < _loc5_ - 1 ? _loc15_._1816[_loc4_ + 1] as _13496 : null) && this._13671(_loc16_._1816[_loc4_ - 1] as _13496,_loc16_._1816[_loc4_] as _13496,_loc4_ < _loc5_ - 1 ? _loc16_._1816[_loc4_ + 1] as _13496 : null) && this._13671(_loc17_._1816[_loc4_ - 1] as _13496,_loc17_._1816[_loc4_] as _13496,_loc4_ < _loc5_ - 1 ? _loc17_._1816[_loc4_ + 1] as _13496 : null))
                  {
                     _loc6_.push(_loc12_._1816[_loc4_]);
                     _loc7_.push(_loc13_._1816[_loc4_]);
                     _loc8_.push(_loc14_._1816[_loc4_]);
                     _loc9_.push(_loc15_._1816[_loc4_]);
                     _loc10_.push(_loc16_._1816[_loc4_]);
                     _loc11_.push(_loc17_._1816[_loc4_]);
                  }
                  _loc4_++;
               }
            }
            if(_loc6_.length > 0)
            {
               param3[_loc12_] = _loc6_;
               param3[_loc13_] = _loc7_;
               param3[_loc14_] = _loc8_;
               param3[_loc15_] = _loc9_;
               param3[_loc16_] = _loc10_;
               param3[_loc17_] = _loc11_;
               return true;
            }
         }
         return false;
      }
      
      private function _13670(param1:_13510, param2:Dictionary) : Boolean
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:Array = [];
         if(Boolean(param1._1816) && param1._1816.length > 2)
         {
            _loc3_ = 1;
            _loc4_ = int(param1._1816.length);
            while(_loc3_ < _loc4_)
            {
               if(this._13671(param1._1816[_loc3_ - 1] as _13496,param1._1816[_loc3_] as _13496,_loc3_ < _loc4_ - 1 ? param1._1816[_loc3_ + 1] as _13496 : null))
               {
                  _loc5_.push(param1._1816[_loc3_]);
               }
               _loc3_++;
            }
         }
         if(_loc5_.length > 0)
         {
            param2[param1] = _loc5_;
            return true;
         }
         return false;
      }
      
      public function _13671(param1:_13496, param2:_13496, param3:_13496) : Boolean
      {
         if(Boolean(param1) && Boolean(param2) && Boolean(param3))
         {
            if(param1._13663 || param2._13663)
            {
               if(param1._2207(param2) && param2._2207(param3))
               {
                  return true;
               }
            }
            else if(param1._2207(param2))
            {
               return true;
            }
         }
         return false;
      }
      
      public function _1871() : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:_13507 = null;
         var _loc8_:_14035 = null;
         var _loc9_:_13504 = null;
         var _loc10_:_13508 = null;
         var _loc11_:_52 = null;
         var _loc12_:_79 = null;
         var _loc13_:* = undefined;
         var _loc14_:* = undefined;
         var _loc15_:* = undefined;
         var _loc16_:* = undefined;
         var _loc17_:int = 0;
         var _loc18_:int = 0;
         var _loc19_:_70 = null;
         if(!this.rootArmatureData)
         {
            return;
         }
         var _loc1_:Dictionary = new Dictionary();
         var _loc2_:Dictionary = new Dictionary();
         var _loc3_:Dictionary = new Dictionary();
         var _loc4_:Dictionary = new Dictionary();
         for each(_loc9_ in this._1746)
         {
            _loc1_[_loc9_._1823] = _loc9_;
         }
         for each(_loc10_ in this._1745)
         {
            _loc2_[_loc10_._1824] = _loc10_;
         }
         _loc5_ = 0;
         _loc6_ = int(this._1753.length);
         while(_loc5_ < _loc6_)
         {
            _loc7_ = this._1753[_loc5_] as _13507;
            _loc3_[_loc7_._1826] = _loc7_;
            _loc5_++;
         }
         _loc5_ = 0;
         _loc6_ = int(this._14271.length);
         while(_loc5_ < _loc6_)
         {
            _loc4_[this._14271[_loc5_]._2942] = this._14271[_loc5_];
            _loc5_++;
         }
         for each(_loc11_ in this.rootArmatureData._1779)
         {
            if(_loc1_[_loc11_])
            {
               delete _loc1_[_loc11_];
            }
            else
            {
               this._1746.push(this._1863(_loc11_));
            }
         }
         for each(_loc12_ in this.rootArmatureData._1780)
         {
            if(_loc2_[_loc12_])
            {
               delete _loc2_[_loc12_];
            }
            else
            {
               this._1745.push(this._1861(_loc12_));
            }
            _loc17_ = 0;
            _loc18_ = int(_loc12_._1715.length);
            while(_loc17_ < _loc18_)
            {
               _loc19_ = _loc12_._1765[_loc12_._1715[_loc17_]] as _70;
               if((Boolean(_loc19_)) && _loc19_.type == _74.MESH)
               {
                  if(_loc3_[_loc19_])
                  {
                     delete _loc3_[_loc19_];
                  }
                  else
                  {
                     this._1753.push(this._1866(_loc19_));
                  }
               }
               _loc17_++;
            }
         }
         _loc5_ = 0;
         _loc6_ = int(this.rootArmatureData._1999.length);
         while(_loc5_ < _loc6_)
         {
            if(_loc4_[this.rootArmatureData._1999[_loc5_]])
            {
               delete _loc4_[this.rootArmatureData._1999[_loc5_]];
            }
            else
            {
               this._14271.push(this._14302(this.rootArmatureData._1999[_loc5_]));
            }
            _loc5_++;
         }
         for(_loc13_ in _loc1_)
         {
            _loc9_ = _loc1_[_loc13_] as _13504;
            _loc9_._1888();
            this._1865[_loc13_] = _loc9_;
            this._1746.splice(this._1746.indexOf(_loc9_),1);
         }
         for(_loc14_ in _loc2_)
         {
            _loc10_ = _loc2_[_loc14_] as _13508;
            _loc10_._1889();
            this._1864[_loc14_] = _loc10_;
            this._1745.splice(this._1745.indexOf(_loc10_),1);
         }
         for(_loc15_ in _loc3_)
         {
            _loc7_ = _loc3_[_loc15_] as _13507;
            _loc7_._1887();
            this._1867[_loc15_] = _loc7_;
            this._1753.splice(this._1753.indexOf(_loc7_),1);
         }
         for(_loc16_ in _loc4_)
         {
            _loc8_ = _loc4_[_loc16_] as _14035;
            if(_loc8_)
            {
               _loc8_._14306();
               this._14303[_loc16_] = _loc8_;
               this._14271.splice(this._14271.indexOf(_loc8_),1);
            }
         }
      }
      
      private function _1863(param1:_52) : _13504
      {
         var _loc2_:_13504 = null;
         if(this._1865[param1] is _13504)
         {
            _loc2_ = this._1865[param1] as _13504;
            this._1865[param1] = null;
         }
         else
         {
            _loc2_ = new _13504();
            _loc2_._1823 = param1;
         }
         _loc2_.parent = this;
         return _loc2_;
      }
      
      private function _1861(param1:_79) : _13508
      {
         var _loc2_:_13508 = null;
         var _loc4_:_13504 = null;
         if(this._1864[param1] is _13508)
         {
            _loc2_ = this._1864[param1] as _13508;
            this._1864[param1] = null;
         }
         else
         {
            _loc2_ = new _13508();
            _loc2_._1824 = param1;
         }
         var _loc3_:_52 = param1.parentBoneData;
         if(_loc3_)
         {
            _loc4_ = this._1873(_loc3_);
            if(_loc4_)
            {
               _loc2_.parent = _loc4_;
            }
         }
         return _loc2_;
      }
      
      private function _1866(param1:_70) : _13507
      {
         var _loc2_:_13507 = null;
         if(this._1867[param1] is _13507)
         {
            _loc2_ = this._1867[param1] as _13507;
            this._1864[param1] = null;
         }
         else
         {
            _loc2_ = new _13507();
            _loc2_._1826 = param1;
         }
         return _loc2_;
      }
      
      private function _14302(param1:_77) : _14035
      {
         var _loc2_:_14035 = null;
         if(this._14303[param1] is _14035)
         {
            _loc2_ = this._14303[param1] as _14035;
            this._14303[param1] = null;
         }
         else
         {
            _loc2_ = new _14035();
            _loc2_._2942 = param1;
         }
         return _loc2_;
      }
      
      override public function clone() : _13510
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:Array = null;
         var _loc5_:_13510 = null;
         var _loc6_:Array = null;
         var _loc7_:_13510 = null;
         var _loc8_:Array = null;
         var _loc9_:_13510 = null;
         var _loc10_:Array = null;
         var _loc11_:_13510 = null;
         var _loc1_:_13502 = new _13502();
         _loc1_.currentPosition = this.currentPosition;
         _loc1_._1870 = this._1870;
         _loc1_.name = this._name;
         _loc1_.frameRate = this.frameRate;
         _loc1_.fadeInTime = this.fadeInTime;
         _loc1_.playTimes = this.playTimes;
         if(this._1746)
         {
            _loc4_ = [];
            _loc2_ = 0;
            _loc3_ = int(this._1746.length);
            while(_loc2_ < _loc3_)
            {
               (_loc5_ = this._1746[_loc2_].clone()).parent = _loc1_;
               _loc4_.push(_loc5_);
               _loc2_++;
            }
            _loc1_._1746 = _loc4_;
         }
         if(this._1745)
         {
            _loc6_ = [];
            _loc2_ = 0;
            _loc3_ = int(this._1745.length);
            while(_loc2_ < _loc3_)
            {
               (_loc7_ = this._1745[_loc2_].clone()).parent = _loc1_;
               _loc6_.push(_loc7_);
               _loc2_++;
            }
            _loc1_._1745 = _loc6_;
         }
         if(this._1753)
         {
            _loc8_ = [];
            _loc2_ = 0;
            _loc3_ = int(this._1753.length);
            while(_loc2_ < _loc3_)
            {
               (_loc9_ = this._1753[_loc2_].clone()).parent = _loc1_;
               _loc8_.push(_loc9_);
               _loc2_++;
            }
            _loc1_._1753 = _loc8_;
         }
         if(this._14271)
         {
            _loc10_ = [];
            _loc2_ = 0;
            _loc3_ = int(this._14271.length);
            while(_loc2_ < _loc3_)
            {
               (_loc11_ = this._14271[_loc2_].clone()).parent = _loc1_;
               _loc10_.push(_loc11_);
               _loc2_++;
            }
            _loc1_._14271 = _loc10_;
         }
         if(this._10657)
         {
            _loc1_._10657 = this._10657.clone() as _13509;
            _loc1_._10657.parent = _loc1_;
         }
         if(this._13597)
         {
            _loc1_._13597 = this._13597.clone() as _13506;
            _loc1_._13597.parent = _loc1_;
         }
         return _loc1_;
      }
   }
}

