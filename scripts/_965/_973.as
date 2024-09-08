package _965
{
   import _1045.Group;
   import _1045.Label;
   import _1045.Tree;
   import _1045._1082;
   import _1045._1084;
   import _1045._1105;
   import _1185._1188;
   import _1185._1189;
   import _1185._1197;
   import _127._130;
   import _1374.IconButton;
   import _822._10262;
   import _834._836;
   import _97._100;
   import _978.Timeline;
   import _978._13565;
   import _978._13566;
   import _978._979;
   import _978._982;
   import _978._983;
   import _978._984;
   import _978._985;
   import _978._987;
   import _978._988;
   import _978._991;
   import _978._992;
   import egret.utils.tr;
   
   public class _973 extends _1084
   {
      public var _2440:Group;
      
      public var _6799:IconButton;
      
      public var _6800:IconButton;
      
      public var _2513:Group;
      
      public var _6794:_130;
      
      public var _11174:_985;
      
      public var _4714:_988;
      
      public var _4760:_992;
      
      public var _13845:_13565;
      
      public var _13843:_13565;
      
      public var _13992:_13566;
      
      public var _4552:_979;
      
      public var _4569:Tree;
      
      public var _4551:Tree;
      
      public var _6795:_1082;
      
      public var _6797:_987;
      
      public var _4740:_991;
      
      public var _11173:Label;
      
      public var _6943:_10262;
      
      public var _6941:_10262;
      
      public function _973()
      {
         super();
      }
      
      override protected function _2438() : void
      {
         var _loc1_:Group = null;
         super._2438();
         _loc1_ = new Group();
         var _loc2_:_1197 = new _1197();
         _loc2_.gap = 0;
         _loc1_.layout = _loc2_;
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         this.addElement(_loc1_);
         this._2440 = new Group();
         this._2440.percentHeight = 100;
         this._2440.percentWidth = 100;
         _loc1_.addElement(this._2440);
         this._6799 = new IconButton();
         this._6799 = new IconButton();
         this._6800 = new IconButton();
         this._2513 = new Group();
         this._6794 = new _130();
         this._11174 = new _985();
         this._4714 = new _988();
         this._4760 = new _992();
         this._13845 = new _13565(true);
         this._13843 = new _13565(false);
         this._13992 = new _13566();
         this._4552 = new _979();
         this._4569 = new Tree();
         this._4551 = new Tree();
         this._6795 = new _1082();
         this._6797 = new _987();
         this._4740 = new _991();
         this._4569._6056 = true;
         this._4569.right = 0;
         this._4569.left = Timeline.FRAME_NAME_WIDTH;
         this._4569.itemRenderer = _984;
         this._4551.percentWidth = 100;
         this._4551.itemRenderer = _983;
         this._6795.fillColor = _100.LAST_FRAME_COLOR;
         this._6795.width = 1;
         this._6795.height = 100;
         this._4760.x = this._4714.x + this._4714._6796(this._4760.curFrame);
         this._4760.y = 10;
         this._13845.y = 10;
         this._13843.y = 10;
         this._6797.right = 0;
         this._6797.left = Timeline.FRAME_NAME_WIDTH + Timeline.LABEL_GAP;
         this._4552._6056 = true;
         this._4552._3854 = true;
         this._4552.percentWidth = 100;
         this._4552.percentHeight = 100;
         this._4552.itemRenderer = _982;
         this._4552._5987 = "name";
         this._4552.left = 0;
         this._4552.right = 0;
         this._4552.height = 100;
         this._6799.icon = Timeline.COLLAPSE_IOCN;
         this._6799.toolTip = tr("Timeline.collapse");
         this._6799.y = Timeline.TOP_GAP;
         this._6799.x = Timeline.LEFT_GAP;
         this._6800.icon = Timeline.EXPAND_ICON;
         this._6800.toolTip = tr("Timeline.expand");
         this._6800.x = Timeline.LEFT_GAP + 24;
         this._6800.y = Timeline.TOP_GAP;
         this._2513.layout = new _1189();
         (this._2513.layout as _1189).gap = 2;
         (this._2513.layout as _1189)._2401 = _1188.RIGHT;
         this._2513.width = Timeline.FRAME_NAME_WIDTH - 46;
         this._2513.x = Timeline.LEFT_GAP;
         this._2513.y = Timeline.TOP_GAP;
         addElement(this._2513);
         var _loc3_:_1105 = new _1105(Timeline.ICON_ANIMATION);
         _loc3_.x = 20;
         _loc3_.y = Timeline.LABEL_HEIGHT - 22;
         addElement(_loc3_);
         this._11173 = new Label();
         this._11173._6541 = true;
         this._11173.text = "";
         this._6943 = new _10262();
         this._6941 = new _10262();
         this._6943.skinName = _836;
         this._6941.skinName = _836;
         this._6943.data = {"icon":"/assets/panelIcon/eye2"};
         this._6941.data = {"icon":"/assets/panelIcon/lock2"};
         this._11173.x = _loc3_.x + 22;
         this._11173.y = Timeline.LABEL_HEIGHT - 22;
         this._6943.y = this._11173.y - 4;
         this._6941.y = this._11173.y - 4;
         this._6943.x = 162;
         this._6941.x = this._6943.x + 24;
         addElement(this._11173);
         addElement(this._6943);
         addElement(this._6941);
      }
   }
}

