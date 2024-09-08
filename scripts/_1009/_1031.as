package _1009
{
   import _1045.Button;
   import _1045.Group;
   import _1045.Label;
   import _1045.TextArea;
   import _1045._1105;
   import _127._128;
   import _127._171;
   import _1374.IconButton;
   import _1374.TextInput;
   import _1404._1407;
   import _1529._1528;
   import _1529._1530;
   import _648._12463;
   import _648._650;
   import _834._12479;
   import _834._840;
   import _97._106;
   import _97._125;
   import egret.utils.FileUtil;
   import egret.utils.SystemInfo;
   import egret.utils.tr;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Loader;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.filesystem.File;
   import flash.geom.Matrix;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   import flash.text.TextFormatAlign;
   import flash.utils.ByteArray;
   
   public class _1031 extends _171
   {
      private static const MAX_SIZE:int = 5000000;
      
      private static const IMAGE_WIDTH:int = 100;
      
      private static const IMAGE_HEIGHT:int = 100;
      
      private var _7212:Label;
      
      private var _7215:IconButton;
      
      private var _7214:Button;
      
      private var _7334:TextArea;
      
      private var _7226:Button;
      
      private var _7329:Button;
      
      private var _7198:String;
      
      private var _7322:_1105;
      
      private var _loader:Loader;
      
      private var _7325:Label;
      
      private var _7330:_128;
      
      private var _7324:TextInput;
      
      private var _7331:String;
      
      private var _7328:Label;
      
      private var _7326:BitmapData;
      
      private var _13486:ByteArray;
      
      private var _7323:Label;
      
      public var callback:Function;
      
      public function _1031(param1:String)
      {
         this._12594 = _1407.getInstance(_12463);
         super();
         this.width = this.minWidth = 500;
         this.height = this.minHeight = 630;
         if(!SystemInfo.isMacOS && _1528.language == _1530.zh_CN)
         {
            this.setStyle("fontFamily","微软雅黑");
         }
         this._7198 = param1;
         title = tr("Share.Title");
      }
      
      override protected function _2438() : void
      {
         var _loc2_:Group = null;
         var _loc3_:Group = null;
         var _loc9_:Group = null;
         super._2438();
         closeButton.visible = true;
         var _loc1_:Label = _125._2400();
         _loc1_.textAlign = TextFormatAlign.CENTER;
         _loc1_.percentWidth = 100;
         _loc1_.text = tr("Share.intro");
         _2512.percentWidth = 100;
         _2512.addElement(_loc1_);
         _2512.addElement(_125._2417());
         _loc2_ = _125._2413(16);
         _loc2_.percentWidth = 100;
         _loc3_ = _125._2414();
         _loc3_.percentWidth = 100;
         var _loc4_:Label;
         (_loc4_ = _125._2407()).text = tr("Share.curProject");
         this._7325 = new Label();
         this._7325.percentWidth = 100;
         this._7325.text = FileUtil.getFileName(this._7198);
         _loc3_.addElement(_loc4_);
         _loc3_.addElement(this._7325);
         var _loc5_:Group;
         (_loc5_ = _125._2414()).percentWidth = 100;
         var _loc6_:Label;
         (_loc6_ = _125._2407()).text = tr("Share.projectName");
         this._7324 = new TextInput();
         this._7324.percentWidth = 100;
         this._7324.text = FileUtil.getFileName(this._7198);
         this._7324.addEventListener(Event.CHANGE,this._7321);
         _loc5_.addElement(_loc6_);
         _loc5_.addElement(this._7324);
         var _loc7_:Group;
         (_loc7_ = _125._2403()).percentWidth = 100;
         var _loc8_:Label;
         (_loc8_ = _125._2407()).text = tr("Share.desc");
         this._7334 = new TextArea();
         this._7334.skinName = _840;
         this._7334.percentWidth = 100;
         this._7334.percentHeight = 100;
         _loc7_.addElement(_loc8_);
         _loc7_.addElement(this._7334);
         (_loc9_ = _125._2414()).percentWidth = 100;
         this._7214 = new Button();
         this._7214.label = tr("Share.uploadImage");
         this._7214.addEventListener(MouseEvent.CLICK,this._7217);
         var _loc10_:Label;
         (_loc10_ = new Label()).text = tr("Share.uploadImage.tip");
         _loc10_.alpha = 0.5;
         _loc9_.addElement(this._7214);
         _loc9_.addElement(_loc10_);
         var _loc11_:Group;
         (_loc11_ = _125._2396()).width = IMAGE_WIDTH;
         _loc11_.height = IMAGE_HEIGHT;
         this._7322 = new _1105();
         this._7322.buttonMode = true;
         this._7322.width = IMAGE_WIDTH;
         this._7322.height = IMAGE_HEIGHT;
         _loc11_.addElement(this._7322);
         _loc2_.addElement(_loc3_);
         _loc2_.addElement(_loc5_);
         _loc2_.addElement(_loc7_);
         _loc2_.addElement(_loc9_);
         _loc2_.addElement(_loc11_);
         var _loc12_:Group;
         (_loc12_ = _125._2414()).horizontalCenter = 0;
         this._7330 = new _128();
         this._7330.width = 15;
         this._7330.selected = true;
         this._7330.label = "";
         this._7330.addEventListener(Event.CHANGE,this._7327);
         var _loc13_:Button;
         (_loc13_ = new Button()).skinName = _12479;
         _loc13_.buttonMode = true;
         _loc13_.addEventListener(MouseEvent.CLICK,this._7333);
         _loc13_.setStyle("textColor",6652315);
         _loc13_.label = tr("Share.law");
         _loc12_.addElement(this._7330);
         _loc12_.addElement(_loc13_);
         _loc2_.addElement(_loc12_);
         _2512.addElement(_loc2_);
         this._7226 = _125._2408(tr("Share.upload"));
         this._7226.enabled = false;
         this._7226.width = 200;
         this._7226.addEventListener(MouseEvent.CLICK,this.onSend);
         _2632 = _125._12511();
         _2632.addElement(this._7226);
         _2632.bottom = 20;
         this.addElement(_2632);
         this._7220();
      }
      
      private function _7332(param1:MouseEvent) : void
      {
         var _loc2_:URLRequest = new URLRequest(_106.SHARE_ACITVITY);
         navigateToURL(_loc2_,"_blank");
      }
      
      private function _7333(param1:MouseEvent) : void
      {
         var _loc2_:URLRequest = new URLRequest(_106.EDN_AGREEMENT);
         navigateToURL(_loc2_,"_blank");
      }
      
      private function _7327(param1:Event) : void
      {
         this._7220();
      }
      
      private function _7321(param1:Event) : void
      {
         this._7220();
      }
      
      private function onSend(param1:MouseEvent) : void
      {
         var _loc2_:Object = null;
         if(this.callback != null)
         {
            _loc2_ = {};
            _loc2_.projectName = this._7324.text;
            _loc2_.desc = this._7334.text;
            _loc2_.attachment = this._7331;
            _loc2_.attachmentContent = this._13486;
            this.callback(_loc2_);
         }
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
            if(param1.size < MAX_SIZE)
            {
               if(_loader != null)
               {
                  _loader.contentLoaderInfo.removeEventListener(Event.COMPLETE,_7320);
                  _loader.unload();
                  _loader = null;
               }
               if(_7326)
               {
                  _7326.dispose();
                  _7326 = null;
               }
               _loader = new Loader();
               _loader.contentLoaderInfo.addEventListener(Event.COMPLETE,_7320);
               _13486 = FileUtil.openAsByteArray(param1.nativePath);
               _loader.loadBytes(FileUtil.openAsByteArray(param1.nativePath));
               _7331 = param1.nativePath;
            }
         },1,_650._4169);
      }
      
      private function _7320(param1:Event) : void
      {
         var _loc3_:Matrix = null;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         this._loader.contentLoaderInfo.removeEventListener(Event.COMPLETE,this._7320);
         var _loc2_:Bitmap = this._loader.content as Bitmap;
         if(_loc2_)
         {
            this._7326 = new BitmapData(IMAGE_WIDTH,IMAGE_HEIGHT,true,0);
            _loc3_ = new Matrix();
            _loc4_ = IMAGE_WIDTH / _loc2_.bitmapData.width;
            _loc5_ = IMAGE_HEIGHT / _loc2_.bitmapData.height;
            _loc6_ = _loc4_ < _loc5_ ? _loc4_ : _loc5_;
            _loc3_.scale(_loc6_,_loc6_);
            this._7326.draw(_loc2_.bitmapData,_loc3_,null,null,null,true);
            this._7322.source = this._7326;
         }
      }
      
      private function _7220() : void
      {
         this._7226.enabled = this._7325.text != "" && this._7330.selected;
      }
      
      public function set sending(param1:Boolean) : void
      {
         _2512.enabled = !param1;
         this._7226.label = !param1 ? tr("Share.upload") : tr("Share.uploading");
         this._7330.enabled = !param1;
         if(!param1)
         {
            this._7220();
         }
         else
         {
            this._7226.enabled = !param1;
         }
      }
   }
}

