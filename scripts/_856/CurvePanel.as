package _856
{
   import _1045.Group;
   import _1045.Label;
   import _1045._1086;
   import _11489.Bezier;
   import _11489.Curve;
   import _11489.Utils;
   import _1185._1188;
   import _1185._1189;
   import _127._156;
   import _13492._13496;
   import _1374.IconButton;
   import _636.AnimationEvent;
   import _97._100;
   import _97._125;
   import egret.core._1140;
   import egret.utils.tr;
   import flash.display.Graphics;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.TextFormatAlign;
   
   public class CurvePanel extends _156
   {
      private const LEFTGAP:int = 45;
      
      private const RIGHTGAP:int = 10;
      
      private const MAPTOP:int = 10;
      
      private const BOTTOMVALUE:int = 10;
      
      private var _11775:Group;
      
      private var _11783:Group;
      
      private var _11774:Group;
      
      private var _11776:Group;
      
      private var _11782:_1140;
      
      private var _11759:_1140;
      
      private var _11758:_1140;
      
      private var _11757:_1140;
      
      private var _11777:Vector.<Label>;
      
      public var _4108:IconButton;
      
      public var _4101:IconButton;
      
      public var _4096:IconButton;
      
      public var _4106:IconButton;
      
      public var _4113:IconButton;
      
      public var _11617:IconButton;
      
      public var _4114:IconButton;
      
      public var _4111:IconButton;
      
      private var _11790:Boolean = false;
      
      private var _11793:Boolean = false;
      
      private var _11794:Boolean = false;
      
      private var _11762:Number = 1;
      
      private var _11760:Number = 1;
      
      private var _11781:Number = 1;
      
      private var _11769:Number = 0;
      
      private var _11778:Number = 1;
      
      private var _11779:Number = -1;
      
      private var _11789:Number = -1;
      
      private var _2736:Curve = null;
      
      private var _11795:_13496 = null;
      
      private var _11792:Bezier = null;
      
      private var _8705:Bezier = null;
      
      private var _8704:Bezier = null;
      
      private var _11796:Point = null;
      
      private var _control:Point = null;
      
      public function CurvePanel()
      {
         this._11777 = new Vector.<Label>();
         this._4108 = new IconButton();
         this._4101 = new IconButton();
         this._4096 = new IconButton();
         this._4106 = new IconButton();
         this._4113 = new IconButton();
         this._11617 = new IconButton();
         this._4114 = new IconButton();
         this._4111 = new IconButton();
         this._mousePoint = new Point();
         this._backPoint = new Point();
         this._backControl = new Point();
         this._backControlSide = new Point();
         this._4235 = new Point();
         this._frames = new Vector.<_13496>();
         super();
         this.title = tr("CurvePanel.Title");
      }
      
      override protected function _2438() : void
      {
         var _loc5_:Label = null;
         super._2438();
         this._11775 = new Group();
         this._11775.percentWidth = 100;
         this._11775.percentHeight = 100;
         this._11758 = new _1140();
         this._11757 = new _1140();
         this._11759 = new _1140();
         this._11782 = new _1140();
         this._11776 = new Group();
         this._11776.x = this.LEFTGAP;
         this._11776.y = this.MAPTOP;
         this._11776.mouseChildren = false;
         this._11776.doubleClickEnabled = true;
         this._11776.addElement(this._11757);
         this._11776.addElement(this._11758);
         this._11776.addElement(this._11759);
         this._11776.addElement(this._11782);
         this._11783 = new Group();
         this._11783.x = 0;
         this._11783.y = this.MAPTOP;
         var _loc1_:int = 0;
         while(_loc1_ < 16)
         {
            (_loc5_ = _125._2407()).width = this.LEFTGAP;
            _loc5_.size = 12;
            _loc5_.leading = 0;
            _loc5_.textAlign = TextFormatAlign.RIGHT;
            _loc5_.height = _loc5_.textHeight;
            _loc5_.mouseEnabled = false;
            _loc5_.mouseChildren = false;
            this._11777.push(_loc5_);
            this._11783.addElement(_loc5_);
            _loc1_++;
         }
         this._11617.icon = "/assets/curve/match.png";
         this._11617.toolTip = tr("CurvePanel.Accord");
         this._4114.icon = "/assets/timeline/timeline_copy.png";
         this._4114.toolTip = tr("CurvePanel.Copy");
         this._4111.icon = "/assets/timeline/timeline_paste.png";
         this._4111.toolTip = tr("CurvePanel.Paste");
         this._4108.icon = "/assets/curve/easeIn.png";
         this._4108.toolTip = tr("CurvePanel.EaseIn");
         this._4101.icon = "/assets/curve/easeOut.png";
         this._4101.toolTip = tr("CurvePanel.EaseOut");
         this._4096.icon = "/assets/curve/easeInOut.png";
         this._4096.toolTip = tr("CurvePanel.EaseInOut");
         this._4106.icon = "/assets/curve/linear.png";
         this._4106.toolTip = tr("CurvePanel.Linear");
         this._4113.icon = "/assets/curve/none.png";
         this._4113.toolTip = tr("CurvePanel.None");
         var _loc2_:_1189 = new _1189();
         _loc2_.gap = 2;
         _loc2_._2401 = _1188.RIGHT;
         _loc2_._2419 = this.RIGHTGAP;
         _loc2_._2416 = this.RIGHTGAP;
         var _loc3_:_1086 = new _1086();
         var _loc4_:_1086 = new _1086();
         _loc3_.width = 10;
         _loc4_.width = 10;
         this._11774 = new Group();
         this._11774.percentWidth = 100;
         this._11774.layout = _loc2_;
         this._11774.addElement(this._4114);
         this._11774.addElement(this._4111);
         this._11774.addElement(_loc3_);
         this._11774.addElement(this._11617);
         this._11774.addElement(_loc4_);
         this._11774.addElement(this._4113);
         this._11774.addElement(this._4106);
         this._11774.addElement(this._4108);
         this._11774.addElement(this._4101);
         this._11774.addElement(this._4096);
         this._11775.addElement(this._11783);
         this._11775.addElement(this._11774);
         this._11775.addElement(this._11776);
         this.addElement(this._11775);
         this.addEventListener(MouseEvent.MOUSE_MOVE,this._11768);
         this._11776.addEventListener(MouseEvent.MOUSE_DOWN,this._11768);
         this._11776.addEventListener(MouseEvent.DOUBLE_CLICK,this._11768);
      }
      
      override protected function _5823(param1:Number, param2:Number) : void
      {
         super._5823(param1,param2);
         if(this.width < 200 || this.height < 100)
         {
            return;
         }
         this._11771();
      }
      
      private function _11768(param1:Event) : void
      {
         switch(param1.type)
         {
            case MouseEvent.MOUSE_DOWN:
               this.stage.addEventListener(MouseEvent.MOUSE_UP,this._11768);
               this._11793 = true;
               this._11794 = false;
               break;
            case MouseEvent.DOUBLE_CLICK:
               this._11793 = false;
               this._11794 = false;
               this._11773();
               break;
            case MouseEvent.MOUSE_UP:
               this.stage.removeEventListener(MouseEvent.MOUSE_UP,this._11768);
               if(this._11793)
               {
                  if(this._11794)
                  {
                     this._11791();
                  }
                  else
                  {
                     this._11788();
                  }
               }
               this._11793 = false;
               this._11794 = false;
               break;
            case MouseEvent.MOUSE_MOVE:
               if(this._11793)
               {
                  if(!this._11794)
                  {
                     this._11794 = true;
                     this._11786();
                  }
                  this._11780();
               }
               else if(this._11764())
               {
                  this._11766();
               }
         }
      }
      
      public function get frame() : _13496
      {
         return this._11795;
      }
      
      public function set frames(param1:Array) : void
      {
         var _loc2_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:_13496 = null;
         this._11795 = null;
         this._frames.length = 0;
         if(Boolean(param1) && param1.length > 0)
         {
            _loc2_ = 0;
            _loc3_ = param1.length;
            while(_loc2_ < _loc3_)
            {
               _loc4_ = param1[_loc2_];
               if((Boolean(_loc4_)) && _loc4_.duration > 0)
               {
                  if(!this._11795)
                  {
                     this._11795 = _loc4_;
                  }
                  this._frames.push(_loc4_);
               }
               _loc2_++;
            }
         }
         if(this._11795)
         {
            if(this._11795._11515)
            {
               this._11790 = true;
               if(!this._2736)
               {
                  this._2736 = new Curve();
               }
               this._2736.copyFrom(this._11795.tweenCurve);
            }
            else
            {
               this._11790 = false;
               this._2736 = new Curve();
            }
            this._2736.update();
            this._11764();
            this._11766();
            this._11761();
            if(this._frames.length > 1)
            {
               this._11617.enabled = true;
               this._11617.alpha = _100.SYMBOL_ENABLED_ALPHA;
            }
            else
            {
               this._11617.enabled = false;
               this._11617.alpha = _100.SYMBOL_DISABLED_ALPHA;
            }
         }
         else
         {
            this._11790 = false;
            this._11764();
            this._11785();
         }
      }
      
      private function _11764() : Boolean
      {
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:Vector.<Point> = null;
         var _loc8_:Array = null;
         var _loc9_:uint = 0;
         if(!this._11795)
         {
            this._11792 = null;
            this._11796 = null;
            this._control = null;
            this._11789 = -0.1;
            return false;
         }
         this._8705 = null;
         this._8704 = null;
         var _loc1_:Bezier = null;
         var _loc2_:Point = null;
         var _loc3_:Point = null;
         var _loc4_:Number = -1;
         if(0 < this._11776.mouseX && this._11776.mouseX < this._11762 && 0 < this._11776.mouseY && this._11776.mouseY < this._11760)
         {
            this._mousePoint.setTo(this._11782.mouseX / this._11778,this._11782.mouseY / this._11779);
            _loc5_ = 0;
            _loc6_ = this._2736.all.length;
            while(_loc5_ < _loc6_)
            {
               _loc1_ = this._2736.all[_loc5_];
               if(_loc1_.start.x <= this._mousePoint.x && this._mousePoint.x <= _loc1_.end.x)
               {
                  if(_loc5_ > 0)
                  {
                     this._8705 = this._2736.all[_loc5_ - 1];
                  }
                  if(_loc5_ < _loc6_ - 1)
                  {
                     this._8704 = this._2736.all[_loc5_ + 1];
                  }
                  break;
               }
               _loc1_ = null;
               _loc5_++;
            }
         }
         if(_loc1_)
         {
            _loc7_ = new Vector.<Point>();
            _loc7_.push(_loc1_.controlA,_loc1_._11525);
            if(_loc1_ === this._2736.start)
            {
               _loc7_.push(_loc1_.end);
            }
            else if(_loc1_ === this._2736.end)
            {
               _loc7_.push(_loc1_.start);
            }
            else
            {
               _loc7_.push(_loc1_.start,_loc1_.end);
            }
            _loc8_ = [];
            _loc9_ = Utils._11526(_loc7_,this._mousePoint,_loc8_);
            if(_loc8_[0] < 0.05)
            {
               _loc2_ = _loc7_[_loc9_];
               if(_loc2_ !== _loc1_.start && _loc2_ !== _loc1_.end)
               {
                  _loc3_ = _loc2_;
                  _loc2_ = null;
               }
            }
            else
            {
               _loc8_.length = 0;
               _loc4_ = _loc1_.distance(this._mousePoint,_loc8_);
               if(_loc8_[0] > 0.05)
               {
                  _loc4_ = -1;
               }
            }
         }
         if(this._11792 !== _loc1_ || this._11796 !== _loc2_ || this._control !== _loc3_ || this._11789 !== _loc4_)
         {
            this._11792 = _loc1_;
            this._11796 = _loc2_;
            this._control = _loc3_;
            this._11789 = _loc4_;
            return true;
         }
         return false;
      }
      
      private function _11786() : void
      {
         if(!this._11795 || !this._11792)
         {
            return;
         }
         if(this._11796)
         {
            this._11790 = true;
            this._backPoint.copyFrom(this._11796);
            if(this._11796 === this._11792.start)
            {
               this._backControl.copyFrom(this._11792.controlA);
               if(this._8705)
               {
                  this._backControlSide.copyFrom(this._8705._11525);
               }
            }
            else
            {
               this._backControl.copyFrom(this._11792._11525);
               if(this._8704)
               {
                  this._backControlSide.copyFrom(this._8704.controlA);
               }
            }
         }
         else if(this._control)
         {
            this._11790 = true;
            this._backControl.copyFrom(this._control);
            if(this._control === this._11792.controlA)
            {
               if(this._8705)
               {
                  this._backPoint.copyFrom(this._11792.start);
                  this._backControlSide.copyFrom(this._8705._11525);
               }
            }
            else if(this._8704)
            {
               this._backPoint.copyFrom(this._11792.end);
               this._backControlSide.copyFrom(this._8704.controlA);
            }
         }
      }
      
      private function _11791() : void
      {
         if(!this._11795 || !this._11792)
         {
            return;
         }
         this._11767();
         this.dispatchEvent(new AnimationEvent(AnimationEvent.MODIFY_FRAMES_TWEEN_CURVE,[this._2736]));
      }
      
      private function _11780() : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         if(!this._11795 || !this._11792)
         {
            return;
         }
         var _loc1_:Number = this._11782.mouseX / this._11778 - this._mousePoint.x;
         var _loc2_:Number = this._11782.mouseY / this._11779 - this._mousePoint.y;
         if(this._11796)
         {
            this._11796.x = this._backPoint.x + _loc1_;
            this._11796.y = this._backPoint.y + _loc2_;
            this._11772(this._11796,this._11792);
            if(this._11796 === this._11792.start)
            {
               if(this._8705)
               {
                  this._8705.end.copyFrom(this._11796);
                  this._11772(this._8705.end,this._8705);
                  this._11796.copyFrom(this._8705.end);
               }
               _loc1_ = this._11796.x - this._backPoint.x;
               _loc2_ = this._11796.y - this._backPoint.y;
               if(this._8705)
               {
                  this._8705._11525.x = this._backControlSide.x + _loc1_;
                  this._8705._11525.y = this._backControlSide.y + _loc2_;
                  this._11765(this._8705._11525,this._8705,true);
               }
               this._11792.controlA.x = this._backControl.x + _loc1_;
               this._11792.controlA.y = this._backControl.y + _loc2_;
               this._11765(this._11792.controlA,this._11792,true);
            }
            else
            {
               if(this._8704)
               {
                  this._8704.start.copyFrom(this._11796);
                  this._11772(this._8704.start,this._8704);
                  this._11796.copyFrom(this._8704.start);
               }
               _loc1_ = this._11796.x - this._backPoint.x;
               _loc2_ = this._11796.y - this._backPoint.y;
               if(this._8704)
               {
                  this._8704.controlA.x = this._backControlSide.x + _loc1_;
                  this._8704.controlA.y = this._backControlSide.y + _loc2_;
                  this._11765(this._8704.controlA,this._8704,true);
               }
               this._11792._11525.x = this._backControl.x + _loc1_;
               this._11792._11525.y = this._backControl.y + _loc2_;
               this._11765(this._11792._11525,this._11792,true);
            }
            this._11766();
         }
         else if(this._control)
         {
            this._control.x = this._backControl.x + _loc1_;
            this._control.y = this._backControl.y + _loc2_;
            this._11765(this._control,this._11792);
            if(this._control === this._11792.controlA)
            {
               if(this._8705)
               {
                  _loc3_ = Utils.distance(this._backPoint,this._backControlSide);
                  _loc4_ = Math.atan2(this._backPoint.y - this._control.y,this._backPoint.x - this._control.x);
                  this._8705._11525.x = Math.cos(_loc4_) * _loc3_ + this._backPoint.x;
                  this._8705._11525.y = Math.sin(_loc4_) * _loc3_ + this._backPoint.y;
                  this._11765(this._8705._11525,this._8705,true);
               }
            }
            else if(this._control === this._11792._11525)
            {
               if(this._8704)
               {
                  _loc3_ = Utils.distance(this._backPoint,this._backControlSide);
                  _loc4_ = Math.atan2(this._backPoint.y - this._control.y,this._backPoint.x - this._control.x);
                  this._8704.controlA.x = Math.cos(_loc4_) * _loc3_ + this._backPoint.x;
                  this._8704.controlA.y = Math.sin(_loc4_) * _loc3_ + this._backPoint.y;
                  this._11765(this._8704.controlA,this._8704,true);
               }
            }
            this._11766();
         }
      }
      
      private function _11788() : void
      {
         if(!this._11795 || !this._11792 || this._11789 <= 0 || 1 <= this._11789)
         {
            return;
         }
         this._11790 = true;
         var _loc1_:Bezier = this._2736.insertPoint(this._11792,this._11789);
         if(_loc1_)
         {
            this._11792 = null;
            if(this._11764())
            {
               this._11766();
            }
            this.dispatchEvent(new AnimationEvent(AnimationEvent.MODIFY_FRAMES_TWEEN_CURVE,[this._2736]));
         }
      }
      
      private function _11773() : void
      {
         if(!this._11795 || !this._11792 || !this._11796 || this._11796 === this._2736.start.start || this._11796 === this._2736.end.end)
         {
            return;
         }
         this._11790 = true;
         this._2736._11533(this._11796);
         this._11792 = null;
         if(this._11764())
         {
            this._11766();
            this.dispatchEvent(new AnimationEvent(AnimationEvent.MODIFY_FRAMES_TWEEN_CURVE,[this._2736]));
         }
      }
      
      private function _11772(param1:Point, param2:Bezier) : void
      {
         if(param1 === param2.start)
         {
            if(param1.x > param2._11525.x)
            {
               param1.x = param2._11525.x;
            }
            if(param1.x > param2.end.x - 0.01)
            {
               param1.x = param2.end.x - 0.01;
            }
         }
         else
         {
            if(param1.x < param2.controlA.x)
            {
               param1.x = param2.controlA.x;
            }
            if(param1.x < param2.start.x + 0.01)
            {
               param1.x = param2.start.x + 0.01;
            }
         }
         if(param1.y < this._11769)
         {
            param1.y = this._11769;
         }
         else if(param1.y > this._11781)
         {
            param1.y = this._11781;
         }
      }
      
      private function _11765(param1:Point, param2:Bezier, param3:Boolean = false) : void
      {
         var _loc4_:Point = null;
         if(param1.y < this._11769)
         {
            if(param3)
            {
               _loc4_ = param1 === param2.controlA ? param2.start : param2.end;
               param1.x = (param1.x - _loc4_.x) / (param1.y - _loc4_.y) * (this._11769 - _loc4_.y) + _loc4_.x;
            }
            param1.y = this._11769;
         }
         else if(param1.y > this._11781)
         {
            if(param3)
            {
               _loc4_ = param1 === param2.controlA ? param2.start : param2.end;
               param1.x = (param1.x - _loc4_.x) / (param1.y - _loc4_.y) * (this._11781 - _loc4_.y) + _loc4_.x;
            }
            param1.y = this._11781;
         }
         if(param1.x < param2.start.x)
         {
            if(param1 === param2._11525)
            {
               param1.y = (param1.y - param2.end.y) / (param1.x - param2.end.x) * (param2.start.x - param2.end.x) + param2.end.y;
            }
            param1.x = param2.start.x;
         }
         else if(param1.x > param2.end.x)
         {
            if(param1 === param2.controlA)
            {
               param1.y = (param1.y - param2.start.y) / (param1.x - param2.start.x) * (param2.end.x - param2.start.x) + param2.start.y;
            }
            param1.x = param2.end.x;
         }
      }
      
      private function _11767() : void
      {
         if(this._11792)
         {
            this._11792.update();
            if(this._8705)
            {
               if(this._11796 === this._11792.start || this._control === this._11792.controlA)
               {
                  this._8705.update();
               }
            }
            if(this._8704)
            {
               if(this._11796 === this._11792.end || this._control === this._11792._11525)
               {
                  this._8704.update();
               }
            }
         }
      }
      
      private function _11771() : void
      {
         this._11762 = Math.max(this.width,260) - this.LEFTGAP - this.RIGHTGAP;
         this._11760 = Math.max(this.height,100) - this.MAPTOP - this._11774.height - this.BOTTOMVALUE - this.BOTTOMVALUE;
         this._11781 = 2;
         this._11769 = -1;
         this._11778 = this._11762;
         this._11779 = -this._11760 / (this._11781 - this._11769);
         this._11782.y = this._11759.y = this._11758.y = this._11781 * -this._11779;
         this._11774.y = this.MAPTOP + this._11760 + this.BOTTOMVALUE;
         this._11763();
         this._11766();
         this._11761();
      }
      
      private function _11766() : void
      {
         var _loc6_:Bezier = null;
         if(!this._11795)
         {
            return;
         }
         var _loc1_:Graphics = this._11782.graphics;
         _loc1_.clear();
         _loc1_.lineStyle(1,_100.CURVEPANEL_CURVE_LINE_COLOR,_100.SYMBOL_ENABLED_ALPHA);
         if(this._11790 || this._11795._11515)
         {
            this._11784(this._2736,_loc1_);
         }
         else if(this._11795._13663 && this._11795._13642)
         {
            this._11787(_loc1_);
         }
         else
         {
            this._11770(_loc1_);
         }
         var _loc2_:Number = 2;
         var _loc3_:Number = 1;
         if(this._11792)
         {
            _loc1_.lineStyle(1,_100.CURVEPANEL_CONTROL_LINE_COLOR,_100.SYMBOL_ENABLED_ALPHA);
            _loc1_.moveTo(this._11792.start.x * this._11778,this._11792.start.y * this._11779);
            _loc1_.lineTo(this._11792.controlA.x * this._11778,this._11792.controlA.y * this._11779);
            _loc1_.moveTo(this._11792.end.x * this._11778,this._11792.end.y * this._11779);
            _loc1_.lineTo(this._11792._11525.x * this._11778,this._11792._11525.y * this._11779);
            if(this._8705)
            {
               _loc1_.moveTo(this._8705.end.x * this._11778,this._8705.end.y * this._11779);
               _loc1_.lineTo(this._8705._11525.x * this._11778,this._8705._11525.y * this._11779);
            }
            if(this._8704)
            {
               _loc1_.moveTo(this._8704.start.x * this._11778,this._8704.start.y * this._11779);
               _loc1_.lineTo(this._8704.controlA.x * this._11778,this._8704.controlA.y * this._11779);
            }
         }
         _loc1_.lineStyle(1,_100.SYMBOL_BORDER_COLOR,_100.SYMBOL_BORDER_ALPHA);
         _loc1_.beginFill(_100.CURVEPANEL_CURVE_POINT_COLOR,_100.SYMBOL_ENABLED_ALPHA);
         var _loc4_:uint = 0;
         var _loc5_:uint = this._2736.all.length;
         while(_loc4_ < _loc5_)
         {
            _loc6_ = this._2736.all[_loc4_];
            if(_loc4_ === _loc5_ - 1)
            {
               _loc3_ = this._11796 === _loc6_.end ? 2 : 1;
               _loc1_.drawRect(_loc6_.end.x * this._11778 - _loc2_ * _loc3_,_loc6_.end.y * this._11779 - _loc2_ * _loc3_,_loc2_ * _loc3_ * 2,_loc2_ * _loc3_ * 2);
            }
            _loc3_ = this._11796 === _loc6_.start || _loc4_ > 0 && this._11796 === this._2736.all[_loc4_ - 1].end ? 2 : 1;
            _loc1_.drawRect(_loc6_.start.x * this._11778 - _loc2_ * _loc3_,_loc6_.start.y * this._11779 - _loc2_ * _loc3_,_loc2_ * _loc3_ * 2,_loc2_ * _loc3_ * 2);
            _loc4_++;
         }
         if(this._11792)
         {
            _loc1_.lineStyle(1,_100.SYMBOL_BORDER_COLOR,_100.SYMBOL_BORDER_ALPHA);
            _loc1_.beginFill(_100.CURVEPANEL_CONTROL_POINT_COLOR,_100.SYMBOL_ENABLED_ALPHA);
            _loc3_ = this._control === this._11792.controlA ? 2 : 1;
            _loc1_.drawCircle(this._11792.controlA.x * this._11778,this._11792.controlA.y * this._11779,_loc2_ * _loc3_);
            _loc3_ = this._control === this._11792._11525 ? 2 : 1;
            _loc1_.drawCircle(this._11792._11525.x * this._11778,this._11792._11525.y * this._11779,_loc2_ * _loc3_);
            if(this._8705)
            {
               _loc1_.drawCircle(this._8705._11525.x * this._11778,this._8705._11525.y * this._11779,_loc2_);
            }
            if(this._8704)
            {
               _loc1_.drawCircle(this._8704.controlA.x * this._11778,this._8704.controlA.y * this._11779,_loc2_);
            }
            if(0 < this._11789 && this._11789 < 1)
            {
               this._11792.compute(this._11789,this._4235);
               _loc3_ = 2;
               _loc1_.lineStyle(1,_100.SYMBOL_BORDER_COLOR,_100.SYMBOL_BORDER_ALPHA);
               _loc1_.beginFill(_100.CURVEPANEL_CURVE_POINT_COLOR,_100.SYMBOL_ENABLED_ALPHA);
               _loc1_.drawRect(this._4235.x * this._11778 - _loc2_ * _loc3_,this._4235.y * this._11779 - _loc2_ * _loc3_,_loc2_ * _loc3_ * 2,_loc2_ * _loc3_ * 2);
            }
         }
      }
      
      private function _11761() : void
      {
         var _loc4_:_13496 = null;
         var _loc5_:Curve = null;
         if(this._frames.length < 1)
         {
            return;
         }
         var _loc1_:Graphics = this._11759.graphics;
         _loc1_.clear();
         _loc1_.lineStyle(1,_100.CURVEPANEL_OTHER_CURVE_COLOR,_100.SYMBOL_DISABLED_ALPHA);
         var _loc2_:uint = 0;
         var _loc3_:uint = this._frames.length;
         while(_loc2_ < _loc3_)
         {
            _loc4_ = this._frames[_loc2_];
            _loc5_ = _loc4_.tweenCurve;
            if(_loc4_._13663)
            {
               if(_loc5_)
               {
                  this._11784(_loc5_,_loc1_);
               }
               else
               {
                  this._11787(_loc1_);
               }
            }
            else
            {
               this._11770(_loc1_);
            }
            _loc2_++;
         }
      }
      
      private function _11763() : void
      {
         var _loc1_:uint = 0;
         var _loc2_:uint = 0;
         var _loc8_:int = 0;
         this._11757.graphics.clear();
         this._11757.graphics.beginFill(_100.CURVEPANEL_BG_COLOR,_100.SYMBOL_ENABLED_ALPHA);
         this._11757.graphics.drawRect(0,0,this._11762,this._11760);
         this._11757.graphics.endFill();
         this._11757.graphics.beginFill(_100.CURVEPANEL_BG_LIGHT_COLOR,_100.SYMBOL_ENABLED_ALPHA);
         this._11757.graphics.drawRect(0,-(this._11781 - 1) * this._11779,this._11762,-1 * this._11779);
         this._11757.graphics.endFill();
         this._11757.graphics.lineStyle(0,_100.SYMBOL_BORDER_COLOR,_100.SYMBOL_BORDER_ALPHA);
         this._11757.graphics.drawRect(0,0,this._11762,this._11760);
         _loc1_ = Math.min(Math.max(this._11762 / 50,2),10);
         _loc2_ = 15;
         var _loc3_:Number = this._11762 / _loc1_;
         var _loc4_:Number = this._11760 / _loc2_;
         var _loc5_:uint = _loc2_ * this._11781 / (this._11781 - this._11769);
         this._11757.graphics.lineStyle(0,_100.SYMBOL_BORDER_COLOR,_100.SYMBOL_BORDER_ALPHA);
         _loc8_ = 1;
         while(_loc8_ < _loc1_)
         {
            this._11757.graphics.moveTo(_loc8_ * _loc3_,0);
            this._11757.graphics.lineTo(_loc8_ * _loc3_,this._11760);
            _loc8_++;
         }
         this._11758.graphics.clear();
         this._11758.graphics.lineStyle(0,_100.SYMBOL_BORDER_COLOR,_100.SYMBOL_BORDER_ALPHA);
         var _loc6_:uint = 0;
         var _loc7_:Label = null;
         _loc8_ = 0;
         while(_loc8_ < _loc5_)
         {
            this._11758.graphics.moveTo(0,-_loc8_ * _loc4_);
            this._11758.graphics.lineTo(this._11778,-_loc8_ * _loc4_);
            (_loc7_ = this._11777[_loc6_++]).text = _loc8_ * 20 + " %";
            _loc7_.y = -_loc8_ * _loc4_ + this._11782.y;
            _loc8_++;
         }
         (_loc7_ = this._11777[_loc6_++]).text = _loc8_ * 20 + " %";
         _loc7_.y = -_loc8_ * _loc4_ + this._11782.y;
         _loc8_ = 1;
         while(_loc8_ < _loc2_ - _loc5_)
         {
            this._11758.graphics.moveTo(0,_loc8_ * _loc4_);
            this._11758.graphics.lineTo(this._11778,_loc8_ * _loc4_);
            _loc7_ = this._11777[_loc6_++];
            if(_loc7_)
            {
               _loc7_.text = -_loc8_ * 20 + " %";
               _loc7_.y = _loc8_ * _loc4_ + this._11782.y;
            }
            _loc8_++;
         }
      }
      
      private function _11785() : void
      {
         this._11759.graphics.clear();
         this._11782.graphics.clear();
      }
      
      private function _11787(param1:Graphics) : void
      {
         param1.moveTo(0 * this._11778,0 * this._11779);
         param1.lineTo(1 * this._11778,1 * this._11779);
      }
      
      private function _11770(param1:Graphics) : void
      {
         param1.moveTo(0 * this._11778,0 * this._11779);
         param1.lineTo(1 * this._11778,0 * this._11779);
         param1.lineTo(1 * this._11778,1 * this._11779);
      }
      
      private function _11784(param1:Curve, param2:Graphics) : void
      {
         var _loc5_:Bezier = null;
         param2.moveTo(param1.start.start.x * this._11778,param1.start.start.y * this._11779);
         var _loc3_:uint = 0;
         var _loc4_:uint = param1.all.length;
         while(_loc3_ < _loc4_)
         {
            _loc5_ = param1.all[_loc3_];
            param2.cubicCurveTo(_loc5_.controlA.x * this._11778,_loc5_.controlA.y * this._11779,_loc5_._11525.x * this._11778,_loc5_._11525.y * this._11779,_loc5_.end.x * this._11778,_loc5_.end.y * this._11779);
            _loc3_++;
         }
      }
   }
}

