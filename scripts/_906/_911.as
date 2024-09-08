package _906
{
   import _1038._1037;
   import _1045.Button;
   import _1045.DropDownList;
   import _1045.Group;
   import _1045.Label;
   import _1045.ToggleButton;
   import _1177.UIEvent;
   import _1185._1197;
   import _127._11223;
   import _127._128;
   import _13505._13507;
   import _13505._13508;
   import _1374.ColorPicker;
   import _1374.IconButton;
   import _1374.TextInput;
   import _51._50;
   import _51._52;
   import _51._70;
   import _51._79;
   import _521._522;
   import _6.Context;
   import _636.AnimationEvent;
   import _636.BoundingBoxEvent;
   import _636.DBPanelEvent;
   import _636.MeshEvent;
   import _658._661;
   import _668._672;
   import _724._14085;
   import _724._14087;
   import _724._726;
   import _73.SymbolType;
   import _73._74;
   import _97._125;
   import _978._13564;
   import egret.utils.tr;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextFormatAlign;
   
   public class _911 extends Group
   {
      private static var _6553:String = "/assets/panelIcon/change2Mesh.png";
      
      private static var _6551:String = "/assets/panelIcon/change2Image.png";
      
      private static var _10512:String = "/assets/panelIcon/swapImage.png";
      
      public var _14773:Label;
      
      public var _4444:Label;
      
      public var _6195:Label;
      
      public var _6554:IconButton;
      
      public var _6552:IconButton;
      
      public var _10513:IconButton;
      
      public var _6564:ToggleButton;
      
      public var _6563:Button;
      
      public var _6559:_128;
      
      public var _6496:DropDownList;
      
      public var _6558:TextInput;
      
      public var _14025:_13564;
      
      public var _6570:Label;
      
      private var _4761:_672;
      
      private var _6566:Boolean;
      
      private var _6565:Group;
      
      private var _14029:Group;
      
      private var _14030:Label;
      
      private var _14031:_13564;
      
      private var _11445:Group;
      
      private var _type:_74;
      
      private var _6560:Boolean;
      
      private var _6191:Group;
      
      private var _6569:Boolean;
      
      private var _6557:Group;
      
      private var _6495:_1037;
      
      private var _6561:_921;
      
      private var _6555:Boolean;
      
      private var _12738:Group;
      
      public var _11451:ToggleButton;
      
      public var _11448:Button;
      
      public var _11453:ColorPicker;
      
      public var _12737:Button;
      
      public var checkMesh:_128;
      
      private var _13977:int;
      
      private var _14772:Group;
      
      public function _911()
      {
         this.DISPLAY_NONE = {};
         this._14773 = new Label();
         this._4444 = new Label();
         this._6195 = new Label();
         this._6559 = new _128();
         this._6496 = new DropDownList();
         this._6558 = new TextInput();
         this._14025 = new _13564();
         this._14030 = new Label();
         this._14031 = new _13564();
         this._6495 = new _1037();
         super();
      }
      
      override protected function _2438() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:Label = null;
         super._2438();
         _loc1_ = 36;
         this.layout = new _1197();
         this.percentWidth = 100;
         this.percentHeight = 100;
         _loc2_ = PropertyPanel._14765;
         this._14772 = _125._2414();
         this._14772.percentWidth = 100;
         _loc3_ = new Label();
         _loc3_.textAlign = TextFormatAlign.RIGHT;
         _loc3_.text = tr("Property.name");
         _loc3_.width = _loc2_;
         this._14773.percentWidth = 100;
         this._14773.height = 16;
         this._14773._6541 = true;
         this._14772.addElement(_loc3_);
         this._14772.addElement(this._14773);
         addElement(this._14772);
         this._6191 = _125._2414();
         this._6191.percentWidth = 100;
         _loc3_ = new Label();
         _loc3_.textAlign = TextFormatAlign.RIGHT;
         _loc3_.text = tr("Property.asset");
         _loc3_.width = _loc2_;
         this._4444.percentWidth = 100;
         this._4444.height = 16;
         this._4444._6541 = true;
         this._6191.addElement(_loc3_);
         this._6191.addElement(this._4444);
         addElement(this._6191);
         this._12738 = _125._2414();
         this._12738.percentWidth = 100;
         var _loc4_:Label;
         (_loc4_ = new Label()).textAlign = TextFormatAlign.RIGHT;
         _loc4_.text = tr("Property.type");
         _loc4_.width = _loc2_;
         this._6195.percentWidth = 100;
         this._6195.height = 16;
         this._6195._6541 = true;
         this._12738.addElement(_loc4_);
         this._12738.addElement(this._6195);
         addElement(this._12738);
         if(this._6569)
         {
            this._12738.visible = false;
            this._12738.includeInLayout = false;
         }
         this._6554 = new IconButton();
         this._6554.icon = _6553;
         this._6554.toolTip = tr("Property.display.change2Mesh");
         this._6552 = new IconButton();
         this._6552.icon = _6551;
         this._6552.toolTip = tr("Property.display.change2Image");
         this._6552.right = 0;
         this._6554.right = 0;
         this._10513 = new IconButton();
         this._10513.icon = _10512;
         this._10513.toolTip = tr("Property.display.changeAsset");
         this._10513.right = 0;
         var _loc5_:Group = new Group();
         _loc5_.addElement(this._6552);
         _loc5_.addElement(this._6554);
         this._12737 = new Button();
         this._12737.left = _loc1_;
         this._12737.percentWidth = 100;
         this._12737.label = tr("Property.display.changeAsset");
         var _loc6_:Group;
         (_loc6_ = new Group()).percentWidth = 100;
         _loc6_.addElement(this._12737);
         addElement(_loc6_);
         this.checkMesh = new _128();
         this.checkMesh.label = tr("Property.display.MeshType");
         this.checkMesh.left = _loc1_ - 16;
         var _loc7_:Group;
         (_loc7_ = new Group()).percentWidth = 100;
         _loc7_.addElement(this.checkMesh);
         addElement(_loc7_);
         this._6565 = _125._2397();
         this._6565.left = _loc1_;
         this._6565.percentWidth = 100;
         this._6564 = new ToggleButton();
         this._6564.skinName = _11223;
         this._6564.label = tr("Mesh.property.edit");
         this._6564.percentWidth = 100;
         this._6563 = new Button();
         this._6563.label = tr("Mesh.property.reset");
         this._6563.percentWidth = 100;
         var _loc8_:Group;
         (_loc8_ = new Group()).width = _loc1_ - 6;
         this._6565.addElement(_loc8_);
         this._6565.addElement(this._6564);
         this._6565.addElement(this._6563);
         addElement(this._6565);
         this._14029 = _125._2397();
         this._14029.left = _loc1_;
         this._14029.percentWidth = 100;
         this._14030.text = tr("Mesh.property.ffd");
         this._14030.percentWidth = 100;
         var _loc9_:Group;
         (_loc9_ = new Group()).width = _loc1_ - 6;
         this._14029.addElement(_loc9_);
         this._14029.addElement(this._14030);
         this._14029.addElement(this._14031);
         addElement(this._14029);
         this._6561 = new _921();
         addElement(this._6561);
         this._11445 = _125._2397();
         this._11445.percentWidth = 100;
         this._11451 = new ToggleButton();
         this._11451.percentWidth = 100;
         this._11451.skinName = _11223;
         this._11451.label = tr("BoundingBox.property.edit");
         this._11448 = new Button();
         this._11448.percentWidth = 100;
         this._11448.label = tr("BoundingBox.property.freeze");
         this._11453 = new ColorPicker();
         var _loc10_:Group;
         (_loc10_ = new Group()).width = _loc1_ - 6;
         this._11445.addElement(_loc10_);
         this._11445.addElement(this._11451);
         this._11445.addElement(this._11448);
         this._11451.addEventListener(MouseEvent.CLICK,this._11452);
         this._11448.addEventListener(MouseEvent.CLICK,this._11450);
         this._11453.addEventListener(Event.CHANGE,this._4052);
         this._11453.addEventListener(UIEvent.CONFIRM,this._11446);
         this._11453.addEventListener(Event.CANCEL,this._11447);
         this._11453.addEventListener(Event.CLEAR,this._11449);
         this._11453.visible = false;
         addElement(this._11445);
         this._12737.addEventListener(MouseEvent.CLICK,this._10509);
         this._6554.addEventListener(MouseEvent.CLICK,this._4413);
         this._6552.addEventListener(MouseEvent.CLICK,this._4407);
         this._6564.addEventListener(MouseEvent.CLICK,this._6567);
         this._6563.addEventListener(MouseEvent.CLICK,this._6568);
         this.checkMesh.addEventListener(Event.CHANGE,this._12736);
         this._6557 = _125._2414();
         this._6557.percentWidth = 100;
         var _loc11_:Group;
         (_loc11_ = _125._2414()).percentWidth = 100;
         this._6558.enabled = false;
         this._6558.percentWidth = 100;
         this._6570 = new Label();
         this._6570.textAlign = TextFormatAlign.RIGHT;
         this._6570.text = tr("Property.armature.defaultAnimation");
         this._6570.width = _loc2_;
         _loc11_.addElement(this._6570);
         this._6496.percentWidth = 100;
         this._6496._6146 = this._6497;
         this._6496.addEventListener(Event.CHANGE,this._6494);
         this._6559.addEventListener(Event.CHANGE,this._6562);
         this._6496._3854 = false;
         _loc11_.addElement(this._6559);
         _loc11_.addElement(this._6496);
         _loc11_.addElement(this._6558);
         _loc11_.addElement(this._14025);
         this._6557.addElement(_loc11_);
         addElement(this._6557);
         addEventListener(UIEvent.CREATION_COMPLETE,this.onComplete);
         this._6552.enabled = !this._6555;
         this._6564.enabled = !this._6555;
         this._6563.enabled = !this._6555;
         this._14025.addEventListener(MouseEvent.CLICK,this._14024);
         this._14031.addEventListener(MouseEvent.CLICK,this._14026);
         this._13801(this._13977);
      }
      
      private function _14024(param1:MouseEvent) : void
      {
         dispatchEvent(new AnimationEvent(AnimationEvent.KEY_GOTO,null,true));
      }
      
      private function _14026(param1:MouseEvent) : void
      {
         dispatchEvent(new AnimationEvent(AnimationEvent.KEY_FFD,null,true));
      }
      
      private function _6562(param1:Event) : void
      {
         var _loc2_:String = this._6496._2484 as String;
         if(!this._6559.selected)
         {
            _loc2_ = null;
         }
         dispatchEvent(new AnimationEvent(AnimationEvent.MODIFY_ARMATURE_ANIMATION,_loc2_,true));
      }
      
      private function _6494(param1:Event) : void
      {
         var _loc2_:String = this._6496._2484 as String;
         dispatchEvent(new AnimationEvent(AnimationEvent.MODIFY_ARMATURE_ANIMATION,_loc2_,true));
      }
      
      private function _6497(param1:Object) : String
      {
         var _loc2_:_70 = null;
         var _loc3_:_50 = null;
         if(Boolean(this._4761) && Boolean(this._4761.displayVO))
         {
            _loc2_ = this._4761.displayVO;
            _loc3_ = _loc2_._2107();
            if(Boolean(_loc3_) && Boolean(_loc3_._13656(param1 as String)))
            {
               return param1 as String;
            }
         }
         return tr("Property.display.empty");
      }
      
      private function _10509(param1:MouseEvent) : void
      {
         dispatchEvent(new DBPanelEvent(DBPanelEvent.CHANGE_ASSET));
      }
      
      private function _12736(param1:Event) : void
      {
         if(this.checkMesh.selected)
         {
            dispatchEvent(new MeshEvent(MeshEvent.CHANGE_TO_MESH,null,true));
         }
         else
         {
            dispatchEvent(new MeshEvent(MeshEvent.CHANGE_TO_IMAGE,null,true));
         }
      }
      
      private function _4413(param1:MouseEvent) : void
      {
         dispatchEvent(new MeshEvent(MeshEvent.CHANGE_TO_MESH,null,true));
      }
      
      private function _4407(param1:MouseEvent) : void
      {
         dispatchEvent(new MeshEvent(MeshEvent.CHANGE_TO_IMAGE,null,true));
      }
      
      private function _6567(param1:MouseEvent) : void
      {
         dispatchEvent(new MeshEvent(MeshEvent.EDIT_UV,null,true));
      }
      
      private function _6568(param1:MouseEvent) : void
      {
         dispatchEvent(new MeshEvent(MeshEvent.MESH_RESET,null,true));
      }
      
      private function onComplete(param1:UIEvent) : void
      {
         removeEventListener(UIEvent.CREATION_COMPLETE,this.onComplete);
         this._2894();
      }
      
      public function _6556() : String
      {
         if(Boolean(this._4761) && Boolean(this._4761.displayVO))
         {
            switch(this._4761.displayVO.type)
            {
               case _74.MESH:
                  return tr("Property.display.MeshType");
               case _74.ARMATURE:
                  return tr("Property.display.ArmatureType");
               case _74.IMAGE:
                  return tr("Property.display.ImageType");
               case _74.BOUNDINGBOX:
                  return tr("Property.display.BoundingBoxType");
            }
         }
         return "";
      }
      
      private function _2894() : void
      {
         var _loc1_:Array = null;
         var _loc2_:_50 = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:_79 = null;
         var _loc6_:* = false;
         this._6565.visible = false;
         this._6565.includeInLayout = false;
         this._14029.visible = this._14029.includeInLayout = false;
         this._6552.visible = false;
         this._6552.includeInLayout = false;
         this._6554.visible = false;
         this._6554.includeInLayout = false;
         this._6557.visible = false;
         this._6557.includeInLayout = false;
         this._6561.visible = false;
         this._6561.includeInLayout = false;
         this._11445.visible = false;
         this._11445.includeInLayout = false;
         this._12737.visible = false;
         this._12737.includeInLayout = false;
         this.checkMesh.visible = false;
         this.checkMesh.includeInLayout = false;
         if(this._6569)
         {
            this._12738.visible = false;
            this._12738.includeInLayout = false;
         }
         if(this._4761.displayVO == null)
         {
            return;
         }
         this._10513.visible = true;
         switch(this._4761.displayVO.type)
         {
            case _74.IMAGE:
               this._6195.text = tr("Property.display.ImageType");
               if(this._6560 && this._4761 && Boolean(this._4761.displayVO))
               {
                  if(!(this._4761.displayVO._2104 is _726) && !(this._4761.displayVO._2104 is _14085) && !(this._4761.displayVO._2104 is _14087))
                  {
                     this._6565.visible = true;
                     this._6565.includeInLayout = true;
                     this._6564.enabled = false;
                     this._6563.enabled = false;
                     this._6554.visible = true;
                     this._6554.includeInLayout = true;
                     this._12737.visible = true;
                     this._12737.includeInLayout = true;
                     this.checkMesh.visible = true;
                     this.checkMesh.includeInLayout = true;
                     this.checkMesh.selected = false;
                     this._6561.meshRig = null;
                     this._6561.visible = true;
                     this._6561.includeInLayout = true;
                     this._6561.model = this._4761;
                  }
               }
               break;
            case _74.MESH:
               this._6195.text = tr("Property.display.MeshType");
               if(this._6560)
               {
                  this._6565.visible = true;
                  this._6565.includeInLayout = true;
                  this._6564.enabled = true;
                  this._6563.enabled = true;
                  this._6552.visible = true;
                  this._6552.includeInLayout = true;
                  this._12737.visible = true;
                  this._12737.includeInLayout = true;
                  this.checkMesh.visible = true;
                  this.checkMesh.includeInLayout = true;
                  this.checkMesh.selected = true;
               }
               else
               {
                  this._14029.visible = this._14029.includeInLayout = true;
               }
               if(this._4761.displayVO.mesh)
               {
                  this._6561.meshRig = this._4761.displayVO.mesh.meshRig;
                  this._6561.visible = true;
                  this._6561.includeInLayout = true;
                  this._6561.model = this._4761;
               }
               this._6564.selected = this._4761._11623;
               break;
            case _74.ARMATURE:
               this._6195.text = tr("Property.display.ArmatureType");
               this._10513.visible = false;
               _loc1_ = [];
               _loc2_ = this._4761.displayVO._2107();
               if(_loc2_)
               {
                  _loc3_ = 0;
                  _loc4_ = int(_loc2_._13619.length);
                  while(_loc3_ < _loc4_)
                  {
                     _loc1_.push(_loc2_._13619[_loc3_].name);
                     _loc3_++;
                  }
                  if(_loc2_._1811 == SymbolType.MC)
                  {
                     this._6195.text = tr("Property.display.MovieClipType");
                  }
                  this._6495.source = _loc1_;
                  this._6496.dataProvider = this._6495;
                  this._6557.visible = _loc1_.length > 0;
                  this._6557.includeInLayout = _loc1_.length > 0;
                  if(this._6560)
                  {
                     this._6570.text = tr("Property.armature.defaultAnimation");
                  }
                  else
                  {
                     this._6570.text = tr("Property.armature.currentAnimation");
                  }
                  _loc5_ = this._4761.displayVO._1760;
                  if(_loc5_)
                  {
                     _loc6_ = _loc5_.currentAnimation != null;
                     this._6496.includeInLayout = this._6496.visible = this._6559.selected = _loc6_;
                     this._6558.includeInLayout = this._6558.visible = !_loc6_;
                     if(!_loc6_)
                     {
                        this._6558.text = _loc5_._2158;
                     }
                     if(Boolean(_loc5_) && _loc1_.indexOf(_loc5_._2158) != -1)
                     {
                        this._6496._2484 = _loc5_._2158;
                     }
                     else
                     {
                        this._6496._2484 = _loc2_.defaultAnimation;
                     }
                  }
               }
               this._12738.visible = true;
               this._12738.includeInLayout = true;
               break;
            case _74.BOUNDINGBOX:
               this._6195.text = tr("Property.display.BoundingBoxType");
               this._10513.visible = false;
               if(this._6560)
               {
                  this._11445.visible = true;
                  this._11445.includeInLayout = true;
                  this._10513.visible = false;
                  this._11453._4061 = this._4761.displayVO._11278.color;
                  if(this._4761.displayVO && this._4761.displayVO._1760 && this._4761.displayVO._1760._2049 == this._4761.displayVO)
                  {
                     this._11451.enabled = true;
                     this._11448.enabled = true;
                  }
                  else
                  {
                     this._11451.enabled = false;
                     this._11448.enabled = false;
                  }
                  this._11451.selected = this.model._11330;
               }
               else
               {
                  this._11445.visible = false;
                  this._11445.includeInLayout = false;
               }
               this._12738.visible = true;
               this._12738.includeInLayout = true;
         }
         this._13801(this._13977);
      }
      
      public function _13801(param1:int) : void
      {
         var _loc2_:_13508 = null;
         var _loc3_:_13507 = null;
         this._13977 = param1;
         if(this._14025 == null)
         {
            return;
         }
         if(this._6560 && this._13977 >= 0)
         {
            this._14025.state = _13564.STATE_DISABLE;
            this._14031.state = _13564.STATE_DISABLE;
         }
         else if(Boolean(this._4761) && Boolean(this._4761._1837))
         {
            _loc2_ = this._4761._1837._1903;
            if(_loc2_)
            {
               if(this._2209._14017(this._4761._1837))
               {
                  this._14025.state = _13564.STATE_CACHE;
               }
               else if(_loc2_._13572.getFrameByIndex(param1))
               {
                  this._14025.state = _13564.STATE_KEY;
               }
               else
               {
                  this._14025.state = _13564.STATE_NORMAL;
               }
            }
            if(Boolean(this._4761.displayVO) && this._4761.displayVO._2165)
            {
               _loc3_ = this._4761.displayVO._1903;
               if(_loc3_)
               {
                  if(this._2209._3773(this._4761.displayVO))
                  {
                     this._14031.state = _13564.STATE_CACHE;
                  }
                  else if(_loc3_.getFrameByIndex(param1))
                  {
                     this._14031.state = _13564.STATE_KEY;
                  }
                  else
                  {
                     this._14031.state = _13564.STATE_NORMAL;
                  }
               }
            }
         }
      }
      
      public function get model() : _672
      {
         return this._4761;
      }
      
      public function set model(param1:_672) : void
      {
         this._4761 = param1;
         this.refresh();
      }
      
      public function get _2713() : Boolean
      {
         return this._6566;
      }
      
      public function set _2713(param1:Boolean) : void
      {
         if(this._6566 == param1)
         {
            return;
         }
         this._6566 = param1;
      }
      
      public function get type() : _74
      {
         return this._type;
      }
      
      public function set type(param1:_74) : void
      {
         this._type = param1;
         if(this._6565)
         {
            this._2894();
         }
      }
      
      public function set _4425(param1:Boolean) : void
      {
         this._6560 = param1;
      }
      
      public function set _6571(param1:Boolean) : void
      {
         this._6569 = param1;
         if(this._6191)
         {
            this._6191.visible = !this._6569;
            this._6191.includeInLayout = !this._6569;
         }
      }
      
      private function refresh() : void
      {
         if(this._4761.displayVO)
         {
            this._14773.text = this._4761.displayVO._13230;
            this._4444.text = this._4761.displayVO.name;
            this.type = this._4761.displayVO.type;
         }
      }
      
      public function _3834() : void
      {
         if(this._6561)
         {
            this._6561._3834();
         }
      }
      
      public function _4395(param1:_52) : void
      {
         if(this._6561)
         {
            this._6561._4395(param1);
         }
      }
      
      public function _4358(param1:_661) : void
      {
         if(this._6561)
         {
            this._6561._4358(param1);
         }
      }
      
      public function _4416(param1:Boolean) : void
      {
         this._6555 = param1;
         if(this._6552)
         {
            this._6552.enabled = !this._6555;
            this._6564.enabled = !this._6555;
            this._6563.enabled = !this._6555;
         }
      }
      
      private function _11452(param1:MouseEvent) : void
      {
         dispatchEvent(new BoundingBoxEvent(BoundingBoxEvent.EDIT));
      }
      
      private function _11450(param1:MouseEvent) : void
      {
         dispatchEvent(new BoundingBoxEvent(BoundingBoxEvent.FREEZE));
      }
      
      private function _4052(param1:Event) : void
      {
         dispatchEvent(new BoundingBoxEvent(BoundingBoxEvent.COLOR_CHANGE));
      }
      
      private function _11446(param1:UIEvent) : void
      {
         dispatchEvent(new BoundingBoxEvent(BoundingBoxEvent.COLOR_CONFIRM));
      }
      
      private function _11447(param1:Event) : void
      {
         dispatchEvent(new BoundingBoxEvent(BoundingBoxEvent.COLOR_CANCEL));
      }
      
      private function _11449(param1:Event) : void
      {
         dispatchEvent(new BoundingBoxEvent(BoundingBoxEvent.COLOR_CLEAR));
      }
      
      public function _11328() : Boolean
      {
         if(stage && this._11451 && this._11451.parent && this._11451.visible && this._11451.enabled)
         {
            return this._11451.hitTestPoint(stage.mouseX,stage.mouseY);
         }
         return false;
      }
      
      public function _11622() : Boolean
      {
         if(stage && this._6564 && this._6564.parent && this._6564.visible && this._6564.enabled)
         {
            return this._6564.hitTestPoint(stage.mouseX,stage.mouseY);
         }
         return false;
      }
      
      protected function get _2209() : _522
      {
         return Context.getInstance()._1568._2209;
      }
   }
}

