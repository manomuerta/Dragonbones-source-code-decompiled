package _51
{
   import _13503._13502;
   import _13505._13504;
   import _35.HashObject;
   import _40._39;
   import _54._53;
   import _721._763;
   import _724._13550;
   import _73.SymbolType;
   import _73._74;
   import _755._757;
   import _81._84;
   import _978.Timeline;
   import flash.geom.Rectangle;
   import flash.utils.Dictionary;
   
   public class _50 extends HashObject
   {
      private static var _1833:Object;
      
      public var name:String;
      
      public var _1811:SymbolType;
      
      public var _1795:_78;
      
      public var _1779:Array;
      
      public var _1780:Array;
      
      public var _1999:Array;
      
      public var _1781:Array;
      
      public var _1963:Array;
      
      public var _13619:Array;
      
      public var currentAnimation:String;
      
      public var frameRate:uint;
      
      public var _1763:_53;
      
      public var _10662:Array;
      
      public var _10658:Array;
      
      public var _10659:Array;
      
      public var _10665:Boolean;
      
      public var playTimes:int = 0;
      
      private var _1964:String;
      
      public var _2000:_763;
      
      public var aabb:Rectangle;
      
      private var _1998:Vector.<Vector.<_52>>;
      
      private var _1973:_78;
      
      private var _13654:Object;
      
      private var _13653:int;
      
      private var _13652:String;
      
      public function _50(param1:int = 0, param2:Object = null)
      {
         this._1795 = _78._1782("",-1);
         this._1779 = [];
         this._1780 = [];
         this._1999 = [];
         this._1781 = [];
         this._1963 = [];
         this._13619 = [];
         this.frameRate = Timeline.DEFAULT_FPS;
         this._1998 = new Vector.<Vector.<_52>>();
         super(param1,param2);
         this._1973 = this._1795;
      }
      
      public static function _1782(param1:String, param2:SymbolType, param3:int = 0, param4:Object = null) : _50
      {
         var _loc5_:_50;
         (_loc5_ = new _50(param3,param4)).name = param1;
         _loc5_._1811 = param2;
         _loc5_._10654();
         return _loc5_;
      }
      
      public function _1794(param1:_52) : void
      {
         param1.rootArmatureData = this;
         _84._1979(param1,this._1779);
         this._1871();
      }
      
      public function _1983(param1:_52) : void
      {
         var _loc4_:_77 = null;
         var _loc2_:_77 = this._1966(param1);
         if(_loc2_)
         {
            this._1991(_loc2_);
         }
         var _loc3_:Array = this._1981(param1);
         if(_loc3_.length)
         {
            for each(_loc4_ in _loc3_)
            {
               this._1991(_loc4_);
            }
         }
         param1.parentBoneData = null;
         _84._1958(param1,this._1779);
         this._1871();
      }
      
      public function _1793(param1:String) : Boolean
      {
         return _84._1961(param1,this._1779);
      }
      
      public function _1810(param1:String) : _52
      {
         var _loc2_:_52 = null;
         for each(_loc2_ in this._1779)
         {
            if(_loc2_.name == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function _1959(param1:String) : Boolean
      {
         return _84._1961(param1,this._1999);
      }
      
      public function _1741() : void
      {
         var _loc1_:_52 = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         _1833 = {};
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = int(this._1779.length);
         while(_loc3_ < _loc4_)
         {
            _loc1_ = this._1779[_loc3_];
            _loc5_ = _loc1_.id;
            if(!_loc1_.parentBoneData)
            {
               _1833[_loc5_] = 1;
               _loc2_ = 0;
            }
            else
            {
               _loc6_ = _loc1_.parentBoneData.id;
               if(_1833[_loc6_])
               {
                  _1833[_loc5_] = _1833[_loc6_] + 1;
                  _loc2_ = 0;
               }
               else
               {
                  this._1779.splice(_loc3_,1);
                  this._1779.push(_loc1_);
                  _loc3_--;
                  _loc2_++;
                  if(_loc2_ >= _loc4_)
                  {
                     throw Error("invalid BoneDataList");
                  }
               }
            }
            _loc3_++;
         }
         this._1779.sort(this._1993);
         this._1968();
      }
      
      public function _1871() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = int(this._13619.length);
         while(_loc1_ < _loc2_)
         {
            (this._13619[_loc1_] as _13502)._1871();
            _loc1_++;
         }
      }
      
      public function _1792(param1:_79) : void
      {
         var _loc2_:_78 = null;
         if(this._1811 == SymbolType.MC || this._1811 == SymbolType.STAGE || this._1811 == SymbolType.COMIC || this._1811 == SymbolType.SHEET)
         {
            param1.parentBoneData._1882 = param1;
         }
         if(param1._1995)
         {
            for each(_loc2_ in this._1781)
            {
               if(_loc2_._1765[param1] == null)
               {
                  _loc2_._1765[param1] = new Dictionary();
               }
            }
         }
         else if(this._1795._1765[param1] == null)
         {
            this._1795._1765[param1] = new Dictionary();
         }
         _84._1979(param1,this._1780);
         this._1871();
      }
      
      public function _1822(param1:_77) : void
      {
         this._1999.push(param1);
         param1.target._1957 = true;
         if(param1.bones.length == 2)
         {
            param1.bones[0]._1980 = true;
            param1.bones[1]._1980 = true;
            param1.bones[0]._14274 = param1.name;
            param1.bones[1]._14274 = param1.name;
         }
         else
         {
            param1.bones[0]._1980 = true;
            param1.bones[0]._14274 = param1.name;
         }
         this._1982();
         this._1871();
      }
      
      public function _1991(param1:_77) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this._1999.length)
         {
            if(this._1999[_loc2_].name == param1.name)
            {
               if(param1.bones.length == 2)
               {
                  param1.bones[0]._1980 = false;
                  param1.bones[1]._1980 = false;
                  param1.bones[0]._14274 = null;
                  param1.bones[1]._14274 = null;
               }
               else
               {
                  param1.bones[0]._1980 = false;
                  param1.bones[0]._14274 = null;
               }
               this._1999.splice(_loc2_,1);
               if(this._1981(param1.target).length > 0)
               {
                  param1.target._1957 = true;
               }
               else
               {
                  param1.target._1957 = false;
               }
            }
            _loc2_++;
         }
         this._1982();
         this._1871();
      }
      
      public function _1986(param1:_79, param2:int) : void
      {
         var _loc3_:_78 = null;
         if(this._1811 == SymbolType.MC || this._1811 == SymbolType.STAGE || this._1811 == SymbolType.COMIC)
         {
            param1.parentBoneData._1882 = param1;
         }
         if(param1._1995)
         {
            for each(_loc3_ in this._1781)
            {
               if(_loc3_._1765[param1] == null)
               {
                  _loc3_._1765[param1] = new Dictionary();
               }
            }
         }
         else if(this._1795._1765[param1] == null)
         {
            this._1795._1765[param1] = new Dictionary();
         }
         _84._1967(param1,this._1780,param2);
         this._1871();
      }
      
      public function _1978(param1:_79) : void
      {
         var _loc2_:_78 = null;
         var _loc3_:int = 0;
         if(param1._1995)
         {
            for each(_loc2_ in this._1781)
            {
               _loc2_._1765[param1] = null;
               delete _loc2_._1765[param1];
            }
         }
         else
         {
            this._1795._1765[param1] = null;
            delete this._1795._1765[param1];
         }
         _84._1958(param1,this._1780);
         if(this._10658)
         {
            _loc3_ = int(this._10658.indexOf(param1.name));
            if(_loc3_ >= 0)
            {
               this._10658.splice(_loc3_,1);
            }
         }
         param1.dispose();
         this._1871();
      }
      
      public function _1974(param1:_79, param2:int) : void
      {
         param2 = this._1780.length - param2 - 1;
         this._1780.splice(this._1780.indexOf(param1),1);
         this._1780.splice(param2,0,param1);
      }
      
      public function _1987(param1:_79) : int
      {
         return this._1780.indexOf(param1);
      }
      
      public function _10654() : void
      {
         this._10658 = this._10666();
      }
      
      public function _10666() : Array
      {
         var _loc1_:Array = [];
         var _loc2_:int = 0;
         var _loc3_:int = int(this._1780.length);
         while(_loc2_ < _loc3_)
         {
            _loc1_.push(this._1780[_loc2_].name);
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function _10663(param1:Array) : void
      {
         var i:int;
         var len:int;
         var d:Object = null;
         var zOrder:Array = param1;
         if(zOrder == null)
         {
            return;
         }
         if(this._10659 == null)
         {
            this._10659 = this._10658;
         }
         if(this._11747(zOrder,this._10659))
         {
            return;
         }
         this._10659 = zOrder;
         this._10665 = true;
         d = {};
         i = 0;
         len = int(zOrder.length);
         while(i < len)
         {
            d[zOrder[i]] = i;
            i++;
         }
         this._1780.sort(function(param1:_79, param2:_79):int
         {
            if(d[param1.name] == null)
            {
               return 1;
            }
            if(d[param2.name] == null)
            {
               return -1;
            }
            if(d[param1.name] < d[param2.name])
            {
               return -1;
            }
            return 1;
         });
      }
      
      private function _11747(param1:Array, param2:Array) : Boolean
      {
         if(param1 == null || param2 == null)
         {
            return false;
         }
         if(param1.length != param2.length)
         {
            return false;
         }
         var _loc3_:int = 0;
         while(_loc3_ < param1.length)
         {
            if(param1[_loc3_] != param2[_loc3_])
            {
               return false;
            }
            _loc3_++;
         }
         return true;
      }
      
      public function _1956(param1:_79) : void
      {
         if(param1._1995 == true || this._1973 == this._1795)
         {
            return;
         }
         param1._1995 = true;
         this._1973._1765[param1] = this._1795._1765[param1];
         delete this._1795._1765[param1];
      }
      
      public function _1953(param1:_79) : void
      {
         var _loc2_:_78 = null;
         if(param1._1995 == false || this._1973 == this._1795)
         {
            return;
         }
         param1._1995 = false;
         this._1795._1765[param1] = this._1973._1765[param1];
         for each(_loc2_ in this._1781)
         {
            delete _loc2_._1765[param1];
         }
      }
      
      public function _1996(param1:String) : Boolean
      {
         return _84._1961(param1,this._1780);
      }
      
      public function _11282(param1:String) : Boolean
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:_79 = null;
         var _loc5_:_70 = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         _loc2_ = 0;
         _loc3_ = int(this._1780.length);
         while(_loc2_ < _loc3_)
         {
            _loc4_ = this._1780[_loc2_] as _79;
            if(_loc4_)
            {
               _loc6_ = 0;
               _loc7_ = int(_loc4_._1715.length);
               while(_loc6_ < _loc7_)
               {
                  _loc5_ = _loc4_._1765[_loc4_._1715[_loc6_]] as _70;
                  if(_loc5_)
                  {
                     if(_loc5_.name == param1)
                     {
                        return true;
                     }
                  }
                  _loc6_++;
               }
            }
            _loc2_++;
         }
         return false;
      }
      
      public function _1790(param1:_78) : void
      {
         _84._1979(param1,this._1781);
      }
      
      public function _1984(param1:_78) : void
      {
         _84._1958(param1,this._1781);
      }
      
      public function _1994(param1:String) : Boolean
      {
         return _84._1961(param1,this._1781);
      }
      
      public function _1972() : void
      {
      }
      
      public function _1766(param1:_70, param2:_79, param3:_69 = null, param4:String = "") : void
      {
         var _loc5_:_78 = param4 == "" ? this._1795 : this._1962(param4);
         if(_loc5_)
         {
            param1._1760 = param2;
            if(!param3)
            {
               param3 = _69._1807(++param2._1970);
            }
            if(param2._1715.indexOf(param3) == -1)
            {
               param2._1718(param3);
            }
            param1._1733 = param3;
            _loc5_._1766(param1);
            if(this._1973 == _loc5_)
            {
               param2._1765 = this._1973._1765[param2];
            }
            this._1871();
         }
      }
      
      public function _1965(param1:_70, param2:Boolean = true) : void
      {
         var _loc3_:_79 = param1._1760;
         var _loc4_:_78 = param1._1985;
         if(_loc4_)
         {
            if(!_loc3_._1995)
            {
               _loc3_._1951(param1._1733);
            }
            _loc4_._1965(param1,param2);
            if(this._1973 == _loc4_)
            {
               _loc3_._1765 = this._1973._1765[_loc3_];
            }
            this._1871();
         }
      }
      
      public function _13580(param1:_13502) : void
      {
         param1.rootArmatureData = this;
         _84._1979(param1,this._13619);
      }
      
      public function _13651(param1:_13502) : void
      {
         param1.rootArmatureData = null;
         _84._1958(param1,this._13619);
      }
      
      public function _1742(param1:_39) : void
      {
         param1.rootArmatureData = this;
         _84._1979(param1,this._1963);
      }
      
      public function _1960(param1:_39) : void
      {
         param1.rootArmatureData = null;
         _84._1958(param1,this._1963);
      }
      
      public function _1971(param1:String) : Boolean
      {
         return _84._1961(param1,this._13619);
      }
      
      public function _1969(param1:String) : _39
      {
         return _84._1952(param1,this._1963) as _39;
      }
      
      public function _13656(param1:String) : _13502
      {
         return _84._1952(param1,this._13619) as _13502;
      }
      
      public function _1954() : void
      {
      }
      
      public function _1982() : void
      {
         var _loc2_:_52 = null;
         var _loc3_:_77 = null;
         var _loc1_:Array = [];
         for each(_loc2_ in this._1779)
         {
            for each(_loc3_ in this._1999)
            {
               if(_loc2_ == _loc3_.rootBone)
               {
                  _loc1_.push(_loc3_);
               }
            }
         }
         this._1999 = _loc1_;
         this._1968();
      }
      
      public function _1968() : void
      {
         var _loc4_:Vector.<_52> = null;
         var _loc6_:_52 = null;
         var _loc7_:_52 = null;
         var _loc1_:Dictionary = new Dictionary();
         var _loc2_:int = int(this._1999.length);
         var _loc3_:int = _loc2_ + 1;
         if(this._1998.length > _loc3_)
         {
            this._1998.splice(_loc3_,this._1998.length - _loc3_);
         }
         for each(_loc4_ in this._1998)
         {
            _loc4_.length = 0;
         }
         while(this._1998.length < _loc3_)
         {
            this._1998[this._1998.length] = new Vector.<_52>();
         }
         _loc1_[this._1779[0].name] = 0;
         var _loc5_:int = 0;
         while(_loc5_ < this._1999.length)
         {
            _loc1_[this._1999[_loc5_].rootBone.name] = _loc5_ + 1;
            _loc5_++;
         }
         for each(_loc6_ in this._1779)
         {
            _loc7_ = _loc6_;
            while(_loc7_)
            {
               if(_loc1_.hasOwnProperty(_loc7_.name))
               {
                  this._1998[_loc1_[_loc7_.name]].push(_loc6_);
                  break;
               }
               _loc7_ = _loc7_.parentBoneData;
            }
         }
      }
      
      public function _1751() : void
      {
         var _loc1_:_52 = null;
         var _loc2_:_79 = null;
         var _loc3_:int = 0;
         var _loc4_:_77 = null;
         if(this._1998.length > 0)
         {
            _loc3_ = 0;
            while(_loc3_ < this._1998.length)
            {
               for each(_loc1_ in this._1998[_loc3_])
               {
                  if(_loc1_)
                  {
                     if(_loc1_._1980)
                     {
                        _loc4_ = _77(this._1999[_loc3_ - 1]);
                        if((_loc4_) && _loc4_.bones && _loc4_.bones[0].id == _loc1_.id)
                        {
                           _loc1_._1751();
                           _loc1_._1997 = _loc1_.globalTransform.rotation;
                           if(_loc4_.bones.length > 1)
                           {
                              _loc4_.bones[1]._1751();
                              _loc4_.bones[1]._1997 = _loc4_.bones[1].globalTransform.rotation;
                           }
                           this._1999[_loc3_ - 1].compute();
                        }
                        _loc1_._1950();
                     }
                     else
                     {
                        _loc1_._1751();
                        _loc1_._1997 = _loc1_.globalTransform.rotation;
                     }
                  }
               }
               _loc3_++;
            }
         }
         for each(_loc2_ in this._1780)
         {
            _loc2_._1751();
         }
      }
      
      public function _1988(param1:Array = null) : void
      {
         var _loc2_:_79 = null;
         for each(_loc2_ in this._1780)
         {
            _loc2_._1988(param1);
         }
      }
      
      public function _14280() : void
      {
         var _loc1_:_79 = null;
         for each(_loc1_ in this._1780)
         {
            if(_loc1_._2165)
            {
               _loc1_._2049.mesh.update();
            }
         }
      }
      
      protected function _1949() : void
      {
         var _loc1_:_79 = null;
         for each(_loc1_ in this._1780)
         {
            _loc1_._1765 = this._1973._1765[_loc1_];
         }
      }
      
      protected function _1962(param1:String) : _78
      {
         return _84._1952(param1,this._1781) as _78;
      }
      
      protected function _1993(param1:_52, param2:_52) : Number
      {
         var _loc3_:int = int(_1833[param1.id]);
         var _loc4_:int = int(_1833[param2.id]);
         if(_loc3_ > _loc4_)
         {
            return 1;
         }
         if(_loc3_ == _loc4_)
         {
            return 0;
         }
         return -1;
      }
      
      public function get _1990() : _52
      {
         return this._1779[0];
      }
      
      public function get _1755() : _78
      {
         return this._1973;
      }
      
      public function set _1755(param1:_78) : void
      {
         if(this._1973 == param1)
         {
            return;
         }
         this._1973 = !!param1 ? param1 : this._1795;
         this._1949();
      }
      
      public function get defaultAnimation() : String
      {
         if(this._1964 == null || this._1964 == "")
         {
            if(this._13619.length > 0)
            {
               return this._13619[0].name;
            }
         }
         else
         {
            if(this._1971(this._1964))
            {
               return this._1964;
            }
            if(this._13619.length > 0)
            {
               return this._13619[0].name;
            }
         }
         return "";
      }
      
      public function set defaultAnimation(param1:String) : void
      {
         if(this._1964 != param1)
         {
            this._1964 = param1;
         }
      }
      
      public function _1966(param1:_52) : _77
      {
         var _loc2_:_77 = null;
         var _loc3_:_52 = null;
         for each(_loc2_ in this._1999)
         {
            for each(_loc3_ in _loc2_.bones)
            {
               if(param1.name == _loc3_.name)
               {
                  return _loc2_;
               }
            }
         }
         return null;
      }
      
      public function _1981(param1:_52) : Array
      {
         var _loc3_:_77 = null;
         var _loc2_:Array = [];
         for each(_loc3_ in this._1999)
         {
            if(param1.name == _loc3_.target.name)
            {
               _loc2_.push(_loc3_);
            }
         }
         return _loc2_;
      }
      
      public function _1955(param1:_52, param2:_52) : Boolean
      {
         return this._1966(param1).name == this._1966(param2).name;
      }
      
      public function _1976() : void
      {
         var _loc1_:_13502 = this._1977;
         if(_loc1_)
         {
            _loc1_._1868();
         }
      }
      
      public function get _1977() : _13502
      {
         var _loc1_:_13504 = null;
         var _loc2_:_52 = null;
         var _loc3_:_13502 = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(this._1779.length > 0)
         {
            _loc2_ = this._1779[0] as _52;
            if(_loc2_)
            {
               _loc1_ = _loc2_._1903;
            }
         }
         if(_loc1_)
         {
            _loc4_ = 0;
            _loc5_ = int(this._13619.length);
            while(_loc4_ < _loc5_)
            {
               _loc3_ = this._13619[_loc4_] as _13502;
               if(_loc3_._1873(_loc2_) == _loc1_)
               {
                  return _loc3_;
               }
               _loc4_++;
            }
         }
         return null;
      }
      
      public function _1789() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:_79 = null;
         _loc1_ = 0;
         _loc2_ = int(this._1780.length);
         while(_loc1_ < _loc2_)
         {
            _loc3_ = this._1780[_loc1_];
            _loc3_._1789();
            _loc1_++;
         }
      }
      
      public function _1975() : Vector.<_70>
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:_79 = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:_70 = null;
         var _loc7_:Vector.<_70> = new Vector.<_70>();
         _loc1_ = 0;
         _loc2_ = int(this._1780.length);
         while(_loc1_ < _loc2_)
         {
            _loc3_ = this._1780[_loc1_];
            _loc4_ = 0;
            _loc5_ = int(_loc3_._1715.length);
            while(_loc4_ < _loc5_)
            {
               _loc6_ = _loc3_._1765[_loc3_._1715[_loc4_]] as _70;
               if(_loc6_)
               {
                  _loc7_.push(_loc6_);
               }
               _loc4_++;
            }
            _loc1_++;
         }
         return _loc7_;
      }
      
      public function _1818(param1:String) : _79
      {
         return _84._1952(param1,this._1780) as _79;
      }
      
      public function _1817(param1:String) : _52
      {
         return _84._1952(param1,this._1779) as _52;
      }
      
      public function _10664() : Array
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:_79 = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:_70 = null;
         var _loc1_:Array = [];
         var _loc8_:Vector.<_70> = new Vector.<_70>();
         _loc2_ = 0;
         _loc3_ = int(this._1780.length);
         while(_loc2_ < _loc3_)
         {
            _loc4_ = this._1780[_loc2_];
            _loc5_ = 0;
            _loc6_ = int(_loc4_._1715.length);
            while(_loc5_ < _loc6_)
            {
               _loc7_ = _loc4_._1765[_loc4_._1715[_loc5_]] as _70;
               if((Boolean(_loc7_)) && _loc7_.type == _74.ARMATURE)
               {
                  if(_loc7_._2107())
                  {
                     _loc1_.push(_loc7_._2107().name);
                  }
               }
               _loc5_++;
            }
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function get _13655() : Object
      {
         return this._13654;
      }
      
      public function set _13655(param1:Object) : void
      {
         if(!(param1 is _13550) && !(param1 is _757))
         {
            return;
         }
         this._13654 = param1;
         this.libraryParentType = param1 is _13550 ? _13550.LIBRARYVITUALFOLDERVO : _13550.LIBRARYPROJECTDATA;
      }
      
      public function get libraryParentType() : int
      {
         return this._13653;
      }
      
      public function set libraryParentType(param1:int) : void
      {
         this._13653 = param1;
      }
      
      public function get libraryParentName() : String
      {
         return this._13652;
      }
      
      public function set libraryParentName(param1:String) : void
      {
         this._13652 = param1;
      }
   }
}

