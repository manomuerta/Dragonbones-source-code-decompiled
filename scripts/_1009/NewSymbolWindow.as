package _1009
{
   import _1045.Button;
   import _1045.Group;
   import _1045.Label;
   import _1045.RadioButton;
   import _1045._1081;
   import _127._162;
   import _127._171;
   import _1374.ColorPicker;
   import _1374.TextInput;
   import _97._125;
   import egret.utils.tr;
   import flash.events.MouseEvent;
   
   public class NewSymbolWindow extends _171
   {
      private const DEFAULT_STAGE_WIDTH:int = 800;
      
      private const DEFAULT_STAGE_HEIGHT:int = 600;
      
      private const DEFAULT_STAGE_BG:uint = 16777215;
      
      public var _6548:Label;
      
      public var _5571:TextInput;
      
      public var _7174:Label;
      
      public var _5566:TextInput;
      
      public var _5565:Button;
      
      public var _6546:Label;
      
      public var _5554:Button;
      
      public var _5555:Button;
      
      public var _7272:RadioButton;
      
      public var _7269:RadioButton;
      
      public var _7102:RadioButton;
      
      public var _13485:RadioButton;
      
      public var _5567:_1081;
      
      public var _4025:_162;
      
      public var _4024:_162;
      
      public var _4066:ColorPicker;
      
      public var _6189:Label;
      
      public var _6187:Label;
      
      public var _6188:Label;
      
      public var _7277:Group;
      
      public function NewSymbolWindow()
      {
         this._4025 = new _162();
         this._4024 = new _162();
         this._4066 = new ColorPicker();
         this._6189 = new Label();
         this._6187 = new Label();
         this._6188 = new Label();
         super();
         this.title = tr("NewSymbolWindow.title");
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this._7276();
         this._7275();
         this._7273();
         this._7274();
         this._7244();
         this._5555.addEventListener(MouseEvent.CLICK,_2517);
         this._5571._2581();
      }
      
      private function _7276() : void
      {
         var _loc1_:Group = _125._2414();
         _loc1_.percentWidth = 100;
         this._6548 = new Label();
         this._6548.text = tr("NewSymbolWindow.name");
         this._5571 = new TextInput();
         this._5571.restrict = "^/\\:*?\"\'<>|.@#$%^&! ~";
         this._5571.maxChars = 30;
         this._5571.percentWidth = 100;
         _loc1_.addElement(this._6548);
         _loc1_.addElement(this._5571);
         _2512.addElement(_loc1_);
      }
      
      private function _7275() : void
      {
         var _loc1_:Group = _125._2414();
         _loc1_.percentWidth = 100;
         this._6546 = new Label();
         this._6546.text = tr("NewSymbolWindow.type");
         this._5567 = new _1081();
         this._7269 = new RadioButton();
         this._7269.value = 0;
         this._7269.group = this._5567;
         this._7269.label = tr("NewSymbolWindow.armatureType");
         this._7102 = new RadioButton();
         this._7102.value = 1;
         this._7102.group = this._5567;
         this._7102.label = tr("NewSymbolWindow.mcType");
         this._7272 = new RadioButton();
         this._7272.value = 2;
         this._7272.group = this._5567;
         this._7272.label = tr("NewSymbolWindow.stageType");
         this._13485 = new RadioButton();
         this._13485.value = 3;
         this._13485.group = this._5567;
         this._13485.label = tr("NewSymbolWindow.sheetType");
         _loc1_.addElement(this._6546);
         _loc1_.addElement(this._7269);
         _loc1_.addElement(this._13485);
         _loc1_.addElement(this._7102);
         _2512.addElement(_loc1_);
      }
      
      private function _7273() : void
      {
         var _loc1_:Group = _125._2414();
         _loc1_.percentWidth = 100;
         this._7174 = new Label();
         this._7174.text = tr("NewSymbolWindow.libraryPath");
         this._5566 = new TextInput();
         this._5566.percentWidth = 100;
         this._5565 = _125._2405();
         _loc1_.addElement(this._7174);
         _loc1_.addElement(this._5566);
         _loc1_.addElement(this._5565);
         _2512.addElement(_loc1_);
      }
      
      private function _7274() : void
      {
         var _loc1_:int = 48;
         this._7277 = _125._2413();
         this._7277.percentWidth = 100;
         var _loc2_:Group = _125._2414();
         _loc2_.percentWidth = 100;
         this._6189.text = tr("Property.canvas.width");
         this._6189.width = _loc1_;
         this._4025.txt.maxChars = 8;
         this._4025.txt.percentWidth = 100;
         this._4025.percentWidth = 100;
         this._4025.minValue = 1;
         this._4025.maxValue = 2048;
         this._4025.enabled = true;
         this._4025.txt.text = this.DEFAULT_STAGE_WIDTH.toString();
         _loc2_.addElement(this._6189);
         _loc2_.addElement(this._4025);
         this._7277.addElement(_loc2_);
         _loc2_ = _125._2414();
         _loc2_.percentWidth = 100;
         this._6187.text = tr("Property.canvas.height");
         this._6187.width = _loc1_;
         this._4024.txt.maxChars = 8;
         this._4024.txt.percentWidth = 100;
         this._4024.percentWidth = 100;
         this._4024.minValue = 1;
         this._4024.maxValue = 2048;
         this._4024.enabled = true;
         this._4024.txt.text = this.DEFAULT_STAGE_HEIGHT.toString();
         _loc2_.addElement(this._6187);
         _loc2_.addElement(this._4024);
         this._7277.addElement(_loc2_);
         _loc2_ = _125._2414();
         _loc2_.percentWidth = 100;
         this._6188.text = tr("Property.canvas.bg");
         this._6188.width = _loc1_;
         this._4066._6193 = true;
         this._4066.defaultColor = this.DEFAULT_STAGE_BG;
         this._4066._4061 = this.DEFAULT_STAGE_BG;
         this._4066.toolTip = tr("");
         _loc2_.addElement(this._6188);
         _loc2_.addElement(this._4066);
         this._7277.addElement(_loc2_);
         _2512.addElement(this._7277);
      }
      
      private function _7244() : void
      {
         this._5554 = _125._2399();
         this._5555 = _125._2406();
         _2632.addElement(_2633);
         _2632.addElement(this._5554);
         _2632.addElement(this._5555);
         _2512.addElement(_2632);
      }
      
      public function set _5563(param1:Boolean) : void
      {
         this._7277.visible = this._7277.includeInLayout = param1;
      }
      
      public function set _5569(param1:Boolean) : void
      {
         if(param1)
         {
            this._7272.enabled = true;
            this._7277.visible = true;
         }
         else
         {
            this._7272.enabled = false;
            this._7277.visible = false;
         }
      }
   }
}

