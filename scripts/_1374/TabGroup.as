package _1374
{
   import _1038._1037;
   import _1045.Button;
   import _1045.Group;
   import _1045.TabBar;
   import _1045._1046;
   import _1045._1082;
   import _1045._1085;
   import _1045._1107;
   import _1177.CollectionEvent;
   import _1177.IndexChangeEvent;
   import _1177.ResizeEvent;
   import _1177.UIEvent;
   import _1177._1178;
   import _1185._1191;
   import _1376._1379;
   import _1376._1380;
   import _1404._1407;
   import _1421._1427;
   import _1439._1480;
   import egret.core._1121;
   import egret.core._1130;
   import egret.core._1133;
   import egret.core.ns_egret;
   import egret.utils._99;
   import egret.utils.tr;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.InteractiveObject;
   import flash.display.NativeMenu;
   import flash.display.NativeMenuItem;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.utils.Dictionary;
   
   use namespace ns_egret;
   
   public class TabGroup extends _1085 implements _1379
   {
      ns_egret static var _9793:TabGroup;
      
      ns_egret static const NO_PROPOSED_SELECTION:int = -2;
      
      private var _9586:Boolean;
      
      public var _2567:InteractiveObject;
      
      public var _2515:TabBar;
      
      public var _2565:_1107;
      
      public var _2516:Button;
      
      public var _2527:Group;
      
      private var _9578:int = -1;
      
      private var _9580:_1379;
      
      private var _9569:Boolean = true;
      
      private var _9574:Number = 265;
      
      private var _9571:Number = 250;
      
      private var _minimized:Boolean = false;
      
      private var _9600:Boolean = true;
      
      private var _9579:_1380;
      
      private var _9797:Dictionary;
      
      ns_egret var _2480:int = -1;
      
      private var _8621:int = -2;
      
      private var _7612:Array;
      
      private var _9800:Class;
      
      private var _9791:Function;
      
      private var _8436:String = "label";
      
      private var dataProviderChanged:Boolean;
      
      private var _6877:_1037;
      
      private var _9803:Boolean;
      
      private var _9585:NativeMenu;
      
      private var _9802:TabPanel;
      
      public function TabGroup()
      {
         this._9797 = new Dictionary(true);
         this._7612 = [];
         super();
         this.skinName = _1480;
         this.dataProvider = new _1037();
         this.selectedIndex = 0;
         this.addEventListener(ResizeEvent.UI_RESIZE,this.onResize);
         this.addEventListener(_1427.CLOSE,this._2384);
         this.addEventListener(FocusEvent.FOCUS_IN,this.onFocusIn);
         this.addEventListener(FocusEvent.FOCUS_OUT,this.onFocusOut);
      }
      
      protected function _2384(param1:_1427) : void
      {
         this._9586 = false;
         _6232();
      }
      
      protected function onFocusOut(param1:FocusEvent = null) : void
      {
         if(!stage || !stage.focus)
         {
            return;
         }
         this._9586 = false;
         ns_egret::_9793 = null;
         _6232();
      }
      
      protected function onFocusIn(param1:FocusEvent) : void
      {
         if(!this._4827)
         {
            return;
         }
         if(ns_egret::_9793)
         {
            ns_egret::_9793.onFocusOut();
         }
         ns_egret::_9793 = this;
         if(!DisplayObjectContainer(this._4827).contains(this.stage.focus))
         {
            this._2581();
         }
         this._9586 = true;
         _6232();
      }
      
      override protected function _6231() : String
      {
         if(this._9586)
         {
            return "focus";
         }
         return super._6231();
      }
      
      public function get _2250() : int
      {
         return this._9578;
      }
      
      public function set _2250(param1:int) : void
      {
         this._9578 = param1;
      }
      
      public function get _9581() : _1379
      {
         return this._9580;
      }
      
      public function set _9581(param1:_1379) : void
      {
         this._9580 = param1;
      }
      
      public function get _9570() : Boolean
      {
         return this._9569;
      }
      
      public function set _9570(param1:Boolean) : void
      {
         this._9569 = param1;
      }
      
      public function _9575(param1:Number, param2:Number) : void
      {
         super._7599(param1,param2);
      }
      
      public function get _7656() : Number
      {
         return this._9574;
      }
      
      public function set _7656(param1:Number) : void
      {
         this._9574 = param1;
      }
      
      public function get _7652() : Number
      {
         return this._9571;
      }
      
      public function set _7652(param1:Number) : void
      {
         this._9571 = param1;
      }
      
      public function get minimized() : Boolean
      {
         return this._minimized;
      }
      
      public function set minimized(param1:Boolean) : void
      {
         if(this._minimized == param1)
         {
            return;
         }
         this._minimized = param1;
         var _loc2_:Boolean = super.visible;
         if(param1)
         {
            super.visible = false;
         }
         else
         {
            super.visible = this._9600;
         }
         if(visible != _loc2_)
         {
            dispatchEvent(new Event("visibleChanged"));
         }
         dispatchEvent(new Event("minimizedChanged",true));
      }
      
      override public function set visible(param1:Boolean) : void
      {
         this._9600 = param1;
         if(super.visible == param1)
         {
            return;
         }
         super.visible = param1;
         dispatchEvent(new Event("visibleChanged"));
      }
      
      override public function get explicitHeight() : Number
      {
         var _loc1_:_1396 = null;
         if(isNaN(super.explicitHeight))
         {
            _loc1_ = this._4827;
            return !!_loc1_ ? Number(_loc1_.explicitHeight) : NaN;
         }
         return super.explicitHeight;
      }
      
      override public function get explicitWidth() : Number
      {
         var _loc1_:_1396 = null;
         if(isNaN(super.explicitWidth))
         {
            _loc1_ = this._4827;
            return !!_loc1_ ? Number(_loc1_.explicitWidth) : NaN;
         }
         return super.explicitWidth;
      }
      
      final ns_egret function get _9606() : Number
      {
         return super.explicitWidth;
      }
      
      final ns_egret function get _9602() : Number
      {
         return super.explicitHeight;
      }
      
      public function get _4835() : _1380
      {
         return this._9579;
      }
      
      public function _9568(param1:_1380, param2:Boolean = true) : void
      {
         if(param2 && Boolean(this._9579))
         {
            if(this._9570)
            {
               _1380(this._9579)._2247 = null;
            }
            else
            {
               _1380(this._9579)._2241 = null;
            }
         }
         this._9579 = param1;
      }
      
      private function onResize(param1:ResizeEvent) : void
      {
         var _loc2_:_1046 = null;
         var _loc3_:int = 0;
         var _loc4_:_1133 = null;
         if(Boolean(this._2515) && Boolean(this._2515._2490))
         {
            _loc2_ = this._2515._2490;
            _loc2_.maxWidth = Math.max(0,width - 22);
            _loc3_ = _loc2_._2249 - 1;
            while(_loc3_ >= 0)
            {
               _loc4_ = _loc2_.getElementAt(_loc3_);
               if(_loc4_)
               {
                  _1121(_loc4_["labelDisplay"]).invalidateSize();
               }
               _loc3_--;
            }
         }
      }
      
      public function addElement(param1:_1396) : void
      {
         this.addElementAt(param1);
         var _loc2_:_1427 = new _1427(_1427.PANEL_OPENED,true,true);
         _loc2_._4830 = param1;
         dispatchEvent(_loc2_);
      }
      
      public function addElementAt(param1:_1396, param2:int = -1, param3:Object = null) : void
      {
         if(Boolean(param1.owner) && param1.owner is TabGroup)
         {
            if(param1.owner == this && param1.itemIndex == param2)
            {
               return;
            }
            TabGroup(param1.owner).removeElement(param1);
         }
         if(!param3)
         {
            if(param1.data)
            {
               param3 = param1.data;
            }
            else
            {
               param3 = {};
               if(this._5987)
               {
                  param3[this._5987] = param1.title;
               }
            }
         }
         param1._6967(this);
         if(!this.dataProvider)
         {
            this.dataProvider = new _1037();
         }
         if(param2 == -1)
         {
            param2 = this.dataProvider.length;
         }
         this._9797[param1] = param3;
         this.dataProvider.addItemAt(param3,param2);
         var _loc4_:_1427;
         (_loc4_ = new _1427(_1427.PANEL_OPENED,true,true))._4830 = param1;
         dispatchEvent(_loc4_);
      }
      
      public function removeElementAt(param1:int) : _1396
      {
         var _loc2_:_1396 = this.getElementAt(param1);
         this.removeElement(_loc2_);
         return _loc2_;
      }
      
      public function removeElement(param1:_1396) : void
      {
         if(!param1 || !this.dataProvider)
         {
            return;
         }
         var _loc2_:int = this.dataProvider.getItemIndex(param1.data);
         if(_loc2_ >= 0)
         {
            this._9796(param1);
            this.dataProvider.removeItemAt(_loc2_);
         }
      }
      
      public function get selectedIndex() : int
      {
         return this._8621 != ns_egret::NO_PROPOSED_SELECTION ? this._8621 : this.ns_egret::_2480;
      }
      
      public function set selectedIndex(param1:int) : void
      {
         this.ns_egret::_2475(param1);
      }
      
      public function get _4827() : _1396
      {
         var _loc1_:int = this.selectedIndex;
         if(_loc1_ >= 0 && _loc1_ < this._2249)
         {
            return this._7612[_loc1_];
         }
         return null;
      }
      
      public function set _4827(param1:_1396) : void
      {
         var _loc2_:int = int(this._7612.indexOf(param1));
         if(_loc2_ >= 0 && _loc2_ < this._2249)
         {
            this.ns_egret::_2475(_loc2_);
         }
      }
      
      public function getElementAt(param1:int) : _1396
      {
         var _loc2_:Object = null;
         var _loc3_:_1396 = null;
         if(!this._7612[param1])
         {
            _loc2_ = this.dataProvider.getItemAt(param1);
            _loc3_ = this._7609(_loc2_);
            this._7612[param1] = _loc3_;
            this._2481(_loc3_,param1,_loc2_);
         }
         return this._7612[param1];
      }
      
      public function get _9801() : Class
      {
         return this._9800;
      }
      
      public function set _9801(param1:Class) : void
      {
         this._9800 = param1;
      }
      
      public function get _9710() : Function
      {
         return this._9791;
      }
      
      public function set _9710(param1:Function) : void
      {
         this._9791 = param1;
      }
      
      public function get _5987() : String
      {
         return this._8436;
      }
      
      public function set _5987(param1:String) : void
      {
         this._8436 = param1;
         if(this._2515)
         {
            this._2515._5987 = this._5987;
         }
      }
      
      public function get _2249() : int
      {
         if(!this._6877)
         {
            return 0;
         }
         return this._6877.length;
      }
      
      ns_egret function _2475(param1:int) : void
      {
         if(param1 == this.selectedIndex)
         {
            return;
         }
         this._8621 = param1;
         if(this._2515)
         {
            this._2515.ns_egret::_2475(param1,false);
         }
      }
      
      override protected function _2476() : void
      {
         var _loc1_:int = 0;
         super._2476();
         if(this.dataProviderChanged)
         {
            _loc1_ = this.selectedIndex;
            this._7604();
            this.dataProviderChanged = false;
            if(this._6877)
            {
               this._6877.addEventListener(CollectionEvent.COLLECTION_CHANGE,this._7606);
            }
            this._2515.dataProvider = this._6877;
            this.selectedIndex = _loc1_;
         }
      }
      
      protected function _2477(param1:int, param2:Boolean = true) : void
      {
         var _loc3_:Object = null;
         var _loc4_:_1396 = null;
         if(param1 >= 0 && param1 < this._2249 && this._8621 != param1 && this._8621 != ns_egret::NO_PROPOSED_SELECTION)
         {
            this._2515.ns_egret::_2475(this._8621);
            this._2515._6040();
            return;
         }
         this._8621 = ns_egret::NO_PROPOSED_SELECTION;
         if(this._4827)
         {
            this._4827.show = false;
         }
         if(param1 >= 0 && param1 < this._2249)
         {
            this.ns_egret::_2480 = param1;
            if(!this._7612[param1])
            {
               _loc3_ = this.dataProvider.getItemAt(param1);
               _loc4_ = this._7609(_loc3_);
               this._7612[param1] = _loc4_;
               this._2481(_loc4_,param1,_loc3_);
            }
            this._4827.show = true;
            this._2565._7103 = this._4827;
         }
         else
         {
            this.ns_egret::_2480 = -1;
            this._2565.ns_egret::_2475(-1,false);
         }
         if(param2)
         {
            dispatchEvent(new UIEvent(UIEvent.VALUE_COMMIT));
         }
         invalidateSize();
         invalidateDisplayList();
      }
      
      private function _7598(param1:Object) : Class
      {
         var _loc2_:Class = null;
         if(this._9791 != null)
         {
            _loc2_ = this._9791(param1);
            if(!_loc2_)
            {
               _loc2_ = this._9800;
            }
         }
         else
         {
            _loc2_ = this._9800;
         }
         return !!_loc2_ ? _loc2_ : TabPanel;
      }
      
      private function _7609(param1:Object) : _1396
      {
         var _loc2_:* = undefined;
         var _loc3_:Class = null;
         var _loc4_:_1396 = null;
         var _loc5_:_1427 = null;
         for(_loc2_ in this._9797)
         {
            if(this._9797[_loc2_] == param1)
            {
               this._2565.addElement(_loc2_);
               return _loc2_;
            }
         }
         _loc3_ = this._7598(param1);
         _loc4_ = this._9795(_loc3_);
         if(_loc4_)
         {
            this._9797[_loc4_] = param1;
            (_loc5_ = new _1427(_1427.PANEL_CREATED))._4830 = _loc4_;
            _loc5_._4928 = param1;
            this.dispatchEvent(_loc5_);
            this._2565.addElement(_loc4_);
         }
         return _loc4_;
      }
      
      private function _9795(param1:Class) : _1396
      {
         var _loc2_:_1396 = null;
         if(_1407.hasMapRule(param1))
         {
            _loc2_ = _1407.getInstance(param1);
         }
         else
         {
            _loc2_ = new param1() as _1396;
         }
         if(!_loc2_ || !(_loc2_ is DisplayObject))
         {
            return null;
         }
         return _loc2_;
      }
      
      protected function _2481(param1:_1396, param2:int, param3:Object) : _1396
      {
         param1._6967(this);
         param1.itemIndex = param2;
         param1.data = param3;
         param1.show = this.selectedIndex == param2;
         return param1;
      }
      
      override public function _2581() : void
      {
         if(Boolean(this._4827) && this._4827 is _1130)
         {
            _1130(this._4827)._2581();
         }
         else
         {
            super._2581();
         }
      }
      
      public function get dataProvider() : _1037
      {
         return this._6877;
      }
      
      public function set dataProvider(param1:_1037) : void
      {
         if(param1 == this._6877)
         {
            return;
         }
         this._7579();
         this._6877 = param1;
         this.dataProviderChanged = true;
         _2466();
         invalidateSize();
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
               this._7579();
               this.dataProviderChanged = true;
               _2466();
         }
         invalidateSize();
         invalidateDisplayList();
      }
      
      private function _7603(param1:Object, param2:int) : void
      {
         var _loc3_:_1396 = this._7612[param2];
         if(_loc3_)
         {
            this._2481(_loc3_,param2,param1);
         }
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
      
      protected function _2486(param1:Object, param2:int) : void
      {
         var _loc3_:_1396 = this._7609(param1);
         if(param2 > this._7612.length)
         {
            this._7612.length = param2;
         }
         this._7612.splice(param2,0,_loc3_);
         if(!_loc3_)
         {
            return;
         }
         this._2481(_loc3_,param2,param1);
      }
      
      protected function _2485(param1:Object, param2:int) : void
      {
         var _loc3_:_1396 = this._7612[param2];
         if(this._7612.length > param2)
         {
            this._7612.splice(param2,1);
         }
         if(Boolean(_loc3_) && _loc3_ is DisplayObject)
         {
            this._7622(_loc3_);
         }
      }
      
      private function _7622(param1:_1396) : void
      {
         if(param1.parent)
         {
            this._2565.removeElement(param1);
         }
         param1._6967(null);
         param1.show = false;
         if(this._9797[param1])
         {
            delete this._9797[param1];
         }
      }
      
      private function _7593() : void
      {
         if(this._7612.length == 0)
         {
            return;
         }
         var _loc1_:int = int(this._7612.length);
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            this._7583(_loc2_);
            _loc2_++;
         }
      }
      
      private function _7583(param1:int) : void
      {
         var _loc2_:_1396 = this._7612[param1] as _1396;
         if(_loc2_)
         {
            _loc2_.itemIndex = param1;
         }
      }
      
      private function _7604() : void
      {
         var _loc2_:_1396 = null;
         var _loc1_:int = int(this._7612.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc1_)
         {
            _loc2_ = this._7612[_loc3_];
            if(_loc2_)
            {
               this._7622(_loc2_);
            }
            _loc3_++;
         }
         this._7612 = [];
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         super.partAdded(param1,param2);
         if(param2 == this._2515)
         {
            this._2515._5987 = this._5987;
            this._2515._2576 = false;
            this._2515.dataProvider = this._6877;
            this._2515.selectedIndex = this.selectedIndex;
            this._2515.addEventListener(UIEvent.VALUE_COMMIT,this._9794);
            this._2515.addEventListener(IndexChangeEvent.CHANGE,this._9792);
            this._2515.addEventListener(IndexChangeEvent.CHANGING,this._8555);
            this._2515.doubleClickEnabled = true;
            this._2515.addEventListener(MouseEvent.DOUBLE_CLICK,this._9798);
         }
         else if(param2 == this._2565)
         {
            this._2565.layout = new _1191();
         }
         else if(param2 == this._2567)
         {
            this._2567.doubleClickEnabled = true;
            this._2567.addEventListener(MouseEvent.DOUBLE_CLICK,this._9798);
         }
         else if(param2 == this._2516)
         {
            this._2516.addEventListener(MouseEvent.MOUSE_DOWN,this._2560);
         }
      }
      
      private function _9798(param1:MouseEvent) : void
      {
         dispatchEvent(new _1427(_1427.MAXIMIZED,true));
      }
      
      protected function _9794(param1:Event) : void
      {
         if(this._9803)
         {
            this._9803 = false;
            return;
         }
         this._2477(this._2515.selectedIndex);
      }
      
      protected function _9792(param1:IndexChangeEvent) : void
      {
         this._9803 = true;
         this._2477(param1.newIndex);
         dispatchEvent(param1);
      }
      
      protected function _8555(param1:IndexChangeEvent) : void
      {
         if(!dispatchEvent(param1))
         {
            param1.preventDefault();
         }
      }
      
      protected function _2560(param1:MouseEvent) : void
      {
         if(!this._9585)
         {
            this._9585 = this._6375([tr("TabGroup.Close"),tr("TabGroup.Minimum"),tr("TabGroup.CloseTab")]);
         }
         this._9585.getItemAt(0).enabled = Boolean(this._2249 > 0);
         var _loc2_:Point = this._2516.localToGlobal(new Point(this._2516.width,this._2516.height * 0.5));
         this._9585.display(stage,_loc2_.x,_loc2_.y);
      }
      
      private function _6375(param1:Array) : NativeMenu
      {
         var _loc3_:NativeMenuItem = null;
         var _loc5_:String = null;
         var _loc2_:NativeMenu = new NativeMenu();
         var _loc4_:int = 0;
         for each(_loc5_ in param1)
         {
            _loc3_ = new NativeMenuItem(_loc5_,!_loc5_);
            if(_loc5_)
            {
               _loc3_.addEventListener(Event.SELECT,this._3935);
            }
            _loc2_.addItem(_loc3_);
            _loc4_++;
         }
         return _loc2_;
      }
      
      private function _3935(param1:Event) : void
      {
         switch(param1.target.label)
         {
            case tr("TabGroup.Close"):
               this._2561(this.selectedIndex);
               break;
            case tr("TabGroup.Minimum"):
               dispatchEvent(new _1427(_1427.MINIMIZED,true));
               break;
            case tr("TabGroup.CloseTab"):
               dispatchEvent(new _1427(_1427.CLOSE,true));
         }
      }
      
      protected function _2561(param1:int, param2:Boolean = false) : void
      {
         var _loc3_:_1427 = null;
         var _loc4_:Boolean = false;
         var _loc5_:_1427 = null;
         if(param1 > -1)
         {
            _loc4_ = true;
            if(!param2)
            {
               (_loc5_ = new _1427(_1427.CLOSING_PANEL,true,true))._4928 = this.dataProvider.getItemAt(param1);
               _loc5_._4830 = this._7612[param1];
               _loc4_ = dispatchEvent(_loc5_);
            }
            if(_loc4_)
            {
               this._9796(this._4827);
               _loc3_ = new _1427(_1427.CLOSE_PANEL,true);
               _loc3_._4928 = this.dataProvider.getItemAt(param1);
               _loc3_._4830 = this._7612[param1];
               this.dataProvider.removeItemAt(param1);
               dispatchEvent(_loc3_);
               if(this._2249 == 0)
               {
                  dispatchEvent(new _1427(_1427.CLOSE,true));
               }
            }
         }
      }
      
      override protected function _5823(param1:Number, param2:Number) : void
      {
         super._5823(param1,param2);
         _99(this._9799);
      }
      
      protected function _9799() : void
      {
         var _loc1_:TabPanel = null;
         var _loc2_:Group = null;
         var _loc3_:_1082 = null;
         if(!this._2527)
         {
            return;
         }
         if(Boolean(this._9802) && this._9802 != this._4827)
         {
            _loc1_ = new TabPanel();
            this._9789(this._9802);
            if(Boolean(_loc1_.owner) && _loc1_.owner != this)
            {
               _loc1_.owner._6929();
            }
         }
         if(this._4827)
         {
            _loc2_ = (this._4827 as TabPanel)._2527;
            _loc3_ = (this._4827 as TabPanel)._2569;
            if(Boolean(_loc2_) && _loc2_.width > 0)
            {
               if(_loc3_)
               {
                  _loc3_.visible = _loc3_.includeInLayout = true;
               }
               if(this._2515.width + _loc2_.width + this._2516.width + 10 < width)
               {
                  this._9790(this._4827 as TabPanel);
               }
            }
            else if(this._2527.width > 0)
            {
               if(_loc3_)
               {
                  _loc3_.visible = _loc3_.includeInLayout = false;
               }
               if(this._2515.width + this._2527.width + this._2516.width + 10 > width)
               {
                  this._9789(this._4827 as TabPanel);
               }
            }
         }
      }
      
      private function _9790(param1:TabPanel) : void
      {
         if(param1 && this._2527 && Boolean(param1._2527))
         {
            while(param1._2527._2249 > 0)
            {
               this._2527.addElement(param1._2527.getElementAt(0));
            }
            if(param1._2569)
            {
               param1._2569.visible = param1._2569.includeInLayout = false;
            }
         }
         this._9802 = param1;
         _2449();
      }
      
      private function _9789(param1:TabPanel) : void
      {
         if(param1 && this._2527 && Boolean(param1._2527))
         {
            while(this._2527._2249 > 0)
            {
               param1._2527.addElement(this._2527.getElementAt(0));
            }
            if(param1._2569)
            {
               param1._2569.visible = param1._2569.includeInLayout = true;
            }
         }
         this._9802 = null;
         _2449();
      }
      
      private function _9796(param1:_1396) : void
      {
         var _loc2_:_1082 = null;
         if(this._9802 == param1 && param1 != null)
         {
            _loc2_ = (param1 as TabPanel)._2569;
            if(_loc2_)
            {
               _loc2_.visible = _loc2_.includeInLayout = false;
            }
            this._9789(param1 as TabPanel);
         }
      }
   }
}

