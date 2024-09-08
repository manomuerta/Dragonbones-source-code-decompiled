package _953
{
   import _1033._13223;
   import _1033._13567;
   import _1045.Group;
   import _1045._1082;
   import _1045._1105;
   import _1185._1189;
   import _1185._1196;
   import _1185._1197;
   import _24._26;
   import _639.HotkeysModel;
   import _755._760;
   import _822._829;
   import _834._837;
   import _97._125;
   import egret.utils.tr;
   
   public class StageFilterBar extends Group
   {
      public static const STROKE_COLOR:uint = 1777701;
      
      public static const FILL_COLOR:uint = 2238766;
      
      public static const ALPHA:Number = 1;
      
      public var _4845:_829;
      
      public var _4843:_829;
      
      public var _6767:_1105;
      
      public var _4842:_829;
      
      public var _4841:_829;
      
      public var _6765:_1105;
      
      public var _4840:_829;
      
      public var _4839:_829;
      
      public var _6766:_1105;
      
      private var _6770:_1105;
      
      private var _6518:_1105;
      
      private var _6769:_1105;
      
      private var _2558:_1082;
      
      private var _6768:_760;
      
      private var _6771:int = 50;
      
      private var _6772:int = 24;
      
      private var _6773:int = 15;
      
      private var _6774:int = 18;
      
      private var _6775:int = 24;
      
      private var _2361:int = 100;
      
      private var _h:int = 53;
      
      public function StageFilterBar()
      {
         this._4845 = new _829();
         this._4843 = new _829();
         this._4842 = new _829();
         this._4841 = new _829();
         this._4840 = new _829();
         this._4839 = new _829();
         super();
      }
      
      override protected function _2438() : void
      {
         var _loc23_:_13567 = null;
         var _loc24_:_13223 = null;
         super._2438();
         this._2558 = new _1082();
         this._2558.radius = 5;
         this._2558._2563 = STROKE_COLOR;
         this._2558._2562 = 1;
         this._2558._2564 = 1;
         this._2558.fillColor = FILL_COLOR;
         this._2558.alpha = ALPHA;
         this._2558.width = this._2361;
         this._2558.height = this._h;
         addElement(this._2558);
         var _loc1_:int = 0;
         while(_loc1_ < 2)
         {
            (_loc23_ = new _13567()).y = (_loc1_ + 1) * 16 + _loc1_ * 2;
            addElement(_loc23_);
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < 3)
         {
            (_loc24_ = new _13223(0)).height = this._h;
            _loc24_.x = (_loc1_ + 1) * 24 + _loc1_ * 2 - _loc1_;
            addElement(_loc24_);
            _loc1_++;
         }
         var _loc2_:Group = new Group();
         var _loc3_:_1197 = new _1197();
         _loc3_.gap = 2;
         _loc2_.layout = _loc3_;
         var _loc4_:Group = new Group();
         var _loc5_:_1189;
         (_loc5_ = new _1189()).verticalAlign = _1196.MIDDLE;
         _loc5_.gap = 2;
         _loc4_.layout = _loc5_;
         var _loc6_:Group = this._13983(24,16);
         var _loc7_:Group = this._13983(23,16,"/assets/stageIcon/visible1.png","StageFilterBar.visible_tip");
         var _loc8_:Group = this._13983(23,16,"/assets/stageIcon/selectable1.png","StageFilterBar.selectable_tip");
         var _loc9_:Group = this._13983(24,16,"/assets/stageIcon/control.png","StageFilterBar.inherite_tip");
         _loc4_.addElement(_loc6_);
         _loc4_.addElement(_loc7_);
         _loc4_.addElement(_loc8_);
         _loc4_.addElement(_loc9_);
         var _loc10_:HotkeysModel = HotkeysModel.getInstance();
         var _loc11_:Group = new Group();
         var _loc12_:_1189;
         (_loc12_ = new _1189()).verticalAlign = _1196.MIDDLE;
         _loc12_.gap = 2;
         _loc11_.layout = _loc12_;
         var _loc13_:Group = this._13983(24,16,"/assets/stageIcon/bone.png");
         this._4845.skinName = _837;
         this._4845.data = {
            "icon":"/assets/timeline/timeline_eye2",
            "target":"bone",
            "type":"visible"
         };
         this._4845.toolTip = tr("StageFilterBar.bone_visible_tip",_loc10_._11726(_26.SHOW_BONES));
         var _loc14_:Group = this._13984(23,16,this._4845);
         this._4842.skinName = _837;
         this._4842.data = {
            "icon":"/assets/timeline/timeline_eye2",
            "target":"bone",
            "type":"selectable"
         };
         this._4842.toolTip = tr("StageFilterBar.bone_selectable_tip");
         var _loc15_:Group = this._13984(23,16,this._4842);
         this._4840.skinName = _837;
         this._4840.data = {
            "icon":"/assets/timeline/timeline_eye2",
            "target":"bone",
            "type":"selectable"
         };
         this._4840.toolTip = tr("StageFilterBar.bone_inherite_tip");
         var _loc16_:Group = this._13984(24,16,this._4840);
         _loc11_.addElement(_loc13_);
         _loc11_.addElement(_loc14_);
         _loc11_.addElement(_loc15_);
         _loc11_.addElement(_loc16_);
         var _loc17_:Group = new Group();
         var _loc18_:_1189;
         (_loc18_ = new _1189()).verticalAlign = _1196.MIDDLE;
         _loc18_.gap = 2;
         _loc17_.layout = _loc18_;
         var _loc19_:Group = this._13983(24,16,"/assets/stageIcon/image.png");
         this._4843.skinName = _837;
         this._4843.data = {
            "icon":"/assets/timeline/timeline_eye2",
            "target":"image",
            "type":"visible"
         };
         this._4843.toolTip = tr("StageFilterBar.image_visible_tip",_loc10_._11726(_26.SHOW_IMAGES));
         var _loc20_:Group = this._13984(23,16,this._4843);
         this._4841.skinName = _837;
         this._4841.data = {
            "icon":"/assets/timeline/timeline_eye2",
            "target":"image",
            "type":"selectable"
         };
         this._4841.toolTip = tr("StageFilterBar.image_selectable_tip");
         var _loc21_:Group = this._13984(23,16,this._4841);
         this._4839.skinName = _837;
         this._4839.data = {
            "icon":"/assets/timeline/timeline_eye2",
            "target":"image",
            "type":"selectable"
         };
         this._4839.toolTip = tr("StageFilterBar.image_inherite_tip");
         var _loc22_:Group = this._13984(24,16,this._4839);
         _loc17_.addElement(_loc19_);
         _loc17_.addElement(_loc20_);
         _loc17_.addElement(_loc21_);
         _loc17_.addElement(_loc22_);
         _loc2_.addElement(_loc4_);
         _loc2_.addElement(_loc11_);
         _loc2_.addElement(_loc17_);
         addElement(_loc2_);
      }
      
      private function _13984(param1:int, param2:int, param3:_829) : Group
      {
         var _loc4_:Group;
         (_loc4_ = _125._2397(0)).width = param1;
         _loc4_.height = param2;
         _loc4_.addElement(param3);
         return _loc4_;
      }
      
      private function _13983(param1:int, param2:int, param3:String = null, param4:String = null) : Group
      {
         var _loc5_:Group;
         (_loc5_ = _125._2397(0)).width = param1;
         _loc5_.height = param2;
         var _loc6_:_1105;
         (_loc6_ = new _1105(param3)).alpha = 0.6;
         _loc6_._2449();
         if(param4)
         {
            _loc6_.toolTip = tr(param4);
         }
         _loc5_.addElement(_loc6_);
         return _loc5_;
      }
      
      public function _3095() : void
      {
         this._4845.selected = this._6768.visibleFilter.bone;
         this._4843.selected = this._6768.visibleFilter.image;
         this._4842.selected = this._6768.selectableFilter.bone;
         this._4841.selected = this._6768.selectableFilter.image;
      }
      
      public function get _3286() : _760
      {
         return this._6768;
      }
      
      public function set _3286(param1:_760) : void
      {
         if(this._6768 == param1)
         {
            return;
         }
         this._6768 = param1;
         this._3095();
      }
   }
}

