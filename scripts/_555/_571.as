package _555
{
   import _1045._1070;
   import _1088.TreeItemRenderer;
   import _11106._11105;
   import _11106._11108;
   import _11111._11110;
   import _11220._11219;
   import _1177.CloseEvent;
   import _1177.DragEvent;
   import _1177.IndexChangeEvent;
   import _1177.ListEvent;
   import _1177.UIEvent;
   import _127._133;
   import _127._150;
   import _127._163;
   import _13._12;
   import _13._14;
   import _1374.Alert;
   import _1374.IconButton;
   import _1374.TextInput;
   import _1404._1405;
   import _1404._1407;
   import _1421.TreeDragEvent;
   import _15.DBDragFormat;
   import _15.ListDragEvent;
   import _24.Shortcut;
   import _24._26;
   import _35.HashObject;
   import _470._469;
   import _51._50;
   import _51._52;
   import _51._70;
   import _51._71;
   import _51._79;
   import _521._524;
   import _521._530;
   import _541._540;
   import _579._580;
   import _586._11247;
   import _586._603;
   import _6._9;
   import _636.DBModelEvent;
   import _636.DBPanelEvent;
   import _639._12462;
   import _648._665;
   import _668._673;
   import _676._677;
   import _676._684;
   import _676._685;
   import _676._697;
   import _676._700;
   import _703._702;
   import _703._704;
   import _703._705;
   import _708._714;
   import _708._715;
   import _708._716;
   import _708._717;
   import _710._711;
   import _710._712;
   import _724._723;
   import _724._725;
   import _73.BoundingBoxType;
   import _73.SymbolType;
   import _73._74;
   import _755._760;
   import _783.CommandNotification;
   import _783.MenuNotification;
   import _783.PanelNotification;
   import _783.StageNotification;
   import _783.TimelineNotification;
   import _783.TipNotification;
   import _81._91;
   import _859._861;
   import _859._862;
   import _928._927;
   import _929.ScenePanel;
   import _929._11265;
   import _93._94;
   import _931._933;
   import _97._124;
   import avmplus.getQualifiedClassName;
   import egret.core._1111;
   import egret.managers.DragManager;
   import egret.utils.StringUtil;
   import egret.utils._99;
   import egret.utils.tr;
   import flash.display.DisplayObject;
   import flash.display.InteractiveObject;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.IEventDispatcher;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.text.TextField;
   import flash.ui.Keyboard;
   import flash.utils.Dictionary;
   import flash.utils.Timer;
   
   public class _571 extends _94
   {
      private static const ICON_ARMATURE:String = "/assets/panelIcon/soltarmature.png";
      
      private static const ICON_MOVIECLIP:String = "/assets/skins/tree/mcSlot.png";
      
      private static const ICON_MESH:String = "/assets/skins/tree/meshSlot.png";
      
      private static const ICON_IMAGE:String = "/assets/skins/tree/photoSlot.png";
      
      private static const ICON_NULL:String = "/assets/skins/tree/emptySlot.png";
      
      private static const ICON_STAGE:String = "/assets/skins/tree/armatrueSlot.png";
      
      private static const ICON_SLOT:String = "/assets/panelIcon/slot.png";
      
      private static const ICON_SLOTMISS:String = "/assets/panelIcon/slotMiss.png";
      
      private static const ICON_SLOTMISSMESH:String = "/assets/panelIcon/slotMissMesh.png";
      
      private static const ICON_BOUNDINGBOX:String = "/assets/panelIcon/boundingBoxSlot.png";
      
      private static const ICON_ONLYBOUNDINGBOX:String = "/assets/panelIcon/onlyBoundingBoxSlot.png";
      
      private static const ICON_BONE_NORMAL:String = "/assets/panelIcon/bone.png";
      
      private static const ICON_BONE_IK:String = "/assets/panelIcon/bone_IK.png";
      
      private var _4133:_665;
      
      private var _4493:_673;
      
      public var scenePanel:ScenePanel;
      
      public var _12628:Boolean;
      
      private var _4492:_927;
      
      private var _4522:Boolean;
      
      private var _4504:String;
      
      private var _4491:Timer;
      
      private var _4533:Boolean;
      
      private var _4464:_702;
      
      private var _4499:_702;
      
      private var _4461:Array;
      
      private var _4467:_677;
      
      private var _4455:String = "/assets/skins/tree/filterOpen.png";
      
      private var _4454:String = "/assets/skins/tree/filterClose.png";
      
      private var _4452:Array;
      
      private var _12627:Boolean = false;
      
      private var _10588:Boolean = false;
      
      private var _10587:Timer;
      
      private var _10586:TreeItemRenderer;
      
      private var _13809:Array;
      
      public var _4502:Boolean;
      
      public var _4526:String = "";
      
      public var _4514:Boolean;
      
      public function _571()
      {
         this._4493 = new _673();
         this.scenePanel = _1407.getInstance(ScenePanel);
         this._4491 = new Timer(1500,1);
         this._4461 = [];
         this._4452 = [this._4454,this._4455];
         this._10587 = new Timer(100,5);
         super();
         this.scenePanel._4495 = this._4493;
         this.scenePanel._3175 = this._4450;
         this.scenePanel._4459 = this._4459;
         this.scenePanel._4519 = this._4539;
         this.scenePanel._4518 = this._4538;
      }
      
      override protected function init() : void
      {
         super.init();
         this._4451();
      }
      
      override protected function _1576() : void
      {
         _1565(StageNotification.UPDATE_ALLOW_BONE_MULTIPLE_SELECTION,this._4448);
         _1565(StageNotification.UPDATE_SELECTED_ITEMS,this._4023);
         _1565(StageNotification.UPDATE_EDIT_MODE,this._3864);
         _1565(StageNotification.UPDATE_DISPLAY_LIST,this._4475);
         _1565(StageNotification.UPDATE_ANIMATION_MODE,this._3976);
         _1565(StageNotification.UPDATE_CURRENT_ARMATURE,this._3973);
         _1565(PanelNotification.SCENE_PANEL_DELETE_ITEM,this._4515);
         _1565(StageNotification.START_PICK,this._4524);
         _1565(TimelineNotification.UPDATE_STAGE_VIEW,this._4629);
         _1565(StageNotification.START_EDIT_BOUNDINGBOX,this._11329);
         _1565(StageNotification.STOP_EDIT_BOUNDINGBOX,this._11345);
         _1565(StageNotification.START_EDIT_MESH_UV,this._11626);
         _1565(StageNotification.STOP_EDIT_MESH_UV,this._11627);
         this._4536.addEventListener(Event.CHANGE,this._4497,false);
         this._4536.addEventListener("textChanged",this._4482,true);
         this._4536.addEventListener("clearInput",this._4489,false);
         this._4536.addEventListener(KeyboardEvent.KEY_UP,this.onKeyUp,true);
         this._4536.addEventListener(FocusEvent.FOCUS_IN,this._4477);
         this.scenePanel.addEventListener(KeyboardEvent.KEY_UP,this._4517,false);
         this.newDropList.addEventListener(DBPanelEvent.ADD_BONE,this._6927);
         this.newDropList.addEventListener(DBPanelEvent.ADD_SLOT,this._11355);
         this.newDropList.addEventListener(DBPanelEvent.ADD_BOUNDINGBOX,this._11351);
         this.intelligentFilterButton.addEventListener(MouseEvent.CLICK,this._4450);
         this.removeBtn.addEventListener(MouseEvent.CLICK,this._4484);
         this.renameBtn.addEventListener(MouseEvent.CLICK,this._3984);
         this.tree._4500 = this._4473;
         this.tree.addEventListener(FocusEvent.FOCUS_IN,this._4503);
         this.tree.addEventListener(FocusEvent.FOCUS_OUT,this._4498);
         this.tree.addEventListener(MouseEvent.ROLL_OVER,this._4496);
         this.tree.addEventListener(MouseEvent.ROLL_OUT,this._4506);
         this.tree.addEventListener(IndexChangeEvent.CHANGE,this._3552);
         this.tree.addEventListener(ListEvent.ITEM_ROLL_OVER,this._4124);
         this.tree.addEventListener(ListEvent.ITEM_ROLL_OUT,this._4125);
         this.tree.addEventListener(ListEvent.ITEM_RIGHT_MOUSE_DOWN,this._4457);
         this.tree.addEventListener(ListEvent.ITEM_RIGHT_CLICK,this._4470);
         this.tree.addEventListener(ListEvent.ITEM_DOUBLE_CLICK,this._3561);
         this.tree.addEventListener(ListDragEvent.ITEM_DRAG_ENTER,this._4472);
         this.tree.addEventListener(TreeDragEvent.ITEMS_DRAG_START,this._4119);
         this.tree.addEventListener(TreeDragEvent.ITEMS_DRAG_IN_COMPLETE,this._4453);
         this.tree.addEventListener(TreeDragEvent.ITEMS_DRAG_COMPLETE,this._13808);
         this.tree.addEventListener(TreeDragEvent.ITEMS_DRAG_MOVE_COMPLETE,this._4117);
         this.tree.addEventListener(KeyboardEvent.KEY_UP,this.onKeyUp,false);
         this.tree.addEventListener(UIEvent.CREATION_COMPLETE,this._4321);
         _1565(MenuNotification.EXPAND_ALL,this._4523);
         _1565(MenuNotification.COLLAPSE_ALL,this._4512);
         _1565(MenuNotification.RENAME,this._4006);
         _1565(MenuNotification.SHOW_ALL,this._4535);
         _1565(MenuNotification.EXPAND_SELECTED,this._14573);
         _1565(MenuNotification.COLLAPSE_SELECTED,this._14570);
         _1565(MenuNotification.SHOW_ITEM,this._14581);
         _1565(MenuNotification.ADD_BOUNDINGBOX,this._11348);
         this._10587.addEventListener(TimerEvent.TIMER_COMPLETE,this.timerComplete);
         if(stage)
         {
            Shortcut._1681(stage,_26.SELECT_PARENT,this._13812);
            Shortcut._1681(stage,_26.SELECT_CHILD,this._13814);
            Shortcut._1681(stage,_26.SELECT_BROTHER,this._13811);
            Shortcut._1681(this.scenePanel,_26.RENAME,this._4199);
            Shortcut._1681(stage,_26.RENAME,this._4199);
            Shortcut._1681(stage,_26.COPY_TRANSFORM,this._14575);
            Shortcut._1681(stage,_26.PASTE_TRANSFORM,this._5310);
            Shortcut._1681(stage,_26.HIDE,this._14583);
            Shortcut._1681(stage,_26.HIDE_OTHERS,this._14580);
            Shortcut._1681(stage,_26.HIDE_IRRELEVANT,this._14572);
            Shortcut._1681(stage,_26.HIDE_RELATED,this._14577);
            Shortcut._1681(stage,_26.LOCK,this._14582);
            Shortcut._1681(stage,_26.LOCK_OTHERS,this._14578);
            Shortcut._1681(stage,_26.LOCK_IRRELEVANT,this._14571);
            Shortcut._1681(stage,_26.LOCK_RELATED,this._14576);
            Shortcut._1681(this.scenePanel,_26.DUPLICATE,this._4014);
            Shortcut._1681(stage,_26.DUPLICATE,this._4014);
         }
      }
      
      private function _4014() : void
      {
         this._1567(new MenuNotification(MenuNotification.DUPLICATE,null,"scenepanel"));
      }
      
      private function _14582() : void
      {
         if(this._14568())
         {
            this._3950([_2226._2889[0]],false);
         }
      }
      
      private function _14578() : void
      {
         if(this._14568())
         {
            this._3952(_2226._2889,false);
         }
      }
      
      private function _14571() : void
      {
         if(!_2226._14529())
         {
            this._3351(tr("Tip.selectbone"));
            return;
         }
         this._3946(_2226._2889,false);
      }
      
      private function _14576() : void
      {
         if(!_2226._14529())
         {
            this._3351(tr("Tip.selectbone"));
            return;
         }
         this._14532(_2226._2889,false);
      }
      
      private function _14583() : void
      {
         if(this._14568())
         {
            this._3949(_2226._2889,false);
         }
      }
      
      private function _14580() : void
      {
         if(this._14568())
         {
            this._3953(_2226._2889,false);
         }
      }
      
      private function _14572() : void
      {
         if(!_2226._14529())
         {
            this._3351(tr("Tip.selectbone"));
            return;
         }
         this._3947(_2226._2889,false);
      }
      
      private function _14577() : void
      {
         if(!_2226._14529())
         {
            this._3351(tr("Tip.selectbone"));
            return;
         }
         this._14533(_2226._2889,false);
      }
      
      private function _14568() : Boolean
      {
         if(_2226._14529() || _2226._14509())
         {
            return true;
         }
         this._3351(tr("Tip.selectboneorslot"));
         return false;
      }
      
      private function _3351(param1:String) : void
      {
         _1567(new TipNotification(TipNotification.SHOW_TOOL_TIP,{
            "type":_717.ANIMATE,
            "showText":param1
         }));
      }
      
      private function _4199() : void
      {
         this._3984(null);
      }
      
      private function _14575() : void
      {
         _1567(new MenuNotification(MenuNotification.COPY_TRANSFORM));
      }
      
      private function _5310() : void
      {
         _1567(new MenuNotification(MenuNotification.PASTE_TRANSFORM));
      }
      
      private function _13810() : Boolean
      {
         if(_530.instance._3832)
         {
            return false;
         }
         if(this._2873 != _715.ARMATURE && this._2873 != _715.ANIMATE)
         {
            return false;
         }
         if(this._12628)
         {
            return false;
         }
         return true;
      }
      
      private function _13812() : void
      {
         if(!this._13810())
         {
            return;
         }
         if(_2226._2889.length == 1)
         {
            if(Boolean(_2226._3872) && _2226._3872.parentBoneData != null)
            {
               _2226._2484 = _2226._3872.parentBoneData;
            }
            else if(Boolean(_2226._3150) && _2226._3150.parentBoneData != null)
            {
               _2226._2484 = _2226._3150.parentBoneData;
            }
         }
      }
      
      private function _13814() : void
      {
         if(!this._13810())
         {
            return;
         }
         if(_2226._2889.length == 1)
         {
            if(_2226._3872 && _2226._3872._2024 && _2226._3872._2024.length > 0)
            {
               _2226._2484 = _2226._3872._2024[0];
            }
         }
      }
      
      private function _13811() : void
      {
         var _loc1_:_52 = null;
         var _loc2_:_52 = null;
         var _loc3_:int = 0;
         if(!this._13810())
         {
            return;
         }
         if(_2226._2889.length == 1)
         {
            if(Boolean(_2226._3872) && Boolean(_2226._3872.parentBoneData))
            {
               _loc1_ = _2226._3872;
               _loc2_ = _loc1_.parentBoneData;
               if(_loc2_ && _loc2_._2024 && _loc2_._2024.length > 1)
               {
                  _loc3_ = int(_loc2_._2024.indexOf(_loc1_));
                  _loc3_++;
                  if(_loc3_ > _loc2_._2024.length - 1)
                  {
                     _loc3_ = 0;
                  }
                  _2226._2484 = _loc2_._2024[_loc3_];
               }
            }
         }
      }
      
      private function _4321(param1:UIEvent) : void
      {
         this._12626();
      }
      
      private function _11348(param1:MenuNotification) : void
      {
         if(param1.data is _52)
         {
            this._11352(_11105.ElementType_BoundingBox,_11108.SceneTreeContextMenu);
            this._11347(param1.data as _52);
         }
      }
      
      private function _11627(param1:StageNotification) : void
      {
         this._12628 = false;
         this._4451();
      }
      
      private function _11626(param1:StageNotification) : void
      {
         this._12628 = true;
         this._4451();
      }
      
      private function _11345(param1:StageNotification) : void
      {
         this._12628 = false;
         this._4451();
      }
      
      private function _11329(param1:StageNotification) : void
      {
         this._12628 = true;
         this._4451();
      }
      
      private function _4459(param1:_927) : void
      {
         var _4492:_927 = param1;
         this._4492 = _4492;
         _4492.addEventListener(MouseEvent.RIGHT_CLICK,function(param1:MouseEvent):void
         {
            var _loc2_:ListEvent = null;
            if(_4492.data is _702)
            {
               _loc2_ = new ListEvent(ListEvent.ITEM_RIGHT_CLICK);
               _loc2_.item = _4492.data as _702;
               tree.dispatchEvent(_loc2_);
               tree.selectedIndex = 0;
            }
         });
         _4492.addEventListener(MouseEvent.DOUBLE_CLICK,function(param1:MouseEvent):void
         {
            var _loc2_:ListEvent = null;
            if(_4492)
            {
               _loc2_ = new ListEvent(ListEvent.ITEM_DOUBLE_CLICK);
               _loc2_.itemRenderer = _4492;
               _loc2_.relatedObject = param1.target as InteractiveObject;
               tree.dispatchEvent(_loc2_);
            }
         });
         _4492.addEventListener(MouseEvent.CLICK,function(param1:MouseEvent):void
         {
            if(_4492)
            {
               _2226._2484 = null;
            }
         });
      }
      
      private function _4462() : void
      {
         if(this._4492 && this._2882 && this._2882._3997 && Boolean(this._2882._3997.source as _677))
         {
            this._4492.label = (this._2882._3997.source as _677).name;
         }
      }
      
      private function _4503(param1:FocusEvent) : void
      {
         this._4522 = true;
      }
      
      private function _4498(param1:FocusEvent) : void
      {
         this._4522 = false;
      }
      
      private function _4006(param1:MenuNotification) : void
      {
         if(param1.data == "scenePanel")
         {
            this._3984(null);
         }
      }
      
      private function _14570(param1:MenuNotification) : void
      {
         var _loc3_:_702 = null;
         var _loc4_:Object = null;
         if(param1.data != "scenePanel")
         {
            return;
         }
         var _loc2_:Array = _2226._2889;
         for each(_loc4_ in _loc2_)
         {
            if(_loc4_ is _50)
            {
               _loc3_ = _705._2951[_loc4_];
            }
            else if(_loc4_ is _52)
            {
               _loc3_ = _705._2944[_loc4_];
            }
            else if(_loc4_ is _79)
            {
               _loc3_ = _705._2273[_loc4_];
            }
            this._4501(_loc3_,false);
         }
      }
      
      private function _14573(param1:MenuNotification) : void
      {
         var _loc3_:_702 = null;
         var _loc4_:Object = null;
         if(param1.data != "scenePanel")
         {
            return;
         }
         var _loc2_:Array = _2226._2889;
         for each(_loc4_ in _loc2_)
         {
            if(_loc4_ is _50)
            {
               _loc3_ = _705._2951[_loc4_];
            }
            else if(_loc4_ is _52)
            {
               _loc3_ = _705._2944[_loc4_];
            }
            else if(_loc4_ is _79)
            {
               _loc3_ = _705._2273[_loc4_];
            }
            this._4501(_loc3_,true);
         }
      }
      
      private function _4512(param1:MenuNotification) : void
      {
         if(param1.data == "scenePanel")
         {
            this._4537();
         }
      }
      
      private function _4523(param1:MenuNotification) : void
      {
         if(param1.data == "scenePanel")
         {
            this._4540();
         }
      }
      
      private function _4535(param1:MenuNotification) : void
      {
         if(param1.data == "scenePanel")
         {
            this.showAll();
         }
      }
      
      private function _14581(param1:MenuNotification) : void
      {
         var _loc3_:_70 = null;
         var _loc4_:Object = null;
         if(!_2226._14526())
         {
            return;
         }
         var _loc2_:_70 = _2226._2889[0];
         if(_loc2_)
         {
            _loc3_ = _loc2_._2100 ? null : _loc2_;
            _loc4_ = _469._3152(_loc2_._1760,_loc3_);
            if(this._2873 == _715.ARMATURE)
            {
               _1567(new CommandNotification(CommandNotification.MODIFY_SLOT_DISPLAY,_loc4_));
            }
         }
      }
      
      private function _4448(param1:StageNotification) : void
      {
      }
      
      private function _4023(param1:StageNotification) : void
      {
         var _loc3_:_702 = null;
         var _loc5_:Object = null;
         var _loc2_:Array = _2226._2889;
         var _loc4_:Vector.<Object> = new Vector.<Object>();
         for each(_loc5_ in _loc2_)
         {
            if(_loc5_ is _50)
            {
               _loc3_ = _705._2951[_loc5_];
            }
            else if(_loc5_ is _52)
            {
               _loc3_ = _705._2944[_loc5_];
            }
            else if(_loc5_ is _79)
            {
               _loc3_ = _705._2273[_loc5_];
            }
            else if(_loc5_ is _70)
            {
               _loc3_ = _705._3014[_loc5_];
            }
            _loc4_.push(_loc3_);
         }
         this.scenePanel._4127(_loc4_);
         if(_loc4_.length > 0)
         {
            this._4464 = _loc4_[0] as _702;
         }
         else
         {
            this._4464 = null;
         }
         this._4451();
      }
      
      private function _3864(param1:StageNotification) : void
      {
         this._4451();
         this._4490();
      }
      
      private function _4490() : void
      {
         if(this._2871)
         {
            this._2882._1886 = this._2871._2865;
            this.scenePanel._4465();
         }
      }
      
      private function _4629(param1:TimelineNotification) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:_79 = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:_70 = null;
         if(Boolean(this._2871) && Boolean(this._2871._2865))
         {
            _loc2_ = 0;
            _loc3_ = int(this._2871._2865._1780.length);
            while(_loc2_ < _loc3_)
            {
               _loc4_ = this._2871._2865._1780[_loc2_];
               if(_loc4_)
               {
                  this._2943(_705._2273[_loc4_]);
                  if(!_12462.getInstance().sceneTreeFilter || _loc4_._1715.length > 1)
                  {
                     _loc5_ = 0;
                     _loc6_ = int(_loc4_._1715.length);
                     while(_loc5_ < _loc6_)
                     {
                        _loc7_ = _loc4_._1765[_loc4_._1715[_loc5_]];
                        if(_loc7_)
                        {
                           this._2943(_705._3014[_loc7_]);
                        }
                        _loc5_++;
                     }
                  }
               }
               _loc2_++;
            }
         }
      }
      
      private function _4475(param1:StageNotification) : void
      {
         var _loc2_:Array = param1.data as Array;
         var _loc3_:int = 0;
         var _loc4_:int = int(_loc2_.length);
         while(_loc3_ < _loc4_)
         {
            this._2943(_705._3014[_loc2_.pop()]);
            _loc3_++;
         }
      }
      
      private function _3976(param1:StageNotification) : void
      {
         if(_2220._4000 == _714.PLAY)
         {
            this.intelligentFilterButton.enabled = false;
            this.newDropList._11354 = false;
            this.newDropList._11353 = false;
            this.newDropList._11344 = false;
            this.removeBtn.enabled = false;
            this.renameBtn.enabled = false;
            this.newDropList._4891();
         }
         else
         {
            this.tree.mouseChildren = true;
            this._4451();
         }
      }
      
      private function _3973(param1:StageNotification = null) : void
      {
         if(this._4133)
         {
            this._4493._1886 = this._4133._2865;
            this.scenePanel._4465();
         }
         else
         {
            this._4493._1886 = null;
         }
      }
      
      public function _3514() : void
      {
         this._4536.text = "";
         this._4511 = "";
         this._4533 = false;
         this._4499 = null;
         this._4464 = null;
         this._4461 = [];
      }
      
      public function _3513() : void
      {
         this.scenePanel.intelligentFilterButton.icon = this._3175 ? this._4452[1] : this._4452[0];
      }
      
      public function get _4511() : String
      {
         return this._4504;
      }
      
      public function set _4511(param1:String) : void
      {
         this._4504 = param1;
         if(StringUtil.trim(param1).length > 0)
         {
            this._4533 = true;
         }
         else
         {
            this._4533 = false;
         }
         this.scenePanel._4511 = this._4511;
         this.scenePanel._4458 = this._4471;
         this.scenePanel._4494 = this._4481;
         this.scenePanel._4465();
      }
      
      public function _4471(param1:_677) : void
      {
         var _4467:_677 = param1;
         var refreshVisible:Function = function(param1:_702):void
         {
            var _loc2_:_702 = null;
            if(!(!param1 is _704))
            {
               (param1 as _704).visible = true;
            }
            if(param1.children.length)
            {
               for each(_loc2_ in param1.children)
               {
                  refreshVisible(_loc2_);
               }
            }
         };
         refreshVisible(_4467);
      }
      
      private function _4477(param1:FocusEvent) : void
      {
         this.scenePanel._4466();
      }
      
      private function onKeyUp(param1:KeyboardEvent) : void
      {
         var _loc2_:_697 = null;
         var _loc3_:_702 = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:Vector.<Object> = null;
         if(!this._4533)
         {
            return;
         }
         if(param1.keyCode == Keyboard.UP || param1.keyCode == Keyboard.DOWN)
         {
            if(Boolean(this._4499) && this.tree.dataProvider is _697)
            {
               _loc2_ = this.tree.dataProvider as _697;
               _loc4_ = _loc2_.getItemIndex(this._4499);
               if(_loc4_ >= 0)
               {
                  _loc5_ = -1;
                  if(param1.keyCode == Keyboard.UP)
                  {
                     if(_loc4_ - 1 < 0)
                     {
                        _loc5_ = _loc4_;
                     }
                     else
                     {
                        _loc5_ = _loc4_ - 1;
                     }
                  }
                  else if(param1.keyCode == Keyboard.DOWN)
                  {
                     if(_loc4_ > _loc2_.length)
                     {
                        _loc5_ = _loc4_;
                     }
                     else
                     {
                        _loc5_ = _loc4_ + 1;
                     }
                  }
                  if(_loc5_ >= 0)
                  {
                     _loc3_ = _loc2_.getItemAt(_loc5_) as _702;
                     if(_loc3_)
                     {
                        _loc6_ = new Vector.<Object>();
                        _loc6_.push(_loc3_);
                        this.scenePanel._4127(_loc6_);
                        _2226._2484 = _loc3_.vo;
                        this._4499 = _loc3_;
                        this._4449(_loc3_);
                     }
                  }
               }
            }
         }
      }
      
      private function _4449(param1:_702) : void
      {
         if(param1)
         {
            this._4536._2577.text = param1.vo.name;
            this._4536.selectAll();
         }
      }
      
      private function _4489(param1:Event) : void
      {
         this._4536.text = "";
         this._4511 = "";
      }
      
      private function _4482(param1:Event) : void
      {
         var _loc2_:_933 = this._4536.skin as _933;
         if(_loc2_)
         {
            _loc2_._4527(param1.target.text.length > 0);
         }
      }
      
      private function _4497(param1:Event) : void
      {
         if(this.tree.dataProvider is _697)
         {
            this._4511 = this._4536.text;
         }
      }
      
      private function _4517(param1:KeyboardEvent) : void
      {
         if(param1.keyCode == Keyboard.ENTER && param1.currentTarget is ScenePanel && param1.target is ScenePanel)
         {
            this._4516();
            this._3514();
         }
      }
      
      private function _4516() : void
      {
         var vector:Vector.<Object> = null;
         this._4537();
         _99(function():void
         {
            _4023(null);
            scenePanel._4127(vector);
         },null,0);
         vector = new Vector.<Object>();
         if(this._4499)
         {
            this._4464 = this._4499;
            _2226._2889 = [this._4499.vo];
            vector.push(this._4499);
         }
         else if(Boolean(this._4464) && !this._4499)
         {
            _2226._2889 = [this._4464.vo];
            vector.push(this._4464);
         }
         else
         {
            _2226._2484 = null;
         }
         if(!this._4499)
         {
            this._4468();
         }
         this._3176.stagePanel._2581();
      }
      
      private function _4468() : void
      {
         this._4491.stop();
         this._4536.prompt = "";
         this.scenePanel._4460();
         if(!this._4491.hasEventListener(TimerEvent.TIMER))
         {
            this._4491.addEventListener(TimerEvent.TIMER,function():void
            {
               scenePanel._4466();
               _4536.prompt = tr("Scene.Tree.Prompt");
            });
         }
         this._4491.start();
      }
      
      public function _4481() : void
      {
         this._4499 = null;
         this._4467 = this._2882._3997.source as _677;
         this._4456();
         if(this._4499)
         {
            _99(function():void
            {
               var _loc2_:_702 = null;
               if(_4461.length)
               {
                  for each(_loc2_ in _4461)
                  {
                     _4501(_loc2_,true);
                  }
               }
               var _loc1_:Vector.<Object> = new Vector.<Object>();
               _loc1_.push(_4499);
               scenePanel._4127(_loc1_);
            },null,1);
         }
      }
      
      private function _4456() : _677
      {
         var _loc1_:_677 = null;
         var _loc3_:* = undefined;
         var _loc2_:Dictionary = new Dictionary();
         this._4483(_loc2_);
         for(_loc3_ in _loc2_)
         {
            this._4488(_loc3_,_loc2_);
         }
         this._4463(this._4467,_loc2_);
         return this._4467;
      }
      
      private function _4483(param1:Dictionary) : void
      {
         var fullMatch:Boolean = false;
         var filterNodes:Dictionary = param1;
         var getChildren:Function = function(param1:_702):void
         {
            var _loc3_:String = null;
            var _loc4_:int = 0;
            var _loc5_:_702 = null;
            var _loc2_:Boolean = true;
            if(_3175)
            {
               _loc2_ = _4469(param1);
            }
            if(_loc2_)
            {
               _loc3_ = param1.vo is _70 ? (param1.vo as _70)._13228 : param1.vo.name;
               _loc4_ = int(StringUtil.trim(_loc3_.toLocaleLowerCase()).indexOf(_4511.toLocaleLowerCase()));
               if(_loc4_ >= 0)
               {
                  filterNodes[param1] = true;
                  _4461.push(param1);
                  if(!fullMatch)
                  {
                     _4499 = param1;
                  }
                  fullMatch = true;
               }
               if(param1.children.length)
               {
                  for each(_loc5_ in param1.children)
                  {
                     getChildren(_loc5_);
                  }
               }
            }
         };
         if(this._4467)
         {
            getChildren(this._4467);
         }
      }
      
      private function _4463(param1:_677, param2:Dictionary) : void
      {
         var _2879:_677 = param1;
         var filterNodes:Dictionary = param2;
         var remove:Function = function(param1:_702):void
         {
            var _loc2_:Array = null;
            var _loc3_:int = 0;
            var _loc4_:_702 = null;
            if(!(param1 in filterNodes))
            {
               if(param1.parent)
               {
                  _loc2_ = param1.parent.children;
                  _loc3_ = int(_loc2_.indexOf(param1));
                  if(_loc3_ >= 0)
                  {
                     if(param1 is _704)
                     {
                        if(!param1 is _704 || !param1.parent || param1.parent && !param1.parent.parent)
                        {
                           (param1 as _704).visible = true;
                        }
                        else
                        {
                           (param1 as _704).visible = false;
                        }
                     }
                  }
               }
            }
            if(param1.children.length)
            {
               for each(_loc4_ in param1.children)
               {
                  remove(_loc4_);
               }
            }
         };
         if(!_2879)
         {
            return;
         }
         remove(_2879);
      }
      
      private function _4488(param1:_702, param2:Dictionary) : void
      {
         var _loc3_:_702 = param1.parent;
         if(_loc3_)
         {
            param2[_loc3_] = true;
            this._4488(_loc3_,param2);
         }
      }
      
      public function get _3175() : Boolean
      {
         return _12462.getInstance().sceneTreeFilter;
      }
      
      private function _4450(param1:MouseEvent) : void
      {
         _12462.getInstance().sceneTreeFilter = !_12462.getInstance().sceneTreeFilter;
         this._12626();
      }
      
      public function _12626() : void
      {
         this.scenePanel.intelligentFilterButton.icon = _12462.getInstance().sceneTreeFilter ? this._4452[1] : this._4452[0];
         this._4478();
         this.scenePanel._4511 = this._4511;
         this.scenePanel._4458 = this._4471;
         this.scenePanel._4494 = this._4481;
         this.scenePanel._4465();
      }
      
      private function _4478() : void
      {
         var _loc1_:_697 = this.scenePanel.tree.dataProvider as _697;
         if(!_loc1_)
         {
            return;
         }
         if(this._3175)
         {
            _loc1_._4505 = this._4469;
         }
         else
         {
            _loc1_._4505 = null;
         }
      }
      
      private function _4469(param1:Object) : Boolean
      {
         if(!param1.parent)
         {
            return true;
         }
         if(!this._3175 || !((param1 as _702).parent.vo is _79))
         {
            return true;
         }
         if((param1 as _702).parent.children.length == 1)
         {
            return false;
         }
         return true;
      }
      
      public function _4538(param1:_702) : String
      {
         var _loc2_:String = null;
         var _loc3_:_70 = null;
         var _loc4_:_70 = null;
         var _loc5_:_685 = null;
         if(param1.vo is _79)
         {
            if(param1.children.length == 1)
            {
               _loc3_ = param1.children[0].vo;
               if(_loc3_)
               {
                  _loc2_ = _loc3_.type.toString();
                  if(_loc2_ == _74.ARMATURE.toString())
                  {
                     return ICON_ARMATURE;
                  }
                  if(_loc2_ == _74.IMAGE.toString() && this._3175)
                  {
                     if(Boolean(_79(param1.vo)._2049) && _79(param1.vo)._2049._2104.missing)
                     {
                        return ICON_SLOTMISS;
                     }
                     return ICON_IMAGE;
                  }
                  if(_loc2_ == _74.MESH.toString())
                  {
                     if(Boolean(_79(param1.vo)._2049) && _79(param1.vo)._2049._2104.missing)
                     {
                        return ICON_SLOTMISSMESH;
                     }
                     return ICON_MESH;
                  }
                  if(_loc2_ == _74.MOVIECLIP.toString() && this._3175)
                  {
                     return ICON_MOVIECLIP;
                  }
                  if(_loc2_ == _74.STAGE.toString() && this._3175)
                  {
                     return ICON_STAGE;
                  }
                  if(_loc2_ == _74.BOUNDINGBOX.toString() && this._3175)
                  {
                     if((param1.vo as _79).onlyBoundingBox)
                     {
                        return ICON_ONLYBOUNDINGBOX;
                     }
                     return ICON_BOUNDINGBOX;
                  }
               }
            }
            else
            {
               if(param1.children.length == 0)
               {
                  return ICON_NULL;
               }
               if(param1.children.length > 1)
               {
                  _loc4_ = ((param1 as _700).vo as _79)._2049;
                  for each(_loc5_ in param1.children)
                  {
                     if(_loc4_ && _loc5_.vo.id == _loc4_.id && _loc5_.visible && Boolean(_loc5_.vo))
                     {
                        _loc2_ = _loc5_.vo.type.toString();
                        if(_loc2_ == _74.ARMATURE.toString())
                        {
                           return ICON_ARMATURE;
                        }
                        if(_loc2_ == _74.IMAGE.toString())
                        {
                           if(Boolean(_79(param1.vo)._2049) && _79(param1.vo)._2049._2104.missing)
                           {
                              return ICON_SLOTMISS;
                           }
                           return ICON_IMAGE;
                        }
                        if(_loc2_ == _74.MESH.toString())
                        {
                           if(Boolean(_79(param1.vo)._2049) && _79(param1.vo)._2049._2104.missing)
                           {
                              return ICON_SLOTMISSMESH;
                           }
                           return ICON_MESH;
                        }
                        if(_loc2_ == _74.MOVIECLIP.toString() && this._3175)
                        {
                           return ICON_MOVIECLIP;
                        }
                        if(_loc2_ == _74.STAGE.toString() && this._3175)
                        {
                           return ICON_STAGE;
                        }
                        if(_loc2_ == _74.BOUNDINGBOX.toString())
                        {
                           if((param1.vo as _79).onlyBoundingBox)
                           {
                              return ICON_ONLYBOUNDINGBOX;
                           }
                           return ICON_BOUNDINGBOX;
                        }
                     }
                  }
                  return ICON_NULL;
               }
            }
            if(_79(param1.vo)._2049)
            {
               if(_79(param1.vo)._2049.type == _74.BOUNDINGBOX)
               {
                  if((param1.vo as _79).onlyBoundingBox)
                  {
                     return ICON_ONLYBOUNDINGBOX;
                  }
                  return ICON_BOUNDINGBOX;
               }
               if(_79(param1.vo)._2049._2104.missing)
               {
                  return ICON_SLOTMISS;
               }
            }
            if((param1.vo as _79).onlyBoundingBox)
            {
               return ICON_ONLYBOUNDINGBOX;
            }
         }
         return ICON_SLOT;
      }
      
      public function _4539(param1:_702) : String
      {
         if(param1.vo is _52)
         {
            if((param1.vo as _52)._1957)
            {
               return ICON_BONE_IK;
            }
         }
         return ICON_BONE_NORMAL;
      }
      
      private function _11352(param1:String, param2:String = "PanelToolBar") : void
      {
         _11110.instance._11318._11130(param2);
         _11110.instance._11318._11139(_11105.NewElement_ElementType,param1);
         _11110.instance._11318._11132();
      }
      
      private function _6927(param1:DBPanelEvent) : void
      {
         var _loc2_:_52 = null;
         var _loc3_:_52 = null;
         var _loc4_:Object = null;
         if(this.tree._2484 is _684)
         {
            this._11352(_11105.ElementType_Bone);
            _loc2_ = (this.tree._2484 as _684)._1836;
            _loc3_ = _52._1729(_124._1747("bone",_loc2_.rootArmatureData._1793),_loc2_);
            _loc4_ = _469._2916(_loc3_,_loc2_);
            _1567(new CommandNotification(CommandNotification.ADD_BONE,_loc4_));
         }
      }
      
      private function _11355(param1:DBPanelEvent) : void
      {
         var _loc2_:_52 = null;
         var _loc3_:_79 = null;
         var _loc4_:Object = null;
         if(this.tree._2484 is _684)
         {
            this._11352(_11105.ElementType_Slot);
            _loc2_ = (this.tree._2484 as _684)._1836;
            _loc3_ = _79._1729(_124._1747(_loc2_.name,_loc2_.rootArmatureData._1996),_loc2_);
            _loc4_ = _469._2897(_loc3_,_loc2_);
            _1567(new CommandNotification(CommandNotification.ADD_SLOT,_loc4_));
         }
      }
      
      private function _11351(param1:DBPanelEvent) : void
      {
         var _loc2_:_79 = null;
         var _loc3_:_52 = null;
         var _loc4_:_70 = null;
         this._11352(_11105.ElementType_BoundingBox);
         _1567(new CommandNotification(CommandNotification.CHANGE_TOOL,_716.SELECT));
         if(this.tree._2484 is _700)
         {
            _loc2_ = (this.tree._2484 as _700)._1837;
            if(_loc2_)
            {
               _loc3_ = _loc2_.parentBoneData;
               if(_loc3_)
               {
                  this._11346(_loc3_,_loc2_);
               }
            }
         }
         else if(this.tree._2484 is _685)
         {
            _loc4_ = (this.tree._2484 as _685).displayVO;
            if(_loc4_)
            {
               _loc2_ = _loc4_._1760;
               if(_loc2_)
               {
                  _loc3_ = _loc2_.parentBoneData;
                  if(_loc3_)
                  {
                     this._11346(_loc3_,_loc2_);
                  }
               }
            }
         }
         else if(this.tree._2484 is _684)
         {
            _loc3_ = (this.tree._2484 as _684)._1836;
            if(_loc3_)
            {
               this._11347(_loc3_);
            }
         }
      }
      
      private function _11347(param1:_52) : void
      {
         var _loc2_:_11219 = null;
         var _loc3_:_70 = null;
         var _loc4_:_79 = null;
         var _loc5_:Object = null;
         var _loc6_:String = _124._1747(param1.name + "_" + _11219.DEFAULT_NAME,param1.rootArmatureData._1996);
         (_loc4_ = _79._1729(_loc6_,param1)).onlyBoundingBox = true;
         _loc2_ = new _11219(true);
         _loc2_.name = _124._1747(param1.name + "_" + _11219.DEFAULT_NAME,param1.rootArmatureData._11282);
         _loc2_.type = BoundingBoxType.POLYGON;
         _loc3_ = _70._11276(_loc2_);
         _loc5_ = _469._3482(_loc3_,param1.rootArmatureData._1795.name,_loc4_,param1);
         _1567(new CommandNotification(CommandNotification.ADD_DISPLAY_TO_BONE,_loc5_));
         this._11296._11350();
      }
      
      private function _11346(param1:_52, param2:_79) : void
      {
         var _loc3_:_11219 = null;
         var _loc4_:_70 = null;
         var _loc5_:Object = null;
         _loc3_ = new _11219(true);
         _loc3_.name = _124._1747(param1.name + "_" + _11219.DEFAULT_NAME,param1.rootArmatureData._11282);
         _loc3_.type = BoundingBoxType.POLYGON;
         _loc4_ = _70._11276(_loc3_);
         _loc5_ = _469._2895(_loc4_,param1.rootArmatureData._1795.name,param2);
         _1567(new CommandNotification(CommandNotification.ADD_DISPLAY_TO_SLOT,_loc5_));
         this._11296._11350();
      }
      
      private function _4484(param1:MouseEvent = null) : void
      {
         if(!this._12628)
         {
            this._4486();
         }
      }
      
      private function _4515(param1:_9) : void
      {
         if(this._2873 == _715.GENERAL)
         {
            this._4484();
         }
         else if(this.removeBtn.enabled)
         {
            this._4484();
         }
      }
      
      private function _4524(param1:StageNotification) : void
      {
         _1565(StageNotification.STOP_PICK,this._4439);
         this.tree.addEventListener(IndexChangeEvent.CHANGING,this._4474);
         this.tree.addEventListener(ListEvent.ITEM_CLICK,this._4487);
         this._4222();
      }
      
      private function _4439(param1:StageNotification) : void
      {
         var notification:StageNotification = param1;
         _1564(StageNotification.STOP_PICK,this._4439);
         this.tree.removeEventListener(ListEvent.ITEM_CLICK,this._4487);
         this._4222();
         _99(function():void
         {
            tree.removeEventListener(IndexChangeEvent.CHANGING,_4474);
         });
      }
      
      private function _4474(param1:IndexChangeEvent) : void
      {
         param1.preventDefault();
      }
      
      private function _4487(param1:ListEvent) : void
      {
         if(param1.item is _684)
         {
            _1567(new StageNotification(StageNotification.PICK_ITEM,(param1.item as _684)._1836));
         }
         _524._3785("click","pick");
      }
      
      private function _4496(param1:MouseEvent) : void
      {
         this.scenePanel._4507 = true;
         this._4222();
      }
      
      private function _4506(param1:MouseEvent) : void
      {
         this.scenePanel._4507 = false;
         this._4222();
         if(this._10587.running)
         {
            this._10587.reset();
         }
      }
      
      private function _4436(param1:Array, param2:_52) : void
      {
         var _loc3_:String = null;
         var _loc4_:Object = param1[0];
         if(_loc4_ is _52)
         {
            _loc3_ = CommandNotification.SET_BONES_PARENT;
         }
         else if(_loc4_ is _79)
         {
            _loc3_ = CommandNotification.SET_SLOTS_PARENT;
         }
         else if(_loc4_ is _70)
         {
            _loc3_ = CommandNotification.SET_DISPLAY_ITEMS_PARENT_TO_BONE;
         }
         _1567(new CommandNotification(_loc3_,_469._2874(param1,param2)));
      }
      
      private function _4222() : void
      {
         if(_530.instance._3832 && this.scenePanel._4507)
         {
            _14.setCursor(_12.CURSOR_PICK);
         }
         else
         {
            _14.setCursor(_12.AUTO);
         }
      }
      
      private function _4486() : void
      {
         var onCloseBtnClick:Function;
         var checkFunction:Function;
         if(this._2865._1811 == SymbolType.ARMATURE)
         {
            onCloseBtnClick = function(param1:CloseEvent):void
            {
               var _loc2_:Array = null;
               var _loc3_:Object = null;
               if(param1.detail == Alert.FIRST_BUTTON)
               {
                  _loc2_ = [];
                  for each(_loc3_ in _2226._2889)
                  {
                     if(_loc3_ is _52 && (_loc3_ as _52).parentBoneData != null || _loc3_ is _79 || _loc3_ is _70)
                     {
                        _loc2_.push(_loc3_);
                     }
                  }
                  _1567(new CommandNotification(CommandNotification.DELETE_TRANSFORM_ITEMS,_loc2_));
               }
            };
            checkFunction = function(param1:DBModelEvent):void
            {
               _2216.deleteConfirm = !param1.data;
            };
            _133.show(tr("RemoveWindow.content"),tr("RemoveWindow.title"),null,onCloseBtnClick,tr("Alert.Confirm"),tr("Alert.Cancel"),"",_2216.deleteConfirm,checkFunction);
         }
         else if(this._2865._1811 == SymbolType.MC || this._2865._1811 == SymbolType.STAGE)
         {
            _1567(new TimelineNotification(TimelineNotification.CLEAR_KEY_FRAME));
         }
      }
      
      private function _3984(param1:MouseEvent) : void
      {
         var _loc2_:_702 = this.tree._2484;
         if(!_loc2_)
         {
            return;
         }
         this.rename(_loc2_);
      }
      
      private function _4473(param1:Array) : Boolean
      {
         var _loc2_:Class = null;
         var _loc3_:_702 = null;
         if(this._2873 != _715.ARMATURE)
         {
            return false;
         }
         if(param1.length > 1)
         {
            _loc3_ = param1[0] as _702;
            if(_loc3_ is _684)
            {
               _loc2_ = _684;
            }
            else if(_loc3_ is _700)
            {
               _loc2_ = _700;
            }
            else if(_loc3_ is _685)
            {
               _loc2_ = _685;
            }
            for each(_loc3_ in param1)
            {
               if(!(_loc3_ is _loc2_))
               {
                  return false;
               }
            }
         }
         return true;
      }
      
      private function _3552(param1:IndexChangeEvent) : void
      {
         var _loc4_:Object = null;
         var _loc2_:Vector.<Object> = this.tree._2889;
         var _loc3_:Array = [];
         for each(_loc4_ in _loc2_)
         {
            _loc3_.push((_loc4_ as _702).vo);
         }
         _1567(new CommandNotification(CommandNotification.SELECT_ITEMS,_loc3_));
      }
      
      private function _14579(param1:_52) : Boolean
      {
         var _loc2_:_52 = null;
         var _loc4_:Object = null;
         var _loc3_:Array = _530.instance._14525;
         if(!param1)
         {
            return false;
         }
         if(!_loc3_)
         {
            return true;
         }
         for each(_loc4_ in _loc3_)
         {
            if(_loc4_ == param1)
            {
               return false;
            }
         }
         return true;
      }
      
      private function _14574(param1:Boolean) : void
      {
         if(param1)
         {
            _14.setCursor(_12.CURSOR_PICK);
         }
         else
         {
            _14.setCursor(_1405.DESKTOP_DISABLE);
         }
      }
      
      private function _4124(param1:ListEvent) : void
      {
         var _loc3_:Boolean = false;
         var _loc4_:_725 = null;
         var _loc5_:_70 = null;
         var _loc6_:DisplayObject = null;
         var _loc7_:Object = null;
         var _loc2_:_702 = param1.itemRenderer.data as _702;
         if(_530.instance._3832)
         {
            _loc3_ = this._14579(_loc2_.vo as _52);
            this._14574(_loc3_);
         }
         if(this._10588)
         {
            if(this._10587.running)
            {
               this._10587.reset();
            }
            this._10587.start();
            this._10586 = param1.itemRenderer as TreeItemRenderer;
         }
         if(_loc2_ is _684)
         {
            if(_2226._3367(_loc2_.vo))
            {
               _1567(new StageNotification(StageNotification.ROLLOVER_BONE,_loc2_.vo));
            }
         }
         else if(_loc2_ is _700 || _loc2_ is _685)
         {
            if(_loc2_ is _700)
            {
               if(_2226._3367(_loc2_.vo))
               {
                  _1567(new StageNotification(StageNotification.ROLLOVER_SLOT,_loc2_.vo));
               }
               if((_loc2_ as _700)._1837._2049)
               {
                  _loc4_ = (_loc2_ as _700)._1837._2049._2104;
               }
            }
            else
            {
               _loc5_ = _loc2_.vo as _70;
               if(_loc5_._2100 && _2226._3367(_loc5_._1760))
               {
                  _1567(new StageNotification(StageNotification.ROLLOVER_SLOT,_loc5_._1760));
               }
               _loc4_ = (_loc2_ as _685).displayVO._2104;
            }
            if(_loc4_)
            {
               _loc6_ = param1.itemRenderer as DisplayObject;
               _loc7_ = {
                  "_2104":_loc4_,
                  "render":_loc6_
               };
               _1567(new TipNotification(TipNotification.SHOW_TIP_IMAGE,_loc7_));
               if(Boolean(param1.item) && Boolean(param1.item.hasOwnProperty("name")))
               {
                  _1567(new CommandNotification(CommandNotification.SHOW_TOOL_TIP,{
                     "type":_717.DEFAULT,
                     "showText":param1.item.name
                  }));
               }
            }
         }
      }
      
      private function _4125(param1:ListEvent) : void
      {
         var _loc2_:_702 = param1.itemRenderer.data as _702;
         if(_loc2_ is _684)
         {
            _1567(new StageNotification(StageNotification.ROLLOUT_BONE,_loc2_.vo));
         }
         else if(_loc2_ is _700)
         {
            _1567(new StageNotification(StageNotification.ROLLOUT_SLOT,_loc2_.vo));
         }
         else if(_loc2_ is _685)
         {
            _1567(new StageNotification(StageNotification.ROLLOUT_SLOT,(_loc2_.vo as _70)._1760));
         }
         _1567(new TipNotification(TipNotification.HIDE_TIP_IMAGE));
         _1567(new CommandNotification(CommandNotification.HIDE_TOOL_TIP,_717.DEFAULT));
         if(_2226._2889.length < 1)
         {
            _1567(new CommandNotification(CommandNotification.HIDE_TOOL_TIP,_717.HIGH_LIGHT));
         }
         else
         {
            _1567(new CommandNotification(CommandNotification.DISPLAY_TOOL_TIP,_717.HIGH_LIGHT));
         }
      }
      
      private function _4457(param1:ListEvent) : void
      {
         var _loc2_:String = null;
         var _loc3_:Boolean = false;
         var _loc4_:Array = null;
         var _loc5_:_702 = null;
         var _loc6_:_702 = null;
         var _loc7_:_702 = null;
         if(_530.instance._3832)
         {
            return;
         }
         if(this.tree._2889.length > 1)
         {
            _loc3_ = true;
            _loc4_ = [];
            for each(_loc5_ in this.tree._2889)
            {
               if(!_loc2_)
               {
                  _loc2_ = getQualifiedClassName(_loc5_);
                  if(_loc3_)
                  {
                     _loc4_.push(_loc5_.vo);
                  }
               }
               else
               {
                  if(_loc2_ != getQualifiedClassName(_loc5_))
                  {
                     _loc3_ = false;
                     _loc4_ = [];
                     break;
                  }
                  if(_loc3_)
                  {
                     _loc4_.push(_loc5_.vo);
                  }
               }
            }
            if(_loc3_)
            {
               _1567(new CommandNotification(CommandNotification.SELECT_ITEMS,_loc4_));
            }
            else
            {
               _loc6_ = param1.item as _702;
               if(_loc6_)
               {
                  _1567(new CommandNotification(CommandNotification.SELECT_ITEMS,[_loc6_.vo]));
               }
            }
         }
         else
         {
            _loc7_ = param1.item as _702;
            if(_loc7_)
            {
               _1567(new CommandNotification(CommandNotification.SELECT_ITEMS,[_loc7_.vo]));
            }
         }
      }
      
      private function _4470(param1:ListEvent) : void
      {
         var _loc2_:String = null;
         var _loc5_:_702 = null;
         var _loc6_:_702 = null;
         var _loc7_:_712 = null;
         if(_530.instance._3832)
         {
            return;
         }
         var _loc3_:Boolean = true;
         var _loc4_:Array = [];
         for each(_loc5_ in this.tree._2889)
         {
            if(!_loc2_)
            {
               _loc2_ = getQualifiedClassName(_loc5_);
               if(_loc3_)
               {
                  _loc4_.push(_loc5_.vo);
               }
            }
            else
            {
               if(_loc2_ != getQualifiedClassName(_loc5_))
               {
                  _loc3_ = false;
                  _loc4_ = [];
                  break;
               }
               if(_loc3_)
               {
                  _loc4_.push(_loc5_.vo);
               }
            }
         }
         _loc6_ = param1.item as _702;
         if(!_loc3_)
         {
            _loc4_ = [_loc6_.vo];
         }
         if(_loc6_)
         {
            if(_loc6_ is _677)
            {
               _loc7_ = _712.MAIN_SYMBOL;
            }
            else if(_loc6_ is _684)
            {
               _loc7_ = _712.BONE;
            }
            else if(_loc6_ is _700)
            {
               _loc7_ = _712.SLOT;
            }
            else if(_loc6_ is _685)
            {
               _loc7_ = _712._4476((_loc6_ as _685).displayVO.type);
            }
            this._3975._3934(_711.SCENE_PANEL,_loc7_,_loc4_);
            param1.stopPropagation();
         }
      }
      
      private function _3561(param1:ListEvent) : void
      {
         var _loc2_:_702 = param1.itemRenderer.data as _702;
         if(_loc2_ is _677 || _loc2_ is _684 || _loc2_ is _700)
         {
            if(param1.relatedObject is TextField)
            {
               this.rename(_loc2_);
            }
         }
         else if(_loc2_ is _685)
         {
            if(param1.relatedObject is TextField)
            {
               if((_loc2_ as _685).displayVO.type == _74.BOUNDINGBOX)
               {
                  this.rename(_loc2_);
               }
            }
            else
            {
               this.switchDisplay((_loc2_ as _685).displayVO);
            }
         }
         param1.stopPropagation();
      }
      
      private function rename(param1:_702) : void
      {
         var curName:String = null;
         var renameDialog:_150 = null;
         var onKeyDown:Function = null;
         var onRenameClose:Function = null;
         var treeNode:_702 = param1;
         onKeyDown = function(param1:KeyboardEvent):void
         {
            if(param1.keyCode == 13)
            {
               if(renameDialog.value == "" || checkSameName(renameDialog.value) || !renameDialog._13693)
               {
                  return;
               }
               renameDialog.confirmation();
               renameDialog.removeEventListener(KeyboardEvent.KEY_DOWN,onKeyDown);
            }
         };
         var checkSameName:Function = function(param1:String):String
         {
            var _loc2_:String = null;
            var _loc3_:_52 = null;
            var _loc4_:_79 = null;
            var _loc5_:_50 = null;
            var _loc6_:_70 = null;
            var _loc7_:_71 = null;
            if(treeNode is _684)
            {
               _loc3_ = (treeNode as _684)._1836;
               if(_loc3_.rootArmatureData._1793(param1))
               {
                  _loc2_ = tr("Rename.bone.same");
               }
            }
            else if(treeNode is _700)
            {
               _loc4_ = (treeNode as _700)._1837;
               if(_loc4_.parentBoneData.rootArmatureData._1996(param1))
               {
                  _loc2_ = tr("Rename.slot.same");
               }
            }
            else if(treeNode is _677)
            {
               _loc5_ = (treeNode as _677)._1886;
               _loc7_ = _2214._1844._2871.dragonBonesVO;
               if(_loc7_._2129(param1))
               {
                  _loc2_ = tr("Rename.bone.same");
               }
            }
            else if(treeNode is _685)
            {
               _loc6_ = (treeNode as _685).displayVO;
               if((_loc6_) && _loc6_._1760 && _loc6_._1760._2159(param1))
               {
                  _loc2_ = tr("Rename.display.same");
               }
            }
            return _loc2_;
         };
         onRenameClose = function(param1:Event):void
         {
            var _loc4_:Object = null;
            var _loc5_:String = null;
            var _loc2_:_150 = param1.currentTarget as _150;
            var _loc3_:String = _loc2_.value;
            if(_loc3_ == null)
            {
               return;
            }
            if(treeNode is _677)
            {
               _loc4_ = (treeNode as _677)._1886;
               _loc5_ = CommandNotification.MODIFY_ARMATURE_NAME;
            }
            else if(treeNode is _684)
            {
               _loc4_ = (treeNode as _684)._1836;
               _loc5_ = CommandNotification.MODIFY_BONE_NAME;
            }
            else if(treeNode is _700)
            {
               _loc4_ = (treeNode as _700)._1837;
               _loc5_ = CommandNotification.MODIFY_SLOT_NAME;
            }
            else if(treeNode is _685)
            {
               _loc4_ = (treeNode as _685).displayVO;
               if((Boolean(_loc4_)) && (treeNode as _685).displayVO.type == _74.BOUNDINGBOX)
               {
                  _loc5_ = CommandNotification.MODIFY_BOUNDINGBOX_NAME;
               }
               else
               {
                  if(!(Boolean(_loc4_) && (treeNode as _685).displayVO.type != _74.BOUNDINGBOX))
                  {
                     return;
                  }
                  _loc5_ = CommandNotification.MODIFY_DISPLAY_NAME;
               }
            }
            if(_loc4_)
            {
               _1567(new CommandNotification(_loc5_,_469._3493(_loc4_,_loc3_)));
            }
         };
         if(!treeNode)
         {
            return;
         }
         curName = treeNode.name;
         if(treeNode is _685)
         {
            curName = (treeNode.vo as _70)._13228;
         }
         renameDialog = new _150();
         renameDialog.title = tr("RenameWindow.title");
         renameDialog._2653 = tr("RenameWindow.newName");
         renameDialog.value = curName;
         renameDialog._2651 = function(param1:String):String
         {
            if(!param1)
            {
               return "";
            }
            if(param1 == curName)
            {
               return tr("RenameWindow.error.same");
            }
            if(_124.vertifyFileName(param1))
            {
               return tr("Rename.invalid.name","/\\:*?\"\' <>|.@#$%^&!~");
            }
            return checkSameName(param1);
         };
         renameDialog.addEventListener(Event.CLOSE,onRenameClose);
         renameDialog.addEventListener(KeyboardEvent.KEY_DOWN,onKeyDown);
         renameDialog.open();
      }
      
      private function timerComplete(param1:TimerEvent) : void
      {
         this._10587.reset();
         if(this._10586 && !this._10586.opened && !this._12627)
         {
            this._10586._2615.dispatchEvent(new MouseEvent(MouseEvent.MOUSE_DOWN));
         }
      }
      
      private function _4472(param1:ListDragEvent) : void
      {
         var _loc4_:_725 = null;
         var _loc7_:int = 0;
         var _loc8_:_79 = null;
         var _loc9_:Boolean = false;
         var _loc10_:Vector.<_862> = null;
         var _loc11_:Vector.<_861> = null;
         var _loc12_:_1070 = null;
         var _loc2_:_1111 = param1._1611;
         if(!this._4525(_loc2_))
         {
            return;
         }
         if(this._10587.running)
         {
            this._10587.reset();
         }
         this._10587.start();
         this._10586 = param1.itemRenderer as TreeItemRenderer;
         var _loc3_:_702 = param1.item as _702;
         var _loc5_:Vector.<_725> = new Vector.<_725>();
         var _loc6_:int = 0;
         if(_loc2_.hasFormat(DBDragFormat.IMAGE))
         {
            _loc10_ = _loc2_._4508(DBDragFormat.IMAGE) as Vector.<_862>;
            _loc6_ = 0;
            _loc7_ = int(_loc10_.length);
            while(_loc6_ < _loc7_)
            {
               _loc5_.push(_loc10_[_loc6_]._2104);
               _loc6_++;
            }
         }
         else
         {
            _loc11_ = _loc2_._4508(DBDragFormat.ARMATURE) as Vector.<_861>;
            _loc6_ = 0;
            _loc7_ = int(_loc11_.length);
            while(_loc6_ < _loc7_)
            {
               _loc5_.push(_loc11_[_loc6_]._2104);
               _loc6_++;
            }
         }
         if(_loc3_ is _700)
         {
            _loc8_ = _loc3_.vo as _79;
         }
         else if(_loc3_ is _685)
         {
            _loc8_ = (_loc3_.vo as _70)._1760;
         }
         if(_loc8_)
         {
            if(_loc8_.onlyBoundingBox)
            {
               return;
            }
         }
         else
         {
            _loc9_ = true;
         }
         if(_loc3_ is _684 || !_loc9_)
         {
            _loc12_ = param1.itemRenderer;
            DragManager.acceptDragDrop(_loc12_ as InteractiveObject);
            _loc12_.addEventListener(DragEvent.DRAG_DROP,this._4532);
            _loc12_.addEventListener(DragEvent.DRAG_EXIT,this._4531);
         }
      }
      
      private function _4525(param1:_1111) : Boolean
      {
         var _loc2_:* = false;
         var _loc3_:Vector.<_861> = null;
         var _loc4_:_50 = null;
         var _loc5_:String = null;
         if(param1)
         {
            if(param1.hasFormat(DBDragFormat.IMAGE))
            {
               _loc2_ = true;
            }
            else if(param1.hasFormat(DBDragFormat.ARMATURE))
            {
               _loc3_ = param1._4508(DBDragFormat.ARMATURE) as Vector.<_861>;
               _loc4_ = (_loc3_[0]._2104 as _723)._1886;
               _loc5_ = _2214._1844._2871._2865.name;
               _loc2_ = !_2214._1844._2871.dragonBonesVO._2127(_loc4_,_loc5_);
            }
         }
         return _loc2_;
      }
      
      private function _4532(param1:DragEvent) : void
      {
         this.stopDrag(param1.currentTarget as IEventDispatcher);
         this._4541(param1._1611,((param1.currentTarget as _927).data as _702).vo);
      }
      
      private function _4531(param1:DragEvent) : void
      {
         this.stopDrag(param1.currentTarget as IEventDispatcher);
      }
      
      private function startDrag(param1:IEventDispatcher) : void
      {
         DragManager.acceptDragDrop(param1 as InteractiveObject);
         param1.addEventListener(DragEvent.DRAG_DROP,this._4532);
         param1.addEventListener(DragEvent.DRAG_EXIT,this._4531);
      }
      
      private function stopDrag(param1:IEventDispatcher) : void
      {
         param1.removeEventListener(DragEvent.DRAG_DROP,this._4532);
         param1.removeEventListener(DragEvent.DRAG_EXIT,this._4531);
      }
      
      private function _4541(param1:_1111, param2:Object) : void
      {
         var _loc3_:Object = null;
         var _loc4_:_725 = null;
         var _loc5_:Vector.<_725> = null;
         var _loc6_:_70 = null;
         var _loc7_:_79 = null;
         var _loc8_:Array = null;
         var _loc9_:Vector.<_862> = null;
         var _loc10_:Vector.<_861> = null;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:_52 = null;
         var _loc14_:String = null;
         var _loc15_:String = null;
         if(this._4525(param1))
         {
            _loc5_ = new Vector.<_725>();
            if(param1.hasFormat(DBDragFormat.IMAGE))
            {
               _loc9_ = param1._4508(DBDragFormat.IMAGE) as Vector.<_862>;
               _loc11_ = 0;
               _loc12_ = int(_loc9_.length);
               while(_loc11_ < _loc12_)
               {
                  _loc5_.push(_loc9_[_loc11_]._2104);
                  _loc11_++;
               }
            }
            else
            {
               _loc10_ = param1._4508(DBDragFormat.ARMATURE) as Vector.<_861>;
               _loc11_ = 0;
               _loc12_ = int(_loc10_.length);
               while(_loc11_ < _loc12_)
               {
                  _loc5_.push(_loc10_[_loc11_]._2104);
                  _loc11_++;
               }
            }
            _loc8_ = [];
            if(param2 is _52)
            {
               _loc11_ = 0;
               _loc12_ = int(_loc5_.length);
               while(_loc11_ < _loc12_)
               {
                  _loc4_ = _loc5_[_loc11_];
                  _loc6_ = _70._2090(_loc4_);
                  _loc13_ = param2 as _52;
                  _loc14_ = _124._1747(_loc6_._2120,_loc13_.rootArmatureData._1996);
                  _loc7_ = _79._1729(_loc14_,_loc13_);
                  _loc3_ = _469._3482(_loc6_,_loc13_.rootArmatureData._1795.name,_loc7_,_loc13_);
                  _loc8_.push(_loc3_);
                  _loc11_++;
               }
               _1567(new CommandNotification(CommandNotification.ADD_DISPLAYS_TO_BONE,_loc8_));
               return;
            }
            if(param2 is _79 || param2 is _70)
            {
               _loc7_ = param2 is _79 ? param2 as _79 : (param2 as _70)._1760;
               _loc11_ = 0;
               _loc12_ = int(_loc5_.length);
               while(_loc11_ < _loc12_)
               {
                  _loc4_ = _loc5_[_loc11_];
                  if(!_loc7_._2159(_loc4_.name))
                  {
                     _loc6_ = _70._2090(_loc4_);
                     _loc3_ = _469._2895(_loc6_,_loc7_.parentBoneData.rootArmatureData._1795.name,_loc7_);
                     _loc8_.push(_loc3_);
                  }
                  else
                  {
                     _loc15_ = _loc7_._13231(_loc4_.name);
                     (_loc6_ = _70._2090(_loc4_))._13228 = _loc15_;
                     _loc3_ = _469._2895(_loc6_,_loc7_.parentBoneData.rootArmatureData._1795.name,_loc7_);
                     _loc8_.push(_loc3_);
                  }
                  _loc11_++;
               }
               _1567(new CommandNotification(CommandNotification.ADD_DISPLAYS_TO_SLOT,_loc8_));
            }
         }
      }
      
      private function _4119(param1:TreeDragEvent) : void
      {
         var _loc6_:int = 0;
         this.scenePanel._13813 = Shortcut._1677() ? true : false;
         var _loc2_:_702 = param1._3597[0];
         _1567(new PanelNotification(PanelNotification.SCENETREE_START_DRAG));
         stage.addEventListener(MouseEvent.MOUSE_UP,this._4126);
         if(!Shortcut._1677())
         {
            this._10588 = true;
            return;
         }
         var _loc3_:_702 = _loc2_.parent;
         var _loc4_:Array = _loc3_.children;
         var _loc5_:_697 = this.tree.dataProvider as _697;
         if(_loc3_ && _loc4_ && _loc4_.length > 0)
         {
            this._13809 = [];
            _loc6_ = 0;
            while(_loc6_ < _loc4_.length)
            {
               if(_loc5_._4530(_loc4_[_loc6_]))
               {
                  _loc5_._4529(_loc4_[_loc6_],false);
                  this._13809.push(_loc4_[_loc6_]);
               }
               _loc6_++;
            }
         }
      }
      
      private function _13808(param1:TreeDragEvent) : void
      {
         var event:TreeDragEvent = param1;
         this.scenePanel._13813 = false;
         if(!this._13809 || this._13809.length <= 0)
         {
            return;
         }
         _99(function():void
         {
            var _loc1_:_697 = tree.dataProvider as _697;
            var _loc2_:int = 0;
            while(_loc2_ < _13809.length)
            {
               _loc1_._4529(_13809[_loc2_],true);
               _loc2_++;
            }
            _13809 = null;
         },null,0);
      }
      
      private function _4453(param1:TreeDragEvent) : void
      {
         var _loc3_:_702 = null;
         var _loc4_:_702 = null;
         var _loc5_:_702 = null;
         var _loc6_:Object = null;
         var _loc7_:_91 = null;
         var _loc8_:_79 = null;
         var _loc9_:Array = null;
         var _loc10_:Array = null;
         var _loc11_:_70 = null;
         var _loc12_:Array = null;
         var _loc13_:_70 = null;
         var _loc14_:Object = null;
         var _loc15_:_91 = null;
         var _loc16_:_70 = null;
         var _loc17_:String = null;
         var _loc18_:Array = null;
         var _loc19_:String = null;
         var _loc20_:Array = null;
         var _loc21_:_79 = null;
         var _loc2_:Array = [];
         for each(_loc3_ in param1._3597)
         {
            _loc2_.push(_loc3_.vo);
         }
         _loc4_ = param1._3597[0];
         _loc5_ = param1._4137 as _702;
         if(_loc4_ is _684)
         {
            if(_loc5_ is _684)
            {
               _loc6_ = _469._2874(_loc2_,(_loc5_ as _684)._1836);
               _1567(new CommandNotification(CommandNotification.SET_BONES_PARENT,_loc6_));
            }
         }
         else if(_loc4_ is _700)
         {
            if(_loc5_ is _684)
            {
               _loc6_ = _469._2874(_loc2_,(_loc5_ as _684)._1836);
               _1567(new CommandNotification(CommandNotification.SET_SLOTS_PARENT,_loc6_));
            }
            if(_loc5_ is _700)
            {
               _loc9_ = [];
               _loc7_ = (_loc5_ as _700)._1837;
               _loc10_ = [];
               _loc12_ = [];
               for each(_loc8_ in _loc2_)
               {
                  _loc12_.push(_loc8_);
                  for each(_loc13_ in _loc8_._1765)
                  {
                     _loc10_.push(_loc13_);
                  }
                  if(_loc8_._2156)
                  {
                     _loc9_.push(_loc8_._2156._2097 ? null : _loc8_._2156._1760._2156);
                     _loc11_ = _loc8_._2156;
                  }
               }
               if(_loc10_.length > 0)
               {
                  _loc6_ = _469._3468(_loc10_,_loc7_,!!_loc11_ ? _loc11_ : _loc10_[0],_loc9_,null);
                  if(_loc7_)
                  {
                     (_loc14_ = new Object())._10560 = _loc6_;
                     _loc14_._10559 = _loc12_;
                     _1567(new CommandNotification(CommandNotification.DRAG_SLOT_TO_SLOT,_loc14_));
                  }
               }
            }
         }
         else if(_loc4_ is _685)
         {
            _loc18_ = [];
            if(_loc5_ is _700)
            {
               _loc15_ = (_loc5_ as _700)._1837;
               for each(_loc16_ in _loc2_)
               {
                  if((_loc15_ as _79)._2159(_loc16_._13230))
                  {
                     _loc19_ = (_loc15_ as _79)._13231(_loc16_._13230);
                     _loc16_._13228 = _loc19_;
                  }
                  _loc18_.push(_loc16_._2097 ? null : _loc16_._1760._2156);
               }
               _loc6_ = _469._3468(_loc2_,_loc15_,_loc2_[0],_loc18_,null);
               _loc17_ = CommandNotification.SET_DISPLAY_ITEMS_PARENT_TO_SLOT;
            }
            else if(_loc5_ is _684)
            {
               _loc15_ = (_loc5_ as _684)._1836;
               _loc20_ = [];
               for each(_loc16_ in _loc2_)
               {
                  _loc21_ = _79._1729(_124._1747(_loc16_.name,(_loc15_ as _52).rootArmatureData._1996),_loc15_ as _52);
                  if(_loc16_.type == _74.BOUNDINGBOX)
                  {
                     _loc21_.onlyBoundingBox = true;
                  }
                  _loc20_.push(_loc21_);
                  _loc18_.push(_loc16_._2097 ? null : _loc16_._1760._2156);
               }
               _loc6_ = _469._3467(_loc2_,_loc15_,_loc20_,_loc18_);
               _loc17_ = CommandNotification.SET_DISPLAY_ITEMS_PARENT_TO_BONE;
            }
            if(_loc15_)
            {
               _1567(new CommandNotification(_loc17_,_loc6_));
            }
         }
         param1.preventDefault();
      }
      
      private function _4126(param1:MouseEvent) : void
      {
         this._10588 = false;
         stage.removeEventListener(MouseEvent.MOUSE_UP,this._4126);
         _1567(new PanelNotification(PanelNotification.SCENETREE_STOP_DRAG));
      }
      
      private function _4451() : void
      {
         var _loc2_:Object = null;
         if(!this.scenePanel || !this.tree || !this.newDropList || !this.renameBtn)
         {
            return;
         }
         var _loc1_:int = !!_2226._2889 ? int(_2226._2889.length) : 0;
         if(this.intelligentFilterButton)
         {
            this.intelligentFilterButton.enabled = true;
         }
         if(_loc1_ == 0)
         {
            this.newDropList._11354 = this.newDropList._11353 = this.renameBtn.enabled = this.removeBtn.enabled = this.newDropList._11344 = false;
         }
         else if(this._11296.editing)
         {
            this.newDropList._11354 = this.newDropList._11353 = this.renameBtn.enabled = this.removeBtn.enabled = this.newDropList._11344 = false;
         }
         else if(_loc1_ == 1)
         {
            _loc2_ = _2226._2889[0];
            if(_loc2_)
            {
               this.newDropList._11354 = this.newDropList._11353 = _loc2_ is _52 && this._2873 == _715.ARMATURE;
               this.removeBtn.enabled = (_loc2_ is _52 && (_loc2_ as _52).parentBoneData != null || _loc2_ is _79 || _loc2_ is _70) && this._2873 == _715.ARMATURE && !this._11296.editing;
               this.newDropList._11344 = this._11349;
            }
         }
         else if(_loc1_ > 1)
         {
            this.newDropList._11354 = this.newDropList._11353 = this.renameBtn.enabled = this.removeBtn.enabled = this.newDropList._11344 = false;
            if(this._2873 == _715.ARMATURE)
            {
               for each(_loc2_ in _2226._2889)
               {
                  if(_loc2_ && (_loc2_ is _52 && (_loc2_ as _52).parentBoneData != null) || _loc2_ is _79 || _loc2_ is _70)
                  {
                     this.removeBtn.enabled = true;
                     break;
                  }
               }
            }
         }
         this.newDropList._4891();
      }
      
      private function get _11349() : Boolean
      {
         var _loc1_:Object = this.tree._2484;
         return (_loc1_ is _684 || _loc1_ is _700 && (_loc1_ as _700)._1837 && (_loc1_ as _700)._1837.onlyBoundingBox || _loc1_ is _685 && (_loc1_ as _685).displayVO && (_loc1_ as _685).displayVO._1760 && (_loc1_ as _685).displayVO._1760.onlyBoundingBox) && this._2873 == _715.ARMATURE && !this._11296.editing;
      }
      
      public function _2943(param1:_702) : void
      {
         if(param1)
         {
            this.tree.dataProvider._4016(param1);
            this._4462();
         }
      }
      
      public function _3339() : void
      {
         var _loc2_:_52 = null;
         var _loc3_:_79 = null;
         var _loc1_:_50 = this._4133._2865;
         for each(_loc2_ in _loc1_._1779)
         {
            this.tree.dataProvider._4016(_705._2944[_loc2_]);
         }
         for each(_loc3_ in _loc1_._1780)
         {
            this.tree.dataProvider._4016(_705._2273[_loc3_]);
         }
      }
      
      public function _3338(param1:String, param2:int = 0) : void
      {
         var _loc3_:* = false;
         if(this._4492)
         {
            if(param1 == "selectable")
            {
               if(this._4492._4510)
               {
                  if(param2 == 0)
                  {
                     _loc3_ = !this._4492._4510.selected;
                  }
                  else if(param2 == 1)
                  {
                     _loc3_ = true;
                  }
                  else
                  {
                     _loc3_ = false;
                  }
                  this._4492._4510.selected = _loc3_;
               }
            }
            else if(this._4492._4528)
            {
               if(param2 == 0)
               {
                  _loc3_ = !this._4492._4528.selected;
               }
               else if(param2 == 1)
               {
                  _loc3_ = true;
               }
               else
               {
                  _loc3_ = false;
               }
               this._4492._4528.selected = _loc3_;
            }
         }
      }
      
      public function get _3357() : int
      {
         if(Boolean(this._4492) && Boolean(this._4492._4510))
         {
            if(this._4492._4510.selected)
            {
               return 1;
            }
            return 2;
         }
         return 0;
      }
      
      public function get _3356() : int
      {
         if(Boolean(this._4492) && Boolean(this._4492._4528))
         {
            if(this._4492._4528.selected)
            {
               return 1;
            }
            return 2;
         }
         return 0;
      }
      
      public function _2891() : void
      {
         var _loc1_:Number = NaN;
         if(Boolean(this.tree) && Boolean(this.tree._2490))
         {
            _loc1_ = this.tree._2490.verticalScrollPosition;
            this._4493._3997.refresh();
            this.tree._2449();
            this.tree._2490.verticalScrollPosition = _loc1_;
            this._4023(null);
         }
      }
      
      public function _3209(param1:Object, param2:String, param3:Boolean) : void
      {
         var _loc4_:String = null;
         if(param1 is _50)
         {
            _loc4_ = CommandNotification.CHANGE_ARMAUTRE_STAGE_FILTER;
         }
         else
         {
            _loc4_ = CommandNotification.CHANGE_ITEM_STAGE_FILTER;
         }
         _1567(new CommandNotification(_loc4_,_469._3475(param1,param2,param3)));
      }
      
      public function showAll() : void
      {
         _1567(new CommandNotification(CommandNotification.SHOW_ALL));
      }
      
      public function switchDisplay(param1:_70) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc2_:_70 = param1._2100 ? null : param1;
         var _loc3_:Object = _469._3152(param1._1760,_loc2_);
         if(this._2873 == _715.ARMATURE)
         {
            _1567(new CommandNotification(CommandNotification.MODIFY_SLOT_DISPLAY,_loc3_));
         }
         else if(this._2873 == _715.ANIMATE)
         {
            _1567(new TimelineNotification(TimelineNotification.MODIFY_SLOT_FRAME_DISPLAY,_loc3_));
         }
      }
      
      public function _14567(param1:_70, param2:Boolean) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc3_:_70 = param2 ? null : param1;
         var _loc4_:Object = _469._3152(param1._1760,_loc3_);
         if(this._2873 == _715.ARMATURE)
         {
            _1567(new CommandNotification(CommandNotification.MODIFY_SLOT_DISPLAY,_loc4_));
         }
         else if(this._2873 == _715.ANIMATE)
         {
            _1567(new TimelineNotification(TimelineNotification.MODIFY_SLOT_FRAME_DISPLAY,_loc4_));
         }
      }
      
      public function _4540() : void
      {
         var _loc1_:_677 = _705._2951[this._2865];
         if(_loc1_)
         {
            this._4501(_loc1_,true);
         }
      }
      
      public function _4537() : void
      {
         var _loc1_:_677 = _705._2951[this._2865];
         if(_loc1_)
         {
            this._4501(_loc1_,false);
         }
      }
      
      public function _4501(param1:Object, param2:Boolean) : void
      {
         var _loc3_:_697 = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(param1 == null || param1.children <= 0)
         {
            return;
         }
         if(Boolean(this.tree) && Boolean(this.tree.dataProvider))
         {
            _loc3_ = this.tree.dataProvider as _697;
         }
         if(_loc3_)
         {
            _loc3_._4529(param1,param2);
            if(Boolean(param1.children) && param1.children.length > 0)
            {
               _loc4_ = 0;
               _loc5_ = int(param1.children.length);
               while(_loc4_ < _loc5_)
               {
                  this._4501(param1.children[_loc4_],param2);
                  _loc4_++;
               }
            }
         }
      }
      
      public function _3217(param1:Boolean) : void
      {
         var _loc3_:_697 = null;
         var _loc4_:Boolean = false;
         var _loc5_:Object = null;
         var _loc6_:Object = null;
         var _loc7_:Object = null;
         if(!this._4522)
         {
            return;
         }
         var _loc2_:* = this.tree._2484;
         if(_loc2_)
         {
            if(Boolean(this.tree) && Boolean(this.tree.dataProvider))
            {
               _loc3_ = this.tree.dataProvider as _697;
            }
            if(_loc3_)
            {
               _loc4_ = _loc3_._4530(_loc2_);
               if(_loc4_)
               {
                  if(param1)
                  {
                     _loc5_ = _loc3_._4513(_loc2_);
                     if((Boolean(_loc5_)) && Boolean(_loc5_[0]))
                     {
                        this.tree._2484 = _loc5_[0];
                     }
                  }
                  else
                  {
                     if(!_loc3_._4521(_loc2_))
                     {
                        _loc6_ = _loc3_._4509(_loc2_);
                        if(_loc6_)
                        {
                           this.tree._2484 = _loc6_;
                           return;
                        }
                     }
                     _loc3_._4529(_loc2_,param1);
                  }
               }
               else if(param1)
               {
                  _loc3_._4529(_loc2_,param1);
               }
               else
               {
                  _loc7_ = _loc3_._4509(_loc2_);
                  if(_loc7_)
                  {
                     this.tree._2484 = _loc7_;
                  }
               }
            }
         }
      }
      
      public function get _3361() : _677
      {
         return _705._2951[this._2865];
      }
      
      public function get _3362() : Vector.<_702>
      {
         var vec:Vector.<_702> = null;
         var findBoneTreeNodeModel:Function = function(param1:_702):void
         {
            var _loc3_:_702 = null;
            var _loc2_:Boolean = true;
            if(_3175)
            {
               _loc2_ = _4469(param1);
            }
            if(_loc2_)
            {
               if(param1 is _684)
               {
                  if(param1.parent)
                  {
                     vec.push(param1);
                  }
               }
               if(param1.children.length > 0)
               {
                  for each(_loc3_ in param1.children)
                  {
                     findBoneTreeNodeModel(_loc3_);
                  }
               }
            }
         };
         vec = new Vector.<_702>();
         findBoneTreeNodeModel(this._3361);
         return vec;
      }
      
      public function get _3363() : Vector.<_702>
      {
         var vec:Vector.<_702> = null;
         var findSlotTreeNodeModel:Function = function(param1:_702):void
         {
            var _loc3_:_702 = null;
            var _loc2_:Boolean = true;
            if(_3175)
            {
               _loc2_ = _4469(param1);
            }
            if(_loc2_)
            {
               if(param1 is _700)
               {
                  if(param1.children.length > 0)
                  {
                     if(param1.parent)
                     {
                        vec.push(param1);
                     }
                  }
               }
               else if(param1.children.length > 0)
               {
                  for each(_loc3_ in param1.children)
                  {
                     findSlotTreeNodeModel(_loc3_);
                  }
               }
            }
         };
         vec = new Vector.<_702>();
         findSlotTreeNodeModel(this._3361);
         return vec;
      }
      
      public function _3949(param1:Array, param2:Boolean, param3:Boolean = false) : void
      {
         var _loc7_:int = 0;
         var _loc4_:Array = _2226._2889;
         var _loc5_:Boolean = false;
         var _loc6_:int = 0;
         while(_loc6_ < param1.length)
         {
            if(_loc4_.indexOf(param1[_loc6_]) != -1)
            {
               _loc5_ = true;
            }
            _loc6_++;
         }
         if(_loc5_)
         {
            _loc7_ = 0;
            while(_loc7_ < _loc4_.length)
            {
               if(param1.indexOf(_loc4_[_loc7_]) == -1)
               {
                  param1.push(_loc4_[_loc7_]);
               }
               _loc7_++;
            }
         }
         _1567(new CommandNotification(CommandNotification.CHANGE_ITEMS_VISIBLE,{
            "type":"visible",
            "_3210":param1,
            "_3211":param2,
            "_10575":param3
         }));
         if(param3)
         {
            if(param1.length == 1)
            {
               _1567(new StageNotification(StageNotification.ROLLOUT_SLOT,param1[0]));
            }
         }
      }
      
      public function _3947(param1:Array, param2:Boolean) : void
      {
         var _loc3_:Array = this._4485(param1,false);
         _1567(new CommandNotification(CommandNotification.CHANGE_ITEMS_VISIBLE,{
            "type":"visible",
            "_3210":_loc3_,
            "_3211":param2
         }));
      }
      
      public function _14533(param1:Array, param2:Boolean) : void
      {
         var _loc3_:Array = this._14569(param1);
         _1567(new CommandNotification(CommandNotification.CHANGE_ITEMS_VISIBLE,{
            "type":"visible",
            "_3210":_loc3_,
            "_3211":param2
         }));
      }
      
      public function _14532(param1:Array, param2:Boolean) : void
      {
         var _loc3_:Array = this._14569(param1);
         _1567(new CommandNotification(CommandNotification.CHANGE_ITEMS_SELECTED,{
            "type":"selectable",
            "_3210":_loc3_,
            "_3211":param2
         }));
      }
      
      private function _14569(param1:Array) : Array
      {
         var result:Array = null;
         var boneNodes:Vector.<_702> = null;
         var itemVO:Object = null;
         var itemVOs:Array = param1;
         var getNodeByBoneVO:Function = function(param1:_52):void
         {
            var _loc3_:_684 = null;
            var _loc2_:int = 0;
            while(_loc2_ < boneNodes.length)
            {
               _loc3_ = boneNodes[_loc2_] as _684;
               if(Boolean(_loc3_) && _loc3_._1836 == param1)
               {
                  getChildren(_loc3_);
                  break;
               }
               _loc2_++;
            }
         };
         var getChildren:Function = function(param1:_702):void
         {
            var _loc3_:_702 = null;
            var _loc2_:Boolean = true;
            if(_3175)
            {
               _loc2_ = _4469(param1);
            }
            if(_loc2_)
            {
               if(param1 is _684 || param1 is _700)
               {
                  result.push(param1.vo);
               }
               if(param1.children.length)
               {
                  for each(_loc3_ in param1.children)
                  {
                     getChildren(_loc3_);
                  }
               }
            }
         };
         var i:int = 0;
         result = [];
         i = 0;
         while(i < itemVOs.length)
         {
            itemVO = itemVOs[i];
            if(!(itemVO is _52))
            {
               itemVOs.splice(i,1);
               i--;
            }
            i++;
         }
         if(itemVOs.length < 1)
         {
            return result;
         }
         boneNodes = this._3362;
         i = 0;
         while(i < itemVOs.length)
         {
            getNodeByBoneVO(itemVOs[i]);
            i++;
         }
         return result;
      }
      
      public function _3953(param1:Array, param2:Boolean) : void
      {
         var _loc3_:Array = this._4485(param1,true);
         _1567(new CommandNotification(CommandNotification.CHANGE_ITEMS_VISIBLE,{
            "type":"visible",
            "_3210":_loc3_,
            "_3211":param2
         }));
      }
      
      public function _3950(param1:Array, param2:Boolean) : void
      {
         var _loc6_:int = 0;
         var _loc3_:Array = _2226._2889;
         var _loc4_:Boolean = false;
         var _loc5_:int = 0;
         while(_loc5_ < param1.length)
         {
            if(_loc3_.indexOf(param1[_loc5_]) != -1)
            {
               _loc4_ = true;
            }
            _loc5_++;
         }
         if(_loc4_)
         {
            _loc6_ = 0;
            while(_loc6_ < _loc3_.length)
            {
               if(param1.indexOf(_loc3_[_loc6_]) == -1)
               {
                  param1.push(_loc3_[_loc6_]);
               }
               _loc6_++;
            }
         }
         _1567(new CommandNotification(CommandNotification.CHANGE_ITEMS_SELECTED,{
            "type":"selectable",
            "_3210":param1,
            "_3211":param2
         }));
      }
      
      public function _3964(param1:HashObject, param2:Boolean) : void
      {
         var _loc3_:_52 = null;
         var _loc4_:_79 = null;
         var _loc5_:Array = null;
         var _loc6_:Object = null;
         if(param1 is _52)
         {
            _loc3_ = param1 as _52;
            _loc4_ = _loc3_._1882;
         }
         else if(param1 is _79)
         {
            _loc4_ = param1 as _79;
            _loc3_ = _loc4_.parentBoneData;
         }
         if(Boolean(_loc3_) && Boolean(_loc4_))
         {
            _loc5_ = this._4485([_loc4_],true);
            for each(_loc6_ in _loc5_)
            {
               if(_loc6_ is _52 || _loc6_ is _79)
               {
                  if(_loc6_ != _loc3_)
                  {
                     this._3209(_loc6_,"visible",param2);
                  }
               }
            }
         }
      }
      
      public function _3963(param1:HashObject, param2:Boolean) : void
      {
         var _loc3_:_52 = null;
         var _loc4_:_79 = null;
         var _loc5_:Array = null;
         var _loc6_:Object = null;
         if(param1 is _52)
         {
            _loc3_ = param1 as _52;
            _loc4_ = _loc3_._1882;
         }
         else if(param1 is _79)
         {
            _loc4_ = param1 as _79;
            _loc3_ = _loc4_.parentBoneData;
         }
         if(Boolean(_loc3_) && Boolean(_loc4_))
         {
            _loc5_ = this._4485([_loc4_],true);
            for each(_loc6_ in _loc5_)
            {
               if(_loc6_ is _52 || _loc6_ is _79)
               {
                  if(_loc6_ != _loc3_)
                  {
                     this._3209(_loc6_,"selectable",param2);
                  }
               }
            }
         }
      }
      
      public function _3946(param1:Array, param2:Boolean) : void
      {
         var _loc3_:Array = this._4485(param1,false);
         _1567(new CommandNotification(CommandNotification.CHANGE_ITEMS_SELECTED,{
            "type":"selectable",
            "_3210":_loc3_,
            "_3211":param2
         }));
      }
      
      public function _3952(param1:Array, param2:Boolean) : void
      {
         var _loc3_:Array = this._4485(param1,true);
         _1567(new CommandNotification(CommandNotification.CHANGE_ITEMS_SELECTED,{
            "type":"selectable",
            "_3210":_loc3_,
            "_3211":param2
         }));
      }
      
      private function _4485(param1:Array, param2:Boolean = true) : Array
      {
         var _4467:_677;
         var ids:Object = null;
         var value:Array = null;
         var itemChildren:Array = null;
         var isItemAdd:Boolean = false;
         var index:int = 0;
         var itemVO:Object = null;
         var j:int = 0;
         var k:int = 0;
         var itemVOs:Array = param1;
         var _4521:Boolean = param2;
         var getChildren:Function = function(param1:_702, param2:Boolean):void
         {
            var _loc4_:_702 = null;
            var _loc3_:Boolean = true;
            if(_3175)
            {
               _loc3_ = _4469(param1);
            }
            if(_loc3_)
            {
               if(param1.vo.id in ids || param2)
               {
                  isItemAdd = true;
                  param2 = true;
               }
               else
               {
                  isItemAdd = false;
               }
               if(isItemAdd && hasOwn(itemChildren,param1) == -1)
               {
                  itemChildren.push(param1.vo);
               }
               else if(hasOwn(value,param1) == -1 && hasOwn(itemChildren,param1) == -1 && Boolean(param1.parent))
               {
                  value.push(param1.vo);
               }
               if(param1.children.length)
               {
                  for each(_loc4_ in param1.children)
                  {
                     getChildren(_loc4_,param2);
                  }
               }
            }
         };
         var hasOwn:Function = function(param1:Array, param2:Object):int
         {
            var _loc4_:int = 0;
            var _loc5_:Object = null;
            if(!param2)
            {
               return -1;
            }
            if(!param2 is _52 && !param2 is _79 && !param2 is _702)
            {
               return -1;
            }
            var _loc3_:Object = {};
            if(param2 is _52 || param2 is _79)
            {
               _loc3_ = param2.id;
            }
            else if(param2 is _702)
            {
               _loc3_ = param2.vo.id;
            }
            if((_loc3_ + "").length < 1)
            {
               return -1;
            }
            if(Boolean(param1) && param1.length > 0)
            {
               _loc4_ = 0;
               while(_loc4_ < param1.length)
               {
                  _loc5_ = param1[_loc4_];
                  if(_loc5_ is _52 || _loc5_ is _79)
                  {
                     if(_loc5_.hasOwnProperty("id"))
                     {
                        if(_loc5_.id == _loc3_)
                        {
                           return _loc4_;
                        }
                     }
                  }
                  _loc4_++;
               }
            }
            return -1;
         };
         ids = {};
         var i:int = 0;
         while(i < itemVOs.length)
         {
            itemVO = itemVOs[i];
            if(!(itemVO is _52) && !(itemVO is _79))
            {
               itemVOs.splice(i,1);
               i--;
            }
            else
            {
               ids[itemVO.id] = 1;
            }
            i++;
         }
         if(itemVOs.length < 1)
         {
            return value;
         }
         _4467 = this._2882._3997.source as _677;
         if(!_4467)
         {
            return value;
         }
         value = [];
         itemChildren = [];
         getChildren(_4467,false);
         isItemAdd = false;
         if(_4467)
         {
            getChildren(_4467,false);
         }
         if(_4521)
         {
            j = 0;
            while(j < itemVOs.length)
            {
               index = hasOwn(itemChildren,itemVOs[j]);
               if(index >= 0)
               {
                  itemChildren.splice(index,1);
               }
               j++;
            }
            value = value.concat(itemChildren);
         }
         else
         {
            k = 0;
            while(k < itemVOs.length)
            {
               index = hasOwn(value,itemVOs[k]);
               if(index >= 0)
               {
                  value.splice(index,1);
               }
               k++;
            }
         }
         return value;
      }
      
      private function get _4536() : TextInput
      {
         return this.scenePanel._4536;
      }
      
      public function get _2882() : _673
      {
         return this._4493;
      }
      
      public function get _2871() : _665
      {
         return this._4133;
      }
      
      public function set _2871(param1:_665) : void
      {
         if(this._4133 == param1)
         {
            return;
         }
         this._4133 = param1;
         this._3973();
      }
      
      private function get _2865() : _50
      {
         return this._4493._1886;
      }
      
      private function get tree() : _163
      {
         return this.scenePanel.tree;
      }
      
      private function get intelligentFilterButton() : IconButton
      {
         return this.scenePanel.intelligentFilterButton;
      }
      
      private function get newDropList() : _11265
      {
         return this.scenePanel.newDropList;
      }
      
      private function get removeBtn() : IconButton
      {
         return this.scenePanel.removeBtn;
      }
      
      private function get renameBtn() : IconButton
      {
         return this.scenePanel.renameBtn;
      }
      
      private function get _2873() : _715
      {
         return _2220._2873;
      }
      
      private function get _3340() : _760
      {
         return this._2871._3286;
      }
      
      private function get _2212() : _603
      {
         return (_1407.getInstance(_580) as _580)._2212;
      }
      
      private function get _3975() : _540
      {
         return _1407.getInstance(_540) as _540;
      }
      
      public function get _3951() : Boolean
      {
         if(this.removeBtn)
         {
            return this.removeBtn.enabled;
         }
         return false;
      }
      
      public function get _3176() : _580
      {
         return _1407.getInstance(_580) as _580;
      }
      
      public function get _11296() : _11247
      {
         return _1407.getInstance(_11247) as _11247;
      }
      
      public function get _3948() : Boolean
      {
         if(_2220._2873 == _715.ARMATURE)
         {
            if(_2226._2889.length == 1)
            {
               if(_2226._3872 != null && _2226._3872.parentBoneData != null)
               {
                  return true;
               }
               if(_2226._3150 != null && _2226._3150.parentBoneData != null)
               {
                  return true;
               }
            }
         }
         return false;
      }
      
      public function get _10503() : Boolean
      {
         return _2226._2889.length == 1 && _2226._3150 != null && _2226._3150._2049 != null;
      }
      
      public function get _11146() : Boolean
      {
         if(_2220._2873 == _715.ANIMATE)
         {
            if(_2226._2889.length == 1)
            {
               if(_2226._3150 != null && _2226._3150.parentBoneData != null)
               {
                  return _2226._3150._1715.length > 1;
               }
            }
         }
         return false;
      }
      
      public function _13715(param1:_702, param2:int) : void
      {
         var _loc3_:Array = param1.parent.children;
         _loc3_.splice(_loc3_.indexOf(param1),1);
         _loc3_.splice(param2,0,param1);
      }
      
      private function _4117(param1:TreeDragEvent) : void
      {
         var dragParentChildren:Array;
         var treeIndexsObj:Object;
         var boneIndexsObj:Object;
         var _11129:Object;
         var event:TreeDragEvent = param1;
         var getItemsIndexsFromArray:Function = function(param1:Array, param2:Boolean):Object
         {
            var _loc8_:int = 0;
            var _loc9_:_684 = null;
            var _loc12_:int = 0;
            var _loc13_:int = 0;
            var _loc3_:Array = [];
            var _loc4_:Array = [];
            var _loc5_:Array = [];
            var _loc6_:Object = param2 ? event._4137 : event._4137._1836;
            var _loc7_:int = param1.indexOf(_loc6_) + (event._4136 ? 0 : 1);
            var _loc10_:Array = event._3597;
            var _loc11_:int = 0;
            _loc12_ = 0;
            _loc13_ = int(_loc10_.length);
            while(_loc12_ < _loc13_)
            {
               _loc9_ = _loc10_[_loc12_];
               _loc6_ = param2 ? _loc9_ : _loc9_._1836;
               _loc8_ = int(param1.indexOf(_loc6_));
               if(_loc8_ < _loc7_)
               {
                  _loc3_.push(_loc9_);
                  _loc5_.push(_loc8_);
                  _loc11_++;
               }
               else
               {
                  _loc3_.unshift(_loc9_);
                  _loc5_.unshift(_loc8_);
               }
               _loc12_++;
            }
            _loc12_ = 1;
            while(_loc12_ <= _loc11_)
            {
               _loc4_.unshift(_loc7_ - _loc12_);
               _loc12_++;
            }
            _loc12_ = 0;
            _loc13_ = _loc10_.length - _loc11_;
            while(_loc12_ < _loc13_)
            {
               _loc4_.unshift(_loc7_ + _loc12_);
               _loc12_++;
            }
            return {
               "items":_loc3_,
               "newIndexs":_loc4_,
               "oldIndexs":_loc5_
            };
         };
         var dragParent:_702 = event._4137.parent;
         if(!dragParent)
         {
            return;
         }
         dragParentChildren = dragParent.children;
         treeIndexsObj = getItemsIndexsFromArray(dragParentChildren,true);
         boneIndexsObj = getItemsIndexsFromArray(this._2865._1779,false);
         _11129 = _469._13765(treeIndexsObj.items,treeIndexsObj.newIndexs,treeIndexsObj.oldIndexs,boneIndexsObj.items,boneIndexsObj.newIndexs,boneIndexsObj.oldIndexs);
         _1567(new CommandNotification(CommandNotification.MODIFY_SCENETREE_ITEMS_ORDER,_11129));
      }
      
      public function _13714(param1:_684, param2:int) : void
      {
         var _loc3_:Array = this._2865._1779;
         _loc3_.splice(_loc3_.indexOf(param1._1836),1);
         _loc3_.splice(param2,0,param1._1836);
      }
   }
}

