package _1045
{
   import _1038._1039;
   import _1049._1053;
   import _1049._1054;
   import _1049._1064;
   import _1049._1066;
   import _1177.GridEvent;
   import _1177._1181;
   import egret.utils._1292;
   import flash.display.InteractiveObject;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class _1068 extends Group implements _1064
   {
      private var _8023:Number = 0;
      
      private var _8022:Number = 0;
      
      private var _8024:Number = 0;
      
      private var _8021:Number = 0;
      
      private var _8015:Number = 5;
      
      private var _7714:Class = null;
      
      private var _7754:DataGrid = null;
      
      private var _8019:int = -1;
      
      private var _7814:Class = null;
      
      private var _7707:int = -1;
      
      private var _8008:Vector.<int>;
      
      private var _7723:int = -1;
      
      private var _8017:int = -1;
      
      private var _8020:int = -1;
      
      private var _8016:int = -1;
      
      public function _1068()
      {
         this._8008 = new Vector.<int>();
         super();
         layout = new _1054();
         layout.clipAndEnableScrolling = true;
         _1292._7685(this,this._8009,this._8009,this._8009);
         addEventListener(MouseEvent.MOUSE_MOVE,this._8014);
         addEventListener(MouseEvent.ROLL_OUT,this._8010);
         addEventListener(MouseEvent.CLICK,this._8018);
         addEventListener(MouseEvent.DOUBLE_CLICK,this._8011);
      }
      
      public function get _2419() : Number
      {
         return this._8023;
      }
      
      public function set _2419(param1:Number) : void
      {
         if(this._8023 == param1)
         {
            return;
         }
         this._8023 = param1;
         invalidateSize();
         invalidateDisplayList();
      }
      
      public function get _2416() : Number
      {
         return this._8022;
      }
      
      public function set _2416(param1:Number) : void
      {
         if(this._8022 == param1)
         {
            return;
         }
         this._8022 = param1;
         invalidateSize();
         invalidateDisplayList();
      }
      
      public function get _2420() : Number
      {
         return this._8024;
      }
      
      public function set _2420(param1:Number) : void
      {
         if(this._8024 == param1)
         {
            return;
         }
         this._8024 = param1;
         invalidateSize();
         invalidateDisplayList();
      }
      
      public function get _2410() : Number
      {
         return this._8021;
      }
      
      public function set _2410(param1:Number) : void
      {
         if(this._8021 == param1)
         {
            return;
         }
         this._8021 = param1;
         invalidateSize();
         invalidateDisplayList();
      }
      
      public function get _7844() : Number
      {
         return this._8015;
      }
      
      public function set _7844(param1:Number) : void
      {
         this._8015 = param1;
      }
      
      private function _2470(param1:String) : void
      {
         if(hasEventListener(param1))
         {
            dispatchEvent(new Event(param1));
         }
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
         invalidateDisplayList();
         this._2470("columnSeparatorChanged");
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
         if(Boolean(this._7754) && Boolean(this._7754.grid))
         {
            this._7754.grid.removeEventListener(_1181.PROPERTY_CHANGE,this._8012);
         }
         this._7754 = param1;
         if(Boolean(this._7754) && Boolean(this._7754.grid))
         {
            this._7754.grid.addEventListener(_1181.PROPERTY_CHANGE,this._8012);
         }
         layout._7479();
         invalidateSize();
         invalidateDisplayList();
         this._2470("dataGridChanged");
      }
      
      private function _8012(param1:_1181) : void
      {
         if(param1.property == "horizontalScrollPosition")
         {
            horizontalScrollPosition = Number(param1.newValue);
         }
      }
      
      public function get _7850() : int
      {
         return this._8019;
      }
      
      public function set _7850(param1:int) : void
      {
         if(this._8019 == param1)
         {
            return;
         }
         this._8019 = param1;
         invalidateDisplayList();
         this._2470("downColumnIndexChanged");
      }
      
      public function get _7817() : Class
      {
         return this._7814;
      }
      
      public function set _7817(param1:Class) : void
      {
         if(param1 == this._7814)
         {
            return;
         }
         this._7814 = param1;
         layout._7479();
         invalidateSize();
         invalidateDisplayList();
         this._2470("headerRendererChanged");
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
         invalidateDisplayList();
         this._2470("hoverColumnIndexChanged");
      }
      
      public function get _7461() : Vector.<int>
      {
         return this._8008.concat();
      }
      
      public function set _7461(param1:Vector.<int>) : void
      {
         var _loc2_:Vector.<int> = !!param1 ? param1.concat() : new Vector.<int>();
         this._8008 = _loc2_;
         invalidateDisplayList();
         this._2470("visibleSortIndicatorIndicesChanged");
      }
      
      public function _8013(param1:int) : Boolean
      {
         return this._8008.indexOf(param1) != -1;
      }
      
      public function _7849(param1:Number, param2:Number) : int
      {
         return _1054(layout)._7849(param1,param2);
      }
      
      public function _7846(param1:Number, param2:Number) : int
      {
         return _1054(layout)._7846(param1,param2);
      }
      
      public function _7843(param1:int) : _1066
      {
         return _1054(layout)._7843(param1);
      }
      
      public function _7851(param1:int) : Rectangle
      {
         return _1054(layout)._7851(param1);
      }
      
      protected function _8009(param1:MouseEvent) : void
      {
         var _loc6_:String = null;
         var _loc2_:Point = new Point(param1.stageX,param1.stageY);
         var _loc3_:Point = globalToLocal(_loc2_);
         var _loc4_:int = this._7846(_loc3_.x,0);
         var _loc5_:int = _loc4_ == -1 ? this._7849(_loc3_.x,0) : -1;
         switch(param1.type)
         {
            case MouseEvent.MOUSE_MOVE:
               _loc6_ = this._8016 != -1 ? GridEvent.SEPARATOR_MOUSE_DRAG : GridEvent.GRID_MOUSE_DRAG;
               break;
            case MouseEvent.MOUSE_UP:
               _loc6_ = this._8016 != -1 ? GridEvent.SEPARATOR_MOUSE_UP : GridEvent.GRID_MOUSE_UP;
               this._7850 = -1;
               break;
            case MouseEvent.MOUSE_DOWN:
               if(_loc4_ != -1)
               {
                  _loc6_ = GridEvent.SEPARATOR_MOUSE_DOWN;
                  this._8016 = _loc4_;
                  this._8020 = -1;
                  this._7850 = -1;
               }
               else
               {
                  _loc6_ = GridEvent.GRID_MOUSE_DOWN;
                  this._8016 = -1;
                  this._8020 = _loc5_;
                  this._7850 = _loc5_;
               }
         }
         var _loc7_:int = _loc4_ != -1 ? _loc4_ : _loc5_;
         this._7704(param1,_loc6_,_loc3_,_loc7_);
      }
      
      protected function _8014(param1:MouseEvent) : void
      {
         var _loc2_:Point = null;
         var _loc3_:Point = null;
         var _loc4_:int = 0;
         _loc2_ = new Point(param1.stageX,param1.stageY);
         _loc3_ = globalToLocal(_loc2_);
         _loc4_ = this._7846(_loc3_.x,0);
         var _loc5_:int = _loc4_ == -1 ? this._7849(_loc3_.x,0) : -1;
         if(_loc4_ != this._8017)
         {
            if(this._8017 != -1)
            {
               this._7704(param1,GridEvent.SEPARATOR_ROLL_OUT,_loc3_,this._8017);
            }
            if(_loc4_ != -1)
            {
               this._7704(param1,GridEvent.SEPARATOR_ROLL_OVER,_loc3_,_loc4_);
            }
         }
         if(_loc5_ != this._7723)
         {
            if(this._7723 != -1)
            {
               this._7704(param1,GridEvent.GRID_ROLL_OUT,_loc3_,this._7723);
            }
            if(_loc5_ != -1)
            {
               this._7704(param1,GridEvent.GRID_ROLL_OVER,_loc3_,_loc5_);
            }
         }
         this._7723 = _loc5_;
         this._8017 = _loc4_;
         this._7512 = _loc5_;
      }
      
      protected function _8010(param1:MouseEvent) : void
      {
         var _loc2_:Point = null;
         _loc2_ = new Point(param1.stageX,param1.stageY);
         var _loc3_:Point = globalToLocal(_loc2_);
         if(this._8017 != -1)
         {
            this._7704(param1,GridEvent.SEPARATOR_ROLL_OUT,_loc3_,this._8017);
         }
         else if(this._7723 != -1)
         {
            this._7704(param1,GridEvent.GRID_ROLL_OUT,_loc3_,this._7723);
         }
         this._7723 = -1;
         this._8017 = -1;
         this._7512 = -1;
      }
      
      protected function _8018(param1:MouseEvent) : void
      {
         var _loc2_:Point = null;
         var _loc3_:Point = null;
         var _loc4_:int = 0;
         _loc2_ = new Point(param1.stageX,param1.stageY);
         _loc3_ = globalToLocal(_loc2_);
         _loc4_ = this._7846(_loc3_.x,0);
         var _loc5_:int = _loc4_ == -1 ? this._7849(_loc3_.x,0) : -1;
         if(_loc4_ != -1 && this._8016 == _loc4_)
         {
            this._7704(param1,GridEvent.SEPARATOR_CLICK,_loc3_,_loc4_);
         }
         else if(_loc5_ != -1 && this._8020 == _loc5_)
         {
            this._7704(param1,GridEvent.GRID_CLICK,_loc3_,_loc5_);
         }
      }
      
      protected function _8011(param1:MouseEvent) : void
      {
         var _loc2_:Point = null;
         var _loc3_:Point = null;
         var _loc4_:int = 0;
         _loc2_ = new Point(param1.stageX,param1.stageY);
         _loc3_ = globalToLocal(_loc2_);
         _loc4_ = this._7846(_loc3_.x,0);
         var _loc5_:int = _loc4_ == -1 ? this._7849(_loc3_.x,0) : -1;
         if(_loc4_ != -1 && this._8016 == _loc4_)
         {
            this._7704(param1,GridEvent.SEPARATOR_DOUBLE_CLICK,_loc3_,_loc4_);
         }
         else if(_loc5_ != -1 && this._8020 == _loc5_)
         {
            this._7704(param1,GridEvent.GRID_DOUBLE_CLICK,_loc3_,_loc5_);
         }
      }
      
      private function _7704(param1:MouseEvent, param2:String, param3:Point, param4:int) : void
      {
         var _loc5_:_1053 = null;
         var _loc6_:Object = null;
         var _loc7_:_1066 = null;
         var _loc8_:Boolean = false;
         var _loc9_:Boolean = false;
         var _loc10_:InteractiveObject = null;
         var _loc11_:Boolean = false;
         var _loc12_:Boolean = false;
         var _loc13_:Boolean = false;
         var _loc14_:Boolean = false;
         var _loc15_:int = 0;
         _loc5_ = this._7561(param4);
         _loc6_ = null;
         _loc7_ = this._7843(param4);
         _loc8_ = param1.bubbles;
         _loc9_ = param1.cancelable;
         _loc10_ = param1.relatedObject;
         _loc11_ = param1.ctrlKey;
         _loc12_ = param1.altKey;
         _loc13_ = param1.shiftKey;
         _loc14_ = param1.buttonDown;
         _loc15_ = param1.delta;
         var _loc16_:GridEvent = new GridEvent(param2,_loc8_,_loc9_,param3.x,param3.y,_loc10_,_loc11_,_loc12_,_loc13_,_loc14_,_loc15_,-1,param4,_loc5_,_loc6_,_loc7_);
         dispatchEvent(_loc16_);
      }
      
      private function _7561(param1:int) : _1053
      {
         var _loc2_:Grid = !!this._5598 ? this._5598.grid : null;
         if(!_loc2_ || !_loc2_.columns)
         {
            return null;
         }
         var _loc3_:_1039 = _loc2_.columns;
         return param1 >= 0 && param1 < _loc3_.length ? _loc3_.getItemAt(param1) as _1053 : null;
      }
   }
}

