package egret.managers.impl
{
   import _1045.ToolTip;
   import _1177.ToolTipEvent;
   import egret.core._1116;
   import egret.core._1121;
   import egret.core._1130;
   import egret.core._1134;
   import egret.core._1138;
   import egret.core._1141;
   import egret.core._999;
   import egret.core.ns_egret;
   import egret.managers._1205;
   import egret.managers._1211;
   import egret.managers._1212;
   import egret.managers._1213;
   import egret.utils._1295;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.InteractiveObject;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.Timer;
   import flash.utils.getQualifiedClassName;
   
   use namespace ns_egret;
   
   public class _1209 implements _1212
   {
      private var initialized:Boolean = false;
      
      private var _9008:Timer;
      
      private var _9009:Timer;
      
      private var _9006:Timer;
      
      private var _8993:Object;
      
      private var _8996:_1213;
      
      private var _8994:_1213;
      
      private var _8991:DisplayObject;
      
      private var _5142:Boolean = true;
      
      private var _9007:Number = 10000;
      
      private var _9001:Number = 100;
      
      private var _9005:Number = 200;
      
      private var _8688:Class;
      
      private var _8987:Boolean = false;
      
      private var _8989:_1295;
      
      public function _1209()
      {
         this._8688 = ToolTip;
         this._8989 = new _1295();
         super();
      }
      
      public function get currentTarget() : _1213
      {
         return this._8994;
      }
      
      public function set currentTarget(param1:_1213) : void
      {
         this._8994 = param1;
      }
      
      public function get _8995() : _999
      {
         return this._8991 as _999;
      }
      
      public function set _8995(param1:_999) : void
      {
         this._8991 = param1 as DisplayObject;
      }
      
      public function get enabled() : Boolean
      {
         return this._5142;
      }
      
      public function set enabled(param1:Boolean) : void
      {
         if(this._5142 == param1)
         {
            return;
         }
         this._5142 = param1;
         if(!this._5142 && Boolean(this.currentTarget))
         {
            this.currentTarget = null;
            this._8998();
            this._8996 = this.currentTarget;
         }
      }
      
      public function get _9011() : Number
      {
         return this._9007;
      }
      
      public function set _9011(param1:Number) : void
      {
         this._9007 = param1;
      }
      
      public function get _9003() : Number
      {
         return this._9001;
      }
      
      public function set _9003(param1:Number) : void
      {
         this._9001 = param1;
      }
      
      public function get _9012() : Number
      {
         return this._9005;
      }
      
      public function set _9012(param1:Number) : void
      {
         this._9005 = param1;
      }
      
      public function get _8693() : Class
      {
         return this._8688;
      }
      
      public function set _8693(param1:Class) : void
      {
         this._8688 = param1;
      }
      
      private function initialize() : void
      {
         if(!this._9008)
         {
            this._9008 = new Timer(0,1);
            this._9008.addEventListener(TimerEvent.TIMER,this._8984);
         }
         if(!this._9009)
         {
            this._9009 = new Timer(0,1);
            this._9009.addEventListener(TimerEvent.TIMER,this._8983);
         }
         if(!this._9006)
         {
            this._9006 = new Timer(0,1);
         }
         this.initialized = true;
      }
      
      public function _8677(param1:DisplayObject, param2:Object, param3:Object) : void
      {
         var _loc4_:Boolean = param2 != null && param2 != "";
         var _loc5_:Boolean = param3 != null && param3 != "";
         if(!_loc4_ && _loc5_)
         {
            param1.addEventListener(MouseEvent.MOUSE_OVER,this._8982);
            param1.addEventListener(MouseEvent.MOUSE_OUT,this._8985);
            if(this._9002(param1))
            {
               this._8990(param1);
            }
         }
         else if(_loc4_ && !_loc5_)
         {
            param1.removeEventListener(MouseEvent.MOUSE_OVER,this._8982);
            param1.removeEventListener(MouseEvent.MOUSE_OUT,this._8985);
            if(this._9002(param1))
            {
               this._8992(param1);
            }
         }
         else if(_loc5_ && this._8995 && this.currentTarget === param1)
         {
            this._8993 = param3;
            this._8999();
         }
      }
      
      private function _9002(param1:DisplayObject) : Boolean
      {
         if(!param1 || !param1.stage)
         {
            return false;
         }
         if(param1.stage.mouseX == 0 && param1.stage.mouseY == 0)
         {
            return false;
         }
         if(param1 is _1205 && !_1205(param1).initialized)
         {
            return false;
         }
         return param1.hitTestPoint(param1.stage.mouseX,param1.stage.mouseY,true);
      }
      
      private function _8990(param1:DisplayObject) : void
      {
         this._8987 = true;
         this._8986(param1);
         this._8987 = false;
      }
      
      private function _8992(param1:DisplayObject) : void
      {
         this._8986(null);
      }
      
      private function _8986(param1:DisplayObject) : void
      {
         if(!this.enabled)
         {
            return;
         }
         this._9004(param1);
         if(this.currentTarget != this._8996)
         {
            this._8998();
            this._8996 = this.currentTarget;
         }
      }
      
      private function _9004(param1:DisplayObject) : void
      {
         while(param1)
         {
            if(param1 is _1213)
            {
               this._8993 = _1213(param1).toolTip;
               if(this._8993 != null)
               {
                  this.currentTarget = param1 as _1213;
                  return;
               }
            }
            param1 = param1.parent;
         }
         this._8993 = null;
         this.currentTarget = null;
      }
      
      private function _8998() : void
      {
         var _loc1_:ToolTipEvent = null;
         if(!this.initialized)
         {
            this.initialize();
         }
         if(Boolean(this._8996) && Boolean(this._8995))
         {
            _loc1_ = new ToolTipEvent(ToolTipEvent.TOOL_TIP_HIDE);
            _loc1_.toolTip = this._8995;
            this._8996.dispatchEvent(_loc1_);
         }
         this.reset();
         if(this.currentTarget)
         {
            if(!this._8993)
            {
               return;
            }
            if(this._9005 == 0 || this._8987 || this._9006.running)
            {
               this._9010();
               this._8999();
               this._7914(this._8995,this.currentTarget);
               this._5100();
            }
            else
            {
               this._9008.delay = this._9005;
               this._9008.start();
            }
         }
      }
      
      private function _9010() : void
      {
         var _loc1_:Class = this.currentTarget._8693;
         if(!_loc1_)
         {
            _loc1_ = this._8693;
         }
         var _loc2_:String = getQualifiedClassName(_loc1_);
         this._8995 = this._8989.get(_loc2_);
         if(!this._8995)
         {
            this._8995 = new _loc1_();
            this._8989.set(_loc2_,this._8995);
            if(this._8995 is InteractiveObject)
            {
               InteractiveObject(this._8995).mouseEnabled = false;
            }
            if(this._8995 is DisplayObjectContainer)
            {
               DisplayObjectContainer(this._8995).mouseChildren = false;
            }
         }
         this._8988.addElement(this._8995);
      }
      
      private function get _8988() : _1116
      {
         var _loc1_:_1211 = null;
         if(this._8994 is _1130)
         {
            _loc1_ = _1130(this._8994)._1558;
         }
         if(!_loc1_)
         {
            _loc1_ = _1141.ns_egret::_8713[0];
         }
         return _loc1_._8988;
      }
      
      private function _8999() : void
      {
         this._8995._7913 = this._8993;
      }
      
      public function _7914(param1:_999, param2:_1213) : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         if(param1 is _1121)
         {
            _1121(param1)._2449();
         }
         var _loc5_:DisplayObjectContainer = param1.parent;
         var _loc6_:Number = Number(param1.layoutBoundsWidth);
         var _loc7_:Number = Number(param1.layoutBoundsHeight);
         var _loc8_:Rectangle = DisplayObject(param2).getRect(_loc5_);
         var _loc9_:Number = _loc8_.left + (_loc8_.width - _loc6_) * 0.5;
         var _loc10_:Number = _loc8_.top + (_loc8_.height - _loc7_) * 0.5;
         switch(param2._8679)
         {
            case _1138.BELOW:
               _loc3_ = _loc9_;
               _loc4_ = _loc8_.bottom;
               break;
            case _1138.ABOVE:
               _loc3_ = _loc9_;
               _loc4_ = _loc8_.top - _loc7_;
               break;
            case _1138.LEFT:
               _loc3_ = _loc8_.left - _loc6_;
               _loc4_ = _loc10_;
               break;
            case _1138.RIGHT:
               _loc3_ = _loc8_.right;
               _loc4_ = _loc10_;
               break;
            case _1138.CENTER:
               _loc3_ = _loc9_;
               _loc4_ = _loc10_;
               break;
            case _1138.TOP_LEFT:
               _loc3_ = _loc8_.left;
               _loc4_ = _loc8_.top;
               break;
            default:
               _loc3_ = _loc5_.mouseX + 10;
               _loc4_ = _loc5_.mouseY + 20;
         }
         var _loc11_:Point = param2._8690;
         if(_loc11_)
         {
            _loc3_ += _loc11_.x;
            _loc4_ = _loc11_.y;
         }
         var _loc12_:Number = _loc5_.width;
         var _loc13_:Number = _loc5_.height;
         if(_loc3_ + _loc6_ > _loc12_)
         {
            _loc3_ = _loc12_ - _loc6_;
         }
         if(_loc4_ + _loc7_ > _loc13_)
         {
            _loc4_ = _loc13_ - _loc7_;
         }
         if(_loc3_ < 0)
         {
            _loc3_ = 0;
         }
         if(_loc4_ < 0)
         {
            _loc4_ = 0;
         }
         param1.x = _loc3_;
         param1.y = _loc4_;
      }
      
      private function _5100() : void
      {
         var _loc1_:ToolTipEvent = new ToolTipEvent(ToolTipEvent.TOOL_TIP_SHOW);
         _loc1_.toolTip = this._8995;
         this.currentTarget.dispatchEvent(_loc1_);
         if(DisplayObject(this.currentTarget).stage)
         {
            DisplayObject(this.currentTarget).stage.addEventListener(MouseEvent.MOUSE_DOWN,this._8394);
         }
         if(this._9007 == 0)
         {
            this._5101();
         }
         else if(this._9007 < Infinity)
         {
            this._9009.delay = this._9007;
            this._9009.start();
         }
      }
      
      private function _5101() : void
      {
         var _loc1_:ToolTipEvent = null;
         if(Boolean(this._8996) && Boolean(this._8995))
         {
            _loc1_ = new ToolTipEvent(ToolTipEvent.TOOL_TIP_HIDE);
            _loc1_.toolTip = this._8995;
            this._8996.dispatchEvent(_loc1_);
         }
         if(this._8996)
         {
            if(DisplayObject(this._8996).stage)
            {
               DisplayObject(this._8996).stage.removeEventListener(MouseEvent.MOUSE_DOWN,this._8394);
            }
         }
         this.reset();
      }
      
      private function reset() : void
      {
         var _loc1_:DisplayObjectContainer = null;
         this._9008.reset();
         this._9009.reset();
         if(this._8995)
         {
            _loc1_ = this._8995.parent;
            if(_loc1_ is _1134)
            {
               _1134(_loc1_).removeElement(this._8995);
            }
            else if(_loc1_)
            {
               _loc1_.removeChild(this._8991);
            }
            this._8995 = null;
            this._9006.delay = this._9003;
            this._9006.reset();
            if(this._9003 > 0)
            {
               this._9006.delay = this._9003;
               this._9006.start();
            }
         }
      }
      
      public function _9000(param1:String, param2:Number, param3:Number) : _999
      {
         var _loc4_:_999 = new this._8693() as _999;
         this._8988.addElement(_loc4_);
         _loc4_._7913 = param1;
         if(this._8995 is _1121)
         {
            _1121(this._8995)._2449();
         }
         var _loc5_:Point = _loc4_.parent.globalToLocal(new Point(param2,param3));
         _loc4_.x = _loc5_.x;
         _loc4_.y = _loc5_.y;
         return _loc4_;
      }
      
      public function _8997(param1:_999) : void
      {
         var _loc2_:DisplayObjectContainer = param1.parent;
         if(_loc2_ is _1134)
         {
            _1134(_loc2_).removeElement(param1);
         }
         else if(Boolean(_loc2_) && param1 is DisplayObject)
         {
            _loc2_.removeChild(param1 as DisplayObject);
         }
      }
      
      private function _8982(param1:MouseEvent) : void
      {
         this._8986(DisplayObject(param1.target));
      }
      
      private function _8985(param1:MouseEvent) : void
      {
         this._8986(param1.relatedObject);
      }
      
      private function _8984(param1:TimerEvent) : void
      {
         if(this.currentTarget)
         {
            this._9010();
            this._8999();
            this._7914(this._8995,this.currentTarget);
            this._5100();
         }
      }
      
      private function _8983(param1:TimerEvent) : void
      {
         this._5101();
      }
      
      private function _8394(param1:MouseEvent) : void
      {
         this.reset();
      }
   }
}

