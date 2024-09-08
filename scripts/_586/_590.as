package _586
{
   import _1404._1407;
   import _24.Shortcut;
   import _470._469;
   import _472._607;
   import _51._79;
   import _521._523;
   import _521._524;
   import _54._63;
   import _54._64;
   import _54._65;
   import _54._67;
   import _644._645;
   import _644._646;
   import _708._718;
   import _708._719;
   import _783.ComicNotification;
   import _783.CommandNotification;
   import _81._86;
   import _81._91;
   import _844._850;
   import _844._851;
   import _844._852;
   import _844._853;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.utils.Dictionary;
   
   public class _590 extends _599
   {
      private var _4344:_852;
      
      private var _5034:_523;
      
      private var _5121:Point;
      
      public function _590()
      {
         super();
         this._5121 = new Point();
         this._5034 = _1407.getInstance(_523) as _523;
      }
      
      public function stop() : void
      {
         this.dispose();
      }
      
      override protected function dispose() : void
      {
         super.dispose();
         _1564(ComicNotification.UPDATE_SELCTEDS,this._5036);
      }
      
      override protected function _1576() : void
      {
         super._1576();
         _1565(ComicNotification.UPDATE_SELCTEDS,this._5036);
         this._4341.addEventListener(MouseEvent.MOUSE_DOWN,this._5104);
         this._5115.addEventListener(MouseEvent.MOUSE_DOWN,this._5104);
         this._5120.addEventListener(MouseEvent.MOUSE_DOWN,this._5104);
      }
      
      private function _5036(param1:ComicNotification) : void
      {
         if(this._5034._2889.length > 0)
         {
            this._4344._1897 = this._5034._2889[0];
         }
         else
         {
            this._4344._1897 = null;
         }
      }
      
      public function get _4313() : _852
      {
         return this._4344;
      }
      
      public function set _4313(param1:_852) : void
      {
         if(this._4344 != param1)
         {
            this._4344 = param1;
         }
      }
      
      public function _1751() : void
      {
         this._4344._1751();
      }
      
      private function _5108() : Array
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc1_:Array = [];
         _loc2_ = 0;
         _loc3_ = int(this._5034._2889.length);
         while(_loc2_ < _loc3_)
         {
            _loc1_.push(this._5034._2889[_loc2_]);
            _loc2_++;
         }
         return _loc1_;
      }
      
      override protected function _5103(param1:MouseEvent) : void
      {
         this._4344.mouseChildren = true;
         this._4344.mouseEnabled = true;
         super._5103(param1);
         _2217._1651();
         this._4344._4337();
         _607.instance._5059();
      }
      
      public function _5031() : void
      {
         this._4344.mouseChildren = false;
         this._4344.mouseEnabled = false;
         _5113.x = stage.mouseX;
         _5113.y = stage.mouseY;
         var _loc1_:Array = this._5108();
         this._5111(_loc1_);
      }
      
      public function _5035() : void
      {
         var _loc1_:Array = null;
         _5113.x = stage.mouseX;
         _5113.y = stage.mouseY;
         _loc1_ = this._5108();
         this._5121 = this._4344.localToGlobal(new Point());
         _2549 = this._5121;
         this._5117(_loc1_);
      }
      
      override protected function _5111(param1:Array) : void
      {
         var _loc2_:_91 = null;
         var _loc3_:_79 = null;
         this._5124 = 1;
         _4971 = new Dictionary();
         for each(_loc2_ in param1)
         {
            if(_loc2_ is _646)
            {
               _loc3_ = (_loc2_ as _646)._1837;
               if(_loc3_)
               {
                  _4971[_loc3_] = _loc3_.globalTransform.clone();
               }
            }
            _4971[_loc2_] = _loc2_.globalTransform.clone();
         }
         _4355(param1);
      }
      
      override protected function _5117(param1:Array) : void
      {
         var _loc3_:_91 = null;
         var _loc4_:_79 = null;
         this._5124 = 3;
         _4971 = new Dictionary();
         var _loc2_:String = "globalTransform";
         for each(_loc3_ in param1)
         {
            if(_loc3_ is _646)
            {
               _loc4_ = (_loc3_ as _646)._1837;
               if(_loc4_)
               {
                  _4971[_loc4_] = _loc4_.globalTransform.clone();
               }
            }
            _4971[_loc3_] = _loc3_[_loc2_].clone();
         }
         _4355(param1);
      }
      
      override protected function _5123(param1:Array) : void
      {
         var _loc3_:_91 = null;
         var _loc4_:_79 = null;
         this._5124 = 2;
         _4971 = new Dictionary();
         var _loc2_:String = "globalTransform";
         for each(_loc3_ in param1)
         {
            if(_loc3_ is _646)
            {
               _loc4_ = (_loc3_ as _646)._1837;
               if(_loc4_)
               {
                  _4971[_loc4_] = _loc4_.globalTransform.clone();
               }
            }
            _4971[_loc3_] = _loc3_[_loc2_].clone();
         }
         _4355(param1);
      }
      
      public function _5112() : void
      {
         _5113.x = stage.mouseX;
         _5113.y = stage.mouseY;
         var _loc1_:Array = this._5108();
         this._5121 = this._4344.localToGlobal(new Point());
         _2549 = this._5121;
         this._5123(_loc1_);
      }
      
      private function _5104(param1:MouseEvent) : void
      {
         var _loc2_:Array = null;
         var _loc3_:Object = null;
         var _loc4_:Array = null;
         if(!Shortcut._1677())
         {
            _loc2_ = [];
            if(_5124 == 0)
            {
               _5113.x = param1.stageX;
               _5113.y = param1.stageY;
               if(this._4368 || this._4369)
               {
                  if(this._4344._5122)
                  {
                     this._4344._4365(this._4368,this._4369);
                  }
                  this._5031();
               }
               else if(this._5119 || this._5118)
               {
                  this._5112();
               }
            }
            _524._3785(true);
         }
      }
      
      override protected function _5107(param1:Array, param2:_719, param3:Array, param4:int = -1, param5:int = -1) : void
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:_646 = null;
         var _loc9_:_79 = null;
         if(param1.length == 1)
         {
            if(param1[0] is _646)
            {
               _loc8_ = param1[0] as _646;
               this._5105(_loc8_,param2,param3);
            }
            else if(param1[0] is _79)
            {
               _loc9_ = param1[0] as _79;
               this._5106(_loc9_,param2,param3);
            }
         }
      }
      
      protected function _5106(param1:_79, param2:_719, param3:Array) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:_86 = null;
         var _loc9_:_718 = null;
         var _loc10_:Object = null;
         var _loc11_:Function = null;
         var _loc13_:Vector.<_63> = null;
         var _loc14_:_645 = null;
         var _loc15_:_646 = null;
         var _loc12_:_91 = param1;
         _loc8_ = this._4971[_loc12_];
         _loc4_ = 0;
         while(_loc4_ < param3.length)
         {
            _loc11_ = param3[_loc4_ + 2];
            _loc9_ = param3[_loc4_];
            if(_loc9_ == _718.X && (!this._4368 && this._4369))
            {
               param3[_loc4_ + 1] = 0;
            }
            else if(_loc9_ == _718.Y && (!this._4369 && this._4368))
            {
               param3[_loc4_ + 1] = 0;
            }
            param3[_loc4_ + 1] = _loc11_(this._4971[_loc12_][_loc9_.toString()],param3[_loc4_ + 1]);
            param3.splice(_loc4_ + 2,1);
            _loc4_ = --_loc4_ + 3;
         }
         _loc10_ = _469._2980(_loc12_,param2,param3);
         if(this._3113._5116)
         {
            _loc13_ = new Vector.<_63>();
            _loc14_ = this._3113._3567._3116(param1.parentBoneData,param1);
            if(_loc14_)
            {
               _loc4_ = 0;
               _loc5_ = int(_loc14_.tracks.length);
               while(_loc4_ < _loc5_)
               {
                  _loc15_ = _loc14_.tracks[_loc4_];
                  _loc6_ = 0;
                  _loc7_ = int(_loc15_.tweens.length);
                  while(_loc6_ < _loc7_)
                  {
                     if(_loc15_.tweens[_loc6_] is _63)
                     {
                        _loc13_.push(_loc15_.tweens[_loc6_]);
                     }
                     _loc6_++;
                  }
                  _loc4_++;
               }
            }
            _loc10_.tweens = _loc13_;
            this._1567(new CommandNotification(CommandNotification.MODIFY_COMICOBJECT_TWEEN_TRANSFORM,_loc10_));
         }
         else
         {
            this._1567(new CommandNotification(CommandNotification.MODIFY_COMICOBJECT_TRANSFORM,_loc10_));
         }
      }
      
      protected function _5105(param1:_646, param2:_719, param3:Array) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc7_:_646 = null;
         var _loc8_:Point = null;
         var _loc9_:Point = null;
         var _loc10_:Boolean = false;
         var _loc12_:_79 = null;
         var _loc13_:Function = null;
         var _loc14_:_718 = null;
         var _loc16_:_64 = null;
         var _loc17_:Number = NaN;
         var _loc18_:_63 = null;
         var _loc19_:_65 = null;
         var _loc6_:_646 = param1;
         var _loc11_:Array = param3.concat();
         _loc4_ = 0;
         _loc5_ = int(_loc11_.length);
         while(_loc4_ < _loc5_)
         {
            _loc13_ = _loc11_[_loc4_ + 2];
            _loc14_ = _loc11_[_loc4_];
            if(_loc14_ == _718.X && (!this._4368 && this._4369))
            {
               _loc11_[_loc4_ + 1] = 0;
            }
            else if(_loc14_ == _718.Y && (!this._4369 && this._4368))
            {
               _loc11_[_loc4_ + 1] = 0;
            }
            _loc11_[_loc4_ + 1] = _loc13_(this._4971[_loc6_][_loc14_.toString()],_loc11_[_loc4_ + 1]);
            _loc4_ += 3;
         }
         var _loc15_:_718 = _loc11_[0];
         _loc4_ = 0;
         _loc5_ = int(_loc11_.length);
         while(_loc4_ < _loc5_)
         {
            _loc15_ = _loc11_[_loc4_];
            switch(_loc15_)
            {
               case _718.ROTATION:
                  _loc10_ = true;
                  break;
               case _718.X:
                  if(_loc8_ == null)
                  {
                     _loc8_ = new Point();
                  }
                  _loc8_.x = _loc11_[_loc4_ + 1] - _loc6_._1836._1724.x;
                  break;
               case _718.Y:
                  if(_loc8_ == null)
                  {
                     _loc8_ = new Point();
                  }
                  _loc8_.y = _loc11_[_loc4_ + 1] - _loc6_._1836._1724.y;
                  break;
               case _718.SCALE_X:
                  if(_loc9_ == null)
                  {
                     _loc9_ = new Point(1,1);
                  }
                  _loc9_.x = _loc11_[_loc4_ + 1];
                  break;
               case _718.SCALE_Y:
                  if(_loc9_ == null)
                  {
                     _loc9_ = new Point(1,1);
                  }
                  _loc9_.y = _loc11_[_loc4_ + 1];
                  break;
            }
            _loc4_ += 3;
         }
         if(_loc10_)
         {
            if(!_loc6_._10359)
            {
               _loc16_ = _loc6_._5109();
               if(_loc16_ == null)
               {
                  _loc16_ = new _64(_loc6_.track,_loc6_._1836,_loc6_._1837,_loc6_.easing,_loc11_[1],_loc6_.during,_loc6_.loop,_loc6_.delay);
                  this._10357(_loc16_,_loc6_);
                  return;
               }
               _loc17_ = _loc16_.rotation + (_loc11_[1] - _loc6_.globalTransform.rotation);
               this._10356(_loc16_,_loc6_,_loc17_);
               return;
            }
            _loc7_ = _loc6_._10361;
            while(_loc7_ != null && _loc7_._10359)
            {
               _loc7_ = _loc7_._10361;
            }
            if(_loc7_)
            {
               _loc16_ = _loc7_._5109();
               if(_loc16_ == null)
               {
                  _loc16_ = new _64(_loc7_.track,_loc7_._1836,_loc7_._1837,_loc7_.easing,_loc11_[1],_loc7_.during,_loc7_.loop,_loc7_.delay);
                  this._10357(_loc16_,_loc7_);
                  return;
               }
               _loc17_ = _loc16_.rotation + (_loc11_[1] - _loc6_.globalTransform.rotation);
               this._10356(_loc16_,_loc7_,_loc17_);
               return;
            }
            _loc12_ = _loc6_._1837;
            this._5106(_loc12_,param2,param3);
         }
         else if(_loc8_ != null)
         {
            if(_loc6_._10358)
            {
               _loc7_ = _loc6_._10361;
               while(_loc7_ != null && _loc7_._10358)
               {
                  _loc7_ = _loc7_._10361;
               }
               if(_loc7_)
               {
                  _loc18_ = _loc7_._5110();
                  if(_loc18_ == null)
                  {
                     _loc18_ = new _63(_loc7_.track,_loc7_._1836,_loc7_._1837,_loc7_.easing,_loc8_,_loc7_.during,_loc7_.delay);
                     this._10357(_loc18_,_loc7_);
                  }
                  else
                  {
                     this._10356(_loc18_,_loc7_,_loc8_);
                  }
               }
               else
               {
                  _loc12_ = _loc6_._1837;
                  this._5106(_loc12_,param2,param3);
               }
            }
            else
            {
               _loc18_ = _loc6_._5110();
               if(_loc18_ == null)
               {
                  _loc18_ = new _63(_loc6_.track,_loc6_._1836,_loc6_._1837,_loc6_.easing,_loc8_,_loc6_.during,_loc6_.delay);
                  this._10357(_loc18_,_loc6_);
               }
               else
               {
                  this._10356(_loc18_,_loc6_,_loc8_);
               }
            }
         }
         else if(_loc9_ != null)
         {
            if(!_loc6_._10360)
            {
               _loc19_ = _loc6_._5114();
               if(_loc19_ == null)
               {
                  _loc19_ = new _65(_loc6_.track,_loc6_._1836,_loc6_._1837,_loc6_.easing,_loc9_,_loc6_.during,_loc6_.delay);
                  this._10357(_loc19_,_loc6_);
               }
               else
               {
                  this._10356(_loc19_,_loc6_,_loc9_);
               }
               return;
            }
            _loc7_ = _loc6_._10361;
            while(_loc7_ != null && _loc7_._10360)
            {
               _loc7_ = _loc7_._10361;
            }
            if(_loc7_)
            {
               _loc19_ = _loc7_._5114();
               if(_loc19_ == null)
               {
                  _loc19_ = new _65(_loc7_.track,_loc7_._1836,_loc7_._1837,_loc7_.easing,_loc9_,_loc7_.during,_loc7_.delay);
                  this._10357(_loc19_,_loc7_);
               }
               else
               {
                  this._10356(_loc19_,_loc7_,_loc9_);
               }
            }
            else
            {
               _loc12_ = _loc6_._1837;
               this._5106(_loc12_,param2,param3);
            }
         }
      }
      
      private function _10355(param1:_646, param2:Array) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:Function = null;
         var _loc6_:_718 = null;
         _loc3_ = 0;
         _loc4_ = int(param2.length);
         while(_loc3_ < _loc4_)
         {
            _loc5_ = param2[_loc3_ + 2];
            _loc6_ = param2[_loc3_];
            if(_loc6_ == _718.X && (!this._4368 && this._4369))
            {
               param2[_loc3_ + 1] = 0;
            }
            else if(_loc6_ == _718.Y && (!this._4369 && this._4368))
            {
               param2[_loc3_ + 1] = 0;
            }
            param2[_loc3_ + 1] = _loc5_(this._4971[param1][_loc6_.toString()],param2[_loc3_ + 1]);
            _loc3_ += 3;
         }
      }
      
      private function _10357(param1:_67, param2:_646) : void
      {
         var _loc3_:Object = {};
         _loc3_._2071 = param1;
         _loc3_._2069 = param2.track;
         _loc3_._3077 = param2;
         _loc3_._3075 = param2.track.tweens.length;
         _1567(new CommandNotification(CommandNotification.ADD_COMIC_TWEEN,_loc3_));
      }
      
      private function _10356(param1:_67, param2:_646, param3:*) : void
      {
         var _loc4_:Object;
         (_loc4_ = {})._2071 = param1;
         _loc4_._2069 = param2.track;
         _loc4_._3077 = param2;
         _loc4_.newValue = param3;
         _1567(new CommandNotification(CommandNotification.MODIFY_COMIC_TWEEN_VALUE,_loc4_));
      }
      
      private function get _5115() : _850
      {
         return this._4344._5115;
      }
      
      private function get _4341() : _853
      {
         return this._4344._4341;
      }
      
      private function get _5120() : _851
      {
         return this._4344._5120;
      }
      
      public function get _4368() : Boolean
      {
         return this._4341._4368;
      }
      
      public function get _4369() : Boolean
      {
         return this._4341._4369;
      }
      
      public function get _5119() : Boolean
      {
         return this._5120._4368;
      }
      
      public function get _5118() : Boolean
      {
         return this._5120._4369;
      }
      
      protected function get _3113() : _605
      {
         return _1407.getInstance(_605) as _605;
      }
   }
}

