package _51
{
   import _13505._13508;
   import _35.HashObject;
   import _40._48;
   import _73._74;
   import _81.BoundingBox;
   import _81._82;
   import _81._83;
   import _81._86;
   import _81._88;
   import _81._89;
   import _81._90;
   import _81._91;
   import flash.display.BlendMode;
   import flash.geom.Matrix;
   import flash.utils.Dictionary;
   
   public class _79 extends HashObject implements _91, _90, _89
   {
      public static const UNDEFINE:_69 = new _69();
      
      public static const CACHE_NO_ANIM:String = "CACHE_NO_ANIM";
      
      public var _1970:int = 0;
      
      private var _name:String;
      
      private var _2020:_52;
      
      private var _2157:Dictionary;
      
      private var _2151:Array;
      
      private var _2148:_69 = null;
      
      private var _2146:_69 = null;
      
      private var _2144:_69;
      
      private var _2163:Boolean = false;
      
      public var _2152:_83;
      
      public var _2150:_83;
      
      public var _2147:_83;
      
      public var _13688:Boolean;
      
      public var _13689:Boolean;
      
      public var _13683:Boolean = true;
      
      public var gotoAndPlay:String;
      
      public var blendMode:String;
      
      private var _2155:String;
      
      private var _2160:String;
      
      private var _2017:_86;
      
      private var _2006:Matrix;
      
      private var _11286:Boolean;
      
      private var _2098:_13508;
      
      private var _13686:_48;
      
      public var _13687:_70;
      
      public var _14309:int = 0;
      
      public var curFrameIndex:Number = 0;
      
      public function _79(param1:int = 0, param2:Object = null)
      {
         this._2157 = new Dictionary();
         this._2151 = [];
         this._2144 = UNDEFINE;
         this._2152 = new _83();
         this._2017 = new _86();
         this._2006 = new Matrix();
         super(param1,param2);
      }
      
      public static function _1729(param1:String, param2:_52, param3:int = 0, param4:Object = null) : _79
      {
         var _loc5_:_79;
         (_loc5_ = new _79(param3)).name = param1;
         _loc5_.parentBoneData = param2;
         _loc5_.blendMode = BlendMode.NORMAL;
         return _loc5_;
      }
      
      public function dispose() : void
      {
         var _loc1_:_70 = null;
         this._2020 = null;
         this._1970 = 0;
         for each(_loc1_ in this._2157)
         {
            _loc1_.dispose();
         }
      }
      
      public function _1718(param1:_69) : void
      {
         param1._1760 = this;
         var _loc2_:int = int(this._1715.length - 1);
         while(_loc2_ >= 0)
         {
            if((this._1715[_loc2_] as _69).id < param1.id)
            {
               break;
            }
            _loc2_--;
         }
         this._1715.splice(_loc2_ + 1,0,param1);
         this._1970 = this._1970 >= param1.id ? this._1970 : param1.id;
      }
      
      public function _1951(param1:_69) : void
      {
         var _loc2_:int = int(this._1715.indexOf(param1));
         if(_loc2_ >= 0)
         {
            this._1715.splice(_loc2_,1);
         }
      }
      
      public function _1988(param1:Array = null) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:_69 = !!this._2098 ? this._2098._1923 : null;
         if(Boolean(param1) && this._2146 != _loc2_)
         {
            _loc3_ = 0;
            _loc4_ = int(this._2151.length);
            while(_loc3_ < _loc4_)
            {
               param1.push(this._1765[this._2151[_loc3_]]);
               _loc3_++;
            }
         }
         this._2146 = _loc2_;
         if(this._2098)
         {
            this._2155 = this._2098.currentAnimation;
         }
         else
         {
            this._2155 = this.gotoAndPlay;
         }
         if(Boolean(this._2049) && this._2049.type == _74.ARMATURE)
         {
            if(this._2049._2107())
            {
               this._2049._2107().currentAnimation = this._2155;
            }
         }
         this._2153();
      }
      
      public function _2153() : void
      {
         if(this._2098)
         {
            this._2150 = this._2098._1926;
         }
         else if(this._13686)
         {
            this._2150 = this._13686._1926;
         }
         else
         {
            this._2150 = null;
         }
      }
      
      public function _1751() : void
      {
         if(!this._2049)
         {
            return;
         }
         this._2017.copyFrom(this._1724);
         if(this.parentBoneData)
         {
            this._2017._2030(this.parentBoneData._2009,this.parentBoneData.globalTransform,null,false,this._2006);
         }
         else
         {
            _88._2013(this._2017,this._2006);
         }
         if(this._2049.type == _74.MESH && this._2049.mesh._2119())
         {
            this._2049.mesh._1751();
            this._2017.copyFrom(this._2049.mesh.globalTransform);
            this._2006.copyFrom(this._2049.mesh._2162);
         }
      }
      
      public function _2143(param1:_86) : _86
      {
         var _loc3_:_86 = null;
         var _loc4_:Matrix = null;
         var _loc5_:Matrix = null;
         if(!this._2049)
         {
            return null;
         }
         var _loc2_:_86 = param1.clone();
         if(this.parentBoneData)
         {
            _loc3_ = this.parentBoneData.globalTransform;
            _loc4_ = this.parentBoneData._2009.clone();
            _loc4_.invert();
            _loc5_ = new Matrix();
            _88._2013(_loc2_,_loc5_);
            _loc5_.concat(_loc4_);
            _88._2014(_loc5_,_loc2_,_loc2_.scaleX * _loc3_.scaleX >= 0,_loc2_.scaleY * _loc3_.scaleY >= 0);
         }
         return _loc2_;
      }
      
      public function _2159(param1:String) : Boolean
      {
         var _loc2_:_70 = null;
         for each(_loc2_ in this._2157)
         {
            if(_loc2_._13230 == param1)
            {
               return true;
            }
         }
         return false;
      }
      
      public function _13231(param1:String) : String
      {
         var _loc4_:int = 0;
         if(!this._2159(param1))
         {
            return param1;
         }
         var _loc2_:Array = this._13234(param1);
         var _loc3_:* = "";
         if(_loc2_[1] == -1)
         {
            _loc3_ = param1 + "_";
            _loc4_ = 1;
         }
         else
         {
            _loc3_ = _loc2_[0];
            _loc4_ = _loc2_[1] + 1;
         }
         var _loc5_:String = _loc3_ + _loc4_++;
         while(this._2159(_loc5_))
         {
            _loc5_ = _loc3_ + _loc4_++;
         }
         return _loc5_;
      }
      
      private function _13234(param1:String) : Array
      {
         var _loc5_:int = 0;
         var _loc6_:String = null;
         var _loc2_:int = param1.length;
         var _loc3_:String = "";
         var _loc4_:String = "0123456789";
         _loc5_ = _loc2_ - 1;
         while(_loc5_ >= 0)
         {
            _loc6_ = param1.charAt(_loc5_);
            if(_loc4_.indexOf(_loc6_) == -1)
            {
               break;
            }
            _loc3_ = _loc6_ + _loc3_;
            _loc5_--;
         }
         if(_loc3_ == "")
         {
            return [param1,-1];
         }
         var _loc7_:String = param1.substring(0,_loc5_ + 1);
         var _loc8_:int = int(_loc3_);
         return [_loc7_,_loc8_];
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get parentBoneData() : _52
      {
         return this._2020;
      }
      
      public function set parentBoneData(param1:_52) : void
      {
         if(this._2020 == param1)
         {
            return;
         }
         this._2020 = param1;
      }
      
      public function get rootArmatureData() : _50
      {
         return !!this._2020 ? this._2020.rootArmatureData : null;
      }
      
      public function get zOrder() : Number
      {
         if(this._2020 && this._2020.rootArmatureData && Boolean(this._2020.rootArmatureData._1780))
         {
            return this._2020.rootArmatureData._1780.indexOf(this);
         }
         return 0;
      }
      
      public function get _1765() : Dictionary
      {
         return this._2157;
      }
      
      public function set _1765(param1:Dictionary) : void
      {
         this._2157 = !!param1 ? param1 : new Dictionary();
      }
      
      public function get _1715() : Array
      {
         return this._2151;
      }
      
      public function get _1711() : _69
      {
         return this._2148;
      }
      
      public function set _1711(param1:_69) : void
      {
         this._2148 = param1;
      }
      
      public function get _2156() : _70
      {
         return this._1765[this._2148];
      }
      
      public function set _2156(param1:_70) : void
      {
         this._2148 = !!param1 ? param1._1733 : null;
      }
      
      public function get _2154() : int
      {
         return !!this._1711 ? int(this._2151.indexOf(this._1711)) : -1;
      }
      
      public function set _2145(param1:_69) : void
      {
         this._2144 = param1;
      }
      
      public function get _2149() : _70
      {
         return this._1765[this._2144];
      }
      
      public function set _2149(param1:_70) : void
      {
         this._2144 = !!param1 ? param1._1733 : null;
      }
      
      public function get _1923() : _69
      {
         if(this._2144 != UNDEFINE)
         {
            return this._2144;
         }
         if(this._2098)
         {
            if(Boolean(this._2146) && this._2146.displayIndex == -1)
            {
               return null;
            }
            return this._2146;
         }
         return this._2148;
      }
      
      public function get _2049() : _70
      {
         if(this._13687)
         {
            return this._13687;
         }
         return !!this._1923 ? this._1765[this._1923] : null;
      }
      
      public function get currentAnimation() : String
      {
         if(this._2160)
         {
            return this._2160 == CACHE_NO_ANIM ? null : this._2160;
         }
         if(this._2098)
         {
            return this._2155;
         }
         if(Boolean(this._2049) && this._2049.type == _74.ARMATURE)
         {
            return this.gotoAndPlay;
         }
         return null;
      }
      
      public function get _2158() : String
      {
         var _loc1_:String = null;
         var _loc2_:_50 = null;
         if(Boolean(this._2049) && this._2049.type == _74.ARMATURE)
         {
            _loc1_ = this.currentAnimation;
            if(_loc1_)
            {
               return this.currentAnimation;
            }
            _loc2_ = this._2049._2107();
            if(_loc2_)
            {
               return _loc2_.defaultAnimation;
            }
         }
         return null;
      }
      
      public function get _1995() : Boolean
      {
         return this._2163;
      }
      
      public function set _1995(param1:Boolean) : void
      {
         this._2163 = param1;
      }
      
      public function get _1724() : _86
      {
         var _loc1_:_70 = this._2049;
         return !!_loc1_ ? _loc1_.localTransform : null;
      }
      
      public function get currentLocalTransform() : _86
      {
         var _loc1_:_70 = this._2049;
         return !!_loc1_ ? _loc1_.localTransform : null;
      }
      
      public function get _2009() : Matrix
      {
         return this._2006;
      }
      
      public function get globalTransform() : _86
      {
         return this._2017;
      }
      
      public function get _1926() : _83
      {
         if(this._2147)
         {
            return this._2147;
         }
         if(this._2150)
         {
            return this._2150;
         }
         return this._2152;
      }
      
      public function get _13682() : Boolean
      {
         if(Boolean(this._2098) && Boolean(this._2098._13592._13680))
         {
            return this._2098._13592._13680.value;
         }
         return this._13683;
      }
      
      public function get _1903() : _13508
      {
         return this._2098;
      }
      
      public function set _1903(param1:_13508) : void
      {
         this._2098 = param1;
         this._1988();
      }
      
      public function get _13650() : _48
      {
         return this._13686;
      }
      
      public function set _13650(param1:_48) : void
      {
         this._13686 = param1;
         this._1988();
      }
      
      public function get _2164() : Boolean
      {
         var _loc1_:_70 = null;
         var _loc2_:int = 0;
         var _loc3_:* = this._1765;
         for each(_loc1_ in _loc3_)
         {
            return true;
         }
         return false;
      }
      
      public function get _2041() : Number
      {
         if(this._2049 && this._2049.type == _74.ARMATURE && Boolean(this._2049._14296))
         {
            return this._2049._14296.x;
         }
         if(Boolean(this._2049) && Boolean(this._2049._2104))
         {
            return this._2049._2104._2166;
         }
         return 0;
      }
      
      public function get _2040() : Number
      {
         if(this._2049 && this._2049.type == _74.ARMATURE && Boolean(this._2049._14296))
         {
            return this._2049._14296.y;
         }
         if(Boolean(this._2049) && Boolean(this._2049._2104))
         {
            return this._2049._2104._2167;
         }
         return 0;
      }
      
      public function get _2038() : Number
      {
         if(this._2049 && this._2049.type == _74.ARMATURE && Boolean(this._2049._14296))
         {
            return this._2049._14296.width;
         }
         return !!this._2049 ? this._2049.width : 0;
      }
      
      public function get _2037() : Number
      {
         if(this._2049 && this._2049.type == _74.ARMATURE && Boolean(this._2049._14296))
         {
            return this._2049._14296.height;
         }
         return !!this._2049 ? this._2049.height : 0;
      }
      
      public function set boundingBox(param1:BoundingBox) : void
      {
         _82._2015[this] = param1;
      }
      
      public function get boundingBox() : BoundingBox
      {
         if(this._2049 && this._2049.type == _74.ARMATURE && Boolean(this._2049._14296))
         {
            return null;
         }
         return _82._2015[this];
      }
      
      public function set _2161(param1:String) : void
      {
         this._2160 = param1;
      }
      
      public function _1789() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:_70 = null;
         _loc1_ = 0;
         _loc2_ = int(this._2151.length);
         while(_loc1_ < _loc2_)
         {
            _loc3_ = this._2157[this._2151[_loc1_]] as _70;
            if(_loc3_)
            {
               _loc3_._1789();
            }
            _loc1_++;
         }
      }
      
      public function _2112() : Boolean
      {
         return this._2049 && this._2049.type == _74.MESH && Boolean(this._2049.mesh) && this._2049.mesh._2119();
      }
      
      public function get _2165() : Boolean
      {
         return Boolean(this._2049) && this._2049.type == _74.MESH;
      }
      
      public function get _11287() : Boolean
      {
         return Boolean(this._2049) && this._2049.type == _74.BOUNDINGBOX;
      }
      
      public function get onlyBoundingBox() : Boolean
      {
         return this._11286;
      }
      
      public function set onlyBoundingBox(param1:Boolean) : void
      {
         this._11286 = param1;
      }
      
      public function get _2145() : _69
      {
         return this._2144;
      }
      
      public function get _2161() : String
      {
         return this._2160;
      }
      
      public function clone() : _79
      {
         var _loc3_:int = 0;
         var _loc4_:_70 = null;
         var _loc5_:_70 = null;
         var _loc1_:_79 = new _79();
         _loc1_.name = this.name;
         _loc1_.blendMode = this.blendMode;
         _loc1_._2152 = this._1926.clone();
         _loc1_._2152.copyFrom(this._2152);
         _loc1_.onlyBoundingBox = this._11286;
         _loc1_.parentBoneData = this.parentBoneData;
         var _loc2_:int = 0;
         _loc2_ = 0;
         _loc3_ = int(this._1715.length);
         while(_loc2_ < _loc3_)
         {
            _loc4_ = this._1765[this._1715[_loc2_]];
            if(_loc4_)
            {
               _loc5_ = _loc4_._14298(this.rootArmatureData);
               this._12509(_loc1_,_loc5_,this._1923 == this._1715[_loc2_]);
            }
            _loc2_++;
         }
         return _loc1_;
      }
      
      private function _12509(param1:_79, param2:_70, param3:Boolean) : void
      {
         param2._1760 = param1;
         var _loc4_:_69 = _69._1807(++param1._1970);
         if(param1._1715.indexOf(_loc4_) == -1)
         {
            param1._1718(_loc4_);
         }
         param2._1733 = _loc4_;
         param1._1765[_loc4_] = param2;
         if(param3)
         {
            param1._1711 = _loc4_;
         }
      }
      
      public function _13170(param1:String) : _69
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:_70 = null;
         _loc2_ = 0;
         _loc3_ = int(this._1715.length);
         while(_loc2_ < _loc3_)
         {
            _loc4_ = this._1765[this._1715[_loc2_]];
            if((Boolean(_loc4_)) && _loc4_.name == param1)
            {
               return this._1715[_loc2_];
            }
            _loc2_++;
         }
         return null;
      }
      
      public function _13232(param1:int) : _70
      {
         if(param1 >= 0 && param1 < this._1715.length)
         {
            return this._2157[this._1715[param1]];
         }
         return null;
      }
      
      public function _13233(param1:String) : _70
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:_70 = null;
         _loc2_ = 0;
         _loc3_ = int(this._1715.length);
         while(_loc2_ < _loc3_)
         {
            _loc4_ = this._1765[this._1715[_loc2_]];
            if((Boolean(_loc4_)) && _loc4_.name == param1)
            {
               return _loc4_;
            }
            _loc2_++;
         }
         return null;
      }
   }
}

