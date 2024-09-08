package _625
{
   import _1009.CreateProjectWindow;
   import _1009.NewProjectWindow;
   import _1009._1026;
   import _1045.Button;
   import _11106._11105;
   import _11111._11110;
   import _1177.UIEvent;
   import _127._128;
   import _1374.TextInput;
   import _470._469;
   import _636.WindowEvent;
   import _639._638;
   import _708.ProjectType;
   import _73.SymbolType;
   import _772._775;
   import _777._779;
   import _783.CommandNotification;
   import _93._94;
   import _97._100;
   import _97._118;
   import egret.utils.FileUtil;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.filesystem.File;
   import flash.ui.Keyboard;
   
   public class _629 extends _94
   {
      public static const SELECT_CHANGE:String = "selectChange";
      
      private var window:NewProjectWindow;
      
      private var _5548:CreateProjectWindow;
      
      private var _5530:_1026;
      
      private var file:File;
      
      private var _5532:Boolean = false;
      
      public function _629()
      {
         this.file = new File();
         super();
      }
      
      public function _3304() : void
      {
         this._5548 = new CreateProjectWindow();
         this._5548.addEventListener(WindowEvent.DRAGONBONES_PROJECT,this._5528);
         this._5548.addEventListener(WindowEvent.COMIC_PROJECT,this._5533);
         this._5548.addEventListener(Event.CLOSE,this._5537);
         this._5548.open();
      }
      
      private function _5537(param1:Event) : void
      {
         this._5548.removeEventListener(WindowEvent.DRAGONBONES_PROJECT,this._5528);
         this._5548.removeEventListener(WindowEvent.COMIC_PROJECT,this._5533);
         this._5548.removeEventListener(Event.CLOSE,this._5537);
      }
      
      private function _5533(param1:WindowEvent) : void
      {
         _1567(new CommandNotification(CommandNotification.SHOW_NEW_COMIC_PROJECT_WINDOW));
         this._5548.close();
      }
      
      private function _5528(param1:WindowEvent) : void
      {
         _1567(new CommandNotification(CommandNotification.SHOW_NEW_DRAGON_PROJECT_WINDOW));
         this._5548.close();
      }
      
      public function _3155() : void
      {
         this.window = new NewProjectWindow();
         this.window.addEventListener(UIEvent.CREATION_COMPLETE,this._5481);
         this.window.addEventListener(SELECT_CHANGE,function():void
         {
            _5538();
         });
         this.window.addEventListener(KeyboardEvent.KEY_DOWN,function(param1:KeyboardEvent):void
         {
            if(param1.keyCode == Keyboard.ENTER)
            {
               _5539(null);
            }
         });
         this.window.open();
      }
      
      public function _3307() : void
      {
         this._5530 = new _1026(_2214._3277);
         this._5530.addEventListener(UIEvent.CREATION_COMPLETE,this._5529);
         this._5530.addEventListener(Event.CLOSE,this._5545);
         this._5530.addEventListener(KeyboardEvent.KEY_DOWN,function(param1:KeyboardEvent):void
         {
            if(param1.keyCode == Keyboard.ENTER)
            {
               _5553(null);
            }
         });
         this._5530.open();
      }
      
      private function _5545(param1:Event) : void
      {
         this._5530.removeEventListener(UIEvent.CREATION_COMPLETE,this._5529);
         this._5530.removeEventListener(Event.CLOSE,this._5545);
         this._5530._5554.removeEventListener(MouseEvent.CLICK,this._5553);
         this._5530._5558.removeEventListener(MouseEvent.CLICK,this._5549);
      }
      
      private function _5529(param1:UIEvent) : void
      {
         this._5530._5554.addEventListener(MouseEvent.CLICK,this._5553);
         this._5530._5558.addEventListener(MouseEvent.CLICK,this._5549);
      }
      
      private function _5549(param1:MouseEvent) : void
      {
         this._5530.close();
         this._3304();
      }
      
      private function _5553(param1:MouseEvent) : void
      {
         var _loc2_:Object = this._5530._5551();
         var _loc3_:String = _2214._11701(_638.NEW_COMIC_NAME);
         var _loc4_:String = _2214._11702(_loc3_,_loc3_);
         var _loc5_:String = _2214._11703(_loc3_,_loc4_);
         _loc2_.path = _loc5_;
         _779.instance._3293(_779.PARAM_V1,_775.SYMBOL_COMIC);
         _779.instance._3293(_779.PARAM_TYPE,_775.TYPE_COMIC);
         _11110.instance._11133._11139(_11105.NewProject_Type,_11105.ProjectType_Comic);
         var _loc6_:Object;
         (_loc6_ = _469._3492(_loc2_.path,[SymbolType.COMIC]))._3294 = {"canvas":[{
            "name":"Comic",
            "color":_100.COMIC_BG_COLOR,
            "height":_loc2_.height,
            "width":_loc2_.width
         }]};
         this._1567(new CommandNotification(CommandNotification.NEW_PROJECT,_loc6_));
         this._5530.close();
      }
      
      override public function start() : void
      {
         super.start();
      }
      
      override protected function init() : void
      {
         super.init();
      }
      
      override protected function _1576() : void
      {
         super._1576();
      }
      
      protected function _5481(param1:UIEvent) : void
      {
         var _loc2_:String = _2214._11701(_638.NEW_PROJECT_NAME);
         var _loc3_:String = _2214._11702(_loc2_,_638.NEW_PROJECT_NAME);
         this._5535.text = _loc3_;
         this.file = new File(FileUtil.escapePath(_2214._10787 + "/" + _loc2_));
         this._5540();
         this._5535.addEventListener(Event.CHANGE,this._5526);
         this._5534.addEventListener(Event.CHANGE,this._5525);
         this._5534.addEventListener(FocusEvent.FOCUS_OUT,this._5542);
         this._5544.addEventListener(Event.CHANGE,this._5536);
         this._5556.addEventListener(MouseEvent.CLICK,this._5541);
         this._5554.addEventListener(MouseEvent.CLICK,this._5539);
         this.window._5558.addEventListener(MouseEvent.CLICK,this._5547);
      }
      
      private function _5542(param1:FocusEvent) : void
      {
         if(!_118._2381(this._5534.text))
         {
            this._5540();
         }
      }
      
      private function _5540() : void
      {
         this._5534.text = this.file.resolvePath(this._5535.text).nativePath;
      }
      
      private function _5536(param1:Event) : void
      {
         if(this._5544.selected)
         {
            this._5540();
         }
         this._5534.enabled = !this._5544.selected;
         this._5556.enabled = !this._5544.selected;
      }
      
      private function _5526(param1:Event) : void
      {
         if(this._5544.selected)
         {
            this._5540();
         }
         this._5538();
      }
      
      private function _5525(param1:Event) : void
      {
         this._5532 = true;
         this._5538();
      }
      
      private function _5547(param1:MouseEvent) : void
      {
         this.window.close();
         this._3304();
      }
      
      private function _5541(param1:MouseEvent) : void
      {
         FileUtil.browseForOpen(this._5531,3);
      }
      
      private function _5539(param1:MouseEvent) : void
      {
         var _loc7_:String = null;
         _779.instance._3293(_779.PARAM_TYPE,_775.TYPE_DB);
         _11110.instance._11133._11139(_11105.NewProject_Type,_11105.ProjectType_Animation);
         var _loc2_:Array = this._5546;
         var _loc3_:Array = this._13372;
         var _loc4_:uint = 0;
         var _loc5_:int = 0;
         var _loc6_:int = int(_loc2_.length);
         while(_loc5_ < _loc6_)
         {
            if(_loc2_[_loc5_] == SymbolType.ARMATURE)
            {
               _loc4_ |= _775.SYMBOL_ARMATURE;
            }
            else if(_loc2_[_loc5_] == SymbolType.MC)
            {
               _loc4_ |= _775.SYMBOL_BASIC;
            }
            else if(_loc2_[_loc5_] == SymbolType.STAGE)
            {
               _loc4_ |= _775.SYMBOL_STAGE;
            }
            else if(_loc2_[_loc5_] == SymbolType.SHEET)
            {
               _loc4_ |= _775.SYMBOL_SHEET;
            }
            _loc5_++;
         }
         _779.instance._3293(_779.PARAM_V1,_loc4_);
         if(this.window._7269.selected)
         {
            _11110.instance._11133._11139(_11105.ProjectType_Animation,_11105.AnimationTemplate_Armature);
         }
         else if(this.window._7271.selected)
         {
            _11110.instance._11133._11139(_11105.ProjectType_Animation,_11105.AnimationTemplate_MovieClip);
         }
         else if(this.window._7270.selected)
         {
            _11110.instance._11133._11139(_11105.ProjectType_Animation,_11105.AnimationTemplate_Custom);
            _11110.instance._11133._11139(_11105.AnimationTemplate_Custom,_loc4_.toString(2));
         }
         var _loc8_:String = _2214._11701(_638.NEW_PROJECT_NAME);
         var _loc9_:String = _2214._11702(_loc8_,_loc8_);
         _loc7_ = _2214._11703(_loc8_,_loc9_);
         var _loc10_:Object = _469._3492(_loc7_,_loc2_,_loc3_);
         this._1567(new CommandNotification(CommandNotification.NEW_PROJECT,_loc10_));
         this.window.close();
      }
      
      private function _5531(param1:File) : void
      {
         if(!param1)
         {
            return;
         }
         this._5532 = true;
         this._5534.text = FileUtil.escapeUrl(param1.nativePath);
         this._5538();
      }
      
      private function _5538() : void
      {
         if(this._5554 == null)
         {
            return;
         }
         this._5554.enabled = this._5535.text != "" && this._5534.text != "" && this.window._5557 > 0;
      }
      
      protected function get projectType() : ProjectType
      {
         if(this.window._5527.selected)
         {
            return ProjectType.BASIC_ANIMATION;
         }
         if(this.window._5524.selected)
         {
            return ProjectType.SKELETAL_ANIMATION;
         }
         return null;
      }
      
      protected function get _5535() : TextInput
      {
         return this.window._5535;
      }
      
      protected function get _5534() : TextInput
      {
         return this.window._5534;
      }
      
      protected function get _5546() : Array
      {
         var _loc1_:Array = [];
         if(this.window._5550.selected)
         {
            _loc1_.push(SymbolType.ARMATURE);
         }
         if(this.window._5559.selected)
         {
            _loc1_.push(SymbolType.MC);
         }
         if(this.window._13374.selected)
         {
            _loc1_.push(SymbolType.SHEET);
         }
         return _loc1_;
      }
      
      protected function get _13372() : Array
      {
         if(this.window)
         {
            if(this.window._13373.selected)
            {
               return [this.window._13371.value,this.window._13370.value];
            }
         }
         return null;
      }
      
      protected function get _5556() : Button
      {
         return this.window._5556;
      }
      
      protected function get _5554() : Button
      {
         return this.window._5554;
      }
      
      protected function get _5555() : Button
      {
         return this.window._5555;
      }
      
      protected function get _5544() : _128
      {
         return this.window._5544;
      }
   }
}

