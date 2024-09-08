package _906
{
   import _1045.Scroller;
   import _1045._1107;
   import _127._156;
   import _13492._13491;
   import _13492._13496;
   import _13492._13499;
   import _1374.IconButton;
   import _24._26;
   import _51._50;
   import _51._52;
   import _51._70;
   import _51._79;
   import _639.HotkeysModel;
   import _658._661;
   import _668._672;
   import _721._763;
   import egret.core._1139;
   import egret.utils.tr;
   
   public class PropertyPanel extends _156
   {
      public static const _14765:int = 75;
      
      private const NONE_INDEX:int = 0;
      
      private const CANVAS_INDEX:int = 1;
      
      private const ARMATURE_INDEX:int = 2;
      
      private const BONE_INDEX:int = 3;
      
      private const SLOT_INDEX:int = 4;
      
      private const DISPLAY_INDEX:int = 5;
      
      private const MAIN_FRAME_INDEX:int = 6;
      
      private const BONE_FRAME_INDEX:int = 7;
      
      private var _4761:_672;
      
      public var _6623:_922;
      
      public var _4405:_905;
      
      public var _4424:_909;
      
      public var _4426:_926;
      
      public var _4419:_910;
      
      public var _4406:_911;
      
      public var _11331:MainFrameProgertyGroup;
      
      public var _11332:BoneFramePropertyGroup;
      
      public var setParentBtn:IconButton;
      
      public var _2565:_1107;
      
      public var _2491:Scroller;
      
      private var _6625:int = -1;
      
      private var _6624:Boolean;
      
      public function PropertyPanel()
      {
         this._4761 = new _672();
         this._6623 = new _922();
         this._4405 = new _905();
         this._4424 = new _909();
         this._4426 = new _926();
         this._4419 = new _910();
         this._4406 = new _911();
         this._11331 = new MainFrameProgertyGroup();
         this._11332 = new BoneFramePropertyGroup();
         this.setParentBtn = new IconButton();
         this._2565 = new _1107();
         this._2491 = new Scroller();
         super();
         this.title = tr("Property.title");
         this.icon = "/assets/panel/property.png";
         this._2565.addElement(this._6623);
         this._2565.addElement(this._4419);
         this._2565.addElement(this._4405);
         this._2565.addElement(this._4424);
         this._2565.addElement(this._4426);
         this._2565.addElement(this._4406);
         this._2565.addElement(this._11331);
         this._2565.addElement(this._11332);
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this._6624 = true;
         this.addElement(this._2565);
         this.percentHeight = 100;
         this.percentWidth = 100;
         this._2565.percentHeight = 100;
         this._2565.selectedIndex = this.NONE_INDEX;
         this.addElement(this._2491);
         this._2491.right = 10;
         this._2491.left = 10;
         this._2491.top = 10;
         this._2491.bottom = 10;
         this._2491._6182 = _1139.AUTO;
         this._2491.viewport = this._2565;
         this._2491.percentHeight = 100;
         if(this._6625 > 0)
         {
            this._2565.selectedIndex = this._6625;
         }
         var _loc1_:HotkeysModel = HotkeysModel.getInstance();
         this.setParentBtn.icon = "/assets/button/setParent.png";
         this.setParentBtn.toolTip = tr("ScenePanel.setParentBtn.tooltip",_loc1_._11726(_26.SET_PARENT));
         _2527.addElement(this.setParentBtn);
      }
      
      public function _3024() : void
      {
         if(this._2565)
         {
            if(!this._6624)
            {
               this._6625 = this.NONE_INDEX;
            }
            this._2565.selectedIndex = this.NONE_INDEX;
         }
      }
      
      public function _4417(param1:_50, param2:_763 = null) : void
      {
         this._4761._1886 = param1;
         this._4761._2000 = param2;
         this._4405.model = this._4761;
         if(this._2565)
         {
            if(!this._6624)
            {
               this._6625 = this.ARMATURE_INDEX;
            }
            this._2565.selectedIndex = this.ARMATURE_INDEX;
         }
      }
      
      public function _11325(param1:_50, param2:_13491) : void
      {
         this._4761._1886 = param1;
         this._4761._2000 = null;
         this._4761._13803 = param2;
         this._4405.model = this._4761;
         if(this._2565)
         {
            if(!this._6624)
            {
               this._6625 = this.MAIN_FRAME_INDEX;
            }
            this._2565.selectedIndex = this.MAIN_FRAME_INDEX;
            this._11331.refresh();
         }
      }
      
      public function _4427(param1:_763) : void
      {
         this._4761._2000 = param1;
         this._4419.model = this._4761;
         if(!this._6624)
         {
            this._6625 = this.CANVAS_INDEX;
         }
         this._2565.selectedIndex = this.CANVAS_INDEX;
      }
      
      public function _3453(param1:_13496) : void
      {
         if(param1 == null || !(param1 is _13499) || param1.duration <= 0)
         {
            this._4761._1946 = null;
            return;
         }
         this._4761._1946 = param1;
         if(param1 is _13499)
         {
            if(!this._6624)
            {
               this._6625 = this.BONE_FRAME_INDEX;
            }
            this._2565.selectedIndex = this.BONE_FRAME_INDEX;
            this._11332.refresh();
         }
         else
         {
            if(!this._6624)
            {
               this._6625 = this.MAIN_FRAME_INDEX;
            }
            this._2565.selectedIndex = this.MAIN_FRAME_INDEX;
            this._11331.refresh();
         }
      }
      
      public function _4435(param1:Array) : void
      {
         this._4761._4445 = param1;
         this._4424.model = this._4761;
         if(!this._6624)
         {
            this._6625 = this.BONE_INDEX;
         }
         this._2565.selectedIndex = this.BONE_INDEX;
      }
      
      public function _4434(param1:_79, param2:Boolean = false) : void
      {
         this._4761._1837 = param1;
         this._4761.displayVO = null;
         this._4426._2713 = param2;
         this._4426.model = this._4761;
         if(!this._6624)
         {
            this._6625 = this.SLOT_INDEX;
         }
         this._2565.selectedIndex = this.SLOT_INDEX;
      }
      
      public function _4420(param1:_70) : void
      {
         this._4761.displayVO = param1;
         this._4406.model = this._4761;
         if(!this._6624)
         {
            this._6625 = this.DISPLAY_INDEX;
         }
         this._2565.selectedIndex = this.DISPLAY_INDEX;
      }
      
      public function _13276(param1:_50) : void
      {
         this._4417(param1);
      }
      
      public function get model() : _672
      {
         return this._4761;
      }
      
      public function _3834() : void
      {
         this._4406._3834();
         this._4426._3834();
      }
      
      public function _4358(param1:_661) : void
      {
         this._4761._4358 = param1;
         this._4406._4358(param1);
         this._4426._4358(param1);
      }
      
      public function _4395(param1:_52) : void
      {
         this._4761._4395 = param1;
         this._4406._4395(param1);
         this._4426._4395(param1);
      }
      
      public function _4416(param1:Boolean) : void
      {
         this._4406._4416(param1);
         this._4426._4416(param1);
      }
   }
}

