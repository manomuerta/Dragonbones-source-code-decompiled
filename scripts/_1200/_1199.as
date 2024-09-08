package _1200
{
   import _1146.Move;
   import _1146.Scale;
   import _1177.DragEvent;
   import _1177.EffectEvent;
   import egret.core._1111;
   import egret.core._1140;
   import egret.core._1141;
   import egret.core.ns_egret;
   import egret.managers.DragManager;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.InteractiveObject;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   use namespace ns_egret;
   
   public class _1199 extends _1140
   {
      public var _1605:Function;
      
      public var _1606:Function;
      
      public var _1616:Function;
      
      private var _8959:MouseEvent;
      
      private var _8960:Stage;
      
      public var dragInitiator:InteractiveObject;
      
      public var _1611:_1111;
      
      public var xOffset:Number;
      
      public var yOffset:Number;
      
      public var _1614:Number;
      
      public var _1617:Number;
      
      public var target:DisplayObject = null;
      
      public function _1199(param1:InteractiveObject, param2:_1111)
      {
         super();
         mouseChildren = false;
         mouseEnabled = false;
         this.dragInitiator = param1;
         this._1611 = param2;
         this._8960 = param1.stage;
         if(!this._8960)
         {
            this._8960 = _1141.ns_egret::_1615[0];
         }
         var _loc3_:IEventDispatcher = this._8960;
         _loc3_.addEventListener(MouseEvent.MOUSE_MOVE,this._4089);
         _loc3_.addEventListener(MouseEvent.MOUSE_UP,this._4093);
         _loc3_.addEventListener(Event.MOUSE_LEAVE,this._8957);
      }
      
      private static function getObjectsUnderPoint(param1:DisplayObject, param2:Point, param3:Array) : void
      {
         var _loc4_:DisplayObjectContainer = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:DisplayObject = null;
         if(!param1.visible)
         {
            return;
         }
         if(param1 is Stage || param1.hitTestPoint(param2.x,param2.y,true))
         {
            if(param1 is InteractiveObject && InteractiveObject(param1).mouseEnabled)
            {
               param3.push(param1);
            }
            if(param1 is DisplayObjectContainer)
            {
               _loc4_ = param1 as DisplayObjectContainer;
               if(_loc4_.mouseChildren && Boolean(_loc4_.numChildren))
               {
                  _loc5_ = _loc4_.numChildren;
                  _loc6_ = 0;
                  while(_loc6_ < _loc5_)
                  {
                     try
                     {
                        _loc7_ = _loc4_.getChildAt(_loc6_);
                        getObjectsUnderPoint(_loc7_,param2,param3);
                     }
                     catch(e:Error)
                     {
                     }
                     _loc6_++;
                  }
               }
            }
         }
      }
      
      override protected function _2438() : void
      {
         super._2438();
         if(!this._8960.focus)
         {
            _2581();
         }
      }
      
      private function _8958(param1:String, param2:MouseEvent, param3:Object) : void
      {
         var _loc4_:DragEvent = new DragEvent(param1);
         var _loc5_:Point = new Point();
         _loc4_.dragInitiator = this.dragInitiator;
         _loc4_._1611 = this._1611;
         _loc4_.ctrlKey = param2.ctrlKey;
         _loc4_.altKey = param2.altKey;
         _loc4_.shiftKey = param2.shiftKey;
         _loc5_.x = this._8959.localX;
         _loc5_.y = this._8959.localY;
         _loc5_ = DisplayObject(this._8959.target).localToGlobal(_loc5_);
         _loc5_ = DisplayObject(param3).globalToLocal(_loc5_);
         _loc4_.localX = _loc5_.x;
         _loc4_.localY = _loc5_.y;
         IEventDispatcher(param3).dispatchEvent(_loc4_);
      }
      
      private function _4089(param1:MouseEvent) : void
      {
         var _loc2_:DragEvent = null;
         var _loc3_:DisplayObject = null;
         var _loc4_:int = 0;
         var _loc10_:Array = null;
         var _loc13_:Boolean = false;
         var _loc14_:DisplayObject = null;
         this._8959 = param1;
         var _loc5_:Point = new Point();
         var _loc6_:Point = new Point(param1.localX,param1.localY);
         var _loc7_:Point = DisplayObject(param1.target).localToGlobal(_loc6_);
         _loc6_ = parent.globalToLocal(_loc7_);
         var _loc8_:Number = _loc6_.x;
         var _loc9_:Number = _loc6_.y;
         x = _loc8_ - this.xOffset;
         y = _loc9_ - this.yOffset;
         if(!param1)
         {
            return;
         }
         _loc10_ = [];
         _1199.getObjectsUnderPoint(this._8960,_loc7_,_loc10_);
         var _loc11_:DisplayObject = null;
         var _loc12_:int = int(_loc10_.length - 1);
         while(_loc12_ >= 0)
         {
            _loc11_ = _loc10_[_loc12_];
            if(_loc11_ != this && !contains(_loc11_))
            {
               break;
            }
            _loc12_--;
         }
         if(this.target)
         {
            _loc13_ = false;
            _loc14_ = this.target;
            _loc3_ = _loc11_;
            while(_loc3_)
            {
               if(_loc3_ == this.target)
               {
                  this._8958(DragEvent.DRAG_OVER,param1,_loc3_);
                  _loc13_ = true;
                  break;
               }
               this._8958(DragEvent.DRAG_ENTER,param1,_loc3_);
               if(this.target == _loc3_)
               {
                  _loc13_ = false;
                  break;
               }
               _loc3_ = _loc3_.parent;
            }
            if(!_loc13_)
            {
               this._8958(DragEvent.DRAG_EXIT,param1,_loc14_);
               if(this.target == _loc14_)
               {
                  this.target = null;
               }
               if(this._1605 != null)
               {
                  this._1605();
               }
            }
            else if(this._1606 != null)
            {
               this._1606();
            }
         }
         if(!this.target)
         {
            _loc3_ = _loc11_;
            while(_loc3_)
            {
               if(_loc3_ != this)
               {
                  this._8958(DragEvent.DRAG_ENTER,param1,_loc3_);
                  if(this.target)
                  {
                     break;
                  }
               }
               _loc3_ = _loc3_.parent;
            }
            if(this._1605 != null)
            {
               this._1605();
            }
         }
         if(_1141._8368)
         {
            param1.updateAfterEvent();
         }
      }
      
      private function _8957(param1:Event) : void
      {
         this._4093(this._8959);
      }
      
      private function _4093(param1:MouseEvent) : void
      {
         var _loc3_:DragEvent = null;
         var _loc4_:Point = null;
         var _loc5_:Scale = null;
         var _loc6_:Move = null;
         var _loc7_:Move = null;
         if(this._1616 != null)
         {
            this._1616();
         }
         var _loc2_:IEventDispatcher = this._8960;
         _loc2_.removeEventListener(MouseEvent.MOUSE_MOVE,this._4089);
         _loc2_.removeEventListener(MouseEvent.MOUSE_UP,this._4093);
         _loc2_.removeEventListener(Event.MOUSE_LEAVE,this._8957);
         if(this.target)
         {
            _loc3_ = new DragEvent(DragEvent.DRAG_DROP);
            _loc3_.dragInitiator = this.dragInitiator;
            _loc3_._1611 = this._1611;
            if(param1)
            {
               _loc3_.ctrlKey = param1.ctrlKey;
               _loc3_.altKey = param1.altKey;
               _loc3_.shiftKey = param1.shiftKey;
            }
            (_loc4_ = new Point()).x = this._8959.localX;
            _loc4_.y = this._8959.localY;
            _loc4_ = DisplayObject(this._8959.target).localToGlobal(_loc4_);
            _loc4_ = DisplayObject(this.target).globalToLocal(_loc4_);
            _loc3_.localX = _loc4_.x;
            _loc3_.localY = _loc4_.y;
            this.target.dispatchEvent(_loc3_);
            _loc5_ = new Scale(this);
            _loc5_._8904 = _loc5_._8903 = 1;
            _loc5_._8906 = _loc5_._8908 = 0;
            _loc5_.duration = 200;
            _loc5_.play();
            _loc6_ = new Move(this);
            _loc6_.addEventListener(EffectEvent.EFFECT_END,this._8833);
            _loc6_._8762 = x;
            _loc6_._8896 = y;
            _loc6_._8898 = parent.mouseX;
            _loc6_._5460 = parent.mouseY;
            _loc6_.duration = 200;
            _loc6_.play();
         }
         else
         {
            _loc7_ = new Move(this);
            _loc7_.addEventListener(EffectEvent.EFFECT_END,this._8833);
            _loc7_._8762 = x;
            _loc7_._8896 = y;
            _loc7_._8898 = this._1614;
            _loc7_._5460 = this._1617;
            _loc7_.duration = 200;
            _loc7_.play();
         }
         _loc3_ = new DragEvent(DragEvent.DRAG_COMPLETE);
         _loc3_.dragInitiator = this.dragInitiator;
         _loc3_._1611 = this._1611;
         _loc3_.relatedObject = InteractiveObject(this.target);
         if(param1)
         {
            _loc3_.ctrlKey = param1.ctrlKey;
            _loc3_.altKey = param1.altKey;
            _loc3_.shiftKey = param1.shiftKey;
         }
         this.dragInitiator.dispatchEvent(_loc3_);
         this._8959 = null;
      }
      
      private function _8833(param1:EffectEvent) : void
      {
         DragManager.ns_egret::endDrag();
      }
   }
}

