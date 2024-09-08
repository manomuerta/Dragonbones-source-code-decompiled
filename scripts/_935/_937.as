package _935
{
   import _1038._1037;
   import _1045.Group;
   import _11254._11255;
   import _1374._1391;
   import _24._26;
   import _639.HotkeysModel;
   import _708._715;
   import _708._716;
   import _877._11511;
   import _953.StageFilterBar;
   import _953._10624;
   import _953._959;
   import _97._125;
   import egret.utils.tr;
   
   public class _937 extends _938
   {
      private static var _6684:String = "/assets/button/pose.png";
      
      private static var _6669:String = "/assets/button/createBone.png";
      
      private static var _6682:String = "/assets/button/meshWeight.png";
      
      private static var _6677:String = "/assets/button/armature.png";
      
      private static var _6676:String = "/assets/button/animation.png";
      
      public var _4895:_1391;
      
      public var _4904:StageFilterBar;
      
      public var _10765:_10624;
      
      public var _11369:_11255;
      
      public var _11651:_11511;
      
      private var g:Group;
      
      private var g2:Group;
      
      private var g3:Group;
      
      private var _6680:_1037;
      
      public function _937()
      {
         this._6680 = new _1037();
         super();
         _6679 = _959;
         var _loc1_:HotkeysModel = HotkeysModel.getInstance();
         _6685.source = [{
            "icon":_6681,
            "toolTip":tr("StagePanel.SelectTool_tooltip",_loc1_._11726(_26.SELECT)),
            "data":_716.SELECT,
            "enabled":true
         },{
            "icon":_6684,
            "toolTip":tr("StagePanel.PoseTool_tooltip",_loc1_._11726(_26.POSE)),
            "data":_716.POSE,
            "enabled":true
         },{
            "icon":_6669,
            "toolTip":tr("StagePanel.CreateBoneTool_tooltip",_loc1_._11726(_26.CREATE_BONE)),
            "data":_716.CREATE_BONE,
            "enabled":true
         },{
            "icon":_6682,
            "toolTip":tr("StagePanel.WeightTool_tooltip",_loc1_._11726(_26.WEIGHT)),
            "data":_716.WEIGHT,
            "enabled":true
         }];
         this._6680.source = [{
            "icon":_6677,
            "label":tr("StagePanel.ArmatureMode"),
            "data":_715.ARMATURE
         },{
            "icon":_6676,
            "label":tr("StagePanel.AnimationMode"),
            "data":_715.ANIMATE
         }];
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this._4895 = new _1391();
         this._4895.height = 25;
         this._4895._6678 = true;
         this._4895.skinName = _936;
         this._4895.dataProvider = this._6680;
         this._4895.left = gap;
         this._4895.top = gap;
         this.addElement(this._4895);
         this._4904 = new StageFilterBar();
         this._4904.bottom = 5;
         this._4904.left = gap;
         this.addElement(this._4904);
         this.g = _125._2397();
         this.g.bottom = 5;
         this.g.left = gap;
         this.g.percentWidth = 100;
         addElement(this.g);
         this._10765 = new _10624();
         this.g.addElement(this._10765);
         this.g2 = _125._2397();
         this.g2.bottom = 5;
         this.g2.left = gap;
         this.g2.percentWidth = 100;
         addElement(this.g2);
         this._11369 = new _11255();
         this.g2.addElement(this._11369);
         this._11369.visible = false;
         this.g3 = _125._2397();
         this.g3.bottom = 5;
         this.g3.left = gap;
         this.g3.percentWidth = 100;
         addElement(this.g3);
         this._11651 = new _11511();
         this.g3.addElement(this._11651);
         this._11651.visible = false;
      }
      
      override public function _14625(param1:int) : void
      {
         super._14625(param1);
         this._4895.left = param1;
         this._4895.top = param1;
         this._4904.left = param1;
         this.g.left = param1;
         this.g2.left = param1;
         this.g3.left = param1;
      }
   }
}

