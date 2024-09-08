package _1045
{
   import _1088._1090;
   import _1177.SkinPartEvent;
   import _1177.UIEvent;
   import egret.core.Injector;
   import egret.core._1122;
   import egret.core._1124;
   import egret.core._1125;
   import egret.core._1127;
   import egret.core._1140;
   import egret.core._1141;
   import egret.core.ns_egret;
   import egret.utils._1297;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.filters.ColorMatrixFilter;
   
   use namespace ns_egret;
   
   public class _1085 extends _1140
   {
      private static var _8351:_1125;
      
      private static var _8348:_1104;
      
      private static const ID_MAP:QName = new QName(ns_egret,"idMap");
      
      private static var _8352:Array = [new ColorMatrixFilter([0.3086,0.6094,0.082,0,0,0.3086,0.6094,0.082,0,0,0.3086,0.6094,0.082,0,0,0,0,0,1,0,0,0,0,0,1])];
      
      private static const errorStr:String = "在此组件中不可用，若此组件为容器类，请使用";
      
      public var hostComponentKey:String = "";
      
      ns_egret var _7585:Boolean = false;
      
      ns_egret var _8354:Object;
      
      ns_egret var _2737:Object;
      
      private var _7405:Boolean = false;
      
      private var _8339:Boolean = false;
      
      private var _8349:Boolean = false;
      
      private var _8353:Array;
      
      private var _8341:Boolean = false;
      
      private var _8340:Boolean = true;
      
      private var _8337:Boolean = true;
      
      private var _8338:Boolean = true;
      
      public function _1085()
      {
         super();
      }
      
      public function get skinName() : Object
      {
         return this.ns_egret::_8354;
      }
      
      public function set skinName(param1:Object) : void
      {
         if(this.ns_egret::_8354 == param1)
         {
            return;
         }
         this.ns_egret::_8354 = param1;
         this.ns_egret::_7585 = true;
         if(this._7405)
         {
            this._8347();
         }
      }
      
      public function get skin() : Object
      {
         return this.ns_egret::_2737;
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this._8347();
         this._7405 = true;
      }
      
      private function _8347() : void
      {
         var _loc4_:_1104 = null;
         var _loc5_:UIEvent = null;
         var _loc1_:_1125 = _8351;
         if(!_loc1_)
         {
            _loc1_ = this._8345();
         }
         var _loc2_:Object = _loc1_._8355(this.ns_egret::_8354,this);
         if(!_loc2_)
         {
            _loc4_ = _8348;
            if(!_loc4_)
            {
               _loc4_ = this._8342();
            }
            _loc2_ = _loc4_._8343(this);
         }
         var _loc3_:Object = this.ns_egret::_2737;
         this._8190(_loc3_);
         if(_loc3_ is DisplayObject)
         {
            ns_egret::removeFromDisplayList(DisplayObject(_loc3_));
         }
         this.ns_egret::_2737 = _loc2_;
         if(_loc2_ is DisplayObject)
         {
            ns_egret::addToDisplayListAt(DisplayObject(_loc2_),0);
         }
         this._8189(_loc2_);
         this._2570();
         invalidateSize();
         invalidateDisplayList();
         if(hasEventListener(UIEvent.SKIN_CHANGED))
         {
            _loc5_ = new UIEvent(UIEvent.SKIN_CHANGED);
            dispatchEvent(_loc5_);
         }
      }
      
      private function _8342() : _1104
      {
         var theme:_1104 = null;
         try
         {
            theme = Injector.getInstance(_1104);
         }
         catch(e:Error)
         {
            theme = new _1104();
         }
         _1085._8348 = theme;
         return theme;
      }
      
      private function _8345() : _1125
      {
         var adapter:_1125 = null;
         try
         {
            adapter = Injector.getInstance(_1125);
         }
         catch(e:Error)
         {
            adapter = new _1090();
         }
         _1085._8351 = adapter;
         return adapter;
      }
      
      protected function _8189(param1:Object) : void
      {
         var _loc2_:_1124 = null;
         if(Boolean(param1) && !(param1 is DisplayObject))
         {
            this._8339 = true;
         }
         else
         {
            this._8339 = false;
         }
         if(param1 is _1124)
         {
            _loc2_ = param1 as _1124;
            _loc2_._6081 = this;
            this._8346();
         }
      }
      
      public function _8346() : void
      {
         var _loc3_:String = null;
         var _loc1_:Object = this.ns_egret::_2737;
         if(!_loc1_ || !(_loc1_ is _1124))
         {
            return;
         }
         if(_loc1_[ID_MAP])
         {
            _loc1_ = _loc1_[ID_MAP];
         }
         var _loc2_:Vector.<String> = _1297._8350(this);
         for each(_loc3_ in _loc2_)
         {
            if(_loc3_ in this && _loc3_ in _loc1_ && _loc1_[_loc3_] != null && this[_loc3_] == null)
            {
               try
               {
                  this[_loc3_] = _loc1_[_loc3_];
                  this.partAdded(_loc3_,_loc1_[_loc3_]);
               }
               catch(e:Error)
               {
               }
            }
         }
      }
      
      protected function _8190(param1:Object) : void
      {
         var _loc2_:Vector.<String> = null;
         var _loc3_:String = null;
         if(param1 is _1124)
         {
            _loc2_ = _1297._8350(this);
            for each(_loc3_ in _loc2_)
            {
               if(_loc3_ in this)
               {
                  if(this[_loc3_] != null)
                  {
                     this.partRemoved(_loc3_,this[_loc3_]);
                  }
                  this[_loc3_] = null;
               }
            }
            (param1 as _1124)._6081 = null;
         }
      }
      
      protected function partAdded(param1:String, param2:Object) : void
      {
         var _loc3_:SkinPartEvent = new SkinPartEvent(SkinPartEvent.PART_ADDED);
         _loc3_._2518 = param1;
         _loc3_.instance = param2;
         dispatchEvent(_loc3_);
      }
      
      protected function partRemoved(param1:String, param2:Object) : void
      {
         var _loc3_:SkinPartEvent = new SkinPartEvent(SkinPartEvent.PART_REMOVED);
         _loc3_._2518 = param1;
         _loc3_.instance = param2;
         dispatchEvent(_loc3_);
      }
      
      public function _2570() : void
      {
         if(this._8349)
         {
            return;
         }
         this._8349 = true;
         _2466();
      }
      
      protected function _6232() : void
      {
         var _loc1_:String = this._6231();
         var _loc2_:Boolean = false;
         var _loc3_:Object = this.ns_egret::_2737;
         if(_loc3_ is _1127)
         {
            (_loc3_ as _1127)._2080 = _loc1_;
            _loc2_ = (_loc3_ as _1127)._8334(_loc1_);
         }
         if(hasEventListener("stateChanged"))
         {
            dispatchEvent(new Event("stateChanged"));
         }
         if(enabled)
         {
            if(this._8341)
            {
               filters = this._8353;
               this._8353 = null;
               this._8341 = false;
            }
         }
         else if(!_loc2_ && !this._8341)
         {
            this._8353 = filters;
            filters = _8352;
            this._8341 = true;
         }
      }
      
      public function get _6675() : Boolean
      {
         return this._8340;
      }
      
      public function set _6675(param1:Boolean) : void
      {
         if(this._8340 == param1)
         {
            return;
         }
         this._8340 = param1;
         if(this._8340)
         {
            super.mouseChildren = enabled ? this._8337 : false;
            super.mouseEnabled = enabled ? this._8338 : false;
         }
         else
         {
            super.mouseChildren = this._8337;
            super.mouseEnabled = this._8338;
         }
      }
      
      override public function set mouseChildren(param1:Boolean) : void
      {
         if(enabled)
         {
            super.mouseChildren = param1;
         }
         this._8337 = param1;
      }
      
      override public function set mouseEnabled(param1:Boolean) : void
      {
         if(enabled)
         {
            super.mouseEnabled = param1;
         }
         this._8338 = param1;
      }
      
      override public function set enabled(param1:Boolean) : void
      {
         if(super.enabled == param1)
         {
            return;
         }
         super.enabled = param1;
         if(this._8340)
         {
            super.mouseChildren = param1 ? this._8337 : false;
            super.mouseEnabled = param1 ? this._8338 : false;
         }
         else
         {
            super.mouseChildren = this._8337;
            super.mouseEnabled = this._8338;
         }
         this._2570();
      }
      
      protected function _6231() : String
      {
         return enabled ? "normal" : "disabled";
      }
      
      override protected function _2476() : void
      {
         super._2476();
         if(this._8349)
         {
            this._8349 = false;
            this._6232();
         }
      }
      
      override ns_egret function _8344() : void
      {
         if(this._8339)
         {
            invalidateSize();
            invalidateDisplayList();
         }
      }
      
      override protected function _7028() : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         super._7028();
         var _loc1_:Object = this.ns_egret::_2737;
         if(!_loc1_)
         {
            return;
         }
         if(this._8339)
         {
            _loc1_._7028();
            this.measuredWidth = _loc1_.preferredWidth;
            if(!_1141._8325(this))
            {
               this._7983 = !!_loc1_._8323 ? Math.min(_loc1_.minWidth,_loc1_.preferredWidth) : Number(_loc1_.minWidth);
            }
            this.measuredHeight = _loc1_.preferredHeight;
            if(!_1141._8325(this))
            {
               this._7980 = !!_loc1_._8321 ? Math.min(_loc1_.minHeight,_loc1_.preferredHeight) : Number(_loc1_.minHeight);
            }
         }
         else if(_loc1_ is _1122)
         {
            this.measuredWidth = _1122(_loc1_).preferredWidth;
            if(!_1141._8325(this))
            {
               this._7983 = _1122(_loc1_).minWidth;
            }
            this.measuredHeight = _1122(_loc1_).preferredHeight;
            if(!_1141._8325(this))
            {
               this._7980 = _1122(_loc1_).minHeight;
            }
         }
         else
         {
            _loc2_ = Number(_loc1_.scaleX);
            _loc3_ = Number(_loc1_.scaleY);
            _loc1_.scaleX = 1;
            _loc1_.scaleY = 1;
            this.measuredWidth = _loc1_.width;
            this.measuredHeight = _loc1_.height;
            _loc1_.scaleX = _loc2_;
            _loc1_.scaleY = _loc3_;
         }
      }
      
      override protected function _5823(param1:Number, param2:Number) : void
      {
         super._5823(param1,param2);
         var _loc3_:Object = this.ns_egret::_2737;
         if(_loc3_)
         {
            if(this._8339)
            {
               _loc3_._5823(param1,param2);
            }
            else if(_loc3_ is _1122)
            {
               if((_loc3_ as _1122).includeInLayout)
               {
                  (_loc3_ as _1122)._7599(param1,param2);
               }
            }
            else if(_loc3_ is DisplayObject)
            {
               _loc3_.width = param1;
               _loc3_.height = param2;
            }
         }
      }
      
      override public function addChild(param1:DisplayObject) : DisplayObject
      {
         throw new Error("addChild()" + errorStr + "addElement()代替");
      }
      
      override public function addChildAt(param1:DisplayObject, param2:int) : DisplayObject
      {
         throw new Error("addChildAt()" + errorStr + "addElementAt()代替");
      }
      
      override public function removeChild(param1:DisplayObject) : DisplayObject
      {
         throw new Error("removeChild()" + errorStr + "removeElement()代替");
      }
      
      override public function removeChildAt(param1:int) : DisplayObject
      {
         throw new Error("removeChildAt()" + errorStr + "removeElementAt()代替");
      }
      
      override public function setChildIndex(param1:DisplayObject, param2:int) : void
      {
         throw new Error("setChildIndex()" + errorStr + "setElementIndex()代替");
      }
      
      override public function swapChildren(param1:DisplayObject, param2:DisplayObject) : void
      {
         throw new Error("swapChildren()" + errorStr + "swapElements()代替");
      }
      
      override public function swapChildrenAt(param1:int, param2:int) : void
      {
         throw new Error("swapChildrenAt()" + errorStr + "swapElementsAt()代替");
      }
   }
}

