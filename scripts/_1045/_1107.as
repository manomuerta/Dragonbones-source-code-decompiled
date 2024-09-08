package _1045
{
   import _1038._1039;
   import _1177.CollectionEvent;
   import _1177.ElementExistenceEvent;
   import _1177.UIEvent;
   import _1177._1178;
   import _1185._1186;
   import _1193._1192;
   import egret.core._1132;
   import egret.core._1133;
   import egret.core.ns_egret;
   import flash.display.DisplayObject;
   import flash.events.Event;
   
   use namespace ns_egret;
   
   public class _1107 extends Group implements _1132, _1039
   {
      ns_egret static const NO_PROPOSED_SELECTION:int = -2;
      
      private var _8557:Boolean = false;
      
      private var _8623:_1133;
      
      private var _8621:int = -2;
      
      ns_egret var _2480:int = -1;
      
      private var _8624:Boolean = false;
      
      private var _8622:Boolean = false;
      
      public function _1107()
      {
         super();
         super.layout = new _1186();
      }
      
      override public function get layout() : _1192
      {
         return super.layout;
      }
      
      override public function set layout(param1:_1192) : void
      {
      }
      
      public function get _8558() : Boolean
      {
         return this._8557;
      }
      
      public function set _8558(param1:Boolean) : void
      {
         var _loc2_:Array = null;
         var _loc3_:_1133 = null;
         if(this._8557 == param1)
         {
            return;
         }
         this._8557 = param1;
         if(this._8557)
         {
            _loc2_ = ns_egret::_7409();
            for each(_loc3_ in _loc2_)
            {
               if(_loc3_ is DisplayObject && _loc3_.parent != this)
               {
                  this._8622 = true;
                  ns_egret::_1607(DisplayObject(_loc3_));
               }
            }
            if(this._8622)
            {
               _2466();
            }
         }
      }
      
      public function get _7103() : _1133
      {
         var _loc1_:int = this.selectedIndex;
         if(_loc1_ >= 0 && _loc1_ < _2249)
         {
            return getElementAt(_loc1_);
         }
         return null;
      }
      
      public function set _7103(param1:_1133) : void
      {
         var _loc2_:int = getElementIndex(param1);
         if(_loc2_ >= 0 && _loc2_ < _2249)
         {
            this.ns_egret::_2475(_loc2_);
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
      
      ns_egret function _2475(param1:int, param2:Boolean = true) : void
      {
         if(param1 == this.selectedIndex)
         {
            return;
         }
         this._8621 = param1;
         _2466();
         dispatchEvent(new UIEvent(UIEvent.VALUE_COMMIT));
         this._8624 = this._8624 || param2;
      }
      
      override ns_egret function elementAdded(param1:_1133, param2:int, param3:Boolean = true) : void
      {
         if(this._8557)
         {
            if(param1 is DisplayObject)
            {
               ns_egret::addToDisplayListAt(DisplayObject(param1),param2);
            }
         }
         if(param3)
         {
            if(hasEventListener(ElementExistenceEvent.ELEMENT_ADD))
            {
               dispatchEvent(new ElementExistenceEvent(ElementExistenceEvent.ELEMENT_ADD,false,false,param1,param2));
            }
         }
         param1.visible = false;
         param1.includeInLayout = false;
         if(this.selectedIndex == -1)
         {
            this.ns_egret::_2475(param2,false);
         }
         else if(param2 <= this.selectedIndex && initialized)
         {
            this.ns_egret::_2475(this.selectedIndex + 1);
         }
         this._5853(_1178.ADD,param2,-1,[param1.name]);
      }
      
      override ns_egret function elementRemoved(param1:_1133, param2:int, param3:Boolean = true) : void
      {
         super.ns_egret::elementRemoved(param1,param2,param3);
         param1.visible = true;
         param1.includeInLayout = true;
         if(param2 == this.selectedIndex)
         {
            if(_2249 > 0)
            {
               if(param2 == 0)
               {
                  this._8621 = 0;
                  _2466();
               }
               else
               {
                  this.ns_egret::_2475(0,false);
               }
            }
            else
            {
               this.ns_egret::_2475(-1);
            }
         }
         else if(param2 < this.selectedIndex)
         {
            this.ns_egret::_2475(this.selectedIndex - 1);
         }
         this._5853(_1178.REMOVE,param2,-1,[param1.name]);
      }
      
      override protected function _2476() : void
      {
         var _loc1_:Array = null;
         var _loc2_:_1133 = null;
         super._2476();
         if(this._8621 != ns_egret::NO_PROPOSED_SELECTION)
         {
            this._2477(this._8621);
            this._8621 = ns_egret::NO_PROPOSED_SELECTION;
         }
         if(this._8622)
         {
            this._8622 = false;
            _loc1_ = ns_egret::_7409();
            for each(_loc2_ in _loc1_)
            {
               if(_loc2_ is DisplayObject && _loc2_.parent == this)
               {
                  ns_egret::_1607(DisplayObject(_loc2_));
               }
            }
         }
         if(this._8624)
         {
            this._8624 = true;
            dispatchEvent(new Event("IndexChanged"));
         }
      }
      
      private function _2477(param1:int) : void
      {
         var _loc2_:int = this.ns_egret::_2480;
         if(param1 >= 0 && param1 < _2249)
         {
            this.ns_egret::_2480 = param1;
            if(Boolean(this._8623) && this._8623.parent == this)
            {
               this._8623.visible = false;
               this._8623.includeInLayout = false;
            }
            this._8623 = getElementAt(this.ns_egret::_2480);
            this._8623.visible = true;
            this._8623.includeInLayout = true;
            if(this._8623.parent != this && this._8623 is DisplayObject)
            {
               if(this.stage)
               {
                  ns_egret::_1607(DisplayObject(this._8623));
                  if(!this._8622)
                  {
                     this._8622 = true;
                  }
               }
            }
         }
         else
         {
            this._8623 = null;
            this.ns_egret::_2480 = -1;
         }
         invalidateSize();
         invalidateDisplayList();
      }
      
      public function get length() : int
      {
         return _2249;
      }
      
      public function getItemAt(param1:int) : Object
      {
         var _loc2_:_1133 = getElementAt(param1);
         if(_loc2_)
         {
            return _loc2_.name;
         }
         return "";
      }
      
      public function getItemIndex(param1:Object) : int
      {
         var _loc2_:Array = ns_egret::_7409();
         var _loc3_:int = int(_loc2_.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if(_loc2_[_loc4_].name === param1)
            {
               return _loc4_;
            }
            _loc4_++;
         }
         return -1;
      }
      
      public function _4016(param1:Object) : void
      {
         var _loc2_:int = this.getItemIndex(param1);
         if(_loc2_ != -1)
         {
            this._5853(_1178.UPDATE,_loc2_,-1,[param1]);
         }
      }
      
      private function _5853(param1:String = null, param2:int = -1, param3:int = -1, param4:Array = null, param5:Array = null) : void
      {
         var _loc6_:CollectionEvent = new CollectionEvent(CollectionEvent.COLLECTION_CHANGE,false,false,param1,param2,param3,param4,param5);
         dispatchEvent(_loc6_);
      }
   }
}

