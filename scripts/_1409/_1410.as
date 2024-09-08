package _1409
{
   import _1413._1412;
   import _1416._1415;
   import _1416._1417;
   import _1419._1418;
   import _1421.FTETextEvent;
   import _1421.FTETextSelectionEvent;
   import egret.utils.SystemInfo;
   import egret.utils._99;
   import egret.utils.tr;
   import flash.desktop.Clipboard;
   import flash.desktop.ClipboardFormats;
   import flash.display.NativeMenu;
   import flash.display.NativeMenuItem;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.IMEEvent;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.events.TextEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.system.IME;
   import flash.text.TextFormatAlign;
   import flash.text.engine.ContentElement;
   import flash.text.engine.ElementFormat;
   import flash.text.engine.FontDescription;
   import flash.text.engine.FontPosture;
   import flash.text.engine.FontWeight;
   import flash.text.engine.GroupElement;
   import flash.text.engine.TextElement;
   import flash.text.engine.TextLine;
   import flash.text.ime.CompositionAttributeRange;
   import flash.text.ime.IIMEClient;
   import flash.ui.Keyboard;
   import flash.ui.Mouse;
   import flash.ui.MouseCursor;
   import flash.utils.getTimer;
   import flash.utils.setTimeout;
   import mx.utils.StringUtil;
   
   public class _1410 extends _1408 implements _1411, IIMEClient
   {
      private var _9895:Shape;
      
      private var _9903:Shape;
      
      private var _9892:Shape;
      
      private var ibeam:_1418;
      
      private var _9896:_1412;
      
      private var container:Sprite;
      
      private var _9740:NativeMenu;
      
      private var _9925:NativeMenu;
      
      private var _8539:int = 0;
      
      private var _7445:int = 0;
      
      private var _7444:String = null;
      
      private var _7658:Boolean = false;
      
      private var _7639:Boolean = false;
      
      private var _9926:uint = 0;
      
      private var _9853:uint = 13421772;
      
      private var _9852:Number = 0;
      
      private var _9897:uint = 15658734;
      
      private var _9898:Number = 0;
      
      private var _9935:int = 14;
      
      private var _8541:Boolean = false;
      
      private var _8540:Boolean = false;
      
      private var _9865:uint = 11916799;
      
      private var _8534:String = "SimSun";
      
      private var _9930:uint = 0;
      
      private var _9878:uint = 0;
      
      private var _8531:int = 0;
      
      private var _9929:String = "";
      
      private var _text:String = "";
      
      private var _9904:Boolean = false;
      
      private var _9920:int = 0;
      
      private var _9942:int = 0;
      
      private var _9939:int = 0;
      
      private var _width:Number = NaN;
      
      private var _9928:Number = NaN;
      
      private var _height:Number = NaN;
      
      private var _9921:Number = NaN;
      
      private var _7570:Boolean = false;
      
      private var _8533:Boolean = false;
      
      private var _9327:int;
      
      private var _9329:int;
      
      private var _9331:Boolean = true;
      
      private var _9231:Boolean;
      
      private var _9854:int = 0;
      
      private var _9936:Boolean = true;
      
      private var _9934:Boolean = false;
      
      private var _9943:String = "left";
      
      private var _stage:Stage;
      
      private var _9870:int;
      
      private var _9882:int;
      
      private var _9899:int = 0;
      
      private var _9877:int = 0;
      
      private var _9912:int = -1;
      
      private var _9871:int = -1;
      
      private var _9885:int = -1;
      
      private var _9884:int = 0;
      
      private var _9913:Number = 0;
      
      private var _9860:int = 0;
      
      private var _9866:int = 0;
      
      private var _9863:ElementFormat;
      
      private var _9902:ElementFormat;
      
      private var _9933:String = "";
      
      public function _1410()
      {
         super();
         this._9900(false);
         this._9895 = new Shape();
         this._9895.graphics.beginFill(this._9897,this._9898);
         this._9895.graphics.drawRect(0,0,100,100);
         this._9895.graphics.endFill();
         this.addChild(this._9895);
         this.container = new Sprite();
         this.addChild(this.container);
         this._9892 = new Shape();
         this.container.addChild(this._9892);
         this._9903 = new Shape();
         this.container.addChild(this._9903);
         this.ibeam = new _1418();
         this.ibeam.color = 0;
         this.ibeam.visible = false;
         this.container.addChild(this.ibeam);
         this._9896 = new _1412();
         this._9896.init(this);
         this.selectable = true;
         this.text = "";
         this._9914();
         this.tabEnabled = true;
      }
      
      protected function _9346(param1:MouseEvent) : void
      {
         if(this.stage)
         {
            this.stage.focus = this;
         }
      }
      
      override public function set contextMenu(param1:NativeMenu) : void
      {
         super.contextMenu = param1;
         this._9740 = param1;
         if(this.selectable)
         {
            this._9891();
         }
         else
         {
            this._9887();
         }
      }
      
      private function _9914() : void
      {
         this._9925 = new NativeMenu();
         this._9925.addEventListener(Event.DISPLAYING,this._9859);
         this._9894(tr("RightMenu.cut"),"cut","default");
         this._9894(tr("RightMenu.copy"),"copy","default");
         this._9894(tr("RightMenu.paste"),"paste","default");
         this._9894(tr("RightMenu.clear"),"delete","default");
         this._9894(tr("RightMenu.selectAll"),"selectAll","default");
      }
      
      protected function _9859(param1:Event) : void
      {
         this._9883("cut",true);
         this._9883("copy",true);
         this._9883("paste",true);
         this._9883("delete",true);
         this._9883("selectAll",true);
         if(this.displayAsPassword)
         {
            this._9883("cut",false);
            this._9883("copy",false);
         }
         if(!this.selectable)
         {
            this._9883("cut",false);
            this._9883("copy",false);
            this._9883("paste",false);
            this._9883("delete",false);
         }
         if(!this.editable)
         {
            this._9883("cut",false);
            this._9883("paste",false);
            this._9883("delete",false);
         }
      }
      
      private function _9891() : void
      {
         if(super.contextMenu == null)
         {
            super.contextMenu = this._9925;
         }
      }
      
      private function _9887() : void
      {
         if(!this._9880() && this._9740 == null)
         {
            super.contextMenu = null;
         }
      }
      
      private function _9880() : Boolean
      {
         if(super.contextMenu == null)
         {
            return true;
         }
         if(super.contextMenu == this._9925)
         {
            return true;
         }
         if(super.contextMenu.numItems == 5)
         {
            if(super.contextMenu.getItemAt(0).data && contextMenu.getItemAt(0).data.id == "cut" && super.contextMenu.getItemAt(1).data && contextMenu.getItemAt(1).data.id == "copy" && super.contextMenu.getItemAt(2).data && contextMenu.getItemAt(2).data.id == "paste" && super.contextMenu.getItemAt(3).data && contextMenu.getItemAt(3).data.id == "delete" && super.contextMenu.getItemAt(4).data && contextMenu.getItemAt(4).data.id == "selectAll")
            {
               return true;
            }
         }
         return false;
      }
      
      private function _9894(param1:String, param2:String = null, param3:String = "") : void
      {
         var _loc4_:NativeMenuItem = null;
         if(param1 == "")
         {
            (_loc4_ = new NativeMenuItem(param1,true)).data = {"type":param3};
         }
         else
         {
            (_loc4_ = new NativeMenuItem(param1)).data = {
               "id":param2,
               "type":param3
            };
            _loc4_.addEventListener(Event.SELECT,this._9855);
         }
         this._9925.addItem(_loc4_);
      }
      
      private function _9855(param1:Event) : void
      {
         switch(param1.target.data.id)
         {
            case "cut":
               this.cut();
               break;
            case "copy":
               this.copy();
               break;
            case "paste":
               this.paste();
               break;
            case "delete":
               this.clear();
               break;
            case "selectAll":
               this.selectAll();
         }
      }
      
      private function _9883(param1:String, param2:Boolean) : void
      {
         var _loc4_:NativeMenuItem = null;
         var _loc3_:int = 0;
         while(_loc3_ < this._9925.items.length)
         {
            _loc4_ = this._9925.getItemAt(_loc3_);
            if(Boolean(_loc4_.data) && _loc4_.data.id == param1)
            {
               _loc4_.enabled = param2;
            }
            _loc3_++;
         }
      }
      
      public function get leading() : int
      {
         return this._8539;
      }
      
      public function set leading(param1:int) : void
      {
         this._8539 = param1;
         this._9911();
      }
      
      public function get maxChars() : int
      {
         return this._7445;
      }
      
      public function set maxChars(param1:int) : void
      {
         this._7445 = param1;
      }
      
      public function get restrict() : String
      {
         return this._7444;
      }
      
      public function set restrict(param1:String) : void
      {
         this._7444 = param1;
      }
      
      public function get caretIndex() : int
      {
         if(this._9882 >= this._9870)
         {
            return this._9882;
         }
         return this._9870;
      }
      
      public function get multiline() : Boolean
      {
         return this._7658;
      }
      
      public function set multiline(param1:Boolean) : void
      {
         this._7658 = param1;
      }
      
      public function get displayAsPassword() : Boolean
      {
         return this._7639;
      }
      
      public function set displayAsPassword(param1:Boolean) : void
      {
         this._7639 = param1;
         this._9911();
      }
      
      public function get _9739() : uint
      {
         return this._9926;
      }
      
      public function set _9739(param1:uint) : void
      {
         this._9926 = param1;
         this.ibeam.color = this._9926;
      }
      
      public function get _9738() : int
      {
         return this.ibeam.width;
      }
      
      public function set _9738(param1:int) : void
      {
         this.ibeam.width = param1;
      }
      
      public function get _9857() : uint
      {
         return this._9853;
      }
      
      public function set _9857(param1:uint) : void
      {
         this._9853 = param1;
         this._9874();
      }
      
      public function get _9858() : Number
      {
         return this._9852;
      }
      
      public function set _9858(param1:Number) : void
      {
         this._9852 = param1;
         if(this._9852 < 0)
         {
            this._9852 = 0;
         }
         if(this._9852 > 1)
         {
            this._9852 = 1;
         }
         this._9874();
      }
      
      public function get _9909() : uint
      {
         return this._9897;
      }
      
      public function set _9909(param1:uint) : void
      {
         this._9897 = param1;
         this._9895.graphics.clear();
         this._9895.graphics.beginFill(this._9897,this._9898);
         this._9895.graphics.drawRect(0,0,100,100);
         this._9895.graphics.endFill();
         this._9868();
      }
      
      public function get _9910() : Number
      {
         return this._9898;
      }
      
      public function set _9910(param1:Number) : void
      {
         this._9898 = param1;
         if(this._9898 < 0)
         {
            this._9898 = 0;
         }
         if(this._9898 > 1)
         {
            this._9898 = 1;
         }
         this._9895.graphics.clear();
         this._9895.graphics.beginFill(this._9897,this._9898);
         this._9895.graphics.drawRect(0,0,100,100);
         this._9895.graphics.endFill();
         this._9868();
      }
      
      public function get fontSize() : int
      {
         return this._9935;
      }
      
      public function set fontSize(param1:int) : void
      {
         this._9935 = param1;
         this._9900();
      }
      
      public function get bold() : Boolean
      {
         return this._8541;
      }
      
      public function set bold(param1:Boolean) : void
      {
         this._8541 = param1;
         this._9900();
      }
      
      public function get italic() : Boolean
      {
         return this._8540;
      }
      
      public function set italic(param1:Boolean) : void
      {
         this._8540 = param1;
         this._9900();
      }
      
      public function get _9737() : int
      {
         return this._9935 * 1.4;
      }
      
      public function get _9867() : uint
      {
         return this._9865;
      }
      
      public function set _9867(param1:uint) : void
      {
         this._9865 = param1;
      }
      
      public function get fontFamily() : String
      {
         return this._8534;
      }
      
      public function set fontFamily(param1:String) : void
      {
         this._8534 = param1;
         this._9900();
      }
      
      public function get _9741() : uint
      {
         return this._9930;
      }
      
      public function set _9741(param1:uint) : void
      {
         this._9930 = param1;
         this._9900();
      }
      
      public function get _9879() : uint
      {
         return this._9878;
      }
      
      public function set _9879(param1:uint) : void
      {
         this._9878 = param1;
         this._9900();
      }
      
      public function get letterSpacing() : int
      {
         return this._8531;
      }
      
      public function set letterSpacing(param1:int) : void
      {
         this._8531 = param1;
         this._9900();
      }
      
      public function replaceText(param1:int, param2:int, param3:String, param4:Boolean = true, param5:Boolean = true) : Boolean
      {
         var _loc13_:FTETextEvent = null;
         if(!this._9231)
         {
            IME.compositionAbandoned();
         }
         this._9870 = param1;
         this._9882 = param2;
         var _loc6_:String = "";
         _loc6_ = this.text.slice(param1,param2);
         if(this._9882 > this._text.length)
         {
            this._9882 = this._text.length;
         }
         if(this._9870 > this._text.length)
         {
            this._9870 = this._text.length;
         }
         if(this._9870 < 0)
         {
            this._9870 = 0;
         }
         if(this._9882 < 0)
         {
            this._9882 = 0;
         }
         if(this._9882 == this._9870 && param3.length == 0)
         {
            return false;
         }
         var _loc7_:int = this._9870;
         var _loc8_:int = this._9882;
         var _loc9_:Boolean = false;
         if(this._9870 != this._9882)
         {
            _loc9_ = true;
         }
         var _loc10_:String = this._text.slice(0,this.selectionBeginIndex);
         var _loc11_:String = param3;
         var _loc12_:String = this._text.slice(this.selectionEndIndex);
         this._9870 = param1 + param3.length;
         this._9882 = this._9870;
         this._text = _loc10_ + _loc11_ + _loc12_;
         this._9911();
         this._9938();
         if(this._9929 != this.text)
         {
            (_loc13_ = new FTETextEvent(FTETextEvent.FTE_TEXT_CHANGED))._9924 = Math.max(_loc7_,0);
            _loc13_._9937 = Math.max(_loc8_,0);
            _loc13_._9931 = _loc6_;
            _loc13_._9927 = Math.max(param1,0);
            _loc13_._9940 = Math.max(param1 + param3.length,0);
            _loc13_._9941 = param3;
            _loc13_._9915 = param5;
            this.dispatchEvent(_loc13_);
         }
         this._9929 = this.text;
         return _loc9_;
      }
      
      public function get text() : String
      {
         return this._text;
      }
      
      public function set text(param1:String) : void
      {
         var _loc2_:FTETextEvent = new FTETextEvent(FTETextEvent.FTE_TEXT_CHANGED);
         _loc2_._9931 = this._text;
         var _loc3_:int = this._text.length;
         this._text = param1;
         _loc2_._9941 = this._text;
         _loc2_._9924 = 0;
         _loc2_._9937 = Math.max(_loc3_,0);
         _loc2_._9927 = 0;
         _loc2_._9940 = Math.max(this._text.length,0);
         this._9918();
         this._9911();
         if(this._9929 != this.text)
         {
            dispatchEvent(_loc2_);
         }
         this._9929 = this.text;
         this._9933 = this.text;
      }
      
      public function _9911() : void
      {
         if(!this._9904)
         {
            this._9904 = true;
            _99(function():void
            {
               _9938();
            });
         }
      }
      
      private function _9938() : void
      {
         if(this._9904)
         {
            this._9869();
            this._9874();
         }
      }
      
      private function _9869(param1:Boolean = false) : void
      {
         var _loc2_:TextLine = null;
         var _loc3_:TextLine = null;
         var _loc10_:int = 0;
         var _loc11_:TextLine = null;
         var _loc12_:_1415 = null;
         var _loc13_:int = 0;
         var _loc14_:String = null;
         var _loc15_:_1417 = null;
         var _loc16_:TextElement = null;
         var _loc17_:int = 0;
         var _loc18_:Rectangle = null;
         if(!this._9904 && !param1)
         {
            return;
         }
         this._9904 = false;
         _9845();
         _9848.length = 0;
         var _loc4_:String = "";
         var _loc5_:Number = 0;
         var _loc6_:* = "";
         if(!this._7639)
         {
            _loc6_ = this._text;
         }
         else
         {
            _loc6_ = "";
            _loc10_ = 0;
            while(_loc10_ < this._text.length)
            {
               if(this._text.charAt(_loc10_) != "\n" && this._text.charAt(_loc10_) != "\r")
               {
                  _loc6_ += "*";
               }
               else
               {
                  _loc6_ += this._text.charAt(_loc10_);
               }
               _loc10_++;
            }
            _loc6_ = _loc6_;
         }
         textBlock.content = this._9876(_loc6_);
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:Array = [];
         if(this._9942 < 0)
         {
            this._9942 = 0;
         }
         while(true)
         {
            _loc11_ = _9847();
            if((Boolean(_loc11_)) && recreateTextLine != null)
            {
               _loc3_ = recreateTextLine(_loc11_,_loc2_,!isNaN(this._9928) && this._9934 ? this._9928 : 1000000);
            }
            else
            {
               _loc3_ = textBlock.createTextLine(_loc2_,!isNaN(this._9928) && this._9934 ? this._9928 : 1000000);
            }
            if(!_loc3_)
            {
               break;
            }
            _loc5_ += _loc7_ == 0 ? _loc3_.ascent + (this._9737 / 2 - _loc3_.ascent / 2) : this._9737;
            _loc5_ = _loc5_ += _loc7_ == 0 ? _loc3_.ascent + (this._9737 / 2 - _loc3_.ascent / 2) : this._9737 + (_loc7_ == 0 ? 0 : this._8539);
            if(_loc7_ >= this._9942 && (isNaN(this._9921) || _loc7_ * (this._9737 + this._8539) <= this._9942 * (this._9737 + this._8539) + this._9921))
            {
               _loc3_.y = _loc5_;
               _loc2_ = _loc3_;
               this.container.addChild(_loc3_);
               (_loc15_ = new _1417())._9916 = _loc7_;
               _loc15_.content = _loc2_;
               _9849.push(_loc15_);
            }
            else
            {
               _loc3_.y = _loc5_;
               _loc2_ = _loc3_;
               if(!isNaN(this._9921))
               {
                  _loc9_.push(_loc3_);
               }
               else
               {
                  this.container.addChild(_loc3_);
                  (_loc15_ = new _1417())._9916 = _loc7_;
                  _loc15_.content = _loc2_;
                  _9849.push(_loc15_);
               }
            }
            (_loc12_ = new _1415())._9458 = _loc7_;
            _loc13_ = _loc8_ + _loc2_.atomCount;
            if(_loc13_ < this.text.length)
            {
               if(this.text.charAt(_loc13_) == "\n" && this.text.charAt(_loc13_ - 1) == "\r")
               {
                  _loc13_++;
               }
            }
            _loc12_.content = this._text.slice(_loc8_,_loc13_);
            _loc14_ = _loc12_.content;
            _loc14_ = (_loc14_ = _loc14_.replace(/\r/g,"\\r")).replace(/\n/g,"\\n");
            _9848.push(_loc12_);
            _loc8_ = _loc13_;
            _loc7_++;
         }
         if(this._text.charAt(this._text.length - 1) == "\n" || this._text.charAt(this._text.length - 1) == "\r" || this._text.length == 0)
         {
            (_loc16_ = new TextElement()).elementFormat = this._9902;
            _loc16_.text = "\r";
            textBlock.content = _loc16_;
            _loc11_ = _9847();
            if((Boolean(_loc11_)) && recreateTextLine != null)
            {
               _loc3_ = recreateTextLine(_loc11_,null);
            }
            else
            {
               _loc3_ = textBlock.createTextLine(null);
            }
            if(_loc3_)
            {
               _loc5_ += _loc7_ == 0 ? _loc3_.ascent + (this._9737 / 2 - _loc3_.ascent / 2) : this._9737;
               _loc5_ = _loc5_ += _loc7_ == 0 ? _loc3_.ascent + (this._9737 / 2 - _loc3_.ascent / 2) : this._9737 + this._8539;
               if(_loc7_ >= this._9942 && (isNaN(this._9921) || _loc7_ * (this._9737 + this._8539) <= this._9942 * (this._9737 + this._8539) + this._9921))
               {
                  _loc3_.y = _loc5_;
                  _loc2_ = _loc3_;
                  this.container.addChild(_loc3_);
                  (_loc15_ = new _1417())._9916 = _loc7_;
                  _loc15_.content = _loc2_;
                  _9849.push(_loc15_);
               }
               else
               {
                  _loc3_.y = _loc5_;
                  _loc2_ = _loc3_;
                  if(!isNaN(this._9921))
                  {
                     _loc9_.push(_loc3_);
                  }
                  else
                  {
                     this.container.addChild(_loc3_);
                     (_loc15_ = new _1417())._9916 = _loc7_;
                     _loc15_.content = _loc2_;
                     _9849.push(_loc15_);
                  }
               }
               (_loc12_ = new _1415())._9458 = _loc7_;
               _loc12_.content = "";
               _9848.push(_loc12_);
               _loc8_ += _loc2_.atomCount;
               _loc7_++;
            }
         }
         if(!isNaN(this._9921))
         {
            _loc17_ = (this._9921 + this._8539) / (this._9737 + this._8539);
            this._9920 = _loc7_ - _loc17_;
            if(this._9920 < 0)
            {
               this._9920 = 0;
            }
            _loc18_ = this.container.scrollRect;
            if(!_loc18_)
            {
               _loc18_ = new Rectangle(0,this._9942 * (this._9737 + this._8539),isNaN(this._9928) ? this._9895.width : this._9928,this._9921);
            }
            _loc18_.y = this._9942 * (this._9737 + this._8539);
            _loc18_.height = this._9921;
            _loc18_.width = isNaN(this._9928) ? this._9895.width : this._9928;
            this.container.scrollRect = _loc18_;
            if(_loc7_ - this._9942 < _loc17_ && this._9942 > 0)
            {
               this._9942 = _loc7_ - _loc17_;
               _9845(_loc9_);
               this._9869(true);
               return;
            }
         }
         _9845(_loc9_);
         this._9907();
         this._9868();
         this._9922();
         this._8427();
      }
      
      private function _9876(param1:String) : ContentElement
      {
         var _loc2_:Vector.<ContentElement> = null;
         var _loc3_:String = null;
         var _loc4_:TextElement = null;
         var _loc5_:String = null;
         var _loc6_:String = null;
         var _loc7_:GroupElement = null;
         if(Boolean(this.stage) && this.stage.focus == this)
         {
            _loc2_ = new Vector.<ContentElement>();
            _loc3_ = param1.slice(0,this.selectionBeginIndex);
            (_loc4_ = new TextElement()).text = _loc3_;
            _loc4_.elementFormat = this._9902;
            _loc2_.push(_loc4_);
            _loc5_ = param1.slice(this.selectionBeginIndex,this.selectionEndIndex);
            (_loc4_ = new TextElement()).text = _loc5_;
            _loc4_.elementFormat = this._9863;
            _loc2_.push(_loc4_);
            _loc6_ = param1.slice(this.selectionEndIndex);
            (_loc4_ = new TextElement()).text = _loc6_;
            _loc4_.elementFormat = this._9902;
            _loc2_.push(_loc4_);
            return new GroupElement(_loc2_);
         }
         (_loc4_ = new TextElement()).text = param1;
         _loc4_.elementFormat = this._9902;
         return _loc4_;
      }
      
      private function _9922() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < _9849.length)
         {
            if(this.align == TextFormatAlign.CENTER)
            {
               _9849[_loc1_].content.x = int(this._9895.width / 2 - _9849[_loc1_].content.width / 2);
            }
            else if(this.align == TextFormatAlign.RIGHT)
            {
               _9849[_loc1_].content.x = int(this._9895.width - _9849[_loc1_].content.width);
            }
            else
            {
               _9849[_loc1_].content.x = 0;
            }
            _loc1_++;
         }
      }
      
      private function _9868() : void
      {
         var _loc2_:int = 0;
         var _loc3_:Rectangle = null;
         var _loc1_:Number = 10;
         if(_9849.length > 0)
         {
            _loc2_ = 0;
            while(_loc2_ < _9849.length)
            {
               if(TextLine(_9849[_loc2_].content).atomCount > 0)
               {
                  _loc3_ = TextLine(_9849[_loc2_].content).getAtomBounds(TextLine(_9849[_loc2_].content).atomCount - 1);
                  if(_loc3_.x + _loc3_.width > _loc1_)
                  {
                     _loc1_ = _loc3_.x + _loc3_.width;
                  }
               }
               _loc2_++;
            }
            _loc1_ += 2;
         }
         this._9895.x = 0;
         this._9895.y = 0;
         this._9895.height = isNaN(this._9921) ? this.numLines * (this._9737 + this._8539) : this._9921;
         this._9895.width = isNaN(this._9928) ? _loc1_ : this._9928;
      }
      
      private function _9907() : void
      {
         if(_9848.length > 0)
         {
            _9848[0]._9908 = 0;
         }
         var _loc1_:int = 0;
         while(_loc1_ < _9848.length - 1)
         {
            _9848[_loc1_ + 1]._9908 = _9848[_loc1_]._9908 + _9848[_loc1_].length;
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < _9849.length)
         {
            _9849[_loc1_]._9908 = _9848[_9849[_loc1_]._9916]._9908;
            _loc1_++;
         }
      }
      
      public function get maxScrollV() : int
      {
         return this._9920;
      }
      
      public function get scrollV() : int
      {
         return this._9942;
      }
      
      public function set scrollV(param1:int) : void
      {
         this._9942 = param1;
         this._9911();
      }
      
      public function get scrollH() : int
      {
         return this._9939;
      }
      
      public function set scrollH(param1:int) : void
      {
         this._9939 = param1;
      }
      
      override public function get width() : Number
      {
         return isNaN(this._width) ? super.width : this._width;
      }
      
      override public function set width(param1:Number) : void
      {
         if(this._width != param1)
         {
            this._width = param1 >= 0 ? param1 : 0;
            this._9928 = param1 >= 0 ? param1 : 0;
            this._9911();
         }
         this._9938();
      }
      
      override public function get height() : Number
      {
         return isNaN(this._height) ? super.height : this._height;
      }
      
      override public function set height(param1:Number) : void
      {
         if(this._height != param1)
         {
            this._height = param1 >= 0 ? param1 : 0;
            this._9921 = param1 >= 0 ? param1 : 0;
            this._9911();
         }
         this._9938();
      }
      
      public function get editable() : Boolean
      {
         return this._7570;
      }
      
      public function set editable(param1:Boolean) : void
      {
         this._7570 = param1;
         if(this._7570)
         {
            if(this.selectable == false)
            {
               this.selectable = true;
            }
            this.addEventListener(TextEvent.TEXT_INPUT,this._9258);
         }
         else
         {
            this.removeEventListener(TextEvent.TEXT_INPUT,this._9258);
         }
      }
      
      protected function _9258(param1:TextEvent) : void
      {
         var _loc2_:String = null;
         if(this._text.length >= this._7445 && this._7445 != 0 && this.selectionBeginIndex == this.selectionEndIndex)
         {
            return;
         }
         if(this._7444 == "")
         {
            return;
         }
         if(this._9936)
         {
            _loc2_ = param1.text;
            if(this._7444)
            {
               _loc2_ = StringUtil.restrict(_loc2_,this._7444);
            }
            if(!_loc2_)
            {
               return;
            }
            if(_loc2_ == "\r")
            {
               if(this._7658)
               {
                  this.replaceText(this.selectionBeginIndex,this.selectionEndIndex,"\n");
                  _99(this._9872,[this._9889(this._9882) + 1]);
               }
            }
            else
            {
               this.replaceText(this.selectionBeginIndex,this.selectionEndIndex,_loc2_);
               _99(this._9872,[this._9889(this._9882) + 1]);
            }
            this._9905();
         }
      }
      
      public function get selectable() : Boolean
      {
         return this._8533;
      }
      
      public function set selectable(param1:Boolean) : void
      {
         this._8533 = param1;
         if(this._8533)
         {
            this.addEventListener(MouseEvent.MOUSE_OVER,this._9893);
            this.addEventListener(MouseEvent.MOUSE_OUT,this._9901);
            this.addEventListener(MouseEvent.MOUSE_DOWN,this._4090);
            this.addEventListener(KeyboardEvent.KEY_DOWN,this._2575);
            this.addEventListener(KeyboardEvent.KEY_UP,this._5261);
            this.addEventListener(Event.SELECT_ALL,this._9861);
            this.addEventListener(Event.CLEAR,this._9861);
            this.addEventListener(Event.COPY,this._9861);
            this.addEventListener(Event.CUT,this._9861);
            this.addEventListener(Event.PASTE,this._9861);
            this.addEventListener(FocusEvent.FOCUS_IN,this._2574);
            this.addEventListener(FocusEvent.FOCUS_OUT,this.focusOutHandler);
            this.addEventListener(IMEEvent.IME_START_COMPOSITION,this._9227);
            this._9892.visible = true;
            this.ibeam.visible = true;
            this._9891();
            this.addEventListener(MouseEvent.RIGHT_MOUSE_DOWN,this._9346);
         }
         else
         {
            this.removeEventListener(MouseEvent.MOUSE_OVER,this._9893);
            this.removeEventListener(MouseEvent.MOUSE_OUT,this._9901);
            this.removeEventListener(MouseEvent.MOUSE_DOWN,this._4090);
            this.removeEventListener(KeyboardEvent.KEY_DOWN,this._2575);
            this.removeEventListener(KeyboardEvent.KEY_UP,this._5261);
            this.removeEventListener(Event.SELECT_ALL,this._9861);
            this.removeEventListener(Event.CLEAR,this._9861);
            this.removeEventListener(Event.COPY,this._9861);
            this.removeEventListener(Event.CUT,this._9861);
            this.removeEventListener(Event.PASTE,this._9861);
            this.removeEventListener(FocusEvent.FOCUS_IN,this._2574);
            this.removeEventListener(FocusEvent.FOCUS_OUT,this.focusOutHandler);
            this.removeEventListener(IMEEvent.IME_START_COMPOSITION,this._9227);
            this._9892.visible = false;
            this.ibeam.visible = false;
            this._9914();
            this._9887();
            this.removeEventListener(MouseEvent.RIGHT_MOUSE_DOWN,this._9346);
         }
      }
      
      protected function _9227(param1:IMEEvent) : void
      {
         if(!param1.imeClient)
         {
            param1.imeClient = this;
            this._9231 = false;
            this._9327 = this.selectionBeginIndex;
            this._9329 = 0;
            this._9331 = false;
         }
      }
      
      protected function focusOutHandler(param1:FocusEvent) : void
      {
         this._9874();
         IME.compositionAbandoned();
      }
      
      protected function _2574(param1:FocusEvent) : void
      {
         this._9933 = this.text;
         this._9874();
      }
      
      protected function _9861(param1:Event) : void
      {
         if(param1.type == Event.SELECT_ALL)
         {
            this.selectAll();
         }
         else if(param1.type == Event.CLEAR)
         {
            this.clear();
         }
         else if(param1.type == Event.COPY)
         {
            this.copy();
         }
         else if(param1.type == Event.CUT && !this._7639)
         {
            this.cut();
         }
         else if(param1.type == Event.PASTE)
         {
            this.paste();
         }
      }
      
      private function selectAll() : void
      {
         this.setSelection(0,this.text.length);
      }
      
      private function clear() : void
      {
         this.replaceText(this.selectionBeginIndex,this.selectionEndIndex,"");
      }
      
      private function copy() : void
      {
         var _loc1_:String = null;
         if(!this._7639)
         {
            _loc1_ = this.text.slice(this.selectionBeginIndex,this.selectionEndIndex);
            Clipboard.generalClipboard.setData(ClipboardFormats.TEXT_FORMAT,_loc1_);
         }
      }
      
      private function cut() : void
      {
         var _loc1_:String = null;
         if(!this._7639)
         {
            _loc1_ = this.text.slice(this.selectionBeginIndex,this.selectionEndIndex);
            Clipboard.generalClipboard.setData(ClipboardFormats.TEXT_FORMAT,_loc1_);
            this.replaceText(this.selectionBeginIndex,this.selectionEndIndex,"");
            this._9905();
         }
      }
      
      private function paste() : void
      {
         var _loc1_:String = Clipboard.generalClipboard.getData(ClipboardFormats.TEXT_FORMAT) as String;
         if(!this._7658 && Boolean(_loc1_))
         {
            _loc1_ = _loc1_.replace(/\r/g,"");
            _loc1_ = _loc1_.replace(/\n/g,"");
         }
         if(_loc1_)
         {
            this.replaceText(this.selectionBeginIndex,this.selectionEndIndex,_loc1_);
            if(this._7445 != 0 && this.text.length > this._7445)
            {
               this.replaceText(this._7445,this.text.length,"");
            }
            this._9905();
         }
      }
      
      protected function _5261(param1:KeyboardEvent) : void
      {
         if(param1.ctrlKey == true)
         {
            this._9936 = false;
         }
         if(param1.ctrlKey == false)
         {
            this._9936 = true;
         }
      }
      
      protected function _2575(param1:KeyboardEvent) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         if(param1.ctrlKey == true)
         {
            this._9936 = false;
         }
         if(param1.ctrlKey == false)
         {
            this._9936 = true;
         }
         var _loc2_:Boolean = false;
         var _loc3_:String = this.text;
         if(param1.ctrlKey)
         {
            if(!param1.altKey)
            {
               if(param1.charCode == 122 || param1.charCode == 121)
               {
                  IME.compositionAbandoned();
               }
            }
         }
         if(param1.keyCode == Keyboard.Z && param1.ctrlKey)
         {
            this.undo();
         }
         if(!SystemInfo.isMacOS && param1.keyCode == Keyboard.Y && param1.ctrlKey)
         {
            this.redo();
         }
         else if(SystemInfo.isMacOS && param1.keyCode == Keyboard.Z && Boolean(param1.commandKey) && param1.shiftKey)
         {
            this.redo();
         }
         if(param1.keyCode == Keyboard.BACKSPACE && this.editable)
         {
            IME.compositionAbandoned();
            if(!this.replaceText(this.selectionBeginIndex,this.selectionEndIndex,""))
            {
               _loc2_ = false;
               if(this.selectionBeginIndex >= 2)
               {
                  _loc3_ = this.text;
                  if(_loc3_.charAt(this.selectionBeginIndex - 1) == "\n" && _loc3_.charAt(this.selectionBeginIndex - 2) == "\r")
                  {
                     this.replaceText(this.selectionBeginIndex - 2,this.selectionEndIndex,"");
                     _loc2_ = true;
                  }
               }
               if(!_loc2_)
               {
                  if(param1.ctrlKey)
                  {
                     _loc4_ = this._9873(this.selectionBeginIndex,this._9889(this._9870));
                     this.replaceText(_loc4_,this.selectionEndIndex,"");
                  }
                  else
                  {
                     this.replaceText(this.selectionBeginIndex - 1,this.selectionEndIndex,"");
                  }
               }
            }
            this._9905();
         }
         if(param1.keyCode == Keyboard.DELETE && this.editable)
         {
            IME.compositionAbandoned();
            if(!this.replaceText(this.selectionBeginIndex,this.selectionEndIndex,""))
            {
               _loc2_ = false;
               _loc3_ = this.text;
               if(this.selectionBeginIndex < _loc3_.length - 2)
               {
                  if(_loc3_.charAt(this.selectionBeginIndex) == "\r" && _loc3_.charAt(this.selectionBeginIndex + 1) == "\n")
                  {
                     this.replaceText(this.selectionBeginIndex,this.selectionEndIndex + 2,"");
                     _loc2_ = true;
                  }
               }
               if(!_loc2_)
               {
                  if(param1.ctrlKey)
                  {
                     _loc4_ = this._9875(this.selectionBeginIndex,this._9889(this._9870));
                     this.replaceText(this.selectionBeginIndex,_loc4_,"");
                  }
                  else
                  {
                     this.replaceText(this.selectionBeginIndex,this.selectionEndIndex + 1,"");
                  }
               }
            }
            this._9905();
         }
         if(param1.keyCode == Keyboard.HOME)
         {
            if(param1.ctrlKey)
            {
               this._9882 = 0;
            }
            else
            {
               _loc5_ = Math.max(this.text.lastIndexOf("\r",this._9882 - 1),this.text.lastIndexOf("\n",this._9882 - 1));
               _loc6_ = _loc5_ = _loc5_ + 1;
               _loc7_ = _loc5_;
               while(_loc7_ < this.text.length)
               {
                  if(this.text.charAt(_loc7_) != "\t" && this.text.charAt(_loc7_) != " ")
                  {
                     _loc6_ = _loc7_;
                     break;
                  }
                  _loc7_++;
               }
               if(this._9882 > _loc6_)
               {
                  this._9882 = _loc6_;
               }
               else if(this._9882 > _loc5_)
               {
                  this._9882 = _loc5_;
               }
               else
               {
                  this._9882 = _loc6_;
               }
            }
            if(!param1.shiftKey)
            {
               this._9870 = this._9882;
            }
            this._9874();
            this._9872(this._9889(this._9882));
         }
         if(param1.keyCode == Keyboard.END)
         {
            if(param1.ctrlKey)
            {
               this._9882 = this.text.length;
            }
            else
            {
               _loc5_ = Math.max(this.text.indexOf("\r",this._9882),this.text.indexOf("\n",this._9882));
               if(_loc5_ == -1)
               {
                  _loc5_ = this.text.length;
               }
               _loc6_ = _loc5_;
               _loc7_ = _loc5_ - 1;
               while(_loc7_ >= 0)
               {
                  if(this.text.charAt(_loc7_) != "\t" && this.text.charAt(_loc7_) != " ")
                  {
                     _loc6_ = _loc7_ + 1;
                     break;
                  }
                  _loc7_--;
               }
               if(this._9882 < _loc6_)
               {
                  this._9882 = _loc6_;
               }
               else if(this._9882 < _loc5_)
               {
                  this._9882 = _loc5_;
               }
               else
               {
                  this._9882 = _loc6_;
               }
            }
            if(!param1.shiftKey)
            {
               this._9870 = this._9882;
            }
            this._9874();
            this._9872(this._9889(this._9882));
         }
         if(param1.keyCode == Keyboard.LEFT)
         {
            if(param1.shiftKey)
            {
               if(this._9882 >= 2 && this.text.charAt(this._9882 - 1) == "\n" && this.text.charAt(this._9882 - 2) == "\r")
               {
                  this._9882 -= 2;
               }
               else if(param1.ctrlKey)
               {
                  this._9882 = this._9873(this._9882,this._9889(this._9882));
                  this._9882 = Math.max(0,this._9882);
               }
               else
               {
                  --this._9882;
               }
               this._9882 = Math.max(0,this._9882);
               this._9874();
               this._9872(this._9889(this._9882));
            }
            else
            {
               if(this.selectionBeginIndex == this.selectionEndIndex)
               {
                  _loc2_ = false;
                  if(this.selectionBeginIndex >= 2)
                  {
                     _loc3_ = this.text;
                     if(_loc3_.charAt(this.selectionBeginIndex - 1) == "\n" && _loc3_.charAt(this.selectionBeginIndex - 2) == "\r")
                     {
                        this.setSelection(this.selectionBeginIndex - 2,this.selectionBeginIndex - 2);
                        _loc2_ = true;
                     }
                  }
                  if(!_loc2_)
                  {
                     if(param1.ctrlKey)
                     {
                        _loc4_ = this._9873(this.selectionBeginIndex,this._9889(this._9870));
                        this.setSelection(_loc4_,_loc4_);
                     }
                     else
                     {
                        this.setSelection(this.selectionBeginIndex - 1,this.selectionBeginIndex - 1);
                     }
                  }
               }
               else
               {
                  this.setSelection(this.selectionBeginIndex,this.selectionBeginIndex);
               }
               this._9872(this._9889(this._9870));
            }
            this._9854 = this._9882 - _9848[this._9889(this._9882)]._9908;
         }
         if(param1.keyCode == Keyboard.RIGHT)
         {
            if(param1.shiftKey)
            {
               if(this._9882 < this.text.length - 1 && this.text.charAt(this._9882) == "\r" && this.text.charAt(this._9882 + 1) == "\n")
               {
                  this._9882 += 2;
               }
               else if(param1.ctrlKey)
               {
                  this._9882 = this._9875(this._9882,this._9889(this._9882));
                  this._9882 = Math.max(0,this._9882);
               }
               else
               {
                  ++this._9882;
               }
               this._9882 = Math.min(this.text.length,this._9882);
               this._9874();
               this._9872(this._9889(this._9882));
            }
            else
            {
               if(this.selectionBeginIndex == this.selectionEndIndex)
               {
                  _loc2_ = false;
                  _loc3_ = this.text;
                  if(this.selectionBeginIndex < _loc3_.length - 2)
                  {
                     if(_loc3_.charAt(this.selectionBeginIndex) == "\r" && _loc3_.charAt(this.selectionBeginIndex + 1) == "\n")
                     {
                        this.setSelection(this.selectionEndIndex + 2,this.selectionEndIndex + 2);
                        _loc2_ = true;
                     }
                  }
                  if(!_loc2_)
                  {
                     if(param1.ctrlKey)
                     {
                        _loc4_ = this._9875(this.selectionBeginIndex,this._9889(this._9870));
                        this.setSelection(_loc4_,_loc4_);
                     }
                     else
                     {
                        this.setSelection(this.selectionEndIndex + 1,this.selectionEndIndex + 1);
                     }
                  }
               }
               else
               {
                  this.setSelection(this.selectionEndIndex,this.selectionEndIndex);
               }
               this._9872(this._9889(this._9870));
            }
            this._9854 = this._9882 - _9848[this._9889(this._9882)]._9908;
         }
         if(param1.keyCode == Keyboard.UP)
         {
            if(param1.shiftKey && !param1.ctrlKey)
            {
               _loc8_ = this._9889(this._9882);
               _loc9_ = -1;
               if(_loc8_ > 0)
               {
                  if(this._9854 < _9848[_loc8_ - 1].content.length)
                  {
                     _loc9_ = _9848[_loc8_ - 1]._9908 + this._9854;
                  }
                  else
                  {
                     _loc9_ = _9848[_loc8_ - 1]._9908 + _9848[_loc8_ - 1].content.length - 1;
                  }
                  if(_loc9_ >= 1 && this.text.charAt(_loc9_) == "\n" && this.text.charAt(_loc9_ - 1) == "\r")
                  {
                     _loc9_--;
                  }
                  this._9882 = Math.max(_loc9_,0);
                  this._9874();
                  this._9872(_loc8_ - 1);
               }
            }
            else if(!param1.shiftKey && !param1.ctrlKey)
            {
               _loc10_ = this._9889(this._9870);
               _loc9_ = -1;
               if(this.selectionBeginIndex == this.selectionEndIndex && this._9889(this._9870) > 0)
               {
                  if(this._9854 < _9848[this._9889(this._9870) - 1].content.length)
                  {
                     _loc9_ = _9848[this._9889(this._9870) - 1]._9908 + this._9854;
                  }
                  else
                  {
                     _loc9_ = _9848[this._9889(this._9870) - 1]._9908 + _9848[this._9889(this._9870) - 1].content.length - 1;
                  }
                  if(_loc9_ >= 1 && this.text.charAt(_loc9_) == "\n" && this.text.charAt(_loc9_ - 1) == "\r")
                  {
                     _loc9_--;
                  }
                  this.setSelection(_loc9_,_loc9_);
               }
               else
               {
                  this.setSelection(this.selectionBeginIndex,this.selectionBeginIndex);
               }
               this._9872(_loc10_ - 1);
            }
            else if(param1.ctrlKey && !param1.shiftKey)
            {
               this._9906(this._9942 - 1);
            }
         }
         if(param1.keyCode == Keyboard.DOWN)
         {
            if(param1.shiftKey && !param1.ctrlKey)
            {
               _loc8_ = this._9889(this._9882);
               _loc9_ = -1;
               if(_loc8_ < _9848.length - 1)
               {
                  if(this._9854 < _9848[_loc8_ + 1].content.length)
                  {
                     _loc9_ = _9848[_loc8_ + 1]._9908 + this._9854;
                  }
                  else
                  {
                     _loc9_ = _9848[_loc8_ + 1]._9908 + _9848[_loc8_ + 1].content.length - 1;
                  }
                  if(_9848[this._9889(this._9870) + 1].length == 0)
                  {
                     _loc9_ = this.text.length;
                  }
                  if(_loc9_ >= 1 && this.text.charAt(_loc9_) == "\n" && this.text.charAt(_loc9_ - 1) == "\r")
                  {
                     _loc9_--;
                  }
                  this._9882 = Math.min(_loc9_,this.text.length);
                  this._9874();
                  this._9872(_loc8_ + 1);
               }
            }
            else if(!param1.shiftKey && !param1.ctrlKey)
            {
               _loc8_ = this._9889(this._9870);
               _loc9_ = -1;
               if(this.selectionBeginIndex == this.selectionEndIndex && this._9889(this._9870) < _9848.length - 1)
               {
                  if(this._9854 < _9848[this._9889(this._9870) + 1].content.length)
                  {
                     _loc9_ = _9848[this._9889(this._9870) + 1]._9908 + this._9854;
                  }
                  else
                  {
                     _loc9_ = _9848[this._9889(this._9870) + 1]._9908 + _9848[this._9889(this._9870) + 1].content.length - 1;
                  }
                  if(_9848[this._9889(this._9870) + 1].length == 0)
                  {
                     _loc9_ = this.text.length;
                  }
                  if(_loc9_ >= 1 && this.text.charAt(_loc9_) == "\n" && this.text.charAt(_loc9_ - 1) == "\r")
                  {
                     _loc9_--;
                  }
                  this.setSelection(_loc9_,_loc9_);
               }
               else
               {
                  this.setSelection(this.selectionEndIndex,this.selectionEndIndex);
               }
               this._9872(_loc8_ + 1);
            }
            else if(param1.ctrlKey && !param1.shiftKey)
            {
               this._9906(this._9942 + 1);
            }
         }
      }
      
      public function get wordWrap() : Boolean
      {
         return this._9934;
      }
      
      public function set wordWrap(param1:Boolean) : void
      {
         this._9934 = param1;
         this._9911();
      }
      
      public function get align() : String
      {
         return this._9943;
      }
      
      public function set align(param1:String) : void
      {
         this._9943 = param1;
         this._9911();
      }
      
      public function get numLines() : int
      {
         return _9848.length;
      }
      
      protected function _9901(param1:MouseEvent) : void
      {
         Mouse.cursor = MouseCursor.ARROW;
      }
      
      protected function _9893(param1:MouseEvent) : void
      {
         Mouse.cursor = MouseCursor.IBEAM;
      }
      
      protected function _4090(param1:MouseEvent) : void
      {
         var str:String = null;
         var event:MouseEvent = param1;
         var tmpIndex:int = this._9864();
         if(tmpIndex != -1)
         {
            str = this.text.charAt(tmpIndex);
            this._9870 = tmpIndex;
            this._9882 = this._9870;
            this.ibeam.visible = true;
            this.stage.focus = this;
            IME.enabled = true;
            this._9874();
            this._stage = this.stage;
            if(this.stage)
            {
               this.stage.addEventListener(MouseEvent.MOUSE_MOVE,this._4089);
               this.stage.addEventListener(MouseEvent.MOUSE_UP,this._4093);
            }
         }
         ++this._9899;
         if(this._9899 >= 3)
         {
            if(this.selectionBeginIndex == this._9871 && this.selectionEndIndex == this._9885)
            {
               this.setSelection(0,this.text.length);
            }
         }
         else if(this._9899 == 2)
         {
            if(this.selectionBeginIndex == this._9871 && this.selectionEndIndex == this._9885)
            {
               this._9886();
            }
         }
         else if(this._9899 == 1)
         {
            this._9877 = getTimer();
            this._9912 = setTimeout(function():void
            {
               _9899 = 0;
            },400);
            this._9871 = this.selectionBeginIndex;
            this._9885 = this.selectionEndIndex;
         }
      }
      
      private function _9886() : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         if(_9849.length == 0)
         {
            return;
         }
         var _loc1_:int = this.selectionBeginIndex;
         var _loc2_:int = this.selectionEndIndex + 1;
         var _loc3_:Boolean = false;
         if(this.text.charAt(this.selectionBeginIndex) == "\"" || this.text.charAt(this.selectionBeginIndex) == "\'")
         {
            _loc4_ = 0;
            _loc5_ = 0;
            _loc6_ = this.selectionBeginIndex;
            _loc7_ = this.selectionBeginIndex;
            _loc8_ = 0;
            while(_loc8_ <= this.selectionBeginIndex)
            {
               if(this.text.charAt(_loc8_) == "\"")
               {
                  _loc4_++;
                  if(_loc8_ != this.selectionBeginIndex)
                  {
                     _loc6_ = _loc8_;
                  }
               }
               if(this.text.charAt(_loc8_) == "\'")
               {
                  _loc5_++;
                  if(_loc8_ != this.selectionBeginIndex)
                  {
                     _loc7_ = _loc8_;
                  }
               }
               _loc8_++;
            }
            _loc2_ = this.selectionBeginIndex;
            if(this.text.charAt(this.selectionBeginIndex) == "\"" && _loc4_ % 2 == 0)
            {
               _loc1_ = _loc6_ + 1;
               if(_loc1_ != _loc2_)
               {
                  _loc3_ = true;
               }
            }
            if(this.text.charAt(this.selectionBeginIndex) == "\'" && _loc5_ % 2 == 0)
            {
               _loc1_ = _loc7_ + 1;
               if(_loc1_ != _loc2_)
               {
                  _loc3_ = true;
               }
            }
            if(_loc3_)
            {
               this.setSelection(_loc1_,_loc2_);
            }
         }
         if(!_loc3_)
         {
            if(this._9460(this.text.charAt(this.selectionBeginIndex)))
            {
               _loc8_ = _loc1_;
               while(_loc8_ >= 0)
               {
                  if(!this._9460(this.text.charAt(_loc8_)))
                  {
                     _loc1_ = _loc8_ + 1;
                     break;
                  }
                  _loc1_ = _loc8_;
                  _loc8_--;
               }
               _loc8_ = _loc2_;
               while(_loc8_ <= this.text.length)
               {
                  if(_loc8_ < this.text.length && !this._9460(this.text.charAt(_loc8_)))
                  {
                     _loc2_ = _loc8_;
                     break;
                  }
                  _loc2_ = _loc8_;
                  _loc8_++;
               }
               this.setSelection(_loc1_,_loc2_);
            }
            else if(this.text.charAt(this.selectionBeginIndex) == " " || this.text.charAt(this.selectionBeginIndex) == "\r" || this.text.charAt(this.selectionBeginIndex) == "\n" || this.text.charAt(_loc8_) == "\t" || this.selectionBeginIndex == this.text.length)
            {
               _loc1_--;
               _loc2_--;
               _loc8_ = _loc1_;
               while(_loc8_ >= 0)
               {
                  if(!this._9460(this.text.charAt(_loc8_)))
                  {
                     _loc1_ = _loc8_ + 1;
                     break;
                  }
                  _loc1_ = _loc8_;
                  _loc8_--;
               }
               _loc8_ = _loc2_;
               while(_loc8_ <= this.text.length)
               {
                  if(_loc8_ < this.text.length && !this._9460(this.text.charAt(_loc8_)))
                  {
                     _loc2_ = _loc8_;
                     break;
                  }
                  _loc2_ = _loc8_;
                  _loc8_++;
               }
               if(_loc1_ == _loc2_ && _loc1_ == this.text.length)
               {
                  this.setSelection(_loc1_ - 1,_loc2_);
               }
               else
               {
                  this.setSelection(_loc1_,_loc2_);
               }
            }
            else if(this.text.charAt(this.selectionBeginIndex) != "\r" && this.text.charAt(this.selectionBeginIndex) != "\n")
            {
               this.setSelection(_loc1_,_loc1_ + 1);
            }
         }
      }
      
      private function _9460(param1:String) : Boolean
      {
         var _loc2_:int = int(param1.charCodeAt(0));
         if(_loc2_ >= 65 && _loc2_ <= 90 || _loc2_ >= 97 && _loc2_ <= 122 || _loc2_ >= 48 && _loc2_ <= 57 || _loc2_ == 95)
         {
            return true;
         }
         return false;
      }
      
      protected function _4089(param1:MouseEvent) : void
      {
         this._stage.removeEventListener(MouseEvent.MOUSE_MOVE,this._4089);
         this._9884 = getTimer();
         this._9913 = 0;
         this.addEventListener(Event.ENTER_FRAME,this._8632);
      }
      
      protected function _8632(param1:Event) : void
      {
         var _loc2_:int = this._9864();
         if(_loc2_ != -1)
         {
            this._9882 = _loc2_;
            if(!isNaN(this._9921))
            {
               if(this.mouseY - this._9921 > 0)
               {
                  this._9932(this.mouseY - this._9921,getTimer() - this._9884);
               }
               else if(this.mouseY < 0)
               {
                  this._9932(this.mouseY,getTimer() - this._9884);
               }
            }
            this._9874();
         }
         this._9884 = getTimer();
      }
      
      private function _9932(param1:int, param2:int) : void
      {
         var _loc4_:int = 0;
         if(isNaN(this._9921))
         {
            return;
         }
         var _loc3_:int = 0;
         if(param2 < 15)
         {
            param2 = 15;
         }
         this._9913 += param1 * (param2 / 800);
         if(this._9913 >= 1 || this._9913 <= -1)
         {
            _loc3_ = int(this._9913);
            this._9906(_9849[0]._9916 + _loc3_);
            this._9913 -= _loc3_;
            _loc4_ = this._9864();
            if(_loc4_ != -1)
            {
               this._9882 = _loc4_;
            }
         }
      }
      
      protected function _4093(param1:MouseEvent) : void
      {
         this._stage.removeEventListener(MouseEvent.MOUSE_MOVE,this._4089);
         this._stage.removeEventListener(MouseEvent.MOUSE_UP,this._4093);
         this.removeEventListener(Event.ENTER_FRAME,this._8632);
         this.ibeam._9917();
         this._9874();
         this._9872(this._9889(this._9882));
         this._9854 = this._9882 - _9848[this._9889(this._9882)]._9908;
      }
      
      private function _9872(param1:int) : void
      {
         if(isNaN(this._9921))
         {
            return;
         }
         if(_9849.length == 0)
         {
            return;
         }
         if(param1 < _9849[0]._9916)
         {
            this._9906(param1);
         }
         else if(param1 >= _9849[0]._9916 + int(this._9921 / (this._9737 + this._8539)) - 1)
         {
            this._9906(param1 - int(this._9921 / (this._9737 + this._8539)) + 1);
         }
         else
         {
            this._9906(_9849[0]._9916);
         }
      }
      
      public function _9906(param1:int) : void
      {
         if(isNaN(this._9921))
         {
            return;
         }
         this._9942 = param1;
         this._9911();
         dispatchEvent(new Event(Event.SCROLL));
      }
      
      protected function _9864(param1:Point = null) : int
      {
         var _loc3_:_1417 = null;
         var _loc8_:int = 0;
         var _loc9_:Rectangle = null;
         var _loc10_:String = null;
         var _loc11_:Point = null;
         var _loc12_:Rectangle = null;
         if(!param1)
         {
            param1 = new Point(mouseX,mouseY);
         }
         param1 = this.localToGlobal(param1);
         param1 = this.container.globalToLocal(param1);
         var _loc2_:int = -1;
         var _loc4_:int = -1;
         var _loc5_:int = 0;
         while(_loc5_ < _9849.length)
         {
            if(param1.y <= _9849[_loc5_].content.y - this._9881(_9849[_loc5_].content) + this._9737 && param1.y >= _9849[_loc5_].content.y - this._9881(_9849[_loc5_].content) - this._8539)
            {
               _loc3_ = _9849[_loc5_];
               break;
            }
            _loc5_++;
         }
         var _loc6_:int = int(_9849.length - 1);
         if(!isNaN(this._9921))
         {
            _loc8_ = Math.ceil(this._9921 / (this._9737 + this._8539));
            _loc6_ = Math.min(_loc8_ - 1,_9849.length - 1);
         }
         if(_9849.length > 0)
         {
            if(param1.y < _9849[0].content.y - this._9881(_9849[0].content))
            {
               _loc3_ = _9849[0];
            }
            else if(param1.y > _9849[_loc6_].content.y - this._9881(_9849[_loc6_].content) + this._9737)
            {
               _loc3_ = _9849[_loc6_];
            }
         }
         var _loc7_:int = -1;
         if(_loc3_)
         {
            param1 = this.container.localToGlobal(param1);
            param1 = _loc3_.content.globalToLocal(param1);
            _loc4_ = _loc3_._9908;
            _loc10_ = _9848[_loc3_._9916].content;
            if(_loc10_.length == 1)
            {
               if(_loc10_.charAt(0) == "\n" || _loc10_.charAt(0) == "\r")
               {
                  _loc7_ = 0;
               }
               else
               {
                  _loc9_ = _loc3_.content.getAtomBounds(0);
                  _loc11_ = new Point(param1.x,param1.y);
                  _loc11_ = this.localToGlobal(_loc11_);
                  _loc11_ = _loc3_.content.localToGlobal(_loc11_);
                  if(_loc11_.x < _loc9_.width / 2)
                  {
                     _loc7_ = 0;
                  }
                  else
                  {
                     _loc7_ = 1;
                  }
               }
            }
            if(_loc10_.length == 2 && _loc7_ == -1)
            {
               if(_loc10_.charAt(0) == "\r" && _loc10_.charAt(1) == "\n")
               {
                  _loc7_ = 0;
               }
            }
            if(_9848[_loc3_._9916].content == "" && _loc7_ == -1)
            {
               _loc7_ = 0;
            }
            if(_loc7_ == -1)
            {
               _loc5_ = 0;
               while(_loc5_ < _loc3_.length - 1)
               {
                  _loc9_ = _loc3_.content.getAtomBounds(_loc5_);
                  _loc12_ = _loc3_.content.getAtomBounds(_loc5_ + 1);
                  if(_loc5_ == 0 && param1.x <= _loc9_.x + _loc9_.width / 2)
                  {
                     _loc7_ = 0;
                     break;
                  }
                  if(_loc5_ == _loc3_.content.atomCount - 2 && param1.x > _loc12_.x + _loc12_.width / 2)
                  {
                     if(_loc10_.charAt(_loc10_.length - 1) == "\n" || _loc10_.charAt(_loc10_.length - 1) == "\r" || _loc10_.length > 1 && _loc10_.charAt(_loc10_.length - 1) == "\n" && _loc10_.charAt(_loc10_.length - 2) == "\r")
                     {
                        _loc7_ = _loc3_.content.atomCount - 1;
                     }
                     else
                     {
                        _loc7_ = _loc3_.content.atomCount;
                     }
                     break;
                  }
                  if(param1.x > _loc9_.x + _loc9_.width / 2 && param1.x <= _loc12_.x + _loc12_.width / 2)
                  {
                     _loc7_ = _loc5_ + 1;
                     break;
                  }
                  _loc5_++;
               }
            }
         }
         if(_loc4_ != -1 && _loc7_ != -1)
         {
            _loc2_ = _loc4_ + _loc7_;
         }
         return _loc2_;
      }
      
      private function _9874() : void
      {
         this._9856();
         this._9869(true);
         if(this.selectionBeginIndex > this._9327 + this._9329 || this.selectionEndIndex < this._9327)
         {
            IME.compositionAbandoned();
         }
      }
      
      private function _9856() : void
      {
         var _loc11_:Rectangle = null;
         var _loc14_:int = 0;
         this._9903.graphics.clear();
         this._9892.graphics.clear();
         this.ibeam.visible = false;
         if(!this.stage || this.stage.focus != this)
         {
            return;
         }
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = -1;
         var _loc6_:int = -1;
         var _loc7_:int = -1;
         var _loc8_:int = -1;
         var _loc9_:int = -1;
         var _loc10_:int = -1;
         if(_9849.length == 0)
         {
            return;
         }
         var _loc12_:int = _9849[0]._9916;
         var _loc13_:int = 0;
         while(_loc13_ < _9849.length)
         {
            _loc14_ = _9849[_loc13_].length;
            if(this.selectionBeginIndex >= _9849[_loc13_]._9908 && this.selectionBeginIndex <= _9849[_loc13_]._9908 + _loc14_)
            {
               _loc5_ = _loc13_;
               _loc6_ = this.selectionBeginIndex - _9849[_loc13_]._9908;
            }
            if(this.selectionEndIndex >= _9849[_loc13_]._9908 && this.selectionEndIndex <= _9849[_loc13_]._9908 + _loc14_)
            {
               _loc7_ = _loc13_;
               _loc8_ = this.selectionEndIndex - _9849[_loc13_]._9908;
            }
            if(this._9882 >= _9849[_loc13_]._9908 && this._9882 <= _9849[_loc13_]._9908 + _loc14_)
            {
               _loc9_ = _loc13_;
               _loc10_ = this._9882 - _9849[_loc13_]._9908;
            }
            _loc13_++;
         }
         if(_loc5_ < 0 && _loc7_ < 0 && (_9848[_loc12_]._9908 > this.selectionEndIndex || _9848[_loc12_]._9908 < this.selectionBeginIndex))
         {
            return;
         }
         this.ibeam.visible = true;
         if(_loc5_ < 0)
         {
            _loc5_ = 0;
            _loc6_ = 0;
         }
         if(_loc7_ < 0)
         {
            _loc7_ = int(_9849.length - 1);
            if(_loc7_ >= 0)
            {
               _loc8_ = _9849[_loc7_].length;
            }
            this.ibeam.visible = false;
         }
         if(_loc10_ != -1 && _loc9_ != -1)
         {
            this.ibeam.visible = true;
            _loc2_ = TextLine(_9849[_loc9_].content).y - this._9881(_9849[_loc9_].content);
            if(_loc10_ == 0)
            {
               _loc3_ = _9849[_loc9_].content.x;
            }
            else
            {
               _loc11_ = TextLine(_9849[_loc9_].content).getAtomBounds(_loc10_ - 1);
               _loc3_ = _9849[_loc9_].content.x + _loc11_.x + _loc11_.width;
            }
            if(this.ibeam.height != this._9737 || this.ibeam.x != _loc3_ || this.ibeam.y != _loc2_)
            {
               this.ibeam.height = this._9737;
               this.ibeam.x = _loc3_;
               this.ibeam.y = _loc2_;
               this.ibeam._9917();
            }
         }
         if(this.ibeam.visible && this._9889(this.selectionBeginIndex) == this._9889(this.selectionEndIndex))
         {
            this._9892.graphics.beginFill(this._9853,this._9852);
            this._9892.graphics.drawRect(0,this.ibeam.y,this._9895.width,this.ibeam.height);
            this._9892.graphics.endFill();
         }
         if(_loc5_ == -1 || _loc7_ == -1 || _loc6_ == -1 || _loc8_ == -1)
         {
            return;
         }
         if(_9849[_loc5_].length == _loc6_)
         {
            return;
         }
         if(_loc8_ == 0 && _loc7_ == 0)
         {
            return;
         }
         if(_loc5_ == _loc7_ && this.selectionBeginIndex != this.selectionEndIndex)
         {
            _loc11_ = TextLine(_9849[_loc5_].content).getAtomBounds(_loc6_);
            _loc1_ = 0 + _loc11_.x;
            _loc2_ = TextLine(_9849[_loc5_].content).y - this._9881(_9849[_loc5_].content);
            _loc11_ = TextLine(_9849[_loc5_].content).getAtomBounds(_loc8_ - 1);
            _loc3_ = 0 + _loc11_.x + _loc11_.width;
            _loc4_ = _loc2_ + this._9737;
            this._9903.graphics.beginFill(this._9865);
            this._9903.graphics.drawRect(_9849[_loc5_].content.x + _loc1_,_loc2_,_loc3_ - _loc1_,_loc4_ - _loc2_);
            this._9903.graphics.endFill();
         }
         else if(_loc7_ > _loc5_ && this.selectionBeginIndex != this.selectionEndIndex)
         {
            _loc11_ = TextLine(_9849[_loc5_].content).getAtomBounds(_loc6_);
            _loc1_ = 0 + _loc11_.x;
            _loc2_ = TextLine(_9849[_loc5_].content).y - this._9881(_9849[_loc5_].content);
            _loc11_ = TextLine(_9849[_loc5_].content).getAtomBounds(TextLine(_9849[_loc5_].content).atomCount - 1);
            _loc3_ = 0 + _loc11_.x + _loc11_.width;
            _loc4_ = _loc2_ + this._9737;
            this._9903.graphics.beginFill(this._9865);
            this._9903.graphics.drawRect(_9849[_loc5_].content.x + _loc1_,_loc2_,_loc3_ - _loc1_,_loc4_ - _loc2_);
            this._9903.graphics.endFill();
            _loc1_ = 0;
            _loc2_ = TextLine(_9849[_loc7_].content).y - this._9881(_9849[_loc7_].content);
            if(_loc8_ == 0)
            {
               _loc3_ = 0;
            }
            else
            {
               _loc11_ = TextLine(_9849[_loc7_].content).getAtomBounds(_loc8_ - 1);
               _loc3_ = 0 + _loc11_.x + _loc11_.width;
            }
            _loc4_ = _loc2_ + this._9737;
            this._9903.graphics.beginFill(this._9865);
            this._9903.graphics.drawRect(_9849[_loc7_].content.x + _loc1_,_loc2_,_loc3_ - _loc1_,_loc4_ - _loc2_);
            this._9903.graphics.endFill();
            _loc13_ = _loc5_ + 1;
            while(_loc13_ < _loc7_)
            {
               _loc1_ = 0;
               _loc2_ = TextLine(_9849[_loc13_].content).y - this._9881(_9849[_loc13_].content);
               _loc11_ = TextLine(_9849[_loc13_].content).getAtomBounds(TextLine(_9849[_loc13_].content).atomCount - 1);
               _loc3_ = 0 + _loc11_.x + _loc11_.width;
               _loc4_ = _loc2_ + this._9737;
               this._9903.graphics.beginFill(this._9865);
               this._9903.graphics.drawRect(_9849[_loc13_].content.x + _loc1_,_loc2_,_loc3_ - _loc1_,_loc4_ - _loc2_);
               this._9903.graphics.endFill();
               _loc13_++;
            }
         }
         this._9862();
         this._8427();
      }
      
      private function _8427() : void
      {
         var _loc1_:Rectangle = null;
         var _loc2_:Number = NaN;
         if(isNaN(this._9928))
         {
            return;
         }
         if(!this.container.scrollRect)
         {
            this.container.scrollRect = new Rectangle(0,0,this._9895.width,this._9895.height);
         }
         else
         {
            _loc1_ = this.container.scrollRect;
            _loc1_.width = isNaN(this._9928) ? this._9895.width : this._9928;
            _loc1_.height = isNaN(this._9921) ? this._9895.height : this._9921;
            this.container.scrollRect = _loc1_;
         }
         if(this._9928 > 0 && this.ibeam.visible)
         {
            if(this.ibeam.x < this.container.scrollRect.x)
            {
               _loc1_ = this.container.scrollRect;
               _loc1_.x = 0;
               this.container.scrollRect = _loc1_;
            }
            _loc2_ = this.textWidth;
            while(this.ibeam.x > this.container.scrollRect.x + this._9928)
            {
               _loc1_ = this.container.scrollRect;
               _loc1_.x += 200;
               if(_loc2_ - _loc1_.x < this._9928)
               {
                  _loc1_.x = _loc2_ - this._9928;
                  this.container.scrollRect = _loc1_;
                  break;
               }
               if(_loc1_.x < 0)
               {
                  _loc1_.x = 0;
               }
               this.container.scrollRect = _loc1_;
            }
         }
      }
      
      public function get textWidth() : Number
      {
         var _loc1_:Number = 0;
         var _loc2_:int = 0;
         while(_loc2_ < _9849.length)
         {
            if(_9849[_loc2_].content.width > _loc1_)
            {
               _loc1_ = _9849[_loc2_].content.width;
            }
            _loc2_++;
         }
         return _loc1_ + this._9738;
      }
      
      public function get textHeight() : Number
      {
         return this.numLines * (this._9737 + this._8539) - this._8539;
      }
      
      private function _9881(param1:TextLine) : Number
      {
         return param1.ascent + (this._9737 / 2 - param1.ascent / 2);
      }
      
      public function get selectionEndIndex() : int
      {
         return Math.max(this._9882,this._9870);
      }
      
      public function get selectionBeginIndex() : int
      {
         return Math.min(this._9882,this._9870);
      }
      
      public function getLineIndexAtPoint(param1:Number, param2:Number) : int
      {
         var _loc3_:int = this._9864(new Point(param1,param2));
         return this.getLineIndexOfChar(_loc3_);
      }
      
      public function getLineIndexOfChar(param1:int) : int
      {
         return this._9889(param1);
      }
      
      public function _9889(param1:int) : int
      {
         if(param1 == this.text.length)
         {
            return _9848.length - 1;
         }
         var _loc2_:int = 0;
         while(_loc2_ < _9848.length)
         {
            if(param1 >= _9848[_loc2_]._9908 && param1 < _9848[_loc2_]._9908 + _9848[_loc2_].length)
            {
               return _loc2_;
            }
            _loc2_++;
         }
         return -1;
      }
      
      public function _9888(param1:int) : int
      {
         var _loc2_:_1415 = _9848[_9849[_9849.length - 1]._9916];
         if(param1 == _loc2_._9908 && _loc2_.length == 0)
         {
            return _9849.length - 1;
         }
         var _loc3_:int = 0;
         while(_loc3_ < _9849.length)
         {
            _loc2_ = _9848[_9849[_loc3_]._9916];
            if(param1 >= _loc2_._9908 && param1 < _loc2_._9908 + _loc2_.length)
            {
               return _loc3_;
            }
            _loc3_++;
         }
         return -1;
      }
      
      public function setSelection(param1:int, param2:int) : void
      {
         this._9870 = param1;
         this._9882 = param2;
         if(this._9882 > this._text.length)
         {
            this._9882 = this._text.length;
         }
         if(this._9870 > this._text.length)
         {
            this._9870 = this._text.length;
         }
         if(this._9870 < 0)
         {
            this._9870 = 0;
         }
         if(this._9882 < 0)
         {
            this._9882 = 0;
         }
         this._9869(true);
         this._9874();
      }
      
      protected function _9873(param1:int, param2:int) : int
      {
         var _loc3_:String = _9848[param2].content;
         var _loc4_:int = param1;
         param1 -= _9848[param2]._9908;
         var _loc5_:int = param1 - 1;
         while(_loc5_ >= 0)
         {
            if(!this._9919(_loc3_.charAt(_loc5_)))
            {
               if(this._9923(_loc3_.charAt(_loc5_)))
               {
                  return _9848[param2]._9908 + _loc5_;
               }
               if(_loc5_ > 0 && this._9923(_loc3_.charAt(_loc5_ - 1)))
               {
                  return _9848[param2]._9908 + _loc5_;
               }
               if(this._9890(_loc3_.charAt(_loc5_)))
               {
                  return _9848[param2]._9908 + _loc5_;
               }
            }
            _loc5_--;
         }
         if(_loc4_ == _9848[param2]._9908)
         {
            return _loc4_ - 1;
         }
         return _9848[param2]._9908;
      }
      
      protected function _9875(param1:int, param2:int) : int
      {
         var _loc3_:String = _9848[param2].content;
         var _loc4_:int = param1;
         param1 -= _9848[param2]._9908;
         var _loc5_:int = param1 + 1;
         while(_loc5_ < _loc3_.length)
         {
            if(!this._9919(_loc3_.charAt(_loc5_)))
            {
               if(this._9923(_loc3_.charAt(_loc5_)))
               {
                  return _9848[param2]._9908 + _loc5_;
               }
               if(_loc5_ > 0 && this._9923(_loc3_.charAt(_loc5_ - 1)))
               {
                  return _9848[param2]._9908 + _loc5_;
               }
               if(this._9890(_loc3_.charAt(_loc5_)))
               {
                  return _9848[param2]._9908 + _loc5_;
               }
            }
            _loc5_++;
         }
         if(_9848[param2]._9908 + _loc3_.length == _loc4_)
         {
            return _loc4_ + 1;
         }
         return _9848[param2]._9908 + _loc3_.length;
      }
      
      private function _9919(param1:String) : Boolean
      {
         var _loc2_:int = int(param1.charCodeAt(0));
         if(_loc2_ == 9 || _loc2_ == 32)
         {
            return true;
         }
         return false;
      }
      
      private function _9923(param1:String) : Boolean
      {
         var _loc2_:int = int(param1.charCodeAt(0));
         if(_loc2_ >= 65 && _loc2_ <= 90 || _loc2_ >= 97 && _loc2_ <= 122 || _loc2_ >= 48 && _loc2_ <= 57 || _loc2_ == 95)
         {
            return false;
         }
         return true;
      }
      
      private function _9890(param1:String) : Boolean
      {
         var _loc2_:int = int(param1.charCodeAt(0));
         if(_loc2_ >= 65 && _loc2_ <= 90)
         {
            return true;
         }
         return false;
      }
      
      public function undo() : void
      {
         IME.compositionAbandoned();
         this._9896.undo();
         this._9905();
      }
      
      public function redo() : void
      {
         IME.compositionAbandoned();
         this._9896.redo();
         this._9905();
      }
      
      public function _9321() : Boolean
      {
         return this._9896._9321();
      }
      
      public function _9320() : Boolean
      {
         return this._9896._9320();
      }
      
      public function _9918() : void
      {
         this._9896._9944();
      }
      
      private function _9862() : void
      {
         if(this._9860 != this.selectionBeginIndex || this._9866 != this.selectionEndIndex)
         {
            this._9860 = this.selectionBeginIndex;
            this._9866 = this.selectionEndIndex;
            dispatchEvent(new FTETextSelectionEvent(FTETextSelectionEvent.TEXT_SELECTION_CHANGED));
         }
      }
      
      public function get length() : int
      {
         return this._text.length;
      }
      
      private function _9900(param1:Boolean = true) : void
      {
         this._9902 = new ElementFormat(new FontDescription(this._8534,this._8541 ? FontWeight.BOLD : FontWeight.NORMAL,this._8540 ? FontPosture.ITALIC : FontPosture.NORMAL),this._9935,this._9930,1,"auto","roman","useDominantBaseline",0,"on",this._8531 / 2,this._8531 / 2);
         this._9863 = new ElementFormat(new FontDescription(this._8534,this._8541 ? FontWeight.BOLD : FontWeight.NORMAL,this._8540 ? FontPosture.ITALIC : FontPosture.NORMAL),this._9935,this._9878,1,"auto","roman","useDominantBaseline",0,"on",this._8531 / 2,this._8531 / 2);
         if(param1)
         {
            this._9911();
         }
         dispatchEvent(new Event("textFormatChanged"));
      }
      
      private function _9905() : void
      {
         if(this.text != this._9933)
         {
            this.dispatchEvent(new Event(Event.CHANGE));
         }
         this._9933 = this.text;
      }
      
      public function get compositionEndIndex() : int
      {
         return this._9327 + this._9329;
      }
      
      public function get compositionStartIndex() : int
      {
         return this._9327;
      }
      
      public function confirmComposition(param1:String = null, param2:Boolean = false) : void
      {
         this._9275();
      }
      
      private function _9275() : void
      {
         if(this._9331)
         {
            return;
         }
         this._9331 = true;
         if(this._9329 > 0)
         {
            this._9326();
         }
         if(this.stage)
         {
            this.stage.focus = this;
         }
         this._9329 = 0;
      }
      
      public function _9473(param1:int, param2:Boolean = false) : Rectangle
      {
         var _loc3_:Rectangle = null;
         var _loc5_:_1415 = null;
         var _loc6_:_1417 = null;
         var _loc7_:Point = null;
         var _loc8_:Point = null;
         var _loc9_:Rectangle = null;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc4_:int = 0;
         while(_loc4_ < _9849.length)
         {
            _loc5_ = _9848[_9849[_loc4_]._9916];
            if(param1 >= _loc5_._9908 && param1 < _loc5_._9908 + _loc5_.length)
            {
               _loc6_ = _9849[_loc4_];
               if(param1 - _loc5_._9908 < _loc6_.length)
               {
                  _loc3_ = _loc6_.content.getAtomBounds(param1 - _loc5_._9908);
               }
               else
               {
                  _loc3_ = _loc6_.content.getAtomBounds(_loc6_.length - 1);
               }
               break;
            }
            _loc4_++;
         }
         if(_loc3_)
         {
            _loc7_ = new Point(_loc3_.x,_loc3_.y);
            _loc8_ = new Point(_loc3_.x + _loc3_.width,_loc3_.y + _loc3_.height);
            _loc7_ = _loc6_.content.localToGlobal(_loc7_);
            _loc8_ = _loc6_.content.localToGlobal(_loc8_);
            if(param2)
            {
               _loc10_ = _loc6_.content.y - this._9881(_loc6_.content);
               _loc11_ = _loc6_.content.y - this._9881(_loc6_.content) + this._9737;
               _loc7_ = this.globalToLocal(_loc7_);
               _loc8_ = this.globalToLocal(_loc8_);
               _loc7_.y = _loc10_;
               _loc8_.y = _loc11_;
               _loc7_ = this.localToGlobal(_loc7_);
               _loc8_ = this.localToGlobal(_loc8_);
            }
            return new Rectangle(_loc7_.x,_loc7_.y,_loc8_.x - _loc7_.x,_loc8_.y - _loc7_.y);
         }
         return null;
      }
      
      public function getTextBounds(param1:int, param2:int) : Rectangle
      {
         var _loc7_:Rectangle = null;
         var _loc8_:Rectangle = null;
         var _loc9_:Rectangle = null;
         var _loc10_:Rectangle = null;
         var _loc14_:_1415 = null;
         var _loc15_:_1417 = null;
         var _loc16_:_1417 = null;
         var _loc17_:Point = null;
         var _loc18_:Point = null;
         var _loc19_:int = 0;
         var _loc20_:int = 0;
         var _loc3_:Point = new Point(0,0);
         var _loc4_:Point = new Point(0,0);
         var _loc5_:Point = new Point(this.width,this.height);
         var _loc6_:Point = new Point(this.width,this.height);
         var _loc11_:int = 0;
         while(_loc11_ < _9849.length)
         {
            _loc14_ = _9848[_9849[_loc11_]._9916];
            if(param1 >= _loc14_._9908 && param1 < _loc14_._9908 + _loc14_.length)
            {
               _loc15_ = _9849[_loc11_];
               if(param1 - _loc14_._9908 < _loc15_.length)
               {
                  _loc7_ = _loc15_.content.getAtomBounds(param1 - _loc14_._9908);
               }
               else
               {
                  _loc7_ = _loc15_.content.getAtomBounds(_loc15_.length - 1);
               }
            }
            if(param2 >= _loc14_._9908 && param2 < _loc14_._9908 + _loc14_.length)
            {
               _loc16_ = _9849[_loc11_];
               if(param2 - _loc14_._9908 < _loc16_.length)
               {
                  _loc9_ = _loc16_.content.getAtomBounds(param2 - _loc14_._9908);
               }
               else
               {
                  _loc9_ = _loc16_.content.getAtomBounds(_loc16_.length - 1);
               }
            }
            _loc11_++;
         }
         if(_loc7_)
         {
            _loc17_ = new Point(_loc7_.x,_loc7_.y);
            _loc18_ = new Point(_loc7_.x + _loc7_.width,_loc7_.y + _loc7_.height);
            _loc17_ = _loc15_.content.localToGlobal(_loc17_);
            _loc18_ = _loc15_.content.localToGlobal(_loc18_);
            _loc19_ = _loc15_.content.y - this._9881(_loc15_.content);
            _loc20_ = _loc15_.content.y - this._9881(_loc15_.content) + this._9737;
            _loc17_ = this.globalToLocal(_loc17_);
            _loc18_ = this.globalToLocal(_loc18_);
            _loc17_.y = _loc19_;
            _loc18_.y = _loc20_;
            _loc17_ = this.localToGlobal(_loc17_);
            _loc18_ = this.localToGlobal(_loc18_);
            _loc8_ = new Rectangle(_loc17_.x,_loc17_.y,_loc18_.x - _loc17_.x,_loc18_.y - _loc17_.y);
         }
         else
         {
            _loc17_ = new Point(0,0);
            _loc18_ = new Point(this.width,this.height);
            _loc17_ = this.localToGlobal(_loc17_);
            _loc18_ = this.localToGlobal(_loc18_);
            _loc8_ = new Rectangle(_loc17_.x,_loc17_.y,_loc18_.x - _loc17_.x,_loc18_.y - _loc17_.y);
         }
         if(_loc9_)
         {
            _loc17_ = new Point(_loc9_.x,_loc9_.y);
            _loc18_ = new Point(_loc9_.x + _loc9_.width,_loc9_.y + _loc9_.height);
            _loc17_ = _loc16_.content.localToGlobal(_loc17_);
            _loc18_ = _loc16_.content.localToGlobal(_loc18_);
            _loc19_ = _loc16_.content.y - this._9881(_loc16_.content);
            _loc20_ = _loc16_.content.y - this._9881(_loc16_.content) + this._9737;
            _loc17_ = this.globalToLocal(_loc17_);
            _loc18_ = this.globalToLocal(_loc18_);
            _loc17_.y = _loc19_;
            _loc18_.y = _loc20_;
            _loc17_ = this.localToGlobal(_loc17_);
            _loc18_ = this.localToGlobal(_loc18_);
            _loc10_ = new Rectangle(_loc17_.x,_loc17_.y,_loc18_.x - _loc17_.x,_loc18_.y - _loc17_.y);
         }
         else
         {
            _loc17_ = new Point(0,0);
            _loc18_ = new Point(this.width,this.height);
            _loc17_ = this.localToGlobal(_loc17_);
            _loc18_ = this.localToGlobal(_loc18_);
            _loc10_ = new Rectangle(_loc17_.x,_loc17_.y,_loc18_.x - _loc17_.x,_loc18_.y - _loc17_.y);
         }
         _loc17_.x = Math.min(_loc8_.x,_loc10_.x);
         _loc17_.y = Math.min(_loc8_.y,_loc10_.y);
         _loc18_.x = Math.max(_loc8_.x + _loc8_.width,_loc10_.x + _loc10_.width);
         _loc18_.y = Math.max(_loc8_.y + _loc8_.height,_loc10_.y + _loc10_.height);
         _loc17_ = this.globalToLocal(_loc17_);
         _loc18_ = this.globalToLocal(_loc18_);
         var _loc12_:Rectangle = new Rectangle(_loc17_.x,_loc17_.y,_loc18_.x - _loc17_.x,_loc18_.y - _loc17_.y);
         var _loc13_:Rectangle = this._9473(this.selectionEndIndex,true);
         if(_loc13_)
         {
            _loc17_.x = _loc13_.x;
            _loc17_.y = _loc13_.y;
            _loc17_ = this.globalToLocal(_loc17_);
            _loc13_.x = _loc17_.x;
            _loc13_.y = _loc17_.y;
            return _loc13_;
         }
         return _loc12_;
      }
      
      public function getTextInRange(param1:int, param2:int) : String
      {
         if(param1 < -1 || param2 < -1 || param1 > this.text.length - 1 || param2 > this.text.length - 1)
         {
            return null;
         }
         if(param1 == -1)
         {
            param1 = 0;
         }
         return this.text.slice(param1,param2);
      }
      
      public function selectRange(param1:int, param2:int) : void
      {
         this.setSelection(param1,param2);
      }
      
      public function get selectionActiveIndex() : int
      {
         return this._9882;
      }
      
      public function get selectionAnchorIndex() : int
      {
         return this._9882;
      }
      
      public function updateComposition(param1:String, param2:Vector.<CompositionAttributeRange>, param3:int, param4:int) : void
      {
         if(this._9329 > 0)
         {
            this._9326();
         }
         this._9329 = param1.length;
         var _loc5_:int = this.selectionBeginIndex;
         this.replaceText(this.selectionBeginIndex,this.selectionEndIndex,param1,false,true);
         this.setSelection(_loc5_,_loc5_ + param1.length);
      }
      
      private function _9326() : void
      {
         if(this._9329 > 0)
         {
            this.replaceText(this._9327,this._9327 + this._9329,"",false,false);
            this.setSelection(this._9327,this._9327);
            this._9329 = 0;
         }
      }
      
      public function get verticalTextLayout() : Boolean
      {
         return false;
      }
   }
}

