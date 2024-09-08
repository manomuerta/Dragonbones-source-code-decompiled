package _1049
{
   import _1045.DataGrid;
   import _1045.Grid;
   import _1177.GridEvent;
   import _1177.GridItemEditorEvent;
   import _1177.UIEvent;
   import egret.core._1121;
   import egret.core._1124;
   import egret.core._1130;
   import egret.core._1133;
   import egret.core.ns_egret;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.InteractiveObject;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.IEventDispatcher;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.ui.Keyboard;
   import flash.utils.Timer;
   
   use namespace ns_egret;
   
   public class _1051
   {
      private var _7797:Timer;
      
      private var _7784:Boolean;
      
      private var _7795:Boolean;
      
      private var _7805:Event;
      
      private var _7774:Object;
      
      private var _7801:_1133;
      
      private var _7778:*;
      
      private var _7754:DataGrid;
      
      private var _7786:Object;
      
      private var _7806:Boolean = false;
      
      public var _7502:_1065;
      
      private var _7785:_1133;
      
      public var _7771:Class;
      
      public function _1051(param1:DataGrid)
      {
         super();
         this._7754 = param1;
      }
      
      public function get _5598() : DataGrid
      {
         return this._7754;
      }
      
      public function get grid() : Grid
      {
         return this._7754.grid;
      }
      
      public function get _7791() : Object
      {
         if(this._7786)
         {
            return {
               "_6589":this._7786._6589,
               "columnIndex":this._7786.columnIndex
            };
         }
         return this._7786;
      }
      
      public function set _7791(param1:Object) : void
      {
         if(!param1)
         {
            this._7781(null);
            return;
         }
         var _loc2_:Object = {
            "_6589":param1._6589,
            "columnIndex":param1.columnIndex
         };
         this._7781(_loc2_);
      }
      
      private function _7781(param1:Object) : void
      {
         if(!this.grid.enabled || !this._5598.editable)
         {
            return;
         }
         if(!this.grid.dataProvider || this.grid.dataProvider.length == 0)
         {
            return;
         }
         if(this._7502 && param1 && this._7502 is _1130 && this._7786._6589 == param1._6589 && this._7786.columnIndex == param1.columnIndex)
         {
            _1130(this._7502)._2581();
            return;
         }
         if(this._7502)
         {
            if(!this._5598._6628())
            {
               return;
            }
         }
         this._7786 = param1;
         if(!param1)
         {
            return;
         }
         var _loc2_:int = int(param1._6589);
         var _loc3_:int = int(param1.columnIndex);
         this._5598._7497(_loc2_,_loc3_);
         this.ns_egret::_7796(_loc2_,_loc3_);
         if(this._7502 is _1121)
         {
            _1121(this._7502)._2449();
         }
         var _loc4_:_1053 = this._5598.columns.getItemAt(_loc3_) as _1053;
         this._7778 = this._7786;
         var _loc5_:GridItemEditorEvent = null;
         if(_loc4_._6602 == false)
         {
            _loc5_ = new GridItemEditorEvent(GridItemEditorEvent.GRID_ITEM_EDITOR_SESSION_START);
         }
         if(_loc5_)
         {
            _loc5_.columnIndex = this._7791.columnIndex;
            _loc5_.column = _loc4_;
            _loc5_._6589 = this._7791._6589;
            this._5598.dispatchEvent(_loc5_);
         }
      }
      
      public function get _7790() : _1133
      {
         return this._7785;
      }
      
      public function get _7509() : int
      {
         if(this._7791)
         {
            return this._7791.columnIndex;
         }
         return -1;
      }
      
      public function get _7533() : int
      {
         if(this._7791)
         {
            return this._7791._6589;
         }
         return -1;
      }
      
      public function initialize() : void
      {
         var _loc1_:Grid = this._5598.grid;
         this._5598.addEventListener(KeyboardEvent.KEY_DOWN,this._7767);
         _loc1_.addEventListener(GridEvent.GRID_MOUSE_DOWN,this._7772,false,1000);
         _loc1_.addEventListener(GridEvent.GRID_MOUSE_UP,this._7775,false,1000);
         _loc1_.addEventListener(GridEvent.GRID_DOUBLE_CLICK,this._7768);
      }
      
      public function _7553() : void
      {
         this.grid.removeEventListener(KeyboardEvent.KEY_DOWN,this._7767);
         this.grid.removeEventListener(GridEvent.GRID_MOUSE_DOWN,this._7772);
         this.grid.removeEventListener(GridEvent.GRID_MOUSE_UP,this._7775);
         this.grid.removeEventListener(GridEvent.GRID_DOUBLE_CLICK,this._7768);
      }
      
      ns_egret function _7792() : void
      {
         var _loc2_:_1133 = null;
         if(this.grid.root)
         {
            this.grid._1558.addEventListener(Event.DEACTIVATE,this._7794,false,0,true);
         }
         var _loc1_:Stage = this.grid._1558.stage;
         _loc1_.removeEventListener(MouseEvent.MOUSE_DOWN,this._7765,true);
         _loc1_.removeEventListener(MouseEvent.MOUSE_DOWN,this._7765);
         _loc1_.removeEventListener(Event.RESIZE,this._7769);
         this._5598.removeEventListener(Event.RESIZE,this._7769);
         if(Boolean(this._7502) || Boolean(this._7790))
         {
            if(this._7502)
            {
               this._7502.discard();
            }
            if(this._7502)
            {
               _loc2_ = this._7502;
            }
            else
            {
               _loc2_ = this._7790;
            }
            _loc2_.removeEventListener(KeyboardEvent.KEY_DOWN,this._7780);
            _loc2_.removeEventListener(FocusEvent.FOCUS_OUT,this._7779);
            this._7764(DisplayObject(_loc2_),false);
            this._5598._2581();
            if(this._7502)
            {
               this.grid.removeElement(this._7502);
            }
            else
            {
               this.grid.invalidateDisplayList();
            }
            this._7502 = null;
            this._7785 = null;
            this._7786 = null;
         }
      }
      
      ns_egret function _7796(param1:int, param2:int) : void
      {
         var _loc8_:Class = null;
         var _loc9_:IEventDispatcher = null;
         if(param2 >= this.grid.columns.length)
         {
            return;
         }
         var _loc3_:_1053 = this.grid.columns.getItemAt(param2) as _1053;
         var _loc4_:_1066 = this.grid._7711(param1,param2);
         var _loc5_:Rectangle = this.grid._7738(param1,param2);
         var _loc6_:Point = _loc5_.topLeft;
         this._7785 = _loc4_;
         if(!_loc3_._6602)
         {
            _loc8_ = _loc3_._6573;
            if(!_loc8_)
            {
               _loc8_ = this._5598._6573;
            }
            if(!_loc8_)
            {
               _loc8_ = _1053.ns_egret::_7793;
            }
            if(_loc8_ == _1053.ns_egret::_7793)
            {
               if(this._7771)
               {
                  _loc8_ = _loc3_._6573 = this._7771;
               }
            }
            this._7502 = new _loc8_() as _1065;
            this._7502._6967(this._5598);
            this._7502._6589 = param1;
            this._7502.column = _loc3_;
            this.grid.addElement(this._7502);
            this._7502.data = _loc4_.data;
            this._7502.width = _loc5_.width + 1;
            this._7502.height = _loc5_.height + 1;
            this._7502._7777(_loc6_.x,_loc6_.y);
            if(this._7502 is _1121)
            {
               _1121(this._7502)._2449();
            }
            this._7502.prepare();
            this._7502.visible = true;
         }
         else if(_loc4_ is _1130)
         {
            _1130(_loc4_)._2581();
         }
         if(this._7502 != null || this._7790 != null)
         {
            if(this._7502)
            {
               _loc9_ = this._7502;
            }
            else
            {
               _loc9_ = this._7790;
            }
            _loc9_.addEventListener(FocusEvent.FOCUS_OUT,this._7779);
            _loc9_.addEventListener(KeyboardEvent.KEY_DOWN,this._7780);
            this._7764(DisplayObject(_loc9_),true);
         }
         this.grid.invalidateDisplayList();
         if(this.grid.root)
         {
            this.grid._1558.addEventListener(Event.DEACTIVATE,this._7794,false,0,true);
         }
         var _loc7_:Stage = this.grid._1558.stage;
         _loc7_.addEventListener(MouseEvent.MOUSE_DOWN,this._7765,true,0,true);
         _loc7_.addEventListener(MouseEvent.MOUSE_DOWN,this._7765,false,0,true);
         this.grid._1558.addEventListener(Event.RESIZE,this._7769);
         this.grid.addEventListener(Event.RESIZE,this._7769);
      }
      
      private function _7770() : Boolean
      {
         if(this._7805)
         {
            if(this._7805.type == FocusEvent.KEY_FOCUS_CHANGE && FocusEvent(this._7805).shiftKey)
            {
               return true;
            }
            if(this._7805.type == KeyboardEvent.KEY_DOWN && KeyboardEvent(this._7805).keyCode == Keyboard.TAB && KeyboardEvent(this._7805).shiftKey)
            {
               return true;
            }
         }
         return false;
      }
      
      public function _6626(param1:int, param2:int) : Boolean
      {
         if(!this._7789(param1,param2))
         {
            return false;
         }
         this._5598.addEventListener(GridItemEditorEvent.GRID_ITEM_EDITOR_SESSION_STARTING,this._7763,false,-50);
         var _loc3_:_1053 = this.grid.columns.getItemAt(param2) as _1053;
         if(!_loc3_ || !_loc3_.visible)
         {
            return false;
         }
         var _loc4_:GridItemEditorEvent;
         (_loc4_ = new GridItemEditorEvent(GridItemEditorEvent.GRID_ITEM_EDITOR_SESSION_STARTING,false,true))._6589 = Math.min(param1,this.grid.dataProvider.length - 1);
         _loc4_.columnIndex = Math.min(param2,this.grid.columns.length - 1);
         _loc4_.column = _loc3_;
         var _loc5_:Boolean = false;
         if(_loc3_._6602 == true)
         {
            this._7763(_loc4_);
            _loc5_ = true;
         }
         else
         {
            _loc5_ = this._5598.dispatchEvent(_loc4_);
         }
         if(_loc5_)
         {
            this._7778 = {
               "columnIndex":param2,
               "_6589":param1
            };
            this._5598.grid._7548 = param1;
            this._5598.grid._7514 = param2;
         }
         this._5598.removeEventListener(GridItemEditorEvent.GRID_ITEM_EDITOR_SESSION_STARTING,this._7763);
         return _loc5_;
      }
      
      public function _6628(param1:Boolean = false) : Boolean
      {
         if(param1)
         {
            this.ns_egret::_7802();
            return false;
         }
         return this._7807();
      }
      
      ns_egret function _7802() : void
      {
         if(this._7502)
         {
            this._7787();
            this.ns_egret::_7792();
         }
         else if(this._7790)
         {
            this.ns_egret::_7792();
         }
      }
      
      private function _7787() : void
      {
         var _loc1_:GridItemEditorEvent = new GridItemEditorEvent(GridItemEditorEvent.GRID_ITEM_EDITOR_SESSION_CANCEL);
         _loc1_.columnIndex = this._7791.columnIndex;
         _loc1_.column = this._7502.column;
         _loc1_._6589 = this._7791._6589;
         this._5598.dispatchEvent(_loc1_);
      }
      
      private function _7807() : Boolean
      {
         if(!this._7502 && Boolean(this._7790))
         {
            this._7806 = true;
            this.ns_egret::_7792();
            this._7806 = false;
            return true;
         }
         if(!this._7502)
         {
            return false;
         }
         this._7806 = true;
         var _loc1_:Object = this._7791;
         if(!this._7782())
         {
            this._7787();
            this._7806 = false;
            return false;
         }
         var _loc2_:GridItemEditorEvent = new GridItemEditorEvent(GridItemEditorEvent.GRID_ITEM_EDITOR_SESSION_SAVE,false,true);
         _loc2_.columnIndex = _loc1_.columnIndex;
         _loc2_.column = this._5598.columns.getItemAt(_loc1_.columnIndex) as _1053;
         _loc2_._6589 = _loc1_._6589;
         this._5598.dispatchEvent(_loc2_);
         this._7806 = false;
         return true;
      }
      
      private function _7782() : Boolean
      {
         var _loc1_:Boolean = false;
         if(this._7502)
         {
            _loc1_ = this._7502.save();
            if(_loc1_)
            {
               this.ns_egret::_7792();
            }
         }
         return _loc1_;
      }
      
      private function _7766(param1:int, param2:int, param3:Boolean) : Boolean
      {
         var _loc4_:Point = new Point(param1,param2);
         var _loc5_:Boolean = false;
         do
         {
            _loc4_ = this._7783(_loc4_.x,_loc4_.y,param3);
            if(_loc4_)
            {
               _loc5_ = this._5598._6626(_loc4_.x,_loc4_.y);
            }
         }
         while(Boolean(_loc4_) && !_loc5_);
         
         return _loc5_;
      }
      
      private function _7783(param1:int, param2:int, param3:Boolean) : Point
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc4_:int = param3 ? -1 : 1;
         while(true)
         {
            _loc5_ = param2 + _loc4_;
            if(_loc5_ >= 0 && _loc5_ < this._5598.columns.length)
            {
               param2 += _loc4_;
            }
            else
            {
               param2 = param3 ? this._5598.grid.columns.length - 1 : 0;
               _loc6_ = param1 + _loc4_;
               if(!(_loc6_ >= 0 && _loc6_ < this._5598.dataProvider.length))
               {
                  break;
               }
               param1 += _loc4_;
            }
            if(this._7800(param2))
            {
               return new Point(param1,param2);
            }
         }
         return null;
      }
      
      private function _7800(param1:int) : Boolean
      {
         var _loc2_:_1053 = this.grid.columns.getItemAt(param1) as _1053;
         return this._5598.editable && _loc2_.editable && _loc2_.visible;
      }
      
      private function _7773(param1:int, param2:int) : Boolean
      {
         if(this._5598.ns_egret::_7504())
         {
            return this._5598._7481(param1);
         }
         if(this._5598.ns_egret::_7496())
         {
            return this._5598._7487(param1,param2);
         }
         return false;
      }
      
      private function _7789(param1:int, param2:int) : Boolean
      {
         if(param1 >= 0 && param1 < this._5598.dataProvider.length && param2 >= 0 && param2 < this._5598.columns.length)
         {
            return true;
         }
         return false;
      }
      
      private function _7764(param1:DisplayObject, param2:Boolean) : void
      {
         var _loc3_:DisplayObjectContainer = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:DisplayObject = null;
         if(param2)
         {
            param1.addEventListener(UIEvent.ENTER,this._7788);
         }
         else
         {
            param1.removeEventListener(UIEvent.ENTER,this._7788);
         }
         if(param1 is DisplayObjectContainer)
         {
            _loc3_ = DisplayObjectContainer(param1);
            _loc4_ = _loc3_.numChildren;
            _loc5_ = 0;
            while(_loc5_ < _loc4_)
            {
               _loc6_ = _loc3_.getChildAt(_loc5_);
               if(_loc6_ is DisplayObjectContainer)
               {
                  this._7764(_loc6_,param2);
               }
               else if(param2)
               {
                  _loc6_.addEventListener(UIEvent.ENTER,this._7788);
               }
               else
               {
                  _loc6_.removeEventListener(UIEvent.ENTER,this._7788);
               }
               _loc5_++;
            }
         }
      }
      
      private function _7798(param1:Event) : Boolean
      {
         var _loc2_:_1130 = null;
         if(param1 is MouseEvent)
         {
            _loc2_ = this._7799(DisplayObject(param1.target));
            if(_loc2_)
            {
               return this._7803(_loc2_);
            }
         }
         return false;
      }
      
      private function _7803(param1:_1130) : Boolean
      {
         var child:_1130 = param1;
         var isOwner:Function = function(param1:Object, param2:Object):Boolean
         {
            if(param1.contains(param2))
            {
               return true;
            }
            while(Boolean(param2) && param2 != param1)
            {
               if(param2 is _1124)
               {
                  param2 = _1124(param2)._6081;
               }
               else if(param2 is _1130)
               {
                  param2 = _1130(param2).owner;
               }
               else
               {
                  param2 = param2.parent;
               }
            }
            return param2 == param1;
         };
         return Boolean(this._7502) && isOwner(this._7502,child) || Boolean(this._7790) && isOwner(this._7790,child);
      }
      
      private function _7799(param1:DisplayObject) : _1130
      {
         if(param1 is _1130)
         {
            return _1130(param1);
         }
         var _loc2_:DisplayObject = param1.parent;
         while(_loc2_)
         {
            if(_loc2_ is _1130)
            {
               return _1130(_loc2_);
            }
            _loc2_ = _loc2_.parent;
         }
         return null;
      }
      
      private function _7763(param1:GridItemEditorEvent) : void
      {
         if(!param1.isDefaultPrevented())
         {
            this._7781({
               "columnIndex":param1.column.columnIndex,
               "_6589":param1._6589
            });
         }
         else if(!this._7502)
         {
            this._7786 = null;
            this._5598._2581();
         }
      }
      
      private function _7767(param1:KeyboardEvent) : void
      {
         var _loc2_:Point = null;
         var _loc3_:int = 0;
         if(!this._5598.editable || this._5598._6609 == _1063.NONE)
         {
            return;
         }
         if(param1.isDefaultPrevented())
         {
            return;
         }
         this._7805 = param1;
         if(param1.keyCode == this._5598.ns_egret::_7574)
         {
            if(this._7502)
            {
               return;
            }
            _loc2_ = null;
            if(this._5598.ns_egret::_7504())
            {
               _loc3_ = !!this._7778 ? int(this._7778.columnIndex) : 0;
               this._7766(this._5598.grid._7548,_loc3_ - 1,false);
               return;
            }
            if(this._7800(this.grid._7514))
            {
               this._5598._6626(this.grid._7548,this.grid._7514);
            }
         }
      }
      
      private function _7772(param1:GridEvent) : void
      {
         this._7784 = false;
         if(!this._5598.editable || this._7798(param1))
         {
            return;
         }
         if(!this._7789(param1._6589,param1.columnIndex))
         {
            return;
         }
         this._7805 = param1;
         var _loc2_:int = param1._6589;
         var _loc3_:int = param1.columnIndex;
         var _loc4_:_1066 = param1.itemRenderer;
         this._7801 = null;
         if(param1.shiftKey || param1.ctrlKey)
         {
            return;
         }
         if(this._7502)
         {
            if(!this._5598._6628())
            {
               this._5598._6628(true);
            }
            return;
         }
         var _loc5_:_1053 = this._5598.columns.getItemAt(_loc3_) as _1053;
         if(Boolean(_loc4_) && (_loc5_._6602 || this._5598._7543 || this._7773(_loc2_,_loc3_)))
         {
            this._7801 = _loc4_;
         }
      }
      
      private function _7775(param1:GridEvent) : void
      {
         if(!this._5598.editable)
         {
            return;
         }
         if(!this._7789(param1._6589,param1.columnIndex))
         {
            return;
         }
         this._7805 = param1;
         var _loc2_:int = param1._6589;
         var _loc3_:int = param1.columnIndex;
         if(this._5598._7526 != 1)
         {
            return;
         }
         var _loc4_:int = _loc2_;
         var _loc5_:int = _loc3_;
         var _loc6_:_1133 = param1.itemRenderer;
         if((_loc6_) && _loc6_ != this._7790 && this._7801 && this._7801 == _loc6_)
         {
            if(_loc5_ >= 0)
            {
               if(this.grid.columns.getItemAt(_loc5_).editable)
               {
                  if(this._7797)
                  {
                     if(_loc4_ == this._7774._6589 && _loc5_ == this._7774.columnIndex)
                     {
                        this._7801 == null;
                        return;
                     }
                     this._7797.stop();
                     this._7797 = null;
                  }
                  this._7774 = {
                     "columnIndex":_loc5_,
                     "_6589":_loc4_
                  };
                  if(this._5598.ns_egret::_7508 || InteractiveObject(this._7801).doubleClickEnabled == false)
                  {
                     this._5598._6626(_loc4_,_loc5_);
                  }
                  else
                  {
                     this._7797 = new Timer(this._5598.ns_egret::_7519,1);
                     this._7797.addEventListener(TimerEvent.TIMER,this._7776);
                     this._7797.start();
                  }
               }
            }
         }
         this._7801 = null;
      }
      
      private function _7768(param1:GridEvent) : void
      {
         if(!this._5598.editable)
         {
            return;
         }
         if(!this._7789(param1._6589,param1.columnIndex))
         {
            return;
         }
         this._7805 = param1;
         this._7784 = true;
      }
      
      private function _7776(param1:TimerEvent) : void
      {
         this._7797.removeEventListener(TimerEvent.TIMER,this._7776);
         this._7797 = null;
         if(!this._7784)
         {
            this._5598._6626(this._7774._6589,this._7774.columnIndex);
         }
         this._7784 = false;
      }
      
      private function _7794(param1:Event) : void
      {
         if(Boolean(this._7502) || Boolean(this._7790))
         {
            if(!this._5598._6628())
            {
               this._5598._6628(true);
            }
            this._5598._2581();
         }
      }
      
      private function _7779(param1:FocusEvent) : void
      {
         var _loc2_:_1130 = null;
         if(param1.relatedObject)
         {
            _loc2_ = this._7799(param1.relatedObject);
            if(Boolean(_loc2_) && this._7803(_loc2_))
            {
               return;
            }
         }
         if(!param1.relatedObject)
         {
            return;
         }
         if(Boolean(this._7502) || Boolean(this._7790))
         {
            if(!this._5598._6628())
            {
               this._5598._6628(true);
            }
         }
      }
      
      private function _7788(param1:Event) : void
      {
         if(param1 is UIEvent)
         {
            this._7795 = true;
         }
      }
      
      private function _7780(param1:KeyboardEvent) : void
      {
         if(param1.isDefaultPrevented())
         {
            if(!(param1.charCode == Keyboard.ENTER && this._7795))
            {
               this._7795 = false;
               return;
            }
         }
         this._7795 = false;
         if(param1.keyCode == Keyboard.ESCAPE)
         {
            this.ns_egret::_7802();
         }
         else if(param1.ctrlKey && param1.charCode == 46)
         {
            this.ns_egret::_7802();
         }
         param1.stopPropagation();
      }
      
      private function _7769(param1:Event) : void
      {
         if(!this._5598._6628())
         {
            this._5598._6628(true);
         }
      }
      
      private function _7765(param1:Event) : void
      {
         if(this._7798(param1))
         {
            return;
         }
         if(this._5598._2491 && this._5598._2491.contains(DisplayObject(param1.target)) && !this.grid.contains(DisplayObject(param1.target)))
         {
            return;
         }
         if(!this._5598._6628())
         {
            this._5598._6628(true);
         }
         this._5598._2581();
      }
   }
}

