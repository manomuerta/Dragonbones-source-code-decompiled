package _644
{
   import _11489.Curve;
   import _40.BoneFrameVO;
   import _40.TimelineVOBase;
   import _40._41;
   import _40._45;
   import _40._47;
   import _40._48;
   import _51._52;
   import _51._79;
   import _54._53;
   import _54._57;
   import _54._58;
   import _54._63;
   import _54._64;
   import _54._65;
   import _54._67;
   import _724._725;
   import _81._83;
   import _81._86;
   import _81._88;
   import _81._91;
   import _978.Timeline;
   import flash.geom.Matrix;
   
   public class _646 implements _91
   {
      public var track:_57;
      
      public var tweens:Vector.<_67>;
      
      public var parent:_645;
      
      private var _5659:_86;
      
      private var _matrix:Matrix;
      
      private var _5661:Boolean = false;
      
      public function _646(param1:_645)
      {
         this._5659 = new _86();
         this._matrix = new Matrix();
         super();
         this.tweens = new Vector.<_67>();
         this.parent = param1;
      }
      
      public function addTween(param1:_67) : void
      {
         if(this.tweens.indexOf(param1) == -1)
         {
            this.tweens.push(param1);
         }
      }
      
      public function _2076(param1:_67, param2:int) : void
      {
         if(this.tweens.indexOf(param1) == -1)
         {
            this.tweens.splice(param2,0,param1);
         }
      }
      
      public function _2075(param1:_67) : void
      {
         var _loc2_:int = int(this.tweens.indexOf(param1));
         if(_loc2_ >= 0)
         {
            this.tweens.splice(_loc2_,1);
         }
      }
      
      public function isEmpty() : Boolean
      {
         return this.tweens.length == 0;
      }
      
      public function get _3071() : Boolean
      {
         var _loc1_:int = 0;
         var _loc2_:int = int(this.tweens.length);
         while(_loc1_ < _loc2_)
         {
            if(this.tweens[_loc1_].appear)
            {
               return true;
            }
            _loc1_++;
         }
         return false;
      }
      
      public function get _10286() : Boolean
      {
         var _loc1_:int = 0;
         var _loc2_:int = int(this.tweens.length);
         while(_loc1_ < _loc2_)
         {
            if(this.tweens[_loc1_]._10283)
            {
               return true;
            }
            _loc1_++;
         }
         return false;
      }
      
      public function get _10361() : _646
      {
         return this.parent._10366(this.index - 1);
      }
      
      public function get _3106() : _67
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         if(this._3071)
         {
            _loc1_ = 0;
            _loc2_ = int(this.tweens.length);
            while(_loc1_ < _loc2_)
            {
               if(this.tweens[_loc1_].appear)
               {
                  return this.tweens[_loc1_];
               }
               _loc1_++;
            }
         }
         return null;
      }
      
      public function get _10288() : _67
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         if(this._10286)
         {
            _loc1_ = 0;
            _loc2_ = int(this.tweens.length);
            while(_loc1_ < _loc2_)
            {
               if(this.tweens[_loc1_]._10283)
               {
                  return this.tweens[_loc1_];
               }
               _loc1_++;
            }
         }
         return null;
      }
      
      public function get _1836() : _52
      {
         return this.tweens[0]._1836;
      }
      
      public function get _1837() : _79
      {
         return this.tweens[0]._1837;
      }
      
      public function get easing() : int
      {
         return this.tweens[0].easing;
      }
      
      public function get during() : Number
      {
         return this.tweens[0].during;
      }
      
      public function get delay() : Number
      {
         return this.tweens[0].delay;
      }
      
      public function get index() : int
      {
         return this.parent.tracks.indexOf(this);
      }
      
      public function get loop() : Boolean
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         _loc1_ = 0;
         _loc2_ = int(this.tweens.length);
         while(_loc1_ < _loc2_)
         {
            if(this.tweens[_loc1_].loop)
            {
               return true;
            }
            _loc1_++;
         }
         return false;
      }
      
      public function _5660() : Curve
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         _loc1_ = 0;
         _loc2_ = int(this.tweens.length);
         while(_loc1_ < _loc2_)
         {
            if(!(this.tweens[_loc1_] is _58))
            {
               return this.tweens[_loc1_]._2059();
            }
            _loc1_++;
         }
         return null;
      }
      
      public function _5658() : _58
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         _loc1_ = 0;
         _loc2_ = int(this.tweens.length);
         while(_loc1_ < _loc2_)
         {
            if(this.tweens[_loc1_] is _58)
            {
               return this.tweens[_loc1_] as _58;
            }
            _loc1_++;
         }
         return null;
      }
      
      public function _5110() : _63
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         _loc1_ = 0;
         _loc2_ = int(this.tweens.length);
         while(_loc1_ < _loc2_)
         {
            if(this.tweens[_loc1_] is _63)
            {
               return this.tweens[_loc1_] as _63;
            }
            _loc1_++;
         }
         return null;
      }
      
      public function _5109() : _64
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         _loc1_ = 0;
         _loc2_ = int(this.tweens.length);
         while(_loc1_ < _loc2_)
         {
            if(this.tweens[_loc1_] is _64)
            {
               return this.tweens[_loc1_] as _64;
            }
            _loc1_++;
         }
         return null;
      }
      
      public function _5114() : _65
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         _loc1_ = 0;
         _loc2_ = int(this.tweens.length);
         while(_loc1_ < _loc2_)
         {
            if(this.tweens[_loc1_] is _65)
            {
               return this.tweens[_loc1_] as _65;
            }
            _loc1_++;
         }
         return null;
      }
      
      public function get _2104() : _725
      {
         var _loc1_:_79 = null;
         if(this.tweens.length > 0)
         {
            _loc1_ = this.tweens[0]._1837;
            if(Boolean(_loc1_) && Boolean(_loc1_._2049))
            {
               return _loc1_._2049._2104;
            }
         }
         return null;
      }
      
      public function get transform() : _86
      {
         this._5661 = true;
         this.parent._5039(this,this._5659);
         _88._2013(this._5659,this._matrix);
         return this._5659;
      }
      
      public function get _10358() : Boolean
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         _loc1_ = 0;
         _loc2_ = int(this.tweens.length);
         while(_loc1_ < _loc2_)
         {
            if(!(this.tweens[_loc1_] is _63))
            {
               if(this.tweens[_loc1_]._10279)
               {
                  return true;
               }
            }
            _loc1_++;
         }
         return false;
      }
      
      public function get _10359() : Boolean
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         _loc1_ = 0;
         _loc2_ = int(this.tweens.length);
         while(_loc1_ < _loc2_)
         {
            if(!(this.tweens[_loc1_] is _64))
            {
               if(this.tweens[_loc1_]._10280)
               {
                  return true;
               }
            }
            _loc1_++;
         }
         return false;
      }
      
      public function get _10360() : Boolean
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         _loc1_ = 0;
         _loc2_ = int(this.tweens.length);
         while(_loc1_ < _loc2_)
         {
            if(!(this.tweens[_loc1_] is _65))
            {
               if(this.tweens[_loc1_]._10281)
               {
                  return true;
               }
            }
            _loc1_++;
         }
         return false;
      }
      
      public function get _10279() : Boolean
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         _loc1_ = 0;
         _loc2_ = int(this.tweens.length);
         while(_loc1_ < _loc2_)
         {
            if(this.tweens[_loc1_]._10279)
            {
               return true;
            }
            _loc1_++;
         }
         return false;
      }
      
      public function get _10280() : Boolean
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         _loc1_ = 0;
         _loc2_ = int(this.tweens.length);
         while(_loc1_ < _loc2_)
         {
            if(this.tweens[_loc1_]._10280)
            {
               return true;
            }
            _loc1_++;
         }
         return false;
      }
      
      public function get _10281() : Boolean
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         _loc1_ = 0;
         _loc2_ = int(this.tweens.length);
         while(_loc1_ < _loc2_)
         {
            if(this.tweens[_loc1_]._10281)
            {
               return true;
            }
            _loc1_++;
         }
         return false;
      }
      
      public function get _10282() : Boolean
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         _loc1_ = 0;
         _loc2_ = int(this.tweens.length);
         while(_loc1_ < _loc2_)
         {
            if(this.tweens[_loc1_]._10282)
            {
               return true;
            }
            _loc1_++;
         }
         return false;
      }
      
      public function get _1724() : _86
      {
         return this._5659;
      }
      
      public function get currentLocalTransform() : _86
      {
         return this._5659;
      }
      
      public function get globalTransform() : _86
      {
         if(!this._5661)
         {
            return this.transform;
         }
         return this._5659;
      }
      
      public function get _2009() : Matrix
      {
         return this._matrix;
      }
      
      public function _5070() : Vector.<TimelineVOBase>
      {
         var _loc1_:Vector.<_45> = null;
         var _loc3_:_41 = null;
         var _loc4_:_48 = null;
         var _loc13_:BoneFrameVO = null;
         var _loc14_:_47 = null;
         var _loc15_:BoneFrameVO = null;
         var _loc16_:_47 = null;
         var _loc17_:int = 0;
         var _loc18_:int = 0;
         var _loc19_:int = 0;
         var _loc20_:int = 0;
         var _loc21_:_646 = null;
         var _loc2_:Vector.<TimelineVOBase> = new Vector.<TimelineVOBase>();
         var _loc5_:_86 = new _86();
         var _loc6_:_83 = new _83();
         var _loc7_:_86 = this._1836._1724;
         var _loc8_:BoneFrameVO = new BoneFrameVO(this._1836,true,-1);
         var _loc9_:_53 = this.parent.parent._1992;
         var _loc10_:uint = this._1836.rootArmatureData.frameRate;
         if(_loc10_ <= 0)
         {
            _loc10_ = Timeline.DEFAULT_FPS;
         }
         _loc8_.transform = _loc5_;
         var _loc11_:_47 = new _47(this._1837,true,-1);
         _loc6_.copyFrom(this._1837._2152);
         _loc11_.colorTransform = _loc6_;
         _loc11_._1732 = this._1837._1923;
         _loc3_ = new _41([_loc8_],-1);
         _loc3_._1823 = this._1836;
         (_loc4_ = new _48([_loc11_],-1))._1824 = this._1837;
         var _loc12_:int = int(this.parent.tracks.indexOf(this));
         if(_loc12_ > 0)
         {
            _loc21_ = this.parent.tracks[_loc12_ - 1];
            this.parent._5039(_loc21_,_loc5_);
            this.parent._5656(_loc21_,_loc6_);
            _loc5_.x -= _loc7_.x;
            _loc5_.y -= _loc7_.y;
            _loc5_.rotation -= _loc7_.rotation;
            _loc5_.scaleX /= _loc7_.scaleX;
            _loc5_.scaleY /= _loc7_.scaleY;
         }
         _loc19_ = 0;
         _loc20_ = int(this.tweens.length);
         while(_loc19_ < _loc20_)
         {
            _loc9_._2047(this.tweens[_loc19_],_loc3_,_loc4_,0,int(this.during * _loc10_));
            _loc19_++;
         }
         _loc2_.push(_loc3_);
         _loc2_.push(_loc4_);
         return _loc2_;
      }
      
      public function _10477() : Vector.<TimelineVOBase>
      {
         var _loc1_:Vector.<_45> = null;
         var _loc3_:_41 = null;
         var _loc4_:_48 = null;
         var _loc14_:BoneFrameVO = null;
         var _loc15_:_47 = null;
         var _loc16_:BoneFrameVO = null;
         var _loc17_:_47 = null;
         var _loc18_:int = 0;
         var _loc19_:int = 0;
         var _loc20_:int = 0;
         var _loc21_:int = 0;
         var _loc22_:_646 = null;
         var _loc2_:Vector.<TimelineVOBase> = new Vector.<TimelineVOBase>();
         var _loc5_:_86 = new _86();
         var _loc6_:_83 = new _83();
         var _loc7_:_86 = this._1836._1724;
         var _loc8_:BoneFrameVO = new BoneFrameVO(this._1836,true,-1);
         var _loc9_:_53 = this.parent.parent._1992;
         var _loc10_:uint = this._1836.rootArmatureData.frameRate;
         if(_loc10_ <= 0)
         {
            _loc10_ = Timeline.DEFAULT_FPS;
         }
         _loc8_.transform = _loc5_;
         var _loc11_:_47;
         (_loc11_ = new _47(this._1837,true,-1)).colorTransform = _loc6_;
         _loc11_._1732 = this._1837._1923;
         _loc3_ = new _41([_loc8_],-1);
         _loc3_._1823 = this._1836;
         (_loc4_ = new _48([_loc11_],-1))._1824 = this._1837;
         var _loc12_:int = int(this.parent.tracks.indexOf(this));
         if(_loc12_ > 0)
         {
            _loc22_ = this.parent.tracks[_loc12_ - 1];
            this.parent._5039(_loc22_,_loc5_);
            _loc5_.rotation -= _loc7_.rotation;
         }
         var _loc13_:Number = _loc5_.rotation;
         _loc22_ = this;
         this.parent._5039(_loc22_,_loc5_);
         this.parent._5656(_loc22_,_loc6_);
         _loc5_.x -= _loc7_.x;
         _loc5_.y -= _loc7_.y;
         if(_loc12_ == 0)
         {
            _loc5_.rotation = _loc7_.rotation;
         }
         else
         {
            _loc5_.rotation = _loc13_;
         }
         _loc5_.scaleX /= _loc7_.scaleX;
         _loc5_.scaleY /= _loc7_.scaleY;
         _loc20_ = 0;
         _loc21_ = int(this.tweens.length);
         while(_loc20_ < _loc21_)
         {
            if(this.tweens[_loc20_].loop)
            {
               _loc9_._2047(this.tweens[_loc20_],_loc3_,_loc4_,0,int(this.during * _loc10_));
            }
            _loc20_++;
         }
         _loc2_.push(_loc3_);
         _loc2_.push(_loc4_);
         return _loc2_;
      }
   }
}

