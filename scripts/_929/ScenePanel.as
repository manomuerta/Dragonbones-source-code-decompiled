package _929
{
   import _1045.Group;
   import _1045.Label;
   import _1177.UIEvent;
   import _1185._1189;
   import _1185._1196;
   import _127._156;
   import _127._163;
   import _1374.IconButton;
   import _1374.TextInput;
   import _51._50;
   import _51._52;
   import _51._77;
   import _668._673;
   import _676._677;
   import _676._684;
   import _676._685;
   import _676._697;
   import _676._700;
   import _703._702;
   import _73._74;
   import _928._927;
   import _931._932;
   import _931._933;
   import egret.utils.StringUtil;
   import egret.utils.tr;
   
   public class ScenePanel extends _156
   {
      private static const ICON_ARMATURE:String = "/assets/panelIcon/armature.png";
      
      private static const ICON_MOVIECLIP:String = "/assets/panelIcon/movieclip.png";
      
      private static const ICON_STAGE:String = "/assets/panelIcon/stage.png";
      
      private static const _6669:String = "/assets/panelIcon/bone.png";
      
      private static const ICON_BONE_ROOT:String = "/assets/panelIcon/rootBone.png";
      
      private static const ICON_SLOT:String = "/assets/panelIcon/slot.png";
      
      private static const ICON_DISPLAY:String = "/assets/panelIcon/imageUsed.png";
      
      private static const ICON_MESH:String = "/assets/panelIcon/mesh.png";
      
      private static const ICON_IMAGEMISS:String = "/assets/panelIcon/imageMiss.png";
      
      private static const ICON_MESHMISS:String = "/assets/panelIcon/meshMiss.png";
      
      private static const ICON_BOUNDINGBOX:String = "/assets/panelIcon/boundingBox.png";
      
      public var _4495:_673;
      
      public var _4492:_927;
      
      public var _4459:Function;
      
      public var tree:_163;
      
      public var intelligentFilterButton:IconButton;
      
      public var renameBtn:IconButton;
      
      public var removeBtn:IconButton;
      
      public var newDropList:_11265;
      
      public var _4507:Boolean = false;
      
      public var _13813:Boolean = false;
      
      public var _4536:TextInput;
      
      private var _6668:Label;
      
      public var _4519:Function;
      
      public var _3175:Function;
      
      public var _4518:Function;
      
      public var _4511:String;
      
      public var _4494:Function;
      
      public var _4458:Function;
      
      public function ScenePanel()
      {
         this.tree = new _163();
         this.intelligentFilterButton = new IconButton();
         this.renameBtn = new IconButton();
         this.removeBtn = new IconButton();
         this.newDropList = new _11265();
         this._4536 = new TextInput();
         this._6668 = new Label();
         super();
         this.title = tr("ScenePanel.Title");
         this.icon = "/assets/panel/sceneTree.png";
      }
      
      override protected function _2438() : void
      {
         var editGroup:Group;
         super._2438();
         this._4536.skinName = _933;
         this._4536.prompt = tr("Scene.Tree.Prompt");
         this._4536.percentWidth = 100;
         this._4536.height = 22;
         this._4536.left = 0;
         this._4536.top = 0;
         this.addElement(this._4536);
         this._6668.text = tr("Scene.Tree.SearchEmpty.ToolTip");
         this._6668.left = 1;
         this._6668.right = 4;
         this._6668.verticalAlign = _1196.MIDDLE;
         this._6668.height = 22;
         this._6668._6080 = 1;
         this._6668.mouseEnabled = false;
         this._6668.mouseChildren = false;
         this.addElement(this._6668);
         this._4466();
         this._4492 = new _927();
         this._4492.top = 22;
         this._4492.left = 0;
         this._4492.right = 0;
         this._4492.doubleClickEnabled = true;
         this._4492.addEventListener(UIEvent.CREATION_COMPLETE,function onCreateComplate(param1:UIEvent):void
         {
            var _loc2_:_932 = null;
            if(Boolean(_4492.skin) && _4492.skin is _932)
            {
               _loc2_ = _4492.skin as _932;
               _loc2_._6670 = false;
               _2570();
            }
            if(_4459 != null)
            {
               _4459(_4492);
            }
         });
         this.tree._3854 = true;
         this.tree.percentWidth = 100;
         this.tree._6056 = false;
         this.tree.top = 22;
         this.tree.bottom = 0;
         this.tree.doubleClickEnabled = true;
         this.tree._5987 = "name";
         this.tree.iconFunction = this.iconFunction;
         this.tree.itemRenderer = _927;
         this.tree._6033 = true;
         this.tree._6031 = true;
         this.tree._3576 = this._3576;
         this.tree._3573 = this._3573;
         this.addElement(this.tree);
         this.addElement(this._4492);
         this._4465();
         editGroup = new Group();
         editGroup.layout = new _1189();
         this.intelligentFilterButton.toolTip = tr("ScenePanel.intelligentFilterButton.tooltip");
         this.renameBtn.icon = "/assets/button/rename.png";
         this.removeBtn.icon = "/assets/button/delAnimation.png";
         this.newDropList.toolTip = tr("ScenePanel.newDropList.tooltip");
         this.renameBtn.toolTip = tr("ScenePanel.renameBtn.tooltip");
         this.removeBtn.toolTip = tr("ScenePanel.removeBtn.tooltip");
         editGroup.addElement(this.intelligentFilterButton);
         editGroup.addElement(this.newDropList);
         editGroup.addElement(this.removeBtn);
         _2527.addElement(editGroup);
         if(this._3175 != null)
         {
         }
      }
      
      public function _4460() : void
      {
         this._6668.visible = true;
         this._6668.includeInLayout = true;
      }
      
      public function _4466() : void
      {
         this._6668.visible = false;
         this._6668.includeInLayout = false;
      }
      
      private function iconFunction(param1:Object) : String
      {
         var _loc2_:_702 = param1 as _702;
         if(_loc2_ is _677)
         {
            return ICON_ARMATURE;
         }
         if(_loc2_ is _684)
         {
            if(_loc2_.parent is _684)
            {
               return this._4519(param1);
            }
            return ICON_BONE_ROOT;
         }
         if(_loc2_ is _700)
         {
            if(this._4518 != null)
            {
               return this._4518(param1);
            }
            return ICON_SLOT;
         }
         if(_loc2_ is _685)
         {
            if(_loc2_.vo.type == _74.MESH)
            {
               if(_685(_loc2_).displayVO._2104.missing)
               {
                  return ICON_MESHMISS;
               }
               return ICON_MESH;
            }
            if(_loc2_.vo.type == _74.BOUNDINGBOX)
            {
               return ICON_BOUNDINGBOX;
            }
            if(_685(_loc2_).displayVO.type.toString() == _74.ARMATURE.toString())
            {
               return ICON_ARMATURE;
            }
            if(_loc2_.vo.filterType)
            {
               if(_loc2_.vo.filterType.toString() == _74.ARMATURE.toString())
               {
                  return ICON_ARMATURE;
               }
               if(_loc2_.vo.filterType.toString() == _74.MOVIECLIP.toString())
               {
                  return ICON_MOVIECLIP;
               }
               if(_loc2_.vo.filterType.toString() == _74.STAGE.toString())
               {
                  return ICON_STAGE;
               }
            }
            if(_685(_loc2_).displayVO._2104.missing)
            {
               return ICON_IMAGEMISS;
            }
            return ICON_DISPLAY;
         }
         throw Error("armature tree iconFunction 意外的类型");
      }
      
      private function _3573(param1:Object, param2:Array) : Boolean
      {
         if(!this._13813)
         {
            return false;
         }
         var _loc3_:_702 = (param1 as _702).parent;
         if(!this._13982(param2,_loc3_) || !(param1 is _684))
         {
            return false;
         }
         return true;
      }
      
      private function _13982(param1:Array, param2:_702) : Boolean
      {
         var _loc3_:Boolean = true;
         var _loc4_:int = 0;
         while(_loc4_ < param1.length)
         {
            if(param1[_loc4_].parent != param2 || !(param1[_loc4_] is _684))
            {
               _loc3_ = false;
               break;
            }
            _loc4_++;
         }
         return _loc3_;
      }
      
      private function _3576(param1:Object, param2:Array) : Boolean
      {
         var _loc5_:_52 = null;
         var _loc6_:_52 = null;
         if(this._13813)
         {
            return false;
         }
         var _loc3_:_702 = param2[0] as _702;
         if(_loc3_ is _684)
         {
            if(!(param1 is _684))
            {
               return false;
            }
            _loc5_ = (_loc3_ as _684)._1836;
            _loc6_ = (param1 as _684)._1836;
            if(Boolean(_loc5_) && Boolean(_loc6_))
            {
               if(this._14775(_loc5_,_loc6_))
               {
                  return false;
               }
            }
         }
         else if(_loc3_ is _700)
         {
            if(param1 is _700 && param1 != _loc3_)
            {
               if((param1 as _700)._1837.onlyBoundingBox && !(_loc3_ as _700)._1837.onlyBoundingBox)
               {
                  return false;
               }
               return true;
            }
            if(!(param1 is _684))
            {
               return false;
            }
         }
         else if(_loc3_ is _685)
         {
            if(!(param1 is _684) && !(param1 is _700))
            {
               return false;
            }
            if(param1 is _700)
            {
               if((param1 as _700)._1837.onlyBoundingBox && (_loc3_ as _685).displayVO.type != _74.BOUNDINGBOX)
               {
                  return false;
               }
            }
         }
         if(param1 == _loc3_ || param1 == _loc3_.parent)
         {
            return false;
         }
         var _loc4_:_702 = (param1 as _702).parent;
         while(_loc4_)
         {
            if(_loc3_ == _loc4_)
            {
               return false;
            }
            _loc4_ = _loc4_.parent;
         }
         return true;
      }
      
      public function _14775(param1:_52, param2:_52) : Boolean
      {
         var _loc3_:_50 = null;
         var _loc4_:Array = null;
         var _loc5_:_77 = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         if(param1._1957)
         {
            _loc3_ = param1.rootArmatureData;
            _loc4_ = _loc3_._1981(param1);
            _loc6_ = 0;
            _loc7_ = int(_loc4_.length);
            while(_loc6_ < _loc7_)
            {
               _loc5_ = _loc4_[_loc6_] as _77;
               if(_loc5_)
               {
                  _loc8_ = 0;
                  _loc9_ = int(_loc5_.bones.length);
                  while(_loc8_ < _loc9_)
                  {
                     if(_loc5_.bones[_loc8_]._14287(param2))
                     {
                        return true;
                     }
                     _loc8_++;
                  }
               }
               _loc6_++;
            }
         }
         return false;
      }
      
      public function _4465() : void
      {
         var _loc1_:_702 = null;
         if(this.tree)
         {
            if(this._4495)
            {
               if(this._4458 && this._4495._3997 && this._4495._3997.source is _677)
               {
                  this._4458(this._4495._3997.source as _677);
               }
               if(StringUtil.trim(this._4511).length)
               {
                  if(this._4494 != null)
                  {
                     this._4494();
                     if(this.tree.dataProvider is _697)
                     {
                        (this.tree.dataProvider as _697).refresh();
                     }
                  }
               }
               else
               {
                  this.tree.dataProvider = this._4495._3997;
                  if(this.tree.dataProvider is _697)
                  {
                     (this.tree.dataProvider as _697).refresh();
                  }
                  if(this._4495._3997)
                  {
                     _loc1_ = this._4495._3997.getItemAt(0) as _702;
                     if(_loc1_)
                     {
                        this._4495._3997._4529(_loc1_);
                     }
                  }
               }
               if(this._4492 && this.tree.dataProvider && Boolean(this._4495._2879))
               {
                  this._4492.data = this._4495._2879;
                  this._4492.label = this._4495._1886.name;
               }
            }
            else
            {
               this.tree.dataProvider = null;
            }
         }
      }
      
      public function _4127(param1:Vector.<Object>) : void
      {
         var _loc2_:Object = null;
         for each(_loc2_ in param1)
         {
            this.tree._4550(_loc2_);
         }
         this.tree._2889 = param1;
      }
   }
}

