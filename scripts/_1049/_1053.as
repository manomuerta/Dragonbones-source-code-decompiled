package _1049
{
   import _1045.Grid;
   import _1177.CollectionEvent;
   import _1177._1178;
   import _1177._1181;
   import egret.core.ns_egret;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   
   use namespace ns_egret;
   
   public class _1053 extends EventDispatcher
   {
      private static var _7811:Class;
      
      public static var _7825:String = " ";
      
      private var _7829:Grid = null;
      
      private var _7759:int = -1;
      
      private var _7824:String = null;
      
      private var _7821:Array;
      
      private var _7739:String = null;
      
      private var _7713:Function = null;
      
      private var _7570:Boolean = true;
      
      private var _7814:Class = null;
      
      private var _7823:String;
      
      private var _7827:String = null;
      
      private var _7564:Class = null;
      
      private var _7616:Class = null;
      
      private var _7588:Function = null;
      
      private var _7816:Function = null;
      
      private var _width:Number = NaN;
      
      private var _5955:Number = 20;
      
      private var _2348:Number = NaN;
      
      private var _7810:Boolean = false;
      
      private var _resizable:Boolean = true;
      
      private var _7742:*;
      
      private var _7826:Boolean = true;
      
      private var _7809:Function;
      
      private var _7815:Boolean = false;
      
      private var _visible:Boolean = true;
      
      public function _1053(param1:String = null)
      {
         this._7821 = [];
         super();
         if(param1)
         {
            this._6575 = this._6572 = param1;
         }
      }
      
      ns_egret static function get _7793() : Class
      {
         if(!_7811)
         {
            _7811 = _1052;
         }
         return _7811;
      }
      
      private static function _7808(param1:Object, param2:Object, param3:_1053) : int
      {
         if(!param1 && !param2)
         {
            return 0;
         }
         if(!param1)
         {
            return 1;
         }
         if(!param2)
         {
            return -1;
         }
         var _loc4_:Array = param3._7821;
         var _loc5_:String = param3._7822(param1,_loc4_,null);
         var _loc6_:String = param3._7822(param2,_loc4_,null);
         if(_loc5_ < _loc6_)
         {
            return -1;
         }
         if(_loc5_ > _loc6_)
         {
            return 1;
         }
         return 0;
      }
      
      ns_egret function _7758(param1:Grid) : void
      {
         if(this._7829 == param1)
         {
            return;
         }
         this._7829 = param1;
         this._2470("gridChanged");
      }
      
      public function get grid() : Grid
      {
         return this._7829;
      }
      
      ns_egret function _7734(param1:int) : void
      {
         if(this._7759 == param1)
         {
            return;
         }
         this._7759 = param1;
         this._2470("columnIndexChanged");
      }
      
      public function get columnIndex() : int
      {
         return this._7759;
      }
      
      public function get _6575() : String
      {
         return this._7824;
      }
      
      public function set _6575(param1:String) : void
      {
         if(this._7824 == param1)
         {
            return;
         }
         this._7824 = param1;
         if(param1 == null)
         {
            this._7821 = [];
         }
         else if(param1.indexOf(".") != -1)
         {
            this._7821 = param1.split(".");
         }
         else
         {
            this._7821 = [param1];
         }
         this._7818();
         if(this.grid)
         {
            this.grid.ns_egret::_7692(true);
         }
         this._2470("dataFieldChanged");
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
         if(this.grid)
         {
            this.grid.invalidateDisplayList();
         }
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
         if(this.grid)
         {
            this.grid.invalidateDisplayList();
         }
         this._2470("dataTipFunctionChanged");
      }
      
      public function get editable() : Boolean
      {
         return this._7570;
      }
      
      public function set editable(param1:Boolean) : void
      {
         if(this._7570 == param1)
         {
            return;
         }
         this._7570 = param1;
         this._2470("editableChanged");
      }
      
      public function get _7817() : Class
      {
         return this._7814;
      }
      
      public function set _7817(param1:Class) : void
      {
         if(this._7814 == param1)
         {
            return;
         }
         this._7814 = param1;
         if(this.grid)
         {
            this.grid.invalidateDisplayList();
         }
         this._2470("headerRendererChanged");
      }
      
      public function get _6572() : String
      {
         return this._7823 != null ? this._7823 : (!!this._6575 ? this._6575 : "");
      }
      
      public function set _6572(param1:String) : void
      {
         this._7823 = param1;
         if(this.grid)
         {
            this.grid.invalidateDisplayList();
         }
         this._2470("headerTextChanged");
      }
      
      public function get _7828() : String
      {
         return this._7827;
      }
      
      public function set _7828(param1:String) : void
      {
         this._7827 = param1;
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
      
      public function get itemRenderer() : Class
      {
         return !!this._7616 ? this._7616 : this.grid.itemRenderer;
      }
      
      public function set itemRenderer(param1:Class) : void
      {
         if(this._7616 == param1)
         {
            return;
         }
         this._7616 = param1;
         this._7818();
         if(this.grid)
         {
            this.grid.ns_egret::_7692(true);
         }
         this._2470("itemRendererChanged");
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
         this._7818();
         if(this.grid)
         {
            this.grid.ns_egret::_7692(true);
         }
         this._2470("itemRendererFunctionChanged");
      }
      
      public function get _6146() : Function
      {
         return this._7816;
      }
      
      public function set _6146(param1:Function) : void
      {
         if(this._7816 == param1)
         {
            return;
         }
         this._7816 = param1;
         this._7818();
         if(this.grid)
         {
            this.grid.ns_egret::_7692(true);
         }
         this._2470("labelFunctionChanged");
      }
      
      public function get width() : Number
      {
         return this._width;
      }
      
      public function set width(param1:Number) : void
      {
         if(this._width == param1)
         {
            return;
         }
         this._width = param1;
         this._7818();
         this._2470("widthChanged");
      }
      
      public function get minWidth() : Number
      {
         return this._5955;
      }
      
      public function set minWidth(param1:Number) : void
      {
         if(this._5955 == param1)
         {
            return;
         }
         this._5955 = param1;
         this._7818();
         if(this.grid)
         {
            this.grid._7729(0,0);
         }
         this._2470("minWidthChanged");
      }
      
      public function get maxWidth() : Number
      {
         return this._2348;
      }
      
      public function set maxWidth(param1:Number) : void
      {
         if(this._2348 == param1)
         {
            return;
         }
         this._2348 = param1;
         this._7818();
         if(this.grid)
         {
            this.grid._7729(0,0);
         }
         this._2470("maxWidthChanged");
      }
      
      public function get _6602() : Boolean
      {
         return this._7810;
      }
      
      public function set _6602(param1:Boolean) : void
      {
         if(this._7810 == param1)
         {
            return;
         }
         this._7810 = param1;
         this._2470("rendererIsEditableChanged");
      }
      
      public function get resizable() : Boolean
      {
         return this._resizable;
      }
      
      public function set resizable(param1:Boolean) : void
      {
         if(this._resizable == param1)
         {
            return;
         }
         this._resizable = param1;
         this._2470("resizableChanged");
      }
      
      public function get showDataTips() : *
      {
         return this._7742;
      }
      
      public function set showDataTips(param1:*) : void
      {
         if(this._7742 === param1)
         {
            return;
         }
         this._7742 = param1;
         if(this.grid)
         {
            this.grid.invalidateDisplayList();
         }
         this._2470("showDataTipsChanged");
      }
      
      ns_egret function _7813() : Boolean
      {
         return this.showDataTips === undefined ? Boolean(this.grid) && this.grid.showDataTips : this.showDataTips;
      }
      
      public function get _6576() : Boolean
      {
         return this._7826;
      }
      
      public function set _6576(param1:Boolean) : void
      {
         if(this._7826 == param1)
         {
            return;
         }
         this._7826 = param1;
         this._2470("sortableChanged");
      }
      
      public function get _7498() : Function
      {
         return this._7809;
      }
      
      public function set _7498(param1:Function) : void
      {
         if(this._7809 == param1)
         {
            return;
         }
         this._7809 = param1;
         this._2470("sortCompareFunctionChanged");
      }
      
      public function get _7537() : Boolean
      {
         return this._7815;
      }
      
      public function set _7537(param1:Boolean) : void
      {
         if(this._7815 == param1)
         {
            return;
         }
         this._7815 = param1;
         this._2470("sortDescendingChanged");
      }
      
      public function get visible() : Boolean
      {
         return this._visible;
      }
      
      public function set visible(param1:Boolean) : void
      {
         var _loc2_:_1181 = null;
         var _loc3_:CollectionEvent = null;
         if(this._visible == param1)
         {
            return;
         }
         this._visible = param1;
         if(Boolean(this.grid) && Boolean(this.grid.columns))
         {
            _loc2_ = _1181._7812(this,"visible",!this._visible,this._visible);
            _loc3_ = new CollectionEvent(CollectionEvent.COLLECTION_CHANGE);
            _loc3_.kind = _1178.UPDATE;
            _loc3_.items.push(_loc2_);
            this.grid.columns.dispatchEvent(_loc3_);
         }
         this._2470("visibleChanged");
      }
      
      private function _7822(param1:Object, param2:Array, param3:Function) : String
      {
         var _loc5_:Object = null;
         var _loc6_:String = null;
         if(!param1)
         {
            return _7825;
         }
         if(param3 != null)
         {
            return param3(param1,this);
         }
         var _loc4_:String = null;
         try
         {
            _loc5_ = param1;
            for each(_loc6_ in param2)
            {
               _loc5_ = _loc5_[_loc6_];
            }
            if(_loc5_ != null && param2.length > 0)
            {
               _loc4_ = _loc5_.toString();
            }
         }
         catch(ignored:Error)
         {
         }
         return _loc4_ != null ? _loc4_ : _7825;
      }
      
      public function _7442(param1:Object) : String
      {
         return this._7822(param1,this._7821,this._6146);
      }
      
      public function _7820(param1:Object) : String
      {
         var _loc2_:Function = this.dataTipFunction != null ? this.dataTipFunction : this.grid.dataTipFunction;
         var _loc3_:String = !!this.dataTipField ? this.dataTipField : this.grid.dataTipField;
         var _loc4_:Array = !!_loc3_ ? [_loc3_] : this._7821;
         return this._7822(param1,_loc4_,_loc2_);
      }
      
      public function _7819(param1:Object) : Class
      {
         var _loc2_:Function = this._6053;
         return _loc2_ != null ? _loc2_(param1,this) : this.itemRenderer;
      }
      
      private function _2470(param1:String) : void
      {
         if(hasEventListener(param1))
         {
            dispatchEvent(new Event(param1));
         }
      }
      
      private function _7818() : void
      {
         if(this.grid)
         {
            this.grid.invalidateSize();
            this.grid.invalidateDisplayList();
         }
      }
   }
}

