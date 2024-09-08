package _127
{
   import _1045.Group;
   import _1045.Label;
   import _1045._1082;
   import _1045._1086;
   import _1045._1105;
   import _1185._1197;
   import _1374.AboutWindow;
   import _1495._1496;
   import _1529._1528;
   import _1529._1530;
   import egret.utils.SystemInfo;
   import egret.utils._1543;
   import egret.utils.tr;
   
   public class _126 extends AboutWindow
   {
      private var _2434:Label;
      
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
      
      private var _2439:Label;
      
      private var _2443:Label;
      
      private var _2442:Group;
      
      private var _2453:Group;
      
      private var _2433:_1197;
      
      private var _2455:_1086;
      
      private var _2441:Boolean;
      
      private var _2447:String = "https://facebook.com/dragonbonesteam";
      
      private var _2451:String = "https://twitter.com/dragonbonesteam";
      
      public function _126()
      {
         this._2433 = new _1197();
         this._2455 = new _1086();
         super();
      }
      
      override protected function get icon() : String
      {
         return "assets/icon/100.png";
      }
      
      override public function get _2446() : Object
      {
         var _loc1_:Object = _1543.clone(super._2446);
         _loc1_.developer_qq = "530077872";
         return _loc1_;
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this._2426();
         this._2441 = _1528.language == _1530.zh_CN;
         if(!SystemInfo.isMacOS && _1528.language == _1530.zh_CN)
         {
            this._2440.setStyle("fontFamily","微软雅黑");
         }
         var _loc1_:Group = new Group();
         if(!SystemInfo.isMacOS && _1528.language == _1530.zh_CN)
         {
            _loc1_.setStyle("fontFamily","微软雅黑");
         }
         _loc1_.top = 20;
         _loc1_.left = 20;
         _loc1_.setStyle("textColor","0xeeeeee");
         this.addElement(_loc1_);
         _2448 = new _1105();
         _2448.source = this.icon;
         _loc1_.addElement(_2448);
         var _loc2_:Label = new Label();
         _loc2_.x = 120;
         _loc2_.text = appName;
         _loc2_.size = 26;
         _loc1_.addElement(_loc2_);
         this._2434 = new Label();
         this._2434.x = 120;
         this._2434.top = 55;
         this._2434.text = tr("AboutWindow.Version",appVersion);
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
         this._2453 = new Group();
         this._2453.left = 20;
         this._2453.top = 160;
         var _loc6_:_1197;
         (_loc6_ = new _1197()).gap = 2;
         this._2453.layout = _loc6_;
         this._2453.setStyle("textColor","0xababab");
         this.addElement(this._2453);
         var _loc7_:Label;
         (_loc7_ = new Label()).text = tr("AboutWindow.TechGroup");
         _loc7_.textColor = 15658734;
         this._2453.addElement(_loc7_);
         this._2432 = new Label();
         this._2432.selectable = true;
         this._2453.addElement(this._2432);
         this._2454 = new Label();
         this._2453.addElement(this._2454);
         this._2431 = new Label();
         this._2453.addElement(this._2431);
         this._2442 = new Group();
         this._2442.left = 20;
         this._2442.top = 280;
         (_loc6_ = new _1197()).gap = 2;
         this._2442.layout = _loc6_;
         this._2442.setStyle("textColor","0xababab");
         this.addElement(this._2442);
         (_loc7_ = new Label()).text = tr("AboutWindow.ContactGroup");
         _loc7_.textColor = 15658734;
         this._2442.addElement(_loc7_);
         this._2442.addElement(this._2455);
         this._2437 = new Label();
         this._2442.addElement(this._2437);
         this._2445 = new Label();
         this._2442.addElement(this._2445);
         this._2444 = new Label();
         this._2442.addElement(this._2444);
         this._2443 = new Label();
         this._2442.addElement(this._2443);
         this._2439 = new Label();
         var _loc8_:Group;
         (_loc8_ = new Group()).left = 380;
         _loc8_.top = 160;
         (_loc6_ = new _1197()).gap = 2;
         _loc8_.layout = _loc6_;
         _loc8_.setStyle("textColor","0xababab");
         this.addElement(_loc8_);
         (_loc7_ = new Label()).text = tr("AboutWindow.BusinessGroup");
         _loc7_.textColor = 15658734;
         _loc8_.addElement(_loc7_);
         this._2428 = new Label();
         _loc8_.addElement(this._2428);
         this._2436 = new Label();
         _loc8_.addElement(this._2436);
         _loc8_._2449();
         this._2435 = new Label();
         this._2435.x = 165;
         this._2435.y = this._2428.y;
         this._2435.includeInLayout = false;
         _loc8_.addElement(this._2435);
         var _loc9_:Group;
         (_loc9_ = new Group()).left = 380;
         _loc9_.top = 250;
         (_loc6_ = new _1197()).gap = 2;
         _loc9_.layout = _loc6_;
         _loc9_.setStyle("textColor","0xababab");
         this.addElement(_loc9_);
         (_loc7_ = new Label()).text = tr("AboutWindow.PromiseGroup");
         _loc7_.textColor = 15658734;
         _loc9_.addElement(_loc7_);
         this._2424 = new Label();
         _loc9_.addElement(this._2424);
         this._2427();
         this._2425();
      }
      
      public function _2425() : void
      {
         if(this._2441)
         {
            this._2455.height = 0;
            this._2442.top = 280;
            this._2433.gap = 2;
            this._2442.layout = this._2433;
         }
         else
         {
            this._2455.height = 5;
            this._2442.top = 250;
            this._2433.gap = -2;
            this._2442.layout = this._2433;
         }
         this._2443.visible = !this._2441;
         this._2443.includeInLayout = !this._2441;
         this._2439.visible = !this._2441;
         this._2439.includeInLayout = !this._2441;
         this._2454.visible = this._2441;
         this._2454.includeInLayout = this._2441;
         this._2432.visible = this._2441;
         this._2432.includeInLayout = this._2441;
      }
      
      protected function _2427() : void
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
         this._2443.htmlText = tr("AboutWindow.Twitter","<font color=\'#00a0f0\'><a href=\"" + this._2451 + "\">" + this._2451 + "</a></font>");
         this._2439.htmlText = tr("AboutWindow.Facebook","<font color=\'#00a0f0\'><a href=\"" + this._2447 + "\">" + this._2447 + "</a></font>");
         this._2424.text = String(_loc1_["service_promise"]).split("\r\n").join("\n").split("\r").join("\n");
      }
      
      override protected function get _2429() : String
      {
         var _loc1_:Array = ["苏魁","flep","段春雷","王旭升","许亮","李小龙","A闪","Dily","黄竣","刘晨光","梁宇鑫","杨金龙","高翔","刘晨","韩海霞","徐娟鑫","李文琳","dom","xzper","featherJ","Joeky Chen","孟涛涛","赵梦莎","王杰","郝海军","魏欣","王建文","杨啸","马鉴","袁博","Jamie Chen","百痴","梁倍铖","柴天瑞","Farhad Shamiev","Valentin Radionov","Станислав Жуков"];
         return _loc1_.join(", ");
      }
   }
}

