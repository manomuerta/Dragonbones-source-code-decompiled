package _644
{
   import _51._52;
   import _51._79;
   import _54._57;
   import _54._58;
   import _54._63;
   import _54._64;
   import _54._65;
   import _54._67;
   import _81._83;
   import _81._86;
   import flash.geom.Point;
   
   public class _645
   {
      public var tracks:Vector.<_646>;
      
      public var _1837:_79;
      
      public var _1836:_52;
      
      public var parent:_643;
      
      public var _3107:_646;
      
      public var _10287:_646;
      
      public function _645(param1:_643, param2:_79, param3:_52)
      {
         super();
         this.tracks = new Vector.<_646>();
         this._1837 = param2;
         this._1836 = param3;
         this.parent = param1;
      }
      
      public function _5652(param1:_57, param2:_67) : _646
      {
         var _loc3_:_646 = null;
         if(param2.appear)
         {
            _loc3_ = new _646(this);
            _loc3_.track = param1;
            _loc3_.tweens.push(param2);
            this._3107 = _loc3_;
         }
         else if(param2._10283)
         {
            _loc3_ = new _646(this);
            _loc3_.track = param1;
            _loc3_.tweens.push(param2);
            this._10287 = _loc3_;
         }
         else
         {
            _loc3_ = this._3098(param1);
            _loc3_.track = param1;
            _loc3_.tweens.push(param2);
         }
         return _loc3_;
      }
      
      public function _3066(param1:_57, param2:_67, param3:int) : _646
      {
         var _loc4_:_646;
         (_loc4_ = this._3098(param1)).track = param1;
         _loc4_.tweens.push(param2);
         var _loc5_:int = int(this.tracks.indexOf(_loc4_));
         this.tracks.splice(_loc5_,1);
         if(_loc4_._3071)
         {
            this._3107 = _loc4_;
         }
         else if(_loc4_._10286)
         {
            this._10287 = _loc4_;
         }
         else
         {
            this.tracks.splice(param3,0,_loc4_);
         }
         return _loc4_;
      }
      
      public function _3064(param1:_57, param2:_67) : _646
      {
         var _loc4_:int = 0;
         var _loc3_:_646 = this._3098(param1);
         if(_loc3_._3071)
         {
            this._3107 = null;
         }
         else if(_loc3_._10286)
         {
            this._10287 = null;
         }
         else
         {
            _loc3_._2075(param2);
            if(_loc3_.isEmpty())
            {
               _loc4_ = int(this.tracks.indexOf(_loc3_));
               if(_loc4_ >= 0)
               {
                  this.tracks.splice(_loc4_,1);
               }
            }
         }
         return _loc3_;
      }
      
      public function _2073(param1:_646) : void
      {
         if(param1 == this._3107)
         {
            this._3107 = null;
            return;
         }
         if(param1 == this._10287)
         {
            this._10287 = null;
            return;
         }
         var _loc2_:int = int(this.tracks.indexOf(param1));
         if(_loc2_ >= 0)
         {
            this.tracks.splice(_loc2_,1);
         }
      }
      
      public function _2074(param1:_646, param2:int) : void
      {
         if(param2 == -1 && param1._3071)
         {
            this._3107 = param1;
            return;
         }
         if(param1._10286)
         {
            this._10287 = param1;
            return;
         }
         if(this.tracks.indexOf(param1) == -1)
         {
            param1.parent = this;
            this.tracks.splice(param2,0,param1);
         }
      }
      
      public function _10366(param1:int) : _646
      {
         if(param1 >= this.tracks.length || param1 < 0)
         {
            return null;
         }
         return this.tracks[param1];
      }
      
      public function _3098(param1:_57) : _646
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(Boolean(this._3107) && this._3107.track == param1)
         {
            return this._3107;
         }
         if(Boolean(this._10287) && this._10287.track == param1)
         {
            return this._10287;
         }
         _loc2_ = 0;
         _loc3_ = int(this.tracks.length);
         while(_loc2_ < _loc3_)
         {
            if(this.tracks[_loc2_].track == param1)
            {
               return this.tracks[_loc2_];
            }
            _loc2_++;
         }
         var _loc4_:_646 = new _646(this);
         this.tracks.push(_loc4_);
         return _loc4_;
      }
      
      public function _5039(param1:_646, param2:_86) : void
      {
         var _loc3_:_63 = null;
         var _loc4_:_64 = null;
         var _loc5_:_65 = null;
         var _loc6_:_646 = null;
         param2.copyFrom(this._1836.globalTransform);
         var _loc7_:int = int(this.tracks.indexOf(param1));
         while(_loc7_ >= 0)
         {
            _loc6_ = this.tracks[_loc7_];
            if(_loc3_ == null)
            {
               _loc3_ = _loc6_._5110();
            }
            if(_loc4_ == null)
            {
               _loc4_ = _loc6_._5109();
            }
            if(_loc5_ == null)
            {
               _loc5_ = _loc6_._5114();
            }
            if(_loc3_ != null && _loc4_ != null && _loc5_ != null)
            {
               break;
            }
            _loc7_--;
         }
         if(_loc3_)
         {
            this._5657(_loc3_,param2);
         }
         if(_loc4_)
         {
            this._5657(_loc4_,param2);
         }
         if(_loc5_)
         {
            this._5657(_loc5_,param2);
         }
      }
      
      public function _5656(param1:_646, param2:_83) : void
      {
         var _loc3_:_58 = null;
         var _loc4_:_646 = null;
         param2.copyFrom(this._1837._1926);
         var _loc5_:int = int(this.tracks.indexOf(param1));
         while(_loc5_ >= 0)
         {
            _loc4_ = this.tracks[_loc5_];
            if(_loc3_ == null)
            {
               _loc3_ = _loc4_._5658();
            }
            if(_loc3_ != null)
            {
               break;
            }
            _loc5_--;
         }
         if(_loc3_)
         {
            param2.alphaMultiplier *= _loc3_.alpha;
         }
      }
      
      private function _5657(param1:_67, param2:_86) : void
      {
         var _loc3_:Point = null;
         var _loc4_:Point = null;
         var _loc5_:Number = NaN;
         if(param1 is _58)
         {
            return;
         }
         if(param1 is _63)
         {
            _loc3_ = (param1 as _63).position;
            param2.x += _loc3_.x;
            param2.y += _loc3_.y;
         }
         else if(param1 is _65)
         {
            _loc4_ = (param1 as _65).scale;
            param2.scaleX *= _loc4_.x;
            param2.scaleY *= _loc4_.y;
         }
         else if(param1 is _64)
         {
            _loc5_ = (param1 as _64).rotation;
            param2.rotation += _loc5_;
         }
      }
      
      public function _3594() : Vector.<_67>
      {
         var _loc2_:_646 = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc1_:Vector.<_67> = new Vector.<_67>();
         var _loc3_:int = 0;
         var _loc4_:int = int(this.tracks.length);
         while(_loc3_ < _loc4_)
         {
            _loc2_ = this.tracks[_loc3_];
            _loc5_ = 0;
            _loc6_ = int(_loc2_.tweens.length);
            while(_loc5_ < _loc6_)
            {
               _loc1_.push(_loc2_.tweens[_loc5_]);
               _loc5_++;
            }
            _loc3_++;
         }
         if(this._3107)
         {
            _loc3_ = 0;
            _loc4_ = int(this._3107.tweens.length);
            while(_loc3_ < _loc4_)
            {
               _loc1_.push(this._3107.tweens[_loc3_]);
               _loc3_++;
            }
         }
         if(this._10287)
         {
            _loc3_ = 0;
            _loc4_ = int(this._10287.tweens.length);
            while(_loc3_ < _loc4_)
            {
               _loc1_.push(this._10287.tweens[_loc3_]);
               _loc3_++;
            }
         }
         return _loc1_;
      }
   }
}

