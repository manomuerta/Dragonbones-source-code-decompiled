package _944
{
   import _1045.Group;
   import _1045._1082;
   import _1045._1105;
   import _11106._12897;
   import _1185._1189;
   import _1185._1197;
   import _1374.IconButton;
   import _1374.TabPanel;
   import _1529._1528;
   import _1529._1530;
   import _472._12461;
   import _6.Context;
   import _767._10615;
   import _783.CommandNotification;
   import _822._12476;
   import _97._106;
   import _97._117;
   import _97._125;
   import egret.core._1109;
   import egret.utils.FileUtil;
   import egret.utils.SystemInfo;
   import egret.utils.tr;
   import flash.events.IOErrorEvent;
   import flash.filesystem.File;
   
   public class _946 extends TabPanel
   {
      private var _6728:String = "/assets/welcome/logo.png";
      
      private var _13032:String = "/assets/welcome/logo.png";
      
      private var banner_cn:String = "/assets/welcome/banner_cn.jpg";
      
      private var banner_en:String = "/assets/welcome/banner_en.jpg";
      
      private var _6714:String = "assets/menu/new.png";
      
      private var _6709:String = "assets/menu/open.png";
      
      private var _6705:String = "assets/menu/import.png";
      
      private var _6723:String = "assets/menu/video.png";
      
      private var _6724:String = "assets/menu/doc.png";
      
      private var _6725:String = "assets/menu/doc.png";
      
      private var _6712:String = "assets/menu/doc.png";
      
      private var DBa:String = "/assets/welcome/DBa.png";
      
      private var DBb:String = "/assets/welcome/DBb.png";
      
      private var DBc:String = "/assets/welcome/DBc.png";
      
      private var DBd:String = "/assets/welcome/DBd.png";
      
      private var DBe:String = "/assets/welcome/DBe.png";
      
      private var DBf:String = "/assets/welcome/DBf.png";
      
      private var DBg:String = "/assets/welcome/DBg.png";
      
      private var DBh:String = "/assets/welcome/DBh.png";
      
      private var DBi:String = "/assets/welcome/DBi.png";
      
      private var DBj:String = "/assets/welcome/DBj.png";
      
      private var DBk:String = "/assets/welcome/DBk.png";
      
      private var _12743:String = "/assets/welcome/welcome.jpg";
      
      private var _13445:String = "assets/welcome/DBl.png";
      
      public var _6730:_1105;
      
      private var _6729:_1105;
      
      private var _10853:Group;
      
      private var _10845:Group;
      
      private var _10854:Group;
      
      private var _10848:Group;
      
      private var _6713:Group;
      
      private var _6711:Group;
      
      private var _6722:Group;
      
      public var _4951:IconButton;
      
      public var _4943:IconButton;
      
      public var _4952:Group;
      
      public var _4963:IconButton;
      
      public var _4950:IconButton;
      
      public var _4965:IconButton;
      
      public var _4953:IconButton;
      
      public var _4946:IconButton;
      
      public var _4958:IconButton;
      
      public var _4957:_10621;
      
      public var _4942:_10621;
      
      public var _4960:_10621;
      
      public var _4955:_10621;
      
      public var _4949:_10621;
      
      public var _11974:_10621;
      
      public var _11975:_10621;
      
      public var _13354:_10621;
      
      public var _10771:_10621;
      
      public var _4961:_10621;
      
      public var _4966:_10621;
      
      public var _10776:_10621;
      
      public var _10779:IconButton;
      
      public var _10775:IconButton;
      
      public var _10778:IconButton;
      
      public var _6999:IconButton;
      
      public var _4954:IconButton;
      
      public var _10772:Array;
      
      public var _10855:Array;
      
      public var _1890:Boolean = false;
      
      private var _10850:Group;
      
      private var _7239:int = 30;
      
      public var _10774:Boolean = false;
      
      public function _946()
      {
         this._10845 = new Group();
         this._10772 = [];
         this._10855 = [];
         this._10850 = new Group();
         super();
         this.percentWidth = 100;
         this.percentHeight = 100;
         if(!SystemInfo.isMacOS && _1528.language == _1530.zh_CN)
         {
            this.setStyle("fontFamily","微软雅黑");
         }
         if(_1528.language == _1530.zh_CN)
         {
            this._13032 = this.banner_cn;
         }
         else
         {
            this._13032 = this.banner_en;
         }
      }
      
      override protected function _2438() : void
      {
         super._2438();
         var _loc1_:_1082 = new _1082();
         _loc1_._2529 = 0;
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         this.addElement(_loc1_);
         var _loc2_:_12476 = new _12476();
         _loc2_._8604 = _1109.REPEAT;
         _loc2_.source = this._12743;
         _loc2_.percentWidth = 100;
         _loc2_.percentHeight = 100;
         this.addElement(_loc2_);
         var _loc3_:Group = _125._2413(13);
         _loc3_.verticalCenter = 0;
         _loc3_.horizontalCenter = 0;
         this.addElement(_loc3_);
         var _loc4_:Group;
         (_loc4_ = _125._2397()).percentWidth = 100;
         this._6730 = new _1105(this._13032);
         _loc4_.addElement(this._6730);
         _loc3_.addElement(_loc4_);
         _loc4_.buttonMode = true;
         var _loc5_:Group;
         (_loc5_ = _125._2413(-1)).percentWidth = 100;
         this._10853 = _125._2414(22);
         _loc5_.addElement(this._10853);
         _loc5_.addElement(_125._2417());
         _loc3_.addElement(_loc5_);
         this._10848 = new Group();
         _loc3_.addElement(this._10848);
         var _loc6_:Group;
         (_loc6_ = _125._2413(-1)).percentWidth = 100;
         this._10854 = _125._2414(22);
         _loc6_.addElement(this._10854);
         _loc6_.addElement(_125._2417());
         _loc3_.addElement(_loc6_);
         this._6713 = new Group();
         this._6711 = new Group();
         _loc3_.addElement(this._6713);
         _loc3_.addElement(this._6711);
         this._6722 = new Group();
         _loc3_.addElement(this._6722);
         this._6718();
         this._10846();
         this._10841();
         this._6707();
         this._6702();
         this._6716();
         this._10780();
         this._1890 = true;
      }
      
      private function _6703() : Group
      {
         var _loc1_:Group = new Group();
         var _loc2_:_1197 = new _1197();
         _loc2_.gap = 5;
         _loc1_.layout = _loc2_;
         return _loc1_;
      }
      
      private function _6718() : void
      {
         this._10853.addElement(_125._2400(tr("Welcome.myProject")));
         this._4951 = _125._2394(tr("Welcome.openProNew"),this._6709,CommandNotification.SHOW_OPEN_PROJECT_DIALOG);
         this._4943 = _125._2394(tr("Welcome.importProNew"),this._6705,CommandNotification.SHOW_IMPORT_WINDOW);
         this._10853.addElement(this._4951);
         this._10853.addElement(this._4943);
      }
      
      private function _10844() : void
      {
      }
      
      private function _10846() : void
      {
         this._10854.addElement(_125._2400(tr("Welcome.study")));
         this._4963 = _125._2394(tr("Welcome.DBVideo"),this._6723,[_106.local(_106.VIDEO_TUTORIALS),_12897.OfficialVideo]);
         this._4950 = _125._2394(tr("Welcome.DBUser"),this._6724,[_106.local(_106.USER_GUIDE),_12897.OnlineDoc]);
         this._4965 = _125._2394(tr("Welcome.DBApi"),this._6725,[_106.API_REFERENCE,_12897.APIDoc]);
         this._4953 = _125._2394(tr("Welcome.newFeature"),this._6712,[_106.local(_106.NEW_FEATURE),_12897.NewFeature]);
         this._10854.addElement(this._4963);
         this._10854.addElement(this._4950);
         this._10854.addElement(this._4965);
         this._10854.addElement(this._4953);
      }
      
      private function _10842() : void
      {
      }
      
      private function _10841() : void
      {
         var _loc4_:_10622 = null;
         var _loc1_:_1197 = new _1197();
         _loc1_.gap = 5;
         var _loc2_:_1189 = new _1189();
         _loc2_.gap = 30;
         _loc2_._2420 = 0;
         this._10848.layout = _loc1_;
         this._10845.layout = _loc2_;
         this._10848.addElement(this._10845);
         this._4952 = new _10622("/assets/welcome/open.png",tr("Welcome.newPro"));
         this._10845.addElement(this._4952);
         var _loc3_:int = 0;
         while(_loc3_ < 6)
         {
            _loc4_ = new _10622();
            this._10772.push(_loc4_);
            _loc3_++;
         }
      }
      
      public function _10840() : void
      {
         var _loc1_:_10622 = null;
         var _loc2_:Object = null;
         var _loc3_:_10622 = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:String = null;
         var _loc7_:String = null;
         var _loc8_:File = null;
         var _loc9_:String = null;
         if(this._10772 == null)
         {
            return;
         }
         for each(_loc1_ in this._10772)
         {
            if(Boolean(_loc1_) && _loc1_.parent == this._10845)
            {
               this._10845.removeElement(_loc1_);
            }
         }
         _loc2_ = Context.getInstance()._1568;
         if(_loc2_ && _loc2_.appModel && Boolean(_loc2_.appModel.recentProjectPathList))
         {
            _loc4_ = _loc2_.appModel.recentProjectPathList.length > 6 ? 6 : int(_loc2_.appModel.recentProjectPathList.length);
            _loc5_ = 0;
            while(_loc5_ < _loc4_)
            {
               _loc6_ = _loc2_.appModel.recentProjectPathList[_loc5_];
               if(_loc6_)
               {
                  _loc7_ = _loc6_.replace(/(\/)/g,"_").replace(":","").replace(".","");
                  _loc8_ = File.applicationStorageDirectory.resolvePath("recent/" + _loc7_ + ".png");
                  _loc9_ = null;
                  if(_loc8_.exists)
                  {
                     _loc9_ = "/" + _loc8_.nativePath;
                  }
                  _loc3_ = this._10772[_loc5_];
                  if(_loc3_)
                  {
                     _loc3_._10773 = _loc6_;
                     _loc3_._10668 = FileUtil.getFileName(_loc6_);
                     if(_117._10678)
                     {
                        if(_117._10678.hasOwnProperty(_loc7_))
                        {
                           _loc3_.imageUrl = _117._10678[_loc7_];
                        }
                        else
                        {
                           _loc3_.imageUrl = _loc9_;
                        }
                        this._10845.addElement(_loc3_);
                     }
                  }
               }
               _loc5_++;
            }
         }
      }
      
      public function _10701() : void
      {
         this._10840();
         this._10843();
      }
      
      private function _10843() : void
      {
         var _loc2_:File = null;
         var _loc1_:File = File.applicationStorageDirectory.resolvePath("recent");
         if(_loc1_.isDirectory)
         {
            for each(_loc2_ in _loc1_.getDirectoryListing())
            {
               if(!this._10849(_loc2_.name))
               {
                  FileUtil.deletePath(_loc2_.nativePath);
               }
            }
         }
      }
      
      private function _10849(param1:String) : Boolean
      {
         var _loc6_:String = null;
         var _loc7_:String = null;
         var _loc2_:Boolean = false;
         var _loc3_:Object = Context.getInstance()._1568;
         var _loc4_:int = int(_loc3_.appModel.recentProjectPathList.length);
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc6_ = _loc3_.appModel.recentProjectPathList[_loc5_];
            _loc7_ = _loc6_.replace(/(\/)/g,"_").replace(":","").replace(".","");
            if(param1 == _loc7_ + ".png")
            {
               _loc2_ = true;
            }
            _loc5_++;
         }
         return _loc2_;
      }
      
      private function _6707() : void
      {
         var _loc1_:_1197 = new _1197();
         _loc1_.gap = 20;
         this._6713.layout = _loc1_;
         var _loc2_:_1189 = new _1189();
         _loc2_.gap = this._7239;
         _loc2_._2420 = 0;
         this._10850 = new Group();
         this._10850.layout = _loc2_;
         this._6713.addElement(this._10850);
         this._4957 = new _10621(this.DBa,tr("Welcome.Dragon"));
         this._10850.addElement(this._4957);
         this._4942 = new _10621(this.DBc,tr("Welcome.DragonOpening"));
         this._10850.addElement(this._4942);
         this._13354 = new _10621(this._13445,tr("Welcome.Sheet"));
         this._10850.addElement(this._13354);
         this._4960 = new _10621(this.DBe,tr("Welcome.Ubbie"));
         this._10850.addElement(this._4960);
         this._4955 = new _10621(this.DBf,tr("Welcome.Bicycle"));
         this._10850.addElement(this._4955);
         this._4949 = new _10621(this.DBh,tr("Welcome.SwordsMan"));
         this._10850.addElement(this._4949);
      }
      
      private function _6702() : void
      {
         var _loc1_:_1197 = new _1197();
         _loc1_.gap = 10;
         var _loc2_:_1189 = new _1189();
         _loc2_.gap = this._7239;
         this._6711.layout = _loc1_;
         var _loc3_:Group = new Group();
         _loc3_.layout = _loc2_;
         this._6711.addElement(_loc3_);
         this._11974 = new _10621(this.DBj,tr("Welcome.sheep"));
         _loc3_.addElement(this._11974);
         this._11975 = new _10621(this.DBk,tr("Welcome.cock"));
         _loc3_.addElement(this._11975);
         this._10771 = new _10621(this.DBb,tr("Welcome.Robot"));
         this._4949.url = "http://t.egret.com/work/7d59878885ef11e6aae5fa163e223ae3.html";
         this._4949._10788 = "SwordsMan";
         _loc3_.addElement(this._10771);
         this._4961 = new _10621(this.DBd,tr("Welcome.Demon"));
         _loc3_.addElement(this._4961);
         this._4966 = new _10621(this.DBg,tr("Welcome.TCl_Advertisement"));
         _loc3_.addElement(this._4966);
         this._10776 = new _10621("/assets/welcome/bigMore.png",tr("Welcome.More"));
         _loc3_.addElement(this._10776);
      }
      
      private function _6716() : void
      {
         var _loc1_:Group = new Group();
         var _loc2_:_1197 = new _1197();
         _loc2_.gap = 5;
         this._6722.percentWidth = 100;
         this._6722.layout = _loc2_;
         this._6722.addElement(_125._2417());
         this._6722.addElement(_loc1_);
         var _loc3_:_1189 = new _1189();
         _loc3_.gap = 50;
         _loc1_.layout = _loc3_;
         this._10779 = _125._2394(tr("Welcome.DBWeb"),null,[_106.local(_106.DB_WEBPAGE),_12897.OfficialWebsite]);
         this._10775 = _125._2394(tr("Welcome.DBCode"),null,[_106.DB_CODE,_12897.GitHub]);
         this._10778 = _125._2394(tr("Welcome.DBVideoCenter"),null,[_106.local(_106.VIDEO_CENTER),_12897.VideoCenter]);
         this._6999 = _125._2394(tr("Welcome.trello"),null,[_106.OPEN_TRELLO,_12897.IdeaCollection]);
         this._4954 = _125._2394(tr("Welcome.egretForum"),null,[_106.local(_106.FORUM),_12897.BBS]);
         _loc1_.addElement(this._10779);
         _loc1_.addElement(this._10775);
         _loc1_.addElement(this._10778);
         _loc1_.addElement(this._6999);
         _loc1_.addElement(this._4954);
      }
      
      public function _10780(param1:Function = null) : void
      {
         var callback:Function = param1;
         var protoGetWorks:_10615 = new _10615();
         protoGetWorks.serverURL = _12461.DBGET_WORK;
         protoGetWorks.request(function(param1:Object):void
         {
            var _loc2_:Object = null;
            var _loc3_:_10623 = null;
            if(param1["code"] == 0)
            {
               for each(_loc2_ in param1["data"])
               {
                  _loc3_ = new _10623(_loc2_);
                  _10855.push(_loc3_);
               }
               _10774 = true;
            }
            if(_10855[0])
            {
               _4957.attachmentUrl = _10623(_10855[0]).attachmentUrl;
            }
            if(_10855[1])
            {
               _4942.attachmentUrl = _10623(_10855[1]).attachmentUrl;
            }
            if(_10855[2])
            {
               _4960.attachmentUrl = _10623(_10855[2]).attachmentUrl;
            }
            if(_10855[3])
            {
               _4955.attachmentUrl = _10623(_10855[3]).attachmentUrl;
            }
            if(_10855[4])
            {
               _4949.attachmentUrl = _10623(_10855[4]).attachmentUrl;
            }
            if(callback != null)
            {
               callback();
            }
         },function(param1:IOErrorEvent):void
         {
         });
      }
      
      private function _10851() : void
      {
         var _loc2_:Group = null;
         var _loc4_:_1189 = null;
         var _loc5_:Group = null;
         var _loc1_:int = 0;
         _loc2_ = this._10850;
         var _loc3_:int = 0;
         while(_loc3_ < this._10855.length)
         {
            if(_loc1_ < 5)
            {
               _loc2_.addElement(this._10855[_loc3_]);
               _loc1_++;
            }
            else
            {
               _loc1_ = 0;
               (_loc4_ = new _1189()).gap = 50;
               _loc4_._2420 = 10;
               (_loc5_ = new Group()).layout = _loc4_;
               this._6713.addElement(_loc5_);
               _loc2_ = _loc5_;
               _loc2_.addElement(this._10855[_loc3_]);
               _loc1_++;
            }
            _loc3_++;
         }
      }
   }
}

