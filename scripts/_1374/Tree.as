package _1374
{
   import _1045.Tree;
   import _1045._1072;
   import _1088.TreeItemRenderer;
   import _1177.TreeEvent;
   import _1373._787;
   import _1421.TreeDragEvent;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.ui.Keyboard;
   import flash.utils.getTimer;
   
   public class Tree extends _1045.Tree
   {
      protected var _9814:_787;
      
      private var _9812:Boolean;
      
      private var _1679:Array;
      
      private var _9817:Number = 0;
      
      public function Tree()
      {
         this._1679 = [];
         super();
         this._2607 = new _787();
         this.doubleClickEnabled = true;
         this._9813 = true;
         this.addEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
      }
      
      protected function get _2607() : _787
      {
         return this._9814;
      }
      
      protected function set _2607(param1:_787) : void
      {
         this._9814 = param1;
         this._9816();
      }
      
      protected function _9816() : void
      {
         this._2607.init(this);
         this._2607._6005 = function(param1:Object, param2:Array):void
         {
            var _loc3_:TreeDragEvent = new TreeDragEvent(TreeDragEvent.ITEMS_DRAG_IN_COMPLETE);
            _loc3_._3597 = param2;
            _loc3_._4137 = param1;
            if(dispatchEvent(_loc3_))
            {
               _2607.doDrag(param1,param2);
            }
         };
         this._2607._6000 = function(param1:Object, param2:Array, param3:Boolean):void
         {
            var _loc4_:TreeDragEvent;
            (_loc4_ = new TreeDragEvent(TreeDragEvent.ITEMS_DRAG_MOVE_COMPLETE))._3597 = param2;
            _loc4_._4137 = param1;
            _loc4_._4136 = param3;
            if(dispatchEvent(_loc4_))
            {
               _2607._6035(param1,param2,param3);
            }
         };
         this._2607._6022 = function(param1:Array):void
         {
            var _loc2_:TreeDragEvent = new TreeDragEvent(TreeDragEvent.ITEMS_DRAG_START);
            _loc2_._3597 = param1;
            dispatchEvent(_loc2_);
         };
         this._2607._14011 = function():void
         {
            var _loc1_:TreeDragEvent = new TreeDragEvent(TreeDragEvent.ITEMS_DRAG_COMPLETE);
            dispatchEvent(_loc1_);
         };
      }
      
      public function get _6031() : Boolean
      {
         return this._2607._6031;
      }
      
      public function set _6031(param1:Boolean) : void
      {
         this._2607._6031 = param1;
      }
      
      public function get _6033() : Boolean
      {
         return this._2607._6033;
      }
      
      public function set _6033(param1:Boolean) : void
      {
         this._2607._6033 = param1;
      }
      
      public function get _3573() : Function
      {
         return this._2607._3573;
      }
      
      public function set _3573(param1:Function) : void
      {
         this._2607._3573 = param1;
      }
      
      public function get _3576() : Function
      {
         return this._2607._3576;
      }
      
      public function set _3576(param1:Function) : void
      {
         this._2607._3576 = param1;
      }
      
      public function get _6011() : Function
      {
         return this._2607._6011;
      }
      
      public function set _6011(param1:Function) : void
      {
         this._2607._6011 = param1;
      }
      
      public function get _4500() : Function
      {
         return this._2607._4500;
      }
      
      public function set _4500(param1:Function) : void
      {
         this._2607._4500 = param1;
      }
      
      public function get _9813() : Boolean
      {
         return this._9812;
      }
      
      public function set _9813(param1:Boolean) : void
      {
         this._9812 = param1;
         if(param1)
         {
            this.addEventListener(MouseEvent.DOUBLE_CLICK,this._9811);
         }
         else
         {
            this.removeEventListener(MouseEvent.DOUBLE_CLICK,this._9811);
         }
      }
      
      private function _9811(param1:MouseEvent) : void
      {
         var _loc3_:_1072 = null;
         var _loc4_:TreeEvent = null;
         var _loc2_:Object = param1.target;
         while(Boolean(_loc2_) && _loc2_ != this)
         {
            if(_loc2_ is _1072)
            {
               _loc3_ = _loc2_ as _1072;
               break;
            }
            _loc2_ = _loc2_.parent;
         }
         if(Boolean(_loc3_) && _loc3_._4521)
         {
            if(_loc3_ is TreeItemRenderer)
            {
               _loc2_ = param1.target;
               while(Boolean(_loc2_) && _loc2_ != _loc3_)
               {
                  if(TreeItemRenderer(_loc3_)._2615 == _loc2_)
                  {
                     return;
                  }
                  _loc2_ = _loc2_.parent;
               }
            }
            (_loc4_ = new TreeEvent(TreeEvent.ITEM_OPENING,false,true,_loc3_.itemIndex,_loc3_.data,_loc3_)).opening = !_loc3_.opened;
            _loc3_.dispatchEvent(_loc4_);
         }
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         super.partAdded(param1,param2);
         if(param2 == _2490)
         {
            this._2607._6023(_2490);
         }
      }
      
      protected function onKeyDown(param1:KeyboardEvent) : void
      {
         if(param1.altKey || param1.shiftKey || param1.ctrlKey)
         {
            return;
         }
         if(getTimer() - this._9817 > 500 || this._1679.length >= 3)
         {
            this._1679.length = 0;
         }
         this._9817 = getTimer();
         if(this._1679.length == 0 || param1.keyCode != this._1679[this._1679.length - 1])
         {
            this._1679.push(param1.keyCode);
         }
         var _loc2_:int = this._9815(param1.keyCode);
         if(_loc2_ < 0)
         {
            return;
         }
         selectedIndex = _loc2_;
         this._8098(selectedIndex);
         this._2581();
      }
      
      private function _9818(param1:Object) : Boolean
      {
         var _loc2_:String = _7442(param1).toLowerCase();
         if(!_loc2_ || _loc2_.length < this._1679.length)
         {
            return false;
         }
         var _loc3_:int = 0;
         while(_loc3_ < this._1679.length)
         {
            if(_loc2_.charCodeAt(_loc3_) - 32 != this._1679[_loc3_])
            {
               return false;
            }
            _loc3_++;
         }
         return true;
      }
      
      private function _9815(param1:uint) : int
      {
         if(param1 < Keyboard.A || param1 > Keyboard.Z)
         {
            return -1;
         }
         var _loc2_:int = -1;
         var _loc3_:int = Math.max(selectedIndex,0);
         var _loc4_:int = _loc3_ + 1;
         while(_loc4_ != _loc3_)
         {
            if(_loc4_ == dataProvider.length)
            {
               _loc4_ = 0;
            }
            else
            {
               if(this._9818(dataProvider.getItemAt(_loc4_)))
               {
                  return _loc4_;
               }
               _loc4_++;
            }
         }
         return -1;
      }
   }
}

