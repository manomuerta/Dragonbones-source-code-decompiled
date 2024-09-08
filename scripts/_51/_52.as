package _51
{
   import _13505._13504;
   import _35.HashObject;
   import _40._41;
   import _81.BoundingBox;
   import _81._82;
   import _81._86;
   import _81._88;
   import _81._89;
   import _81._90;
   import _81._91;
   import _97._100;
   import flash.geom.Matrix;
   
   public class _52 extends HashObject implements _90, _91, _89
   {
      public static const MAX_LENGTH:int = 2000;
      
      private var _name:String;
      
      private var _length:int = 0;
      
      public var rootArmatureData:_50;
      
      private var _2020:_52;
      
      public var _1764:String;
      
      public var _1882:_79;
      
      private var _2007:_86;
      
      private var _2004:_86 = null;
      
      public var _2002:_86 = null;
      
      public var _13657:Boolean;
      
      public var _13658:Boolean;
      
      public var _13659:Boolean;
      
      private var _2017:_86;
      
      private var _2006:Matrix;
      
      private var _2034:Number = 0;
      
      public var _14274:String;
      
      public var _1980:Boolean = false;
      
      public var _1957:Boolean = false;
      
      public var inheritRotation:Boolean = true;
      
      public var inheritScale:Boolean = true;
      
      public var _14284:Boolean = true;
      
      public var _2024:Vector.<_52>;
      
      public var _1903:_13504;
      
      public var _13650:_41;
      
      public var _2027:Boolean;
      
      public var _2033:Boolean = false;
      
      private var _2023:int;
      
      public var _2022:Boolean = false;
      
      public var _2028:Boolean = false;
      
      private var _color:uint = 16777215;
      
      private var _14281:uint;
      
      public var _14290:Number = 0;
      
      public var _14288:Matrix;
      
      public var _14283:_86;
      
      public var _14289:Matrix;
      
      public var _14282:_86;
      
      public var _14285:_86;
      
      public var _14286:_86;
      
      public var _14292:Matrix;
      
      public var _14291:Matrix;
      
      public var _14295:Boolean;
      
      public function _52(param1:int = 0, param2:Object = null)
      {
         this._2007 = new _86();
         this._2017 = new _86();
         this._2006 = new Matrix();
         this._2024 = new Vector.<_52>();
         this._14281 = _100._14268;
         super(param1,param2);
      }
      
      public static function _1729(param1:String, param2:_52, param3:int = 0, param4:Object = null) : _52
      {
         var _loc5_:_52;
         (_loc5_ = new _52(param3,param4)).name = param1;
         _loc5_.parentBoneData = param2;
         return _loc5_;
      }
      
      private function _2011() : void
      {
         if(this._2002)
         {
            this._2004 = this._2002;
         }
         else
         {
            if(this._2004)
            {
               this._2004.copyFrom(this._2007);
            }
            else
            {
               this._2004 = this._2007.clone();
            }
            if(this._1903)
            {
               this._2004.add(this._1903._1902);
            }
            else if(this._13650)
            {
               this._2004.add(this._13650._1902);
            }
         }
      }
      
      private function _2010() : void
      {
         var _loc2_:Matrix = null;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc1_:Number = 0;
         this.globalTransform.copyFrom(this._2004);
         if(this.parentBoneData)
         {
            _loc2_ = this.parentBoneData._2009;
            if(this.inheritScale)
            {
               if(!this.inheritRotation)
               {
                  _loc1_ = this.parentBoneData.globalTransform.rotation;
                  this.globalTransform.rotation -= _loc1_;
               }
               this.globalTransform._14294(this._2009);
               this._2009.concat(_loc2_);
               this.globalTransform.x = this._2009.tx;
               this.globalTransform.y = this._2009.ty;
               this.globalTransform._14293(this._2009);
            }
            else
            {
               _loc3_ = this.globalTransform.x;
               _loc4_ = this.globalTransform.y;
               this.globalTransform.x = _loc2_.a * _loc3_ + _loc2_.c * _loc4_ + _loc2_.tx;
               this.globalTransform.y = _loc2_.d * _loc4_ + _loc2_.b * _loc3_ + _loc2_.ty;
               if(this.inheritRotation)
               {
                  _loc1_ = this.parentBoneData.globalTransform.rotation;
                  if(this.parentBoneData.globalTransform.scaleX < 0)
                  {
                     _loc1_ += Math.PI;
                  }
                  if(_loc2_.a * _loc2_.d - _loc2_.b * _loc2_.c < 0)
                  {
                     _loc1_ -= this.globalTransform.rotation * 2;
                     if(this._14284)
                     {
                        this.globalTransform.skewX += Math.PI;
                     }
                  }
                  this.globalTransform.rotation += _loc1_;
               }
               this.globalTransform._14294(this._2009);
            }
         }
         else
         {
            this.globalTransform._14294(this._2009);
         }
      }
      
      private function localToGlobal(param1:Matrix, param2:_86, param3:Boolean, param4:Boolean) : Matrix
      {
         var _loc6_:_86 = null;
         var _loc7_:Matrix = null;
         var _loc5_:Matrix = new Matrix();
         _88._2013(param2,_loc5_);
         if(param3 && param4)
         {
            _loc5_.concat(param1);
         }
         else
         {
            _loc6_ = new _86();
            _88._2014(param1,_loc6_,true,true);
            if(!param3)
            {
               _loc6_.rotation = 0;
            }
            if(!param4)
            {
               _loc6_.scaleX = 1;
               _loc6_.scaleY = 1;
            }
            _loc7_ = new Matrix();
            _88._2013(_loc6_,_loc7_);
            _loc5_.concat(_loc7_);
         }
         return _loc5_;
      }
      
      public function _1751() : void
      {
         this._2011();
         this._2010();
      }
      
      public function _1950() : void
      {
         var _loc1_:Matrix = null;
         var _loc2_:_86 = null;
         var _loc3_:Matrix = null;
         var _loc4_:_86 = null;
         var _loc5_:Matrix = null;
         if(!this.parentBoneData)
         {
            return;
         }
         if(this._1980)
         {
            _loc1_ = this.parentBoneData._1980 && this.parentBoneData._14274 == this._14274 ? this.parentBoneData._14288 : this.parentBoneData._2009;
            _loc2_ = this._2004.clone();
            this._14288 = this.localToGlobal(_loc1_,_loc2_,this.inheritRotation,this.inheritScale);
            if(this._14283 == null)
            {
               this._14283 = new _86();
            }
            _88._2014(this._14288,this._14283,true,true);
            _loc3_ = this.parentBoneData._1980 && this.parentBoneData._14274 == this._14274 ? this.parentBoneData._14289 : this.parentBoneData._2009;
            (_loc4_ = this._2004.clone()).rotation = this._14290 - (this.parentBoneData._1980 && this.parentBoneData._14274 == this._14274 ? this.parentBoneData._14290 : this.parentBoneData.globalTransform.rotation);
            this._14289 = this.localToGlobal(_loc3_,_loc4_,this.inheritRotation,this.inheritScale);
            if(this._14282 == null)
            {
               this._14282 = new _86();
            }
            _88._2014(this._14289,this._14282,true,true);
         }
         this._2004.rotation = this._1997 - this._2012;
         this._2010();
         if(this._1980)
         {
            _loc5_ = this._2009.clone();
            _loc5_.invert();
            this._14292 = this._14288.clone();
            this._14292.concat(_loc5_);
            if(this._14285 == null)
            {
               this._14285 = new _86();
            }
            _88._2014(this._14292,this._14285,true,true);
            this._14291 = this._14289.clone();
            this._14291.concat(_loc5_);
            if(this._14286 == null)
            {
               this._14286 = new _86();
            }
            _88._2014(this._14291,this._14286,true,true);
         }
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get _2009() : Matrix
      {
         return this._2006;
      }
      
      public function get globalTransform() : _86
      {
         return this._2017;
      }
      
      public function get _1724() : _86
      {
         return this._2007;
      }
      
      public function get _2005() : _86
      {
         return this._2004;
      }
      
      public function get currentLocalTransform() : _86
      {
         return !!this._2002 ? this._2002 : (!!this._2004 ? this._2004 : this._2007);
      }
      
      protected function get _2008() : _86
      {
         if(this.parentBoneData)
         {
            return this.parentBoneData.globalTransform;
         }
         return null;
      }
      
      public function get parentBoneData() : _52
      {
         return this._2020;
      }
      
      public function set parentBoneData(param1:_52) : void
      {
         if(this._2020 != param1)
         {
            if(this._2020 != null)
            {
               this._2020._2019(this);
            }
            this._2020 = param1;
            if(this._2020 != null)
            {
               this._2020._2029(this);
            }
         }
      }
      
      public function _2018(param1:int) : void
      {
         this._2023 = param1;
      }
      
      public function set _2025(param1:int) : void
      {
         this._2023 = param1;
         if(this._2023 == 0)
         {
            this._2033 = false;
            if(this.parentBoneData)
            {
               this.parentBoneData._2025 = 0;
            }
         }
         else if(this._2023 == -1)
         {
            this._2033 = true;
            if(this.parentBoneData)
            {
               this.parentBoneData._2025 = -1;
            }
         }
         else
         {
            this._2033 = true;
            if(this.parentBoneData)
            {
               this.parentBoneData._2025 = this.id;
            }
         }
      }
      
      public function get _2025() : int
      {
         return this._2023;
      }
      
      public function _2016(param1:Boolean) : void
      {
         this._2033 = param1;
         this._2018(param1 ? -1 : 0);
         var _loc2_:int = 0;
         var _loc3_:int = int(this._2024.length);
         while(_loc2_ < _loc3_)
         {
            this._2024[_loc2_]._2016(param1);
            _loc2_++;
         }
      }
      
      public function _2031() : _86
      {
         var _loc1_:_86 = new _86(this.length);
         _loc1_._2030(this._2006,this._2017);
         return _loc1_;
      }
      
      public function _2029(param1:_52) : void
      {
         var _loc2_:int = int(this._2024.indexOf(param1));
         if(_loc2_ < 0)
         {
            this._2024.push(param1);
            this._2027 = true;
         }
      }
      
      public function _2019(param1:_52) : void
      {
         var _loc2_:int = int(this._2024.indexOf(param1));
         if(_loc2_ >= 0)
         {
            this._2024.splice(_loc2_,1);
            this._2027 = true;
         }
      }
      
      public function get _2041() : Number
      {
         return -5;
      }
      
      public function get _2040() : Number
      {
         return -5;
      }
      
      public function get _2038() : Number
      {
         return this.length > 5 ? this.length + 5 : 10;
      }
      
      public function get _2037() : Number
      {
         return 10;
      }
      
      public function get length() : int
      {
         return this._length;
      }
      
      public function set length(param1:int) : void
      {
         this._length = param1 < MAX_LENGTH ? param1 : MAX_LENGTH;
      }
      
      public function set boundingBox(param1:BoundingBox) : void
      {
         _82._2015[this] = param1;
      }
      
      public function get boundingBox() : BoundingBox
      {
         return _82._2015[this];
      }
      
      public function get _1997() : Number
      {
         return this._2034;
      }
      
      public function set _1997(param1:Number) : void
      {
         this._2034 = param1;
      }
      
      public function get _2036() : Array
      {
         if(this.inheritScale && this.inheritRotation)
         {
            return null;
         }
         return [this.inheritScale,this.inheritRotation,this._2012];
      }
      
      public function get _2012() : Number
      {
         return !!this.parentBoneData ? this.parentBoneData._1997 : 0;
      }
      
      public function get color() : uint
      {
         return this._color;
      }
      
      public function set color(param1:uint) : void
      {
         this._2028 = true;
         this._color = param1;
      }
      
      public function _2035() : void
      {
         this._2028 = false;
      }
      
      public function _2021() : Vector.<_52>
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:_52 = null;
         var _loc1_:Vector.<_52> = new Vector.<_52>();
         var _loc2_:Vector.<_52> = new Vector.<_52>();
         _loc3_ = 0;
         _loc4_ = int(this._2024.length);
         while(_loc3_ < _loc4_)
         {
            _loc1_.push(this._2024[_loc3_]);
            _loc2_.push(this._2024[_loc3_]);
            _loc3_++;
         }
         while(_loc2_.length > 0)
         {
            _loc5_ = _loc2_[0];
            _loc3_ = 0;
            _loc4_ = int(_loc5_._2024.length);
            while(_loc3_ < _loc4_)
            {
               _loc1_.push(_loc5_._2024[_loc3_]);
               _loc2_.push(_loc5_._2024[_loc3_]);
               _loc3_++;
            }
            _loc2_.shift();
         }
         return _loc1_;
      }
      
      public function _14287(param1:_52) : Boolean
      {
         var _loc2_:_52 = param1;
         while(_loc2_ != this && _loc2_ != null)
         {
            _loc2_ = _loc2_.parentBoneData;
         }
         return _loc2_ != null;
      }
      
      public function get _14270() : uint
      {
         return this._14281;
      }
      
      public function set _14270(param1:uint) : void
      {
         if(this._14281 == param1)
         {
            return;
         }
         this._14281 = param1;
      }
      
      public function clone() : _52
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:_52 = null;
         var _loc1_:_52 = new _52();
         _loc1_.name = this.name;
         _loc1_.inheritScale = this.inheritScale;
         _loc1_.inheritRotation = this.inheritRotation;
         _loc1_._1724.copyFrom(this._1724);
         _loc1_.length = this.length;
         _loc1_._14270 = this._14270;
         _loc1_.rootArmatureData = this.rootArmatureData;
         if(this._2024.length > 0)
         {
            _loc2_ = 0;
            _loc3_ = int(this._2024.length);
            while(_loc2_ < _loc3_)
            {
               (_loc4_ = this._2024[_loc2_].clone()).parentBoneData = _loc1_;
               _loc4_._1764 = _loc1_.name;
               _loc2_++;
            }
         }
         return _loc1_;
      }
   }
}

