package _944
{
   import _1045.Group;
   import _1045.Label;
   import _1045._1082;
   import _1045._1105;
   import _1177.CloseEvent;
   import _1185._1188;
   import _1185._1197;
   import _1374.Alert;
   import _1374.IconButton;
   import _1404._1407;
   import _472._12461;
   import _579._582;
   import _625._627;
   import _767._10614;
   import _97._125;
   import egret.utils.FileUtil;
   import egret.utils.tr;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.ProgressEvent;
   import flash.filesystem.File;
   import flash.net.URLLoader;
   import flash.net.URLLoaderDataFormat;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   import flash.text.TextFormatAlign;
   
   public class _10621 extends Group
   {
      private var _10831:String = "/assets/welcome/DBa.png";
      
      private var _10830:String;
      
      private var _10834:_1105;
      
      private var _10837:IconButton;
      
      private var bg:_1082;
      
      private var _10839:_1082;
      
      private var _10833:Label;
      
      public var _10835:Boolean = false;
      
      public var attachmentUrl:String = "";
      
      public var price:Number;
      
      public var _10788:String;
      
      public var _10838:int;
      
      public var url:String = "";
      
      private var _10820:Boolean = false;
      
      private var _10826:int = 0;
      
      private var _10829:Boolean;
      
      private var loader:URLLoader;
      
      private var _6076:Boolean = true;
      
      public function _10621(param1:String = null, param2:String = null, param3:Boolean = true)
      {
         this._10830 = tr("Welcome.Dragon");
         this._12569 = _1407.getInstance(_12461);
         this.loader = new URLLoader();
         if(param1)
         {
            this._10831 = param1;
         }
         if(param2)
         {
            this._10830 = param2;
         }
         this._10829 = param3;
         super();
      }
      
      override protected function _2438() : void
      {
         super._2438();
         var _loc1_:_1197 = new _1197();
         _loc1_._2401 = _1188.CENTER;
         _loc1_.gap = 10;
         this.layout = _loc1_;
         this._10834 = new _1105();
         this._10834._6704 = 100;
         this._10834._6706 = 100;
         this._10834.source = this._10831;
         var _loc2_:_1082 = new _1082();
         _loc2_.includeInLayout = false;
         _loc2_._2529 = 0;
         _loc2_.fillColor = 2171169;
         _loc2_.height = 100;
         _loc2_.width = 100;
         _loc2_._2563 = 2237994;
         _loc2_._2564 = 1;
         _loc2_._2562 = 7;
         this._10837 = _125._2394(this._10830);
         this._10837._6706 = 100;
         this.addElement(this._10834);
         if(this._10829)
         {
            this.addElement(_loc2_);
         }
         this.addElement(this._10837);
         this.bg = new _1082();
         this.bg.includeInLayout = false;
         this.bg._2529 = 1;
         this.bg.height = 30;
         this.bg.width = 80;
         this.bg._2564 = 0;
         this.bg._2562 = 1;
         this.bg.fillColor = 0;
         this.bg.y = 60;
         this.bg.x = 10;
         this._10839 = new _1082();
         this._10839.includeInLayout = false;
         this._10839._2529 = 1;
         this._10839.height = 30;
         this._10839.width = 80;
         this._10839._2564 = 0;
         this._10839._2562 = 1;
         this._10839.y = 60;
         this._10839.x = 10;
         this._10839.alpha = 0.5;
         this._10833 = new Label();
         this._10833.width = 100;
         this._10833.textAlign = TextFormatAlign.CENTER;
         this._10833.includeInLayout = false;
         this._10833.text = "";
         this._10833.alpha = 0.9;
         this._10833.size = 15;
         this._10833.y = 63;
         this._10833.mouseEnabled = false;
         this._10839.mouseEnabled = false;
         this._10827();
         this.mouseChildren = false;
         this.addEventListener(MouseEvent.MOUSE_OVER,this._9893);
         this.addEventListener(MouseEvent.MOUSE_OUT,this._9901);
         this.addEventListener(MouseEvent.CLICK,this._10819);
         this.buttonMode = true;
      }
      
      private function _10827() : void
      {
         var _loc3_:File = null;
         var _loc1_:Boolean = false;
         var _loc2_:File = File.applicationStorageDirectory.resolvePath("store");
         if(_loc2_.isDirectory)
         {
            for each(_loc3_ in _loc2_.getDirectoryListing())
            {
               if(_loc3_.name == this._10788 + ".zip")
               {
                  _loc1_ = true;
               }
            }
         }
         if(_loc1_)
         {
            this._10826 = 1;
            this._10839.fillColor = 4890552;
            this._10839._2563 = 4890552;
            this._10833.text = tr("Welcome.importExp");
         }
         else
         {
            this._10826 = 3;
            this._10839.fillColor = 5022324;
            this._10839._2563 = 5022324;
            this._10833.text = tr("Welcome.freeDown");
         }
      }
      
      private function _9893(param1:MouseEvent) : void
      {
         this.addEventListener(MouseEvent.MOUSE_MOVE,this._10818);
         if(!this._10839.parent && this._10835)
         {
            this.addElement(this.bg);
            this.addElement(this._10839);
            this.addElement(this._10833);
         }
         Label(this._10837.labelDisplay).textColor = 5941489;
      }
      
      private function _9901(param1:MouseEvent) : void
      {
         if(this.hasEventListener(MouseEvent.MOUSE_MOVE))
         {
            this.removeEventListener(MouseEvent.MOUSE_MOVE,this._10818);
         }
         if(Boolean(this._10839.parent) && this._10835)
         {
            this.removeElement(this.bg);
            this.removeElement(this._10839);
            this.removeElement(this._10833);
         }
         Label(this._10837.labelDisplay).textColor = 16777215;
      }
      
      private function _10818(param1:MouseEvent) : void
      {
         if(mouseY > 56 && mouseY < 95)
         {
            this._10839.alpha = 1;
         }
         else
         {
            this._10839.alpha = 0.5;
         }
      }
      
      private function _10819(param1:MouseEvent) : void
      {
         var _loc2_:File = null;
         if(!this._10835)
         {
            return;
         }
         if(mouseY > 56 && mouseY < 95)
         {
            param1.stopPropagation();
            switch(this._10826)
            {
               case 0:
                  break;
               case 1:
                  _loc2_ = File.applicationStorageDirectory.resolvePath("store/" + this._10788 + ".zip");
                  this._3227._10786(_loc2_.nativePath);
                  break;
               case 2:
               case 3:
                  this._12569.callPaidFunction(0,this.prompt);
            }
         }
         else
         {
            navigateToURL(new URLRequest(this.url),"_blank");
         }
      }
      
      private function prompt() : void
      {
         switch(this._10826)
         {
            case 2:
               Alert.show(tr("Welcome.buySure"),tr("Welcome.buyPrompt"),null,this._10836,tr("Alert.Confirm"),tr("Alert.Cancel"));
               break;
            case 3:
               this._10823();
         }
      }
      
      private function _10836(param1:CloseEvent) : void
      {
         if(param1.detail == Alert.FIRST_BUTTON)
         {
            this._10823();
         }
      }
      
      private function _10823() : void
      {
         var protoBuyWorks:_10614;
         this._10825();
      }
      
      private function _10825() : void
      {
         if(this.attachmentUrl == "")
         {
            if(this._6076)
            {
               this._3750();
               this._6076 = false;
            }
            else
            {
               Alert.show(tr("Welcome.downFail"),tr("Welcome.downPrompt"),null,null,tr("Alert.Confirm"));
            }
            return;
         }
         var _loc1_:URLRequest = new URLRequest(this.attachmentUrl);
         this.loader.dataFormat = URLLoaderDataFormat.BINARY;
         this.loader.addEventListener(Event.COMPLETE,this._10822);
         this.loader.addEventListener(ProgressEvent.PROGRESS,this._10821);
         this.loader.load(_loc1_);
      }
      
      private function _10822(param1:Event) : void
      {
         var _loc2_:File = File.applicationStorageDirectory.resolvePath("store/" + this._10788 + ".zip");
         if(FileUtil.save(_loc2_.nativePath,this.loader.data))
         {
         }
         this._10820 = true;
         this._10827();
      }
      
      private function _10821(param1:ProgressEvent) : void
      {
      }
      
      private function _3750() : void
      {
         if(this._4915._10774)
         {
            this.prompt();
         }
         else
         {
            this._4915._10780(this.prompt);
         }
      }
      
      private function _10828(param1:CloseEvent) : void
      {
         var _loc2_:URLRequest = null;
         if(param1.detail == Alert.FIRST_BUTTON)
         {
            _loc2_ = new URLRequest(_12461.DBGO_CHARGE);
            navigateToURL(_loc2_,"_blank");
         }
      }
      
      private function get _3227() : _627
      {
         return _1407.getInstance(_627) as _627;
      }
      
      private function get _4915() : _582
      {
         return _1407.getInstance(_582) as _582;
      }
      
      public function get imageUrl() : String
      {
         return this._10831;
      }
      
      public function set imageUrl(param1:String) : void
      {
         this._10831 = param1;
      }
      
      public function get _10668() : String
      {
         return this._10830;
      }
      
      public function set _10668(param1:String) : void
      {
         this._10830 = param1;
      }
   }
}

