package _1011
{
   import _1038._1037;
   import _1045.Button;
   import _1045.DropDownList;
   import _1045.Group;
   import _1045.Label;
   import _1045._1105;
   import _11111._11110;
   import _127._162;
   import _127._171;
   import _1374.TextInput;
   import _1404._1407;
   import _477.ExportEgretController;
   import _51._50;
   import _721._720;
   import _73.SymbolType;
   import _97._125;
   import _997._996;
   import egret.utils.FileUtil;
   import egret.utils.tr;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.filesystem.File;
   
   public class ExportEgretWindow extends _171
   {
      public static const _14765:int = 85;
      
      private var _7061:_720;
      
      private var _7058:TextInput;
      
      public var _5554:Button;
      
      public var _5555:Button;
      
      public var _7088:_162;
      
      public var _7079:DropDownList;
      
      private var _7078:_1037;
      
      public var _7076:DropDownList;
      
      private var _7075:_1037;
      
      private var _7085:_1105;
      
      private var _7068:Label;
      
      private var _7084:Label;
      
      public var _7065:Button;
      
      public var _7090:Button;
      
      public var _7089:Button;
      
      public var _7083:Label;
      
      public var _7082:Group;
      
      private var _7070:String;
      
      private var _7074:String;
      
      private var _7080:String;
      
      private var showAll:String;
      
      private var noScale:String;
      
      private var noBorder:String;
      
      private var exactFit:String;
      
      private var fixedWidth:String;
      
      private var fixedHeight:String;
      
      private var _7086:int;
      
      private var _7081:int;
      
      private var _7077:Vector.<BitmapData>;
      
      public function ExportEgretWindow(param1:_720)
      {
         this._7088 = new _162();
         this._7079 = new DropDownList();
         this._7078 = new _1037();
         this._7076 = new DropDownList();
         this._7075 = new _1037();
         this._7065 = new Button();
         this._7090 = new Button();
         this._7089 = new Button();
         this._7083 = new Label();
         this._7082 = _125._2397();
         this._7070 = tr("ExportEgret.ScreenHorizonta");
         this._7074 = tr("ExportEgret.ScreenVertical");
         this._7080 = tr("ExportEgret.ScreenAuto");
         this.showAll = tr("ExportEgret.ScreenShowAll");
         this.noScale = tr("ExportEgret.ScreenNoScale");
         this.noBorder = tr("ExportEgret.ScreenNoBorder");
         this.exactFit = tr("ExportEgret.ScreenExactFit");
         this.fixedWidth = tr("ExportEgret.ScreenFixedWidth");
         this.fixedHeight = tr("ExportEgret.ScreenFixedHeight");
         super();
         this.minWidth = 580;
         this.minHeight = 460;
         this.title = tr("ExportEgretProjectWindow.Title");
         this.width = NaN;
         this._7061 = param1;
      }
      
      override protected function _2438() : void
      {
         super._2438();
         var _loc1_:Group = _125._2414();
         _loc1_.percentWidth = 100;
         _2512.percentWidth = 100;
         _2512.addElement(_loc1_);
         var _loc2_:Label = new Label();
         _loc2_.width = _14765;
         _loc2_.text = tr("Export.outputPath");
         this._7058 = new TextInput();
         this._7058.percentWidth = 100;
         this._7058.text = this._7061.ouputPath;
         var _loc3_:Button = _125._2405();
         _loc1_.addElement(_loc2_);
         _loc1_.addElement(this._7058);
         _loc1_.addElement(_loc3_);
         var _loc4_:Group;
         (_loc4_ = _125._2403()).percentWidth = 100;
         _2512.addElement(_loc4_);
         var _loc5_:int = 230;
         var _loc6_:Group;
         (_loc6_ = _125._2413(12)).height = _loc5_;
         _loc6_.percentWidth = 50;
         var _loc7_:Group = _125._2414();
         var _loc8_:Label;
         (_loc8_ = new Label()).text = tr("ExportEgret.maxFps");
         this._7088.txt.restrict = "0-9";
         this._7088.txt.width = 60;
         this._7088.txt.setStyle("textAlign","left");
         this._7088.maxValue = 60;
         this._7088.minValue = 2;
         this._7088.txt.text = this._7061.dragonBonesVO.frameRate.toString();
         var _loc9_:Label;
         (_loc9_ = new Label()).text = "fps";
         _loc7_.addElement(_loc8_);
         _loc7_.addElement(this._7088);
         _loc7_.addElement(_loc9_);
         _loc6_.addElement(_loc7_);
         _loc7_ = _125._2414();
         (_loc8_ = new Label()).text = tr("ExportEgret.screenDirection");
         this._7079 = new DropDownList();
         this._7078.source = [this._7070,this._7074,this._7080];
         this._7079.dataProvider = this._7078;
         this._7079._6146 = this._7063;
         this._7079.addEventListener(Event.CHANGE,this._7067);
         this._7079._3854 = false;
         this._7079.width = 80;
         this._7079._2484 = this._7070;
         _loc7_.addElement(_loc8_);
         _loc7_.addElement(this._7079);
         _loc6_.addElement(_loc7_);
         _loc7_ = _125._2414();
         (_loc8_ = new Label()).text = tr("ExportEgret.screenMate");
         this._7076 = new DropDownList();
         this._7075.source = [this.showAll,this.noScale,this.noBorder,this.exactFit,this.fixedWidth,this.fixedHeight];
         this._7076.dataProvider = this._7075;
         this._7076._6146 = this._7064;
         this._7076.addEventListener(Event.CHANGE,this._7069);
         this._7076._3854 = false;
         this._7076.width = 150;
         this._7076._2484 = this.showAll;
         _loc7_.addElement(_loc8_);
         _loc7_.addElement(this._7076);
         _loc6_.addElement(_loc7_);
         var _loc10_:_996;
         (_loc10_ = new _996()).percentHeight = 100;
         _loc4_.addElement(_loc6_);
         _loc4_.addElement(_loc10_);
         var _loc11_:Group;
         (_loc11_ = _125._2413()).percentWidth = 100;
         _loc11_.height = _loc5_;
         this._7065 = new Button();
         this._7065.label = tr("ExportEgret.texture.setting");
         this._7065.toolTip = tr("ExportEgret.setting.tooltip");
         _loc11_.addElement(this._7065);
         var _loc12_:Group = _125._2414();
         var _loc13_:Label;
         (_loc13_ = new Label()).text = tr("ExportEgret.Image.Preview");
         this._7068 = new Label();
         this._7085 = new _1105();
         _loc12_.addElement(_loc13_);
         _loc12_.addElement(this._7068);
         _loc11_.addElement(_loc12_);
         _loc11_.addElement(this._7085);
         this._7082.percentWidth = 100;
         this._7089.label = tr("Export.setting.nextPage");
         this._7090.label = tr("Export.setting.prevPage");
         this._7082.addElement(this._7090);
         this._7082.addElement(this._7083);
         this._7082.addElement(this._7089);
         _loc11_.addElement(this._7082);
         _loc4_.addElement(_loc11_);
         this._5554 = _125._2399();
         this._5555 = _125._2406();
         _2632.addElement(this._5554);
         _2632.addElement(this._5555);
         addElement(_2632);
         _2632.bottom = 20;
         _2632.right = 20;
         this._5555.addEventListener(MouseEvent.CLICK,_2517);
         this._5554.addEventListener(MouseEvent.CLICK,this._7060);
         _loc3_.addEventListener(MouseEvent.CLICK,this._7057);
         this._7065.addEventListener(MouseEvent.CLICK,this._7062);
         this._7089.addEventListener(MouseEvent.CLICK,this._7072);
         this._7090.addEventListener(MouseEvent.CLICK,this._7071);
         this._7058.addEventListener(Event.CHANGE,this._7056);
         this.refresh();
      }
      
      private function _7063(param1:Object) : String
      {
         return param1 as String;
      }
      
      private function _7067(param1:Event) : void
      {
         var _loc2_:String = this._7079._2484 as String;
      }
      
      private function _7064(param1:Object) : String
      {
         return param1 as String;
      }
      
      private function _7069(param1:Event) : void
      {
         var _loc2_:String = this._7076._2484 as String;
      }
      
      private function _7062(param1:MouseEvent) : void
      {
         this._3228._3631();
      }
      
      private function _7056(param1:Event) : void
      {
         this.refresh();
      }
      
      private function _7071(param1:MouseEvent) : void
      {
         --this._7086;
         this._7087(this._7086);
      }
      
      private function _7072(param1:MouseEvent) : void
      {
         ++this._7086;
         this._7087(this._7086);
      }
      
      public function _3664(param1:Vector.<BitmapData>) : void
      {
         if(param1 == null || param1.length == 0)
         {
            this._7082.visible = false;
            this._7085.source = null;
            this._7068.text = "";
            return;
         }
         this._7081 = param1.length;
         this._7086 = 0;
         this._7077 = param1;
         if(this._7081 > 0)
         {
            this._7087(this._7086);
         }
      }
      
      private function _7087(param1:int) : void
      {
         if(this._7081 > 1)
         {
            this._7082.visible = true;
            this._7083.text = tr("Export.setting.page",param1 + 1,this._7081);
            this._7090.enabled = param1 > 0;
            this._7089.enabled = param1 < this._7081 - 1;
         }
         else
         {
            this._7082.visible = false;
         }
         this._7066(this._7077[param1]);
      }
      
      private function _7066(param1:BitmapData) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         if(param1 == null)
         {
            this._7085.source = null;
            this._7068.text = "";
            return;
         }
         var _loc2_:int = 220;
         var _loc3_:int = 200;
         if(this._7085)
         {
            _loc5_ = _loc2_ / param1.width;
            _loc6_ = _loc3_ / param1.height;
         }
         _loc4_ = _loc5_ < _loc6_ ? _loc5_ : _loc6_;
         if(_loc4_ > 1)
         {
            _loc4_ = 1;
         }
         this._7085.source = param1;
         this._7085.scaleX = this._7085.scaleY = _loc4_;
         this._7068.text = param1.width + " x " + param1.height;
      }
      
      private function _7060(param1:MouseEvent) : void
      {
         this._7061.ouputPath = this._7058.text;
         var _loc2_:Object = new Object();
         _loc2_._3238 = this._7061;
         _loc2_.fps = this._7088.txt.text;
         _loc2_._3241 = this._3241(this._7079._2484 as String);
         _loc2_.screenMate = this.screenMate(this._7076._2484 as String);
         this._3228._3667(_loc2_);
      }
      
      private function _7057(param1:MouseEvent) : void
      {
         var e:MouseEvent = param1;
         FileUtil.browseForOpen(function(param1:File):void
         {
            if(!param1)
            {
               return;
            }
            var _loc2_:String = FileUtil.escapeUrl(param1.nativePath);
            _7058.text = _loc2_;
            refresh();
         },3);
      }
      
      public function refresh() : void
      {
         var proFile:File = null;
         var _3845:Boolean = false;
         var _2126:Vector.<_50> = this._7061.dragonBonesVO._2126;
         var i:int = 0;
         i = 0;
         while(i < _2126.length)
         {
            if(_2126[i]._1811 == SymbolType.STAGE)
            {
               _3845 = true;
            }
            i++;
         }
         if(_3845)
         {
         }
         this._5554.enabled = false;
         if(this._7058.text != "")
         {
            try
            {
               proFile = new File(this._7058.text);
               if(proFile)
               {
                  this._5554.enabled = true;
               }
            }
            catch(error:Error)
            {
               _11110.instance._11204._11132("ExportEgretWindow::refresh",error);
            }
         }
      }
      
      public function _3659() : void
      {
      }
      
      private function screenMate(param1:String) : String
      {
         switch(param1)
         {
            case this.showAll:
               return "showAll";
            case this.noScale:
               return "noScale";
            case this.noBorder:
               return "noBorder";
            case this.exactFit:
               return "exactFit";
            case this.fixedWidth:
               return "fixedWidth";
            case this.fixedHeight:
               return "fixedHeight";
            default:
               return "showAll";
         }
      }
      
      private function _3241(param1:String) : String
      {
         switch(param1)
         {
            case this._7070:
               return "landscape";
            case this._7074:
               return "portrait";
            case this._7080:
               return "auto";
            default:
               return "auto";
         }
      }
      
      public function _3662(param1:Number) : void
      {
         this._7084.text = tr("Export.progress",int(param1 * 100));
      }
      
      private function get _3228() : ExportEgretController
      {
         return _1407.getInstance(ExportEgretController) as ExportEgretController;
      }
   }
}

