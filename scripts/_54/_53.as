package _54
{
   import _40.BoneFrameVO;
   import _40._39;
   import _40._41;
   import _40._44;
   import _40._45;
   import _40._47;
   import _40._48;
   import _51._50;
   import _51._52;
   import _51._69;
   import _51._70;
   import _51._71;
   import _51._78;
   import _51._79;
   import _73.SymbolType;
   import _73._75;
   import _81._83;
   import _978.Timeline;
   import flash.utils.Dictionary;
   
   public class _53
   {
      public static const COMIC_ANIMATION_NAME:String = "comic";
      
      public var parent:_50;
      
      public var _2062:Vector.<_56>;
      
      private var _2060:_39;
      
      private var _2072:int = 30;
      
      private var _10438:Vector.<_48>;
      
      private var _10445:Vector.<int>;
      
      public function _53(param1:_50)
      {
         super();
         this._2062 = new Vector.<_56>();
         this.parent = param1;
         this._10445 = new Vector.<int>();
         this._10438 = new Vector.<_48>();
      }
      
      public function _2064() : Boolean
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:_56 = null;
         var _loc6_:Boolean = false;
         _loc1_ = 0;
         _loc2_ = int(this._2062.length - 1);
         while(_loc1_ < _loc2_)
         {
            _loc4_ = _loc2_ - _loc1_;
            _loc3_ = 0;
            while(_loc3_ < _loc4_)
            {
               if(this._2062[_loc3_].height > this._2062[_loc3_ + 1].height)
               {
                  _loc6_ = true;
                  _loc5_ = this._2062[_loc3_];
                  this._2062[_loc3_] = this._2062[_loc3_ + 1];
                  this._2062[_loc3_ + 1] = _loc5_;
               }
               _loc3_++;
            }
            _loc1_++;
         }
         return _loc6_;
      }
      
      public function _1827(param1:_56) : void
      {
         if(this._2062.indexOf(param1) == -1)
         {
            this._2062.splice(this._2062.length,0,param1);
         }
         param1.parent = this;
      }
      
      public function _2063(param1:_56, param2:int) : void
      {
         if(this._2062.indexOf(param1) == -1)
         {
            this._2062.splice(param2,0,param1);
         }
         param1.parent = this;
      }
      
      public function _2061(param1:_56) : void
      {
         var _loc2_:int = int(this._2062.indexOf(param1));
         if(_loc2_ >= 0)
         {
            this._2062.splice(_loc2_,1);
         }
      }
      
      public function _2044() : _39
      {
         var _loc2_:int = 0;
         if(this._2060 == null)
         {
            this._2060 = new _39();
            this._2060.name = COMIC_ANIMATION_NAME;
         }
         if(this._2060._1746 == null)
         {
            this._2060._1746 = [];
         }
         else
         {
            this._2060._1746.length = 0;
         }
         if(this._2060._1745 == null)
         {
            this._2060._1745 = [];
         }
         else
         {
            this._2060._1745.length = 0;
         }
         this._2060._1816.length = 0;
         var _loc1_:int = 0;
         var _loc3_:int = 0;
         this._2072 = this.parent.frameRate;
         if(this._2072 <= 0)
         {
            this._2072 = Timeline.DEFAULT_FPS;
         }
         _loc1_ = 0;
         _loc2_ = int(this._2062.length);
         while(_loc1_ < _loc2_)
         {
            this._2051(this._2062[_loc1_],_loc3_);
            _loc3_ += this._2062[_loc1_].duration * this._2072;
            _loc1_++;
         }
         var _loc4_:_44;
         (_loc4_ = new _44())._1622 = _75.DISPATCH_EVENT;
         _loc4_.value = "stop";
         var _loc5_:_45 = new _45(false);
         _loc5_._1636.push(_loc4_);
         _loc5_.startPos = _loc3_;
         _loc5_.duration = 1;
         this._2060._1816.push(_loc5_);
         this._2060.duration = _loc3_ + 1;
         return this._2060;
      }
      
      public function _2046() : Object
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc7_:_52 = null;
         var _loc8_:_79 = null;
         var _loc1_:Array = [];
         _loc2_ = 0;
         _loc3_ = int(this._2062.length);
         while(_loc2_ < _loc3_)
         {
            _loc1_.push({
               "frame":_loc4_,
               "height":this._2062[_loc2_].height
            });
            _loc4_ += this._2062[_loc2_].duration * this._2072;
            _loc2_++;
         }
         var _loc5_:Number = 0;
         var _loc6_:Number = 0;
         _loc2_ = 0;
         _loc3_ = int(this.parent._1779.length);
         while(_loc2_ < _loc3_)
         {
            _loc7_ = this.parent._1779[_loc2_] as _52;
            if((Boolean(_loc8_ = _loc7_._1882)) && Boolean(_loc8_._2049))
            {
               _loc6_ = _loc7_._1724.y + _loc8_._2049.height / 2;
               if(_loc5_ < _loc6_)
               {
                  _loc5_ = _loc6_;
               }
            }
            _loc2_++;
         }
         _loc1_.push({
            "frame":_loc4_,
            "height":_loc5_
         });
         return _loc1_;
      }
      
      private function _2051(param1:_56, param2:int) : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:_57 = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:_67 = null;
         var _loc11_:int = 0;
         var _loc13_:_41 = null;
         var _loc14_:_48 = null;
         if(param1.tracks.length == 0)
         {
            return;
         }
         var _loc3_:_44 = new _44();
         _loc3_._1622 = _75.DISPATCH_EVENT;
         _loc3_.value = "stop";
         var _loc4_:_45 = new _45(false);
         if(param2 > 0)
         {
            _loc4_._1636.push(_loc3_);
         }
         _loc4_.startPos = param2;
         _loc4_.duration = param1.duration * this._2072;
         this._2060._1816.push(_loc4_);
         var _loc12_:int = param2;
         _loc5_ = 0;
         _loc6_ = int(param1.tracks.length);
         while(_loc5_ < _loc6_)
         {
            _loc7_ = param1.tracks[_loc5_];
            _loc11_ = _loc12_ + int(_loc7_.during * this._2072);
            _loc8_ = 0;
            _loc9_ = int(_loc7_.tweens.length);
            while(_loc8_ < _loc9_)
            {
               _loc10_ = _loc7_.tweens[_loc8_];
               _loc14_ = this._1875(_loc10_._1837);
               _loc13_ = this._1873(_loc10_._1836);
               this._2047(_loc10_,_loc13_,_loc14_,_loc12_,_loc11_);
               _loc8_++;
            }
            _loc12_ = _loc11_;
            _loc5_++;
         }
      }
      
      public function _2047(param1:_67, param2:_41, param3:_48, param4:int, param5:int) : void
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc9_:_62 = null;
         var _loc10_:_66 = null;
         var _loc11_:BoneFrameVO = null;
         var _loc12_:_47 = null;
         var _loc13_:BoneFrameVO = null;
         var _loc14_:_47 = null;
         var _loc15_:BoneFrameVO = null;
         var _loc16_:Number = NaN;
         var _loc17_:BoneFrameVO = null;
         var _loc18_:_47 = null;
         var _loc8_:Vector.<_45> = param1._2065();
         _loc13_ = param2._1933(param4) as BoneFrameVO;
         _loc14_ = param3._1933(param4) as _47;
         if(_loc13_)
         {
            _loc13_ = _loc13_.clone() as BoneFrameVO;
         }
         _loc6_ = 0;
         _loc7_ = int(_loc8_.length);
         while(_loc6_ < _loc7_)
         {
            if(_loc8_[_loc6_] is _62)
            {
               _loc9_ = _loc8_[_loc6_] as _62;
               _loc11_ = param2._1938(param4 + _loc9_.startPos) as BoneFrameVO;
               if(_loc11_ == null)
               {
                  if(_loc13_)
                  {
                     _loc11_ = _loc13_.clone() as BoneFrameVO;
                  }
                  else
                  {
                     _loc11_ = param2._1933(param4 + _loc9_.startPos) as BoneFrameVO;
                     if(_loc11_)
                     {
                        _loc11_ = _loc11_.clone() as BoneFrameVO;
                     }
                     else
                     {
                        _loc11_ = new BoneFrameVO(_loc9_._1823,_loc9_.tweenEnabled,-1);
                     }
                  }
                  this._2043(_loc9_,_loc11_);
                  _loc11_.startPos = param4 + _loc9_.startPos;
                  param2.addKeyFrameAt(_loc11_,_loc11_.startPos);
               }
               else if(_loc11_)
               {
                  _loc11_.duration = _loc9_.duration;
                  this._2043(_loc9_,_loc11_);
               }
               if(_loc15_ != null)
               {
                  _loc16_ = _loc11_.transform.rotation - _loc15_.transform.rotation;
                  _loc15_.tweenRotate = _loc16_ / (2 * Math.PI);
                  if(_loc15_.tweenRotate == 0)
                  {
                     _loc15_.tweenRotate = _loc16_ == 0 ? 0 : (_loc16_ > 0 ? 1 : -1);
                  }
                  else if(_loc15_.tweenRotate > 0)
                  {
                     ++_loc15_.tweenRotate;
                  }
                  else
                  {
                     --_loc15_.tweenRotate;
                  }
               }
               _loc15_ = _loc11_;
            }
            else if(_loc8_[_loc6_] is _66)
            {
               _loc10_ = _loc8_[_loc6_] as _66;
               _loc12_ = param3._1938(param4 + _loc10_.startPos) as _47;
               if(_loc12_ == null)
               {
                  if(_loc14_)
                  {
                     _loc12_ = _loc14_.clone() as _47;
                  }
                  else
                  {
                     _loc12_ = param3._1933(param4 + _loc10_.startPos) as _47;
                     if(_loc12_)
                     {
                        _loc12_ = _loc12_.clone() as _47;
                     }
                     else
                     {
                        _loc12_ = new _47(_loc10_._1824,_loc10_.tweenEnabled,-1);
                     }
                  }
                  this._2042(_loc10_,_loc12_);
                  _loc12_.startPos = param4 + _loc10_.startPos;
                  if(_loc10_._1732 == null)
                  {
                     if(param3._1938(0) == null)
                     {
                        _loc12_.startPos = 0;
                     }
                  }
                  param3.addKeyFrameAt(_loc12_,_loc12_.startPos);
               }
               else if(_loc12_)
               {
                  _loc12_.duration = _loc10_.duration;
                  this._2042(_loc10_,_loc12_);
               }
            }
            _loc6_++;
         }
         if(Boolean(_loc11_) && _loc11_.endPos != param5)
         {
            _loc11_.endPos = param5;
            (_loc17_ = _loc11_.clone() as BoneFrameVO).duration = 0;
            _loc17_.startPos = param5;
            _loc11_ = param2._1938(param5) as BoneFrameVO;
            if(_loc11_ == null)
            {
               param2.addKeyFrameAt(_loc17_,_loc17_.startPos);
            }
            else if(_loc11_)
            {
               _loc11_.transform.x += _loc17_.transform.x;
               _loc11_.transform.y += _loc17_.transform.y;
               _loc11_.transform.scaleX *= _loc17_.transform.scaleX;
               _loc11_.transform.scaleY *= _loc17_.transform.scaleY;
               _loc11_.transform.rotation += _loc17_.transform.rotation;
            }
         }
         if(Boolean(_loc10_) && _loc10_.endPos != param5)
         {
            _loc10_.endPos = param5;
            (_loc18_ = _loc10_.clone() as _47).duration = 0;
            _loc18_.startPos = param5;
            _loc12_ = param3._1938(param5) as _47;
            if(_loc12_ == null)
            {
               param3.addKeyFrameAt(_loc18_,_loc18_.startPos);
            }
            else if(_loc12_)
            {
               _loc12_.colorTransform.alphaMultiplier *= _loc18_.colorTransform.alphaMultiplier;
               _loc12_._1732 = _loc18_._1732;
            }
         }
      }
      
      private function _2043(param1:_62, param2:BoneFrameVO) : void
      {
         var _loc3_:int = 0;
         if(param1._10268 == _62.OPER_OVERRIDE)
         {
            param2.tweenType = param1.tweenType;
            param2.tweenCurve = param1.tweenCurve;
         }
         switch(param1._10271)
         {
            case _62.OPER_OVERRIDE:
               param2.transform.x = param1.transform.x;
               break;
            case _62.OPER_OFFSET:
               param2.transform.x += param1.transform.x;
         }
         switch(param1._10272)
         {
            case _62.OPER_OVERRIDE:
               param2.transform.y = param1.transform.y;
               break;
            case _62.OPER_OFFSET:
               param2.transform.y += param1.transform.y;
         }
         switch(param1._10265)
         {
            case _62.OPER_OVERRIDE:
               param2.transform.rotation = param1.transform.rotation;
               break;
            case _62.OPER_OFFSET:
               param2.transform.rotation += param1.transform.rotation;
         }
         switch(param1._10266)
         {
            case _62.OPER_OVERRIDE:
               param2.transform.scaleX = param1.transform.scaleX;
               break;
            case _62.OPER_OFFSET:
               param2.transform.scaleX *= param1.transform.scaleX;
         }
         switch(param1._10267)
         {
            case _62.OPER_OVERRIDE:
               param2.transform.scaleY = param1.transform.scaleY;
               break;
            case _62.OPER_OFFSET:
               param2.transform.scaleY *= param1.transform.scaleY;
         }
         param2._1636.length = 0;
         if(param1._1636.length > 0)
         {
            _loc3_ = int(param1._1636.length - 1);
            while(_loc3_ >= 0)
            {
               param2._1636.push(param1._1636[_loc3_]);
               _loc3_--;
            }
         }
      }
      
      private function _2042(param1:_66, param2:_47) : void
      {
         switch(param1._10268)
         {
            case _66.OPER_OVERRIDE:
               param2.tweenType = param1.tweenType;
               param2.tweenCurve = param1.tweenCurve;
         }
         switch(param1._10269)
         {
            case _66.OPER_OVERRIDE:
               param2.colorTransform.alphaMultiplier = param1.colorTransform.alphaMultiplier;
         }
         param2._1732 = param1._1732;
         if(param1.gotoAndPlay)
         {
            param2.gotoAndPlay = param1.gotoAndPlay;
         }
         else if(param1._10453 == _66.OPER_OVERRIDE)
         {
            param2.gotoAndPlay = param1.gotoAndPlay;
         }
      }
      
      private function _2053(param1:_52) : BoneFrameVO
      {
         return new BoneFrameVO(param1,true,-1);
      }
      
      private function _2052(param1:_79) : _47
      {
         return new _47(param1,true,-1);
      }
      
      private function _1873(param1:_52) : _41
      {
         var _loc2_:_41 = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         _loc3_ = 0;
         _loc4_ = int(this._2060._1746.length);
         while(_loc3_ < _loc4_)
         {
            _loc2_ = this._2060._1746[_loc3_] as _41;
            if(_loc2_._1823 == param1)
            {
               return _loc2_;
            }
            _loc3_++;
         }
         var _loc5_:BoneFrameVO = new BoneFrameVO(param1,true,-1);
         _loc2_ = _41._1869(param1,[_loc5_]);
         this._2060._1746.push(_loc2_);
         return _loc2_;
      }
      
      private function _1875(param1:_79) : _48
      {
         var _loc2_:_48 = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         _loc3_ = 0;
         _loc4_ = int(this._2060._1745.length);
         while(_loc3_ < _loc4_)
         {
            _loc2_ = this._2060._1745[_loc3_] as _48;
            if(_loc2_._1824 == param1)
            {
               return _loc2_;
            }
            _loc3_++;
         }
         _loc2_ = _48._1869(param1);
         this._2060._1745.push(_loc2_);
         return _loc2_;
      }
      
      public function _2045(param1:_79) : _56
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         _loc2_ = 0;
         _loc3_ = int(this._2062.length);
         while(_loc2_ < _loc3_)
         {
            if(this._2062[_loc2_]._2068 == param1)
            {
               return this._2062[_loc2_];
            }
            _loc2_++;
         }
         return null;
      }
      
      public function _2048(param1:_67, param2:_79, param3:Boolean) : _67
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:_56 = null;
         var _loc11_:_57 = null;
         var _loc12_:_67 = null;
         var _loc13_:_67 = null;
         var _loc4_:int = 0;
         _loc4_ = 0;
         _loc5_ = int(this._2062.length);
         while(_loc4_ < _loc5_)
         {
            _loc10_ = this._2062[_loc4_];
            _loc6_ = 0;
            _loc5_ = int(_loc10_.tracks.length);
            while(_loc6_ < _loc5_)
            {
               _loc11_ = _loc10_.tracks[_loc6_];
               _loc8_ = 0;
               _loc9_ = int(_loc11_.tweens.length);
               while(_loc8_ < _loc9_)
               {
                  _loc12_ = _loc11_.tweens[_loc8_];
                  if(!param3)
                  {
                     if(_loc12_._1837 == param2)
                     {
                        _loc13_ = _loc12_;
                     }
                  }
                  if(_loc12_ == param1)
                  {
                     return _loc13_;
                  }
                  if(_loc12_._1837 == param2)
                  {
                     _loc13_ = _loc12_;
                  }
                  _loc8_++;
               }
               _loc6_++;
            }
            _loc4_++;
         }
         return null;
      }
      
      public function get children() : Array
      {
         var _loc2_:_56 = null;
         var _loc1_:Array = [];
         for each(_loc2_ in this._2062)
         {
            _loc1_.push(_loc2_);
         }
         return _loc1_;
      }
      
      public function _10440() : _71
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:_56 = null;
         var _loc11_:_57 = null;
         var _loc12_:_67 = null;
         var _loc14_:_79 = null;
         var _loc15_:_50 = null;
         var _loc1_:_71 = new _71();
         var _loc2_:Vector.<_79> = new Vector.<_79>();
         var _loc3_:Dictionary = new Dictionary();
         this._10445.length = 0;
         this._10438.length = 0;
         _loc4_ = 0;
         _loc5_ = int(this._2062.length);
         while(_loc4_ < _loc5_)
         {
            _loc10_ = this._2062[_loc4_];
            _loc6_ = 0;
            _loc7_ = int(_loc10_.tracks.length);
            while(_loc6_ < _loc7_)
            {
               _loc11_ = _loc10_.tracks[_loc6_];
               _loc8_ = 0;
               _loc9_ = int(_loc11_.tweens.length);
               while(_loc8_ < _loc9_)
               {
                  _loc12_ = _loc11_.tweens[_loc8_];
                  if(_loc12_.loop)
                  {
                     if(_loc3_[_loc12_._1837] == null)
                     {
                        _loc2_.push(_loc12_._1837);
                        _loc3_[_loc12_._1837] = [];
                     }
                     _loc3_[_loc12_._1837].push(_loc12_);
                  }
                  _loc8_++;
               }
               _loc6_++;
            }
            _loc4_++;
         }
         var _loc13_:Vector.<_50> = new Vector.<_50>();
         _loc4_ = 0;
         _loc5_ = int(_loc2_.length);
         while(_loc4_ < _loc5_)
         {
            _loc14_ = _loc2_[_loc4_];
            _loc13_.push(this._10443(_loc14_));
            _loc4_++;
         }
         _loc1_._2126 = new Vector.<_50>();
         var _loc16_:_50 = this._10449(this.parent,_loc13_);
         _loc1_._2128(_loc16_);
         _loc4_ = 0;
         _loc5_ = int(_loc13_.length);
         while(_loc4_ < _loc5_)
         {
            _loc1_._2128(_loc13_[_loc4_]);
            _loc4_++;
         }
         var _loc17_:_39 = this._10441(_loc16_,_loc13_);
         _loc16_._1963.push(_loc17_);
         if(this._10445.length > 0)
         {
            _loc4_ = 0;
            _loc5_ = int(this._10438.length);
            while(_loc4_ < _loc5_)
            {
               this._10439(this._10445[_loc4_],this._10438[_loc4_]);
               _loc4_++;
            }
         }
         return _loc1_;
      }
      
      private function _10443(param1:_79) : _50
      {
         var _loc2_:_50 = _50._1782(param1.name,SymbolType.ARMATURE,-1);
         _loc2_.frameRate = this.parent.frameRate;
         var _loc3_:_52 = _52._1729("root",null,-1);
         _loc2_._1794(_loc3_);
         var _loc4_:_52 = _52._1729(param1.name,_loc3_,-1);
         _loc2_._1794(_loc4_);
         var _loc5_:_79;
         (_loc5_ = new _79(-1)).name = param1.name;
         _loc5_.parentBoneData = _loc4_;
         _loc5_._1718(_69._1807(0));
         _loc2_._1792(_loc5_);
         var _loc6_:_78;
         (_loc6_ = new _78(-1)).name = "";
         _loc2_._1790(_loc6_);
         var _loc7_:_70;
         (_loc7_ = _70._2090(param1._2049._2104))._1733 = _loc5_._1715[0];
         _loc7_._1760 = _loc5_;
         _loc6_._1766(_loc7_);
         _loc5_._1711 = _loc5_._1715[0];
         return _loc2_;
      }
      
      private function _10449(param1:_50, param2:Vector.<_50>) : _50
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc11_:_70 = null;
         var _loc12_:_79 = null;
         var _loc13_:String = null;
         var _loc3_:_50 = _50._1782(param1.name,SymbolType.COMIC,-1);
         _loc3_._1763 = this;
         _loc3_._2000 = this.parent._2000;
         var _loc4_:_52 = this._10452(param1._1990,null);
         var _loc5_:Vector.<_52> = _loc4_._2021();
         _loc3_._1794(_loc4_);
         _loc6_ = 0;
         _loc7_ = int(_loc5_.length);
         while(_loc6_ < _loc7_)
         {
            _loc3_._1794(_loc5_[_loc6_]);
            _loc6_++;
         }
         var _loc10_:_78;
         (_loc10_ = new _78(-1)).name = "";
         _loc3_._1790(_loc10_);
         _loc6_ = 0;
         _loc7_ = int(param1._1780.length);
         while(_loc6_ < _loc7_)
         {
            (_loc12_ = new _79(-1)).name = param1._1780[_loc6_].name;
            _loc12_.parentBoneData = _loc3_._1817((param1._1780[_loc6_] as _79).parentBoneData.name);
            _loc12_._2152.copyFrom((param1._1780[_loc6_] as _79)._2152);
            _loc3_._1792(_loc12_);
            _loc11_ = null;
            _loc13_ = (param1._1780[_loc6_] as _79).name;
            _loc8_ = 0;
            _loc9_ = int(param2.length);
            while(_loc8_ < _loc9_)
            {
               if(param2[_loc8_].name == _loc13_)
               {
                  _loc11_ = _70._1743(_loc13_,-1);
               }
               _loc8_++;
            }
            if(_loc11_ == null)
            {
               _loc11_ = _70._2090((param1._1780[_loc6_] as _79)._2049._2104,-1);
            }
            _loc12_._1718(_69._1807(0));
            _loc11_._1733 = _loc12_._1715[0];
            _loc11_._1760 = _loc12_;
            _loc10_._1766(_loc11_);
            _loc12_._1711 = _loc12_._1715[0];
            _loc6_++;
         }
         return _loc3_;
      }
      
      private function _10452(param1:_52, param2:_52, param3:Boolean = true) : _52
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:_52 = null;
         var _loc4_:_52 = _52._1729(param1.name,param2,-1);
         _loc4_._1724.copyFrom(param1._1724);
         if(param3)
         {
            _loc5_ = 0;
            _loc6_ = int(param1._2024.length);
            while(_loc5_ < _loc6_)
            {
               _loc7_ = this._10452(param1._2024[_loc5_],_loc4_);
               if(_loc4_._2024.indexOf(_loc7_) == -1)
               {
                  _loc4_._2024.push(_loc7_);
               }
               _loc5_++;
            }
         }
         return _loc4_;
      }
      
      public function _10441(param1:_50, param2:Vector.<_50>) : _39
      {
         var _loc4_:int = 0;
         if(this._2060 == null)
         {
            this._2060 = new _39();
            this._2060.name = COMIC_ANIMATION_NAME;
         }
         if(this._2060._1746 == null)
         {
            this._2060._1746 = [];
         }
         else
         {
            this._2060._1746.length = 0;
         }
         if(this._2060._1745 == null)
         {
            this._2060._1745 = [];
         }
         else
         {
            this._2060._1745.length = 0;
         }
         this._2060._1816.length = 0;
         var _loc3_:int = 0;
         var _loc5_:int = 0;
         this._2072 = this.parent.frameRate;
         if(this._2072 <= 0)
         {
            this._2072 = Timeline.DEFAULT_FPS;
         }
         _loc3_ = 0;
         _loc4_ = int(this._2062.length);
         while(_loc3_ < _loc4_)
         {
            this._10446(this._2062[_loc3_],_loc5_,param1,param2);
            _loc5_ += this._2062[_loc3_].duration * this._2072;
            _loc3_++;
         }
         var _loc6_:_44;
         (_loc6_ = new _44())._1622 = _75.DISPATCH_EVENT;
         _loc6_.value = "stop";
         var _loc7_:_45 = new _45(false);
         _loc7_._1636.push(_loc6_);
         _loc7_.startPos = _loc5_;
         _loc7_.duration = 1;
         this._2060._1816.push(_loc7_);
         this._2060.duration = _loc5_ + 1;
         return this._2060;
      }
      
      private function _10446(param1:_56, param2:int, param3:_50, param4:Vector.<_50>) : void
      {
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:_57 = null;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:_67 = null;
         var _loc13_:int = 0;
         var _loc15_:_41 = null;
         var _loc16_:_48 = null;
         if(param1.tracks.length == 0)
         {
            return;
         }
         var _loc5_:_44;
         (_loc5_ = new _44())._1622 = _75.DISPATCH_EVENT;
         _loc5_.value = "stop";
         var _loc6_:_45 = new _45(false);
         if(param2 > 0)
         {
            _loc6_._1636.push(_loc5_);
         }
         _loc6_.startPos = param2;
         _loc6_.duration = param1.duration * this._2072;
         this._2060._1816.push(_loc6_);
         var _loc14_:int = param2;
         _loc7_ = 0;
         _loc8_ = int(param1.tracks.length);
         while(_loc7_ < _loc8_)
         {
            _loc9_ = param1.tracks[_loc7_];
            _loc13_ = _loc14_ + int(_loc9_.during * this._2072);
            _loc10_ = 0;
            _loc11_ = int(_loc9_.tweens.length);
            while(_loc10_ < _loc11_)
            {
               _loc12_ = _loc9_.tweens[_loc10_];
               _loc16_ = this._10448(_loc12_._1837,param3);
               _loc15_ = this._10447(_loc12_._1836,param3);
               this._10442(_loc12_,_loc15_,_loc16_,_loc14_,_loc13_,param3,param4);
               if(_loc12_.appear)
               {
                  this._10444(_loc14_,_loc16_);
               }
               if(_loc12_._10283)
               {
                  this._10445.push(_loc13_);
                  this._10438.push(_loc16_);
               }
               _loc10_++;
            }
            _loc14_ = _loc13_;
            _loc7_++;
         }
      }
      
      private function _10444(param1:int, param2:_48) : void
      {
         var _loc4_:int = 0;
         var _loc5_:_47 = null;
         var _loc3_:int = 0;
         _loc3_ = 0;
         _loc4_ = int(param2._1816.length);
         while(_loc3_ < _loc4_)
         {
            _loc5_ = param2._1816[_loc3_];
            if(_loc5_.startPos < param1)
            {
               _loc5_._1732 = null;
            }
            _loc3_++;
         }
      }
      
      private function _10439(param1:int, param2:_48) : void
      {
         var _loc4_:int = 0;
         var _loc5_:_47 = null;
         var _loc3_:int = 0;
         _loc3_ = 0;
         _loc4_ = int(param2._1816.length);
         while(_loc3_ < _loc4_)
         {
            _loc5_ = param2._1816[_loc3_];
            if(_loc5_.startPos >= param1)
            {
               _loc5_._1732 = null;
            }
            _loc3_++;
         }
      }
      
      private function _10447(param1:_52, param2:_50) : _41
      {
         var _loc3_:_41 = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:_52 = param2._1817(param1.name);
         _loc4_ = 0;
         _loc5_ = int(this._2060._1746.length);
         while(_loc4_ < _loc5_)
         {
            _loc3_ = this._2060._1746[_loc4_] as _41;
            if(_loc3_._1823 == _loc6_)
            {
               return _loc3_;
            }
            _loc4_++;
         }
         var _loc7_:BoneFrameVO = new BoneFrameVO(_loc6_,true,-1);
         _loc3_ = _41._1869(_loc6_,[_loc7_]);
         this._2060._1746.push(_loc3_);
         return _loc3_;
      }
      
      private function _10448(param1:_79, param2:_50) : _48
      {
         var _loc3_:_48 = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:_79 = param2._1818(param1.name);
         _loc4_ = 0;
         _loc5_ = int(this._2060._1745.length);
         while(_loc4_ < _loc5_)
         {
            _loc3_ = this._2060._1745[_loc4_] as _48;
            if(_loc3_._1824 == _loc6_)
            {
               return _loc3_;
            }
            _loc4_++;
         }
         var _loc7_:_83 = new _83();
         _loc7_.copyFrom(param1._2152);
         var _loc8_:_47;
         (_loc8_ = new _47(_loc6_,true,-1)).colorTransform = _loc7_;
         _loc8_._1732 = param1._1923;
         _loc3_ = _48._1869(_loc6_,[_loc8_]);
         this._2060._1745.push(_loc3_);
         return _loc3_;
      }
      
      public function _10442(param1:_67, param2:_41, param3:_48, param4:int, param5:int, param6:_50, param7:Vector.<_50>) : void
      {
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:Vector.<_45> = null;
         var _loc11_:_62 = null;
         var _loc12_:_66 = null;
         var _loc13_:BoneFrameVO = null;
         var _loc14_:_47 = null;
         var _loc15_:BoneFrameVO = null;
         var _loc16_:_47 = null;
         var _loc17_:BoneFrameVO = null;
         var _loc20_:_50 = null;
         var _loc21_:Number = NaN;
         var _loc22_:BoneFrameVO = null;
         var _loc23_:_47 = null;
         var _loc18_:_52 = param6._1817(param1._1836.name);
         var _loc19_:_79 = param6._1818(param1._1837.name);
         if(param1.loop)
         {
            _loc8_ = 0;
            _loc9_ = int(param7.length);
            while(_loc8_ < _loc9_)
            {
               if(param7[_loc8_].name == param1._1837.name)
               {
                  this._10437(param7[_loc8_],param1);
                  if(param4 == 0)
                  {
                     param7[_loc8_].defaultAnimation = param1._10454;
                  }
               }
               _loc8_++;
            }
            _loc10_ = param1._10451(_loc18_,_loc19_);
         }
         else
         {
            _loc10_ = param1._10450(_loc18_,_loc19_);
         }
         _loc15_ = param2._1933(param4) as BoneFrameVO;
         _loc16_ = param3._1933(param4) as _47;
         if(_loc15_)
         {
            _loc15_ = _loc15_.clone() as BoneFrameVO;
         }
         if(param1.appear && _loc16_ && _loc16_.startPos == 0)
         {
            _loc16_._1732 = null;
         }
         if(_loc10_ == null)
         {
            return;
         }
         _loc8_ = 0;
         _loc9_ = int(_loc10_.length);
         while(_loc8_ < _loc9_)
         {
            if(_loc10_[_loc8_] is _62)
            {
               _loc11_ = _loc10_[_loc8_] as _62;
               _loc13_ = param2._1938(param4 + _loc11_.startPos) as BoneFrameVO;
               if(_loc13_ == null)
               {
                  if(_loc15_)
                  {
                     _loc13_ = _loc15_.clone() as BoneFrameVO;
                  }
                  else
                  {
                     _loc13_ = param2._1933(param4 + _loc11_.startPos) as BoneFrameVO;
                     if(_loc13_)
                     {
                        _loc13_ = _loc13_.clone() as BoneFrameVO;
                     }
                     else
                     {
                        _loc13_ = new BoneFrameVO(_loc11_._1823,_loc11_.tweenEnabled,-1);
                     }
                  }
                  this._2043(_loc11_,_loc13_);
                  _loc13_.startPos = param4 + _loc11_.startPos;
                  param2.addKeyFrameAt(_loc13_,_loc13_.startPos);
               }
               else if(_loc13_)
               {
                  _loc13_.duration = _loc11_.duration;
                  this._2043(_loc11_,_loc13_);
               }
               if(_loc17_ != null)
               {
                  _loc21_ = _loc13_.transform.rotation - _loc17_.transform.rotation;
                  _loc17_.tweenRotate = _loc21_ / (2 * Math.PI);
                  if(_loc17_.tweenRotate == 0)
                  {
                     _loc17_.tweenRotate = _loc21_ == 0 ? 0 : (_loc21_ > 0 ? 1 : -1);
                  }
                  else if(_loc17_.tweenRotate > 0)
                  {
                     ++_loc17_.tweenRotate;
                  }
                  else
                  {
                     --_loc17_.tweenRotate;
                  }
               }
               _loc17_ = _loc13_;
            }
            else if(_loc10_[_loc8_] is _66)
            {
               _loc12_ = _loc10_[_loc8_] as _66;
               _loc14_ = param3._1938(param4 + _loc12_.startPos) as _47;
               if(_loc14_ == null)
               {
                  if(_loc16_)
                  {
                     _loc14_ = _loc16_.clone() as _47;
                  }
                  else
                  {
                     _loc14_ = param3._1933(param4 + _loc12_.startPos) as _47;
                     if(_loc14_)
                     {
                        _loc14_ = _loc14_.clone() as _47;
                     }
                     else
                     {
                        (_loc14_ = new _47(_loc12_._1824,_loc12_.tweenEnabled,-1)).gotoAndPlay = "idle";
                     }
                  }
                  this._2042(_loc12_,_loc14_);
                  _loc14_.startPos = param4 + _loc12_.startPos;
                  if(_loc12_._1732 == null)
                  {
                     if(param3._1938(0) == null)
                     {
                     }
                  }
                  param3.addKeyFrameAt(_loc14_,_loc14_.startPos);
               }
               else if(_loc14_)
               {
                  _loc14_.duration = _loc12_.duration;
                  this._2042(_loc12_,_loc14_);
               }
            }
            _loc8_++;
         }
         if(Boolean(_loc13_) && _loc13_.endPos != param5)
         {
            _loc13_.endPos = param5;
            (_loc22_ = _loc13_.clone() as BoneFrameVO).duration = 0;
            _loc22_.startPos = param5;
            _loc13_ = param2._1938(param5) as BoneFrameVO;
            if(_loc13_ == null)
            {
               param2.addKeyFrameAt(_loc22_,_loc22_.startPos);
            }
            else if(_loc13_)
            {
               _loc13_.transform.x += _loc22_.transform.x;
               _loc13_.transform.y += _loc22_.transform.y;
               _loc13_.transform.scaleX *= _loc22_.transform.scaleX;
               _loc13_.transform.scaleY *= _loc22_.transform.scaleY;
               _loc13_.transform.rotation += _loc22_.transform.rotation;
            }
         }
         if(Boolean(_loc12_) && _loc12_.endPos != param5)
         {
            _loc12_.endPos = param5;
            (_loc23_ = _loc12_.clone() as _47).duration = 0;
            _loc23_.startPos = param5;
            _loc14_ = param3._1938(param5) as _47;
            if(_loc14_ == null)
            {
               param3.addKeyFrameAt(_loc23_,_loc23_.startPos);
            }
            else if(_loc14_)
            {
               _loc14_.colorTransform.alphaMultiplier *= _loc23_.colorTransform.alphaMultiplier;
               _loc14_._1732 = _loc23_._1732;
            }
         }
      }
      
      private function _10437(param1:_50, param2:_67) : void
      {
         var _loc6_:uint = 0;
         var _loc7_:_52 = null;
         var _loc8_:BoneFrameVO = null;
         var _loc9_:_41 = null;
         var _loc10_:_79 = null;
         var _loc11_:_48 = null;
         var _loc12_:_52 = null;
         var _loc13_:_79 = null;
         var _loc3_:String = param2._10454;
         var _loc4_:_39 = param1._1969(_loc3_);
         if(_loc4_ == null)
         {
            _loc6_ = param1.frameRate;
            if(_loc6_ <= 0)
            {
               _loc6_ = Timeline.DEFAULT_FPS;
            }
            (_loc4_ = new _39(null,-1)).name = _loc3_;
            _loc4_._1746 = [];
            _loc4_._1745 = [];
            _loc4_.duration = param2.during * _loc6_;
            _loc7_ = param1._1817(param2._1836.name);
            _loc8_ = new BoneFrameVO(_loc7_,true,-1);
            _loc9_ = _41._1869(_loc7_,[_loc8_]);
            _loc4_._1746.push(_loc9_);
            _loc10_ = param1._1818(param2._1837.name);
            _loc11_ = _48._1869(_loc10_);
            _loc4_._1745.push(_loc11_);
            _loc12_ = param1._1817(param2._1836.name);
            _loc13_ = param1._1818(param2._1837.name);
            this._10436(param1,param2,_loc9_,_loc11_,0,param2.during * _loc6_);
         }
         if(param1._1963.indexOf(_loc4_) == -1)
         {
            param1._1742(_loc4_);
         }
         var _loc5_:String = "idle";
         _loc4_ = param1._1969(_loc5_);
         if(_loc4_ == null)
         {
            (_loc4_ = new _39(null,-1)).name = _loc5_;
            _loc4_._1746 = [];
            _loc4_._1745 = [];
            param1._1742(_loc4_);
         }
         param1.defaultAnimation = "idle";
      }
      
      public function _10436(param1:_50, param2:_67, param3:_41, param4:_48, param5:int, param6:int) : void
      {
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:Vector.<_45> = null;
         var _loc10_:_62 = null;
         var _loc11_:_66 = null;
         var _loc12_:BoneFrameVO = null;
         var _loc13_:_47 = null;
         var _loc14_:BoneFrameVO = null;
         var _loc15_:_47 = null;
         var _loc16_:BoneFrameVO = null;
         var _loc19_:Number = NaN;
         var _loc20_:BoneFrameVO = null;
         var _loc21_:_47 = null;
         _loc14_ = param3._1933(param5) as BoneFrameVO;
         _loc15_ = param4._1933(param5) as _47;
         var _loc17_:_52 = param1._1817(param2._1836.name);
         var _loc18_:_79 = param1._1818(param2._1837.name);
         _loc9_ = param2._10450(_loc17_,_loc18_);
         _loc7_ = 0;
         _loc8_ = int(_loc9_.length);
         while(_loc7_ < _loc8_)
         {
            if(_loc9_[_loc7_] is _62)
            {
               _loc10_ = _loc9_[_loc7_] as _62;
               _loc12_ = param3._1938(param5 + _loc10_.startPos) as BoneFrameVO;
               if(_loc12_ == null)
               {
                  if(_loc14_)
                  {
                     _loc12_ = _loc14_.clone() as BoneFrameVO;
                  }
                  else
                  {
                     _loc12_ = param3._1933(param5 + _loc10_.startPos) as BoneFrameVO;
                     if(_loc12_)
                     {
                        _loc12_ = _loc12_.clone() as BoneFrameVO;
                     }
                     else
                     {
                        _loc12_ = new BoneFrameVO(_loc10_._1823,_loc10_.tweenEnabled,-1);
                     }
                  }
                  this._2043(_loc10_,_loc12_);
                  _loc12_.startPos = param5 + _loc10_.startPos;
                  param3.addKeyFrameAt(_loc12_,_loc12_.startPos);
               }
               else if(_loc12_)
               {
                  _loc12_.duration = _loc10_.duration;
                  this._2043(_loc10_,_loc12_);
               }
               if(_loc16_ != null)
               {
                  _loc19_ = _loc12_.transform.rotation - _loc16_.transform.rotation;
                  _loc16_.tweenRotate = _loc19_ / (2 * Math.PI);
                  if(_loc16_.tweenRotate == 0)
                  {
                     _loc16_.tweenRotate = _loc19_ == 0 ? 0 : (_loc19_ > 0 ? 1 : -1);
                  }
                  else if(_loc16_.tweenRotate > 0)
                  {
                     ++_loc16_.tweenRotate;
                  }
                  else
                  {
                     --_loc16_.tweenRotate;
                  }
               }
               _loc16_ = _loc12_;
            }
            else if(_loc9_[_loc7_] is _66)
            {
               _loc11_ = _loc9_[_loc7_] as _66;
               _loc13_ = param4._1938(param5 + _loc11_.startPos) as _47;
               if(_loc13_ == null)
               {
                  if(_loc15_)
                  {
                     _loc13_ = _loc15_.clone() as _47;
                  }
                  else
                  {
                     _loc13_ = param4._1933(param5 + _loc11_.startPos) as _47;
                     if(_loc13_)
                     {
                        _loc13_ = _loc13_.clone() as _47;
                     }
                     else
                     {
                        _loc13_ = new _47(_loc11_._1824,_loc11_.tweenEnabled,-1);
                     }
                  }
                  this._2042(_loc11_,_loc13_);
                  _loc13_.startPos = param5 + _loc11_.startPos;
                  if(_loc11_._1732 == null)
                  {
                     if(param4._1938(0) == null)
                     {
                        _loc13_.startPos = 0;
                     }
                  }
                  param4.addKeyFrameAt(_loc13_,_loc13_.startPos);
               }
               else if(_loc13_)
               {
                  _loc13_.duration = _loc11_.duration;
                  this._2042(_loc11_,_loc13_);
               }
            }
            _loc7_++;
         }
         if(Boolean(_loc12_) && _loc12_.endPos != param6)
         {
            _loc12_.endPos = param6;
            (_loc20_ = _loc12_.clone() as BoneFrameVO).duration = 0;
            _loc20_.startPos = param6;
            _loc12_ = param3._1938(param6) as BoneFrameVO;
            if(_loc12_ == null)
            {
               param3.addKeyFrameAt(_loc20_,_loc20_.startPos);
            }
            else if(_loc12_)
            {
               _loc12_.transform.x += _loc20_.transform.x;
               _loc12_.transform.y += _loc20_.transform.y;
               _loc12_.transform.scaleX *= _loc20_.transform.scaleX;
               _loc12_.transform.scaleY *= _loc20_.transform.scaleY;
               _loc12_.transform.rotation += _loc20_.transform.rotation;
            }
         }
         if(Boolean(_loc11_) && _loc11_.endPos != param6)
         {
            _loc11_.endPos = param6;
            (_loc21_ = _loc11_.clone() as _47).duration = 0;
            _loc21_.startPos = param6;
            _loc13_ = param4._1938(param6) as _47;
            if(_loc13_ == null)
            {
               param4.addKeyFrameAt(_loc21_,_loc21_.startPos);
            }
            else if(_loc13_)
            {
               _loc13_.colorTransform.alphaMultiplier *= _loc21_.colorTransform.alphaMultiplier;
               _loc13_._1732 = _loc21_._1732;
            }
         }
      }
   }
}

