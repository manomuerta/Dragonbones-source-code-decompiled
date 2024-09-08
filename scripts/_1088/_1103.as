package _1088
{
   import _1045.Button;
   import _1177.ResizeEvent;
   import _1177.TrackBaseEvent;
   import _1177.UIEvent;
   import egret.core._1141;
   import egret.core.ns_egret;
   import flash.display.DisplayObject;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   use namespace ns_egret;
   
   public class _1103 extends _1095
   {
      private var _8232:Number = 300;
      
      public var _2557:Button;
      
      public var track:Button;
      
      ns_egret var _8522:Point;
      
      private var _8547:DisplayObject;
      
      public function _1103()
      {
         super();
         addEventListener(Event.ADDED_TO_STAGE,this._5996);
         addEventListener(MouseEvent.MOUSE_DOWN,this._4090);
      }
      
      public function get _8233() : Number
      {
         return this._8232;
      }
      
      public function set _8233(param1:Number) : void
      {
         this._8232 = param1;
      }
      
      override public function set maximum(param1:Number) : void
      {
         if(param1 == super.maximum)
         {
            return;
         }
         super.maximum = param1;
         invalidateDisplayList();
      }
      
      override public function set minimum(param1:Number) : void
      {
         if(param1 == super.minimum)
         {
            return;
         }
         super.minimum = param1;
         invalidateDisplayList();
      }
      
      override public function set value(param1:Number) : void
      {
         if(param1 == super.value)
         {
            return;
         }
         super.value = param1;
         invalidateDisplayList();
      }
      
      override protected function setValue(param1:Number) : void
      {
         super.setValue(param1);
         invalidateDisplayList();
      }
      
      protected function _8045(param1:Number, param2:Number) : Number
      {
         return minimum;
      }
      
      override public function _8042(param1:Boolean = true) : void
      {
         var _loc2_:Number = this.value;
         super._8042(param1);
         if(value != _loc2_)
         {
            dispatchEvent(new Event(Event.CHANGE));
         }
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         super.partAdded(param1,param2);
         if(param2 == this._2557)
         {
            this._2557.addEventListener(MouseEvent.MOUSE_DOWN,this._8454);
            this._2557.addEventListener(ResizeEvent.UI_RESIZE,this._8546);
            this._2557.addEventListener(UIEvent.UPDATE_COMPLETE,this._8544);
            this._2557._8370 = true;
         }
         else if(param2 == this.track)
         {
            this.track.addEventListener(MouseEvent.MOUSE_DOWN,this._8455);
            this.track.addEventListener(ResizeEvent.UI_RESIZE,this._8545);
         }
      }
      
      override protected function partRemoved(param1:String, param2:Object) : void
      {
         super.partRemoved(param1,param2);
         if(param2 == this._2557)
         {
            this._2557.removeEventListener(MouseEvent.MOUSE_DOWN,this._8454);
            this._2557.removeEventListener(ResizeEvent.UI_RESIZE,this._8546);
            this._2557.removeEventListener(UIEvent.UPDATE_COMPLETE,this._8544);
         }
         else if(param2 == this.track)
         {
            this.track.removeEventListener(MouseEvent.MOUSE_DOWN,this._8455);
            this.track.removeEventListener(ResizeEvent.UI_RESIZE,this._8545);
         }
      }
      
      override protected function _5823(param1:Number, param2:Number) : void
      {
         super._5823(param1,param2);
         this._8035();
      }
      
      protected function _8035() : void
      {
      }
      
      private function _5996(param1:Event) : void
      {
         this._8035();
      }
      
      private function _8545(param1:Event) : void
      {
         this._8035();
      }
      
      private function _8546(param1:Event) : void
      {
         this._8035();
      }
      
      private function _8544(param1:Event) : void
      {
         this._8035();
         this._2557.removeEventListener(UIEvent.UPDATE_COMPLETE,this._8544);
      }
      
      protected function _8454(param1:MouseEvent) : void
      {
         this.stage.addEventListener(MouseEvent.MOUSE_MOVE,this._8395,false,0,true);
         this.stage.addEventListener(MouseEvent.MOUSE_UP,this._8097,false,0,true);
         this.stage.addEventListener(Event.MOUSE_LEAVE,this._8097,false,0,true);
         this.ns_egret::_8522 = this._2557.globalToLocal(new Point(param1.stageX,param1.stageY));
         dispatchEvent(new TrackBaseEvent(TrackBaseEvent.THUMB_PRESS));
         dispatchEvent(new UIEvent(UIEvent.CHANGE_START));
      }
      
      protected function _8518() : void
      {
         if(!this.track || !stage)
         {
            return;
         }
         var _loc1_:Point = this.track.globalToLocal(new Point(this.stage.mouseX,this.stage.mouseY));
         var _loc2_:Number = this._8045(_loc1_.x - this.ns_egret::_8522.x,_loc1_.y - this.ns_egret::_8522.y);
         _loc2_ = _8231(_loc2_,_8236);
         if(_loc2_ != value)
         {
            this.setValue(_loc2_);
            _6929();
            dispatchEvent(new TrackBaseEvent(TrackBaseEvent.THUMB_DRAG));
            dispatchEvent(new Event(Event.CHANGE));
         }
      }
      
      protected function _8395(param1:MouseEvent) : void
      {
         this._8518();
         if(_1141._8368)
         {
            param1.updateAfterEvent();
         }
      }
      
      protected function _8097(param1:Event) : void
      {
         Stage(param1.currentTarget).removeEventListener(MouseEvent.MOUSE_MOVE,this._8395);
         Stage(param1.currentTarget).removeEventListener(MouseEvent.MOUSE_UP,this._8097);
         Stage(param1.currentTarget).removeEventListener(Event.MOUSE_LEAVE,this._8097);
         dispatchEvent(new TrackBaseEvent(TrackBaseEvent.THUMB_RELEASE));
         dispatchEvent(new UIEvent(UIEvent.CHANGE_END));
      }
      
      protected function _8455(param1:MouseEvent) : void
      {
      }
      
      private function _4090(param1:MouseEvent) : void
      {
         this.stage.addEventListener(MouseEvent.MOUSE_UP,this._8543,false,0,true);
         this.stage.addEventListener(Event.MOUSE_LEAVE,this._8543,false,0,true);
         this._8547 = DisplayObject(param1.target);
      }
      
      private function _8543(param1:Event) : void
      {
         var _loc2_:MouseEvent = null;
         var _loc3_:Point = null;
         Stage(param1.currentTarget).removeEventListener(MouseEvent.MOUSE_UP,this._8543);
         Stage(param1.currentTarget).removeEventListener(Event.MOUSE_LEAVE,this._8543);
         if(this._8547 != param1.target && param1 is MouseEvent && contains(DisplayObject(param1.target)))
         {
            _loc2_ = param1 as MouseEvent;
            _loc3_ = new Point(_loc2_.localX,_loc2_.localY);
            _loc3_ = globalToLocal(DisplayObject(param1.target).localToGlobal(_loc3_));
            dispatchEvent(new MouseEvent(MouseEvent.CLICK,_loc2_.bubbles,_loc2_.cancelable,_loc3_.x,_loc3_.y,_loc2_.relatedObject,_loc2_.ctrlKey,_loc2_.altKey,_loc2_.shiftKey,_loc2_.buttonDown,_loc2_.delta));
         }
         this._8547 = null;
      }
   }
}

