package _1009
{
   import _1021._1023;
   import _1038._1037;
   import _1045.Button;
   import _1045.Group;
   import _1045.Label;
   import _1045.List;
   import _1045.RadioButton;
   import _1045._1081;
   import _11106._11105;
   import _11111._11110;
   import _127._128;
   import _127._159;
   import _127._171;
   import _1374.Alert;
   import _1374.IconButton;
   import _1374.TextInput;
   import _1404._1407;
   import _1529._1528;
   import _1529._1530;
   import _625._627;
   import _648._650;
   import _721._722;
   import _772._773;
   import _777._779;
   import _783.CommandNotification;
   import _97._118;
   import _97._124;
   import _97._125;
   import egret.utils.FileUtil;
   import egret.utils.tr;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.MouseEvent;
   import flash.filesystem.File;
   
   public class _1024 extends _171
   {
      private const MAX_SCROLL:int = 3;
      
      private const MAX_SCROLL_HEIGHT:int = 70;
      
      public var _7137:Label;
      
      public var _5519:TextInput;
      
      public var _7059:Button;
      
      public var _7206:Label;
      
      public var _5511:TextInput;
      
      public var _7201:Button;
      
      public var _7178:Label;
      
      public var _5495:TextInput;
      
      public var _7163:Button;
      
      public var _7202:Label;
      
      public var _7203:TextInput;
      
      public var _7196:Button;
      
      public var radioGroup:_1081;
      
      public var _7207:RadioButton;
      
      public var _7197:RadioButton;
      
      public var _7186:Label;
      
      public var _7185:TextInput;
      
      public var _7177:Button;
      
      public var _7164:_1081;
      
      public var _7183:RadioButton;
      
      public var _7182:RadioButton;
      
      public var _5544:_128;
      
      public var _7176:Label;
      
      public var _7175:TextInput;
      
      public var _5554:Button;
      
      public var _5555:Button;
      
      public var pluginButton:Button;
      
      public var _5518:String = "";
      
      public var _5489:String = "";
      
      public var _5491:String = "";
      
      public var _5485:String = "";
      
      public var _7140:_128;
      
      public var _7174:Label;
      
      public var _5566:TextInput;
      
      public var _5565:Button;
      
      private var _7209:Group;
      
      private var _7190:Group;
      
      private var _7184:Group;
      
      private var _7151:Group;
      
      private var _7187:Group;
      
      private var _7189:Group;
      
      private var _7188:Group;
      
      private var _7192:Group;
      
      private var _7165:Group;
      
      private var _7210:Label;
      
      private var _7193:_650;
      
      private var _3261:String;
      
      private var _7198:String;
      
      private var _3250:String;
      
      private var _5532:Boolean;
      
      private var _7194:String;
      
      private var _7166:Group;
      
      private var _7179:Group;
      
      private var _7180:Group;
      
      public var _7191:List;
      
      public var _7173:IconButton;
      
      public var _7168:List;
      
      public var _7159:IconButton;
      
      public function _1024(param1:_650, param2:String, param3:String)
      {
         super();
         this.width = 600;
         this.title = tr("Import.Title");
         this._7198 = FileUtil.escapePath(param2);
         this._3250 = FileUtil.escapePath(param3);
         this._7193 = param1;
      }
      
      override protected function _6231() : String
      {
         if(this._3261)
         {
            switch(this._3261.toLowerCase())
            {
               case "json":
               case "xml":
               case "amf3":
                  if(this._7207.selected)
                  {
                     return "json_files";
                  }
                  return "json_texture";
                  break;
               case "zip":
                  return "zip";
               case "png":
                  return "png";
               case "dbswf":
                  return "dbswf";
               case "":
                  return "normal";
               default:
                  if(this._7207.selected)
                  {
                     return "json_files";
                  }
                  return "json_texture";
            }
         }
         else
         {
            return "normal";
         }
      }
      
      override protected function _6232() : void
      {
         if(this._7184.parent)
         {
            _2512.removeElement(this._7184);
         }
         if(this._7151.parent)
         {
            _2512.removeElement(this._7151);
         }
         if(this._7189.parent)
         {
            _2512.removeElement(this._7189);
         }
         if(this._7188.parent)
         {
            _2512.removeElement(this._7188);
         }
         if(this._7192.parent)
         {
            _2512.removeElement(this._7192);
         }
         if(this._7210.parent)
         {
            _2512.removeElement(this._7210);
         }
         if(this.pluginButton.parent)
         {
            this._7209.removeElement(this.pluginButton);
         }
         this._7197.enabled = true;
         if(this._3227._3717)
         {
            if(!this._3227._3717._3668.isSupportTextureAtlas())
            {
               this._7207.selected = true;
               this._7197.selected = false;
               this._7197.enabled = false;
            }
         }
         switch(this._6231())
         {
            case "normal":
               _2633.text = tr("Import.normalTip") + this._5518;
               break;
            case "json_texture":
               _2512.addElement(this._7210);
               _2512.addElement(this._7189);
               _2512.addElement(this._7184);
               _2512.addElement(this._7151);
               _2512.addElement(this._7192);
               this._7209.addElement(this.pluginButton);
               if(!this._3227._3717)
               {
                  _2633.text = tr("Import.data.json");
               }
               if(this._7168.dataProvider == null)
               {
                  this._7168.dataProvider = new _1037([{
                     "url":"",
                     "length":1
                  }]);
               }
               if(this._7191.dataProvider == null)
               {
                  this._7191.dataProvider = new _1037([{
                     "url":"",
                     "length":1
                  }]);
               }
               break;
            case "json_files":
               _2512.addElement(this._7210);
               _2512.addElement(this._7189);
               _2512.addElement(this._7188);
               _2512.addElement(this._7192);
               this._7209.addElement(this.pluginButton);
               if(!this._3227._3717)
               {
                  _2633.text = tr("Import.data.json");
               }
               break;
            case "zip":
               _2512.addElement(this._7192);
               _2633.text = tr("Import.zipTip");
               break;
            case "png":
               _2512.addElement(this._7192);
               _2633.text = tr("Import.pngTip");
               break;
            case "dbswf":
               _2512.addElement(this._7192);
               _2633.text = tr("Import.dbswfTip");
         }
         _2512.addElement(_2632);
      }
      
      override protected function _2438() : void
      {
         var _loc1_:int = 0;
         super._2438();
         if(_1528.language == _1530.en_US)
         {
            _loc1_ = 90;
         }
         else
         {
            _loc1_ = 64;
         }
         this._7190 = _125._2414();
         this._7190.percentWidth = 100;
         this._7137 = new Label();
         this._7137.text = tr("Import.dataPath");
         this._7137.width = _loc1_;
         this._7190.addElement(this._7137);
         this._5519 = new TextInput();
         this._5519.percentWidth = 100;
         this._5519.toolTip = tr("Import.dataPath.tooltip");
         this._5519.text = "";
         this._7190.addElement(this._5519);
         this._5519._2581();
         this._7059 = _125._2405();
         this._7190.addElement(this._7059);
         this._7184 = _125._2403();
         this._7184.percentWidth = 100;
         this._7206 = new Label();
         this._7206.width = _loc1_;
         this._7206.text = tr("Import.texturePath");
         this._7184.addElement(this._7206);
         this._7191 = new List();
         this._7191.itemRenderer = _1023;
         this._7191._5987 = "url";
         this._7191.percentWidth = 100;
         this._7184.addElement(this._7191);
         this._7173 = new IconButton();
         this._7173.icon = "/assets/timeline/timeline_zoomIn.png";
         this._7173.toolTip = tr("Import.file.addTip");
         this._7184.addElement(this._7173);
         this._7201 = _125._2405();
         this._7184.addElement(this._7201);
         this._7151 = _125._2403();
         this._7151.percentWidth = 100;
         this._7178 = new Label();
         this._7178.width = _loc1_;
         this._7178.text = tr("Import.textureConfigPath");
         this._7151.addElement(this._7178);
         this._7168 = new List();
         this._7168.itemRenderer = _1023;
         this._7168._5987 = "url";
         this._7168.percentWidth = 100;
         this._7151.addElement(this._7168);
         this._7159 = new IconButton();
         this._7159.icon = "/assets/timeline/timeline_zoomIn.png";
         this._7159.toolTip = tr("Import.file.addTip");
         this._7151.addElement(this._7159);
         this._7163 = _125._2405();
         this._7151.addElement(this._7163);
         this._7187 = _125._2414();
         this._7187.percentWidth = 100;
         this._7202 = new Label();
         this._7202.width = _loc1_;
         this._7202.text = tr("Import.savePath");
         this._7187.addElement(this._7202);
         this._7203 = new _159();
         this._7203.percentWidth = 100;
         this._7203.toolTip = tr("Import.savePath.tooltip");
         this._7203.text = "";
         this._7187.addElement(this._7203);
         this._7196 = _125._2405();
         this._7187.addElement(this._7196);
         this._7189 = _125._2414();
         this._7189.percentWidth = 100;
         var _loc2_:Label = new Label();
         _loc2_.width = _loc1_;
         _loc2_.text = tr("Import.skin.type");
         this._7189.addElement(_loc2_);
         this.radioGroup = new _1081();
         this._7207 = new RadioButton();
         this._7207.label = tr("Import.skin.files");
         this._7207.group = this.radioGroup;
         this._7197 = new RadioButton();
         this._7197.group = this.radioGroup;
         this._7197.selected = true;
         this._7197.label = tr("Import.skin.texture");
         this._7189.addElement(this._7197);
         this._7189.addElement(this._7207);
         this._7188 = _125._2414();
         this._7188.percentWidth = 100;
         this._7186 = new Label();
         this._7186.width = _loc1_;
         this._7186.text = tr("Import.skinPath");
         this._7188.addElement(this._7186);
         this._7185 = new TextInput();
         this._7185.percentWidth = 100;
         this._7185.toolTip = tr("Import.skinPath.tooltip");
         this._7185.text = "";
         this._7188.addElement(this._7185);
         this._7177 = _125._2405();
         this._7188.addElement(this._7177);
         this._7165 = _125._2414();
         this._7165.percentWidth = 100;
         this._7176 = new Label();
         this._7176.width = _loc1_;
         this._7176.text = tr("Import.projectName");
         this._7165.addElement(this._7176);
         this._7175 = new TextInput();
         this._7175.restrict = "^/\\:*?\"\'<>|.@#$%^&!~";
         this._7175.maxChars = 30;
         this._7175.percentWidth = 100;
         this._7175.toolTip = tr("Import.projectName.tooltip");
         this._7175.text = "";
         this._7165.addElement(this._7175);
         var _loc3_:Label = new Label();
         _loc3_.width = _loc1_;
         _loc3_.text = tr("Import.projectType");
         this._7164 = new _1081();
         this._7183 = new RadioButton();
         this._7183.label = tr("Import.type.new");
         this._7183.group = this._7164;
         this._7182 = new RadioButton();
         this._7182.label = tr("Import.type.current");
         this._7182.group = this._7164;
         var _loc4_:Group = _125._2414();
         _loc4_.addElement(_loc3_);
         _loc4_.addElement(this._7183);
         _loc4_.addElement(this._7182);
         this._7183.selected = true;
         if(this._3250 == null || this._3250 == "")
         {
            this._7182.enabled = false;
         }
         this._5544 = new _128();
         this._5544.label = tr("Import.defaultFolder");
         this._5544.selected = true;
         this._7203.enabled = false;
         this._7196.enabled = false;
         this._7179 = _125._2413();
         this._7179.percentWidth = 100;
         this._7179.addElement(this._5544);
         this._7179.addElement(this._7187);
         this._7192 = _125._2413();
         this._7192.percentWidth = 100;
         var _loc5_:Label;
         (_loc5_ = new Label()).height = 10;
         this._7192.addElement(_loc5_);
         this._7192.addElement(_loc4_);
         this._7180 = _125._2413();
         this._7180.percentWidth = 100;
         this._7140 = new _128();
         this._7140.label = tr("Import.importCurrentLibrary");
         this._7140.selected = true;
         this._7166 = _125._2414();
         this._7166.percentWidth = 100;
         this._7174 = new Label();
         this._7174.width = _loc1_;
         this._7174.text = tr("Import.libraryPath");
         this._7166.addElement(this._7174);
         this._5566 = new TextInput();
         this._5566.percentWidth = 100;
         this._5566.text = this._3250;
         this._5566.toolTip = tr("Import.libraryPath.tooltip");
         this._5566.enabled = false;
         this._7166.addElement(this._5566);
         this._5565 = _125._2405();
         this._5565.enabled = false;
         this._7166.addElement(this._5565);
         this._7180.addElement(this._7140);
         this._7180.addElement(this._7166);
         this._7192.addElement(this._7180);
         this._7180.visible = false;
         this._7180.includeInLayout = false;
         this._7210 = new Label();
         this._7210.height = 5;
         _2633 = new Label();
         _2633.alpha = 0.5;
         _2633.leading = 10;
         _2633.percentWidth = 100;
         this.pluginButton = new Button();
         this.pluginButton.top = 0;
         this.pluginButton.right = 0;
         this.pluginButton.label = tr("Plugin.pluginButton");
         this._7209 = new Group();
         this._7209.percentWidth = 100;
         this._7209.addElement(_2633);
         this._7209.addElement(this.pluginButton);
         _2512.addElement(this._7190);
         _2512.addElement(this._7209);
         this._5554 = _125._2399();
         _2632.addElement(this._5554);
         this._5555 = _125._2406();
         _2632.addElement(this._5555);
      }
      
      override protected function _2501() : void
      {
         this._5555.addEventListener(MouseEvent.CLICK,_2517);
         this._5554.addEventListener(MouseEvent.CLICK,this._2638);
         this._5519.addEventListener(Event.CHANGE,this._7153);
         this._5519.addEventListener("textChanged",this._7153);
         this._7059.addEventListener(MouseEvent.CLICK,this._7167);
         this.pluginButton.addEventListener(MouseEvent.CLICK,this._7169);
         this._7201.addEventListener(MouseEvent.CLICK,this._7162);
         this._7163.addEventListener(MouseEvent.CLICK,this._7143);
         this._7185.addEventListener(Event.CHANGE,this._7150);
         this._7207.addEventListener(Event.CHANGE,this._7144);
         this._7197.addEventListener(Event.CHANGE,this._7144);
         this._7175.addEventListener(Event.CHANGE,this._7142);
         this._7203.addEventListener(Event.CHANGE,this._7139);
         this._7203.addEventListener(FocusEvent.FOCUS_OUT,this._7161);
         this._7196.addEventListener(MouseEvent.CLICK,this._7057);
         this._7177.addEventListener(MouseEvent.CLICK,this._7172);
         this.radioGroup.addEventListener(Event.CHANGE,this._7150);
         this._5544.addEventListener(Event.CHANGE,this._7152);
         this._7140.addEventListener(Event.CHANGE,this._7149);
         this._5566.addEventListener(Event.CHANGE,this._7138);
         this._5566.addEventListener(FocusEvent.FOCUS_OUT,this._7160);
         this._5565.addEventListener(MouseEvent.CLICK,this._7156);
         this._7164.addEventListener(Event.CHANGE,this._7155);
         this._7191.addEventListener(Event.CHANGE,this._7150);
         this._7168.addEventListener(Event.CHANGE,this._7150);
         this._7173.addEventListener(MouseEvent.CLICK,this._7158);
         this._7159.addEventListener(MouseEvent.CLICK,this._7145);
         this._7181();
      }
      
      private function _7149(param1:Event) : void
      {
         var _loc2_:Boolean = this._7140.selected;
         if(_loc2_)
         {
            this._5566.text = this._3250;
         }
         this._5566.enabled = !_loc2_;
         this._5565.enabled = !_loc2_;
      }
      
      private function _7155(param1:Event) : void
      {
         if(this._7183.selected)
         {
            this._7175.enabled = true;
            this._7180.visible = false;
            this._7180.includeInLayout = false;
         }
         else
         {
            this._7175.enabled = false;
            this._7180.visible = true;
            this._7180.includeInLayout = true;
         }
         this._7181();
      }
      
      private function _7156(param1:MouseEvent) : void
      {
         var e:MouseEvent = param1;
         try
         {
            FileUtil.browseForOpen(function(param1:File):void
            {
               if(!param1)
               {
                  return;
               }
               var _loc2_:String = FileUtil.escapeUrl(param1.nativePath);
               _5566.text = _loc2_;
               _7181();
            },3);
         }
         catch(e:Error)
         {
         }
      }
      
      private function _7138(param1:Event) : void
      {
         this._7181();
      }
      
      private function _7160(param1:FocusEvent) : void
      {
         if(!_118._2381(this._5566.text))
         {
            this._5566.text = this._3250;
         }
      }
      
      private function _7161(param1:FocusEvent) : void
      {
         if(!_118._2381(this._7203.text))
         {
            this._7203.text = this._7198 + this._7175.text;
         }
      }
      
      private function _7152(param1:Event) : void
      {
         this._5532 = !this._5544.selected;
         if(this._5544.selected)
         {
            this._7203.text = this._7198 + this._7175.text;
         }
         this._7203.enabled = this._5532;
         this._7196.enabled = this._5532;
      }
      
      private function _7181() : void
      {
         switch(this._6231())
         {
            case "json_texture":
               this._5554.enabled = this._5519.text != "" && this._7148 && this._7154 && (this._7183.selected && this._7203.text != "" && this._7175.text != "" || this._7182.selected && this._5566.text != "");
               if(Boolean(this._7168.dataProvider) && this._7168.dataProvider.length > this.MAX_SCROLL)
               {
                  this._7168.height = this.MAX_SCROLL_HEIGHT;
               }
               else
               {
                  this._7168.height = NaN;
               }
               if(Boolean(this._7191.dataProvider) && this._7191.dataProvider.length > this.MAX_SCROLL)
               {
                  this._7191.height = this.MAX_SCROLL_HEIGHT;
               }
               else
               {
                  this._7191.height = NaN;
               }
               break;
            case "json_files":
               this._5554.enabled = this._5519.text != "" && (this._7183.selected && this._7203.text != "" && this._7175.text != "" || this._7182.selected && this._5566.text != "");
               break;
            case "zip":
            case "png":
            case "dbswf":
               this._5554.enabled = this._5519.text != "" && (this._7183.selected && this._7203.text != "" && this._7175.text != "" || this._7182.selected && this._5566.text != "");
               break;
            default:
               this._5554.enabled = false;
         }
      }
      
      private function get _7148() : Boolean
      {
         var _loc2_:String = null;
         if(this._7168.dataProvider == null || this._7168.dataProvider.length == 0)
         {
            return false;
         }
         var _loc1_:Array = (this._7168.dataProvider as _1037).source;
         var _loc3_:int = 0;
         var _loc4_:int = int(_loc1_.length);
         while(_loc3_ < _loc4_)
         {
            _loc2_ = _loc1_[_loc3_].url;
            if(_loc2_ != null && _loc2_ != "" && FileUtil.exists(_loc2_))
            {
               return true;
            }
            _loc3_++;
         }
         return false;
      }
      
      private function get _7154() : Boolean
      {
         var _loc2_:String = null;
         if(this._7191.dataProvider == null || this._7191.dataProvider.length == 0)
         {
            return false;
         }
         var _loc1_:Array = (this._7191.dataProvider as _1037).source;
         var _loc3_:int = 0;
         var _loc4_:int = int(_loc1_.length);
         while(_loc3_ < _loc4_)
         {
            _loc2_ = _loc1_[_loc3_].url;
            if(_loc2_ != null && _loc2_ != "" && FileUtil.exists(_loc2_))
            {
               return true;
            }
            _loc3_++;
         }
         return false;
      }
      
      private function _7139(param1:Event) : void
      {
         this._7181();
      }
      
      private function _7142(param1:Event) : void
      {
         var _loc2_:String = null;
         this._7175.text = _124._2392(this._7175.text);
         if(!this._5532)
         {
            _loc2_ = this._7198;
            _loc2_ = FileUtil.escapePath(this._7198);
            this._7203.text = _loc2_ + this._7175.text;
         }
         this._7181();
      }
      
      private function _7144(param1:Event) : void
      {
         _2570();
      }
      
      private function _7167(param1:MouseEvent) : void
      {
         var e:MouseEvent = param1;
         try
         {
            FileUtil.browseForOpen(function(param1:File):void
            {
               if(!param1)
               {
                  return;
               }
               _7175.text = "";
               var _loc2_:String = FileUtil.escapeUrl(param1.nativePath);
               _5519.text = _loc2_;
               _7181();
            },1,_650._5668(this._5489,this._5491),tr("BasePage.SelectProjectPath"));
         }
         catch(e:Error)
         {
         }
      }
      
      private function _7169(param1:MouseEvent) : void
      {
         this._3227._5488();
         this._3227._1567(new CommandNotification(CommandNotification.PLUGIN_SELECT_OPEN));
      }
      
      private function _7158(param1:MouseEvent) : void
      {
         var e:MouseEvent = param1;
         if(!(e.target is IconButton))
         {
            return;
         }
         try
         {
            FileUtil.browseForOpen(function(param1:Array):void
            {
               var _loc3_:File = null;
               var _loc5_:String = null;
               var _loc6_:int = 0;
               var _loc7_:int = 0;
               var _loc8_:Boolean = false;
               var _loc9_:int = 0;
               var _loc10_:int = 0;
               if(!param1 || param1.length == 0)
               {
                  return;
               }
               var _loc2_:Array = [];
               var _loc4_:Array = (_7191.dataProvider as _1037).source;
               _loc6_ = 0;
               _loc7_ = int(_loc4_.length);
               while(_loc6_ < _loc7_)
               {
                  if(_loc4_[_loc6_].url != null && _loc4_[_loc6_].url != "")
                  {
                     _loc2_.push(_loc4_[_loc6_]);
                  }
                  _loc6_++;
               }
               _loc6_ = 0;
               _loc7_ = int(param1.length);
               while(_loc6_ < _loc7_)
               {
                  _loc3_ = param1[_loc6_];
                  if(!_loc3_.isDirectory)
                  {
                     _loc5_ = FileUtil.escapeUrl(_loc3_.nativePath);
                     _loc9_ = 0;
                     _loc10_ = int(_loc2_.length);
                     while(_loc9_ < _loc10_)
                     {
                        if(_loc2_[_loc9_].url == _loc5_)
                        {
                           _loc8_ = true;
                           break;
                        }
                        _loc9_++;
                     }
                     if(!_loc8_)
                     {
                        _loc2_.push({
                           "url":_loc5_,
                           "length":_loc7_
                        });
                        _7146(_loc5_);
                     }
                  }
                  _loc6_++;
               }
               _loc6_ = 0;
               _loc7_ = int(_loc2_.length);
               while(_loc6_ < _loc7_)
               {
                  _loc2_[_loc6_].length = _loc7_;
                  _loc6_++;
               }
               _7191.dataProvider = new _1037(_loc2_);
               _7181();
            },2,_650._4169,tr("BasePage.SelectProjectPath"));
         }
         catch(e:Error)
         {
         }
      }
      
      private function _7162(param1:MouseEvent) : void
      {
         var e:MouseEvent = param1;
         try
         {
            FileUtil.browseForOpen(function(param1:Array):void
            {
               var _loc3_:File = null;
               var _loc4_:String = null;
               if(!param1 || param1.length == 0)
               {
                  return;
               }
               var _loc2_:Array = [];
               var _loc5_:int = 0;
               var _loc6_:int = int(param1.length);
               while(_loc5_ < _loc6_)
               {
                  _loc3_ = param1[_loc5_];
                  if(!_loc3_.isDirectory)
                  {
                     _loc4_ = FileUtil.escapeUrl(_loc3_.nativePath);
                     _loc2_.push({
                        "url":_loc4_,
                        "length":_loc6_
                     });
                     _7146(_loc4_);
                  }
                  _loc5_++;
               }
               _loc5_ = 0;
               _loc6_ = int(_loc2_.length);
               while(_loc5_ < _loc6_)
               {
                  _loc2_[_loc5_].length = _loc6_;
                  _loc5_++;
               }
               _7191.dataProvider = new _1037(_loc2_);
               _7181();
            },2,_650._4169,tr("BasePage.SelectProjectPath"));
         }
         catch(e:Error)
         {
         }
      }
      
      private function _7145(param1:MouseEvent) : void
      {
         var e:MouseEvent = param1;
         if(!(e.target is IconButton))
         {
            return;
         }
         try
         {
            FileUtil.browseForOpen(function(param1:Array):void
            {
               var _loc3_:File = null;
               var _loc5_:String = null;
               var _loc6_:int = 0;
               var _loc7_:int = 0;
               var _loc8_:Boolean = false;
               var _loc9_:int = 0;
               var _loc10_:int = 0;
               if(!param1 || param1.length == 0)
               {
                  return;
               }
               var _loc2_:Array = [];
               var _loc4_:Array = (_7168.dataProvider as _1037).source;
               _loc6_ = 0;
               _loc7_ = int(_loc4_.length);
               while(_loc6_ < _loc7_)
               {
                  if(_loc4_[_loc6_].url != null && _loc4_[_loc6_].url != "")
                  {
                     _loc2_.push(_loc4_[_loc6_]);
                  }
                  _loc6_++;
               }
               _loc6_ = 0;
               _loc7_ = int(param1.length);
               while(_loc6_ < _loc7_)
               {
                  _loc3_ = param1[_loc6_];
                  if(!_loc3_.isDirectory)
                  {
                     _loc5_ = FileUtil.escapeUrl(_loc3_.nativePath);
                     _loc9_ = 0;
                     _loc10_ = int(_loc2_.length);
                     while(_loc9_ < _loc10_)
                     {
                        if(_loc2_[_loc9_].url == _loc5_)
                        {
                           _loc8_ = true;
                           break;
                        }
                        _loc9_++;
                     }
                     if(!_loc8_)
                     {
                        _loc2_.push({
                           "url":_loc5_,
                           "length":_loc7_
                        });
                        _7157(_loc5_);
                     }
                  }
                  _loc6_++;
               }
               _loc6_ = 0;
               _loc7_ = int(_loc2_.length);
               while(_loc6_ < _loc7_)
               {
                  _loc2_[_loc6_].length = _loc7_;
                  _loc6_++;
               }
               _7168.dataProvider = new _1037(_loc2_);
               _7181();
            },2,_650._5664(this._5485),tr("BasePage.SelectProjectPath"));
         }
         catch(e:Error)
         {
         }
      }
      
      private function _7143(param1:MouseEvent) : void
      {
         var e:MouseEvent = param1;
         try
         {
            FileUtil.browseForOpen(function(param1:Array):void
            {
               var _loc3_:File = null;
               var _loc4_:String = null;
               if(!param1 || param1.length == 0)
               {
                  return;
               }
               var _loc2_:Array = [];
               var _loc5_:int = 0;
               var _loc6_:int = int(param1.length);
               while(_loc5_ < _loc6_)
               {
                  _loc3_ = param1[_loc5_];
                  if(!_loc3_.isDirectory)
                  {
                     _loc4_ = FileUtil.escapeUrl(_loc3_.nativePath);
                     _loc2_.push({
                        "url":_loc4_,
                        "length":_loc6_
                     });
                     _7157(_loc4_);
                  }
                  _loc5_++;
               }
               _loc5_ = 0;
               _loc6_ = int(_loc2_.length);
               while(_loc5_ < _loc6_)
               {
                  _loc2_[_loc5_].length = _loc6_;
                  _loc5_++;
               }
               _7168.dataProvider = new _1037(_loc2_);
               _7181();
            },2,_650._5664(this._5485),tr("BasePage.SelectProjectPath"));
         }
         catch(e:Error)
         {
         }
      }
      
      private function _7057(param1:MouseEvent) : void
      {
         var e:MouseEvent = param1;
         try
         {
            FileUtil.browseForOpen(function(param1:File):void
            {
               if(!param1)
               {
                  return;
               }
               var _loc2_:String = FileUtil.escapeUrl(param1.nativePath);
               _7203.text = _loc2_;
               _7181();
            },3);
         }
         catch(e:Error)
         {
         }
      }
      
      private function _7172(param1:MouseEvent) : void
      {
         var e:MouseEvent = param1;
         try
         {
            FileUtil.browseForOpen(function(param1:File):void
            {
               if(!param1)
               {
                  return;
               }
               var _loc2_:String = FileUtil.escapeUrl(param1.nativePath);
               _7185.text = _loc2_;
               _7181();
            },3);
         }
         catch(e:Error)
         {
         }
      }
      
      private function _7153(param1:Event) : void
      {
         var _loc2_:String = null;
         var _loc3_:String = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:String = null;
         var _loc7_:String = null;
         var _loc8_:* = null;
         var _loc9_:String = null;
         var _loc10_:* = null;
         var _loc11_:Boolean = false;
         if(this._5519.text != "")
         {
            this._7200();
            _loc2_ = this._5519.text;
            _loc2_ = FileUtil.escapePath(_loc2_);
            _loc3_ = FileUtil.getFileName(_loc2_);
            _loc4_ = int(_loc3_.indexOf("_ske"));
            if(_loc4_ > 0)
            {
               _loc3_ = _loc3_.substring(0,_loc4_);
            }
            _loc4_ = int(_loc2_.lastIndexOf("/"));
            _loc5_ = int(_loc2_.lastIndexOf("."));
            _loc6_ = _loc2_.substring(_loc5_);
            _loc7_ = _loc2_.substring(0,_loc4_);
            _loc8_ = _loc7_ + "/" + _loc3_ + "_tex" + ".png";
            _loc9_ = _loc7_ + "/" + _loc3_ + "_tex" + _loc6_;
            _loc10_ = _loc7_ + "/texture/";
            _loc11_ = FileUtil.exists(_loc10_);
            this._7194 = FileUtil.getFileName(_loc2_);
            _loc8_ = _loc8_ == "" ? _loc7_ + "/" + _loc3_ + "_tex" + ".png" : _loc8_;
            _loc9_ = _loc9_ == "" ? _loc7_ + "/texture" + _loc6_ : _loc9_;
            if(this._7203.text == "")
            {
               this._7203.text = this._7198;
            }
            this.extension = FileUtil.getExtension(_loc2_);
            if(_loc11_)
            {
               this._7207.selected = true;
               this._7197.selected = false;
            }
            else
            {
               _loc10_ = "";
               this._7197.selected = true;
               this._7207.selected = false;
            }
            switch(this._6231())
            {
               case "json_texture":
                  if(!this._7171(_loc7_,_loc6_,_loc3_))
                  {
                     this._7207.selected = true;
                     this._7197.selected = false;
                  }
                  this._7185.text = _loc10_;
                  break;
               case "json_files":
                  this._7185.text = _loc10_;
            }
            if(this._7175.text == "")
            {
               this._7175.text = this._7194;
               this._7142(null);
            }
         }
         this._7181();
      }
      
      private function _7157(param1:String) : void
      {
         var _loc5_:Array = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc2_:String = FileUtil.getDirectory(param1);
         var _loc3_:String = FileUtil.getFileName(param1);
         var _loc4_:* = _loc2_ + _loc3_ + ".png";
         if(FileUtil.exists(_loc4_))
         {
            _loc5_ = (this._7191.dataProvider as _1037).source;
            _loc6_ = 0;
            _loc7_ = int(_loc5_.length);
            while(_loc6_ < _loc7_)
            {
               if(_loc5_[_loc6_].url == _loc4_)
               {
                  return;
               }
               _loc6_++;
            }
            if(_loc5_.length == 1 && _loc5_[0].url == "")
            {
               _loc5_.length = 0;
            }
            _loc5_.push({"url":_loc4_});
            (this._7191.dataProvider as _1037).refresh();
         }
      }
      
      private function _7146(param1:String) : void
      {
         var _loc4_:* = null;
         var _loc5_:Array = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc2_:String = FileUtil.getDirectory(param1);
         var _loc3_:String = FileUtil.getFileName(param1);
         if(FileUtil.exists(_loc2_ + _loc3_ + ".json"))
         {
            _loc4_ = _loc2_ + _loc3_ + ".json";
         }
         else if(FileUtil.exists(_loc2_ + _loc3_ + ".xml"))
         {
            _loc4_ = _loc2_ + _loc3_ + ".xml";
         }
         else if(FileUtil.exists(_loc2_ + _loc3_ + ".amf3"))
         {
            _loc4_ = _loc2_ + _loc3_ + ".amf3";
         }
         if(_loc4_ != null)
         {
            _loc5_ = (this._7168.dataProvider as _1037).source;
            _loc6_ = 0;
            _loc7_ = int(_loc5_.length);
            while(_loc6_ < _loc7_)
            {
               if(_loc5_[_loc6_].url == _loc4_)
               {
                  return;
               }
               _loc6_++;
            }
            if(_loc5_.length == 1 && _loc5_[0].url == "")
            {
               _loc5_.length = 0;
            }
            _loc5_.push({"url":_loc4_});
            (this._7168.dataProvider as _1037).refresh();
         }
      }
      
      private function _7171(param1:String, param2:String, param3:String) : Boolean
      {
         var _loc7_:* = null;
         var _loc8_:String = null;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         param1 = FileUtil.escapePath(param1);
         var _loc4_:* = param3 + "_tex";
         var _loc5_:Array = [];
         var _loc6_:Array = [];
         if(this._3227._3717)
         {
            if(this._3227._3717._3668.isSupportTextureAtlas())
            {
               _loc7_ = this._7170(param1);
               if(_loc7_ != "")
               {
                  _loc8_ = this._7170(param1,false,FileUtil.getFileName(_loc7_));
               }
            }
            if(Boolean(_loc7_) && Boolean(_loc8_))
            {
               this._7191.dataProvider = new _1037([{
                  "url":_loc7_,
                  "length":1
               }]);
               this._7168.dataProvider = new _1037([{
                  "url":_loc8_,
                  "length":1
               }]);
               return true;
            }
            return false;
         }
         _loc7_ = param1 + _loc4_ + ".png";
         if(FileUtil.exists(_loc7_))
         {
            _loc5_.push({"url":_loc7_});
            _loc8_ = param1 + _loc4_ + param2;
            if(FileUtil.exists(_loc8_))
            {
               _loc6_.push({"url":_loc8_});
            }
         }
         else
         {
            _loc10_ = 0;
            _loc7_ = param1 + _loc4_ + "_" + _loc10_ + ".png";
            while(FileUtil.exists(_loc7_))
            {
               _loc5_.push({"url":_loc7_});
               _loc8_ = param1 + _loc4_ + "_" + _loc10_ + param2;
               if(FileUtil.exists(_loc8_))
               {
                  _loc6_.push({"url":_loc8_});
               }
               _loc10_++;
               _loc7_ = param1 + _loc4_ + "_" + _loc10_ + ".png";
            }
         }
         _loc10_ = 0;
         _loc9_ = int(_loc5_.length);
         while(_loc10_ < _loc9_)
         {
            _loc5_[_loc10_].length = _loc9_;
            _loc10_++;
         }
         _loc10_ = 0;
         _loc9_ = int(_loc6_.length);
         while(_loc10_ < _loc9_)
         {
            _loc6_[_loc10_].length = _loc9_;
            _loc10_++;
         }
         if(_loc5_.length > 0)
         {
            this._7191.dataProvider = new _1037(_loc5_);
         }
         if(_loc6_.length > 0)
         {
            this._7168.dataProvider = new _1037(_loc6_);
         }
         return _loc5_.length > 0;
      }
      
      private function _7170(param1:String, param2:Boolean = true, param3:String = "") : String
      {
         var _loc7_:File = null;
         var _loc8_:String = null;
         var _loc4_:File = File.applicationDirectory.resolvePath(param1);
         var _loc5_:String = "";
         var _loc6_:Array = this._3227._3717._3668.textureAtlasDataFileExtension();
         if(_loc4_.isDirectory)
         {
            for each(_loc7_ in _loc4_.getDirectoryListing())
            {
               if(!_loc7_.isDirectory)
               {
                  _loc5_ = FileUtil.getExtension(_loc7_.name);
                  if(param2)
                  {
                     if(_loc5_ == "png")
                     {
                        return _loc7_.nativePath;
                     }
                  }
                  else if(FileUtil.getFileName(_loc7_.name) == param3 && _loc5_ != "png")
                  {
                     for each(_loc8_ in _loc6_)
                     {
                        if(_loc5_ == _loc8_ || _loc8_ == "*")
                        {
                           return _loc7_.nativePath;
                        }
                     }
                  }
               }
            }
         }
         return "";
      }
      
      public function set extension(param1:String) : void
      {
         param1 = param1.toLowerCase();
         if(this._3261 != param1)
         {
            this._3261 = param1;
            _2570();
         }
         else if(this._3261 == "json")
         {
            _2570();
         }
      }
      
      private function _7141(param1:Event) : void
      {
         this._7181();
      }
      
      private function _7147(param1:Event) : void
      {
         var _loc2_:String = null;
         var _loc3_:String = null;
         var _loc4_:String = null;
         var _loc5_:Boolean = false;
         var _loc6_:Boolean = false;
         var _loc7_:Boolean = false;
         if(this._5495.text == "")
         {
            _loc2_ = FileUtil.getDirectory(this._5511.text);
            _loc3_ = FileUtil.getFileName(this._5511.text);
            _loc4_ = FileUtil.getExtension(this._5519.text);
            if(_loc4_.toLowerCase() == "json" || _loc4_.toLowerCase() == "xml" || _loc4_.toLowerCase() == "amf3")
            {
               if(FileUtil.exists(_loc2_ + _loc3_ + "." + _loc4_))
               {
                  this._5495.text = _loc2_ + _loc3_ + "." + _loc4_;
               }
               switch(_loc4_.toLowerCase())
               {
                  case "json":
                     _loc5_ = true;
                     break;
                  case "xml":
                     _loc6_ = true;
                     break;
                  case "amf3":
                     _loc7_ = true;
               }
            }
            while(this._5495.text == "" && (!_loc5_ || !_loc6_ || !_loc7_))
            {
               if(!_loc5_)
               {
                  if(FileUtil.exists(_loc2_ + _loc3_ + ".json"))
                  {
                     this._5495.text = _loc2_ + _loc3_ + ".json";
                  }
                  _loc5_ = true;
               }
               if(!_loc6_)
               {
                  if(FileUtil.exists(_loc2_ + _loc3_ + ".xml"))
                  {
                     this._5495.text = _loc2_ + _loc3_ + ".xml";
                  }
                  _loc6_ = true;
               }
               if(!_loc7_)
               {
                  if(FileUtil.exists(_loc2_ + _loc3_ + ".amf3"))
                  {
                     this._5495.text = _loc2_ + _loc3_ + ".amf3";
                  }
                  _loc7_ = true;
               }
            }
         }
         this._7181();
      }
      
      private function _7150(param1:Event) : void
      {
         this._7181();
      }
      
      private function _2638(param1:MouseEvent) : void
      {
         switch(this._6231())
         {
            case "json_texture":
               _779.instance._3276(_779.PARAM_V4,_773.TEXTURE);
               _11110.instance._11131._11139(_11105.ImportData_TextureType,_11105.TextureType_TextureAtlas);
               if(this._7191.dataProvider.length == 0)
               {
                  Alert.show(tr("Import.error.missTexture"));
               }
               else if(this._7168.dataProvider.length == 0)
               {
                  Alert.show(tr("Import.error.missTextureConfig"));
               }
               else
               {
                  this._7195(this._7203.text);
               }
               break;
            case "json_files":
               _779.instance._3276(_779.PARAM_V4,_773.IMAGES);
               _11110.instance._11131._11139(_11105.ImportData_TextureType,_11105.TextureType_Images);
               this._7205(this._7203.text,FileUtil.escapePath(this._7185.text));
               break;
            case "zip":
               this._3804(this._7203.text);
               break;
            case "png":
               _779.instance._3276(_779.PARAM_V4,_773.TEXTURE);
               this._7208(this._7203.text);
               break;
            case "dbswf":
               _779.instance._3276(_779.PARAM_V4,_773.TEXTURE);
               this._7199(this._7203.text);
               break;
            default:
               Alert.show(tr("Import.error.nosupport"));
         }
      }
      
      private function _7200() : void
      {
         var str:String = null;
         var sstr:Object = null;
         var data:* = undefined;
         try
         {
            if(FileUtil.exists(this._5519.text))
            {
               str = FileUtil.openAsString(this._5519.text);
               sstr = JSON.parse(str);
               data = this._3227._5506(JSON.stringify(sstr));
               if(data)
               {
                  _2633.text = this._5518;
               }
            }
         }
         catch(e:Error)
         {
            _7197.enabled = true;
         }
      }
      
      private function _7211() : String
      {
         var _loc1_:String = FileUtil.getExtension(this._5519.text);
         switch(_loc1_.toLowerCase())
         {
            case "json":
               return tr("Import.data.json");
            case "xml":
               return tr("Import.data.xml");
            case "amf3":
               return tr("Import.data.amf3");
            case "zip":
               return tr("Import.zipTip");
            case "png":
               return tr("Import.pngTip");
            case "dbswf":
               return tr("Import.dbswfTip");
            default:
               return "";
         }
      }
      
      private function _7195(param1:String) : void
      {
         this._7193.projectName = this._7175.text;
         this._7193.path = param1;
         var _loc2_:_722 = new _722();
         _loc2_._3271 = this._7182.selected;
         _loc2_.libraryPath = FileUtil.escapePath(this._5566.text);
         _loc2_.type = _722.TYPE_TEXTURE;
         _loc2_._3714 = this._5519.text;
         var _loc3_:Array = (this._7168.dataProvider as _1037).source;
         var _loc4_:Array = [];
         var _loc5_:int = 0;
         var _loc6_:int = int(_loc3_.length);
         while(_loc5_ < _loc6_)
         {
            _loc4_.push(_loc3_[_loc5_].url);
            _loc5_++;
         }
         _loc2_._3724 = _loc4_;
         _loc3_ = (this._7191.dataProvider as _1037).source;
         _loc4_ = [];
         _loc5_ = 0;
         _loc6_ = int(_loc3_.length);
         while(_loc5_ < _loc6_)
         {
            _loc4_.push(_loc3_[_loc5_].url);
            _loc5_++;
         }
         _loc2_._3725 = _loc4_;
         var _loc7_:String = this._7203.text;
         _loc7_ = FileUtil.escapePath(_loc7_);
         _loc2_.outputPath = _loc7_;
         this._7193._3283(_loc2_);
         close();
      }
      
      private function _3804(param1:String) : void
      {
         this._7193.projectName = this._7175.text;
         this._7193.path = param1;
         var _loc2_:_722 = new _722();
         _loc2_._3271 = this._7182.selected;
         _loc2_.libraryPath = FileUtil.escapePath(this._5566.text);
         _loc2_.type = _722.TYPE_ZIP;
         _loc2_._3736 = this._5519.text;
         var _loc3_:String = this._7203.text;
         _loc3_ = FileUtil.escapePath(_loc3_);
         _loc2_.outputPath = _loc3_;
         this._7193._3283(_loc2_);
         close();
      }
      
      private function _7208(param1:String) : void
      {
         this._7193.projectName = this._7175.text;
         this._7193.path = param1;
         var _loc2_:_722 = new _722();
         _loc2_._3271 = this._7182.selected;
         _loc2_.libraryPath = FileUtil.escapePath(this._5566.text);
         _loc2_.type = _722.TYPE_PNG;
         _loc2_._5500 = this._5519.text;
         var _loc3_:String = this._7203.text;
         _loc3_ = FileUtil.escapePath(_loc3_);
         _loc2_.outputPath = _loc3_;
         this._7193._3283(_loc2_);
         close();
      }
      
      private function _7199(param1:String) : void
      {
         this._7193.projectName = this._7175.text;
         this._7193.path = param1;
         var _loc2_:_722 = new _722();
         _loc2_._3271 = this._7182.selected;
         _loc2_.libraryPath = FileUtil.escapePath(this._5566.text);
         _loc2_.type = _722.TYPE_DBSWF;
         _loc2_._5500 = this._5519.text;
         var _loc3_:String = this._7203.text;
         _loc3_ = FileUtil.escapePath(_loc3_);
         _loc2_.outputPath = _loc3_;
         this._7193._3283(_loc2_);
         close();
      }
      
      private function _7205(param1:String, param2:String) : void
      {
         this._7193.projectName = this._7175.text;
         this._7193.path = param1;
         var _loc3_:_722 = new _722();
         _loc3_._3271 = this._7182.selected;
         _loc3_.libraryPath = FileUtil.escapePath(this._5566.text);
         _loc3_.type = _722.TYPE_FILES;
         _loc3_._3714 = this._5519.text;
         var _loc4_:String = this._7203.text;
         _loc4_ = FileUtil.escapePath(_loc4_);
         _loc3_.outputPath = _loc4_;
         _loc3_._5512 = param2;
         param2 = FileUtil.escapePath(param2);
         this._7193._3283(_loc3_);
         close();
      }
      
      private function get _3227() : _627
      {
         return _1407.getInstance(_627) as _627;
      }
   }
}

