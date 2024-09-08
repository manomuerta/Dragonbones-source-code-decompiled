package _1045
{
   import _1148.Animation;
   import _1148._1150;
   import _1148._1152;
   import egret.core._1121;
   import egret.core._1130;
   import egret.core._1133;
   import egret.core._1138;
   import egret.core._1140;
   import egret.core.ns_egret;
   import egret.managers._1217;
   import egret.utils._99;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   use namespace ns_egret;
   
   public class _1079 extends _1140
   {
      private var _8212:Boolean = false;
      
      private var addedToStage:Boolean = false;
      
      private var _8199:Boolean = false;
      
      private var _8201:Boolean = false;
      
      private var _8220:Boolean = false;
      
      private var _8226:_1133;
      
      private var _8216:String = "topLeft";
      
      private var _8206:String = "topLeft";
      
      private var _8223:Boolean = false;
      
      private var _8193:Animation = null;
      
      private var _8217:Number = 250;
      
      private var _8215:Number = 150;
      
      private var _8224:Boolean = false;
      
      private var _8225:Number = 1;
      
      public function _1079()
      {
         super();
         addEventListener(Event.ADDED_TO_STAGE,this._5996);
         addEventListener(Event.REMOVED_FROM_STAGE,this._8203);
      }
      
      public function get _8200() : Boolean
      {
         return this._8199;
      }
      
      public function set _8200(param1:Boolean) : void
      {
         if(this._8199 == param1)
         {
            return;
         }
         this._8199 = param1;
         invalidateDisplayList();
      }
      
      public function get _8202() : Boolean
      {
         return this._8201;
      }
      
      public function set _8202(param1:Boolean) : void
      {
         if(this._8201 == param1)
         {
            return;
         }
         this._8201 = param1;
         invalidateDisplayList();
      }
      
      public function get _8222() : Boolean
      {
         return this._8220;
      }
      
      public function set _8222(param1:Boolean) : void
      {
         if(this._8220 == param1)
         {
            return;
         }
         this._8220 = param1;
         this._8211();
      }
      
      public function get popUp() : _1133
      {
         return this._8226;
      }
      
      public function set popUp(param1:_1133) : void
      {
         if(this._8226 == param1)
         {
            return;
         }
         this._8226 = param1;
         this._8226.addEventListener(MouseEvent.MOUSE_DOWN,this._4090,false,-50);
         dispatchEvent(new Event("popUpChanged"));
      }
      
      private function _4090(param1:MouseEvent) : void
      {
         param1.stopPropagation();
      }
      
      public function get _8219() : String
      {
         return this._8216;
      }
      
      public function set _8219(param1:String) : void
      {
         if(this._8216 == param1)
         {
            return;
         }
         this._8216 = param1;
         invalidateDisplayList();
      }
      
      override protected function _5823(param1:Number, param2:Number) : void
      {
         super._5823(param1,param2);
         this._8208(param1,param2);
      }
      
      public function _8207() : void
      {
         this._8208(width,height);
      }
      
      private function _8204() : Point
      {
         var _loc1_:Point = new Point();
         this._8206 = this._8216;
         switch(this._8216)
         {
            case _1138.BELOW:
               _loc1_.x = 0;
               _loc1_.y = height;
               break;
            case _1138.ABOVE:
               _loc1_.x = 0;
               _loc1_.y = -this.popUp.layoutBoundsHeight;
               break;
            case _1138.LEFT:
               _loc1_.x = -this.popUp.layoutBoundsWidth;
               _loc1_.y = 0;
               break;
            case _1138.RIGHT:
               _loc1_.x = width;
               _loc1_.y = 0;
               break;
            case _1138.CENTER:
               _loc1_.x = (width - this.popUp.layoutBoundsWidth) * 0.5;
               _loc1_.y = (height - this.popUp.layoutBoundsHeight) * 0.5;
               break;
            case _1138.TOP_LEFT:
         }
         _loc1_ = localToGlobal(_loc1_);
         _loc1_ = this.popUp.parent.globalToLocal(_loc1_);
         if(_loc1_.y + this._8226.layoutBoundsHeight > stage.stageHeight && this._8216 == _1138.BELOW)
         {
            this._8206 = _1138.ABOVE;
            _loc1_.x = 0;
            _loc1_.y = -this.popUp.layoutBoundsHeight;
            _loc1_ = localToGlobal(_loc1_);
            _loc1_ = this.popUp.parent.globalToLocal(_loc1_);
         }
         if(_loc1_.x + this._8226.layoutBoundsWidth > stage.stageWidth && this._8216 == _1138.BELOW)
         {
            this._8206 = _1138.BELOW;
            _loc1_.y = height;
            _loc1_ = localToGlobal(_loc1_);
            _loc1_.x = stage.stageWidth - this.popUp.layoutBoundsWidth;
            _loc1_ = this.popUp.parent.globalToLocal(_loc1_);
         }
         if(_loc1_.y - this._8226.layoutBoundsHeight < 0 && this._8216 == _1138.ABOVE)
         {
            this._8206 = _1138.BELOW;
            _loc1_.x = 0;
            _loc1_.y = height;
            _loc1_ = localToGlobal(_loc1_);
            _loc1_ = this.popUp.parent.globalToLocal(_loc1_);
         }
         if(_loc1_.x + this._8226.layoutBoundsWidth > stage.stageWidth && this._8216 == _1138.RIGHT)
         {
            this._8206 = _1138.LEFT;
            _loc1_.x = -this.popUp.layoutBoundsWidth;
            _loc1_ = localToGlobal(_loc1_);
            _loc1_ = this.popUp.parent.globalToLocal(_loc1_);
            _loc1_.y = 0;
         }
         if(_loc1_.x - this._8226.layoutBoundsWidth < 0 && this._8216 == _1138.LEFT)
         {
            this._8206 = _1138.RIGHT;
            _loc1_.x = width;
            _loc1_.y = 0;
            _loc1_ = localToGlobal(_loc1_);
            _loc1_ = this.popUp.parent.globalToLocal(_loc1_);
         }
         return _loc1_;
      }
      
      private function get _8196() : Animation
      {
         if(this._8193)
         {
            return this._8193;
         }
         this._8193 = new Animation(this._8155);
         this._8193.endFunction = this._8158;
         this._8193.startFunction = this._8205;
         return this._8193;
      }
      
      public function get _8221() : Number
      {
         return this._8217;
      }
      
      public function set _8221(param1:Number) : void
      {
         this._8217 = param1;
      }
      
      public function get _8218() : Number
      {
         return this._8215;
      }
      
      public function set _8218(param1:Number) : void
      {
         this._8215 = param1;
      }
      
      private function _8205(param1:Animation) : void
      {
         this._8223 = true;
         this.popUp.addEventListener("scrollRectChange",this._8210);
         if(this.popUp is _1130)
         {
            _1130(this.popUp).enabled = false;
         }
      }
      
      private function _8210(param1:Event) : void
      {
         if(this._8224)
         {
            return;
         }
         this._8224 = true;
         (this.popUp as DisplayObject).scrollRect = new Rectangle(Math.round(this._8196._2584["x"]),Math.round(this._8196._2584["y"]),this.popUp.width,this.popUp.height);
         this._8224 = false;
      }
      
      private function _8155(param1:Animation) : void
      {
         this._8224 = true;
         (this.popUp as DisplayObject).scrollRect = new Rectangle(Math.round(param1._2584["x"]),Math.round(param1._2584["y"]),this.popUp.width,this.popUp.height);
         this._8224 = false;
      }
      
      private function _8158(param1:Animation) : void
      {
         this._8223 = false;
         this.popUp.removeEventListener("scrollRectChange",this._8210);
         if(this.popUp is _1130)
         {
            _1130(this.popUp).enabled = true;
         }
         DisplayObject(this.popUp).scrollRect = null;
         if(!this._8212)
         {
            _1217.removePopUp(this.popUp);
            this.popUp._6967(null);
         }
      }
      
      private function _8211() : void
      {
         if(!this.addedToStage || !this.popUp)
         {
            return;
         }
         if(this.popUp.parent == null && this._8222)
         {
            _1217.addPopUp(this.popUp,false,false,_1558);
            this.popUp._6967(this);
            this._8212 = true;
            if(this._8223)
            {
               this._8196.end();
            }
            if(initialized)
            {
               this._8208(width,height);
               if(this._8217 > 0)
               {
                  this._8181();
               }
            }
            else
            {
               _99(function():void
               {
                  if(_8217 > 0)
                  {
                     _8181();
                  }
               });
            }
         }
         else if(this.popUp.parent != null && !this._8222)
         {
            this._8209();
         }
      }
      
      private function _8209() : void
      {
         if(this._8223)
         {
            this._8196.end();
         }
         this._8212 = false;
         if(this._8215 > 0)
         {
            this._8181();
         }
         else
         {
            _1217.removePopUp(this.popUp);
            this.popUp._6967(null);
         }
      }
      
      private function _8208(param1:Number, param2:Number) : void
      {
         if(!this._8212)
         {
            return;
         }
         if(this._8202)
         {
            this.popUp.width = param1;
         }
         if(this._8200)
         {
            this.popUp.height = param2;
         }
         if(this.popUp is _1121)
         {
            (this.popUp as _1121)._2449();
         }
         var _loc3_:Point = this._8204();
         this.popUp.x = _loc3_.x;
         this.popUp.y = _loc3_.y;
      }
      
      private function _8181() : void
      {
         this._8196.motionPaths = this._8213();
         if(this._8212)
         {
            this._8196.duration = this._8217;
         }
         else
         {
            this._8196.duration = this._8215;
         }
         this._8196.play();
      }
      
      private function _8213() : Vector.<_1150>
      {
         var _loc4_:Number = NaN;
         var _loc1_:_1152 = new _1152("x");
         var _loc2_:_1152 = new _1152("y");
         var _loc3_:Vector.<_1150> = new <_1150>[_loc1_,_loc2_];
         switch(this._8206)
         {
            case _1138.TOP_LEFT:
            case _1138.CENTER:
            case _1138.BELOW:
               _loc1_._8192 = _loc1_._8198 = 0;
               _loc2_._8192 = this.popUp.height;
               _loc2_._8198 = 0;
               this._8225 = this.popUp.height;
               break;
            case _1138.ABOVE:
               _loc1_._8192 = _loc1_._8198 = 0;
               _loc2_._8192 = -this.popUp.height;
               _loc2_._8198 = 0;
               this._8225 = this.popUp.height;
               break;
            case _1138.LEFT:
               _loc2_._8192 = _loc2_._8198 = 0;
               _loc1_._8192 = -this.popUp.width;
               _loc1_._8198 = 0;
               this._8225 = this.popUp.width;
               break;
            case _1138.RIGHT:
               _loc2_._8192 = _loc2_._8198 = 0;
               _loc1_._8192 = this.popUp.width;
               _loc1_._8198 = 0;
               this._8225 = this.popUp.width;
               break;
            default:
               this._8225 = 1;
         }
         this._8225 = Math.abs(this._8225);
         if(!this._8212)
         {
            _loc4_ = Number(_loc1_._8192);
            _loc1_._8192 = _loc1_._8198;
            _loc1_._8198 = _loc4_;
            _loc4_ = Number(_loc2_._8192);
            _loc2_._8192 = _loc2_._8198;
            _loc2_._8198 = _loc4_;
         }
         return _loc3_;
      }
      
      private function _5996(param1:Event) : void
      {
         this.addedToStage = true;
         _99(this._8214);
      }
      
      private function _8214() : void
      {
         if(this.addedToStage)
         {
            this._8211();
         }
         else if(this.popUp != null && DisplayObject(this.popUp).parent != null)
         {
            this._8209();
         }
      }
      
      private function _8203(param1:Event) : void
      {
         this.addedToStage = false;
         _99(this._8214);
      }
   }
}

