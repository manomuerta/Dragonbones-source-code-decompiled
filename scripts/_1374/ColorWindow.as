package _1374
{
   import _1045.Button;
   import _1045.Group;
   import _1045.Label;
   import _1045._1105;
   import _1177.UIEvent;
   import _1185._1189;
   import _1185._1196;
   import _1185._1197;
   import _1404._1405;
   import _1439._1227;
   import _1439._1452;
   import _1467._1468;
   import _1491._1492;
   import egret.core._1140;
   import egret.managers._1198;
   import egret.utils.SystemInfo;
   import egret.utils.tr;
   import flash.display.BitmapData;
   import flash.display.GradientType;
   import flash.display.Graphics;
   import flash.display.InteractiveObject;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.geom.Matrix;
   import flash.ui.Keyboard;
   
   public class ColorWindow extends Window
   {
      private var _9635:Boolean = false;
      
      private var _9630:uint = 39679;
      
      private var _9677:uint = 39679;
      
      private var _9631:uint = 39679;
      
      private var _9660:InteractiveObject;
      
      public var _9644:Class;
      
      public var _9643:Class;
      
      private var _9647:_1105;
      
      private var _9642:BitmapData;
      
      private var _9683:_1105;
      
      private var _9678:_1390;
      
      private var _9673:Array;
      
      private var _9667:_1140;
      
      private var _9651:Group;
      
      private var _9648:_1140;
      
      private var _9661:_1140;
      
      private var _9676:TextInput;
      
      private var _9675:TextInput;
      
      private var _9674:TextInput;
      
      private var _9668:TextInput;
      
      private var _9682:_1386;
      
      private var _9652:Boolean = false;
      
      private var _9665:Boolean = false;
      
      private var _9684:Boolean = false;
      
      private var _9653:int;
      
      public function ColorWindow()
      {
         this._9673 = [];
         super();
         if(SystemInfo.isMacOS)
         {
            this.skinName = _1468;
         }
         else
         {
            this.skinName = _1492;
         }
         title = tr("ColorWindow.Title");
         width = 407;
         height = 388;
         minimizable = false;
         resizable = false;
         maximizable = false;
      }
      
      override protected function onKeyDown(param1:KeyboardEvent) : void
      {
         super.onKeyDown(param1);
         if(param1.keyCode == Keyboard.ENTER)
         {
            this._9657();
         }
      }
      
      public function get _6193() : Boolean
      {
         return this._9635;
      }
      
      public function set _6193(param1:Boolean) : void
      {
         this._9635 = param1;
      }
      
      public function get _4061() : uint
      {
         return this._9630;
      }
      
      public function set _4061(param1:uint) : void
      {
         if(this._9630 == param1)
         {
            return;
         }
         this._9630 = param1;
         if(this._9648)
         {
            this._9649(this._9630);
         }
         if(this._9668)
         {
            this._9672(this._9630);
         }
         if(this._9647)
         {
            this._9638(this._9630);
         }
         if(this._9678)
         {
            this._9666(this._9630);
         }
      }
      
      public function get _9636() : uint
      {
         return this._9677;
      }
      
      public function set _9636(param1:uint) : void
      {
         if(this._9677 == param1)
         {
            return;
         }
         this._9677 = param1;
         if(this._9661)
         {
            this._9662(this._9677);
         }
      }
      
      public function get defaultColor() : uint
      {
         return this._9631;
      }
      
      public function set defaultColor(param1:uint) : void
      {
         this._9631 = param1;
      }
      
      public function set _9634(param1:InteractiveObject) : void
      {
         if(this._9660 == param1)
         {
            return;
         }
         if(this._9660)
         {
            this._9659();
         }
         this._9660 = param1;
         if(param1)
         {
            this._2507 = false;
            this.alwaysInFront = true;
            this._9660.addEventListener(MouseEvent.MOUSE_OVER,this._9641,true);
            this._9660.addEventListener(MouseEvent.MOUSE_OUT,this._9646);
            this._9660.addEventListener(MouseEvent.MOUSE_MOVE,this._9641,true);
            this._9660.addEventListener(MouseEvent.MOUSE_DOWN,this._9641,true);
            this._9660.addEventListener(MouseEvent.CLICK,this._9641,true);
            this._9660.addEventListener(MouseEvent.DOUBLE_CLICK,this._9641,true);
            this.addEventListener(Event.CLOSE,this._9659);
         }
      }
      
      private function _9659(param1:Event = null) : void
      {
         this.removeEventListener(Event.CLOSE,this._9659);
         if(this._9660)
         {
            this._9660.removeEventListener(MouseEvent.MOUSE_OVER,this._9641,true);
            this._9660.removeEventListener(MouseEvent.MOUSE_OUT,this._9646);
            this._9660.removeEventListener(MouseEvent.MOUSE_MOVE,this._9641,true);
            this._9660.removeEventListener(MouseEvent.MOUSE_DOWN,this._9641,true);
            this._9660.removeEventListener(MouseEvent.CLICK,this._9641,true);
            this._9660.removeEventListener(MouseEvent.DOUBLE_CLICK,this._9641,true);
         }
      }
      
      private function _9641(param1:MouseEvent) : void
      {
         var _loc2_:BitmapData = null;
         param1.stopImmediatePropagation();
         if(_1198.cursor != _1405.DESKTOP_PICKER)
         {
            _1198.setCursor(_1405.DESKTOP_PICKER);
         }
         if(param1.type == MouseEvent.MOUSE_DOWN)
         {
            _loc2_ = new BitmapData(this._9660.width,this._9660.height,true,0);
            _loc2_.draw(this._9660);
            this._4061 = _loc2_.getPixel(this._9660.mouseX,this._9660.mouseY);
            this._9656();
         }
      }
      
      private function _9646(param1:MouseEvent) : void
      {
         _1198.setCursor(_1405.AUTO);
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         super.partAdded(param1,param2);
         if(param2 == this._9644)
         {
            this._9647.source = this._9644;
         }
         else if(param2 == this._9643)
         {
            if(this._9647.y < 121)
            {
               this._9647.source = this._9643;
            }
            else
            {
               this._9647.source = this._9644;
            }
         }
      }
      
      override protected function _2438() : void
      {
         super._2438();
         var _loc1_:Label = new Label();
         _loc1_.text = tr("ColorWindow.SelectColor");
         _loc1_.x = 7;
         _loc1_.y = 7;
         _loc1_.textColor = 14803425;
         addElement(_loc1_);
         this._9683 = new _1105();
         this._9683.x = 279;
         this._9683.y = 27;
         this._9683.source = this._9671();
         addElement(this._9683);
         _loc1_ = new Label();
         _loc1_.text = tr("ColorWindow.NewColor");
         _loc1_.right = 26;
         _loc1_.y = 7;
         _loc1_.textColor = 14803425;
         addElement(_loc1_);
         _loc1_ = new Label();
         _loc1_.text = tr("ColorWindow.CurrentColor");
         _loc1_.right = 26;
         _loc1_.y = 90;
         _loc1_.textColor = 14803425;
         addElement(_loc1_);
         this._9682 = new _1386();
         this._9682.percentHeight = this._9682.percentWidth = 100;
         addElement(this._9682);
         this._9651 = new Group();
         this._9651.mouseChildren = false;
         this._9651.clipAndEnableScrolling = true;
         this._9651.x = 7;
         this._9651.y = 27;
         this._9667 = new _1140();
         this._9667.width = this._9667.height = 256;
         this._9651.width = this._9651.height = 256;
         this._9651.addElement(this._9667);
         var _loc2_:_1140 = new _1140();
         _loc2_.width = _loc2_.height = 256;
         this._9679(_loc2_,16777215);
         this._9651.addElement(_loc2_);
         var _loc3_:_1140 = new _1140();
         _loc3_.width = _loc3_.height = 256;
         this._9679(_loc3_,0,-90);
         this._9651.addElement(_loc3_);
         addElement(this._9651);
         this._9651._2449();
         this._9678 = new _1390();
         this._9678.skinName = _1452;
         this._9678.x = 270;
         this._9678.y = 27;
         this._9678.maximum = 256 * 6 - 1;
         this._9678.addEventListener(Event.CHANGE,this._9645);
         this._9678.minimum = 0;
         addElement(this._9678);
         var _loc4_:Group = new Group();
         var _loc5_:_1189;
         (_loc5_ = new _1189()).gap = 16;
         _loc4_.layout = _loc5_;
         _loc4_.right = 16;
         _loc4_.bottom = 16;
         addElement(_loc4_);
         var _loc6_:Button;
         (_loc6_ = new Button()).skinName = _1227;
         _loc6_.width = 70;
         _loc6_.label = tr("ColorWindow.Restore");
         _loc6_.addEventListener(MouseEvent.CLICK,this._9658);
         _loc4_.addElement(_loc6_);
         var _loc7_:Button;
         (_loc7_ = new Button()).skinName = _1227;
         _loc7_.width = 70;
         _loc7_.label = tr("Alert.Confirm");
         _loc7_.addEventListener(MouseEvent.CLICK,this._9657);
         _loc4_.addElement(_loc7_);
         var _loc8_:Button;
         (_loc8_ = new Button()).skinName = _1227;
         _loc8_.width = 70;
         _loc8_.label = tr("Alert.Cancel");
         _loc8_.addEventListener(MouseEvent.CLICK,this._2517);
         _loc4_.addElement(_loc8_);
         var _loc9_:Group = new Group();
         var _loc10_:_1197;
         (_loc10_ = new _1197()).gap = 5;
         _loc9_.right = 7;
         _loc9_.layout = _loc10_;
         _loc9_.y = 132;
         addElement(_loc9_);
         _loc4_ = new Group();
         (_loc5_ = new _1189()).gap = 5;
         _loc5_.verticalAlign = _1196.MIDDLE;
         _loc4_.layout = _loc5_;
         _loc1_ = new Label();
         _loc1_.textColor = 14803425;
         _loc1_.text = "R:";
         _loc4_.addElement(_loc1_);
         this._9676 = new TextInput();
         this._9676.addEventListener(Event.CHANGE,this._9670);
         this._9676.addEventListener(FocusEvent.FOCUS_OUT,this._7427);
         this._9676.maxChars = 3;
         this._9676.restrict = "0-9";
         this._9676.width = 38;
         _loc4_.addElement(this._9676);
         _loc9_.addElement(_loc4_);
         _loc4_ = new Group();
         (_loc5_ = new _1189()).gap = 5;
         _loc5_.verticalAlign = _1196.MIDDLE;
         _loc4_.layout = _loc5_;
         _loc1_ = new Label();
         _loc1_.textColor = 14803425;
         _loc1_.text = "G:";
         _loc4_.addElement(_loc1_);
         this._9675 = new TextInput();
         this._9675.addEventListener(Event.CHANGE,this._9670);
         this._9675.addEventListener(FocusEvent.FOCUS_OUT,this._7427);
         this._9675.maxChars = 3;
         this._9675.restrict = "0-9";
         this._9675.width = 38;
         _loc4_.addElement(this._9675);
         _loc9_.addElement(_loc4_);
         _loc4_ = new Group();
         (_loc5_ = new _1189()).gap = 5;
         _loc5_.verticalAlign = _1196.MIDDLE;
         _loc4_.layout = _loc5_;
         _loc1_ = new Label();
         _loc1_.textColor = 14803425;
         _loc1_.text = "B:";
         _loc4_.addElement(_loc1_);
         this._9674 = new TextInput();
         this._9674.addEventListener(Event.CHANGE,this._9670);
         this._9674.addEventListener(FocusEvent.FOCUS_OUT,this._7427);
         this._9674.maxChars = 3;
         this._9674.restrict = "0-9";
         this._9674.width = 38;
         _loc4_.addElement(this._9674);
         _loc9_.addElement(_loc4_);
         _loc4_ = new Group();
         (_loc5_ = new _1189()).gap = 5;
         _loc5_.verticalAlign = _1196.MIDDLE;
         _loc4_.layout = _loc5_;
         _loc1_ = new Label();
         _loc1_.textColor = 14803425;
         _loc1_.text = "#";
         _loc4_.addElement(_loc1_);
         this._9668 = new TextInput();
         this._9668.addEventListener(Event.CHANGE,this._9654);
         this._9668.addEventListener(FocusEvent.FOCUS_OUT,this._9639);
         this._9668.restrict = "0-9a-fA-F";
         this._9668.width = 60;
         _loc4_.addElement(this._9668);
         _loc4_.y = 231;
         _loc4_.right = 7;
         addElement(_loc4_);
         _loc9_ = new Group();
         (_loc10_ = new _1197()).gap = 0;
         _loc9_.layout = _loc10_;
         _loc9_.right = 7;
         _loc9_.y = 27;
         addElement(_loc9_);
         this._9648 = new _1140();
         this._9648.width = 62;
         this._9648.height = 28;
         _loc9_.addElement(this._9648);
         this._9661 = new _1140();
         this._9661.width = 62;
         this._9661.height = 28;
         this._9661.addEventListener(MouseEvent.CLICK,this._9650);
         _loc9_.addElement(this._9661);
         this._9651.addEventListener(MouseEvent.MOUSE_DOWN,this._9640);
         this._9651.addEventListener(MouseEvent.ROLL_OVER,this._4233);
         this._9651.addEventListener(MouseEvent.ROLL_OUT,this._4237);
         this._9647 = new _1105();
         if(this._9644 != null)
         {
            this._9647.source = this._9644;
         }
         this._9651.addElement(this._9647);
         this._9649(this._9630);
         this._9672(this._9630);
         this._9662(this._9677);
         this._9666(this._9630);
         this._9638(this._9630);
      }
      
      protected function _9639(param1:FocusEvent) : void
      {
         var _loc2_:TextInput = param1.currentTarget as TextInput;
         var _loc3_:String = _loc2_.text.toUpperCase();
         while(_loc3_.length < 6)
         {
            _loc3_ = "0" + _loc3_;
         }
         _loc2_.text = _loc3_;
      }
      
      protected function _7427(param1:FocusEvent) : void
      {
         var _loc2_:TextInput = param1.currentTarget as TextInput;
         var _loc3_:uint = uint(_loc2_.text);
         if(_loc3_ > 255)
         {
            _loc3_ = 255;
         }
         _loc2_.text = _loc3_.toString();
      }
      
      protected function _9654(param1:Event) : void
      {
         this._9652 = true;
         var _loc2_:String = this._9668.text;
         if(_loc2_.indexOf("0x") == 0)
         {
            _loc2_ = _loc2_.slice(2);
         }
         if(_loc2_.indexOf("#") == 0)
         {
            _loc2_ = _loc2_.slice(1);
         }
         if(_loc2_.length > 6)
         {
            _loc2_ = _loc2_.slice(0,6);
         }
         var _loc3_:int = this._9668.selectionBeginIndex;
         var _loc4_:int = this._9668.selectionEndIndex;
         this._9668.text = _loc2_;
         this._9668.setSelection(_loc3_,_loc4_);
         var _loc5_:uint = uint("0x" + this._9668.text);
         this._4061 = _loc5_;
         this._9652 = false;
         this._9656();
      }
      
      protected function _9670(param1:Event) : void
      {
         this._9665 = true;
         var _loc2_:uint = uint(this._9676.text);
         var _loc3_:uint = uint(this._9675.text);
         var _loc4_:uint = uint(this._9674.text);
         this._4061 = this._9680(Math.min(255,_loc2_),Math.min(255,_loc3_),Math.min(255,_loc4_));
         this._9665 = false;
         this._9656();
      }
      
      protected function _9650(param1:MouseEvent) : void
      {
         this._9682._2581();
         this._4061 = this._9677;
         this._9656();
      }
      
      private function _4237(param1:MouseEvent) : void
      {
         this._9684 = false;
         if(param1.buttonDown)
         {
            return;
         }
         _1198._1602(_1405.DESKTOP_CIRCLE);
      }
      
      private function _4233(param1:MouseEvent) : void
      {
         this._9684 = true;
         if(param1.buttonDown)
         {
            return;
         }
         _1198.setCursor(_1405.DESKTOP_CIRCLE,1);
      }
      
      private function _9666(param1:uint) : void
      {
         this._9653 = this._9685(param1);
         this._9678.value = this._9653;
         var _loc2_:uint = uint(this._9673[this._9653]);
         this._9655(_loc2_);
      }
      
      private function _9638(param1:uint) : void
      {
         this._9647.x = this._9663(this._9630) - 7;
         this._9647.y = 255 - this._9669(this._9630) - 7;
         if(this._9647.y < 121 && this._9643 != null)
         {
            this._9647.source = this._9643;
         }
         else if(this._9644 != null)
         {
            this._9647.source = this._9644;
         }
      }
      
      private function _9640(param1:MouseEvent) : void
      {
         this._9682._2581();
         this.onMouseMove(param1);
         this.stage.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         this.stage.addEventListener(MouseEvent.MOUSE_UP,this._4083);
      }
      
      private function _4083(param1:Event) : void
      {
         if(!this._9684)
         {
            _1198._1602(_1405.DESKTOP_CIRCLE);
         }
         this.stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         this.stage.removeEventListener(MouseEvent.MOUSE_UP,this._4083);
      }
      
      private function onMouseMove(param1:MouseEvent) : void
      {
         var _loc2_:int = Math.max(0,Math.min(255,this._9651.mouseX));
         var _loc3_:int = Math.max(0,Math.min(255,this._9651.mouseY));
         this._9647.x = _loc2_ - 7;
         this._9647.y = _loc3_ - 7;
         if(this._9647.y < 121 && this._9643 != null)
         {
            this._9647.source = this._9643;
         }
         else if(this._9644 != null)
         {
            this._9647.source = this._9644;
         }
         var _loc4_:int = this._9653 * 360 / (256 * 6);
         this._9630 = this._9681(_loc4_,_loc2_ / 255,(255 - _loc3_) / 255);
         if(this._9648)
         {
            this._9649(this._9630);
         }
         if(this._9668)
         {
            this._9672(this._9630);
         }
         param1.updateAfterEvent();
         this._9656();
      }
      
      private function _9645(param1:Event) : void
      {
         this._9653 = this._9678.value;
         var _loc2_:uint = uint(this._9673[this._9653]);
         this._9655(_loc2_);
         var _loc3_:int = this._9647.x + 7;
         var _loc4_:int = this._9647.y + 7;
         var _loc5_:int = this._9653 * 360 / (256 * 6);
         this._9630 = this._9681(_loc5_,_loc3_ / 255,(255 - _loc4_) / 255);
         if(this._9648)
         {
            this._9649(this._9630);
         }
         if(this._9668)
         {
            this._9672(this._9630);
         }
         this._9656();
      }
      
      override protected function _2517(param1:MouseEvent = null) : void
      {
         this._4061 = this._9677;
         this.dispatchEvent(new Event(Event.CANCEL));
         super._2517();
      }
      
      private function _9658(param1:MouseEvent) : void
      {
         this._4061 = this._9631;
         this.dispatchEvent(new Event(Event.CHANGE));
         this.dispatchEvent(new Event(Event.CLEAR));
         this.close();
      }
      
      private function _9657(param1:MouseEvent = null) : void
      {
         this.dispatchEvent(new UIEvent(UIEvent.CONFIRM));
         this.close();
      }
      
      private function _9656() : void
      {
         if(this._6193)
         {
            this.dispatchEvent(new Event(Event.CHANGE));
         }
      }
      
      private function _9672(param1:uint) : void
      {
         var _loc2_:* = 0;
         var _loc3_:* = 0;
         var _loc4_:* = 0;
         var _loc5_:String = null;
         if(!this._9665)
         {
            _loc2_ = param1 >> 16;
            _loc3_ = param1 >> 8 & 0xFF;
            _loc4_ = param1 & 0xFF;
            this._9676.text = _loc2_.toString();
            this._9675.text = _loc3_.toString();
            this._9674.text = _loc4_.toString();
         }
         if(!this._9652)
         {
            _loc5_ = param1.toString(16).toUpperCase();
            while(_loc5_.length < 6)
            {
               _loc5_ = "0" + _loc5_;
            }
            this._9668.text = _loc5_;
         }
      }
      
      private function _9649(param1:uint) : void
      {
         var _loc2_:Graphics = this._9648.graphics;
         _loc2_.clear();
         _loc2_.beginFill(param1);
         _loc2_.drawRect(0,0,this._9648.width,this._9648.height);
         _loc2_.endFill();
      }
      
      private function _9662(param1:uint) : void
      {
         var _loc2_:Graphics = this._9661.graphics;
         _loc2_.clear();
         _loc2_.beginFill(param1);
         _loc2_.drawRect(0,0,this._9661.width,this._9661.height);
         _loc2_.endFill();
      }
      
      private function _9679(param1:_1140, param2:uint, param3:Number = 0) : void
      {
         var _loc4_:Graphics = param1.graphics;
         _loc4_.clear();
         var _loc5_:Matrix = new Matrix();
         _loc5_.createGradientBox(param1.width,param1.height,Math.PI * param3 / 180);
         _loc4_.beginGradientFill(GradientType.LINEAR,[param2,param2],[1,0],[0,255],_loc5_);
         _loc4_.drawRect(0,0,param1.width,param1.height);
         _loc4_.endFill();
      }
      
      private function _9671() : BitmapData
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:uint = 0;
         var _loc1_:_1140 = new _1140();
         var _loc2_:Graphics = _loc1_.graphics;
         _loc2_.clear();
         var _loc7_:int = 0;
         var _loc8_:int = 19;
         _loc3_ = 255;
         _loc4_ = 0;
         _loc5_ = 0;
         while(_loc5_ < 256)
         {
            _loc6_ = this._9680(_loc3_,_loc4_,_loc5_);
            this._9673[256 * 6 - _loc7_ - 1] = _loc6_;
            if(_loc7_ % 6 == 0)
            {
               _loc2_.beginFill(_loc6_);
               _loc2_.drawRect(0,_loc7_ / 6,_loc8_,1);
            }
            _loc7_++;
            _loc5_++;
         }
         _loc4_ = 0;
         _loc5_ = 255;
         _loc3_ = 255;
         while(_loc3_ >= 0)
         {
            _loc6_ = this._9680(_loc3_,_loc4_,_loc5_);
            this._9673[256 * 6 - _loc7_ - 1] = _loc6_;
            if(_loc7_ % 6 == 0)
            {
               _loc2_.beginFill(_loc6_);
               _loc2_.drawRect(0,_loc7_ / 6,_loc8_,1);
            }
            _loc7_++;
            _loc3_--;
         }
         _loc3_ = 0;
         _loc5_ = 255;
         _loc4_ = 0;
         while(_loc4_ < 256)
         {
            _loc6_ = this._9680(_loc3_,_loc4_,_loc5_);
            this._9673[256 * 6 - _loc7_ - 1] = _loc6_;
            if(_loc7_ % 6 == 0)
            {
               _loc2_.beginFill(_loc6_);
               _loc2_.drawRect(0,_loc7_ / 6,_loc8_,1);
            }
            _loc7_++;
            _loc4_++;
         }
         _loc3_ = 0;
         _loc4_ = 255;
         _loc5_ = 255;
         while(_loc5_ >= 0)
         {
            _loc6_ = this._9680(_loc3_,_loc4_,_loc5_);
            this._9673[256 * 6 - _loc7_ - 1] = _loc6_;
            if(_loc7_ % 6 == 0)
            {
               _loc2_.beginFill(_loc6_);
               _loc2_.drawRect(0,_loc7_ / 6,_loc8_,1);
            }
            _loc7_++;
            _loc5_--;
         }
         _loc4_ = 255;
         _loc5_ = 0;
         _loc3_ = 0;
         while(_loc3_ < 256)
         {
            _loc6_ = this._9680(_loc3_,_loc4_,_loc5_);
            this._9673[256 * 6 - _loc7_ - 1] = _loc6_;
            if(_loc7_ % 6 == 0)
            {
               _loc2_.beginFill(_loc6_);
               _loc2_.drawRect(0,_loc7_ / 6,_loc8_,1);
            }
            _loc7_++;
            _loc3_++;
         }
         _loc3_ = 255;
         _loc5_ = 0;
         _loc4_ = 255;
         while(_loc4_ >= 0)
         {
            _loc6_ = this._9680(_loc3_,_loc4_,_loc5_);
            this._9673[256 * 6 - _loc7_ - 1] = _loc6_;
            if(_loc7_ % 6 == 0)
            {
               _loc2_.beginFill(_loc6_);
               _loc2_.drawRect(0,_loc7_ / 6,_loc8_,1);
            }
            _loc7_++;
            _loc4_--;
         }
         _loc2_.endFill();
         var _loc9_:BitmapData = new BitmapData(_loc8_,256,true,0);
         _loc9_.draw(_loc1_);
         return _loc9_;
      }
      
      private function _9680(param1:uint, param2:uint, param3:uint) : uint
      {
         return (param1 << 16) + (param2 << 8) + param3;
      }
      
      private function _9685(param1:uint) : uint
      {
         var _loc2_:* = param1 >> 16;
         var _loc3_:* = param1 >> 8 & 0xFF;
         var _loc4_:* = param1 & 0xFF;
         var _loc5_:int = Math.max(_loc2_,_loc3_,_loc4_);
         var _loc6_:int = Math.min(_loc2_,_loc3_,_loc4_);
         if(_loc5_ == _loc6_)
         {
            return 0;
         }
         if(_loc5_ == _loc2_ && _loc3_ >= _loc4_)
         {
            return 256 * (_loc3_ - _loc4_) / (_loc5_ - _loc6_);
         }
         if(_loc5_ == _loc2_ && _loc3_ < _loc4_)
         {
            return 256 * (_loc3_ - _loc4_) / (_loc5_ - _loc6_) + 256 * 6;
         }
         if(_loc5_ == _loc3_)
         {
            return 256 * (_loc4_ - _loc2_) / (_loc5_ - _loc6_) + 512;
         }
         return 256 * (_loc2_ - _loc3_) / (_loc5_ - _loc6_) + 256 * 4;
      }
      
      private function _9663(param1:uint) : uint
      {
         var _loc2_:* = param1 >> 16;
         var _loc3_:* = param1 >> 8 & 0xFF;
         var _loc4_:* = param1 & 0xFF;
         var _loc5_:uint = Math.max(_loc2_,_loc3_,_loc4_);
         var _loc6_:uint = Math.min(_loc2_,_loc3_,_loc4_);
         if(_loc5_ == 0)
         {
            return 0;
         }
         return (1 - _loc6_ / _loc5_) * 255;
      }
      
      private function _9669(param1:uint) : uint
      {
         var _loc2_:* = param1 >> 16;
         var _loc3_:* = param1 >> 8 & 0xFF;
         var _loc4_:* = param1 & 0xFF;
         return Math.max(_loc2_,_loc3_,_loc4_);
      }
      
      private function _9681(param1:uint, param2:Number, param3:Number) : uint
      {
         var _loc9_:uint = 0;
         if(param2 == 0)
         {
            return this._9680(param3 * 255,param3 * 255,param3 * 255);
         }
         var _loc4_:int = int(param1 / 60) % 6;
         var _loc5_:Number = param1 / 60 - _loc4_;
         var _loc6_:int = param3 * (1 - param2) * 255;
         var _loc7_:int = param3 * (1 - _loc5_ * param2) * 255;
         var _loc8_:int = param3 * (1 - (1 - _loc5_) * param2) * 255;
         param3 = int(param3 * 255);
         switch(_loc4_)
         {
            case 0:
               _loc9_ = this._9680(param3,_loc8_,_loc6_);
               break;
            case 1:
               _loc9_ = this._9680(_loc7_,param3,_loc6_);
               break;
            case 2:
               _loc9_ = this._9680(_loc6_,param3,_loc8_);
               break;
            case 3:
               _loc9_ = this._9680(_loc6_,_loc7_,param3);
               break;
            case 4:
               _loc9_ = this._9680(_loc8_,_loc6_,param3);
               break;
            case 5:
               _loc9_ = this._9680(param3,_loc6_,_loc7_);
         }
         return _loc9_;
      }
      
      private function _9655(param1:uint) : void
      {
         var _loc2_:Graphics = this._9667.graphics;
         _loc2_.clear();
         _loc2_.beginFill(param1);
         _loc2_.drawRect(0,0,256,256);
         _loc2_.endFill();
         this._9642 = new BitmapData(256,256,true,0);
         this._9642.draw(this._9651);
      }
   }
}

