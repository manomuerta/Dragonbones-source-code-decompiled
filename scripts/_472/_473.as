package _472
{
   import _1038._1037;
   import _1038._1039;
   import _1045.DropDownList;
   import _1177.IndexChangeEvent;
   import _1177.ListEvent;
   import _1177.UIEvent;
   import _127._163;
   import _1404._1407;
   import _470._469;
   import _51._79;
   import _521._523;
   import _54._53;
   import _54._55;
   import _54._56;
   import _54._57;
   import _54._67;
   import _555._556;
   import _586._589;
   import _586._605;
   import _636.ComicEvent;
   import _644._643;
   import _644._645;
   import _644._646;
   import _783.ComicNotification;
   import _783.CommandNotification;
   import _790._789;
   import _790._793;
   import _790._795;
   import _813.ComicOrderPanel;
   import _93._94;
   import egret.utils._99;
   import egret.utils.tr;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.utils.Dictionary;
   import flash.utils.getQualifiedClassName;
   
   public class _473 extends _94
   {
      public var _3582:ComicOrderPanel;
      
      public var _3562:_793;
      
      public var _3551:int = 0;
      
      protected var _3548:Vector.<_67>;
      
      public var _3553:Dictionary;
      
      public function _473()
      {
         this._3582 = _1407.getInstance(ComicOrderPanel) as ComicOrderPanel;
         this._3562 = new _793();
         this._3553 = new Dictionary();
         super();
         this._3582.addEventListener(UIEvent.CREATION_COMPLETE,this.onComplete);
      }
      
      private function onComplete(param1:UIEvent) : void
      {
         if(Boolean(this._3582) && this._3582.initialized)
         {
            this.init();
            this._1576();
         }
      }
      
      override protected function init() : void
      {
         super.init();
         if(Boolean(this._3582) && this._3582.initialized)
         {
            this._3562 = this._3554(this._1744);
            this.comicTree._3583(this._3562);
            if(this._3548)
            {
               this._3555(null);
               this._3549();
            }
            this._3569(null);
            this._3582._3600.minValue = 0;
            this._3582._3600.maxValue = 20;
            this._3582._3600._2579 = 0.1;
         }
      }
      
      override protected function _1576() : void
      {
         super._1576();
         if(this._3582)
         {
            this.comicTree.tree.addEventListener(ListEvent.ITEM_CLICK,this._3590);
            this.comicTree.tree.addEventListener(IndexChangeEvent.CHANGE,this._3552);
            this.comicTree.tree.addEventListener(ListEvent.ITEM_DOUBLE_CLICK,this._3561);
            this.comicTree.addEventListener(MouseEvent.RIGHT_CLICK,this._3568);
            this.comicTree.addEventListener(ComicEvent.DRAG_DROP_MOVE,this._3550,true);
            this.comicTree.addEventListener(ComicEvent.DRAG_DROP_MERGE,this._3550,true);
            this.comicTree._3573 = this._3593;
            this.comicTree._3576 = this._3599;
            this._3581.addEventListener(IndexChangeEvent.CHANGE,this._3587);
         }
         _1565(ComicNotification.UPDATE_STRIP,this._3589);
         _1565(ComicNotification.UPDATE_ORDER_SELECTED,this._3563);
      }
      
      private function _3590(param1:ListEvent) : void
      {
         var _loc2_:Vector.<Object> = new Vector.<Object>();
         _loc2_.push(param1.item);
         this.comicTree.tree._2889 = _loc2_;
         this._3580();
      }
      
      protected function _3599(param1:Object, param2:Array, param3:Boolean, param4:_789) : Boolean
      {
         var _loc7_:_57 = null;
         var _loc8_:_67 = null;
         var _loc9_:_67 = null;
         var _loc10_:_67 = null;
         var _loc5_:Array = param2;
         var _loc6_:Object = param1;
         if(_loc5_.length == 1 && _loc6_ == _loc5_[0])
         {
            return false;
         }
         if(_loc6_ is _67)
         {
            _loc9_ = _loc6_ as _67;
            _loc10_ = null;
            if(param4 == _789.INSIDE)
            {
               var _loc11_:int = 0;
               var _loc12_:* = _loc5_;
               for each(_loc8_ in _loc12_)
               {
                  if(_loc8_ == _loc9_)
                  {
                     return false;
                  }
                  return this._3574(_loc8_,_loc9_,param3);
               }
            }
         }
         return false;
      }
      
      private function _3593(param1:Object, param2:Array, param3:Boolean, param4:_789) : Boolean
      {
         var _loc7_:_57 = null;
         var _loc8_:_67 = null;
         var _loc9_:_67 = null;
         var _loc10_:_67 = null;
         var _loc11_:_56 = null;
         var _loc12_:_56 = null;
         var _loc5_:Array = param2;
         var _loc6_:Object = param1;
         if(_loc5_.length == 1 && _loc6_ == _loc5_[0] && param4 != _789.MIDDLE)
         {
            return false;
         }
         if(_loc6_ is _67)
         {
            _loc9_ = _loc6_ as _67;
            _loc10_ = null;
            for each(_loc8_ in _loc5_)
            {
               if(_loc8_ == _loc9_ && param4 != _789.MIDDLE)
               {
                  return false;
               }
               if(param4 == _789.MIDDLE)
               {
                  return this._3575(_loc8_,_loc9_,param3);
               }
               if(param4 == _789.INSIDE)
               {
                  return false;
               }
            }
         }
         else if(_loc6_ is _56)
         {
            return false;
         }
         return false;
      }
      
      private function _3589(param1:ComicNotification) : void
      {
         this._3063(this._3058._3567._1992);
      }
      
      private function _3563(param1:ComicNotification) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:_646 = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:_79 = null;
         var _loc9_:_645 = null;
         var _loc10_:Vector.<_67> = null;
         var _loc2_:Vector.<_67> = new Vector.<_67>();
         if(this._3061._3050.length > 0)
         {
            _loc3_ = 0;
            _loc4_ = int(this._3061._3050.length);
            while(_loc3_ < _loc4_)
            {
               _loc8_ = this._3061._3050[_loc3_];
               _loc9_ = this._3058._3565(_loc8_);
               _loc10_ = _loc9_._3594();
               _loc6_ = 0;
               _loc7_ = int(_loc10_.length);
               while(_loc6_ < _loc7_)
               {
                  _loc2_.push(_loc10_[_loc6_]);
                  _loc6_++;
               }
               _loc3_++;
            }
         }
         else if(this._3061._3584.length > 0)
         {
            _loc3_ = 0;
            _loc4_ = int(this._3061._3584.length);
            while(_loc3_ < _loc4_)
            {
               _loc5_ = this._3061._3584[_loc3_];
               _loc6_ = 0;
               _loc7_ = int(_loc5_.tweens.length);
               while(_loc6_ < _loc7_)
               {
                  _loc2_.push(_loc5_.tweens[_loc6_]);
                  _loc6_++;
               }
               _loc3_++;
            }
         }
         this._3555(_loc2_);
      }
      
      public function _3062() : void
      {
         this._3563(null);
      }
      
      protected function _3552(param1:IndexChangeEvent) : void
      {
         if(param1.target is _163 && param1.target._2484 is _67)
         {
            this._3582._3600.txt.text = (this.comicTree.tree._2484 as _67).delay + "";
            this._3580();
         }
      }
      
      protected function _3561(param1:ListEvent) : void
      {
         param1.stopPropagation();
         param1.stopImmediatePropagation();
      }
      
      protected function _3568(param1:MouseEvent) : void
      {
         this._3061._2986(null,null);
         this._3105();
         this._3560();
      }
      
      public function _3580() : void
      {
         var _loc1_:Vector.<_67> = null;
         var _loc2_:Vector.<Object> = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(Boolean(this.comicTree) && Boolean(this.comicTree.tree))
         {
            _loc1_ = new Vector.<_67>();
            _loc2_ = this.comicTree.tree._2889;
            _loc3_ = 0;
            _loc4_ = int(_loc2_.length);
            while(_loc3_ < _loc4_)
            {
               if(_loc2_[_loc3_] is _67)
               {
                  _loc1_.push(_loc2_[_loc3_]);
               }
               _loc3_++;
            }
            this._3056._10301 = _loc1_;
            this._3577(_loc1_);
            this._3549(_loc1_);
            this._3560();
         }
         else
         {
            this._3056._10301 = null;
         }
      }
      
      public function _3560() : void
      {
         var _loc1_:_1037 = null;
         if(this._3592.length == 1)
         {
            this._3581.enabled = true;
            this._3551 = 0;
            _loc1_ = this._3569(this._3592[0]);
            this._3559(_loc1_);
         }
         else
         {
            this._3551 = 0;
            this._3581.enabled = false;
            this._3559(new _1037());
         }
      }
      
      public function _3569(param1:_67) : _1037
      {
         var _loc4_:Boolean = false;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:_55 = null;
         var _loc8_:_55 = null;
         var _loc9_:_55 = null;
         var _loc2_:_1037 = new _1037();
         var _loc3_:int = 0;
         if(param1)
         {
            _loc4_ = this._3586(param1);
            if(_loc4_)
            {
               (_loc7_ = new _55()).title = tr("ComicOrderPanel.playEnterPrint");
               _loc7_.type = 0;
               _loc2_.addItem(_loc7_);
            }
            else
            {
               _loc3_++;
            }
            _loc5_ = this.testTogetherTrackVO(param1,_loc3_);
            if(_loc5_ >= 0)
            {
               (_loc8_ = new _55()).title = tr("ComicOrderPanel.playTogether",_loc5_);
               _loc8_.type = 1;
               _loc2_.addItem(_loc8_);
            }
            else
            {
               _loc3_++;
            }
            _loc6_ = this.testAfterTrackVO(param1,_loc3_);
            if(_loc6_ >= 0)
            {
               (_loc9_ = new _55()).title = tr("ComicOrderPanel.playAfter",_loc6_);
               _loc9_.type = 2;
               _loc2_.addItem(_loc9_);
            }
         }
         return _loc2_;
      }
      
      public function _3586(param1:_67) : Boolean
      {
         var _loc3_:Boolean = false;
         var _loc2_:_56 = param1._2070;
         if(param1.index + param1._2069.index == 0)
         {
            this._3551 = 0;
            _loc3_ = true;
         }
         else
         {
            _loc3_ = this._3566(param1,_loc2_);
         }
         return _loc3_;
      }
      
      public function testTogetherTrackVO(param1:_67, param2:int = 0) : int
      {
         var _loc7_:_57 = null;
         var _loc9_:_53 = null;
         var _loc10_:int = 0;
         var _loc11_:_56 = null;
         var _loc12_:_67 = null;
         var _loc3_:_56 = param1.parent.parent;
         var _loc4_:_57 = param1.parent;
         var _loc5_:int = int(_loc3_.children.indexOf(_loc4_));
         var _loc6_:int = int(_loc4_.children.indexOf(param1));
         var _loc8_:Boolean = true;
         if(_loc6_ == 0)
         {
            if(_loc5_ == 0)
            {
               _loc9_ = _loc3_._1992;
               if((_loc10_ = int(_loc9_.children.indexOf(_loc3_))) >= 0)
               {
                  _loc11_ = _loc9_.children[_loc10_ - 1];
                  if(_loc11_)
                  {
                     _loc7_ = _loc11_.children[_loc11_.children.length - 1];
                  }
               }
            }
            else if(_loc5_ > 0)
            {
               _loc7_ = _loc3_.children[_loc5_ - 1];
            }
            if(_loc7_)
            {
               for each(_loc12_ in _loc7_.children)
               {
                  _loc8_ = this._3599(_loc12_,[param1],false,_789.INSIDE);
                  if(!_loc8_)
                  {
                     return -1;
                  }
               }
               return int(_loc12_.title);
            }
         }
         else if(_loc6_ > 0)
         {
            this._3551 = 1 - param2;
            return int(param1.title);
         }
         return -2;
      }
      
      private function _10303(param1:_67) : _67
      {
         var _loc2_:int = 0;
         var _loc3_:_57 = null;
         var _loc4_:_56 = null;
         if(param1.index > 0)
         {
            _loc2_ = param1.index - 1;
            return param1.parent.tweens[_loc2_];
         }
         _loc3_ = param1._2069;
         if(_loc3_.index > 0)
         {
            _loc2_ = _loc3_.index - 1;
            _loc3_ = _loc3_._2070.tracks[_loc2_];
            return _loc3_.tweens[_loc3_.tweens.length - 1];
         }
         _loc4_ = param1._2070;
         if(_loc4_.index > 0)
         {
            _loc2_ = _loc4_.index - 1;
            _loc4_ = _loc4_.parent._2062[_loc2_];
            _loc3_ = _loc4_.tracks[_loc4_.tracks.length - 1];
            return _loc3_.tweens[_loc3_.tweens.length - 1];
         }
         return null;
      }
      
      public function testAfterTrackVO(param1:_67, param2:int = 0) : int
      {
         var _loc4_:Boolean = false;
         var _loc3_:_67 = this._10303(param1);
         if(Boolean(_loc3_) && _loc3_._2069 == param1._2069)
         {
            _loc3_ = param1;
         }
         if(_loc3_)
         {
            _loc4_ = this._3575(param1,_loc3_,false);
            if(_loc4_)
            {
               if(_loc3_._2069 != param1._2069 && param1._2069.index > 0)
               {
                  this._3551 = 2 - param2;
               }
               return int(_loc3_.title);
            }
            return -1;
         }
         return -1;
      }
      
      protected function _3559(param1:_1039) : void
      {
         if(param1)
         {
            if(Boolean(this._3582) && Boolean(this._3582._3581))
            {
               this._3582._3581.dataProvider = param1;
               this._3581._2449();
               this._3582._3581.selectedIndex = this._3551;
            }
         }
      }
      
      protected function _3588(param1:Event) : void
      {
         if(this.comicTree.tree._2484 && this.comicTree.tree._2484 is _67)
         {
            this.comicTree.tree._2484.delay = Number(this._3582._3600.txt.text);
         }
      }
      
      protected function _3587(param1:IndexChangeEvent) : void
      {
         var _loc3_:_67 = null;
         var _loc4_:_57 = null;
         var _loc5_:_56 = null;
         var _loc6_:_53 = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:_57 = null;
         var _loc10_:_56 = null;
         var _loc11_:_67 = null;
         var _loc12_:_56 = null;
         var _loc13_:_67 = null;
         var _loc14_:_67 = null;
         var _loc2_:_55 = this._3581._2484 as _55;
         if(Boolean(_loc2_) && this._3592.length == 1)
         {
            _loc3_ = this._3592[0];
            _loc4_ = _loc3_.parent;
            _loc7_ = int((_loc6_ = (_loc5_ = _loc4_.parent).parent).children.indexOf(_loc5_));
            _loc8_ = int(_loc5_.children.indexOf(_loc4_));
            _loc10_ = _loc6_.children[_loc7_ - 1];
            if(_loc2_.type == 0)
            {
               _loc12_ = new _56(_loc6_);
               if(_loc4_.children.length == 1 && _loc8_ < _loc5_.children.length)
               {
                  this._3546(_loc3_,_loc12_,_loc7_);
               }
               else
               {
                  this._3564(_loc3_,_loc12_,_loc7_);
               }
            }
            else if(_loc2_.type == 1)
            {
               if(_loc8_ == 0)
               {
                  _loc9_ = _loc10_.children[_loc10_.children.length - 1];
               }
               else
               {
                  _loc9_ = _loc5_.children[_loc8_ - 1];
               }
               if(_loc9_)
               {
                  _loc11_ = _loc9_.children[_loc9_.children.length - 1];
                  if((Boolean(_loc11_)) && _loc11_.visible)
                  {
                     for each(_loc13_ in _loc9_.children)
                     {
                        if(_loc13_.name == _loc3_.name && _loc13_ != _loc11_ && _loc13_.visible && _loc11_.visible)
                        {
                           break;
                        }
                     }
                     this._3570(_loc3_,_loc11_,_loc13_,false);
                  }
               }
            }
            else if(_loc2_.type == 2)
            {
               if(_loc3_.index == 0 && _loc3_._2069.index == 0)
               {
                  if(_loc10_)
                  {
                     _loc9_ = _loc10_.children[_loc10_.children.length - 1];
                     if(_loc9_)
                     {
                        _loc11_ = _loc9_.children[_loc9_.children.length - 1];
                        if((Boolean(_loc11_)) && _loc11_.visible)
                        {
                           for each(_loc14_ in _loc9_.children)
                           {
                              if(_loc14_.name == _loc3_.name && _loc14_ != _loc11_ && _loc14_.visible && _loc11_.visible)
                              {
                                 break;
                              }
                           }
                           this._3571(_loc3_,_loc11_,_loc14_,false);
                        }
                     }
                  }
               }
               else
               {
                  _loc11_ = _loc4_.tweens[_loc4_.tweens.length - 1];
                  this._3571(_loc3_,_loc11_,null,false);
               }
            }
         }
      }
      
      protected function _3550(param1:ComicEvent) : void
      {
         var _loc6_:_57 = null;
         var _loc7_:_67 = null;
         var _loc8_:_67 = null;
         var _loc9_:_67 = null;
         var _loc10_:_67 = null;
         var _loc11_:_67 = null;
         var _loc12_:_56 = null;
         var _loc13_:int = 0;
         var _loc2_:Array = param1.data.dragTargets as Array;
         var _loc3_:Object = param1.data.responseTarget;
         var _loc4_:Boolean = Boolean(param1.data.isTop);
         var _loc5_:_789 = param1.data.position;
         if(_loc3_ is _67)
         {
            _loc7_ = _loc3_ as _67;
            _loc8_ = null;
            var _loc14_:int = 0;
            var _loc15_:* = _loc2_;
            loop1:
            while(true)
            {
               for each(_loc9_ in _loc15_)
               {
                  for each(_loc10_ in _loc7_.parent.children)
                  {
                     if(_loc9_ != _loc10_ && _loc9_.name == _loc10_.name && _loc9_.visible && _loc10_.visible)
                     {
                        _loc8_ = _loc10_;
                        break;
                     }
                  }
                  if(_loc5_ == _789.MIDDLE)
                  {
                     this._3571(_loc9_,_loc7_,_loc8_,_loc4_);
                  }
                  else if(_loc5_ == _789.INSIDE)
                  {
                     if(_loc9_.parent == _loc7_.parent)
                     {
                        break loop1;
                     }
                     this._3570(_loc9_,_loc7_,_loc8_,_loc4_);
                  }
                  continue loop1;
               }
            }
            return;
         }
         if(_loc3_ is _56)
         {
            if(_loc5_ == _789.OUTSIDE)
            {
               for each(_loc11_ in _loc2_)
               {
                  _loc12_ = _loc3_ as _56;
                  _loc13_ = int(_loc12_.parent.children.indexOf(_loc12_));
                  this._3564(_loc11_,_loc3_ as _56,_loc13_);
               }
            }
         }
      }
      
      protected function _3547(param1:ComicEvent) : void
      {
         var _loc4_:_67 = null;
         var _loc5_:_67 = null;
         var _loc6_:_67 = null;
         var _loc2_:Array = param1.data.dragTargets as Array;
         var _loc3_:Object = param1.data.responseTarget;
         if(_loc2_.length == 1 && _loc3_ == _loc2_[0])
         {
            return;
         }
         if(_loc3_ is _67)
         {
            _loc4_ = _loc3_ as _67;
            for each(_loc5_ in _loc4_.parent.children)
            {
               for each(_loc6_ in _loc2_)
               {
                  if(_loc6_.name == _loc5_.name)
                  {
                     this._3572(_loc6_,_loc4_,_loc5_);
                  }
               }
            }
         }
      }
      
      protected function _3570(param1:_67, param2:_67, param3:_67, param4:Boolean) : void
      {
         var _loc5_:_53 = param1._1992;
         var _loc6_:int = int(param2.parent.children.indexOf(param2));
         var _loc7_:_646 = this._3058._3098(param1);
         if(!param4)
         {
            _loc6_ += 1;
         }
         var _loc8_:Object;
         (_loc8_ = {})._2071 = param1;
         _loc8_._2056 = param2;
         _loc8_._3088 = param3;
         _loc8_._3090 = param1.parent;
         _loc8_._3091 = param1.parent.parent;
         _loc8_._3085 = _loc5_;
         _loc8_._3102 = param2.parent;
         _loc8_._3103 = param2.parent.parent;
         _loc8_._3099 = _loc6_;
         _loc8_._3087 = _loc7_;
         _loc8_._3080 = 0;
         _1567(new CommandNotification(CommandNotification.MOVE_TWEEN_TO_TRACK,_loc8_));
      }
      
      protected function _3571(param1:_67, param2:_67, param3:_67, param4:Boolean) : void
      {
         var _loc5_:_57 = param2._2069;
         var _loc6_:_53 = param1._1992;
         var _loc7_:int = _loc5_.index;
         if(!param4)
         {
            _loc7_++;
         }
         var _loc8_:_57 = new _57(_loc5_.parent);
         var _loc9_:_79 = param1._1837;
         var _loc10_:_646 = this._3058._3098(param1);
         var _loc11_:_67 = _loc6_._2048(param2,_loc9_,param4);
         var _loc12_:int = 0;
         var _loc13_:Object;
         (_loc13_ = {})._2071 = param1;
         _loc13_._2056 = param2;
         _loc13_._3088 = param3;
         _loc13_._3090 = param1.parent;
         _loc13_._3091 = param1.parent.parent;
         _loc13_._3085 = _loc6_;
         _loc13_._3102 = _loc8_;
         _loc13_._3103 = _loc8_.parent;
         _loc13_._3100 = _loc7_;
         _loc13_._3087 = _loc10_;
         _loc13_._3080 = _loc12_;
         _1567(new CommandNotification(CommandNotification.MOVE_TWEEN_TO_STRIP,_loc13_));
      }
      
      private function _3566(param1:_67, param2:_56) : Boolean
      {
         var _loc6_:_53 = null;
         var _loc7_:_79 = null;
         var _loc8_:_56 = null;
         var _loc9_:Vector.<_67> = null;
         var _loc11_:_67 = null;
         var _loc3_:_56 = param1._2070;
         var _loc4_:_57 = param1._2069;
         var _loc5_:int;
         var _loc10_:int = (_loc5_ = _loc4_.index) + param1.index;
         _loc6_ = _loc3_._1992;
         if(_loc10_ == 0)
         {
            if(_loc4_.tweens.length > 1)
            {
               _loc11_ = _loc4_.tweens[1];
            }
            else
            {
               if(_loc3_.tracks.length <= 1)
               {
                  return true;
               }
               _loc11_ = _loc3_.tracks[1].tweens[0];
            }
            if(_loc11_)
            {
               if(_loc11_._1837 == param1._1837)
               {
                  return false;
               }
               _loc7_ = _loc11_._1837;
               _loc8_ = _loc6_._2045(_loc7_);
               if(_loc8_ != null)
               {
                  return false;
               }
               return true;
            }
            return false;
         }
         _loc7_ = param1._1837;
         _loc8_ = _loc6_._2045(_loc7_);
         if(_loc8_ != null)
         {
            return false;
         }
         return true;
      }
      
      private function _3574(param1:_67, param2:_67, param3:Boolean) : Boolean
      {
         var _loc6_:_53 = null;
         var _loc7_:_79 = null;
         var _loc8_:_56 = null;
         var _loc13_:Vector.<_67> = null;
         var _loc18_:_646 = null;
         var _loc19_:int = 0;
         var _loc20_:int = 0;
         var _loc21_:_67 = null;
         var _loc4_:_56 = param2._2070;
         var _loc5_:_56 = param1._2070;
         var _loc9_:_57 = param2._2069;
         var _loc10_:int = _loc9_.index;
         var _loc11_:_57 = param1._2069;
         var _loc12_:int = _loc11_.index;
         if(param1._1837 == param2._1837 && (param1.appear || param2.appear || param1._10283 || param2._10283))
         {
            return false;
         }
         var _loc14_:int = 0;
         var _loc15_:int = int(_loc9_.tweens.length);
         while(_loc14_ < _loc15_)
         {
            if(_loc9_.tweens[_loc14_]._1837 == param1._1837)
            {
               if(_loc9_.tweens[_loc14_] != param1 && getQualifiedClassName(param1) == getQualifiedClassName(_loc9_.tweens[_loc14_]))
               {
                  return false;
               }
            }
            _loc14_++;
         }
         var _loc16_:_646 = this._3058._3098(param1);
         var _loc17_:_646 = this._3058._3098(param2);
         if(_loc17_ == null)
         {
            return false;
         }
         if(_loc16_ != _loc17_)
         {
            _loc14_ = 0;
            _loc15_ = int(_loc9_.tweens.length);
            while(_loc14_ < _loc15_)
            {
               if(param1._1837 == _loc9_.tweens[_loc14_]._1837)
               {
                  _loc18_ = this._3058._3098(_loc9_.tweens[_loc14_]);
                  break;
               }
               _loc14_++;
            }
            if(_loc18_)
            {
               if(param1._10279 && _loc18_._10279 || param1._10281 && _loc18_._10281 || param1._10280 && _loc18_._10280 || param1._10282 && _loc18_._10282)
               {
                  return false;
               }
            }
         }
         _loc6_ = _loc4_._1992;
         if(!param3)
         {
            _loc10_++;
         }
         if(_loc4_ == _loc5_)
         {
            _loc19_ = _loc10_ + param2.index;
            _loc20_ = _loc12_ + param1.index;
            if(_loc19_ > 0 && _loc20_ > 0)
            {
               return true;
            }
            if(_loc20_ == 0)
            {
               if(_loc11_.tweens.length > 1)
               {
                  _loc21_ = _loc11_.tweens[1];
               }
               else if(_loc5_.tracks.length > 1)
               {
                  _loc21_ = _loc5_.tracks[1].tweens[0];
               }
               if(_loc21_)
               {
                  if(_loc21_._1837 == param1._1837)
                  {
                     return true;
                  }
                  _loc7_ = _loc21_._1837;
                  _loc8_ = _loc6_._2045(_loc7_);
                  if(_loc8_ != null)
                  {
                     return false;
                  }
                  return true;
               }
               return true;
            }
            if(_loc19_ == 0)
            {
               _loc7_ = param1._1837;
               _loc8_ = _loc6_._2045(_loc7_);
               if(_loc8_ != null || _loc8_ != _loc5_)
               {
                  return false;
               }
               return false;
            }
            return false;
         }
         _loc19_ = _loc10_ + param2.index;
         _loc20_ = _loc12_ + param1.index;
         if(_loc19_ > 0 && _loc20_ > 0)
         {
            return true;
         }
         if(_loc20_ == 0 && _loc19_ > 0)
         {
            if(_loc11_.tweens.length > 1)
            {
               _loc21_ = _loc11_.tweens[1];
            }
            else if(_loc5_.tracks.length > 1)
            {
               _loc21_ = _loc5_.tracks[1].tweens[0];
            }
            if(_loc21_)
            {
               if(_loc21_._1837 == param1._1837)
               {
                  return true;
               }
               _loc7_ = _loc21_._1837;
               _loc8_ = _loc6_._2045(_loc7_);
               if(_loc8_ != null)
               {
                  return false;
               }
               return false;
            }
            return true;
         }
         if(_loc19_ == 0 && _loc20_ > 0)
         {
            _loc7_ = param1._1837;
            if(_loc7_ == param2._1837)
            {
               return true;
            }
            _loc8_ = _loc6_._2045(_loc7_);
            if(_loc8_ != null)
            {
               return false;
            }
            return true;
         }
         _loc7_ = param1._1837;
         if(_loc7_ == param2._1837)
         {
            return true;
         }
         if(_loc11_.tweens.length > 1)
         {
            _loc21_ = _loc11_.tweens[1];
         }
         else if(_loc5_.tracks.length > 1)
         {
            _loc21_ = _loc5_.tracks[1].tweens[0];
         }
         if(_loc21_)
         {
            if(_loc7_ == _loc21_._1837)
            {
               return false;
            }
            _loc7_ = _loc21_._1837;
            _loc8_ = _loc6_._2045(_loc7_);
            if(_loc8_ != null && _loc8_ != _loc4_)
            {
               return false;
            }
            return true;
         }
         return true;
      }
      
      private function _3575(param1:_67, param2:_67, param3:Boolean) : Boolean
      {
         var _loc6_:_53 = null;
         var _loc7_:_79 = null;
         var _loc8_:_56 = null;
         var _loc13_:Vector.<_67> = null;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc4_:_56 = param2._2070;
         var _loc5_:_56 = param1._2070;
         var _loc9_:_57 = param2._2069;
         var _loc10_:int = _loc9_.index;
         var _loc11_:_57 = param1._2069;
         var _loc12_:int = _loc11_.index;
         _loc6_ = _loc4_._1992;
         if(param2._2069.tweens.length > 1)
         {
            if(param2.index < param2._2069.tweens.length - 1 || param3 && param2.index == param2._2069.tweens.length - 1)
            {
               return this._3574(param1,param2,param3);
            }
         }
         if(_loc4_ == _loc5_)
         {
            if(!param3)
            {
               _loc10_++;
            }
            if(param1 == param2)
            {
               if(_loc11_.tweens.length > 1 && param1.index == _loc11_.tweens.length - 1)
               {
                  return true;
               }
               return false;
            }
            if(_loc10_ > 0 && _loc12_ > 0)
            {
               return true;
            }
            if(_loc10_ == 0)
            {
               _loc7_ = param1._1837;
               if(_loc7_ == param2._1837)
               {
                  return true;
               }
               _loc8_ = _loc6_._2045(_loc7_);
               if(_loc8_ != null)
               {
                  return false;
               }
            }
            else if(_loc12_ == 0 && param1.index == 0)
            {
               if(_loc11_.tweens.length > 1)
               {
                  _loc7_ = _loc11_.tweens[1]._1837;
                  _loc8_ = _loc6_._2045(_loc7_);
                  if(_loc8_ != null)
                  {
                     return false;
                  }
               }
               else if(_loc5_.tracks.length > 1)
               {
                  _loc7_ = _loc5_.tracks[1].tweens[0]._1837;
                  _loc8_ = _loc6_._2045(_loc7_);
                  if(_loc8_ != null)
                  {
                     return false;
                  }
               }
               return true;
            }
         }
         else
         {
            if(!param3)
            {
               _loc10_++;
            }
            _loc14_ = _loc10_ + param2.index;
            _loc15_ = _loc12_ + param1.index;
            if(_loc14_ > 0 && _loc15_ > 0)
            {
               return true;
            }
            if(_loc14_ > 0 && _loc15_ == 0)
            {
               _loc7_ = this._10302(_loc5_);
               if(!_loc7_)
               {
                  return true;
               }
               if(_loc7_ == param1._1837)
               {
                  return true;
               }
               _loc8_ = _loc6_._2045(_loc7_);
               if(_loc8_ != null)
               {
                  return false;
               }
            }
            else if(_loc14_ == 0 && _loc15_ > 0)
            {
               if(_loc4_._2068 == param1._1837)
               {
                  return true;
               }
               _loc7_ = param1._1837;
               _loc8_ = _loc6_._2045(_loc7_);
               if(_loc8_ != null)
               {
                  return false;
               }
            }
            else if(_loc14_ == 0 && _loc15_ == 0)
            {
               if(_loc4_._2068 == param1._1837)
               {
                  return true;
               }
               if(_loc11_.tweens.length > 1)
               {
                  _loc7_ = _loc11_.tweens[1]._1837;
                  _loc8_ = _loc6_._2045(_loc7_);
                  if(_loc8_ != null && _loc4_ != _loc8_)
                  {
                     return false;
                  }
               }
               else
               {
                  if(_loc11_.tweens.length != 1)
                  {
                     return true;
                  }
                  if(_loc5_.tracks.length > 1)
                  {
                     _loc7_ = _loc5_.tracks[1].tweens[0]._1837;
                     _loc8_ = _loc6_._2045(_loc7_);
                     if(_loc8_ != null && _loc4_ != _loc8_)
                     {
                        return false;
                     }
                  }
               }
            }
         }
         return true;
      }
      
      private function _10302(param1:_56) : _79
      {
         var _loc2_:_57 = param1.tracks[0];
         if(_loc2_.tweens.length > 1)
         {
            return _loc2_.tweens[1]._1837;
         }
         if(param1.tracks.length > 1)
         {
            _loc2_ = param1.tracks[1];
            return _loc2_.tweens[0]._1837;
         }
         return null;
      }
      
      protected function _3564(param1:_67, param2:_56, param3:int) : void
      {
         var _loc4_:_53 = param1._1992;
         var _loc5_:int = int(param2.parent.children.indexOf(param2));
         var _loc6_:_646 = this._3058._3098(param1);
         var _loc7_:_56 = new _56(_loc4_);
         var _loc8_:_57 = new _57(_loc7_);
         var _loc9_:Object;
         (_loc9_ = {})._2071 = param1;
         _loc9_._2056 = null;
         _loc9_.targetStriptVO = param2;
         _loc9_._3088 = null;
         _loc9_._3090 = param1.parent;
         _loc9_._3091 = param1.parent.parent;
         _loc9_._3085 = _loc4_;
         _loc9_._3102 = _loc8_;
         _loc9_._3103 = _loc7_;
         _loc9_._3104 = param3;
         _loc9_._3087 = _loc6_;
         _loc9_._3080 = 0;
         _1567(new CommandNotification(CommandNotification.MOVE_TWEEN_OUT_STRIP,_loc9_));
      }
      
      protected function _3546(param1:_67, param2:_56, param3:int) : void
      {
         var _loc12_:_57 = null;
         var _loc13_:int = 0;
         var _loc4_:_53 = param1._1992;
         var _loc5_:int = int(param2.parent.children.indexOf(param2));
         var _loc6_:int = int(param1.parent.parent.children.indexOf(param1.parent));
         var _loc7_:_646 = this._3058._3098(param1);
         var _loc8_:_56 = new _56(_loc4_);
         var _loc9_:_57 = new _57(_loc8_);
         var _loc10_:Object;
         (_loc10_ = {})._2071 = param1;
         var _loc11_:Vector.<_57> = new Vector.<_57>();
         for each(_loc12_ in param1.parent.parent.children)
         {
            _loc13_ = int(_loc12_.parent.children.indexOf(_loc12_));
            if(_loc13_ > _loc6_)
            {
               _loc11_.push(_loc12_);
            }
         }
         _loc10_._3101 = _loc11_;
         _loc10_._2056 = null;
         _loc10_.targetStriptVO = param2;
         _loc10_._3088 = null;
         _loc10_._3090 = param1.parent;
         _loc10_._3091 = param1.parent.parent;
         _loc10_._3085 = _loc4_;
         _loc10_._3102 = _loc9_;
         _loc10_._3103 = _loc8_;
         _loc10_._3104 = param3;
         _loc10_._3087 = _loc7_;
         _loc10_._3080 = 0;
         _1567(new CommandNotification(CommandNotification.MOVE_TWEEN_AFTER_TRACKS_OUT_STRIP,_loc10_));
      }
      
      protected function _3572(param1:_67, param2:_67, param3:_67) : void
      {
         _1567(new CommandNotification(CommandNotification.DRAG_MERGE,_469._3496(param1,param2,param3)));
      }
      
      public function _3555(param1:Vector.<_67>) : void
      {
         if(this._3562._3591.length == 0)
         {
            this._3548 = param1;
            return;
         }
         if(this._3548)
         {
            param1 = this._3548;
            this._3548 = null;
         }
         this._3577(param1);
         this._3560();
      }
      
      public function _2894() : void
      {
         this._3562.refresh();
         this.comicTree.tree._2449();
         this.comicTree._2449();
         this._3580();
      }
      
      public function _3063(param1:_53 = null) : void
      {
         var _1744:_53 = param1;
         if(_1744)
         {
            this._3562 = this._3554(_1744);
         }
         if(this.comicTree)
         {
            this.comicTree._3583(this._3562);
         }
         this._3557();
         _99(function():void
         {
            _3560();
         },null,0);
      }
      
      public function get _3598() : Array
      {
         if(this._3562)
         {
            return this._3562._3591;
         }
         return null;
      }
      
      public function get _3595() : Vector.<_56>
      {
         var _loc2_:Object = null;
         var _loc1_:Vector.<_56> = new Vector.<_56>();
         for each(_loc2_ in this._3598)
         {
            if(_loc2_ is _56)
            {
               _loc1_.push(_loc2_);
            }
         }
         return _loc1_;
      }
      
      public function get _3596() : Vector.<_67>
      {
         var _loc2_:Object = null;
         var _loc1_:Vector.<_67> = new Vector.<_67>();
         for each(_loc2_ in this._3598)
         {
            if(_loc2_ is _67)
            {
               if((_loc2_ as _67).visible)
               {
                  _loc1_.push(_loc2_);
               }
            }
         }
         return _loc1_;
      }
      
      public function _3579() : Vector.<_67>
      {
         var _loc2_:Object = null;
         var _loc1_:Vector.<_67> = new Vector.<_67>();
         for each(_loc2_ in this._3598)
         {
            if(_loc2_ is _67)
            {
               _loc1_.push(_loc2_);
            }
         }
         return _loc1_;
      }
      
      public function get _3592() : Vector.<_67>
      {
         var _loc2_:_67 = null;
         var _loc1_:Vector.<_67> = new Vector.<_67>();
         for each(_loc2_ in this._3596)
         {
            if(_loc2_._2080 == "down")
            {
               _loc1_.push(_loc2_);
            }
         }
         return _loc1_;
      }
      
      public function get _3585() : Vector.<_67>
      {
         var _loc2_:_67 = null;
         var _loc1_:Vector.<_67> = new Vector.<_67>();
         for each(_loc2_ in this._3596)
         {
            if(_loc2_._2080 != "down")
            {
               _loc1_.push(_loc2_);
            }
         }
         return _loc1_;
      }
      
      public function _3578(param1:Vector.<_67>) : void
      {
         var _loc2_:_67 = null;
         for each(_loc2_ in this._3596)
         {
            if(param1.indexOf(_loc2_) >= 0)
            {
               _loc2_._2080 = "";
            }
         }
      }
      
      public function _3577(param1:Vector.<_67>) : void
      {
         var _loc2_:_67 = null;
         for each(_loc2_ in this._3596)
         {
            if(param1.indexOf(_loc2_) == -1)
            {
               _loc2_._2080 = "";
            }
            else
            {
               _loc2_._2080 = "down";
            }
         }
         this._3556();
      }
      
      public function _3556() : void
      {
         var _loc1_:Vector.<Object> = null;
         var _loc2_:_67 = null;
         if(Boolean(this.comicTree) && Boolean(this.comicTree.tree))
         {
            _loc1_ = new Vector.<Object>();
            for each(_loc2_ in this._3592)
            {
               _loc1_.push(_loc2_);
            }
            this.comicTree.tree._2889 = _loc1_;
         }
      }
      
      public function _3549(param1:Vector.<_67> = null) : void
      {
         if(!param1)
         {
            param1 = this._3592;
         }
         _1567(new ComicNotification(ComicNotification.SELECT_TWEENS,param1));
         _1567(new ComicNotification(ComicNotification.TWEEN_SELECTED_FOR_PROPERTY,param1));
      }
      
      public function _3105() : void
      {
         var _loc1_:_67 = null;
         for each(_loc1_ in this._3596)
         {
            _loc1_._2080 = "";
         }
         this._3556();
      }
      
      public function _3557() : void
      {
         if(Boolean(this.comicTree) && Boolean(this.comicTree.tree))
         {
            this._3556();
         }
      }
      
      protected function _3554(param1:_53) : _793
      {
         var _loc2_:_793 = new _793();
         _loc2_.source = param1;
         return _loc2_;
      }
      
      public function get comicTree() : _795
      {
         return this._3582.comicTree;
      }
      
      public function get _3581() : DropDownList
      {
         return this._3582._3581;
      }
      
      public function get _3058() : _589
      {
         return _1407.getInstance(_589) as _589;
      }
      
      public function get _3558() : _605
      {
         return _1407.getInstance(_605) as _605;
      }
      
      public function get _1744() : _53
      {
         if(!this._3558 || !this._3558._3567)
         {
            return null;
         }
         return this._3558._3567._1992;
      }
      
      public function get _3567() : _643
      {
         return this._3058._3567;
      }
      
      public function get _3061() : _523
      {
         return _1407.getInstance(_523) as _523;
      }
      
      public function get _3056() : _556
      {
         return _1407.getInstance(_556) as _556;
      }
   }
}

