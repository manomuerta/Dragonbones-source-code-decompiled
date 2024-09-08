package _1045
{
   import _1088.ItemRenderer;
   import _1088._1094;
   import _1177.IndexChangeEvent;
   import _1177.ListEvent;
   import _1177.RendererExistenceEvent;
   import _1177.UIEvent;
   import egret.core._1133;
   import egret.core._1137;
   import egret.core.ns_egret;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   use namespace ns_egret;
   
   public class List extends _1094
   {
      private var _8101:Boolean = true;
      
      private var _3853:Boolean = false;
      
      private var _8104:Vector.<int>;
      
      private var _8092:Vector.<int>;
      
      ns_egret var _8100:Boolean = true;
      
      private var _8094:_1070;
      
      public function List()
      {
         this._8104 = new Vector.<int>();
         super();
         this._6056 = true;
         this._6055 = true;
      }
      
      override protected function _2438() : void
      {
         if(!itemRenderer)
         {
            itemRenderer = ItemRenderer;
         }
         super._2438();
      }
      
      override public function get _6056() : Boolean
      {
         return super._6056;
      }
      
      override public function set _6056(param1:Boolean) : void
      {
         super._6056 = param1;
      }
      
      public function get _3854() : Boolean
      {
         return this._3853;
      }
      
      public function set _3854(param1:Boolean) : void
      {
         this._3853 = param1;
      }
      
      public function get _5358() : Vector.<int>
      {
         if(this._8092)
         {
            return this._8092;
         }
         return this._8104;
      }
      
      public function set _5358(param1:Vector.<int>) : void
      {
         this.ns_egret::_8102(param1,false);
      }
      
      override public function get selectedIndex() : int
      {
         if(this._8092)
         {
            if(this._8092.length > 0)
            {
               return this._8092[0];
            }
            return -1;
         }
         return super.selectedIndex;
      }
      
      public function get _2889() : Vector.<Object>
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc1_:Vector.<Object> = new Vector.<Object>();
         var _loc2_:Vector.<int> = this._5358;
         if(_loc2_)
         {
            _loc3_ = int(_loc2_.length);
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               _loc1_[_loc4_] = dataProvider.getItemAt(_loc2_[_loc4_]);
               _loc4_++;
            }
         }
         return _loc1_;
      }
      
      public function set _2889(param1:Vector.<Object>) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc2_:Vector.<int> = new Vector.<int>();
         if(param1)
         {
            _loc3_ = int(param1.length);
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               _loc5_ = dataProvider.getItemIndex(param1[_loc4_]);
               if(_loc5_ != -1)
               {
                  _loc2_.splice(0,0,_loc5_);
               }
               if(_loc5_ == -1)
               {
                  _loc2_ = new Vector.<int>();
                  break;
               }
               _loc4_++;
            }
         }
         this.ns_egret::_8102(_loc2_,false);
      }
      
      ns_egret function _8102(param1:Vector.<int>, param2:Boolean = false) : void
      {
         if(param2)
         {
            ns_egret::_2459 = Boolean(ns_egret::_2459) || param2;
         }
         if(param1)
         {
            this._8092 = param1;
         }
         else
         {
            this._8092 = new Vector.<int>();
         }
         _2466();
      }
      
      override protected function _2476() : void
      {
         super._2476();
         if(this._8092)
         {
            this._2477();
         }
      }
      
      override protected function _2477(param1:Boolean = true) : Boolean
      {
         var _loc4_:Vector.<int> = null;
         var _loc5_:IndexChangeEvent = null;
         var _loc2_:Number = Number(ns_egret::_2480);
         if(this._8092)
         {
            this._8092 = this._8092.filter(this._8105);
            if(!this._3854 && this._8092.length > 0)
            {
               _loc4_ = new Vector.<int>();
               _loc4_.push(this._8092[0]);
               this._8092 = _loc4_;
            }
            if(this._8092.length > 0)
            {
               ns_egret::_2461 = this._8092[0];
            }
            else
            {
               ns_egret::_2461 = -1;
            }
         }
         var _loc3_:Boolean = super._2477(false);
         if(!_loc3_)
         {
            this._8092 = null;
            return false;
         }
         if(this.selectedIndex > NO_SELECTION)
         {
            if(this._8092)
            {
               if(this._8092.indexOf(this.selectedIndex) == -1)
               {
                  this._8092.push(this.selectedIndex);
               }
            }
            else
            {
               this._8092 = new <int>[this.selectedIndex];
            }
         }
         if(this._8092)
         {
            if(this._8092.indexOf(_loc2_) != -1)
            {
               _2483(_loc2_,true);
            }
            this._8093();
         }
         if(param1 && _loc3_)
         {
            if(ns_egret::_2459)
            {
               (_loc5_ = new IndexChangeEvent(IndexChangeEvent.CHANGE)).oldIndex = _loc2_;
               _loc5_.newIndex = ns_egret::_2480;
               dispatchEvent(_loc5_);
               ns_egret::_2459 = false;
            }
            dispatchEvent(new UIEvent(UIEvent.VALUE_COMMIT));
         }
         return _loc3_;
      }
      
      private function _8105(param1:int, param2:int, param3:Vector.<int>) : Boolean
      {
         return Boolean(dataProvider) && param1 >= 0 && param1 < dataProvider.length;
      }
      
      protected function _8093() : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc1_:Vector.<int> = new Vector.<int>();
         var _loc2_:Vector.<int> = new Vector.<int>();
         if(this._8104.length > 0 && this._8092.length > 0)
         {
            _loc4_ = int(this._8092.length);
            _loc3_ = 0;
            while(_loc3_ < _loc4_)
            {
               if(this._8104.indexOf(this._8092[_loc3_]) == -1)
               {
                  _loc2_.push(this._8092[_loc3_]);
               }
               _loc3_++;
            }
            _loc4_ = int(this._8104.length);
            _loc3_ = 0;
            while(_loc3_ < _loc4_)
            {
               if(this._8092.indexOf(this._8104[_loc3_]) == -1)
               {
                  _loc1_.push(this._8104[_loc3_]);
               }
               _loc3_++;
            }
         }
         else if(this._8104.length > 0)
         {
            _loc1_ = this._8104;
         }
         else if(this._8092.length > 0)
         {
            _loc2_ = this._8092;
         }
         this._8104 = this._8092;
         if(_loc1_.length > 0)
         {
            _loc4_ = int(_loc1_.length);
            _loc3_ = 0;
            while(_loc3_ < _loc4_)
            {
               _2483(_loc1_[_loc3_],false);
               _loc3_++;
            }
         }
         if(_loc2_.length > 0)
         {
            _loc4_ = int(_loc2_.length);
            _loc3_ = 0;
            while(_loc3_ < _loc4_)
            {
               _2483(_loc2_[_loc3_],true);
               _loc3_++;
            }
         }
         this._8092 = null;
      }
      
      override ns_egret function _2471(param1:int) : Boolean
      {
         if(this._3853)
         {
            return this._8104.indexOf(param1) != -1;
         }
         return super.ns_egret::_2471(param1);
      }
      
      override protected function _2462() : void
      {
         if(this._3853)
         {
            return;
         }
         super._2462();
      }
      
      override protected function _2603(param1:RendererExistenceEvent) : void
      {
         super._2603(param1);
         var _loc2_:DisplayObject = param1._2487 as DisplayObject;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.addEventListener(MouseEvent.MOUSE_DOWN,this._8095);
         _loc2_.addEventListener(MouseEvent.MOUSE_UP,this._8099);
      }
      
      override protected function _2601(param1:RendererExistenceEvent) : void
      {
         super._2601(param1);
         var _loc2_:DisplayObject = param1._2487 as DisplayObject;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.removeEventListener(MouseEvent.MOUSE_DOWN,this._8095);
         _loc2_.removeEventListener(MouseEvent.MOUSE_UP,this._8099);
      }
      
      override protected function _2486(param1:int) : void
      {
         this._2478(param1,true);
      }
      
      override protected function _2485(param1:int) : void
      {
         this._2478(param1,false);
      }
      
      override protected function _2478(param1:int, param2:Boolean = false) : void
      {
         var _loc3_:int = 0;
         var _loc4_:Number = NaN;
         var _loc6_:IndexChangeEvent = null;
         var _loc5_:Vector.<int> = new Vector.<int>();
         if(this.selectedIndex == NO_SELECTION || Boolean(ns_egret::_2465))
         {
            if(dataProvider && dataProvider.length == 1 && _6678)
            {
               _loc5_.push(0);
               this._8104 = _loc5_;
               ns_egret::_2480 = 0;
               _2483(ns_egret::_2480,true);
               dispatchEvent(new UIEvent(UIEvent.VALUE_COMMIT));
            }
            return;
         }
         if(!this._5358 && this.selectedIndex > NO_SELECTION || this.selectedIndex > NO_SELECTION && this._5358.indexOf(this.selectedIndex) == -1)
         {
            this._2477();
         }
         if(param2)
         {
            _loc3_ = 0;
            while(_loc3_ < this._5358.length)
            {
               _loc4_ = this._5358[_loc3_];
               if(_loc4_ >= param1)
               {
                  _loc5_.push(_loc4_ + 1);
               }
               else
               {
                  _loc5_.push(_loc4_);
               }
               _loc3_++;
            }
         }
         else if((!this._5358 || this._5358.length == 0) && this._5358.length == 1 && param1 == this.selectedIndex && _6678)
         {
            if(dataProvider.length == 0)
            {
               _loc5_ = new Vector.<int>();
            }
            else
            {
               ns_egret::_2461 = 0;
               _2466();
               if(param1 == 0)
               {
                  return;
               }
               _loc5_.push(0);
            }
         }
         else
         {
            _loc3_ = 0;
            while(_loc3_ < this._5358.length)
            {
               _loc4_ = this._5358[_loc3_];
               if(_loc4_ > param1)
               {
                  _loc5_.push(_loc4_ - 1);
               }
               else if(_loc4_ < param1)
               {
                  _loc5_.push(_loc4_);
               }
               _loc3_++;
            }
         }
         var _loc7_:Vector.<int> = this._5358;
         this._8104 = _loc5_;
         ns_egret::_2480 = this._8103(_loc5_);
         if(this._8104 != _loc7_)
         {
            ns_egret::_2464 = true;
            _2466();
         }
      }
      
      private function _8103(param1:Vector.<int>) : int
      {
         if(Boolean(param1) && param1.length > 0)
         {
            return param1[0];
         }
         return -1;
      }
      
      protected function _8095(param1:MouseEvent) : void
      {
         var _loc2_:_1070 = param1.currentTarget as _1070;
         this._8094 = _loc2_;
         _loc2_.addEventListener(MouseEvent.MOUSE_MOVE,this._8096);
         stage.addEventListener(MouseEvent.MOUSE_UP,this._8097,false,0,true);
         stage.addEventListener(Event.MOUSE_LEAVE,this._8097,false,0,true);
      }
      
      protected function _8096(param1:MouseEvent) : void
      {
         var _loc5_:int = 0;
         param1.currentTarget.removeEventListener(MouseEvent.MOUSE_MOVE,this._8096);
         var _loc2_:_1070 = param1.currentTarget as _1070;
         var _loc3_:Boolean = false;
         var _loc4_:int = 0;
         while(_loc4_ < this._2889.length)
         {
            if(_loc2_.data == this._2889[_loc4_])
            {
               _loc3_ = true;
               break;
            }
            _loc4_++;
         }
         if(_loc3_)
         {
            return;
         }
         if(_loc2_ != this._8094)
         {
            return;
         }
         if(_loc2_)
         {
            _loc5_ = _loc2_.itemIndex;
         }
         else
         {
            _loc5_ = _2490.getElementIndex(param1.currentTarget as _1133);
         }
         if(this._3853)
         {
            this.ns_egret::_8102(this._8091(_loc5_,param1.shiftKey,param1.ctrlKey),true);
         }
         else
         {
            ns_egret::_2475(_loc5_,true);
         }
         _2449();
      }
      
      protected function _8099(param1:MouseEvent) : void
      {
         var _loc3_:int = 0;
         param1.currentTarget.removeEventListener(MouseEvent.MOUSE_MOVE,this._8096);
         var _loc2_:_1070 = param1.currentTarget as _1070;
         if(_loc2_ != this._8094)
         {
            return;
         }
         if(_loc2_)
         {
            _loc3_ = _loc2_.itemIndex;
         }
         else
         {
            _loc3_ = _2490.getElementIndex(param1.currentTarget as _1133);
         }
         if(this._3853)
         {
            this.ns_egret::_8102(this._8091(_loc3_,param1.shiftKey,param1.ctrlKey),true);
         }
         else
         {
            ns_egret::_2475(_loc3_,true);
         }
         ns_egret::_2473(param1,ListEvent.ITEM_CLICK,_loc2_);
      }
      
      private function _8091(param1:int, param2:Boolean, param3:Boolean) : Vector.<int>
      {
         var _loc4_:int = 0;
         var _loc6_:Boolean = false;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc5_:Vector.<int> = new Vector.<int>();
         if(!param2)
         {
            if(param3)
            {
               if(this._8104.length > 0)
               {
                  if(this._8104.length == 1 && this._8104[0] == param1)
                  {
                     if(!_6678)
                     {
                        return _loc5_;
                     }
                     _loc5_.splice(0,0,this._8104[0]);
                     return _loc5_;
                  }
                  _loc6_ = false;
                  _loc4_ = 0;
                  while(_loc4_ < this._8104.length)
                  {
                     if(this._8104[_loc4_] == param1)
                     {
                        _loc6_ = true;
                     }
                     else if(this._8104[_loc4_] != param1)
                     {
                        _loc5_.splice(0,0,this._8104[_loc4_]);
                     }
                     _loc4_++;
                  }
                  if(!_loc6_)
                  {
                     _loc5_.splice(0,0,param1);
                  }
                  return _loc5_;
               }
               _loc5_.splice(0,0,param1);
               return _loc5_;
            }
            _loc5_.splice(0,0,param1);
            return _loc5_;
         }
         _loc7_ = this._8104.length > 0 ? this._8104[this._8104.length - 1] : 0;
         _loc8_ = param1;
         if(_loc7_ < _loc8_)
         {
            _loc4_ = _loc7_;
            while(_loc4_ <= _loc8_)
            {
               _loc5_.splice(0,0,_loc4_);
               _loc4_++;
            }
         }
         else
         {
            _loc4_ = _loc7_;
            while(_loc4_ >= _loc8_)
            {
               _loc5_.splice(0,0,_loc4_);
               _loc4_--;
            }
         }
         return _loc5_;
      }
      
      private function _8097(param1:Event) : void
      {
         if(stage != null)
         {
            stage.removeEventListener(MouseEvent.MOUSE_UP,this._8097);
            stage.removeEventListener(Event.MOUSE_LEAVE,this._8097);
         }
         this._8094 = null;
      }
      
      public function get _6055() : Boolean
      {
         return this._8101;
      }
      
      public function set _6055(param1:Boolean) : void
      {
         this._8101 = param1;
         if(this._8101)
         {
            this.addEventListener(KeyboardEvent.KEY_DOWN,this._8089);
         }
         else
         {
            this.removeEventListener(KeyboardEvent.KEY_DOWN,this._8089);
         }
      }
      
      protected function _8089(param1:KeyboardEvent) : void
      {
         var _loc4_:int = 0;
         var _loc5_:Vector.<int> = null;
         var _loc6_:int = 0;
         var _loc2_:uint = param1.keyCode;
         if(!_1137._7518(param1.keyCode))
         {
            return;
         }
         var _loc3_:int = layout._8090(this.selectedIndex,_loc2_);
         if(_loc3_ == -1)
         {
            return;
         }
         param1.preventDefault();
         if(this._3854 && param1.shiftKey && Boolean(this._5358))
         {
            _loc4_ = 0;
            if(Boolean(this._5358) && this._5358.length > 0)
            {
               _loc4_ = this._5358[this._5358.length - 1];
            }
            _loc5_ = new Vector.<int>();
            if(_loc4_ <= _loc3_)
            {
               _loc6_ = _loc4_;
               while(_loc6_ <= _loc3_)
               {
                  _loc5_.splice(0,0,_loc6_);
                  _loc6_++;
               }
            }
            else
            {
               _loc6_ = _loc4_;
               while(_loc6_ >= _loc3_)
               {
                  _loc5_.splice(0,0,_loc6_);
                  _loc6_--;
               }
            }
            this.ns_egret::_8102(_loc5_,true);
            this._8098(_loc3_);
         }
         else
         {
            ns_egret::_2475(_loc3_,true);
            this._8098(_loc3_);
         }
         if(Boolean(stage) && !stage.focus)
         {
            _2581();
         }
      }
      
      public function _8098(param1:int) : void
      {
         if(!layout)
         {
            return;
         }
         var _loc2_:Point = _2490.layout._7666(param1);
         if(_loc2_)
         {
            _2490.horizontalScrollPosition += _loc2_.x;
            _2490.verticalScrollPosition += _loc2_.y;
            _2490._2449();
         }
      }
   }
}

