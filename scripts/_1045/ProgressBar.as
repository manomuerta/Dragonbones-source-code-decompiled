package _1045
{
   import _1088._1095;
   import _1148.Animation;
   import _1148._1150;
   import _1148._1152;
   import _1177.MoveEvent;
   import _1177.ResizeEvent;
   import egret.core._1140;
   import egret.core.ns_egret;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.geom.Point;
   
   use namespace ns_egret;
   
   public class ProgressBar extends _1095
   {
      public var _2557:DisplayObject;
      
      public var track:DisplayObject;
      
      public var labelDisplay:Label;
      
      private var _7816:Function;
      
      private var _8232:Number = 500;
      
      private var _8237:String;
      
      private var _8196:Animation = null;
      
      private var _8234:Number;
      
      private var _8230:Boolean = false;
      
      public function ProgressBar()
      {
         this._8237 = _1080.LEFT_TO_RIGHT;
         super();
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
         invalidateDisplayList();
      }
      
      protected function _8235(param1:Number, param2:Number) : String
      {
         if(this._6146 != null)
         {
            return this._6146(param1,param2);
         }
         return param1 + " / " + param2;
      }
      
      public function get _8233() : Number
      {
         return this._8232;
      }
      
      public function set _8233(param1:Number) : void
      {
         if(this._8232 == param1)
         {
            return;
         }
         this._8232 = param1;
         if(Boolean(this._8196) && this._8196.isPlaying)
         {
            this._8196.stop();
            super.value = this._8234;
         }
      }
      
      public function get direction() : String
      {
         return this._8237;
      }
      
      public function set direction(param1:String) : void
      {
         if(this._8237 == param1)
         {
            return;
         }
         this._8237 = param1;
         invalidateDisplayList();
      }
      
      override public function get value() : Number
      {
         return super.value;
      }
      
      override public function set value(param1:Number) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         if(super.value == param1)
         {
            return;
         }
         if(this._8232 == 0 || !stage)
         {
            super.value = param1;
         }
         else
         {
            _6040();
            this._8234 = _8231(param1,_8236);
            if(this._8234 == super.value)
            {
               return;
            }
            if(!this._8196)
            {
               this._8196 = new Animation(this._8155);
               this._8196._3772 = null;
            }
            if(this._8196.isPlaying)
            {
               _loc3_ = Number(_1152(this._8196.motionPaths[0])._8198);
               this.setValue(_8231(_loc3_,_8236));
               this._8196.stop();
            }
            _loc2_ = this._8232 * (Math.abs(super.value - this._8234) / (maximum - minimum));
            this._8196.duration = _loc2_ === Infinity ? 0 : _loc2_;
            this._8196.motionPaths = new <_1150>[new _1152("value",super.value,this._8234)];
            this._8196.play();
         }
      }
      
      private function _8155(param1:Animation) : void
      {
         this.setValue(_8231(param1._2584["value"],_8236));
      }
      
      override protected function setValue(param1:Number) : void
      {
         super.setValue(param1);
         invalidateDisplayList();
      }
      
      override protected function _5823(param1:Number, param2:Number) : void
      {
         super._5823(param1,param2);
         this._8035();
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         if(param2 == this.track)
         {
            if(this.track is _1140)
            {
               this.track.addEventListener(ResizeEvent.UI_RESIZE,this._8229);
               this.track.addEventListener(MoveEvent.MOVE,this._8229);
            }
         }
      }
      
      override protected function partRemoved(param1:String, param2:Object) : void
      {
         if(param2 == this.track)
         {
            if(this.track is _1140)
            {
               this.track.removeEventListener(ResizeEvent.UI_RESIZE,this._8229);
               this.track.removeEventListener(MoveEvent.MOVE,this._8229);
            }
         }
      }
      
      private function _8229(param1:Event) : void
      {
         this._8230 = true;
         _2466();
      }
      
      override protected function _2476() : void
      {
         super._2476();
         if(this._8230)
         {
            this._8230 = false;
            this._8035();
         }
      }
      
      protected function _8035() : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Point = null;
         var _loc8_:_1140 = null;
         this._8230 = false;
         var _loc1_:Number = isNaN(this.value) ? 0 : this.value;
         var _loc2_:Number = isNaN(maximum) ? 0 : maximum;
         if(Boolean(this._2557) && Boolean(this.track))
         {
            _loc3_ = isNaN(this.track.width) ? 0 : this.track.width;
            _loc3_ *= this.track.scaleX;
            _loc4_ = isNaN(this.track.height) ? 0 : this.track.height;
            _loc4_ = _loc4_ * this.track.scaleY;
            _loc5_ = Math.round(_loc1_ / _loc2_ * _loc3_);
            if(isNaN(_loc5_) || _loc5_ < 0 || _loc5_ === Infinity)
            {
               _loc5_ = 0;
            }
            _loc6_ = Math.round(_loc1_ / _loc2_ * _loc4_);
            if(isNaN(_loc6_) || _loc6_ < 0 || _loc6_ === Infinity)
            {
               _loc6_ = 0;
            }
            _loc7_ = globalToLocal(this.track.localToGlobal(new Point()));
            _loc8_ = this._2557 as _1140;
            switch(this._8237)
            {
               case _1080.LEFT_TO_RIGHT:
                  if(!_loc8_ || !_loc8_.ns_egret::_8227)
                  {
                     this._2557.height = _loc4_;
                  }
                  this._2557.width = _loc5_;
                  this._2557.x = _loc7_.x;
                  break;
               case _1080.RIGHT_TO_LEFT:
                  if(!_loc8_ || !_loc8_.ns_egret::_8227)
                  {
                     this._2557.height = _loc4_;
                  }
                  this._2557.width = _loc5_;
                  this._2557.x = _loc7_.x + _loc3_ - _loc5_;
                  break;
               case _1080.TOP_TO_BOTTOM:
                  if(!_loc8_ || !_loc8_.ns_egret::_8228)
                  {
                     this._2557.width = _loc3_;
                  }
                  this._2557.height = _loc6_;
                  this._2557.y = _loc7_.y;
                  break;
               case _1080.BOTTOM_TO_TOP:
                  if(!_loc8_ || !_loc8_.ns_egret::_8228)
                  {
                     this._2557.width = _loc3_;
                  }
                  this._2557.height = _loc6_;
                  this._2557.y = _loc7_.y + _loc4_ - _loc6_;
            }
         }
         if(this.labelDisplay)
         {
            this.labelDisplay.text = this._8235(_loc1_,_loc2_);
         }
      }
   }
}

