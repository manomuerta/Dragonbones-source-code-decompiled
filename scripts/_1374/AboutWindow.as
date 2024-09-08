package _1374
{
   import _1045.Group;
   import _1045.Label;
   import _1045._1082;
   import _1045._1105;
   import _1185._1197;
   import _1495._1496;
   import _1529._1528;
   import egret.utils.SystemInfo;
   import egret.utils._1539;
   import egret.utils.app.bridge._1500;
   import egret.utils.tr;
   import flash.desktop.NativeApplication;
   import flash.utils.ByteArray;
   
   public class AboutWindow extends Window
   {
      private static var AboutWindowConfig:Class = AboutWindow_AboutWindowConfig;
      
      private var _9525:Object;
      
      public var _2448:_1105;
      
      private var _2434:Label;
      
      private var _2430:Label;
      
      private var _2454:Label;
      
      private var _2431:Label;
      
      private var _2432:Label;
      
      private var _2437:Label;
      
      private var _2445:Label;
      
      private var _2444:Label;
      
      private var _2428:Label;
      
      private var _2436:Label;
      
      private var _2435:Label;
      
      private var _2424:Label;
      
      public function AboutWindow()
      {
         super();
         this.title = tr("AboutWindow.Title",this.appName);
         this.width = this.minWidth = 870;
         this.height = this.minHeight = 450;
         this.resizable = false;
      }
      
      private function _9526(param1:XML) : String
      {
         if(param1.hasSimpleContent())
         {
            return param1.toString();
         }
         return param1.child(_1528.language).toString();
      }
      
      private function _5592(param1:XML) : Object
      {
         var _loc3_:XML = null;
         var _loc2_:Object = {};
         for each(_loc3_ in param1.children())
         {
            _loc2_[_loc3_.localName().toString()] = this._9526(_loc3_);
         }
         return _loc2_;
      }
      
      protected function _9522() : Object
      {
         var _loc1_:ByteArray = new AboutWindowConfig();
         var _loc2_:String = _loc1_.readUTFBytes(_loc1_.bytesAvailable);
         return this._5592(new XML(_loc2_));
      }
      
      public function get _2446() : Object
      {
         if(!this._9525)
         {
            return this._9522();
         }
         return this._9525;
      }
      
      public function set _2446(param1:Object) : void
      {
         var _loc2_:Object = null;
         var _loc3_:Object = null;
         var _loc4_:String = null;
         if(param1 == null)
         {
            this._9525 = null;
         }
         else
         {
            _loc2_ = {};
            _loc3_ = this._9522();
            for(_loc4_ in _loc3_)
            {
               _loc2_[_loc4_] = _loc3_[_loc4_];
            }
            for(_loc4_ in param1)
            {
               _loc2_[_loc4_] = param1[_loc4_];
            }
            this._9525 = _loc2_;
         }
         if(_2440)
         {
            this._9523();
         }
      }
      
      protected function get appName() : String
      {
         var _loc1_:XML = NativeApplication.nativeApplication.applicationDescriptor;
         var _loc2_:Namespace = _loc1_.namespace();
         return _loc1_._loc2_::name[0].toString();
      }
      
      protected function get appVersion() : String
      {
         var _loc1_:XML = NativeApplication.nativeApplication.applicationDescriptor;
         var _loc2_:Namespace = _loc1_.namespace();
         return _loc1_._loc2_::versionNumber[0].toString() + "." + _loc1_._loc2_::versionLabel[0];
      }
      
      protected function get icon() : String
      {
         return "assets/icon/100.png";
      }
      
      protected function get _2429() : String
      {
         var _loc1_:Array = ["ss22219","ifyx","smartdengjie","d8q8","yyhx","rockyf","iagynkqrm","Channing","langlive","songsharp","kyoxiaomao","dily3825002","wujian001215","dom","zcxp","joekychen","featherJ","xzper","xsstomy","yansong","yangning","chenyong","wangjie"];
         _loc1_.sort();
         return _loc1_.join(", ");
      }
      
      protected function _9523() : void
      {
         var _loc1_:Object = this._2446;
         this._2454.htmlText = tr("AboutWindow.BBS","<font color=\'#00a0f0\'><a href=\"" + _loc1_["bbs"] + "\">" + _loc1_["bbs"] + "</a></font>");
         this._2431.htmlText = tr("AboutWindow.SupportMail","<font color=\'#00a0f0\'><a>" + _loc1_["support_mail"] + "</a></font>");
         this._2432.htmlText = tr("AboutWindow.DeveloperQQ",_loc1_["developer_qq"]);
         this._2437.htmlText = tr("AboutWindow.Telephone",_loc1_["telephone"]);
         this._2445.htmlText = tr("AboutWindow.Website","<font color=\'#00a0f0\'><a href=\"" + _loc1_["website"] + "\">" + _loc1_["website"] + "</a></font>");
         this._2444.htmlText = tr("AboutWindow.Address",_loc1_["address"]);
         this._2428.htmlText = tr("AboutWindow.BusinessMail","<font color=\'#00a0f0\'><a>" + _loc1_["business_mail"] + "</a></font>");
         this._2436.htmlText = tr("AboutWindow.ChannelQQ",_loc1_["channel_qq"]);
         this._2435.htmlText = tr("AboutWindow.ProductQQ",_loc1_["product_qq"]);
         this._2424.text = String(_loc1_["service_promise"]).split("\r\n").join("\n").split("\r").join("\n");
      }
      
      private function _9524() : void
      {
         var configPath:String = _1500.updateServer + "config/AboutWindowConfig.xml?" + Math.random();
         _1539._9527(configPath,function(param1:XML):void
         {
            _2446 = _5592(param1);
         },null,null);
      }
      
      override protected function _2438() : void
      {
         super._2438();
         if(!SystemInfo.isMacOS)
         {
            this._2440.setStyle("fontFamily","微软雅黑");
         }
         var _loc1_:Group = new Group();
         if(SystemInfo.isMacOS)
         {
            _loc1_.setStyle("fontFamily","微软雅黑");
         }
         _loc1_.top = 20;
         _loc1_.left = 20;
         _loc1_.setStyle("textColor","0xeeeeee");
         this.addElement(_loc1_);
         this._2448 = new _1105();
         this._2448.source = this.icon;
         _loc1_.addElement(this._2448);
         var _loc2_:Label = new Label();
         _loc2_.x = 120;
         _loc2_.text = this.appName;
         _loc2_.size = 26;
         _loc1_.addElement(_loc2_);
         this._2434 = new Label();
         this._2434.x = 120;
         this._2434.top = 55;
         this._2434.text = tr("AboutWindow.Version",this.appVersion);
         _loc1_.addElement(this._2434);
         var _loc3_:Label = new Label();
         _loc3_.x = 120;
         _loc3_.top = 80;
         _loc3_.text = _1496._2452;
         _loc1_.addElement(_loc3_);
         var _loc4_:_1082;
         (_loc4_ = new _1082()).top = 20;
         _loc4_.left = 390;
         _loc4_.width = 1;
         _loc4_.height = 95;
         _loc4_.fillColor = 1976110;
         this.addElement(_loc4_);
         var _loc5_:Label;
         (_loc5_ = new Label()).textColor = 6842472;
         _loc5_.left = 410;
         _loc5_.right = 50;
         _loc5_.text = this._2429;
         _loc5_.top = 30;
         this.addElement(_loc5_);
         var _loc6_:Group;
         (_loc6_ = new Group()).left = 20;
         _loc6_.top = 160;
         var _loc7_:_1197;
         (_loc7_ = new _1197()).gap = 2;
         _loc6_.layout = _loc7_;
         _loc6_.setStyle("textColor","0xababab");
         this.addElement(_loc6_);
         var _loc8_:Label;
         (_loc8_ = new Label()).text = tr("AboutWindow.TechGroup");
         _loc8_.textColor = 15658734;
         _loc6_.addElement(_loc8_);
         this._2454 = new Label();
         _loc6_.addElement(this._2454);
         this._2431 = new Label();
         _loc6_.addElement(this._2431);
         this._2432 = new Label();
         _loc6_.addElement(this._2432);
         var _loc9_:Group;
         (_loc9_ = new Group()).left = 20;
         _loc9_.top = 280;
         (_loc7_ = new _1197()).gap = 2;
         _loc9_.layout = _loc7_;
         _loc9_.setStyle("textColor","0xababab");
         this.addElement(_loc9_);
         (_loc8_ = new Label()).text = tr("AboutWindow.ContactGroup");
         _loc8_.textColor = 15658734;
         _loc9_.addElement(_loc8_);
         this._2437 = new Label();
         _loc9_.addElement(this._2437);
         this._2445 = new Label();
         _loc9_.addElement(this._2445);
         this._2444 = new Label();
         _loc9_.addElement(this._2444);
         var _loc10_:Group;
         (_loc10_ = new Group()).left = 380;
         _loc10_.top = 160;
         (_loc7_ = new _1197()).gap = 2;
         _loc10_.layout = _loc7_;
         _loc10_.setStyle("textColor","0xababab");
         this.addElement(_loc10_);
         (_loc8_ = new Label()).text = tr("AboutWindow.BusinessGroup");
         _loc8_.textColor = 15658734;
         _loc10_.addElement(_loc8_);
         this._2428 = new Label();
         _loc10_.addElement(this._2428);
         this._2436 = new Label();
         _loc10_.addElement(this._2436);
         _loc10_._2449();
         this._2435 = new Label();
         this._2435.x = 165;
         this._2435.y = this._2428.y;
         this._2435.includeInLayout = false;
         _loc10_.addElement(this._2435);
         var _loc11_:Group;
         (_loc11_ = new Group()).left = 380;
         _loc11_.top = 250;
         (_loc7_ = new _1197()).gap = 2;
         _loc11_.layout = _loc7_;
         _loc11_.setStyle("textColor","0xababab");
         this.addElement(_loc11_);
         (_loc8_ = new Label()).text = tr("AboutWindow.PromiseGroup");
         _loc8_.textColor = 15658734;
         _loc11_.addElement(_loc8_);
         this._2424 = new Label();
         _loc11_.addElement(this._2424);
         this._9523();
         this._9524();
      }
   }
}

