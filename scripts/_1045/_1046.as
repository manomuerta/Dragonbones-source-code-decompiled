package _1045
{
   import _1038._1039;
   import _1088.ItemRenderer;
   import _1088._1093;
   import _1177.CollectionEvent;
   import _1177.RendererExistenceEvent;
   import _1177._1178;
   import _1185._1188;
   import _1185._1197;
   import _1193._1192;
   import egret.core._1121;
   import egret.core._1126;
   import egret.core._1133;
   import egret.core.ns_egret;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.geom.Rectangle;
   import flash.utils.Dictionary;
   import flash.utils.Timer;
   
   use namespace ns_egret;
   
   public class _1046 extends _1093
   {
      private static const errorStr:String = "在此组件中不可用，若此组件为容器类，请使用";
      
      private var _7615:_1071;
      
      private var useVirtualLayoutChanged:Boolean = false;
      
      private var _7584:Vector.<int>;
      
      private var _7602:Dictionary;
      
      private var _7617:Dictionary;
      
      private var _7586:Boolean = false;
      
      private var _7620:Timer;
      
      private var dataProviderChanged:Boolean = false;
      
      private var _6877:_1039;
      
      private var _7619:Dictionary;
      
      private var itemRendererChanged:Boolean;
      
      private var _7616:Class;
      
      private var _7580:Boolean = false;
      
      private var _7587:Object;
      
      private var _7588:Function;
      
      private var _7589:Boolean = false;
      
      private var typicalItem:Object;
      
      private var typicalItemChanged:Boolean = false;
      
      private var _7607:Rectangle;
      
      private var _7612:Array;
      
      private var _7608:Boolean = false;
      
      private var _7590:Boolean = false;
      
      public function _1046()
      {
         this._7602 = new Dictionary(true);
         this._7617 = new Dictionary();
         this._7619 = new Dictionary();
         this._7612 = [];
         super();
      }
      
      ns_egret function get _7618() : _1071
      {
         return this._7615;
      }
      
      ns_egret function set _7618(param1:_1071) : void
      {
         this._7615 = param1;
      }
      
      override public function set layout(param1:_1192) : void
      {
         if(param1 == layout)
         {
            return;
         }
         if(layout)
         {
            layout._7607 = null;
            layout.removeEventListener("useVirtualLayoutChanged",this._7575);
         }
         if(Boolean(layout) && Boolean(param1) && layout._6056 != param1._6056)
         {
            this._7582();
         }
         super.layout = param1;
         if(param1)
         {
            param1._7607 = this._7607;
            param1.addEventListener("useVirtualLayoutChanged",this._7575);
         }
      }
      
      private function _7575(param1:Event) : void
      {
         this._7582();
      }
      
      override public function _7577(param1:int, param2:int) : void
      {
         var _loc4_:* = undefined;
         if(!layout || !layout._6056)
         {
            return;
         }
         this._7584 = new Vector.<int>();
         var _loc3_:int = param1;
         while(_loc3_ <= param2)
         {
            this._7584.push(_loc3_);
            _loc3_++;
         }
         for(_loc4_ in this._7612)
         {
            if(this._7584.indexOf(_loc4_) == -1)
            {
               this._7601(_loc4_);
            }
         }
      }
      
      override public function _7596(param1:int) : _1133
      {
         var _loc3_:Object = null;
         var _loc4_:_1070 = null;
         if(param1 < 0 || param1 >= this.dataProvider.length)
         {
            return null;
         }
         var _loc2_:_1133 = this._7612[param1];
         if(!_loc2_)
         {
            _loc3_ = this.dataProvider.getItemAt(param1);
            _loc4_ = this._7591(param1);
            this._7612[param1] = _loc4_;
            this._2481(_loc4_,param1,_loc3_);
            if(this._7586)
            {
               if(_loc4_ is _1121)
               {
                  (_loc4_ as _1121)._2449();
               }
               this._7586 = false;
               dispatchEvent(new RendererExistenceEvent(RendererExistenceEvent.RENDERER_ADD,false,false,_loc4_,param1,_loc3_));
            }
            _loc2_ = _loc4_ as _1133;
         }
         return _loc2_;
      }
      
      private function _7601(param1:int) : void
      {
         if(!this._7612[param1])
         {
            return;
         }
         var _loc2_:_1070 = this._7612[param1] as _1070;
         delete this._7612[param1];
         if(Boolean(_loc2_) && _loc2_ is DisplayObject)
         {
            this._7614(_loc2_);
         }
      }
      
      private function _7614(param1:_1070) : void
      {
         var _loc2_:Class = this._7602[param1];
         if(!this._7617[_loc2_])
         {
            this._7617[_loc2_] = new Vector.<_1070>();
         }
         this._7617[_loc2_].push(param1);
         (param1 as DisplayObject).visible = false;
      }
      
      override public function invalidateSize() : void
      {
         if(!this._7586)
         {
            super.invalidateSize();
         }
      }
      
      private function _7591(param1:int) : _1070
      {
         var _loc3_:_1070 = null;
         var _loc2_:Object = this.dataProvider.getItemAt(param1);
         var _loc4_:Class = this._7598(_loc2_);
         if(Boolean(this._7617[_loc4_]) && this._7617[_loc4_].length > 0)
         {
            _loc3_ = this._7617[_loc4_].pop();
            (_loc3_ as DisplayObject).visible = true;
            return _loc3_;
         }
         this._7586 = true;
         return this._7609(_loc4_);
      }
      
      private function _7609(param1:Class) : _1070
      {
         var _loc2_:_1070 = null;
         var _loc3_:Boolean = false;
         var _loc4_:* = undefined;
         if(this._7619[param1])
         {
            _loc3_ = false;
            for(_loc4_ in this._7619[param1])
            {
               if(_loc2_)
               {
                  _loc3_ = true;
                  break;
               }
               _loc2_ = _loc4_ as _1070;
            }
            delete this._7619[param1][_loc2_];
            if(!_loc3_)
            {
               delete this._7619[param1];
            }
         }
         if(!_loc2_)
         {
            _loc2_ = new param1() as _1070;
            this._7602[_loc2_] = param1;
         }
         if(!_loc2_ || !(_loc2_ is DisplayObject))
         {
            return null;
         }
         if(this._7587)
         {
            this._7592(_loc2_);
         }
         ns_egret::_1607(_loc2_ as DisplayObject);
         _loc2_._7599(NaN,NaN);
         return _loc2_;
      }
      
      private function _7592(param1:_1070) : void
      {
         var _loc3_:_1126 = null;
         if(!param1)
         {
            return;
         }
         var _loc2_:_1085 = param1 as _1085;
         if(_loc2_)
         {
            if(!_loc2_.ns_egret::_7585)
            {
               _loc2_.skinName = this._7587;
               _loc2_.ns_egret::_7585 = false;
            }
         }
         else
         {
            _loc3_ = param1 as _1126;
            if(Boolean(_loc3_) && !_loc3_.skinName)
            {
               _loc3_.skinName = this._7587;
            }
         }
      }
      
      private function _7600() : void
      {
         var _loc2_:* = undefined;
         if(!this._7589)
         {
            return;
         }
         this._7589 = false;
         var _loc1_:Boolean = false;
         for(_loc2_ in this._7617)
         {
            if(this._7617[_loc2_].length > 0)
            {
               _loc1_ = true;
               break;
            }
         }
         if(!_loc1_)
         {
            return;
         }
         if(!this._7620)
         {
            this._7620 = new Timer(3000,1);
            this._7620.addEventListener(TimerEvent.TIMER,this._7595);
         }
         this._7620.reset();
         this._7620.start();
      }
      
      private function _7595(param1:TimerEvent = null) : void
      {
         var _loc2_:_1070 = null;
         var _loc3_:Vector.<_1070> = null;
         for each(_loc3_ in this._7617)
         {
            for each(_loc2_ in _loc3_)
            {
               DisplayObject(_loc2_).visible = true;
               this._7622(_loc2_);
            }
         }
         this._7617 = new Dictionary();
         this._7608 = false;
      }
      
      override public function _7581() : Vector.<int>
      {
         if(Boolean(layout) && layout._6056)
         {
            return !!this._7584 ? this._7584 : new Vector.<int>(0);
         }
         return super._7581();
      }
      
      private function _7582() : void
      {
         this.useVirtualLayoutChanged = true;
         this._7608 = true;
         this._7579();
         _2466();
      }
      
      public function get dataProvider() : _1039
      {
         return this._6877;
      }
      
      public function set dataProvider(param1:_1039) : void
      {
         if(this._6877 == param1)
         {
            return;
         }
         this._7579();
         this._6877 = param1;
         this.dataProviderChanged = true;
         this._7608 = true;
         _2466();
         this.invalidateSize();
         invalidateDisplayList();
      }
      
      private function _7579() : void
      {
         if(this._6877)
         {
            this._6877.removeEventListener(CollectionEvent.COLLECTION_CHANGE,this._7606);
         }
      }
      
      private function _7606(param1:CollectionEvent) : void
      {
         var _loc2_:* = undefined;
         switch(param1.kind)
         {
            case _1178.ADD:
               this._7610(param1.items,param1.location);
               break;
            case _1178.MOVE:
               this._7611(param1.items[0],param1.location,param1.oldLocation);
               break;
            case _1178.REMOVE:
               this._7605(param1.items,param1.location);
               break;
            case _1178.UPDATE:
               this._7603(param1.items[0],param1.location);
               break;
            case _1178.REPLACE:
               this._2485(param1._5861[0],param1.location);
               this._2486(param1.items[0],param1.location);
               break;
            case _1178.RESET:
            case _1178.REFRESH:
               if(Boolean(layout) && layout._6056)
               {
                  for(_loc2_ in this._7612)
                  {
                     this._7601(_loc2_);
                  }
               }
               this._7579();
               this.dataProviderChanged = true;
               _2466();
         }
         this.invalidateSize();
         invalidateDisplayList();
      }
      
      private function _7610(param1:Array, param2:int) : void
      {
         var _loc3_:int = int(param1.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            this._2486(param1[_loc4_],param2 + _loc4_);
            _loc4_++;
         }
         this._7593();
      }
      
      private function _7611(param1:Object, param2:int, param3:int) : void
      {
         this._2485(param1,param3);
         this._2486(param1,param2);
         this._7593();
      }
      
      private function _7605(param1:Array, param2:int) : void
      {
         var _loc3_:int = int(param1.length);
         var _loc4_:int = _loc3_ - 1;
         while(_loc4_ >= 0)
         {
            this._2485(param1[_loc4_],param2 + _loc4_);
            _loc4_--;
         }
         this._7593();
      }
      
      private function _2486(param1:Object, param2:int) : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         if(layout)
         {
            layout.elementAdded(param2);
         }
         if(Boolean(layout) && layout._6056)
         {
            if(this._7584)
            {
               _loc5_ = int(this._7584.length);
               _loc6_ = 0;
               while(_loc6_ < _loc5_)
               {
                  _loc7_ = this._7584[_loc6_];
                  if(_loc7_ >= param2)
                  {
                     this._7584[_loc6_] = _loc7_ + 1;
                  }
                  _loc6_++;
               }
               this._7612.splice(param2,0,null);
            }
            return;
         }
         var _loc3_:Class = this._7598(param1);
         var _loc4_:_1070 = this._7609(_loc3_);
         this._7612.splice(param2,0,_loc4_);
         if(!_loc4_)
         {
            return;
         }
         this._2481(_loc4_,param2,param1);
         dispatchEvent(new RendererExistenceEvent(RendererExistenceEvent.RENDERER_ADD,false,false,_loc4_,param2,param1));
      }
      
      private function _2485(param1:Object, param2:int) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         if(layout)
         {
            layout.elementRemoved(param2);
         }
         if(Boolean(this._7584) && this._7584.length > 0)
         {
            _loc4_ = -1;
            _loc5_ = int(this._7584.length);
            _loc6_ = 0;
            while(_loc6_ < _loc5_)
            {
               _loc7_ = this._7584[_loc6_];
               if(_loc7_ == param2)
               {
                  _loc4_ = _loc6_;
               }
               else if(_loc7_ > param2)
               {
                  this._7584[_loc6_] = _loc7_ - 1;
               }
               _loc6_++;
            }
            if(_loc4_ != -1)
            {
               this._7584.splice(_loc4_,1);
            }
         }
         var _loc3_:_1070 = this._7612[param2];
         if(this._7612.length > param2)
         {
            this._7612.splice(param2,1);
         }
         dispatchEvent(new RendererExistenceEvent(RendererExistenceEvent.RENDERER_REMOVE,false,false,_loc3_,param2,param1));
         if(Boolean(_loc3_) && _loc3_ is DisplayObject)
         {
            this._7622(_loc3_);
         }
      }
      
      private function _7622(param1:_1070) : void
      {
         ns_egret::removeFromDisplayList(param1 as DisplayObject);
         if(param1 is _1133)
         {
            (param1 as _1133)._6967(null);
         }
         var _loc2_:Class = this._7602[param1];
         if(!this._7619[_loc2_])
         {
            this._7619[_loc2_] = new Dictionary(true);
         }
         this._7619[_loc2_][param1] = null;
      }
      
      private function _7593() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         if(this._7612.length == 0)
         {
            return;
         }
         if(Boolean(layout) && layout._6056)
         {
            for each(_loc1_ in this._7584)
            {
               this._7583(_loc1_);
            }
         }
         else
         {
            _loc2_ = int(this._7612.length);
            _loc1_ = 0;
            while(_loc1_ < _loc2_)
            {
               this._7583(_loc1_);
               _loc1_++;
            }
         }
      }
      
      private function _7603(param1:Object, param2:int) : void
      {
         if(this._7590)
         {
            return;
         }
         var _loc3_:_1070 = this._7612[param2];
         if(_loc3_)
         {
            this._2481(_loc3_,param2,param1);
         }
      }
      
      private function _7583(param1:int) : void
      {
         var _loc2_:_1070 = this._7612[param1] as _1070;
         if(_loc2_)
         {
            _loc2_.itemIndex = param1;
         }
      }
      
      public function get itemRenderer() : Class
      {
         return this._7616;
      }
      
      public function set itemRenderer(param1:Class) : void
      {
         if(this._7616 === param1)
         {
            return;
         }
         this._7616 = param1;
         this.itemRendererChanged = true;
         this.typicalItemChanged = true;
         this._7608 = true;
         this._7579();
         _2466();
      }
      
      public function get _2514() : Object
      {
         return this._7587;
      }
      
      public function set _2514(param1:Object) : void
      {
         if(this._7587 == param1)
         {
            return;
         }
         this._7587 = param1;
         if(Boolean(this._7587) && initialized)
         {
            this._7580 = true;
            _2466();
         }
      }
      
      public function get _6053() : Function
      {
         return this._7588;
      }
      
      public function set _6053(param1:Function) : void
      {
         if(this._7588 == param1)
         {
            return;
         }
         this._7588 = param1;
         this.itemRendererChanged = true;
         this.typicalItemChanged = true;
         this._7579();
         _2466();
      }
      
      private function _7598(param1:Object) : Class
      {
         var _loc2_:Class = null;
         if(this._7588 != null)
         {
            _loc2_ = this._7588(param1);
            if(!_loc2_)
            {
               _loc2_ = this._7616;
            }
         }
         else
         {
            _loc2_ = this._7616;
         }
         return !!_loc2_ ? _loc2_ : ItemRenderer;
      }
      
      override protected function _2438() : void
      {
         var _loc1_:_1197 = null;
         if(!layout)
         {
            _loc1_ = new _1197();
            _loc1_.gap = 0;
            _loc1_._2401 = _1188.CONTENT_JUSTIFY;
            this.layout = _loc1_;
         }
         super._2438();
      }
      
      override protected function _2476() : void
      {
         var _loc1_:int = 0;
         var _loc2_:_1126 = null;
         var _loc3_:_1085 = null;
         var _loc4_:int = 0;
         var _loc5_:* = undefined;
         var _loc6_:Vector.<_1070> = null;
         if(this.itemRendererChanged || this.dataProviderChanged || this.useVirtualLayoutChanged)
         {
            this._7604();
            if(layout)
            {
               layout._7479();
            }
            this._7594(null);
            this.useVirtualLayoutChanged = false;
            this.itemRendererChanged = false;
            if(this._6877)
            {
               this._6877.addEventListener(CollectionEvent.COLLECTION_CHANGE,this._7606);
            }
            if(Boolean(layout) && layout._6056)
            {
               this.invalidateSize();
               invalidateDisplayList();
            }
            else
            {
               this._7613();
            }
            if(this.dataProviderChanged)
            {
               this.dataProviderChanged = false;
               verticalScrollPosition = horizontalScrollPosition = 0;
            }
         }
         super._2476();
         if(this.typicalItemChanged)
         {
            this.typicalItemChanged = false;
            if(Boolean(this._6877) && this._6877.length > 0)
            {
               this.typicalItem = this._6877.getItemAt(0);
               this._7597();
            }
         }
         if(this._7580)
         {
            this._7580 = false;
            _loc1_ = int(this._7612.length);
            _loc4_ = 0;
            while(_loc4_ < _loc1_)
            {
               this._7592(this._7612[_loc4_]);
               _loc4_++;
            }
            for(_loc5_ in this._7617)
            {
               _loc6_ = this._7617[_loc5_];
               if(_loc6_)
               {
                  _loc1_ = int(_loc6_.length);
                  _loc4_ = 0;
                  while(_loc4_ < _loc1_)
                  {
                     this._7592(_loc6_[_loc4_]);
                     _loc4_++;
                  }
               }
            }
         }
      }
      
      override protected function _7028() : void
      {
         if(Boolean(layout) && layout._6056)
         {
            this._7578();
         }
         super._7028();
      }
      
      override protected function _5823(param1:Number, param2:Number) : void
      {
         if(ns_egret::_7576 && layout && layout._6056)
         {
            this._7589 = true;
            this._7578();
         }
         super._5823(param1,param2);
         if(this._7589)
         {
            this._7600();
         }
      }
      
      private function _7578() : void
      {
         if(layout._7607)
         {
            return;
         }
         if(Boolean(this._6877) && this._6877.length > 0)
         {
            this.typicalItem = this._6877.getItemAt(0);
            this._7597();
         }
      }
      
      private function _7597() : void
      {
         if(!this.typicalItem)
         {
            this._7594(null);
            return;
         }
         var _loc1_:Class = this._7598(this.typicalItem);
         var _loc2_:_1070 = this._7609(_loc1_);
         if(!_loc2_)
         {
            this._7594(null);
            return;
         }
         this._7586 = true;
         this._2481(_loc2_,0,this.typicalItem);
         if(_loc2_ is _1121)
         {
            (_loc2_ as _1121)._2449();
         }
         var _loc3_:Rectangle = new Rectangle(0,0,_loc2_.preferredWidth,_loc2_.preferredHeight);
         this._7622(_loc2_);
         this._7594(_loc3_);
         this._7586 = false;
      }
      
      private function _7594(param1:Rectangle) : void
      {
         this._7607 = param1;
         if(layout)
         {
            layout._7607 = param1;
         }
      }
      
      private function _7604() : void
      {
         var _loc2_:_1070 = null;
         var _loc1_:int = int(this._7612.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc1_)
         {
            _loc2_ = this._7612[_loc3_];
            if(_loc2_)
            {
               this._7622(_loc2_);
               dispatchEvent(new RendererExistenceEvent(RendererExistenceEvent.RENDERER_REMOVE,false,false,_loc2_,_loc2_.itemIndex,_loc2_.data));
            }
            _loc3_++;
         }
         this._7612 = [];
         this._7584 = null;
         if(!this._7608)
         {
            return;
         }
         this._7595();
      }
      
      private function _7613() : void
      {
         var _loc4_:Object = null;
         var _loc5_:Class = null;
         var _loc6_:_1070 = null;
         if(!this._6877)
         {
            return;
         }
         var _loc1_:int = 0;
         var _loc2_:int = this._6877.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = this._6877.getItemAt(_loc3_);
            _loc5_ = this._7598(_loc4_);
            _loc6_ = this._7609(_loc5_);
            if(_loc6_)
            {
               this._7612[_loc1_] = _loc6_;
               this._2481(_loc6_,_loc1_,_loc4_);
               dispatchEvent(new RendererExistenceEvent(RendererExistenceEvent.RENDERER_ADD,false,false,_loc6_,_loc1_,_loc4_));
               _loc1_++;
            }
            _loc3_++;
         }
      }
      
      protected function _2481(param1:_1070, param2:int, param3:Object) : _1070
      {
         this._7590 = true;
         if(this._7615)
         {
            param1 = this._7615._2481(param1,param2,param3);
         }
         else
         {
            if(param1 is _1133)
            {
               (param1 as _1133)._6967(this);
            }
            param1.itemIndex = param2;
            param1.label = this._7442(param3);
            param1.data = param3;
         }
         this._7590 = false;
         return param1;
      }
      
      protected function _7442(param1:Object) : String
      {
         if(param1)
         {
            return param1.toString();
         }
         return " ";
      }
      
      override public function getElementAt(param1:int) : _1133
      {
         return this._7612[param1];
      }
      
      override public function getElementIndex(param1:_1133) : int
      {
         if(!param1)
         {
            return -1;
         }
         return this._7612.indexOf(param1);
      }
      
      override public function get _2249() : int
      {
         if(!this._6877)
         {
            return 0;
         }
         return this._6877.length;
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

