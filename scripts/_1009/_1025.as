package _1009
{
   import _1038._1037;
   import _1045.Button;
   import _1045.DropDownList;
   import _1045.Group;
   import _1045.Label;
   import _1045.TextArea;
   import _127._128;
   import _127._171;
   import _1374.IconButton;
   import _1374.TextInput;
   import _1529._1528;
   import _1529._1530;
   import _648._650;
   import _834._840;
   import _97._125;
   import egret.utils.FileUtil;
   import egret.utils.SystemInfo;
   import egret.utils.tr;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.filesystem.File;
   import flash.text.TextFormatAlign;
   
   public class _1025 extends _171
   {
      private static const MAX_SIZE:int = 5000000;
      
      private var _7212:Label;
      
      private var _7215:IconButton;
      
      private var _7214:Button;
      
      private var _7218:DropDownList;
      
      private var _7213:TextArea;
      
      public var _5521:_128;
      
      public var _5522:Label;
      
      public var callback:Function;
      
      private var _7221:String;
      
      private var _7225:TextInput;
      
      private var _7227:TextInput;
      
      private var _7222:TextInput;
      
      private var _7224:TextInput;
      
      private var _7223:TextInput;
      
      private var _7226:Button;
      
      public function _1025()
      {
         super();
         this.width = this.minWidth = 800;
         this.height = this.minHeight = 470;
         if(!SystemInfo.isMacOS && _1528.language == _1530.zh_CN)
         {
            this.setStyle("fontFamily","微软雅黑");
         }
         title = tr("IssueReport.Title");
      }
      
      override protected function _2438() : void
      {
         var _loc2_:Group = null;
         var _loc3_:Group = null;
         var _loc4_:Group = null;
         var _loc5_:Label = null;
         var _loc11_:Group = null;
         super._2438();
         closeButton.visible = true;
         var _loc1_:Label = _125._2400();
         _loc1_.textAlign = TextFormatAlign.CENTER;
         _loc1_.percentWidth = 100;
         _loc1_.text = tr("IssueReport.intro");
         _2512.addElement(_loc1_);
         _2512.addElement(_125._2417());
         _loc2_ = _125._2413(16);
         _loc3_ = _125._2413(16);
         _loc4_ = _125._2414();
         (_loc5_ = _125._2407()).text = tr("IssueReport.type");
         this._7218 = new DropDownList();
         this._7218.width = 200;
         var _loc6_:Array = [tr("IssueReport.type.quest"),tr("IssueReport.type.bug"),tr("IssueReport.type.suggest")];
         var _loc7_:_1037 = new _1037(_loc6_);
         this._7218.dataProvider = _loc7_;
         this._7218.selectedIndex = 0;
         _loc4_.addElement(_loc5_);
         _loc4_.addElement(this._7218);
         var _loc8_:Group;
         (_loc8_ = _125._2403()).percentWidth = 100;
         _loc8_.percentHeight = 100;
         var _loc9_:Label;
         (_loc9_ = _125._2407()).text = tr("IssueReport.desc");
         this._7213 = new TextArea();
         this._7213.addEventListener(Event.CHANGE,this._7219);
         this._7213.skinName = _840;
         this._7213.percentWidth = 100;
         this._7213.percentHeight = 100;
         _loc8_.addElement(_loc9_);
         _loc8_.addElement(this._7213);
         var _loc10_:Group;
         (_loc10_ = _125._2413(2)).percentWidth = 100;
         this._5521 = new _128();
         this._5521.label = tr("IssueReport.upload");
         this._5521.selected = true;
         this._5522 = new Label();
         this._5522.text = tr("IssueReport.upload.intro");
         this._5522.percentWidth = 100;
         this._5522.alpha = 0.5;
         _loc10_.addElement(this._5521);
         _loc10_.addElement(this._5522);
         _loc11_ = _125._2413(10);
         var _loc12_:Group = _125._2414();
         this._7214 = new Button();
         this._7214.label = tr("IssueReport.attachment");
         this._7214.setStyle("fontSize",13);
         this._7214.addEventListener(MouseEvent.CLICK,this._7217);
         var _loc13_:Label;
         (_loc13_ = new Label()).alpha = 0.5;
         _loc13_.text = tr("IssueReport.attachment.tip");
         _loc12_.addElement(this._7214);
         _loc12_.addElement(_loc13_);
         var _loc14_:Group = _125._2414();
         this._7212 = _125._2407();
         this._7212.text = "";
         this._7215 = new IconButton();
         this._7215.icon = "assets/timeline/timeline_eye2.png";
         this._7215.addEventListener(MouseEvent.CLICK,this._7216);
         _loc14_.addElement(this._7212);
         _loc14_.addElement(this._7215);
         _loc11_.addElement(_loc12_);
         _loc11_.addElement(_loc14_);
         this._7212.visible = false;
         this._7215.visible = false;
         _loc2_.addElement(_loc4_);
         _loc2_.addElement(_loc8_);
         _loc2_.addElement(_loc10_);
         _loc2_.addElement(_loc11_);
         var _loc15_:Label;
         (_loc15_ = _125._2407()).percentWidth = 100;
         _loc15_.textAlign = TextFormatAlign.CENTER;
         _loc15_.text = tr("IssueReport.contacts");
         var _loc16_:Group;
         (_loc16_ = _125._2414()).percentWidth = 100;
         var _loc17_:Label;
         (_loc17_ = _125._2407()).text = tr("IssueReport.name");
         this._7225 = new TextInput();
         this._7225.percentWidth = 100;
         this._7225.maxChars = 20;
         _loc16_.addElement(_loc17_);
         _loc16_.addElement(this._7225);
         var _loc18_:Group;
         (_loc18_ = _125._2414()).percentWidth = 100;
         var _loc19_:Label;
         (_loc19_ = _125._2407()).text = tr("IssueReport.phone");
         this._7223 = new TextInput();
         this._7223.restrict = "0-9";
         this._7223.percentWidth = 100;
         this._7223.maxChars = 20;
         _loc18_.addElement(_loc19_);
         _loc18_.addElement(this._7223);
         var _loc20_:Group;
         (_loc20_ = _125._2414()).percentWidth = 100;
         var _loc21_:Label;
         (_loc21_ = _125._2407()).text = tr("IssueReport.qq");
         this._7227 = new TextInput();
         this._7227.percentWidth = 100;
         this._7227.maxChars = 20;
         _loc20_.addElement(_loc21_);
         _loc20_.addElement(this._7227);
         var _loc22_:Group;
         (_loc22_ = _125._2414()).percentWidth = 100;
         var _loc23_:Label;
         (_loc23_ = _125._2407()).text = tr("IssueReport.weixin");
         this._7222 = new TextInput();
         this._7222.percentWidth = 100;
         this._7222.maxChars = 20;
         _loc22_.addElement(_loc23_);
         _loc22_.addElement(this._7222);
         var _loc24_:Group;
         (_loc24_ = _125._2414()).percentWidth = 100;
         var _loc25_:Label;
         (_loc25_ = _125._2407()).text = tr("IssueReport.email");
         this._7224 = new TextInput();
         this._7224.percentWidth = 100;
         this._7224.maxChars = 50;
         _loc24_.addElement(_loc25_);
         _loc24_.addElement(this._7224);
         var _loc26_:Label;
         (_loc26_ = new Label()).htmlText = tr("IssueReport.contact");
         _loc26_.percentWidth = 100;
         _loc26_.alpha = 0.5;
         this._7226 = _125._2408(tr("IssueReport.send"));
         this._7226.enabled = false;
         this._7226.percentWidth = 28;
         this._7226.addEventListener(MouseEvent.CLICK,this.onSend);
         this._7226.bottom = 20;
         this._7226.right = 16;
         _loc3_.addElement(_loc15_);
         _loc3_.addElement(_loc16_);
         _loc3_.addElement(_loc18_);
         _loc3_.addElement(_loc20_);
         _loc3_.addElement(_loc22_);
         _loc3_.addElement(_loc24_);
         _loc3_.addElement(_loc26_);
         addElement(this._7226);
         var _loc27_:Group;
         (_loc27_ = _125._2403(30)).percentWidth = 100;
         _loc2_.percentWidth = 70;
         _loc3_.percentWidth = 30;
         _loc27_.addElement(_loc2_);
         _loc27_.addElement(_loc3_);
         _2512.percentWidth = 100;
         _2512.addElement(_loc27_);
      }
      
      private function _7219(param1:Event) : void
      {
         this._7220();
      }
      
      private function _7220() : void
      {
         this._7226.enabled = this._7213.text != "";
      }
      
      private function onSend(param1:MouseEvent) : void
      {
         var _loc2_:Object = null;
         if(this.callback != null)
         {
            _loc2_ = {};
            _loc2_.type = this._7218.selectedIndex;
            _loc2_.desc = this._7213.text;
            _loc2_.upload = this._5521.visible && this._5521.selected;
            _loc2_.attachment = this._7221;
            _loc2_.name = this._7225.text;
            _loc2_.phone = this._7223.text;
            _loc2_.qq = this._7227.text;
            _loc2_.weixin = this._7222.text;
            _loc2_.email = this._7224.text;
            this.callback(_loc2_);
         }
      }
      
      private function _7216(param1:MouseEvent) : void
      {
         this._7212.visible = false;
         this._7215.visible = false;
         this._7221 = null;
      }
      
      private function _7217(param1:MouseEvent) : void
      {
         var e:MouseEvent = param1;
         FileUtil.browseForOpen(function(param1:File):void
         {
            if(!param1)
            {
               return;
            }
            if(param1.size > MAX_SIZE)
            {
               _7212.visible = true;
               _7212.text = tr("IssueReport.error.fileSize");
               _7221 = null;
               _7215.visible = false;
            }
            else
            {
               _7212.visible = true;
               _7212.text = param1.name;
               _7221 = param1.nativePath;
               _7215.visible = true;
            }
         },1,_650._5668());
      }
      
      public function set sending(param1:Boolean) : void
      {
         _2512.enabled = param1;
         this._7226.label = param1 ? tr("IssueReport.send") : tr("IssueReport.sending");
         this._7226.enabled = this._7213.text != "" && param1;
      }
   }
}

