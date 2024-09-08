package _1045
{
   import _1038._1039;
   import _1038._1040;
   import _1049._1048;
   import _1049._1050;
   import _1049._1051;
   import _1049._1053;
   import _1049._1059;
   import _1049._1062;
   import _1049._1063;
   import _1049._1064;
   import _1049._1065;
   import _1177.GridCaretEvent;
   import _1177.GridEvent;
   import _1177.GridSelectionEvent;
   import _1177.GridSortEvent;
   import _1177.UIEvent;
   import _1177._1179;
   import egret.core._1137;
   import egret.core._1140;
   import egret.core.ns_egret;
   import flash.display.DisplayObject;
   import flash.display.Graphics;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.KeyboardEvent;
   import flash.geom.Rectangle;
   import flash.ui.Keyboard;
   
   use namespace ns_egret;
   
   public class DataGrid extends _1085
   {
      private static var _7510:Object = {
         "columns":uint(1 << 0),
         "dataProvider":uint(1 << 1),
         "itemRenderer":uint(1 << 2),
         "requestedRowCount":uint(1 << 3),
         "requestedColumnCount":uint(1 << 4),
         "requestedMaxRowCount":uint(1 << 5),
         "requestedMinRowCount":uint(1 << 6),
         "requestedMinColumnCount":uint(1 << 7),
         "rowHeight":uint(1 << 8),
         "showDataTips":uint(1 << 9),
         "typicalItem":uint(1 << 10),
         "variableRowHeight":uint(1 << 11),
         "dataTipField":uint(1 << 12),
         "dataTipFunction":uint(1 << 13),
         "resizableColumns":uint(1 << 14)
      };
      
      private static var _7489:Object = {
         "columns":null,
         "dataProvider":null,
         "itemRenderer":null,
         "resizableColumns":true,
         "requestedRowCount":int(-1),
         "requestedMaxRowCount":int(10),
         "requestedMinRowCount":int(-1),
         "requestedColumnCount":int(-1),
         "requestedMinColumnCount":int(-1),
         "rowHeight":NaN,
         "showDataTips":false,
         "typicalItem":null,
         "variableRowHeight":false,
         "dataTipField":null,
         "dataTipFunction":null
      };
      
      private var _7488:Boolean = true;
      
      public var _7452:Class;
      
      public var caretIndicator:Class;
      
      public var _7506:_1068;
      
      public var _7279:Class;
      
      public var editorIndicator:Class;
      
      public var grid:Grid;
      
      public var hoverIndicator:Class;
      
      public var _7542:Class;
      
      public var _7554:Class;
      
      public var _2491:Scroller;
      
      public var selectionIndicator:Class;
      
      private var _7458:Boolean = false;
      
      private var _7486:Array;
      
      private var _7480:Vector.<Function>;
      
      private var _7535:Object;
      
      public var _7543:Boolean = true;
      
      ns_egret var _7519:Number = 620;
      
      ns_egret var _7574:uint = 113;
      
      ns_egret var _7508:Boolean = false;
      
      ns_egret var editor:_1051;
      
      private var _7570:Boolean = false;
      
      private var _7536:_1062 = null;
      
      private var _7564:Class = null;
      
      private var _7515:Boolean = true;
      
      ns_egret var _7566:_1140;
      
      private var _7531:Number = 1;
      
      private var _7516:Number = 1;
      
      private var _7549:KeyboardEvent = null;
      
      private var _7552:_1053 = null;
      
      private var _7541:Number = NaN;
      
      private var _7507:Number = NaN;
      
      private var _7568:_1053 = null;
      
      private var _7528:Number = NaN;
      
      public function DataGrid()
      {
         this._7480 = new Vector.<Function>();
         this._7535 = new Object();
         super();
         addEventListener(Event.SELECT_ALL,this._7517);
      }
      
      private static function _7527(param1:Object, param2:Object, param3:String, param4:Object) : *
      {
         if(param1)
         {
            return param1[param3];
         }
         var _loc5_:* = param2[param3];
         return _loc5_ === undefined ? param4[param3] : _loc5_;
      }
      
      private static function _7529(param1:Object, param2:Object, param3:String, param4:*, param5:Object) : Boolean
      {
         if(_7527(param1,param2,param3,param5) === param4)
         {
            return false;
         }
         var _loc6_:* = param5[param3];
         if(param1)
         {
            param1[param3] = param4;
            if(param4 === _loc6_)
            {
               param2.propertyBits &= ~_7510[param3];
            }
            else
            {
               param2.propertyBits |= _7510[param3];
            }
         }
         else if(param4 === _loc6_)
         {
            delete param2[param3];
         }
         else
         {
            param2[param3] = param4;
         }
         return true;
      }
      
      public function get _7490() : Array
      {
         return this._7486;
      }
      
      public function set _7490(param1:Array) : void
      {
         if(this._7486 == param1)
         {
            return;
         }
         this._7486 = param1;
         this._7458 = true;
         _2466();
      }
      
      override protected function _2476() : void
      {
         super._2476();
         if(this._7458)
         {
            this._7458 = true;
            this._7459();
            if(Boolean(this.grid) && Boolean(this.grid.layout))
            {
               this.grid.layout._7479();
            }
         }
      }
      
      private function _7459() : void
      {
         if(!this.grid)
         {
            return;
         }
         if(Boolean(this._7490) && Boolean(this._7452))
         {
            this.grid._7542 = this._7452;
         }
         else
         {
            this.grid._7542 = this._7542;
         }
      }
      
      private function _7532(param1:String) : *
      {
         return _7527(this.grid,this._7535,param1,_7489);
      }
      
      private function _7530(param1:String, param2:*) : Boolean
      {
         return _7529(this.grid,this._7535,param1,param2,_7489);
      }
      
      private function _2470(param1:String) : void
      {
         if(hasEventListener(param1))
         {
            dispatchEvent(new Event(param1));
         }
      }
      
      private function _7525(param1:String) : void
      {
         if(hasEventListener(param1))
         {
            dispatchEvent(new UIEvent(param1));
         }
      }
      
      public function get columns() : _1039
      {
         return this._7532("columns");
      }
      
      public function set columns(param1:_1039) : void
      {
         if(this._7530("columns",param1))
         {
            if(this._7506)
            {
               this._7506.layout._7479();
               this._7506.invalidateSize();
               this._7506.invalidateDisplayList();
            }
            this._2470("columnsChanged");
         }
      }
      
      private function _7561(param1:int) : _1053
      {
         var _loc2_:Grid = this.grid;
         if(!_loc2_ || !_loc2_.columns)
         {
            return null;
         }
         var _loc3_:_1039 = _loc2_.columns;
         return param1 >= 0 && param1 < _loc3_.length ? _loc3_.getItemAt(param1) as _1053 : null;
      }
      
      public function get _7550() : int
      {
         var _loc1_:_1039 = this.columns;
         return !!_loc1_ ? _loc1_.length : 0;
      }
      
      public function get dataProvider() : _1039
      {
         return this._7532("dataProvider");
      }
      
      public function set dataProvider(param1:_1039) : void
      {
         if(this._7530("dataProvider",param1))
         {
            this._2470("dataProviderChanged");
         }
      }
      
      public function get _7503() : int
      {
         var _loc1_:_1039 = this.dataProvider;
         return !!_loc1_ ? _loc1_.length : 0;
      }
      
      public function get dataTipField() : String
      {
         return this._7532("dataTipField");
      }
      
      public function set dataTipField(param1:String) : void
      {
         if(this._7530("dataTipField",param1))
         {
            this._2470("dataTipFieldChanged");
         }
      }
      
      public function get dataTipFunction() : Function
      {
         return this._7532("dataTipFunction");
      }
      
      public function set dataTipFunction(param1:Function) : void
      {
         if(this._7530("dataTipFunction",param1))
         {
            this._2470("dataTipFunctionChanged");
         }
      }
      
      public function get editable() : Boolean
      {
         return this._7570;
      }
      
      public function set editable(param1:Boolean) : void
      {
         this._7570 = param1;
      }
      
      public function get _7509() : int
      {
         if(this.ns_egret::editor)
         {
            return this.ns_egret::editor._7509;
         }
         return -1;
      }
      
      public function get _7533() : int
      {
         if(this.ns_egret::editor)
         {
            return this.ns_egret::editor._7533;
         }
         return -1;
      }
      
      public function get _7571() : Boolean
      {
         return false;
      }
      
      protected function get _7544() : _1062
      {
         if(!this._7536)
         {
            this._7536 = this.ns_egret::_7495();
         }
         return this._7536;
      }
      
      public function get _6573() : Class
      {
         return this._7564;
      }
      
      public function set _6573(param1:Class) : void
      {
         if(this._7564 == param1)
         {
            return;
         }
         this._7564 = param1;
         this._2470("itemEditorChanged");
      }
      
      public function get _7502() : _1065
      {
         if(this.ns_egret::editor)
         {
            return this.ns_egret::editor._7502;
         }
         return null;
      }
      
      public function get itemRenderer() : Class
      {
         return this._7532("itemRenderer");
      }
      
      public function set itemRenderer(param1:Class) : void
      {
         if(this._7530("itemRenderer",param1))
         {
            this._2470("itemRendererChanged");
         }
      }
      
      public function get preserveSelection() : Boolean
      {
         if(this.grid)
         {
            return this.grid.preserveSelection;
         }
         return this._7544.preserveSelection;
      }
      
      public function set preserveSelection(param1:Boolean) : void
      {
         if(this.grid)
         {
            this.grid.preserveSelection = param1;
         }
         else
         {
            this._7544.preserveSelection = param1;
         }
      }
      
      public function get _6678() : Boolean
      {
         if(this.grid)
         {
            return this.grid._6678;
         }
         return this._7544._6678;
      }
      
      public function set _6678(param1:Boolean) : void
      {
         if(this.grid)
         {
            this.grid._6678 = param1;
         }
         else
         {
            this._7544._6678 = param1;
         }
      }
      
      public function get requestedRowCount() : int
      {
         return this._7532("requestedRowCount");
      }
      
      public function set requestedRowCount(param1:int) : void
      {
         this._7530("requestedRowCount",param1);
      }
      
      public function get requestedColumnCount() : int
      {
         return this._7532("requestedColumnCount");
      }
      
      public function set requestedColumnCount(param1:int) : void
      {
         this._7530("requestedColumnCount",param1);
      }
      
      public function get requestedMaxRowCount() : int
      {
         return this._7532("requestedMaxRowCount");
      }
      
      public function set requestedMaxRowCount(param1:int) : void
      {
         this._7530("requestedMaxRowCount",param1);
      }
      
      public function get requestedMinRowCount() : int
      {
         return this._7532("requestedMinRowCount");
      }
      
      public function set requestedMinRowCount(param1:int) : void
      {
         this._7530("requestedMinRowCount",param1);
      }
      
      public function get requestedMinColumnCount() : int
      {
         return this._7532("requestedMinColumnCount");
      }
      
      public function set requestedMinColumnCount(param1:int) : void
      {
         this._7530("requestedMinColumnCount",param1);
      }
      
      public function get resizableColumns() : Boolean
      {
         return this._7532("resizableColumns");
      }
      
      public function set resizableColumns(param1:Boolean) : void
      {
         if(this._7530("resizableColumns",param1))
         {
            this._2470("resizableColumnsChanged");
         }
      }
      
      public function get rowHeight() : Number
      {
         return this._7532("rowHeight");
      }
      
      public function set rowHeight(param1:Number) : void
      {
         if(this._7530("rowHeight",param1))
         {
            this._2470("rowHeightChanged");
         }
      }
      
      public function get _6609() : String
      {
         if(this.grid)
         {
            return this.grid._6609;
         }
         return this._7544._6609;
      }
      
      public function set _6609(param1:String) : void
      {
         if(this._6609 == param1)
         {
            return;
         }
         if(this.grid)
         {
            this.grid._6609 = param1;
         }
         else
         {
            this._7544._6609 = param1;
         }
         if(this.grid && this.grid.layout is _1059 && Boolean(this.caretIndicator))
         {
            _1059(this.grid.layout)._7572 = param1 != _1063.NONE && Boolean(stage) && this == stage.focus;
         }
         this._2470("selectionModeChanged");
      }
      
      ns_egret function _7504() : Boolean
      {
         var _loc1_:String = this._6609;
         return _loc1_ == _1063._7565 || _loc1_ == _1063._6608;
      }
      
      ns_egret function _7496() : Boolean
      {
         var _loc1_:String = this._6609;
         return _loc1_ == _1063._7562 || _loc1_ == _1063._7538;
      }
      
      public function get showDataTips() : Boolean
      {
         return this._7532("showDataTips");
      }
      
      public function set showDataTips(param1:Boolean) : void
      {
         if(this._7530("showDataTips",param1))
         {
            this._2470("showDataTipsChanged");
         }
      }
      
      public function get _7524() : Boolean
      {
         return this._7515;
      }
      
      public function set _7524(param1:Boolean) : void
      {
         if(this._7515 == param1)
         {
            return;
         }
         this._7515 = param1;
         this._2470("sortableColumnsChanged");
      }
      
      public function get typicalItem() : Object
      {
         return this._7532("typicalItem");
      }
      
      public function set typicalItem(param1:Object) : void
      {
         if(this._7530("typicalItem",param1))
         {
            this._2470("typicalItemChanged");
         }
      }
      
      public function _7485() : void
      {
         if(this.grid)
         {
            this.grid._7454();
         }
      }
      
      public function get variableRowHeight() : Boolean
      {
         return this._7532("variableRowHeight");
      }
      
      public function set variableRowHeight(param1:Boolean) : void
      {
         if(this._7530("variableRowHeight",param1))
         {
            this._2470("variableRowHeightChanged");
         }
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this.ns_egret::_7566 = new _1140();
         var _loc1_:Graphics = this.ns_egret::_7566.graphics;
         _loc1_.clear();
         _loc1_.lineStyle(0,0,0);
         _loc1_.drawRect(0,0,this._7531,this._7516);
         ns_egret::_1607(this.ns_egret::_7566);
         this.ns_egret::_7566.tabEnabled = true;
         this.ns_egret::_7566.tabIndex = tabIndex;
         this.ns_egret::_7566.visible = true;
      }
      
      override public function set _7569(param1:int) : void
      {
         super._7569 = param1;
         if(this.grid)
         {
            this._7470(this._7506);
         }
      }
      
      override public function set tabIndex(param1:int) : void
      {
         super.tabIndex = param1;
         if(this.ns_egret::_7566)
         {
            this.ns_egret::_7566.tabIndex = param1;
         }
      }
      
      override protected function _5823(param1:Number, param2:Number) : void
      {
         var _loc3_:Graphics = null;
         super._5823(param1,param2);
         if(Boolean(this.ns_egret::_7566) && (this._7531 != param1 || this._7516 != param2))
         {
            this._7531 = param1;
            this._7516 = param2;
            _loc3_ = this.ns_egret::_7566.graphics;
            _loc3_.clear();
            _loc3_.lineStyle(0,0,0);
            _loc3_.drawRect(0,0,this._7531,this._7516);
         }
      }
      
      override public function _2581() : void
      {
         if(this.grid)
         {
            this.ns_egret::_7566._2581();
         }
      }
      
      private function _7567(param1:DisplayObject) : Boolean
      {
         return param1 == this.ns_egret::_7566 || param1 == this;
      }
      
      protected function _2575(param1:KeyboardEvent) : void
      {
         var _loc2_:String = null;
         if(!this.grid || param1.isDefaultPrevented())
         {
            return;
         }
         if(param1 == this._7549)
         {
            this._7549 = null;
            param1.preventDefault();
            return;
         }
         if(!this._7567(DisplayObject(param1.target)))
         {
            return;
         }
         if(param1.keyCode == Keyboard.A && param1.ctrlKey)
         {
            this._7482();
            param1.preventDefault();
            return;
         }
         if(this._6609 == _1063.NONE || this.grid._7548 < 0 || this.grid._7548 >= this._7503 || this.ns_egret::_7496() && (this.grid._7514 < 0 || this.grid._7514 >= this._7550))
         {
            if(Boolean(this._2491) && this._7549 != param1)
            {
               this._7549 = param1.clone() as KeyboardEvent;
               this._2491.dispatchEvent(this._7549);
            }
            return;
         }
         if(param1.keyCode == Keyboard.SPACE)
         {
            if(param1.ctrlKey)
            {
               if(this._7523(this.grid._7548,this.grid._7514))
               {
                  this.grid._7540 = this.grid._7548;
                  this.grid._7505 = this.grid._7514;
                  param1.preventDefault();
               }
            }
            else if(param1.shiftKey)
            {
               if(this._7522(this.grid._7548,this.grid._7514))
               {
                  param1.preventDefault();
               }
            }
            else if(this.grid._7548 != -1)
            {
               if(this.ns_egret::_7504())
               {
                  _loc2_ = this._6609 == _1063._7565 ? _1179.SET_ROW : _1179.ADD_ROW;
                  if(!this._7466(_loc2_,this.grid._7548,this.grid._7514))
                  {
                     return;
                  }
                  param1.preventDefault();
               }
               else if(this.ns_egret::_7496() && this.grid._7514 != -1)
               {
                  _loc2_ = this._6609 == _1063._7562 ? _1179.SET_CELL : _1179.ADD_CELL;
                  if(!this._7466(_loc2_,this.grid._7548,this.grid._7514))
                  {
                     return;
                  }
                  param1.preventDefault();
               }
            }
            return;
         }
         this._7453(param1);
      }
      
      protected function _7517(param1:Event) : void
      {
         if(!this.grid || param1.isDefaultPrevented() || !this._7567(DisplayObject(param1.target)))
         {
            return;
         }
         this._7482();
      }
      
      private function _7482() : void
      {
         if(this._6609 == _1063._7538 || this._6609 == _1063._6608)
         {
            if(this._7466(_1179.SELECT_ALL,0,0,this.dataProvider.length,this.columns.length))
            {
               this.grid._7540 = 0;
               this.grid._7505 = 0;
            }
         }
      }
      
      private function _7470(param1:_1064) : void
      {
         if(!param1)
         {
            return;
         }
         param1._5598 = this;
         if(param1._7569 <= this.grid._7569)
         {
            param1._7569 = this.grid._7569 + 1;
         }
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         var _loc3_:Object = null;
         var _loc4_:String = null;
         var _loc5_:Function = null;
         super.partAdded(param1,param2);
         if(param2 == this.grid)
         {
            this._7544.grid = this.grid;
            this.grid.ns_egret::_7544 = this._7544;
            this.grid._5598 = this;
            _loc3_ = this._7535;
            this._7535 = {"propertyBits":0};
            for(_loc4_ in _loc3_)
            {
               if(_loc4_ != "propertyBits")
               {
                  this._7530(_loc4_,_loc3_[_loc4_]);
               }
            }
            this._7459();
            this.grid._7279 = this._7279;
            this.grid._7554 = this._7554;
            this.grid.hoverIndicator = this.hoverIndicator;
            this.grid.caretIndicator = this.caretIndicator;
            this.grid.selectionIndicator = this.selectionIndicator;
            this.grid.addEventListener(GridEvent.GRID_MOUSE_DOWN,this._7484,false,-50);
            this.grid.addEventListener(GridEvent.GRID_MOUSE_UP,this._7500,false,-50);
            this.grid.addEventListener(GridEvent.GRID_ROLL_OVER,this._7492,false,-50);
            this.grid.addEventListener(GridEvent.GRID_ROLL_OUT,this._7499,false,-50);
            this.grid.addEventListener(GridCaretEvent.CARET_CHANGE,this._7478);
            this.grid.addEventListener(UIEvent.VALUE_COMMIT,this._7477);
            this.grid.addEventListener("invalidateSize",this._7462);
            this.grid.addEventListener("invalidateDisplayList",this._7448);
            for each(_loc5_ in this._7480)
            {
               _loc5_(this.grid);
            }
            this._7480.length = 0;
            this._7470(this._7506);
            this.ns_egret::editor = this.ns_egret::_7556();
            this.ns_egret::editor.initialize();
         }
         if(param2 == this._7452)
         {
            this._7459();
         }
         if(this.grid)
         {
            if(param2 == this._7279)
            {
               this.grid._7279 = this._7279;
            }
            if(param2 == this._7554)
            {
               this.grid._7554 = this._7554;
            }
            if(param2 == this.hoverIndicator)
            {
               this.grid.hoverIndicator = this.hoverIndicator;
            }
            if(param2 == this.caretIndicator)
            {
               this.grid.caretIndicator = this.caretIndicator;
               addEventListener(FocusEvent.FOCUS_IN,this._7483);
               addEventListener(FocusEvent.FOCUS_OUT,this._7483);
               if(Boolean(this.grid) && this.grid.layout is _1059)
               {
                  _1059(this.grid.layout)._7572 = false;
               }
            }
            if(param2 == this._7542)
            {
               this.grid._7542 = this._7542;
            }
            if(param2 == this.selectionIndicator)
            {
               this.grid.selectionIndicator = this.selectionIndicator;
            }
         }
         if(param2 == this._7506)
         {
            if(this.grid)
            {
               this._7470(this._7506);
            }
            this._7506.addEventListener(GridEvent.GRID_CLICK,this._7451);
            this._7506.addEventListener(GridEvent.SEPARATOR_ROLL_OVER,this._7468);
            this._7506.addEventListener(GridEvent.SEPARATOR_ROLL_OUT,this._7472);
            this._7506.addEventListener(GridEvent.SEPARATOR_MOUSE_DOWN,this._7464);
            this._7506.addEventListener(GridEvent.SEPARATOR_MOUSE_DRAG,this._7463);
            this._7506.addEventListener(GridEvent.SEPARATOR_MOUSE_UP,this._7474);
         }
      }
      
      override protected function partRemoved(param1:String, param2:Object) : void
      {
         var _loc3_:uint = 0;
         var _loc4_:String = null;
         var _loc5_:uint = 0;
         super.partRemoved(param1,param2);
         if(param2 == this.grid)
         {
            this._7544.grid = null;
            this.grid.ns_egret::_7544 = null;
            this.grid._5598 = null;
            this.grid.removeEventListener("invalidateSize",this._7462);
            this.grid.removeEventListener("invalidateDisplayList",this._7448);
            this.grid.removeEventListener(GridEvent.GRID_MOUSE_DOWN,this._7484);
            this.grid.removeEventListener(GridEvent.GRID_MOUSE_UP,this._7500);
            this.grid.removeEventListener(GridEvent.GRID_ROLL_OVER,this._7492);
            this.grid.removeEventListener(GridEvent.GRID_ROLL_OUT,this._7499);
            this.grid.removeEventListener(GridCaretEvent.CARET_CHANGE,this._7478);
            this.grid.removeEventListener(UIEvent.VALUE_COMMIT,this._7477);
            _loc3_ = uint(this._7535.propertyBits);
            this._7535 = new Object();
            for(_loc4_ in _7489)
            {
               _loc5_ = uint(_7510[_loc4_]);
               if((_loc5_ & _loc3_) == _loc5_)
               {
                  this._7535[_loc4_] = this._7532(_loc4_);
               }
            }
            this.grid._7542 = null;
            this.grid._7279 = null;
            this.grid._7554 = null;
            this.grid.hoverIndicator = null;
            this.grid.caretIndicator = null;
            this.grid.selectionIndicator = null;
            if(this._7506)
            {
               this._7506._5598 = null;
            }
            if(this.ns_egret::editor)
            {
               this.ns_egret::editor._7553();
               this.ns_egret::editor = null;
            }
         }
         if(this.grid)
         {
            if(param2 == this._7279)
            {
               this.grid._7279 = null;
            }
            if(param2 == this._7554)
            {
               this.grid._7554 = null;
            }
            if(param2 == this.hoverIndicator)
            {
               this.grid.hoverIndicator = null;
            }
            if(param2 == this.caretIndicator)
            {
               this.grid.caretIndicator = null;
               removeEventListener(FocusEvent.FOCUS_IN,this._7483);
               removeEventListener(FocusEvent.FOCUS_OUT,this._7483);
            }
            if(param2 == this.selectionIndicator)
            {
               this.grid.selectionIndicator = null;
            }
            if(param2 == this._7542)
            {
               this.grid._7542 = null;
            }
         }
         if(param2 == this._7506)
         {
            this._7506._5598 = null;
            this._7506.removeEventListener(GridEvent.GRID_CLICK,this._7451);
            this._7506.removeEventListener(GridEvent.SEPARATOR_ROLL_OVER,this._7468);
            this._7506.removeEventListener(GridEvent.SEPARATOR_ROLL_OUT,this._7472);
            this._7506.removeEventListener(GridEvent.SEPARATOR_MOUSE_DOWN,this._7464);
            this._7506.removeEventListener(GridEvent.SEPARATOR_MOUSE_DRAG,this._7463);
            this._7506.removeEventListener(GridEvent.SEPARATOR_MOUSE_UP,this._7474);
         }
      }
      
      public function get _7555() : _1048
      {
         if(this.grid)
         {
            return this.grid._7555;
         }
         return !!this._7545.length ? this._7545[0] : null;
      }
      
      public function set _7555(param1:_1048) : void
      {
         var valueCopy:_1048 = null;
         var f:Function = null;
         var value:_1048 = param1;
         if(this.grid)
         {
            this.grid._7555 = value;
         }
         else
         {
            valueCopy = !!value ? new _1048(value._6589,value.columnIndex) : null;
            f = function(param1:Grid):void
            {
               param1._7555 = valueCopy;
            };
            this._7480.push(f);
         }
      }
      
      public function get _7545() : Vector.<_1048>
      {
         return !!this.grid ? this.grid._7545 : this._7544.allCells();
      }
      
      public function set _7545(param1:Vector.<_1048>) : void
      {
         var valueCopy:Vector.<_1048> = null;
         var f:Function = null;
         var value:Vector.<_1048> = param1;
         if(this.grid)
         {
            this.grid._7545 = value;
         }
         else
         {
            valueCopy = !!value ? value.concat() : null;
            f = function(param1:Grid):void
            {
               param1._7545 = valueCopy;
            };
            this._7480.push(f);
         }
      }
      
      public function get selectedIndex() : int
      {
         if(this.grid)
         {
            return this.grid.selectedIndex;
         }
         return this._5358.length > 0 ? this._5358[0] : -1;
      }
      
      public function set selectedIndex(param1:int) : void
      {
         var f:Function = null;
         var value:int = param1;
         if(this.grid)
         {
            this.grid.selectedIndex = value;
         }
         else
         {
            f = function(param1:Grid):void
            {
               param1.selectedIndex = value;
            };
            this._7480.push(f);
         }
      }
      
      public function get _5358() : Vector.<int>
      {
         return !!this.grid ? this.grid._5358 : this._7544.allRows();
      }
      
      public function set _5358(param1:Vector.<int>) : void
      {
         var valueCopy:Vector.<int> = null;
         var f:Function = null;
         var value:Vector.<int> = param1;
         if(this.grid)
         {
            this.grid._5358 = value;
         }
         else
         {
            valueCopy = !!value ? value.concat() : null;
            f = function(param1:Grid):void
            {
               param1._5358 = valueCopy;
            };
            this._7480.push(f);
         }
      }
      
      public function get _2484() : Object
      {
         if(this.grid)
         {
            return this.grid._2484;
         }
         return Boolean(this.dataProvider) && this.selectedIndex > 0 ? this.dataProvider.getItemAt(this.selectedIndex) : undefined;
      }
      
      public function set _2484(param1:Object) : void
      {
         var f:Function = null;
         var value:Object = param1;
         if(this.grid)
         {
            this.grid._2484 = value;
         }
         else
         {
            f = function(param1:Grid):void
            {
               param1._2484 = value;
            };
            this._7480.push(f);
         }
      }
      
      public function get _2889() : Vector.<Object>
      {
         if(this.grid)
         {
            return this.grid._2889;
         }
         var _loc1_:Vector.<Object> = new Vector.<Object>();
         var _loc2_:int = 0;
         while(_loc2_ < this._5358.length)
         {
            _loc1_.push(this._5358[_loc2_]);
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function set _2889(param1:Vector.<Object>) : void
      {
         var valueCopy:Vector.<Object> = null;
         var f:Function = null;
         var value:Vector.<Object> = param1;
         if(this.grid)
         {
            this.grid._2889 = value;
         }
         else
         {
            valueCopy = value.concat();
            f = function(param1:Grid):void
            {
               param1._2889 = valueCopy;
            };
            this._7480.push(f);
         }
      }
      
      public function get _7526() : int
      {
         return !!this.grid ? this.grid._7526 : this._7544._7526;
      }
      
      public function _7534(param1:int, param2:int) : void
      {
         if(this.grid)
         {
            this.grid._7534(param1,param2);
         }
      }
      
      public function selectAll() : Boolean
      {
         var _loc1_:Boolean = false;
         if(this.grid)
         {
            _loc1_ = this.grid.selectAll();
         }
         else
         {
            _loc1_ = this._7544.selectAll();
            if(_loc1_)
            {
               this._7525(UIEvent.VALUE_COMMIT);
            }
         }
         return _loc1_;
      }
      
      public function clearSelection() : Boolean
      {
         var _loc1_:Boolean = false;
         if(this.grid)
         {
            _loc1_ = this.grid.clearSelection();
         }
         else
         {
            _loc1_ = this._7544._6162();
            if(_loc1_)
            {
               this._7525(UIEvent.VALUE_COMMIT);
            }
         }
         return _loc1_;
      }
      
      public function _7481(param1:int) : Boolean
      {
         if(this.grid)
         {
            return this.grid._7481(param1);
         }
         return this._7544.containsRow(param1);
      }
      
      public function _7473(param1:Vector.<int>) : Boolean
      {
         if(this.grid)
         {
            return this.grid._7473(param1);
         }
         return this._7544.containsRows(param1);
      }
      
      public function _2475(param1:int) : Boolean
      {
         var _loc2_:Boolean = false;
         if(this.grid)
         {
            _loc2_ = this.grid._2475(param1);
         }
         else
         {
            _loc2_ = this._7544.setRow(param1);
            if(_loc2_)
            {
               this._7525(UIEvent.VALUE_COMMIT);
            }
         }
         return _loc2_;
      }
      
      public function _7513(param1:int) : Boolean
      {
         var _loc2_:Boolean = false;
         if(this.grid)
         {
            _loc2_ = this.grid._7513(param1);
         }
         else
         {
            _loc2_ = this._7544.addRow(param1);
            if(_loc2_)
            {
               this._7525(UIEvent.VALUE_COMMIT);
            }
         }
         return _loc2_;
      }
      
      public function _7494(param1:int) : Boolean
      {
         var _loc2_:Boolean = false;
         if(this.grid)
         {
            _loc2_ = this.grid._7494(param1);
         }
         else
         {
            _loc2_ = this._7544.removeRow(param1);
            if(_loc2_)
            {
               this._7525(UIEvent.VALUE_COMMIT);
            }
         }
         return _loc2_;
      }
      
      public function _7551(param1:int, param2:int) : Boolean
      {
         var _loc3_:Boolean = false;
         if(this.grid)
         {
            _loc3_ = this.grid._7551(param1,param2);
         }
         else
         {
            _loc3_ = this._7544.setRows(param1,param2);
            if(_loc3_)
            {
               this._7525(UIEvent.VALUE_COMMIT);
            }
         }
         return _loc3_;
      }
      
      public function _7487(param1:int, param2:int) : Boolean
      {
         if(this.grid)
         {
            return this.grid._7487(param1,param2);
         }
         return this._7544._7559(param1,param2);
      }
      
      public function _7460(param1:int, param2:int, param3:int, param4:int) : Boolean
      {
         if(this.grid)
         {
            return this.grid._7460(param1,param2,param3,param4);
         }
         return this._7544.containsCellRegion(param1,param2,param3,param4);
      }
      
      public function _7521(param1:int, param2:int) : Boolean
      {
         var _loc3_:Boolean = false;
         if(this.grid)
         {
            _loc3_ = this.grid._7521(param1,param2);
         }
         else
         {
            _loc3_ = this._7544.setCell(param1,param2);
            if(_loc3_)
            {
               this._7525(UIEvent.VALUE_COMMIT);
            }
         }
         return _loc3_;
      }
      
      public function _7520(param1:int, param2:int) : Boolean
      {
         var _loc3_:Boolean = false;
         if(this.grid)
         {
            _loc3_ = this.grid._7520(param1,param2);
         }
         else
         {
            _loc3_ = this._7544.addCell(param1,param2);
            if(_loc3_)
            {
               this._7525(UIEvent.VALUE_COMMIT);
            }
         }
         return _loc3_;
      }
      
      public function _7501(param1:int, param2:int) : Boolean
      {
         var _loc3_:Boolean = false;
         if(this.grid)
         {
            _loc3_ = this.grid._7501(param1,param2);
         }
         else
         {
            _loc3_ = this._7544.removeCell(param1,param2);
            if(_loc3_)
            {
               this._7525(UIEvent.VALUE_COMMIT);
            }
         }
         return _loc3_;
      }
      
      public function _7511(param1:int, param2:int, param3:uint, param4:uint) : Boolean
      {
         var _loc5_:Boolean = false;
         if(this.grid)
         {
            _loc5_ = this.grid._7511(param1,param2,param3,param4);
         }
         else
         {
            _loc5_ = this._7544.setCellRegion(param1,param2,param3,param4);
            if(_loc5_)
            {
               this._7525(UIEvent.VALUE_COMMIT);
            }
         }
         return _loc5_;
      }
      
      protected function _7466(param1:String, param2:int, param3:int, param4:int = 1, param5:int = 1) : Boolean
      {
         var _loc7_:Boolean = false;
         var _loc8_:GridSelectionEvent = null;
         var _loc9_:GridSelectionEvent = null;
         if(!this.grid)
         {
            return false;
         }
         var _loc6_:_1050 = new _1050(param2,param3,param4,param5);
         if(!this._7467(param1,_loc6_))
         {
            return true;
         }
         if(hasEventListener(GridSelectionEvent.SELECTION_CHANGING))
         {
            _loc8_ = new GridSelectionEvent(GridSelectionEvent.SELECTION_CHANGING,false,true,param1,_loc6_);
            if(!dispatchEvent(_loc8_))
            {
               return false;
            }
         }
         switch(param1)
         {
            case _1179.SET_ROW:
               _loc7_ = this.grid.ns_egret::_7544.setRow(param2);
               break;
            case _1179.ADD_ROW:
               _loc7_ = this.grid.ns_egret::_7544.addRow(param2);
               break;
            case _1179.REMOVE_ROW:
               _loc7_ = this.grid.ns_egret::_7544.removeRow(param2);
               break;
            case _1179.SET_ROWS:
               _loc7_ = this.grid.ns_egret::_7544.setRows(param2,param4);
               break;
            case _1179.SET_CELL:
               _loc7_ = this.grid.ns_egret::_7544.setCell(param2,param3);
               break;
            case _1179.ADD_CELL:
               _loc7_ = this.grid.ns_egret::_7544.addCell(param2,param3);
               break;
            case _1179.REMOVE_CELL:
               _loc7_ = this.grid.ns_egret::_7544.removeCell(param2,param3);
               break;
            case _1179.SET_CELL_REGION:
               _loc7_ = this.grid.ns_egret::_7544.setCellRegion(param2,param3,param4,param5);
               break;
            case _1179.SELECT_ALL:
               _loc7_ = this.grid.ns_egret::_7544.selectAll();
         }
         if(!_loc7_)
         {
            return false;
         }
         this.grid.ns_egret::_7475("selectionIndicator");
         if(hasEventListener(GridSelectionEvent.SELECTION_CHANGE))
         {
            _loc9_ = new GridSelectionEvent(GridSelectionEvent.SELECTION_CHANGE,false,true,param1,_loc6_);
            dispatchEvent(_loc9_);
            if(this.grid.hasEventListener(GridSelectionEvent.SELECTION_CHANGE))
            {
               this.grid.dispatchEvent(_loc9_);
            }
         }
         this._7525(UIEvent.VALUE_COMMIT);
         return true;
      }
      
      protected function _7493(param1:int, param2:int) : void
      {
         this.grid._7548 = param1;
         this.grid._7514 = param2;
      }
      
      ns_egret function _7495() : _1062
      {
         return new _1062();
      }
      
      protected function _7465(param1:int) : Boolean
      {
         if(this.grid)
         {
            return this.grid._7481(param1) && this.grid._7526 == 1;
         }
         return this._7544.containsRow(param1) && this._7544._7526 == 1;
      }
      
      protected function _7457(param1:_1050) : Boolean
      {
         var _loc2_:int = !!this.grid ? this.grid._7526 : this._7544._7526;
         if(param1._7573 != _loc2_)
         {
            return false;
         }
         var _loc3_:int = param1._6589 + param1._7573;
         var _loc4_:int = param1._6589;
         while(_loc4_ < _loc3_)
         {
            if(this.grid)
            {
               if(!this.grid._7481(_loc4_))
               {
                  return false;
               }
            }
            else if(!this._7544.containsRow(_loc4_))
            {
               return false;
            }
            _loc4_++;
         }
         return true;
      }
      
      private function _7469(param1:int, param2:int) : Boolean
      {
         if(this.grid)
         {
            return this.grid._7487(param1,param2) && this.grid._7526 == 1;
         }
         return this._7544._7559(param1,param2) && this._7544._7526 == 1;
      }
      
      private function _7449(param1:int, param2:int, param3:int, param4:int) : Boolean
      {
         if(this.grid)
         {
            return this.grid._7460(param1,param2,param3,param4) && this.grid._7526 == param3 * param4;
         }
         return this._7544.containsCellRegion(param1,param2,param3,param4) && this._7544._7526 == param3 * param4;
      }
      
      public function _6626(param1:int, param2:int) : Boolean
      {
         if(this.ns_egret::editor)
         {
            return this.ns_egret::editor._6626(param1,param2);
         }
         return false;
      }
      
      public function _6628(param1:Boolean = false) : Boolean
      {
         if(this.ns_egret::editor)
         {
            return this.ns_egret::editor._6628(param1);
         }
         return false;
      }
      
      ns_egret function _7556() : _1051
      {
         return new _1051(this);
      }
      
      public function _7546(param1:_1053, param2:Boolean = false) : Boolean
      {
         var _6575:String = null;
         var sortFunc:Function = null;
         var descending:Boolean = false;
         var changingEvent:GridSortEvent = null;
         var changeEvent:GridSortEvent = null;
         var column:_1053 = param1;
         var isInteractive:Boolean = param2;
         var dataProvider:_1040 = this.dataProvider as _1040;
         if(!dataProvider)
         {
            return false;
         }
         _6575 = column._6575;
         sortFunc = column._7498;
         descending = column._7537;
         if(isInteractive)
         {
            if(hasEventListener(GridSortEvent.SORT_CHANGING))
            {
               changingEvent = new GridSortEvent(GridSortEvent.SORT_CHANGING,false,true,column);
               if(!dispatchEvent(changingEvent))
               {
                  return false;
               }
            }
         }
         dataProvider.sort(function(param1:Object, param2:Object):int
         {
            var _loc3_:int = 0;
            if(sortFunc != null)
            {
               _loc3_ = int(sortFunc(param1,param2,column));
            }
            else if(_6575)
            {
               if(param1[_6575] < param2[_6575])
               {
                  _loc3_ = -1;
               }
               else if(param1[_6575] > param2[_6575])
               {
                  _loc3_ = 1;
               }
               else
               {
                  _loc3_ = 0;
               }
            }
            else if(param1 < param2)
            {
               _loc3_ = -1;
            }
            else if(param1 > param2)
            {
               _loc3_ = 1;
            }
            else
            {
               _loc3_ = 0;
            }
            if(descending)
            {
               _loc3_ = -_loc3_;
            }
            return _loc3_;
         });
         if(isInteractive)
         {
            if(hasEventListener(GridSortEvent.SORT_CHANGE))
            {
               changeEvent = new GridSortEvent(GridSortEvent.SORT_CHANGE,false,true,column);
               dispatchEvent(changeEvent);
            }
            if(this._7506)
            {
               this._7506._7461 = new <int>[column.columnIndex];
            }
         }
         return true;
      }
      
      private function _7563() : Boolean
      {
         if(!this.grid)
         {
            return false;
         }
         if(this.ns_egret::_7504())
         {
            return this.grid._7540 != -1;
         }
         return this.grid._7540 != -1 && this.grid._7540 != -1;
      }
      
      private function _7523(param1:int, param2:int) : Boolean
      {
         var _loc3_:String = null;
         if(this.ns_egret::_7504())
         {
            if(this.grid._7481(param1))
            {
               _loc3_ = _1179.REMOVE_ROW;
            }
            else if(this._6609 == _1063._6608)
            {
               _loc3_ = _1179.ADD_ROW;
            }
            else
            {
               _loc3_ = _1179.SET_ROW;
            }
         }
         else if(this.ns_egret::_7496())
         {
            if(this.grid._7487(param1,param2))
            {
               _loc3_ = _1179.REMOVE_CELL;
            }
            else if(this._6609 == _1063._7538)
            {
               _loc3_ = _1179.ADD_CELL;
            }
            else
            {
               _loc3_ = _1179.SET_CELL;
            }
         }
         var _loc4_:Boolean = this._7466(_loc3_,param1,param2);
         if(_loc4_)
         {
            this._7493(param1,param2);
         }
         return _loc4_;
      }
      
      private function _7522(param1:int, param2:int) : Boolean
      {
         var _loc5_:Boolean = false;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         if(!this._7563())
         {
            return false;
         }
         var _loc3_:int = Math.min(this.grid._7540,param1);
         var _loc4_:int = Math.max(this.grid._7540,param1);
         if(this._6609 == _1063._6608)
         {
            _loc5_ = this._7466(_1179.SET_ROWS,_loc3_,-1,_loc4_ - _loc3_ + 1,0);
         }
         else if(this._6609 == _1063._7565)
         {
            _loc5_ = this._7466(_1179.SET_ROW,param1,-1,1,0);
         }
         else if(this._6609 == _1063._7538)
         {
            _loc6_ = _loc4_ - _loc3_ + 1;
            _loc7_ = Math.min(this.grid._7505,param2);
            _loc8_ = Math.max(this.grid._7505,param2);
            _loc9_ = _loc8_ - _loc7_ + 1;
            _loc5_ = this._7466(_1179.SET_CELL_REGION,_loc3_,_loc7_,_loc6_,_loc9_);
         }
         else if(this._6609 == _1063._7562)
         {
            _loc5_ = this._7466(_1179.SET_CELL,param1,param2,1,1);
         }
         if(_loc5_)
         {
            this._7493(param1,param2);
         }
         return _loc5_;
      }
      
      private function _7476(param1:int, param2:int) : Boolean
      {
         var _loc3_:Boolean = false;
         if(this.ns_egret::_7504())
         {
            _loc3_ = this._7466(_1179.SET_ROW,param1,param2);
         }
         else if(this.ns_egret::_7496())
         {
            _loc3_ = this._7466(_1179.SET_CELL,param1,param2);
         }
         if(_loc3_)
         {
            this._7493(param1,param2);
            this.grid._7540 = param1;
            this.grid._7505 = param2;
         }
         return _loc3_;
      }
      
      private function _7450(param1:uint) : _1048
      {
         var _loc7_:Vector.<int> = null;
         var _loc8_:Rectangle = null;
         var _loc9_:int = 0;
         var _loc10_:Rectangle = null;
         var _loc11_:Number = NaN;
         var _loc12_:int = 0;
         var _loc13_:Rectangle = null;
         var _loc2_:int = this.grid._7548;
         var _loc3_:int = this.grid._7514;
         var _loc4_:Boolean = this.ns_egret::_7504();
         var _loc5_:int = this._7503;
         var _loc6_:int = this._7550;
         switch(param1)
         {
            case _1137.LEFT:
               if(this.ns_egret::_7496())
               {
                  if(this.grid._7514 > 0)
                  {
                     _loc3_ = this.grid.ns_egret::_7456(_loc3_);
                  }
               }
               break;
            case _1137.RIGHT:
               if(this.ns_egret::_7496())
               {
                  if(this.grid._7514 + 1 < _loc6_)
                  {
                     _loc3_ = this.grid.ns_egret::_7471(_loc3_);
                  }
               }
               break;
            case _1137.UP:
               if(this.grid._7548 > 0)
               {
                  _loc2_--;
               }
               break;
            case _1137.DOWN:
               if(this.grid._7548 + 1 < _loc5_)
               {
                  _loc2_++;
               }
               break;
            case _1137.PAGE_UP:
               _loc7_ = this.grid._7491();
               if(_loc7_.length == 0)
               {
                  break;
               }
               _loc9_ = _loc7_[0];
               _loc10_ = this.grid._7558(_loc9_);
               if(_loc9_ < _loc5_ - 1 && _loc10_.top < this.grid.scrollRect.top)
               {
                  _loc9_ = _loc7_[1];
               }
               if(_loc2_ > _loc9_)
               {
                  _loc2_ = _loc9_;
               }
               else
               {
                  _loc8_ = this.grid._7558(_loc2_);
                  _loc11_ = this.grid.scrollRect.bottom - _loc8_.bottom;
                  this.grid.verticalScrollPosition -= _loc11_;
                  _2449();
                  _loc7_ = this.grid._7491();
                  _loc9_ = _loc7_[0];
                  if(_loc7_.length > 0)
                  {
                     _loc10_ = this.grid._7558(_loc9_);
                     if(_loc9_ < _loc5_ - 1 && this.grid.scrollRect.top > _loc10_.top)
                     {
                        _loc9_ = _loc7_[1];
                     }
                     _loc2_ = _loc9_;
                  }
               }
               break;
            case _1137.PAGE_DOWN:
               _loc7_ = this.grid._7491();
               if(_loc7_.length == 0)
               {
                  break;
               }
               _loc12_ = Math.min(_loc5_ - 1,_loc7_[_loc7_.length - 1]);
               _loc13_ = this.grid._7558(_loc12_);
               if(_loc12_ > 0 && this.grid.scrollRect.bottom < _loc13_.bottom)
               {
                  _loc12_ = _loc7_[_loc7_.length - 2];
               }
               if(_loc2_ < _loc12_)
               {
                  _loc2_ = _loc12_;
               }
               else
               {
                  _loc8_ = this.grid._7558(_loc2_);
                  this.grid.verticalScrollPosition = _loc8_.y;
                  _2449();
                  _loc7_ = this.grid._7491();
                  _loc12_ = Math.min(_loc5_ - 1,_loc7_[_loc7_.length - 1]);
                  if(_loc7_.length >= 0)
                  {
                     _loc13_ = this.grid._7558(_loc12_);
                     if(_loc12_ > 0 && this.grid.scrollRect.bottom < _loc13_.bottom)
                     {
                        _loc12_ = _loc7_[_loc7_.length - 2];
                     }
                     _loc2_ = _loc12_;
                  }
               }
               break;
            case _1137.HOME:
               _loc2_ = 0;
               _loc3_ = this.ns_egret::_7496() ? this.grid.ns_egret::_7471(-1) : -1;
               break;
            case _1137.END:
               _loc2_ = _loc5_ - 1;
               _loc3_ = this.ns_egret::_7496() ? this.grid.ns_egret::_7456(_loc6_) : -1;
               this.grid.verticalScrollPosition = this.grid.contentHeight;
               _2449();
               if(this.grid.contentHeight != this.grid.verticalScrollPosition)
               {
                  this.grid.verticalScrollPosition = this.grid.contentHeight;
                  _2449();
               }
               break;
            default:
               return null;
         }
         return new _1048(_loc2_,_loc3_);
      }
      
      public function _7497(param1:int, param2:int = -1) : void
      {
         if(this.grid)
         {
            this.grid._7497(param1,param2);
         }
      }
      
      protected function _7453(param1:KeyboardEvent) : Boolean
      {
         if(!_1137._7518(param1.keyCode))
         {
            return false;
         }
         var _loc2_:uint = param1.keyCode;
         var _loc3_:_1048 = this._7450(_loc2_);
         if(!_loc3_)
         {
            return false;
         }
         param1.preventDefault();
         var _loc4_:Boolean = false;
         if(param1.shiftKey)
         {
            _loc4_ = this._7522(_loc3_._6589,_loc3_.columnIndex);
         }
         else if(param1.ctrlKey)
         {
            this._7493(_loc3_._6589,_loc3_.columnIndex);
         }
         else
         {
            this._7476(_loc3_._6589,_loc3_.columnIndex);
         }
         this._7497(_loc3_._6589,_loc3_.columnIndex);
         return true;
      }
      
      private function _7467(param1:String, param2:_1050) : Boolean
      {
         var _loc3_:* = false;
         var _loc4_:int = param2._6589;
         var _loc5_:int = param2.columnIndex;
         var _loc6_:int = param2._7573;
         var _loc7_:int = param2._7560;
         switch(param1)
         {
            case _1179.SET_ROW:
               _loc3_ = !this._7465(_loc4_);
               break;
            case _1179.ADD_ROW:
               _loc3_ = !this.grid._7481(_loc4_);
               break;
            case _1179.REMOVE_ROW:
               _loc3_ = this._6678 ? !this._7465(_loc4_) : this.grid._7481(_loc4_);
               break;
            case _1179.SET_ROWS:
               _loc3_ = !this._7457(param2);
               break;
            case _1179.SET_CELL:
               _loc3_ = !this._7469(_loc4_,_loc5_);
               break;
            case _1179.ADD_CELL:
               _loc3_ = !this.grid._7487(_loc4_,_loc5_);
               break;
            case _1179.REMOVE_CELL:
               _loc3_ = this._6678 ? !this._7469(_loc4_,_loc5_) : this.grid._7487(_loc4_,_loc5_);
               break;
            case _1179.SET_CELL_REGION:
               _loc3_ = !this._7449(_loc4_,_loc5_,_loc6_,_loc7_);
               break;
            case _1179.SELECT_ALL:
               _loc3_ = true;
         }
         return _loc3_;
      }
      
      protected function _7492(param1:GridEvent) : void
      {
         if(param1.isDefaultPrevented())
         {
            return;
         }
         if(param1.buttonDown && param1.relatedObject != this.grid)
         {
            this._7488 = false;
         }
         this.grid._7547 = this._7488 ? param1._6589 : -1;
         this.grid._7512 = this._7488 ? param1.columnIndex : -1;
         param1.updateAfterEvent();
      }
      
      protected function _7499(param1:GridEvent) : void
      {
         if(param1.isDefaultPrevented())
         {
            return;
         }
         this.grid._7547 = -1;
         this.grid._7512 = -1;
         this._7488 = true;
         param1.updateAfterEvent();
      }
      
      protected function _7500(param1:GridEvent) : void
      {
         if(param1.isDefaultPrevented())
         {
            return;
         }
         if(!this._7488)
         {
            this.grid._7547 = param1._6589;
            this.grid._7512 = param1.columnIndex;
            this._7488 = true;
         }
      }
      
      protected function _7484(param1:GridEvent) : void
      {
         if(param1.isDefaultPrevented())
         {
            return;
         }
         var _loc2_:Boolean = this.ns_egret::_7496();
         var _loc3_:int = param1._6589;
         var _loc4_:int = _loc2_ ? param1.columnIndex : -1;
         if(_loc3_ == -1 || _loc2_ && _loc4_ == -1)
         {
            return;
         }
         if(param1.ctrlKey)
         {
            if(!this._7523(_loc3_,_loc4_))
            {
               return;
            }
            this.grid._7540 = _loc3_;
            this.grid._7505 = _loc4_;
         }
         else if(param1.shiftKey)
         {
            if(this.grid._6609 == _1063._6608 || this.grid._6609 == _1063._7538)
            {
               if(!this._7522(_loc3_,_loc4_))
               {
                  return;
               }
            }
         }
         else
         {
            this._7476(_loc3_,_loc4_);
         }
      }
      
      protected function _7478(param1:GridCaretEvent) : void
      {
         if(hasEventListener(GridCaretEvent.CARET_CHANGE))
         {
            dispatchEvent(param1);
         }
      }
      
      protected function _7477(param1:UIEvent) : void
      {
         if(hasEventListener(UIEvent.VALUE_COMMIT))
         {
            dispatchEvent(param1);
         }
      }
      
      private function _7448(param1:Event) : void
      {
         if(Boolean(this._7506) && this.grid.ns_egret::_7455("horizontalScrollPosition"))
         {
            this._7506.invalidateDisplayList();
         }
      }
      
      private function _7462(param1:Event) : void
      {
         if(this._7506)
         {
            this._7506.invalidateSize();
         }
      }
      
      protected function _7451(param1:GridEvent) : void
      {
         var _loc2_:_1053 = param1.column;
         if(!enabled || !this._7524 || !_loc2_ || !_loc2_._6576)
         {
            return;
         }
         var _loc3_:Vector.<int> = Vector.<int>([_loc2_.columnIndex]);
         _loc2_._7537 = !_loc2_._7537;
         this._7546(_loc2_,true);
      }
      
      protected function _7464(param1:GridEvent) : void
      {
         var _loc5_:_1053 = null;
         var _loc2_:_1053 = param1.column;
         if(!enabled || !this.grid.resizableColumns || !_loc2_ || !_loc2_.resizable)
         {
            return;
         }
         this._7552 = param1.column;
         this._7541 = param1.localX;
         this._7507 = this.grid._7539(this._7552.columnIndex);
         this._7568 = null;
         this._7528 = NaN;
         var _loc3_:int = this._7552.columnIndex;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = this._7561(_loc4_);
            if(_loc5_.visible && isNaN(_loc5_.width))
            {
               _loc5_.width = this.grid._7539(_loc4_);
            }
            _loc4_++;
         }
      }
      
      protected function _7463(param1:GridEvent) : void
      {
         var _loc6_:Number = NaN;
         if(!this._7552)
         {
            return;
         }
         var _loc2_:Number = param1.localX - this._7541;
         var _loc3_:Number = isNaN(this._7552.minWidth) ? 0 : this._7552.minWidth;
         var _loc4_:Number = this._7552.maxWidth;
         var _loc5_:Number = Math.ceil(this._7507 + _loc2_);
         if(this._7568)
         {
            _loc6_ = isNaN(this._7568.minWidth) ? 0 : this._7568.minWidth;
            if(Math.ceil(this._7528 - _loc2_) <= _loc6_)
            {
               return;
            }
            if(Math.ceil(this._7507 + _loc2_) <= _loc3_)
            {
               return;
            }
            this._7568.width = this._7528 - _loc2_;
         }
         _loc5_ = Math.max(_loc5_,_loc3_);
         if(!isNaN(_loc4_))
         {
            _loc5_ = Math.min(_loc5_,_loc4_);
         }
         this._7552.width = _loc5_;
         param1.updateAfterEvent();
      }
      
      protected function _7474(param1:GridEvent) : void
      {
         if(!this._7552)
         {
            return;
         }
         this._7552 = null;
      }
      
      protected function _7468(param1:GridEvent) : void
      {
         var _loc2_:_1053 = param1.column;
         if(!enabled || !this.grid.resizableColumns || !_loc2_ || !_loc2_.resizable)
         {
            return;
         }
      }
      
      protected function _7472(param1:GridEvent) : void
      {
         if(!enabled)
         {
            return;
         }
      }
      
      protected function _7483(param1:FocusEvent) : void
      {
         if(!this.grid || !(this.grid.layout is _1059))
         {
            return;
         }
         if(this._7567(DisplayObject(param1.target)))
         {
            _1059(this.grid.layout)._7572 = param1.type == FocusEvent.FOCUS_IN && this._6609 != _1063.NONE;
         }
      }
   }
}

