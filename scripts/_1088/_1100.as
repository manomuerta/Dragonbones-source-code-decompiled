package _1088
{
   import _1148.Animation;
   import _1148._1150;
   import _1148._1152;
   import _1155._1159;
   import _1177.TrackBaseEvent;
   import _1177.UIEvent;
   import egret.core.ns_egret;
   import flash.display.DisplayObjectContainer;
   import flash.display.InteractiveObject;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   use namespace ns_egret;
   
   public class _1100 extends _1103
   {
      private var _15558:Boolean = false;
      
      public var _8049:InteractiveObject;
      
      private var _8517:Boolean = true;
      
      private var _8196:Animation = null;
      
      private var _8519:Number = 0;
      
      private var _8234:Number;
      
      private var _8520:Boolean = true;
      
      public function _1100()
      {
         super();
         maximum = 10;
      }
      
      public function get _8048() : Boolean
      {
         return this._8517;
      }
      
      public function set _8048(param1:Boolean) : void
      {
         if(this._8517 == param1)
         {
            return;
         }
         this._8517 = param1;
         if(this._8049)
         {
            this._8049.visible = param1;
         }
         invalidateDisplayList();
      }
      
      override public function get maximum() : Number
      {
         return super.maximum;
      }
      
      protected function get _8050() : Number
      {
         return this._8519;
      }
      
      protected function set _8050(param1:Number) : void
      {
         if(param1 == this._8519)
         {
            return;
         }
         this._8519 = param1;
         invalidateDisplayList();
      }
      
      override protected function setValue(param1:Number) : void
      {
         this._8519 = param1;
         super.setValue(param1);
      }
      
      private function _8155(param1:Animation) : void
      {
         this._8050 = param1._2584["value"];
      }
      
      private function _8158(param1:Animation) : void
      {
         this.setValue(this._8234);
         dispatchEvent(new Event(Event.CHANGE));
         dispatchEvent(new UIEvent(UIEvent.CHANGE_END));
      }
      
      private function _2855() : void
      {
         this._8196.stop();
         this.setValue(_8231(this._8050,_8236));
         dispatchEvent(new Event(Event.CHANGE));
         dispatchEvent(new UIEvent(UIEvent.CHANGE_END));
      }
      
      override protected function _8454(param1:MouseEvent) : void
      {
         this._15558 = true;
         if(Boolean(this._8196) && this._8196.isPlaying)
         {
            this._2855();
         }
         super._8454(param1);
      }
      
      public function get _8521() : Boolean
      {
         return this._8520;
      }
      
      public function set _8521(param1:Boolean) : void
      {
         this._8520 = param1;
      }
      
      public function get _15559() : Boolean
      {
         return this._15558;
      }
      
      override protected function _8518() : void
      {
         if(!track)
         {
            return;
         }
         var _loc1_:Point = track.globalToLocal(new Point(this.stage.mouseX,this.stage.mouseY));
         var _loc2_:Number = _8045(_loc1_.x - ns_egret::_8522.x,_loc1_.y - ns_egret::_8522.y);
         _loc2_ = _8231(_loc2_,_8236);
         if(_loc2_ != this._8050)
         {
            dispatchEvent(new TrackBaseEvent(TrackBaseEvent.THUMB_DRAG));
            if(this._8521 == true)
            {
               this.setValue(_loc2_);
               dispatchEvent(new Event(Event.CHANGE));
            }
            else
            {
               this._8050 = _loc2_;
            }
         }
      }
      
      override protected function _8097(param1:Event) : void
      {
         this._15558 = false;
         super._8097(param1);
         if(this._8521 == false && value != this._8050)
         {
            this.setValue(this._8050);
            dispatchEvent(new Event(Event.CHANGE));
         }
      }
      
      override protected function _8455(param1:MouseEvent) : void
      {
         if(!enabled)
         {
            return;
         }
         var _loc2_:Number = !!_2557 ? _2557.width : 0;
         var _loc3_:Number = !!_2557 ? _2557.height : 0;
         var _loc4_:Number = param1.stageX - _loc2_ / 2;
         var _loc5_:Number = param1.stageY - _loc3_ / 2;
         var _loc6_:Point = track.globalToLocal(new Point(_loc4_,_loc5_));
         var _loc7_:Number = _8045(_loc6_.x,_loc6_.y);
         _loc7_ = _8231(_loc7_,_8236);
         if(_loc7_ != this._8050)
         {
            if(_8233 != 0)
            {
               if(!this._8196)
               {
                  this._8196 = new Animation(this._8155);
                  this._8196.endFunction = this._8158;
                  this._8196._3772 = new _1159(0);
               }
               if(this._8196.isPlaying)
               {
                  this._2855();
               }
               this._8234 = _loc7_;
               this._8196.duration = _8233 * (Math.abs(this._8050 - this._8234) / (this.maximum - minimum));
               this._8196.motionPaths = new <_1150>[new _1152("value",this._8050,this._8234)];
               dispatchEvent(new UIEvent(UIEvent.CHANGE_START));
               this._8196.play();
            }
            else
            {
               this.setValue(_loc7_);
               dispatchEvent(new Event(Event.CHANGE));
            }
         }
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         super.partAdded(param1,param2);
         if(param2 == this._8049)
         {
            this._8049.mouseEnabled = false;
            if(this._8049 is DisplayObjectContainer)
            {
               (this._8049 as DisplayObjectContainer).mouseChildren = false;
            }
            this._8049.visible = this._8517;
         }
      }
   }
}

