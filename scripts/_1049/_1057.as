package _1049
{
   import _1045.Grid;
   import _1045._1085;
   import _1177.ToolTipEvent;
   import _1225._1227;
   import egret.core._1117;
   import egret.core._999;
   import egret.core.ns_egret;
   import egret.managers._1213;
   import egret.managers._1221;
   
   use namespace ns_egret;
   
   public class _1057 extends _1085 implements _1066
   {
      public var labelDisplay:_1117;
      
      private var _2541:String = "";
      
      private var _7909:_1053 = null;
      
      private var _data:Object = null;
      
      private var _7919:Boolean = false;
      
      private var _7918:Boolean = false;
      
      private var _7760:int = -1;
      
      private var _7912:Boolean = false;
      
      private var _selected:Boolean = false;
      
      private var _7916:Boolean = false;
      
      public function _1057()
      {
         super();
         this.skinName = _1227;
         addEventListener(ToolTipEvent.TOOL_TIP_SHOW,_1057.ns_egret::_7911);
      }
      
      ns_egret static function _7910(param1:_1066) : void
      {
         var _loc2_:_1213 = param1 as _1213;
         if(!_loc2_)
         {
            return;
         }
         var _loc3_:Boolean = param1._6589 != -1 && Boolean(param1.column) && param1.column.ns_egret::_7813();
         var _loc4_:Object = _loc2_.toolTip;
         if(!_loc4_ && _loc3_)
         {
            _loc2_.toolTip = "<dataTip>";
         }
         else if(Boolean(_loc4_) && !_loc3_)
         {
            _loc2_.toolTip = null;
         }
      }
      
      ns_egret static function _7911(param1:ToolTipEvent) : void
      {
         var _loc2_:_999 = param1.toolTip;
         var _loc3_:_1066 = param1.currentTarget as _1066;
         if(!_loc3_)
         {
            return;
         }
         var _loc4_:_1213 = param1.currentTarget as _1213;
         if(!_loc4_)
         {
            return;
         }
         _loc2_._7913 = _loc3_.column._7820(_loc3_.data);
         _1221._7914(_loc2_,_loc4_);
      }
      
      public function set label(param1:String) : void
      {
         this._2541 = param1;
         if(this.labelDisplay)
         {
            this.labelDisplay.text = param1;
         }
      }
      
      public function get label() : String
      {
         if(this.labelDisplay)
         {
            return this.labelDisplay.text;
         }
         return this._2541;
      }
      
      public function get column() : _1053
      {
         return this._7909;
      }
      
      public function set column(param1:_1053) : void
      {
         if(this._7909 == param1)
         {
            return;
         }
         this._7909 = param1;
      }
      
      public function get columnIndex() : int
      {
         return !!this.column ? this.column.columnIndex : -1;
      }
      
      public function get data() : Object
      {
         return this._data;
      }
      
      public function set data(param1:Object) : void
      {
         if(this._data == param1)
         {
            return;
         }
         this._data = param1;
      }
      
      public function get down() : Boolean
      {
         return this._7919;
      }
      
      public function set down(param1:Boolean) : void
      {
         if(param1 == this._7919)
         {
            return;
         }
         this._7919 = param1;
         _2570();
      }
      
      public function get grid() : Grid
      {
         return !!this.column ? this.column.grid : null;
      }
      
      public function get _7854() : Boolean
      {
         return this._7918;
      }
      
      public function set _7854(param1:Boolean) : void
      {
         if(param1 == this._7918)
         {
            return;
         }
         this._7918 = param1;
         _2570();
      }
      
      public function get _6589() : int
      {
         return this._7760;
      }
      
      public function set _6589(param1:int) : void
      {
         if(this._7760 == param1)
         {
            return;
         }
         this._7760 = param1;
      }
      
      public function get _7915() : Boolean
      {
         return this._7912;
      }
      
      public function set _7915(param1:Boolean) : void
      {
         if(this._7912 == param1)
         {
            return;
         }
         this._7912 = param1;
         _2570();
      }
      
      public function get selected() : Boolean
      {
         return this._selected;
      }
      
      public function set selected(param1:Boolean) : void
      {
         if(this._selected == param1)
         {
            return;
         }
         this._selected = param1;
         _2570();
      }
      
      public function get dragging() : Boolean
      {
         return this._7916;
      }
      
      public function set dragging(param1:Boolean) : void
      {
         if(this._7916 == param1)
         {
            return;
         }
         this._7916 = param1;
         _2570();
      }
      
      override protected function _6231() : String
      {
         if(this._selected)
         {
            return "down";
         }
         if(!enabled)
         {
            return super._6231();
         }
         if(this._7919)
         {
            return "down";
         }
         if(this._7918)
         {
            return "over";
         }
         return "up";
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         super.partAdded(param1,param2);
         if(param2 == this.labelDisplay)
         {
            this.labelDisplay.text = this._2541;
         }
      }
      
      override protected function _5823(param1:Number, param2:Number) : void
      {
         super._5823(width,height);
         ns_egret::_7910(this);
      }
      
      public function prepare(param1:Boolean) : void
      {
      }
      
      public function discard(param1:Boolean) : void
      {
      }
   }
}

