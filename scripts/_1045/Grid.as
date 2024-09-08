package _1045
{
   import _1038._1037;
   import _1038._1039;
   import _1049._1048;
   import _1049._1053;
   import _1049._1055;
   import _1049._1059;
   import _1049._1062;
   import _1049._1063;
   import _1049._1064;
   import _1049._1066;
   import _1177.CollectionEvent;
   import _1177.GridCaretEvent;
   import _1177.GridEvent;
   import _1177.UIEvent;
   import _1177._1178;
   import _1177._1181;
   import egret.core._1141;
   import egret.core.ns_egret;
   import egret.utils._1292;
   import flash.display.InteractiveObject;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.getTimer;
   
   use namespace ns_egret;
   
   public class Grid extends Group implements _1064
   {
      private static var _7667:Object = {
         "verticalScrollPosition":uint(1 << 0),
         "horizontalScrollPosition":uint(1 << 1),
         "bothScrollPositions":uint(1 << 0) | uint(1 << 1),
         "hoverIndicator":uint(1 << 2),
         "caretIndicator":uint(1 << 3),
         "selectionIndicator":uint(1 << 4),
         "editorIndicator":uint(1 << 5),
         "none":uint(~0)
      };
      
      private var _7700:Vector.<Function>;
      
      private var _7706:Object = null;
      
      ns_egret var _7695:Boolean = false;
      
      private var _7728:Boolean = false;
      
      private var _7715:Boolean = false;
      
      private var _7699:int = 0;
      
      private var _7735:Boolean = false;
      
      private var _7722:int = 0;
      
      private var _7724:Class = null;
      
      private var _7712:int = -1;
      
      private var _7690:int = -1;
      
      private var _7557:Boolean = false;
      
      private var _7730:int = -1;
      
      private var _7710:int = -1;
      
      private var _7725:Class = null;
      
      private var _7707:int = -1;
      
      private var _7731:int = -1;
      
      private var _columns:_1039 = null;
      
      private var columnsChanged:Boolean = false;
      
      private var _6877:_1039 = null;
      
      private var dataProviderChanged:Boolean;
      
      private var _7739:String = null;
      
      private var _7713:Function = null;
      
      private var _7616:Class = null;
      
      private var itemRendererChanged:Boolean = false;
      
      private var _7714:Class = null;
      
      private var _7536:_1062;
      
      private var _7754:DataGrid = null;
      
      private var _7689:int = 10;
      
      private var _7688:int = -1;
      
      private var _7698:int = -1;
      
      private var _7675:int = -1;
      
      private var _7687:int = -1;
      
      private var _7705:Boolean = true;
      
      private var _7732:Class = null;
      
      private var _7752:Number = NaN;
      
      private var rowHeightChanged:Boolean;
      
      private var _7740:Class = null;
      
      private var _7696:Class = null;
      
      private var _7742:Boolean = false;
      
      private var _7747:Object = null;
      
      private var typicalItemChanged:Boolean = false;
      
      private var _7697:Boolean = false;
      
      private var variableRowHeightChanged:Boolean = false;
      
      private var _7663:uint = 0;
      
      private var _7748:int = -1;
      
      private var _7723:int = -1;
      
      private var _7708:int = -1;
      
      private var _7691:int = -1;
      
      private var _7744:Number;
      
      ns_egret var _7703:Number = 480;
      
      public function Grid()
      {
         this._7700 = new Vector.<Function>();
         super();
         layout = new _1059();
         _1292._7685(this,this._7671,this._7671,this._7671);
         addEventListener(MouseEvent.MOUSE_UP,this._7500);
         addEventListener(MouseEvent.MOUSE_MOVE,this._7686);
         addEventListener(MouseEvent.ROLL_OUT,this._7679);
      }
      
      private function get _7753() : _1059
      {
         return layout as _1059;
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
      
      public function get _7505() : int
      {
         return this._7699;
      }
      
      public function set _7505(param1:int) : void
      {
         if(this._7699 == param1 || this._6609 == _1063._7565 || this._6609 == _1063._6608)
         {
            return;
         }
         this._7699 = param1;
         this._7735 = true;
         _2466();
         this._2470("anchorColumnIndexChanged");
      }
      
      public function get _7540() : int
      {
         return this._7722;
      }
      
      public function set _7540(param1:int) : void
      {
         if(this._7722 == param1)
         {
            return;
         }
         this._7722 = param1;
         this._7735 = true;
         _2466();
         this._2470("anchorRowIndexChanged");
      }
      
      public function get caretIndicator() : Class
      {
         return this._7724;
      }
      
      public function set caretIndicator(param1:Class) : void
      {
         if(this._7724 == param1)
         {
            return;
         }
         this._7724 = param1;
         this.ns_egret::_7475("caretIndicator");
         this._2470("caretIndicatorChanged");
      }
      
      public function get _7514() : int
      {
         return this._7712;
      }
      
      public function set _7514(param1:int) : void
      {
         if(this._7712 == param1 || param1 < -1)
         {
            return;
         }
         this._7712 = param1;
         this._7557 = true;
         _2466();
         this.ns_egret::_7475("caretIndicator");
         this._2470("caretColumnIndexChanged");
      }
      
      public function get _7548() : int
      {
         return this._7730;
      }
      
      public function set _7548(param1:int) : void
      {
         if(this._7730 == param1 || param1 < -1)
         {
            return;
         }
         this._7730 = param1;
         this._7557 = true;
         _2466();
         this.ns_egret::_7475("caretIndicator");
         this._2470("caretRowIndexChanged");
      }
      
      public function get hoverIndicator() : Class
      {
         return this._7725;
      }
      
      public function set hoverIndicator(param1:Class) : void
      {
         if(this._7725 == param1)
         {
            return;
         }
         this._7725 = param1;
         this.ns_egret::_7475("hoverIndicator");
         this._2470("hoverIndicatorChanged");
      }
      
      public function get _7512() : int
      {
         return this._7707;
      }
      
      public function set _7512(param1:int) : void
      {
         if(this._7707 == param1)
         {
            return;
         }
         this._7707 = param1;
         this.ns_egret::_7475("hoverIndicator");
         this._2470("hoverColumnIndexChanged");
      }
      
      public function get _7547() : int
      {
         return this._7731;
      }
      
      public function set _7547(param1:int) : void
      {
         if(this._7731 == param1)
         {
            return;
         }
         this._7731 = param1;
         this.ns_egret::_7475("hoverIndicator");
         this._2470("hoverRowIndexChanged");
      }
      
      public function get columns() : _1039
      {
         return this._columns;
      }
      
      public function set columns(param1:_1039) : void
      {
         var _loc4_:int = 0;
         var _loc5_:_1053 = null;
         var _loc6_:_1053 = null;
         if(this._columns == param1)
         {
            return;
         }
         var _loc2_:_1039 = this._columns;
         if(_loc2_)
         {
            _loc2_.removeEventListener(CollectionEvent.COLLECTION_CHANGE,this._7668);
            _loc4_ = 0;
            while(_loc4_ < _loc2_.length)
            {
               _loc5_ = _1053(_loc2_.getItemAt(_loc4_));
               _loc5_.ns_egret::_7758(null);
               _loc5_.ns_egret::_7734(-1);
               _loc4_++;
            }
         }
         this._columns = param1;
         var _loc3_:_1039 = this._columns;
         if(_loc3_)
         {
            _loc3_.addEventListener(CollectionEvent.COLLECTION_CHANGE,this._7668,false,0,true);
            _loc4_ = 0;
            while(_loc4_ < _loc3_.length)
            {
               _loc6_ = _1053(_loc3_.getItemAt(_loc4_));
               _loc6_.ns_egret::_7758(this);
               _loc6_.ns_egret::_7734(_loc4_);
               _loc4_++;
            }
         }
         this.columnsChanged = true;
         this._7715 = false;
         _2466();
         this.invalidateSize();
         this.invalidateDisplayList();
         this._2470("columnsChanged");
      }
      
      private function _7716() : uint
      {
         var _loc1_:_1039 = this.columns;
         return !!_loc1_ ? uint(_loc1_.length) : 0;
      }
      
      private function _7721() : _1039
      {
         var _loc3_:String = null;
         var _loc4_:_1053 = null;
         var _loc1_:Object = this.typicalItem;
         if(!_loc1_ && this.dataProvider && this.dataProvider.length > 0)
         {
            _loc1_ = this.dataProvider.getItemAt(0);
         }
         var _loc2_:_1037 = null;
         if(_loc1_)
         {
            _loc2_ = new _1037();
            for(_loc3_ in _loc1_)
            {
               (_loc4_ = new _1053())._6575 = _loc3_;
               _loc2_.addItem(_loc4_);
            }
         }
         return _loc2_;
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
         var _loc2_:_1039 = this.dataProvider;
         if(_loc2_)
         {
            _loc2_.removeEventListener(CollectionEvent.COLLECTION_CHANGE,this._2457);
         }
         this._6877 = param1;
         var _loc3_:_1039 = this.dataProvider;
         if(_loc3_)
         {
            _loc3_.addEventListener(CollectionEvent.COLLECTION_CHANGE,this._2457,false,0,true);
         }
         this.dataProviderChanged = true;
         _2466();
         this.invalidateSize();
         this.invalidateDisplayList();
         this._2470("dataProviderChanged");
      }
      
      public function get dataTipField() : String
      {
         return this._7739;
      }
      
      public function set dataTipField(param1:String) : void
      {
         if(this._7739 == param1)
         {
            return;
         }
         this._7739 = param1;
         this.invalidateDisplayList();
         this._2470("dataTipFieldChanged");
      }
      
      public function get dataTipFunction() : Function
      {
         return this._7713;
      }
      
      public function set dataTipFunction(param1:Function) : void
      {
         if(this._7713 == param1)
         {
            return;
         }
         this._7713 = param1;
         this.invalidateDisplayList();
         this._2470("dataTipFunctionChanged");
      }
      
      public function get itemRenderer() : Class
      {
         return this._7616;
      }
      
      public function set itemRenderer(param1:Class) : void
      {
         if(this._7616 == param1)
         {
            return;
         }
         this._7616 = param1;
         this.itemRendererChanged = true;
         _2466();
         this.invalidateSize();
         this.invalidateDisplayList();
         this._2470("itemRendererChanged");
      }
      
      public function get _7279() : Class
      {
         return this._7714;
      }
      
      public function set _7279(param1:Class) : void
      {
         if(this._7714 == param1)
         {
            return;
         }
         this._7714 = param1;
         this.invalidateDisplayList();
         this._2470("columnSeparatorChanged");
      }
      
      ns_egret function get _7544() : _1062
      {
         if(!this._7536)
         {
            this._7536 = this.ns_egret::_7495();
         }
         return this._7536;
      }
      
      ns_egret function set _7544(param1:_1062) : void
      {
         this._7536 = param1;
      }
      
      public function get _5598() : DataGrid
      {
         return this._7754;
      }
      
      public function set _5598(param1:DataGrid) : void
      {
         if(this._7754 == param1)
         {
            return;
         }
         this._7754 = param1;
         this._2470("dataGridChanged");
      }
      
      public function get preserveSelection() : Boolean
      {
         return this.ns_egret::_7544.preserveSelection;
      }
      
      public function set preserveSelection(param1:Boolean) : void
      {
         this.ns_egret::_7544.preserveSelection = param1;
      }
      
      public function get requestedMaxRowCount() : int
      {
         return this._7689;
      }
      
      public function set requestedMaxRowCount(param1:int) : void
      {
         if(this._7689 == param1)
         {
            return;
         }
         this._7689 = param1;
         this.invalidateSize();
      }
      
      public function get requestedMinRowCount() : int
      {
         return this._7688;
      }
      
      public function set requestedMinRowCount(param1:int) : void
      {
         if(this._7688 == param1)
         {
            return;
         }
         this._7688 = param1;
         this.invalidateSize();
      }
      
      public function get requestedRowCount() : int
      {
         return this._7698;
      }
      
      public function set requestedRowCount(param1:int) : void
      {
         if(this._7698 == param1)
         {
            return;
         }
         this._7698 = param1;
         this.invalidateSize();
      }
      
      public function get requestedMinColumnCount() : int
      {
         return this._7675;
      }
      
      public function set requestedMinColumnCount(param1:int) : void
      {
         if(this._7675 == param1)
         {
            return;
         }
         this._7675 = param1;
         this.invalidateSize();
      }
      
      public function get requestedColumnCount() : int
      {
         return this._7687;
      }
      
      public function set requestedColumnCount(param1:int) : void
      {
         if(this._7687 == param1)
         {
            return;
         }
         this._7687 = param1;
         this.invalidateSize();
      }
      
      public function get _6678() : Boolean
      {
         return this.ns_egret::_7544._6678;
      }
      
      public function set _6678(param1:Boolean) : void
      {
         this.ns_egret::_7544._6678 = param1;
         if(param1)
         {
            this.ns_egret::_7475("selectionIndicator");
         }
      }
      
      public function get resizableColumns() : Boolean
      {
         return this._7705;
      }
      
      public function set resizableColumns(param1:Boolean) : void
      {
         if(param1 == this.resizableColumns)
         {
            return;
         }
         this._7705 = param1;
         this._2470("resizableColumnsChanged");
      }
      
      public function get _7542() : Class
      {
         return this._7732;
      }
      
      public function set _7542(param1:Class) : void
      {
         if(this._7732 == param1)
         {
            return;
         }
         this._7732 = param1;
         this.invalidateDisplayList();
         this._2470("rowBackgroundChanged");
      }
      
      public function get rowHeight() : Number
      {
         return this._7752;
      }
      
      public function set rowHeight(param1:Number) : void
      {
         if(this._7752 == param1)
         {
            return;
         }
         this._7752 = param1;
         this.rowHeightChanged = true;
         _2466();
         this._2470("rowHeightChanged");
      }
      
      private function _7709(param1:Number) : void
      {
         if(this._7752 == param1)
         {
            return;
         }
         this._7752 = param1;
         this._2470("rowHeightChanged");
      }
      
      public function get _7554() : Class
      {
         return this._7740;
      }
      
      public function set _7554(param1:Class) : void
      {
         if(this._7740 == param1)
         {
            return;
         }
         this._7740 = param1;
         this.invalidateDisplayList();
         this._2470("rowSeparatorChanged");
      }
      
      public function get _7555() : _1048
      {
         var _loc1_:Vector.<_1048> = this.ns_egret::_7544.allCells();
         return !!_loc1_.length ? _loc1_[0] : null;
      }
      
      public function set _7555(param1:_1048) : void
      {
         var _6589:int = 0;
         var columnIndex:int = 0;
         var f:Function = null;
         var value:_1048 = param1;
         _6589 = !!value ? value._6589 : -1;
         columnIndex = !!value ? value.columnIndex : -1;
         if(!initialized)
         {
            f = function():void
            {
               if(_6589 != -1 && columnIndex != -1)
               {
                  _7521(_6589,columnIndex);
               }
               else
               {
                  clearSelection();
               }
            };
            this._7700.push(f);
            _2466();
         }
         else if(_6589 != -1 && columnIndex != -1)
         {
            this._7521(_6589,columnIndex);
         }
         else
         {
            this.clearSelection();
         }
      }
      
      public function get _7545() : Vector.<_1048>
      {
         return this.ns_egret::_7544.allCells();
      }
      
      public function set _7545(param1:Vector.<_1048>) : void
      {
         var valueCopy:Vector.<_1048> = null;
         var cell:_1048 = null;
         var f:Function = null;
         var value:Vector.<_1048> = param1;
         valueCopy = new Vector.<_1048>(0);
         if(value)
         {
            for each(cell in value)
            {
               valueCopy.push(new _1048(cell._6589,cell.columnIndex));
            }
         }
         if(!initialized)
         {
            f = function():void
            {
               clearSelection();
               for each(cell in valueCopy)
               {
                  _7520(cell._6589,cell.columnIndex);
               }
            };
            this._7700.push(f);
            _2466();
         }
         else
         {
            this.clearSelection();
            for each(cell in valueCopy)
            {
               this._7520(cell._6589,cell.columnIndex);
            }
         }
      }
      
      public function get selectedIndex() : int
      {
         var _loc1_:Vector.<int> = this.ns_egret::_7544.allRows();
         return _loc1_.length > 0 ? _loc1_[0] : -1;
      }
      
      public function set selectedIndex(param1:int) : void
      {
         var f:Function = null;
         var value:int = param1;
         if(!initialized)
         {
            f = function():void
            {
               if(value != -1)
               {
                  _2475(value);
               }
               else
               {
                  clearSelection();
               }
            };
            this._7700.push(f);
            _2466();
         }
         else if(value != -1)
         {
            this._2475(value);
         }
         else
         {
            this.clearSelection();
         }
      }
      
      public function get _5358() : Vector.<int>
      {
         return this.ns_egret::_7544.allRows();
      }
      
      public function set _5358(param1:Vector.<int>) : void
      {
         var valueCopy:Vector.<int> = null;
         var f:Function = null;
         var index:int = 0;
         var value:Vector.<int> = param1;
         valueCopy = !!value ? value.concat() : new Vector.<int>(0);
         if(!initialized)
         {
            f = function():void
            {
               var _loc1_:int = 0;
               clearSelection();
               for each(_loc1_ in valueCopy)
               {
                  _7513(_loc1_);
               }
            };
            this._7700.push(f);
            _2466();
         }
         else
         {
            this.clearSelection();
            for each(index in valueCopy)
            {
               this._7513(index);
            }
         }
      }
      
      public function get _2484() : Object
      {
         var _loc1_:int = this.selectedIndex;
         if(_loc1_ == -1)
         {
            return undefined;
         }
         return this.ns_egret::_7694(_loc1_);
      }
      
      public function set _2484(param1:Object) : void
      {
         var f:Function = null;
         var _6589:int = 0;
         var value:Object = param1;
         if(!initialized)
         {
            f = function():void
            {
               if(!dataProvider)
               {
                  return;
               }
               var _loc1_:int = dataProvider.getItemIndex(value);
               if(_loc1_ == -1)
               {
                  clearSelection();
               }
               else
               {
                  _2475(_loc1_);
               }
            };
            this._7700.push(f);
            _2466();
         }
         else
         {
            if(!this.dataProvider)
            {
               return;
            }
            _6589 = this.dataProvider.getItemIndex(value);
            if(_6589 == -1)
            {
               this.clearSelection();
            }
            else
            {
               this._2475(_6589);
            }
         }
      }
      
      public function get _2889() : Vector.<Object>
      {
         var _loc3_:int = 0;
         var _loc1_:Vector.<int> = this._5358;
         if(_loc1_.length == 0)
         {
            return undefined;
         }
         var _loc2_:Vector.<Object> = new Vector.<Object>();
         for each(_loc3_ in _loc1_)
         {
            _loc2_.push(this.dataProvider.getItemAt(_loc3_));
         }
         return _loc2_;
      }
      
      public function set _2889(param1:Vector.<Object>) : void
      {
         var valueCopy:Vector.<Object> = null;
         var f:Function = null;
         var item:Object = null;
         var value:Vector.<Object> = param1;
         valueCopy = !!value ? value.concat() : new Vector.<Object>(0);
         if(!initialized)
         {
            f = function():void
            {
               var _loc1_:Object = null;
               if(!dataProvider)
               {
                  return;
               }
               clearSelection();
               for each(_loc1_ in valueCopy)
               {
                  _7513(dataProvider.getItemIndex(_loc1_));
               }
            };
            this._7700.push(f);
            _2466();
         }
         else
         {
            if(!this.dataProvider)
            {
               return;
            }
            this.clearSelection();
            for each(item in valueCopy)
            {
               this._7513(this.dataProvider.getItemIndex(item));
            }
         }
      }
      
      public function get selectionIndicator() : Class
      {
         return this._7696;
      }
      
      public function set selectionIndicator(param1:Class) : void
      {
         if(this._7696 == param1)
         {
            return;
         }
         this._7696 = param1;
         this.ns_egret::_7475("selectionIndicator");
         this._2470("selectionIndicatorChanged");
      }
      
      public function get _7526() : int
      {
         return this.ns_egret::_7544._7526;
      }
      
      public function get _6609() : String
      {
         return this.ns_egret::_7544._6609;
      }
      
      public function set _6609(param1:String) : void
      {
         if(this._6609 == param1)
         {
            return;
         }
         this.ns_egret::_7544._6609 = param1;
         if(this._6609 != param1)
         {
            return;
         }
         this._7678();
         if(!this._6678)
         {
            this._7682();
         }
         this.ns_egret::_7475("selectionIndicator");
         this._2470("selectionModeChanged");
      }
      
      public function get showDataTips() : Boolean
      {
         return this._7742;
      }
      
      public function set showDataTips(param1:Boolean) : void
      {
         if(this._7742 == param1)
         {
            return;
         }
         this._7742 = param1;
         this.invalidateDisplayList();
         dispatchEvent(new Event("showDataTipsChanged"));
      }
      
      public function get typicalItem() : Object
      {
         return this._7747;
      }
      
      public function set typicalItem(param1:Object) : void
      {
         if(this._7747 == param1)
         {
            return;
         }
         this._7747 = param1;
         this._7454();
         this._2470("typicalItemChanged");
      }
      
      public function _7454() : void
      {
         this.typicalItemChanged = true;
         _2466();
         this.invalidateSize();
         this.invalidateDisplayList();
      }
      
      public function get variableRowHeight() : Boolean
      {
         return this._7697;
      }
      
      public function set variableRowHeight(param1:Boolean) : void
      {
         if(param1 == this.variableRowHeight)
         {
            return;
         }
         this._7697 = param1;
         this.variableRowHeightChanged = true;
         _2466();
         this._2470("variableRowHeightChanged");
      }
      
      public function selectAll() : Boolean
      {
         if(ns_egret::_7680)
         {
            _1141.ns_egret::_1609._1608(this,false);
         }
         var _loc1_:Boolean = this.ns_egret::_7544.selectAll();
         if(_loc1_)
         {
            this._7682();
            this.ns_egret::_7475("selectionIndicator");
            this._7525(UIEvent.VALUE_COMMIT);
         }
         return _loc1_;
      }
      
      public function clearSelection() : Boolean
      {
         if(ns_egret::_7680)
         {
            _1141.ns_egret::_1609._1608(this,false);
         }
         var _loc1_:Boolean = this.ns_egret::_7544._6162();
         if(_loc1_)
         {
            this.ns_egret::_7475("selectionIndicator");
            this._7525(UIEvent.VALUE_COMMIT);
         }
         this._7682();
         this._7678();
         return _loc1_;
      }
      
      public function _7481(param1:int) : Boolean
      {
         return this.ns_egret::_7544.containsRow(param1);
      }
      
      public function _7473(param1:Vector.<int>) : Boolean
      {
         return this.ns_egret::_7544.containsRows(param1);
      }
      
      public function _2475(param1:int) : Boolean
      {
         if(ns_egret::_7680)
         {
            _1141.ns_egret::_1609._1608(this,false);
         }
         var _loc2_:Boolean = this.ns_egret::_7544.setRow(param1);
         if(_loc2_)
         {
            this._7548 = param1;
            this._7514 = -1;
            this.ns_egret::_7475("selectionIndicator");
            this._7525(UIEvent.VALUE_COMMIT);
         }
         return _loc2_;
      }
      
      public function _7513(param1:int) : Boolean
      {
         if(ns_egret::_7680)
         {
            _1141.ns_egret::_1609._1608(this,false);
         }
         var _loc2_:Boolean = this.ns_egret::_7544.addRow(param1);
         if(_loc2_)
         {
            this._7548 = param1;
            this._7514 = -1;
            this.ns_egret::_7475("selectionIndicator");
            this._7525(UIEvent.VALUE_COMMIT);
         }
         return _loc2_;
      }
      
      public function _7494(param1:int) : Boolean
      {
         if(ns_egret::_7680)
         {
            _1141.ns_egret::_1609._1608(this,false);
         }
         var _loc2_:Boolean = this.ns_egret::_7544.removeRow(param1);
         if(_loc2_)
         {
            this._7548 = param1;
            this._7514 = -1;
            this.ns_egret::_7475("selectionIndicator");
            this._7525(UIEvent.VALUE_COMMIT);
         }
         return _loc2_;
      }
      
      public function _7551(param1:int, param2:int) : Boolean
      {
         if(ns_egret::_7680)
         {
            _1141.ns_egret::_1609._1608(this,false);
         }
         var _loc3_:Boolean = this.ns_egret::_7544.setRows(param1,param2);
         if(_loc3_)
         {
            this._7548 = param1 + param2 - 1;
            this._7514 = -1;
            this.ns_egret::_7475("selectionIndicator");
            this._7525(UIEvent.VALUE_COMMIT);
         }
         return _loc3_;
      }
      
      public function _7487(param1:int, param2:int) : Boolean
      {
         return this.ns_egret::_7544._7559(param1,param2);
      }
      
      public function _7460(param1:int, param2:int, param3:int, param4:int) : Boolean
      {
         return this.ns_egret::_7544.containsCellRegion(param1,param2,param3,param4);
      }
      
      public function _7521(param1:int, param2:int) : Boolean
      {
         if(ns_egret::_7680)
         {
            _1141.ns_egret::_1609._1608(this,false);
         }
         var _loc3_:Boolean = this.ns_egret::_7544.setCell(param1,param2);
         if(_loc3_)
         {
            this._7548 = param1;
            this._7514 = param2;
            this.ns_egret::_7475("selectionIndicator");
            this._7525(UIEvent.VALUE_COMMIT);
         }
         return _loc3_;
      }
      
      public function _7520(param1:int, param2:int) : Boolean
      {
         if(ns_egret::_7680)
         {
            _1141.ns_egret::_1609._1608(this,false);
         }
         var _loc3_:Boolean = this.ns_egret::_7544.addCell(param1,param2);
         if(_loc3_)
         {
            this._7548 = param1;
            this._7514 = param2;
            this.ns_egret::_7475("selectionIndicator");
            this._7525(UIEvent.VALUE_COMMIT);
         }
         return _loc3_;
      }
      
      public function _7501(param1:int, param2:int) : Boolean
      {
         if(ns_egret::_7680)
         {
            _1141.ns_egret::_1609._1608(this,false);
         }
         var _loc3_:Boolean = this.ns_egret::_7544.removeCell(param1,param2);
         if(_loc3_)
         {
            this._7548 = param1;
            this._7514 = param2;
            this.ns_egret::_7475("selectionIndicator");
            this._7525(UIEvent.VALUE_COMMIT);
         }
         return _loc3_;
      }
      
      public function _7511(param1:int, param2:int, param3:uint, param4:uint) : Boolean
      {
         if(ns_egret::_7680)
         {
            _1141.ns_egret::_1609._1608(this,false);
         }
         var _loc5_:Boolean = this.ns_egret::_7544.setCellRegion(param1,param2,param3,param4);
         if(_loc5_)
         {
            this._7548 = param1 + param3 - 1;
            this._7514 = param2 + param4 - 1;
            this.ns_egret::_7475("selectionIndicator");
            this._7525(UIEvent.VALUE_COMMIT);
         }
         return _loc5_;
      }
      
      private function get _7733() : _1055
      {
         return this._7753._7733;
      }
      
      private function _7743(param1:int, param2:Boolean, param3:Boolean) : Boolean
      {
         var _loc4_:Point = null;
         if(!_loc4_)
         {
            return false;
         }
         var _loc5_:* = false;
         if(param2)
         {
            horizontalScrollPosition += _loc4_.x;
            _loc5_ = _loc4_.x != 0;
         }
         if(param3)
         {
            verticalScrollPosition += _loc4_.y;
            _loc5_ ||= _loc4_.y != 0;
         }
         return _loc5_;
      }
      
      public function _7497(param1:int = -1, param2:int = -1) : void
      {
         var _loc10_:Vector.<int> = null;
         var _loc3_:_1039 = this.columns;
         if(!_loc3_ || param2 < -1 || param2 >= _loc3_.length || !this.dataProvider || param1 < -1 || param1 >= this.dataProvider.length || param2 == -1 && param1 == -1)
         {
            return;
         }
         if(param2 == -1 && this.ns_egret::_7471(-1) == -1 || param2 != -1 && !_1053(_loc3_.getItemAt(param2)).visible)
         {
            return;
         }
         var _loc4_:int = _loc3_.length;
         var _loc5_:* = param2 != -1;
         var _loc6_:* = param1 != -1;
         if(this._7491().length == 0 || this._7683().length == 0)
         {
            _2449();
         }
         if(!_loc5_)
         {
            param2 = 0;
         }
         if(!_loc6_)
         {
            _loc10_ = this._7491();
            param1 = _loc10_.length > 0 ? _loc10_[0] : 0;
         }
         var _loc7_:int = param1 * _loc4_ + param2;
         var _loc8_:Boolean = false;
         var _loc9_:Boolean = true;
         while(true)
         {
            _loc8_ = this._7743(_loc7_,_loc5_,_loc6_);
            if(!this.variableRowHeight && !_loc5_)
            {
               break;
            }
            if(!_loc9_ && !_loc8_)
            {
               return;
            }
            _2449();
            _loc9_ = false;
            if(this._7736(_loc6_ ? param1 : -1,_loc5_ ? param2 : -1))
            {
               this._7743(_loc7_,_loc5_,_loc6_);
               return;
            }
         }
      }
      
      public function _7491() : Vector.<int>
      {
         return this._7753._7491();
      }
      
      public function _7683() : Vector.<int>
      {
         return this._7753._7683();
      }
      
      public function _7738(param1:int, param2:int) : Rectangle
      {
         return this._7753._7738(param1,param2);
      }
      
      public function _7558(param1:int) : Rectangle
      {
         return this._7753._7558(param1);
      }
      
      public function _7720(param1:int) : Rectangle
      {
         return this._7753._7720(param1);
      }
      
      public function _7737(param1:Number, param2:Number) : int
      {
         return this._7753._7737(param1,param2);
      }
      
      public function _7719(param1:Number, param2:Number) : int
      {
         return this._7753._7719(param1,param2);
      }
      
      public function _7539(param1:int) : Number
      {
         var _loc2_:_1053 = this._7741(param1);
         return Boolean(_loc2_) && !isNaN(_loc2_.width) ? _loc2_.width : this._7733._7539(param1);
      }
      
      public function _7755(param1:Number, param2:Number) : _1048
      {
         return this._7753._7755(param1,param2);
      }
      
      public function _7751(param1:Number, param2:Number, param3:Number, param4:Number) : Vector.<_1048>
      {
         return this._7753._7751(param1,param2,param3,param4);
      }
      
      public function _7756(param1:int, param2:int) : Number
      {
         return this._7733._7756(param1,param2);
      }
      
      public function _7757(param1:int, param2:int) : Number
      {
         return this._7733._7757(param1,param2);
      }
      
      public function _7711(param1:int, param2:int) : _1066
      {
         return this._7753._7711(param1,param2);
      }
      
      public function _7736(param1:int = -1, param2:int = -1) : Boolean
      {
         return this._7753._7736(param1,param2);
      }
      
      private function _7669(param1:String) : void
      {
         this._7663 |= _7667[param1];
      }
      
      ns_egret function _7455(param1:String) : Boolean
      {
         var _loc2_:uint = uint(_7667[param1]);
         return (this._7663 & _loc2_) == _loc2_;
      }
      
      ns_egret function _7661() : void
      {
         this._7663 = 0;
      }
      
      override public function invalidateSize() : void
      {
         if(!this.ns_egret::_7695)
         {
            super.invalidateSize();
            this._2470("invalidateSize");
         }
      }
      
      override public function invalidateDisplayList() : void
      {
         if(!this.ns_egret::_7695)
         {
            this._7669("none");
            super.invalidateDisplayList();
            this._2470("invalidateDisplayList");
         }
      }
      
      override protected function _2476() : void
      {
         var _loc1_:_1039 = null;
         var _loc2_:Boolean = false;
         var _loc3_:Function = null;
         if(this.variableRowHeightChanged || this.rowHeightChanged)
         {
            if(this.rowHeightChanged)
            {
               this._7733._7718 = this._7752;
            }
            this._7733.variableRowHeight = this.variableRowHeight;
            if(!this.variableRowHeight && this.rowHeightChanged || this.variableRowHeightChanged)
            {
               this.ns_egret::_7692(false);
               this.invalidateSize();
               this.invalidateDisplayList();
            }
            this.rowHeightChanged = false;
            this.variableRowHeightChanged = false;
         }
         if(this.itemRendererChanged || this.typicalItemChanged)
         {
            this.ns_egret::_7692(true);
            this.itemRendererChanged = false;
         }
         if(!this.columns || this._7715 && (this.typicalItemChanged || !this.typicalItem && this.dataProviderChanged))
         {
            _loc1_ = this.columns;
            this.columns = this._7721();
            this._7715 = this.columns != null;
            this.columnsChanged = this.columns != _loc1_;
         }
         this.typicalItemChanged = false;
         if(this.dataProviderChanged || this.columnsChanged)
         {
            if(this.ns_egret::_7544)
            {
               _loc2_ = this.ns_egret::_7544._6678;
               this.ns_egret::_7544._6678 = false;
               this.ns_egret::_7544._6162();
               this.ns_egret::_7544._6678 = _loc2_;
            }
            if(this.columnsChanged)
            {
               this._7733._7560 = !!this._columns ? this._columns.length : 0;
            }
            if(this.typicalItem != null && !this.columnsChanged)
            {
               this.ns_egret::_7692(false);
            }
            else
            {
               this.ns_egret::_7692(true);
            }
            if(!this._7557)
            {
               this._7682();
            }
            if(!this._7735)
            {
               this._7678();
            }
            this.dataProviderChanged = false;
            this.columnsChanged = false;
         }
         this._7735 = false;
         if(this.dataProvider)
         {
            for each(_loc3_ in this._7700)
            {
               _loc3_();
            }
            this._7700.length = 0;
         }
         if(this._7557)
         {
            if(Boolean(this._6877) && this._7548 >= this._6877.length)
            {
               this._7730 = this._6877.length - 1;
            }
            if(Boolean(this._columns) && this._7514 >= this._columns.length)
            {
               this._7712 = this.ns_egret::_7456(this._columns.length - 1);
            }
            this._7706 = Boolean(this._6877) && this._7730 >= 0 ? this._6877.getItemAt(this._7730) : null;
            this._7676();
            this._7710 = this._7730;
            this._7690 = this._7712;
            this._7557 = false;
         }
      }
      
      override protected function _5823(param1:Number, param2:Number) : void
      {
         this.ns_egret::_7695 = true;
         super._5823(param1,param2);
         this.ns_egret::_7695 = false;
         this.ns_egret::_7661();
         if(!this.variableRowHeight)
         {
            this._7709(this._7733._7746(0));
         }
      }
      
      ns_egret function _7475(param1:String) : void
      {
         if(!this.ns_egret::_7695)
         {
            this._7669(param1);
            super.invalidateDisplayList();
            this._2470("invalidateDisplayList");
         }
      }
      
      public function _7534(param1:int, param2:int) : void
      {
         var _loc4_:Vector.<int> = null;
         var _loc5_:int = 0;
         var _loc6_:Vector.<int> = null;
         var _loc7_:int = 0;
         if(!this.dataProvider)
         {
            return;
         }
         var _loc3_:int = this.dataProvider.length;
         if(param1 >= this.dataProvider.length)
         {
            return;
         }
         if(!this._7736(param1,param2))
         {
            return;
         }
         if(Boolean(ns_egret::_7674) || Boolean(ns_egret::_7701))
         {
            return;
         }
         if(param1 >= 0 && param2 >= 0)
         {
            this._7753._7534(param1,param2);
         }
         else if(param1 >= 0)
         {
            _loc4_ = this._7683();
            for each(_loc5_ in _loc4_)
            {
               this._7753._7534(param1,_loc5_);
               if(Boolean(ns_egret::_7674) || Boolean(ns_egret::_7701))
               {
                  break;
               }
            }
         }
         else if(param2 >= 0)
         {
            _loc6_ = this._7491();
            for each(_loc7_ in _loc6_)
            {
               if(_loc7_ >= _loc3_)
               {
                  break;
               }
               this._7753._7534(_loc7_,param2);
               if(Boolean(ns_egret::_7674) || Boolean(ns_egret::_7701))
               {
                  break;
               }
            }
         }
      }
      
      ns_egret function _7495() : _1062
      {
         return new _1062();
      }
      
      private function _7741(param1:int) : _1053
      {
         var _loc2_:_1039 = this.columns;
         if(_loc2_ == null || param1 < 0 || param1 >= _loc2_.length)
         {
            return null;
         }
         return _loc2_.getItemAt(param1) as _1053;
      }
      
      ns_egret function _7694(param1:int) : Object
      {
         var _loc2_:_1039 = this.dataProvider;
         if(_loc2_ == null || param1 >= _loc2_.length)
         {
            return null;
         }
         return _loc2_.getItemAt(param1);
      }
      
      private function _7684(param1:int, param2:int) : _1066
      {
         var _loc3_:_1059 = this.layout as _1059;
         if(!_loc3_)
         {
            return null;
         }
         return _loc3_._7684(param1,param2);
      }
      
      protected function _7671(param1:MouseEvent) : void
      {
         var _loc7_:String = null;
         var _loc2_:Point = new Point(param1.stageX,param1.stageY);
         var _loc3_:Point = globalToLocal(_loc2_);
         var _loc4_:_1055 = this._7733;
         var _loc5_:int = _loc4_._7737(_loc3_.x,_loc3_.y);
         var _loc6_:int = _loc4_._7719(_loc3_.x,_loc3_.y);
         switch(param1.type)
         {
            case MouseEvent.MOUSE_MOVE:
               _loc7_ = GridEvent.GRID_MOUSE_DRAG;
               break;
            case MouseEvent.MOUSE_UP:
               _loc7_ = GridEvent.GRID_MOUSE_UP;
               break;
            case MouseEvent.MOUSE_DOWN:
               _loc7_ = GridEvent.GRID_MOUSE_DOWN;
               this._7708 = _loc5_;
               this._7691 = _loc6_;
               this._7728 = true;
         }
         this._7704(param1,_loc7_,_loc3_,_loc5_,_loc6_);
         if(_loc7_ == GridEvent.GRID_MOUSE_UP)
         {
            this._7681(param1,_loc3_,_loc5_,_loc6_);
         }
      }
      
      protected function _7686(param1:MouseEvent) : void
      {
         var _loc2_:Point = new Point(param1.stageX,param1.stageY);
         var _loc3_:Point = globalToLocal(_loc2_);
         var _loc4_:_1055 = this._7733;
         var _loc5_:int = _loc4_._7737(_loc3_.x,_loc3_.y);
         var _loc6_:int = _loc4_._7719(_loc3_.x,_loc3_.y);
         if(_loc5_ != this._7748 || _loc6_ != this._7723)
         {
            if(this._7748 != -1 || this._7723 != -1)
            {
               this._7704(param1,GridEvent.GRID_ROLL_OUT,_loc3_,this._7748,this._7723);
            }
            if(_loc5_ != -1 && _loc6_ != -1)
            {
               this._7704(param1,GridEvent.GRID_ROLL_OVER,_loc3_,_loc5_,_loc6_);
            }
            this._7748 = _loc5_;
            this._7723 = _loc6_;
         }
      }
      
      protected function _7679(param1:MouseEvent) : void
      {
         var _loc2_:Point = null;
         var _loc3_:Point = null;
         if(this._7748 != -1 || this._7723 != -1)
         {
            _loc2_ = new Point(param1.stageX,param1.stageY);
            _loc3_ = globalToLocal(_loc2_);
            this._7704(param1,GridEvent.GRID_ROLL_OUT,_loc3_,this._7748,this._7723);
            this._7748 = -1;
            this._7723 = -1;
         }
      }
      
      protected function _7500(param1:MouseEvent) : void
      {
         if(this._7728)
         {
            this._7728 = false;
            return;
         }
         var _loc2_:Point = new Point(param1.stageX,param1.stageY);
         var _loc3_:Point = globalToLocal(_loc2_);
         var _loc4_:_1055 = this._7733;
         var _loc5_:int = _loc4_._7737(_loc3_.x,_loc3_.y);
         var _loc6_:int = _loc4_._7719(_loc3_.x,_loc3_.y);
         this._7704(param1,GridEvent.GRID_MOUSE_UP,_loc3_,_loc5_,_loc6_);
         this._7681(param1,_loc3_,_loc5_,_loc6_);
      }
      
      private function _7681(param1:MouseEvent, param2:Point, param3:int, param4:int) : void
      {
         var _loc5_:Boolean = param3 == this._7708 && param4 == this._7691;
         var _loc6_:Number = getTimer();
         if(doubleClickEnabled && _loc5_ && !isNaN(this._7744) && _loc6_ - this._7744 <= this.ns_egret::_7703)
         {
            this._7704(param1,GridEvent.GRID_DOUBLE_CLICK,param2,param3,param4);
            this._7744 = NaN;
            return;
         }
         if(_loc5_)
         {
            this._7704(param1,GridEvent.GRID_CLICK,param2,param3,param4);
            this._7744 = _loc6_;
         }
      }
      
      private function _7704(param1:MouseEvent, param2:String, param3:Point, param4:int, param5:int) : void
      {
         var _loc6_:_1053 = param5 >= 0 ? this._7741(param5) : null;
         var _loc7_:Object = param4 >= 0 ? this.ns_egret::_7694(param4) : null;
         var _loc8_:_1066 = this._7684(param4,param5);
         var _loc9_:Boolean = param1.bubbles;
         var _loc10_:Boolean = param1.cancelable;
         var _loc11_:InteractiveObject = param1.relatedObject;
         var _loc12_:Boolean = param1.ctrlKey;
         var _loc13_:Boolean = param1.altKey;
         var _loc14_:Boolean = param1.shiftKey;
         var _loc15_:Boolean = param1.buttonDown;
         var _loc16_:int = param1.delta;
         var _loc17_:GridEvent = new GridEvent(param2,_loc9_,_loc10_,param3.x,param3.y,_loc11_,_loc12_,_loc13_,_loc14_,_loc15_,_loc16_,param4,param5,_loc6_,_loc7_,_loc8_);
         dispatchEvent(_loc17_);
      }
      
      private function _7662(param1:CollectionEvent) : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:Number = NaN;
         var _loc9_:int = 0;
         var _loc2_:int = this._7548;
         var _loc3_:int = param1.location;
         var _loc4_:int = !!param1.items ? int(param1.items.length) : 0;
         switch(param1.kind)
         {
            case _1178.ADD:
               if(_loc2_ >= _loc3_)
               {
                  this._7548 += param1.items.length;
               }
               break;
            case _1178.REMOVE:
               if(_loc2_ >= _loc3_)
               {
                  if(_loc2_ < _loc3_ + _loc4_)
                  {
                     this._7548 = -1;
                  }
                  else
                  {
                     this._7548 -= _loc4_;
                  }
               }
               break;
            case _1178.MOVE:
               _loc6_ = param1.oldLocation;
               if(_loc2_ >= _loc6_ && _loc2_ < _loc6_ + _loc4_)
               {
                  this._7548 += _loc3_ - _loc6_;
               }
               break;
            case _1178.REPLACE:
            case _1178.UPDATE:
               break;
            case _1178.REFRESH:
               _loc5_ = !!this._7706 ? this._6877.getItemIndex(this._7706) : -1;
               if(_loc5_ != -1)
               {
                  this._7548 = _loc5_;
                  this._7497(this._7548,-1);
               }
               else
               {
                  _loc7_ = verticalScrollPosition;
                  _2449();
                  _loc8_ = Math.ceil(this._7733._7717());
                  _loc9_ = Math.max(_loc8_ - height,0);
                  verticalScrollPosition = _loc7_ > _loc9_ ? _loc9_ : _loc7_;
               }
               break;
            case _1178.RESET:
               _loc5_ = !!this._7706 ? this._6877.getItemIndex(this._7706) : -1;
               if(_loc5_ != -1)
               {
                  this._7548 = _loc5_;
                  this._7497(this._7548,-1);
               }
               else
               {
                  this._7548 = this._6877.length > 0 ? 0 : -1;
                  verticalScrollPosition = 0;
               }
         }
      }
      
      private function _7673(param1:CollectionEvent) : void
      {
         var _loc5_:int = 0;
         var _loc6_:_1181 = null;
         var _loc7_:int = 0;
         var _loc8_:_1053 = null;
         var _loc2_:int = this._7514;
         var _loc3_:int = param1.location;
         var _loc4_:int = !!param1.items ? int(param1.items.length) : 0;
         switch(param1.kind)
         {
            case _1178.ADD:
               if(_loc2_ >= _loc3_)
               {
                  this._7514 += _loc4_;
               }
               break;
            case _1178.REMOVE:
               if(_loc2_ >= _loc3_)
               {
                  if(_loc2_ < _loc3_ + _loc4_)
                  {
                     this._7514 = this._columns.length > 0 ? 0 : -1;
                  }
                  else
                  {
                     this._7514 -= _loc4_;
                  }
               }
               break;
            case _1178.MOVE:
               _loc5_ = param1.oldLocation;
               if(_loc2_ >= _loc5_ && _loc2_ < _loc5_ + _loc4_)
               {
                  this._7514 += _loc3_ - _loc5_;
               }
               break;
            case _1178.REPLACE:
               break;
            case _1178.UPDATE:
               if(this._6609 == _1063._7562 || this._6609 == _1063._7538)
               {
                  _loc7_ = 0;
                  while(_loc7_ < _loc4_)
                  {
                     _loc6_ = param1.items[_loc7_] as _1181;
                     if((Boolean(_loc6_)) && _loc6_.property == "visible")
                     {
                        _loc8_ = _loc6_.source as _1053;
                        if(!(!_loc8_ || _loc8_.visible))
                        {
                           if(_loc8_.columnIndex == this._7514)
                           {
                              this._7682(true);
                           }
                           if(_loc8_.columnIndex == this._7505)
                           {
                              this._7678(true);
                           }
                        }
                     }
                     _loc7_++;
                  }
               }
               break;
            case _1178.REFRESH:
            case _1178.RESET:
               this._7682(true);
               horizontalScrollPosition = 0;
         }
      }
      
      private function _7664(param1:CollectionEvent) : void
      {
         var _loc2_:int = this._7547;
         var _loc3_:int = param1.location;
         switch(param1.kind)
         {
            case _1178.ADD:
            case _1178.REMOVE:
            case _1178.REPLACE:
            case _1178.UPDATE:
            case _1178.MOVE:
               if(_loc2_ >= _loc3_)
               {
                  this._7547 = this._7733._7737(mouseX,mouseY);
               }
               break;
            case _1178.REFRESH:
            case _1178.RESET:
               this._7547 = this._7733._7737(mouseX,mouseY);
         }
      }
      
      private function _7672(param1:CollectionEvent) : void
      {
         switch(param1.kind)
         {
            case _1178.ADD:
            case _1178.REMOVE:
            case _1178.REPLACE:
            case _1178.UPDATE:
            case _1178.MOVE:
               if(this._7512 >= param1.location)
               {
                  this._7512 = this._7733._7719(mouseX,mouseY);
               }
               break;
            case _1178.REFRESH:
            case _1178.RESET:
               this._7512 = this._7733._7719(mouseX,mouseY);
         }
      }
      
      private function _2457(param1:CollectionEvent) : void
      {
         if(!this.columns && this.dataProvider.length > 0)
         {
            this.columns = this._7721();
            this._7715 = this.columns != null;
            this._7733._7560 = this._7715 ? this.columns.length : 0;
         }
         var _loc2_:_1055 = this._7733;
         if(this._7733)
         {
            this._7733._7670(param1);
            this._7733._7573 = this.dataProvider.length;
         }
         if(this._7753)
         {
            this._7753._7670(param1);
         }
         if(this.ns_egret::_7544)
         {
            this.ns_egret::_7544._7670(param1);
         }
         if(Boolean(this._7733) && this._7547 != -1)
         {
            this._7664(param1);
         }
         this.invalidateSize();
         this.invalidateDisplayList();
         if(this._7548 != -1)
         {
            this._7662(param1);
         }
      }
      
      private function _7668(param1:CollectionEvent) : void
      {
         var _loc2_:_1053 = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:Array = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc3_:int = param1.location;
         switch(param1.kind)
         {
            case _1178.ADD:
               while(_loc3_ < this.columns.length)
               {
                  _loc2_ = _1053(this.columns.getItemAt(_loc3_));
                  _loc2_.ns_egret::_7758(this);
                  _loc2_.ns_egret::_7734(_loc3_);
                  _loc3_++;
               }
               break;
            case _1178.MOVE:
               _loc3_ = Math.min(param1.oldLocation,param1.location);
               _loc5_ = Math.max(param1.oldLocation,param1.location);
               while(_loc3_ <= _loc5_)
               {
                  _loc2_ = _1053(this.columns.getItemAt(_loc3_));
                  _loc2_.ns_egret::_7734(_loc3_);
                  _loc3_++;
               }
               break;
            case _1178.REPLACE:
               _loc6_ = param1.items;
               _loc7_ = int(_loc6_.length);
               _loc4_ = 0;
               while(_loc4_ < _loc7_)
               {
                  if(_loc6_[_loc4_].oldValue is _1053)
                  {
                     _loc2_ = _1053(_loc6_[_loc4_].oldValue);
                     _loc2_.ns_egret::_7758(null);
                     _loc2_.ns_egret::_7734(-1);
                  }
                  if(_loc6_[_loc4_].newValue is _1053)
                  {
                     _loc2_ = _1053(_loc6_[_loc4_].newValue);
                     _loc2_.ns_egret::_7758(this);
                     _loc2_.ns_egret::_7734(_loc3_);
                  }
                  _loc4_++;
               }
               break;
            case _1178.UPDATE:
               break;
            case _1178.REFRESH:
               _loc3_ = 0;
               while(_loc3_ < this.columns.length)
               {
                  _loc2_ = _1053(this.columns.getItemAt(_loc3_));
                  _loc2_.ns_egret::_7734(_loc3_);
                  _loc3_++;
               }
               break;
            case _1178.REMOVE:
               _loc8_ = int(param1.items.length);
               _loc4_ = 0;
               while(_loc4_ < _loc8_)
               {
                  _loc2_ = _1053(param1.items[_loc4_]);
                  _loc2_.ns_egret::_7758(null);
                  _loc2_.ns_egret::_7734(-1);
                  _loc4_++;
               }
               while(_loc3_ < this.columns.length)
               {
                  _loc2_ = _1053(this.columns.getItemAt(_loc3_));
                  _loc2_.ns_egret::_7734(_loc3_);
                  _loc3_++;
               }
               break;
            case _1178.RESET:
               _loc3_ = 0;
               while(_loc3_ < this.columns.length)
               {
                  _loc2_ = _1053(this.columns.getItemAt(_loc3_));
                  _loc2_.ns_egret::_7758(this);
                  _loc2_.ns_egret::_7734(_loc3_);
                  _loc3_++;
               }
         }
         if(this._7733)
         {
            this._7733._7677(param1);
         }
         if(this._7753)
         {
            this._7753._7677(param1);
         }
         if(this.ns_egret::_7544)
         {
            this.ns_egret::_7544._7677(param1);
         }
         if(this._7514 != -1)
         {
            this._7673(param1);
         }
         if(Boolean(this._7733) && this._7512 != -1)
         {
            this._7672(param1);
         }
         this.invalidateSize();
         this.invalidateDisplayList();
      }
      
      ns_egret function _7692(param1:Boolean) : void
      {
         this._7753._7479();
         var _loc2_:_1055 = this._7733;
         if(_loc2_)
         {
            if(param1)
            {
               _loc2_._7665();
            }
            _loc2_._7745();
            _loc2_._7573 = !!this._6877 ? this._6877.length : 0;
         }
         _7729(0,0);
      }
      
      ns_egret function _7471(param1:int = -1) : int
      {
         var _loc5_:_1053 = null;
         if(param1 < -1)
         {
            return -1;
         }
         var _loc2_:_1039 = this.columns;
         var _loc3_:int = !!_loc2_ ? _loc2_.length : 0;
         var _loc4_:int = param1 + 1;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = _loc2_.getItemAt(_loc4_) as _1053;
            if((Boolean(_loc5_)) && _loc5_.visible)
            {
               return _loc4_;
            }
            _loc4_++;
         }
         return -1;
      }
      
      ns_egret function _7456(param1:int) : int
      {
         var _loc4_:_1053 = null;
         var _loc2_:_1039 = this.columns;
         if(!_loc2_ || param1 > _loc2_.length)
         {
            return -1;
         }
         var _loc3_:int = param1 - 1;
         while(_loc3_ >= 0)
         {
            _loc4_ = _loc2_.getItemAt(_loc3_) as _1053;
            if((Boolean(_loc4_)) && _loc4_.visible)
            {
               return _loc3_;
            }
            _loc3_--;
         }
         return -1;
      }
      
      private function _7678(param1:Boolean = false) : void
      {
         if(!param1)
         {
            this._7540 = Boolean(this._6877) && this._6877.length > 0 ? 0 : -1;
         }
         this._7505 = this.ns_egret::_7471();
      }
      
      private function _7682(param1:Boolean = false) : void
      {
         if(!param1)
         {
            this._7548 = Boolean(this._6877) && this._6877.length > 0 ? 0 : -1;
         }
         this._7514 = this.ns_egret::_7471();
      }
      
      private function _7676() : void
      {
         var _loc1_:GridCaretEvent = null;
         if(hasEventListener(GridCaretEvent.CARET_CHANGE))
         {
            _loc1_ = new GridCaretEvent(GridCaretEvent.CARET_CHANGE);
            _loc1_._7749 = this._7710;
            _loc1_._7727 = this._7690;
            _loc1_._7750 = this._7730;
            _loc1_._7726 = this._7712;
            dispatchEvent(_loc1_);
         }
      }
   }
}

