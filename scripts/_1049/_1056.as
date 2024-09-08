package _1049
{
   import _1045.DataGrid;
   import _1045._1085;
   import egret.core.ns_egret;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.utils.describeType;
   
   use namespace ns_egret;
   
   public class _1056 extends _1085 implements _1065
   {
      private var _7909:_1053;
      
      private var _data:Object = null;
      
      private var _7616:_1066;
      
      private var _7760:int;
      
      private var _value:Object;
      
      public function _1056()
      {
         super();
      }
      
      public function get column() : _1053
      {
         return this._7909;
      }
      
      public function set column(param1:_1053) : void
      {
         this._7909 = param1;
      }
      
      public function get columnIndex() : int
      {
         return this.column.columnIndex;
      }
      
      public function get data() : Object
      {
         return this._data;
      }
      
      public function set data(param1:Object) : void
      {
         this._data = param1;
         if(Boolean(this._data) && Boolean(this.column._6575))
         {
            this.value = this._data[this.column._6575];
         }
      }
      
      public function get _5598() : DataGrid
      {
         return DataGrid(owner);
      }
      
      public function get _7571() : Boolean
      {
         return true;
      }
      
      public function get itemRenderer() : _1066
      {
         return this._7616;
      }
      
      public function set itemRenderer(param1:_1066) : void
      {
         this._7616 = param1;
      }
      
      public function get _6589() : int
      {
         return this._7760;
      }
      
      public function set _6589(param1:int) : void
      {
         this._7760 = param1;
      }
      
      public function get value() : Object
      {
         return this._value;
      }
      
      public function set value(param1:Object) : void
      {
         if(param1 == this._value)
         {
            return;
         }
         this._value = param1;
      }
      
      public function discard() : void
      {
         removeEventListener(MouseEvent.MOUSE_UP,this._7908);
         removeEventListener(MouseEvent.MOUSE_DOWN,this._7908);
         removeEventListener(MouseEvent.MOUSE_MOVE,this._4089);
      }
      
      public function prepare() : void
      {
         addEventListener(MouseEvent.MOUSE_UP,this._7908);
         addEventListener(MouseEvent.MOUSE_DOWN,this._7908);
         addEventListener(MouseEvent.MOUSE_MOVE,this._4089);
      }
      
      public function save() : Boolean
      {
         var _loc5_:XML = null;
         var _loc6_:String = null;
         if(!this.validate())
         {
            return false;
         }
         var _loc1_:Object = this.value;
         var _loc2_:String = this.column._6575;
         var _loc3_:Object = this._data;
         var _loc4_:String = "";
         for each(_loc5_ in describeType(_loc3_).variable)
         {
            if(_loc2_ == _loc5_.@name.toString())
            {
               _loc4_ = _loc5_.@type.toString();
               break;
            }
         }
         if(_loc4_ == "String")
         {
            if(!(_loc1_ is String))
            {
               _loc1_ = _loc1_.toString();
            }
         }
         else if(_loc4_ == "uint")
         {
            if(!(_loc1_ is uint))
            {
               _loc1_ = uint(_loc1_);
            }
         }
         else if(_loc4_ == "int")
         {
            if(!(_loc1_ is int))
            {
               _loc1_ = int(_loc1_);
            }
         }
         else if(_loc4_ == "Number")
         {
            if(!(_loc1_ is Number))
            {
               _loc1_ = Number(_loc1_);
            }
         }
         else if(_loc4_ == "Boolean")
         {
            if(!(_loc1_ is Boolean))
            {
               _loc6_ = _loc1_.toString();
               if(_loc6_)
               {
                  _loc1_ = _loc6_.toLowerCase() == "true" ? true : false;
               }
            }
         }
         if(Boolean(_loc2_) && _loc3_[_loc2_] !== _loc1_)
         {
            _loc3_[_loc2_] = _loc1_;
            this._5598.dataProvider._4016(_loc3_);
         }
         return true;
      }
      
      protected function validate() : Boolean
      {
         return true;
      }
      
      private function _7908(param1:MouseEvent) : void
      {
         if(param1.cancelable)
         {
            param1.preventDefault();
         }
      }
      
      private function _4089(param1:MouseEvent) : void
      {
         var _loc2_:Point = this._5598.parent.globalToLocal(new Point(param1.stageX,param1.stageY));
         param1.localX = _loc2_.x;
         param1.localY = _loc2_.y;
         this._5598.parent.dispatchEvent(param1);
         param1.stopPropagation();
      }
   }
}

