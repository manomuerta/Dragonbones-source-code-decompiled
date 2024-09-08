package _1009
{
   import _1038._1037;
   import _1045.Button;
   import _1045.DropDownList;
   import _1045.Group;
   import _1045.Label;
   import _1045._1082;
   import _127._128;
   import _127._159;
   import _127._171;
   import _1374.IconButton;
   import _1374.TextInput;
   import _1374._1391;
   import _790._797;
   import _804._806;
   import _97._101;
   import _97._124;
   import _97._125;
   import egret.utils.FileUtil;
   import egret.utils.tr;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.filesystem.File;
   
   public class _1026 extends _171
   {
      public var _7176:Label;
      
      public var _7246:Label;
      
      public var _5535:TextInput;
      
      public var _5534:TextInput;
      
      public var _5556:Button;
      
      public var _5544:_128;
      
      private var _7257:TextInput;
      
      private var _7255:TextInput;
      
      public var _7260:IconButton;
      
      public var _7262:IconButton;
      
      public var _7259:IconButton;
      
      public var _7258:_1391;
      
      public var _7247:DropDownList;
      
      public var _7256:_128;
      
      public var _5554:Button;
      
      public var _5555:Button;
      
      public var _5558:Button;
      
      private var _7007:_1082;
      
      private var _7261:Array;
      
      private var _7254:Array;
      
      private var _7245:_1037;
      
      private var _7250:_1037;
      
      private var _file:File;
      
      private var _newProjectPath:String;
      
      public function _1026(param1:String)
      {
         this._7261 = [["android_0","iphone_4","iphone_5","iphone_6","iphone_6+","custom"],["ipad_1","ipad_4","table","custom"],["custom"]];
         this._7254 = [[[360,640],[320,480],[320,568],[375,667],[414,736],[0,0]],[[768,1024],[1536,2048],[800,1280],[0,0]],[[0,0]]];
         super();
         this.title = tr("NewComicWindow.title");
         this._newProjectPath = param1;
      }
      
      override protected function _5823(param1:Number, param2:Number) : void
      {
         super._5823(param1,param2);
         this._7007.width = param1 - 50;
      }
      
      override protected function _2438() : void
      {
         var _loc1_:Group = null;
         var _loc2_:Group = null;
         var _loc4_:Group = null;
         var _loc5_:Group = null;
         super._2438();
         this._7241();
         this._7242();
         this._7007 = new _1082();
         this._7007._2529 = 0.3;
         this._7007.width = this.width - 50;
         this._7007.height = 1;
         _loc1_ = _125._2414();
         _loc2_ = _125._2414();
         var _loc3_:Group = _125._2414();
         _loc4_ = _125._2414();
         _loc5_ = _125._2403();
         var _loc6_:Label;
         (_loc6_ = new Label()).text = tr("NewComicWindow.size");
         _loc5_.addElement(_loc6_);
         var _loc7_:Group;
         (_loc7_ = _125._2413()).percentWidth = 100;
         _loc7_.addElement(_loc1_);
         _loc7_.addElement(_loc2_);
         _loc7_.addElement(_loc3_);
         _loc7_.addElement(_loc4_);
         _loc5_.addElement(_loc7_);
         _2512.percentWidth = 100;
         _2512.addElement(_loc5_);
         this._7258 = new _1391();
         this._7250 = new _1037([{
            "icon":"/assets/button/mobile.png",
            "data":tr("NewComicWindow.phone"),
            "enabled":true
         },{
            "icon":"/assets/button/tablet.png",
            "data":tr("NewComicWindow.pad"),
            "enabled":true
         },{
            "icon":"/assets/button/custom.png",
            "data":tr("NewComicWindow.custom"),
            "enabled":true
         }]);
         this._7258.skinName = _806;
         this._7258.itemRenderer = _797;
         this._7258.dataProvider = this._7250;
         this._7258.selectedIndex = 0;
         _loc1_.addElement(this._7258);
         var _loc8_:Label;
         (_loc8_ = new Label()).text = tr("NewComicWindow.deviceTitle");
         this._7247 = new DropDownList();
         this._7247.width = 210;
         this._7247._6146 = this._7251;
         _loc2_.addElement(this._7247);
         var _loc9_:Label;
         (_loc9_ = new Label()).text = tr("NewComicWindow.direct");
         this._7256 = new _128();
         this._7256.label = tr("NewComicWindow.horizon");
         _loc2_.addElement(this._7256);
         var _loc10_:Label;
         (_loc10_ = new Label()).text = tr("NewComicWindow.stageSize");
         var _loc11_:Label;
         (_loc11_ = new Label()).text = tr("NewComicWindow.width");
         this._7257 = new TextInput();
         this._7257.restrict = "0-9";
         this._7257.maxChars = 4;
         this._7257.width = 40;
         var _loc12_:Label;
         (_loc12_ = new Label()).text = tr("NewComicWindow.height");
         this._7255 = new TextInput();
         this._7255.restrict = "0-9";
         this._7255.maxChars = 4;
         this._7255.width = 40;
         var _loc13_:Label;
         (_loc13_ = new Label()).width = 20;
         _loc4_.addElement(_loc13_);
         _loc4_.addElement(_loc11_);
         _loc4_.addElement(this._7257);
         var _loc14_:Label = new Label();
         _loc4_.addElement(_loc14_);
         _loc4_.addElement(_loc12_);
         _loc4_.addElement(this._7255);
         this._7245 = new _1037(this._7261[0]);
         this._7247.dataProvider = this._7245;
         this._7247.selectedIndex = 0;
         this._7244();
         this._5544.addEventListener(Event.CHANGE,this._5536);
         this._5556.addEventListener(MouseEvent.CLICK,this._5541);
         this._5534.addEventListener(Event.CHANGE,this._5525);
         this._7258.addEventListener(Event.CHANGE,this._7243);
         this._7247.addEventListener(Event.CHANGE,this._7248);
         this._7257.addEventListener(Event.CHANGE,this._7252);
         this._7255.addEventListener(Event.CHANGE,this._7252);
         this._7256.addEventListener(Event.CHANGE,this._7249);
         this._5535.text = this._5543();
         this._5540();
         this._7248(null);
      }
      
      private function _7251(param1:String) : String
      {
         return tr(param1);
      }
      
      private function _7249(param1:Event) : void
      {
         var _loc4_:String = null;
         var _loc2_:int = this._7258.selectedIndex;
         var _loc3_:int = this._7247.selectedIndex;
         if(this._7254[_loc2_][_loc3_][0] > 0 && this._7254[_loc2_][_loc3_][1] > 0)
         {
            if(this._7256.selected)
            {
               this._7257.text = String(this._7254[_loc2_][_loc3_][1]);
               this._7255.text = String(this._7254[_loc2_][_loc3_][0]);
            }
            else
            {
               this._7257.text = String(this._7254[_loc2_][_loc3_][0]);
               this._7255.text = String(this._7254[_loc2_][_loc3_][1]);
            }
         }
         else
         {
            _loc4_ = this._7257.text;
            this._7257.text = this._7255.text;
            this._7255.text = _loc4_;
         }
      }
      
      private function _7252(param1:Event) : void
      {
         this._5538();
      }
      
      private function _7248(param1:Event) : void
      {
         var _loc2_:int = this._7258.selectedIndex;
         var _loc3_:int = this._7247.selectedIndex;
         if(this._7254[_loc2_][_loc3_][0] > 0 && this._7254[_loc2_][_loc3_][1] > 0)
         {
            this._7257.text = String(this._7254[_loc2_][_loc3_][0]);
            this._7255.text = String(this._7254[_loc2_][_loc3_][1]);
            this._7257.enabled = false;
            this._7255.enabled = false;
         }
         else
         {
            this._7257.text = "600";
            this._7255.text = "800";
            this._7257.enabled = true;
            this._7255.enabled = true;
         }
      }
      
      private function _7243(param1:Event) : void
      {
         var _loc2_:int = this._7258.selectedIndex;
         this._7245.source = this._7261[_loc2_];
         this._7247.dataProvider = this._7245;
         this._7247.selectedIndex = 0;
         this._7248(null);
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
      
      private function _7253(param1:Event) : void
      {
         this._5535.text = _124._2392(this._5535.text);
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
         this._5555.addEventListener(MouseEvent.CLICK,_2517);
      }
      
      public function _5551() : Object
      {
         var _loc1_:Object = {};
         _loc1_.path = new File(this._5534.text).resolvePath(this._5535.text + _101.PROJECT_SUFFIX).nativePath;
         var _loc2_:int = this._7258.selectedIndex;
         var _loc3_:int = this._7247.selectedIndex;
         _loc1_.width = int(this._7257.text);
         _loc1_.height = int(this._7255.text);
         return _loc1_;
      }
      
      private function _5543() : String
      {
         var _loc2_:int = 0;
         var _loc1_:String = "NewComic";
         this._file = new File(this._newProjectPath);
         if(this._file.resolvePath(_loc1_).resolvePath(_loc1_ + _101.PROJECT_SUFFIX).exists)
         {
            _loc2_ = 1;
            while(this._file.resolvePath(_loc1_ + _loc2_).resolvePath(_loc1_ + _loc2_ + _101.PROJECT_SUFFIX).exists)
            {
               _loc2_++;
            }
            _loc1_ += _loc2_;
         }
         return _loc1_;
      }
      
      private function _5540() : void
      {
         this._5534.text = this._file.resolvePath(this._5535.text).nativePath;
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
      
      private function _5541(param1:MouseEvent) : void
      {
         FileUtil.browseForOpen(this._5531,3);
      }
      
      private function _5531(param1:File) : void
      {
         if(!param1)
         {
            return;
         }
         this._5534.text = FileUtil.escapeUrl(param1.nativePath);
         this._5538();
      }
      
      private function _5538() : void
      {
         this._5554.enabled = this._5535.text != "" && this._5534.text != "" && Number(this._7257.text) > 0 && Number(this._7255.text) > 0;
      }
      
      private function _5525(param1:Event) : void
      {
         this._5538();
      }
   }
}

