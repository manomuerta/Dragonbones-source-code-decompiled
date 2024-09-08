package _1009
{
   import _1033._1035;
   import _1045.Button;
   import _1045.Group;
   import _1045.Label;
   import _1045.RadioButton;
   import _1045._1081;
   import _1045._1082;
   import _127._128;
   import _127._159;
   import _127._171;
   import _1374.TextInput;
   import _1529._1528;
   import _1529._1530;
   import _625._629;
   import _822._10616;
   import _97._124;
   import _97._125;
   import egret.utils.SystemInfo;
   import egret.utils.tr;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class NewProjectWindow extends _171
   {
      public var _7176:Label;
      
      public var _7246:Label;
      
      public var _7265:Label;
      
      public var _5527:RadioButton;
      
      public var _5524:RadioButton;
      
      public var _5535:TextInput;
      
      public var _5534:TextInput;
      
      public var _5556:Button;
      
      public var _5554:Button;
      
      public var _5555:Button;
      
      public var _5544:_128;
      
      public var _5559:_128;
      
      public var _5550:_128;
      
      public var _13374:_128;
      
      public var _7267:_1081;
      
      public var _7269:RadioButton;
      
      public var _7271:RadioButton;
      
      public var _7270:RadioButton;
      
      public var _13485:RadioButton;
      
      private var _7007:_1082;
      
      public var _13373:_128;
      
      public var _13371:_10616;
      
      public var _13370:_10616;
      
      private var _13412:Label;
      
      public var _5558:Button;
      
      public var _5557:int = 3;
      
      public function NewProjectWindow()
      {
         super();
         this.title = tr("NewProjectWindow.Title");
         if(!_1528.language != _1530.zh_CN)
         {
            this.width = 500;
         }
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this._7241();
         this._7242();
         this._7007 = new _1082();
         this._7007._2529 = 0.3;
         this._7007.width = this.width - 50;
         this._7007.height = 1;
         this._7264();
         this._7244();
         this._5555.addEventListener(MouseEvent.CLICK,_2517);
         this._5535._2581();
      }
      
      override protected function _5823(param1:Number, param2:Number) : void
      {
         super._5823(param1,param2);
         this._7007.width = param1 - 50;
      }
      
      private function _7241() : void
      {
         this._7176 = new Label();
         this._7176.text = tr("NewProjectWindow.ProjectName");
         this._5535 = new TextInput();
         this._5535.restrict = "^/\\:*?\"\'<>|.@#$%^&!~";
         this._5535.maxChars = 30;
         this._5535.addEventListener(Event.CHANGE,this._7253);
         this._5535.percentWidth = 100;
         var _loc1_:Group = _125._2414();
         _loc1_.percentWidth = 100;
         _loc1_.addElement(this._7176);
         _loc1_.addElement(this._5535);
      }
      
      private function _7263() : Group
      {
         this._7265 = new Label();
         this._7265.text = tr("NewProjectWindow.Create");
         this._5559 = new _128();
         this._5559.label = tr("NewProjectWindow.CreateMovieClip");
         this._5559.selected = true;
         this._5550 = new _128();
         this._5550.label = tr("NewProjectWindow.CreateArmature");
         this._5550.selected = true;
         this._13374 = new _128();
         this._13374.label = tr("NewProjectWindow.CreateSheet");
         this._13374.selected = true;
         var _loc1_:Group = _125._2414();
         _loc1_.percentWidth = 100;
         _loc1_.addElement(this._7265);
         _loc1_.addElement(this._5550);
         _loc1_.addElement(this._13374);
         _loc1_.addElement(this._5559);
         this._5550.enabled = false;
         this._5559.enabled = false;
         this._5550.selected = false;
         this._5559.selected = false;
         this._13374.enabled = false;
         this._5559.addEventListener(Event.CHANGE,this._7266);
         this._5550.addEventListener(Event.CHANGE,this._7266);
         return _loc1_;
      }
      
      private function _7264() : void
      {
         var _loc1_:Group = null;
         _loc1_ = _125._2413();
         var _loc2_:Group = _125._2403();
         var _loc3_:Label = new Label();
         _loc3_.text = tr("NewProjectWindow.templet");
         _loc2_.addElement(_loc3_);
         var _loc4_:Group = _125._2413(SystemInfo.isMacOS ? 10 : 10);
         this._7267 = new _1081();
         this._7269 = new RadioButton();
         this._7269.skinName = _1035;
         this._7269.group = this._7267;
         this._7269.label = tr("NewProjectWindow.armatureType");
         this._7271 = new RadioButton();
         this._7271.skinName = _1035;
         this._7271.group = this._7267;
         this._7271.label = tr("NewProjectWindow.basicType");
         this._7270 = new RadioButton();
         this._7270.skinName = _1035;
         this._7270.group = this._7267;
         this._7270.label = tr("NewProjectWindow.customType");
         this._13485 = new RadioButton();
         this._13485.skinName = _1035;
         this._13485.group = this._7267;
         this._13485.label = tr("NewProjectWindow.sheetType");
         _loc4_.addElement(this._7269);
         _loc4_.addElement(this._13485);
         _loc4_.addElement(this._7271);
         _loc4_.addElement(this._7270);
         this._7269.selected = true;
         _loc2_.addElement(_loc4_);
         var _loc5_:Group = _125._2414();
         var _loc6_:Label;
         (_loc6_ = new Label()).text = tr("NewprojectWindow.canvas");
         _loc5_.addElement(_loc6_);
         this._13373 = new _128();
         this._13373.label = tr("NewProjectWindow.openCanvas");
         _loc5_.addElement(this._13373);
         this._13371 = new _10616();
         this._13371.width = 60;
         this._13370 = new _10616();
         this._13370.width = 60;
         this._13371.minimum = 1;
         this._13371.maximum = 99999;
         this._13371._11442 = 0;
         this._13371._8236 = 1;
         this._13370.minimum = 1;
         this._13370.maximum = 99999;
         this._13370._8236 = 1;
         this._13370._11442 = 0;
         this._13371.value = 800;
         this._13370.value = 600;
         this._13412 = new Label();
         this._13412.text = "x";
         _loc5_.addElement(this._13371);
         _loc5_.addElement(this._13412);
         _loc5_.addElement(this._13370);
         var _loc7_:Group = this._7263();
         _loc1_.addElement(_loc2_);
         _loc1_.addElement(_loc5_);
         var _loc8_:Label;
         (_loc8_ = new Label()).height = 20;
         _loc1_.addElement(_loc8_);
         _loc1_.addElement(_loc7_);
         _loc1_.addElement(new Label());
         _2512.addElement(_loc1_);
         this._7267.addEventListener(Event.CHANGE,this._7268);
         this._13373.addEventListener(Event.CHANGE,this._4045);
         this._7268(null);
      }
      
      private function _4045(param1:Event) : void
      {
         this._13370.visible = this._13371.visible = this._13412.visible = this._13373.selected;
      }
      
      private function _7268(param1:Event) : void
      {
         this._5550.selected = false;
         this._5559.selected = false;
         this._13374.selected = false;
         this._5550.enabled = false;
         this._5559.enabled = false;
         this._13374.enabled = false;
         if(this._7269.selected)
         {
            this._5550.selected = true;
            this._13373.enabled = true;
         }
         else if(this._7271.selected)
         {
            this._5559.selected = true;
            this._13373.enabled = true;
         }
         else if(this._13485.selected)
         {
            this._13374.selected = true;
            this._13373.enabled = true;
         }
         if(this._7270.selected)
         {
            this._5550.selected = true;
            this._5559.selected = true;
            this._13374.selected = false;
            this._5550.enabled = true;
            this._5559.enabled = true;
            this._13374.enabled = true;
            this._13373.enabled = false;
         }
         if(!this._13373.enabled)
         {
            this._13373.selected = false;
            this._13370.visible = this._13371.visible = this._13412.visible = false;
         }
         else if(this._13373.selected)
         {
            this._13370.visible = this._13371.visible = this._13412.visible = true;
         }
         else
         {
            this._13370.visible = this._13371.visible = this._13412.visible = false;
         }
         this._7266(null);
      }
      
      private function _7242() : void
      {
         this._5544 = new _128();
         this._5544.label = tr("Import.defaultFolder");
         this._5544.selected = true;
         this._7246 = new Label();
         this._7246.text = tr("NewProjectWindow.ProjectPath");
         this._5534 = new _159();
         this._5534.percentWidth = 100;
         this._5534.enabled = false;
         this._5556 = _125._2405();
         this._5556.enabled = false;
         var _loc1_:Group = _125._2414();
         _loc1_.percentWidth = 100;
         _loc1_.addElement(this._7246);
         _loc1_.addElement(this._5534);
         _loc1_.addElement(this._5556);
      }
      
      private function _7266(param1:Event) : void
      {
         var _loc2_:int = 0;
         if(this._5559.selected)
         {
            _loc2_++;
         }
         if(this._5550.selected)
         {
            _loc2_++;
         }
         if(this._13374.selected)
         {
            _loc2_++;
         }
         this._5557 = _loc2_;
         this.dispatchEvent(new Event(_629.SELECT_CHANGE));
         if(this._5554)
         {
            this._5554.enabled = _loc2_ >= 1;
         }
      }
      
      protected function _7244() : void
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         this._5554 = _125._2399();
         this._5555 = _125._2406();
         this._5558 = new Button();
         this._5558.width = 92;
         this._5558.height = 26;
         this._5558.label = tr("NewProjectWindow.prevPage");
         this._5558.left = 0;
         this._5555.right = 0;
         this._5554.right = 100;
         _loc1_.addElement(this._5558);
         _loc1_.addElement(this._5554);
         _loc1_.addElement(this._5555);
         _2512.addElement(_loc1_);
      }
      
      private function _7253(param1:Event) : void
      {
         this._5535.text = _124._2392(this._5535.text);
      }
   }
}

