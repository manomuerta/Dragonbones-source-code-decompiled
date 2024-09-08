package _944
{
   import _1045.Group;
   import _1045.Label;
   import _1045._1082;
   import _1045._1105;
   import _1177.CloseEvent;
   import _1185._1188;
   import _1185._1197;
   import _127._142;
   import _1374.Alert;
   import _1374.IconButton;
   import _1404._1407;
   import _472._12461;
   import _625._627;
   import _648._12463;
   import _767._10614;
   import _834._10618;
   import egret.utils.FileUtil;
   import egret.utils.tr;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.MouseEvent;
   import flash.events.ProgressEvent;
   import flash.filesystem.File;
   import flash.net.URLLoader;
   import flash.net.URLLoaderDataFormat;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   
   public class _10623 extends Group
   {
      public var attachmentUrl:String;
      
      public var price:Number;
      
      public var _10788:String;
      
      public var _10838:int;
      
      private var _10820:Boolean = false;
      
      private var _data:Object;
      
      private var _10831:String = "/assets/welcome/DBa.png";
      
      private var _10830:String;
      
      private var _10834:_1105;
      
      private var _10837:IconButton;
      
      private var _10839:_1082;
      
      private var _10833:Label;
      
      private var _10826:int = 0;
      
      private var loader:URLLoader;
      
      public function _10623(param1:Object)
      {
         this._10830 = tr("Welcome.Dragon");
         this._12594 = _1407.getInstance(_12463);
         this._12569 = _1407.getInstance(_12461);
         this.loader = new URLLoader();
         super();
         this._data = param1;
         this.attachmentUrl = this._data["attachmentUrl"];
         this._10788 = this._data["name"];
         this._10838 = this._data["id"];
         this.price = this._data["luegg"];
      }
      
      override protected function _2438() : void
      {
         var _loc2_:_1082 = null;
         super._2438();
         var _loc1_:_1197 = new _1197();
         _loc1_._2401 = _1188.CENTER;
         _loc1_.gap = 10;
         this.layout = _loc1_;
         this._10834 = new _1105();
         this._10834._6704 = 100;
         this._10834._6706 = 100;
         this._10834.source = this._data["cover"];
         _loc2_ = new _1082();
         _loc2_.includeInLayout = false;
         _loc2_._2529 = 0.6;
         _loc2_.fillColor = 0;
         _loc2_.height = 100;
         _loc2_.width = 100;
         _loc2_._2563 = 2237994;
         _loc2_._2564 = 1;
         _loc2_._2562 = 7;
         this._10837 = new _142();
         this._10837.skinName = _10618;
         this._10837.label = this._data["name"];
         this._10837._6706 = 100;
         this._10837.toolTip = this._data["name"];
         this._10839 = new _1082();
         this._10839.includeInLayout = false;
         this._10839._2529 = 1;
         this._10839.height = 30;
         this._10839.width = 80;
         this._10839._2564 = 0;
         this._10839._2562 = 1;
         this._10839.y = 60;
         this._10839.x = 10;
         this._10833 = new Label();
         this._10833.includeInLayout = false;
         this._10833.text = "";
         this._10833.alpha = 0.9;
         this._10833.size = 17;
         this._10833.y = 60;
         this._10833.x = 15;
         this._10827();
         this.addElement(this._10834);
         this.addElement(_loc2_);
         this.addElement(this._10837);
         this.addElement(this._10839);
         this.addElement(this._10833);
         this.addEventListener(MouseEvent.CLICK,this._10819);
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
         else if(this.price > 0)
         {
            this._10826 = 2;
            this._10839.fillColor = 13479513;
            this._10839._2563 = 13479513;
            this._10833.text = this.price + tr("Welcome.gold");
         }
         else
         {
            this._10826 = 3;
            this._10839.fillColor = 5022324;
            this._10839._2563 = 5022324;
            this._10833.text = tr("Welcome.freeDown");
         }
      }
      
      private function _10819(param1:MouseEvent) : void
      {
         var _loc2_:File = null;
         switch(this._10826)
         {
            case 0:
               break;
            case 1:
               _loc2_ = File.applicationStorageDirectory.resolvePath("store/" + this._10788 + ".zip");
               this._3227._3289(_loc2_.nativePath);
               break;
            case 2:
            case 3:
               this._12569.callPaidFunction(0,this.prompt);
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
         var protoBuyWorks:_10614 = new _10614();
         protoBuyWorks.serverURL = _12461.DBBUY_WORK;
         protoBuyWorks._10809 = this._10838;
         protoBuyWorks.request(function(param1:Object):void
         {
            switch(param1["code"])
            {
               case 0:
                  _10825();
                  break;
               case 1049:
                  _10825();
                  break;
               case 800:
                  break;
               case 1050:
                  Alert.show(tr("Welcome.goCharge"),tr("Welcome.buyPrompt"),null,_10828,tr("Alert.Confirm"),tr("Alert.Cancel"));
                  break;
               default:
                  Alert.show(tr("Welcome.buyFail"),tr("Welcome.buyPrompt"),null,null,tr("Alert.Confirm"));
            }
         },function(param1:IOErrorEvent):void
         {
         });
      }
      
      private function _10825() : void
      {
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
            this._3227._3289(_loc2_.nativePath);
         }
         this._10820 = true;
         this._10827();
      }
      
      private function _10821(param1:ProgressEvent) : void
      {
      }
      
      private function _3750() : void
      {
         this.prompt();
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
   }
}

