package _555
{
   import _11106._11105;
   import _11106._11108;
   import _11111._11110;
   import _11260.EventFolderItem;
   import _1177.UIEvent;
   import _13492._13491;
   import _13492._13493;
   import _13492._13494;
   import _13492._13495;
   import _13492._13496;
   import _13492._13498;
   import _13492._13499;
   import _13492._13501;
   import _13492._14034;
   import _13503._13502;
   import _13505._13504;
   import _13505._13506;
   import _13505._13507;
   import _13505._13508;
   import _13505._13510;
   import _13505._14035;
   import _1404._1407;
   import _24.Shortcut;
   import _24._26;
   import _40._39;
   import _40._44;
   import _416._421;
   import _416._422;
   import _470._11495;
   import _470._469;
   import _51._50;
   import _51._52;
   import _51._70;
   import _51._71;
   import _51._77;
   import _51._79;
   import _521._530;
   import _537._13540;
   import _537._13541;
   import _573.TimelinePanelController;
   import _579._580;
   import _586._11247;
   import _586._11505;
   import _586._588;
   import _636.AnimationEvent;
   import _636.BoneEvent;
   import _636.BoundingBoxEvent;
   import _636.DBPanelEvent;
   import _636.IKEvent;
   import _636.MeshEvent;
   import _648._13205;
   import _648._665;
   import _708._714;
   import _708._715;
   import _708._717;
   import _708._718;
   import _708._719;
   import _73.SymbolType;
   import _73._74;
   import _73._75;
   import _783.BoundingBoxNotification;
   import _783.CommandNotification;
   import _783.MenuNotification;
   import _783.MeshNotification;
   import _783.PanelNotification;
   import _783.StageNotification;
   import _783.TimelineNotification;
   import _783.TipNotification;
   import _81._83;
   import _81._86;
   import _81._87;
   import _81._88;
   import _880._879;
   import _906.PropertyPanel;
   import _93._94;
   import _97._116;
   import _97._124;
   import _97._99;
   import egret.utils.tr;
   import flash.display.BlendMode;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.MouseEvent;
   import flash.geom.ColorTransform;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.setTimeout;
   
   public class _570 extends _94
   {
      private var _4044:PropertyPanel;
      
      private var _4018:Boolean;
      
      private var _13796:_13541;
      
      private var _4549:_13540;
      
      public function _570()
      {
         this._13796 = _1407.getInstance(_13541) as _13541;
         this._4549 = _1407.getInstance(_13540) as _13540;
         super();
      }
      
      override protected function init() : void
      {
         super.init();
         this._4044 = _1407.getInstance(PropertyPanel);
      }
      
      override protected function _1576() : void
      {
         if(this._4044._11332)
         {
            this._3990();
         }
         else
         {
            this._4044.addEventListener(UIEvent.CREATION_COMPLETE,this._3991);
         }
         _1565(StageNotification.UPDATE_EDIT_MODE,this._3864);
         _1565(StageNotification.UPDATE_CURRENT_ARMATURE,this._3864);
         _1565(StageNotification.UPDATE_ANIMATION_MODE,this._3976);
         _1565(StageNotification.UPDATE_SELECTED_ITEMS,this._4023);
         _1565(StageNotification.STOP_PICK,this._4439);
         _1565(StageNotification.UPDATE_SELECTED_VERTEX,this._4381);
         _1565(StageNotification.UPDATE_SELECTED_BINDING_BONE,this._4373);
         _1565(StageNotification.OPEN_MODIFY_WEIGHT,this._4376);
         _1565(StageNotification.START_WEIGHT_TOOL,this._4388);
         _1565(StageNotification.STOP_WEIGHT_TOOL,this._4404);
         _1565(StageNotification.START_EDIT_BOUNDINGBOX,this._11329);
         _1565(StageNotification.STOP_EDIT_BOUNDINGBOX,this._11329);
         _1565(StageNotification.START_EDIT_MESH_UV,this._11624);
         _1565(StageNotification.STOP_EDIT_MESH_UV,this._11624);
         _1565(TimelineNotification.UPDATE_KEY_STATUS,this._13800);
         _1565(TimelineNotification.UPDATE_SELECT_TIMELINES,this._13799);
         _1565(TimelineNotification.UPDATE_SELECT_FRAMES,this._13794);
         _1565(TimelineNotification.UPDATE,this._13799);
         _1565(TimelineNotification.MODIFY_SLOT_FRAME_DISPLAY,this._14023);
         this._4044.setParentBtn.addEventListener(MouseEvent.CLICK,this._4380);
         _1565(MenuNotification.CONVERT_TO_MESH,this._4415);
         _1565(MenuNotification.CONVERT_TO_IMAGE,this._4408);
         _1565(MenuNotification.SET_PARENT,this._4396);
         Shortcut._1681(stage,_26.SET_PARENT,this._13806);
      }
      
      private function _13794(param1:TimelineNotification) : void
      {
         if(this._4549._2889.length == 1 && this._4549._2889[0] is _13499 && this._4549._2889[0].duration > 0)
         {
            this._3453(this._4549._2889[0]);
         }
         else
         {
            this._3453(null);
            this._13798();
         }
      }
      
      private function _13799(param1:TimelineNotification) : void
      {
         this._13798();
      }
      
      private function _13798() : void
      {
         var _loc1_:_50 = null;
         var _loc2_:_13506 = null;
         var _loc3_:_13491 = null;
         var _loc4_:_13491 = null;
         if(this._13796._2889.length == 1 && this._13796._2889[0] is _13506 && this._4549._2889.length == 0)
         {
            _loc2_ = this._13796._2889[0] as _13506;
            _loc1_ = (_loc2_.parent as _13502).rootArmatureData;
            _loc3_ = this._2852._11324();
            this._4044._11325(_loc1_,_loc3_);
         }
         else if(this._4549._2889.length == 1 && this._4549._2889[0].flag == _13510.FLAG_EVENT)
         {
            _loc4_ = this._4549._2889[0] as _13491;
            _loc1_ = (_loc4_.parent.parent as _13502).rootArmatureData;
            this._4044._11325(_loc1_,_loc4_);
         }
      }
      
      private function _13800(param1:TimelineNotification) : void
      {
         var _loc2_:int = param1.data;
         this._13801(_loc2_);
      }
      
      private function _11624(param1:StageNotification) : void
      {
         this._4044.model._11623 = this._11621.editing;
         this.refresh();
      }
      
      private function _11329(param1:StageNotification) : void
      {
         this._4044.model._11330 = this._11296._11339 != _11247.BOUNDINGBOX_MODE_NORMAL;
         this.refresh();
      }
      
      private function _4404(param1:StageNotification) : void
      {
         this._4044.model._4410 = false;
         this._4044._4416(false);
         this.refresh();
      }
      
      private function _4388(param1:StageNotification) : void
      {
         _1567(new StageNotification(StageNotification.OPEN_MODIFY_WEIGHT,true));
         this._4044.model._4410 = true;
         this.refresh();
      }
      
      private function _4376(param1:StageNotification) : void
      {
         this._4044._4416(param1.data);
      }
      
      private function _4373(param1:StageNotification) : void
      {
         this._4044._4395(param1.data);
      }
      
      private function _4381(param1:StageNotification) : void
      {
         this._4044._4358(param1.data);
      }
      
      private function _4439(param1:StageNotification) : void
      {
         this._4044._3834();
      }
      
      private function _4396(param1:MenuNotification) : void
      {
         this.setParent();
      }
      
      private function _13806() : void
      {
         this.setParent();
      }
      
      private function _4408(param1:MenuNotification) : void
      {
         this._4407(null);
      }
      
      private function _4415(param1:MenuNotification) : void
      {
         this._4413(null);
      }
      
      private function _3976(param1:StageNotification) : void
      {
         if(_2220._4000 == _714.PLAY)
         {
            this._4018 = true;
            this._4044.enabled = !this._4018;
         }
         else
         {
            this._4018 = false;
            this._4044.enabled = !this._4018;
         }
      }
      
      private function _3864(param1:StageNotification) : void
      {
         this._4044._4424._4418(_2220._2873 == _715.ARMATURE);
         this._4044._4406._4425 = _2220._2873 == _715.ARMATURE;
         this._4044._4426._4425 = _2220._2873 == _715.ARMATURE;
         this.refresh();
      }
      
      private function _3991(param1:UIEvent) : void
      {
         this._4044.removeEventListener(UIEvent.CREATION_COMPLETE,this._3991);
         this._3990();
      }
      
      private function _4023(param1:StageNotification) : void
      {
         if(Boolean(this._4044) && Boolean(this._4044.model))
         {
            this._4044.model._4395 = null;
         }
         this.refresh();
      }
      
      private function _4380(param1:MouseEvent) : void
      {
         this.setParent();
      }
      
      private function setParent() : void
      {
         var _loc1_:Array = null;
         var _loc5_:int = 0;
         var _loc6_:Object = null;
         if(_530.instance._3832)
         {
            return;
         }
         if(_2220._2873 != _715.ARMATURE)
         {
            return;
         }
         var _loc2_:Object = _2226._2484;
         if(_loc2_ is _52)
         {
            _loc1_ = [_loc2_];
            _loc5_ = 0;
            do
            {
               for each(_loc6_ in (_loc1_[_loc5_] as _52)._2024)
               {
                  _loc1_.push(_loc6_);
               }
               _loc5_++;
            }
            while(_loc5_ < _loc1_.length);
            
            _loc1_.push(null);
         }
         else
         {
            if(!(_loc2_ is _79))
            {
               return;
            }
            _loc1_ = [null];
         }
         _530.instance._3833([_loc2_],this._4436,_loc1_);
         var _loc3_:Number = !!stage ? stage.mouseX : 0;
         var _loc4_:Number = !!stage ? stage.mouseY : 0;
         _1567(new TipNotification(TipNotification.SHOW_TIP_TEXT,{
            "showText":tr("AddBone_noParent"),
            "x":_loc3_,
            "y":_loc4_
         }));
      }
      
      private function _3990() : void
      {
         this._4044._11332._11335._11337.addEventListener(MouseEvent.CLICK,this._11336);
         this._4044.addEventListener(AnimationEvent.ADD_FRAME_ACTION,this._11326);
         this._4044.addEventListener(AnimationEvent.MODIFY_FRAME_ACTION,this._11326);
         this._4044.addEventListener(AnimationEvent.MODIFY_FRAME_EVENT,this._11326);
         this._4044.addEventListener(AnimationEvent.DEL_FRAME_ACTION,this._11326);
         this._4044.addEventListener(AnimationEvent.ADD_EVENT_FRAME,this._11334);
         this._4044.addEventListener(AnimationEvent.MODIFY_FRAMES_TWEEN_TYPE,this._11327);
         this._4044.addEventListener(AnimationEvent.MODIFY_FRAMES_TWEEN_ROTATE,this._11327);
         this._4044.addEventListener(AnimationEvent.PICK_BONE,this._11333);
         this._4044._4426.addEventListener(AnimationEvent.MODIFY_SLOT_DISPLAY_INDEX,this._4375);
         this._4044._4426.addEventListener(AnimationEvent.CHANGE_SLOT_COLOR,this._4394);
         this._4044._4426.addEventListener(AnimationEvent.CHANGE_SLOT_BLENDMODE,this._10585);
         this._4044._4426.addEventListener(AnimationEvent.MODIFY_SLOT_PIVOT,this._4423);
         this._4044._4426.addEventListener(AnimationEvent.MODIFY_SLOT_COLOR,this._4393);
         this._4044._4426.addEventListener(AnimationEvent.MODIFY_SLOT_ALPHA,this._4391);
         this._4044._4426.addEventListener(AnimationEvent.CHANGE_SLOT_ALPHA,this._4392);
         this._4044._4426.addEventListener(AnimationEvent.KEY_COLOR,this._13807);
         this._4044._4426.addEventListener(AnimationEvent.KEY_DISPLAY,this._13805);
         this._4044._4426.addEventListener(AnimationEvent.KEY_VISIBLE,this._13804);
         this._4044._4424.addEventListener(AnimationEvent.KEY_IK_BEND,this._14565);
         this._4044._4424.addEventListener(AnimationEvent.KEY_IK_WEIGHT,this._14561);
         this._4044._4424._4441.addEventListener(FocusEvent.FOCUS_OUT,this._4386);
         this._4044._4424._4441._2599 = this._4386;
         this._4044._4424._4443.addEventListener(FocusEvent.FOCUS_OUT,this._4400);
         this._4044._4424._4383.addEventListener(Event.CHANGE,this._4382);
         this._4044._4424._4378.addEventListener(Event.CHANGE,this._4377);
         this._4044._4424._4443.addEventListener(FocusEvent.FOCUS_OUT,this._4400);
         this._4044._4424._4442.addEventListener(MouseEvent.CLICK,this._4437);
         this._4044._4424._4447.addEventListener(MouseEvent.CLICK,this._4446);
         this._4044._4426._4444.addEventListener(FocusEvent.FOCUS_OUT,this._4399);
         this._4044._4419.addEventListener(AnimationEvent.MODIFY_CANVAS,this._4411);
         this._4044._4424.addEventListener(IKEvent.BEND_CHANGE,this._14559);
         this._4044._4424.addEventListener(IKEvent.WEIGHT_CHANGE,this._14558);
         this._4044._4424.addEventListener(IKEvent.WEIGHT_CHANGE_CONFIRM,this._14557);
         this._4044._4424.addEventListener(IKEvent.WEIGHT_CHANGE_END,this._14562);
         this._4044._4406.addEventListener(MeshEvent.CHANGE_TO_MESH,this._4413);
         this._4044._4406.addEventListener(DBPanelEvent.CHANGE_ASSET,this._10509);
         this._4044._4406.addEventListener(MeshEvent.CHANGE_TO_IMAGE,this._4407);
         this._4044._4406.addEventListener(MeshEvent.MESH_EDITOR,this._4401);
         this._4044._4406.addEventListener(MeshEvent.MESH_RESET,this._4438);
         this._4044._4406.addEventListener(AnimationEvent.MODIFY_ARMATURE_ANIMATION,this._4390);
         this._4044._4426.addEventListener(AnimationEvent.MODIFY_ARMATURE_ANIMATION,this._4390);
         this._4044._4426.addEventListener(AnimationEvent.KEY_GOTO,this._14024);
         this._4044._4406.addEventListener(AnimationEvent.KEY_GOTO,this._14024);
         this._4044._4426.addEventListener(AnimationEvent.KEY_FFD,this._14026);
         this._4044._4406.addEventListener(AnimationEvent.KEY_FFD,this._14026);
         this._4044._4426.addEventListener(DBPanelEvent.CHANGE_ASSET,this._10509);
         this._4044._4426.addEventListener(MeshEvent.CHANGE_TO_MESH,this._4413);
         this._4044._4426.addEventListener(MeshEvent.CHANGE_TO_IMAGE,this._4407);
         this._4044._4426.addEventListener(MeshEvent.MESH_EDITOR,this._4401);
         this._4044._4426.addEventListener(MeshEvent.MESH_RESET,this._4438);
         this._4044._4424.addEventListener(BoneEvent.CONFIRM_CHANGE_BONESYMBOL_COLOR,this._14555);
         this._4044._4424.addEventListener(BoneEvent.CHANGE_BONESYMBOL_COLOR,this._14560);
         this._4044._4424.addEventListener(BoneEvent.CANCEL_CHANGE_BONESYMBOL_COLOR,this._14556);
         this._4044._4424.addEventListener(BoneEvent.RESET_BONESYMBOL_COLOR,this._14564);
         this._4044._4405.addEventListener(AnimationEvent.MODIFY_ARMATURE_ANIMATION,this._4374);
         this._4044._4405.addEventListener(AnimationEvent.MODIFY_CANVAS,this._4411);
         this._4044.addEventListener(MeshEvent.MESH_RIGGING,this._4421);
         this._4044.addEventListener(MeshEvent.SELECT_BONE,this._4402);
         this._4044.addEventListener(MeshEvent.DELETE_BONE,this._4403);
         this._4044.addEventListener(MeshEvent.MODIFY_WEIGHT,this._4414);
         this._4044.addEventListener(MeshEvent.MODIFY_BAR_WEIGHT,this._4389);
         this._4044.addEventListener(MeshEvent.OPEN_MODIFY_WEIGHT,this._4385);
         this._4044.addEventListener(MeshEvent.AUTO_WEIGHT,this._4431);
         this._4044.addEventListener(MeshEvent.EDIT_UV,this._11625);
         this._4044.addEventListener(BoundingBoxEvent.EDIT,this._11341);
         this._4044.addEventListener(BoundingBoxEvent.FREEZE,this._11338);
         this._4044.addEventListener(DBPanelEvent.UPDATE_CANVASVO,this._13278);
         this._4044.addEventListener(DBPanelEvent.BLOCK_HISTORY,this._13281);
         this._4044.addEventListener(DBPanelEvent.AUTO_CANVAS_SIZE,this._13277);
      }
      
      private function _14562(param1:IKEvent) : void
      {
         switch(this._2873)
         {
            case _715.ANIMATE:
               _2217._1651();
         }
      }
      
      private function _14557(param1:IKEvent) : void
      {
         var _loc4_:Object = null;
         var _loc5_:Boolean = false;
         var _loc2_:Number = Number(param1.data.weight);
         var _loc3_:_77 = param1.data._1897;
         switch(this._2873)
         {
            case _715.ARMATURE:
               (_loc4_ = new Object())._1897 = _loc3_;
               _loc4_.weight = _loc2_;
               _1567(new CommandNotification(CommandNotification.MODIFY_IKCONSTRAINT_WEIGHT,_loc4_));
               break;
            case _715.ANIMATE:
               _loc5_ = this._2852.autoKey;
               this._14566(_loc3_,_loc3_._14310,_loc2_,_loc5_);
               _2217._1651();
         }
      }
      
      private function _14558(param1:IKEvent) : void
      {
         var _loc4_:Object = null;
         var _loc5_:Boolean = false;
         var _loc2_:Number = Number(param1.data.weight);
         var _loc3_:_77 = param1.data._1897;
         switch(this._2873)
         {
            case _715.ARMATURE:
               (_loc4_ = new Object())._1897 = _loc3_;
               _loc4_.weight = _loc2_;
               _1567(new CommandNotification(CommandNotification.MODIFY_IKCONSTRAINT_WEIGHT_ONLY,_loc4_));
               break;
            case _715.ANIMATE:
               _loc5_ = this._2852.autoKey;
               this._14566(_loc3_,_loc3_._14310,_loc2_,_loc5_);
         }
      }
      
      private function _14559(param1:IKEvent) : void
      {
         var _loc4_:Object = null;
         var _loc5_:Boolean = false;
         var _loc2_:int = int(param1.data._2990);
         var _loc3_:_77 = param1.data._2942;
         switch(this._2873)
         {
            case _715.ARMATURE:
               (_loc4_ = new Object())._1897 = _loc3_;
               _loc4_.bendDirection = _loc2_;
               _1567(new CommandNotification(CommandNotification.MODIFY_IKCONSTRAINT_BEND,_loc4_));
               break;
            case _715.ANIMATE:
               _loc5_ = this._2852.autoKey;
               this._14566(_loc3_,_loc2_,_loc3_._14311,_loc5_);
         }
      }
      
      private function _13277(param1:DBPanelEvent) : void
      {
         var e:DBPanelEvent = param1;
         _1567(new TipNotification(TipNotification.SHOW_MASK));
         _1567(new CommandNotification(CommandNotification.SHOW_TOOL_TIP,{
            "showText":tr("StageView.compute.area"),
            "type":_717.ANIMATE
         }));
         setTimeout(function():void
         {
            _13280();
            _1567(new TipNotification(TipNotification.HIDE_MASK));
            _1567(new CommandNotification(CommandNotification.SHOW_TOOL_TIP,{
               "showText":tr("StageView.compute.complete"),
               "type":_717.ANIMATE
            }));
         },1000);
      }
      
      private function _13280() : void
      {
         var _loc3_:String = null;
         var _loc4_:int = 0;
         var _loc5_:Rectangle = null;
         var _loc6_:Object = null;
         var _loc1_:_50 = _3028;
         var _loc2_:_71 = _2214._1844._2871.dragonBonesVO;
         if(Boolean(_loc1_) && Boolean(_loc2_))
         {
            if(this._2873 == _715.ANIMATE || this._2873 == _715.GENERAL)
            {
               if(this._2852)
               {
                  _loc3_ = !!this._2852._13704 ? this._2852._13704.name : null;
                  _loc4_ = this._2852.timeline.curFrame;
               }
            }
            _loc5_ = _13205._13279(_loc1_,_loc2_,_loc3_,_loc4_);
            (_loc6_ = {}).canvas = _loc1_._2000;
            _loc6_._3430 = _loc1_._2000._10373();
            _loc6_._1642 = _loc1_._2000._10373();
            _loc6_._1642.x = _loc5_.x + _loc5_.width / 2;
            _loc6_._1642.y = _loc5_.y + _loc5_.height / 2;
            _loc6_._1642.width = _loc5_.width;
            _loc6_._1642.height = _loc5_.height;
            _1567(new CommandNotification(CommandNotification.UPDATE_CANVASVO,_loc6_));
            _2217._1651();
         }
      }
      
      private function _13281(param1:DBPanelEvent) : void
      {
         _2217._1651();
      }
      
      private function _13278(param1:DBPanelEvent) : void
      {
         var _loc2_:Object = param1.data;
         if(_loc2_)
         {
            if(_loc2_.isNew)
            {
               _1567(new PanelNotification(PanelNotification.ADD_CANVAS));
            }
            _1567(new CommandNotification(CommandNotification.UPDATE_CANVASVO,_loc2_));
            if(!_loc2_.merge)
            {
               _2217._1651();
            }
         }
      }
      
      private function _11334(param1:AnimationEvent) : void
      {
         if(this._2873 == _715.ANIMATE || this._2873 == _715.GENERAL)
         {
            _1567(new TimelineNotification(TimelineNotification.ADD_EVENT_FRAME,param1.data));
         }
      }
      
      private function _11336(param1:Event) : void
      {
         _1567(new CommandNotification(CommandNotification.OPEN_PANEL,_116.CURVE_PANEL));
      }
      
      private function _4431(param1:MeshEvent) : void
      {
         _1567(new StageNotification(StageNotification.AUTO_WEIGHT));
      }
      
      private function _4385(param1:MeshEvent) : void
      {
         _1567(new StageNotification(StageNotification.OPEN_MODIFY_WEIGHT,param1.data));
         if(!param1.data)
         {
            _1567(new StageNotification(StageNotification.UPDATE_SELECTED_BINDING_BONE,null));
         }
      }
      
      private function _4389(param1:MeshEvent) : void
      {
         _1567(new StageNotification(StageNotification.MODIFY_BONE_WEIGHT_BAR,param1.data));
      }
      
      private function _4414(param1:MeshEvent) : void
      {
         _1567(new StageNotification(StageNotification.MODIFY_BONE_WEIGHT,param1.data));
      }
      
      private function _4403(param1:MeshEvent) : void
      {
         var _loc2_:_52 = param1.data;
         if(_loc2_)
         {
            _1567(new StageNotification(StageNotification.DELETE_RIG_BONE,_loc2_));
         }
      }
      
      private function _4402(param1:MeshEvent) : void
      {
         _1567(new StageNotification(StageNotification.UPDATE_SELECTED_BINDING_BONE,param1.data));
      }
      
      private function _4421(param1:MeshEvent) : void
      {
         if(param1.data)
         {
            _1567(new StageNotification(StageNotification.START_EDIT_RIG));
         }
         else
         {
            _1567(new StageNotification(StageNotification.STOP_EDIT_RIG));
         }
      }
      
      private function _4374(param1:AnimationEvent) : void
      {
         var _loc3_:Object = null;
         var _loc4_:String = null;
         var _loc2_:_50 = this._4044.model._1886;
         if(_loc2_)
         {
            _loc3_ = _469._3485(_loc2_,param1.data,null);
            _loc4_ = CommandNotification.MODIFY_ARMATURE_ANIMATION;
            _1567(new CommandNotification(_loc4_,_loc3_));
         }
      }
      
      private function _4390(param1:AnimationEvent) : void
      {
         var _loc2_:_70 = null;
         var _loc3_:_79 = null;
         var _loc4_:_50 = null;
         var _loc6_:Object = null;
         var _loc7_:String = null;
         var _loc8_:Boolean = false;
         var _loc5_:String = param1.data;
         if(_2226._2484 is _70)
         {
            _loc2_ = _2226._2484 as _70;
         }
         else if(_2226._2484 is _79)
         {
            _loc2_ = (_2226._2484 as _79)._2049;
         }
         if(_loc2_)
         {
            _loc3_ = _loc2_._1760;
            _loc4_ = _loc2_._2107();
            if(_loc4_)
            {
               _loc6_ = _469._3485(_loc4_,_loc5_,_loc3_);
               switch(this._2873)
               {
                  case _715.ARMATURE:
                     if(_loc3_)
                     {
                        _loc7_ = CommandNotification.MODIFY_SLOT_ANIMATION;
                     }
                     else
                     {
                        _loc7_ = CommandNotification.MODIFY_ARMATURE_ANIMATION;
                     }
                     break;
                  case _715.ANIMATE:
                     _loc8_ = this._2852.autoKey;
                     if(_loc5_ == null)
                     {
                        _loc5_ = _79.CACHE_NO_ANIM;
                     }
                     this._14022(_loc3_,_loc5_,_loc8_);
                     return;
                  case _715.GENERAL:
                     _loc7_ = CommandNotification.MODIFY_BASIC_SLOT_FRAME_ANIMATION;
               }
               _1567(new CommandNotification(_loc7_,_loc6_));
            }
         }
      }
      
      private function _10509(param1:DBPanelEvent) : void
      {
         _1567(new MenuNotification(MenuNotification.SWAP_IMAGE,null,null));
      }
      
      private function _4413(param1:MeshEvent) : void
      {
         var _loc2_:_70 = null;
         var _loc3_:_70 = null;
         var _loc4_:_79 = null;
         var _loc5_:Object = null;
         var _loc6_:Object = null;
         if(_2226._2484 is _70)
         {
            _loc2_ = _2226._2484 as _70;
         }
         else if(_2226._2484 is _79)
         {
            _loc2_ = (_2226._2484 as _79)._2049;
         }
         if(_loc2_)
         {
            if(_loc2_.width > _879.MAX_SIZE || _loc2_.height > _879.MAX_SIZE)
            {
               _1567(new CommandNotification(CommandNotification.SHOW_TOOL_TIP,{
                  "showText":tr("Tip.mesh.overSize"),
                  "type":_717.ANIMATE
               }));
               return;
            }
            _loc3_ = this._4440(_loc2_);
            _loc4_ = _loc2_._1760;
         }
         if(_loc2_ && _loc4_ && Boolean(_loc3_))
         {
            _loc5_ = {
               "_1837":_loc4_,
               "displayVO":_loc2_,
               "_1838":_loc3_
            };
            if(_loc4_._2049 != _loc2_)
            {
               _loc6_ = _469._3152(_loc4_,_loc2_);
               _loc5_._13753 = _loc6_;
            }
            _1567(new CommandNotification(CommandNotification.CHANGE_TO_MESH,_loc5_));
         }
      }
      
      private function _4440(param1:_70) : _70
      {
         var _loc2_:_70 = param1;
         if(_loc2_.type != _74.MESH)
         {
            if(_loc2_.mesh == null)
            {
               _loc2_._2110(null);
            }
         }
         return _loc2_;
      }
      
      private function _4407(param1:MeshEvent) : void
      {
         var _loc2_:_70 = null;
         var _loc3_:_79 = null;
         if(_2226._2484 is _70)
         {
            _loc2_ = _2226._2484 as _70;
         }
         else if(_2226._2484 is _79)
         {
            _loc2_ = (_2226._2484 as _79)._2049;
         }
         if(_loc2_)
         {
            _loc3_ = _loc2_._1760;
         }
         if(Boolean(_loc2_) && Boolean(_loc3_))
         {
            _1567(new CommandNotification(CommandNotification.CHANGE_TO_IMAGE,{
               "_1837":_loc3_,
               "_1838":_loc2_
            }));
         }
      }
      
      private function _14555(param1:BoneEvent) : void
      {
         _1567(new CommandNotification(CommandNotification.MODIFY_BONES_SYMBOL_COLOR,param1.data));
      }
      
      private function _14560(param1:BoneEvent) : void
      {
         this._2877._3198._14416(param1.data.bones,param1.data.newColor);
      }
      
      private function _14556(param1:BoneEvent) : void
      {
         var _loc4_:_52 = null;
         var _loc2_:Array = param1.data.bones;
         var _loc3_:Object = param1.data.preColors;
         var _loc5_:int = 0;
         while(_loc5_ < _loc2_.length)
         {
            _loc4_ = _loc2_[_loc5_];
            if(_loc3_[_loc4_.name])
            {
               this._2877._3198._14416([_loc4_],_loc3_[_loc4_.name]);
            }
            _loc5_++;
         }
      }
      
      private function _14564(param1:BoneEvent) : void
      {
         this._2877._3198._14416(param1.data.bones,param1.data.defaultColor);
      }
      
      private function _4401(param1:MeshEvent) : void
      {
         _1567(new StageNotification(StageNotification.OPEN_MESH_EDITOR));
      }
      
      private function _4438(param1:MeshEvent) : void
      {
         var _loc2_:_70 = null;
         var _loc3_:_79 = null;
         if(_2226._2484 is _70)
         {
            _loc2_ = _2226._2484 as _70;
         }
         else if(_2226._2484 is _79)
         {
            _loc2_ = (_2226._2484 as _79)._2049;
         }
         if(_loc2_)
         {
            _loc3_ = _loc2_._1760;
         }
         if(Boolean(_loc2_) && Boolean(_loc3_))
         {
            _1567(new CommandNotification(CommandNotification.FFD_RESET,{
               "_1837":_loc3_,
               "_1838":_loc2_
            }));
         }
      }
      
      private function _4399(param1:FocusEvent) : void
      {
         var _loc2_:String = null;
         var _loc3_:_79 = null;
         var _loc4_:_52 = null;
         var _loc5_:Object = null;
         if(_2226._3150)
         {
            _loc2_ = this._4044._4426._4444.text;
            if(_loc2_ != _2226._3150.name)
            {
               if(_2226._3150.parentBoneData.rootArmatureData._1996(_loc2_))
               {
                  this._4044._4426._4444.text = _2226._3150.name;
                  _1567(new TipNotification(TipNotification.TIP_BOTTOM,TipNotification.NAME_CONFICT));
               }
               else if(_2226._3150.parentBoneData.rootArmatureData._1811 == SymbolType.ARMATURE)
               {
                  _1567(new CommandNotification(CommandNotification.MODIFY_SLOT_NAME,_469._3493(_2226._3150,this._4044._4426._4444.text)));
               }
               else
               {
                  _loc3_ = _2226._3150;
                  _loc4_ = _2226._3150.parentBoneData;
                  if(Boolean(_loc3_) && Boolean(_loc4_))
                  {
                     _loc5_ = {
                        "_1836":_loc4_,
                        "_1837":_loc3_,
                        "oldValue":_loc4_.name,
                        "newValue":this._4044._4426._4444.text
                     };
                     _1567(new CommandNotification(CommandNotification.MODIFY_LAYER_NAME,_loc5_));
                  }
               }
            }
         }
      }
      
      private function _4400(param1:FocusEvent) : void
      {
         var _loc2_:String = null;
         if(_2226._2484 is _52)
         {
            _loc2_ = this._4044._4424._4443.text;
            if(_loc2_ != _2226._3872.name)
            {
               if(_2226._3872.rootArmatureData._1793(_loc2_))
               {
                  this._4044._4424._4443.text = _2226._3872.name;
                  _1567(new TipNotification(TipNotification.TIP_BOTTOM,TipNotification.NAME_CONFICT));
               }
               else if(_loc2_ == "")
               {
                  this._4044._4424._4443.text = _2226._3872.name;
               }
               else
               {
                  _1567(new CommandNotification(CommandNotification.MODIFY_BONE_NAME,_469._3493(_2226._2484,_loc2_)));
               }
            }
         }
      }
      
      private function _4382(param1:Event) : void
      {
         _1567(new CommandNotification(CommandNotification.MODIFY_BONES_INHERIT,_469._3477(_2226._2889,int(this._4044._4424._4383.selected),-1)));
      }
      
      private function _4377(param1:Event) : void
      {
         _1567(new CommandNotification(CommandNotification.MODIFY_BONES_INHERIT,_469._3477(_2226._2889,-1,int(this._4044._4424._4378.selected))));
      }
      
      private function _4446(param1:MouseEvent) : void
      {
         var _loc6_:int = 0;
         var _loc7_:Object = null;
         var _loc2_:Vector.<_52> = new Vector.<_52>();
         var _loc3_:Array = _2226._2889;
         _87._2199(_loc3_,{
            "filterBone":0,
            "filterSlot":2
         });
         if(!this._4398(_loc3_))
         {
            return;
         }
         var _loc4_:Array = null;
         var _loc5_:Object = _loc3_[0];
         if(_loc5_ is _52)
         {
            _loc4_ = [_loc5_];
            _loc6_ = 0;
            do
            {
               for each(_loc7_ in (_loc4_[_loc6_] as _52)._2024)
               {
                  _loc4_.push(_loc7_);
               }
               _loc6_++;
            }
            while(_loc6_ < _loc4_.length);
            
         }
         _530.instance._3833(_2226._2889,this._4397,_loc4_);
         _1567(new TipNotification(TipNotification.SHOW_TIP_TEXT,{
            "showText":tr("Property.ik.pick"),
            "x":stage.mouseX,
            "y":stage.mouseY
         }));
      }
      
      private function _4397(param1:Array, param2:_52) : void
      {
         var _loc4_:_52 = null;
         var _loc5_:int = 0;
         var _loc6_:String = null;
         var _loc7_:Object = null;
         var _loc8_:_52 = null;
         var _loc9_:_52 = null;
         var _loc10_:_86 = null;
         var _loc11_:Point = null;
         var _loc12_:Object = null;
         var _loc13_:Object = null;
         var _loc3_:Vector.<_52> = new Vector.<_52>();
         _87._2199(param1,{
            "filterBone":0,
            "filterSlot":2
         });
         if(!this._4398(param1))
         {
            return;
         }
         for each(_loc4_ in param1)
         {
            _loc3_.push(_loc4_);
         }
         _loc5_ = 1;
         if(_loc3_.length == 2)
         {
            _loc5_ = _loc3_[1]._1724.rotation > 0 ? 1 : -1;
         }
         if(param2)
         {
            if(this._4430(param2,param1))
            {
               _1567(new TipNotification(TipNotification.TIP_BOTTOM,tr("Tip.IK.NoChild")));
               return;
            }
            _loc6_ = _124._1747("bone_ik",param2.rootArmatureData._1959);
            _loc7_ = _469._3469(_loc6_,param2,_loc3_,_loc5_,1);
            _1567(new CommandNotification(CommandNotification.MODIFY_CREATING_IKCONSTRAINT,_loc7_));
         }
         else
         {
            _loc8_ = _2226._3872.rootArmatureData._1990;
            _loc9_ = _52._1729(_124._1747("bone_ikTarget",_loc8_.rootArmatureData._1793),_loc8_);
            _loc10_ = new _86();
            _loc11_ = this._4379(new Point(stage.mouseX,stage.mouseY));
            _loc10_.x = _loc11_.x / this._2580;
            _loc10_.y = _loc11_.y / this._2580;
            _loc9_._1724.copyFrom(_loc10_._2195(_loc8_._2009,_loc8_.globalTransform,_loc8_._2036,true),true);
            _loc12_ = _469._2916(_loc9_,_loc8_);
            _loc6_ = _124._1747("bone_ik",_loc8_.rootArmatureData._1959);
            _loc7_ = _469._3469(_loc6_,_loc9_,_loc3_,_loc5_,1);
            (_loc13_ = new Object()).bone = _loc12_;
            _loc13_.ikConstraint = _loc7_;
            _1567(new CommandNotification(CommandNotification.MODIFY_CREATING_IKCONSTRAINT_NEW_BONE,_loc13_));
         }
         this._11323(_loc3_.length,_11105.IKConstraintMode_Pick);
      }
      
      private function _4437(param1:MouseEvent) : void
      {
         var _loc4_:_52 = null;
         var _loc5_:int = 0;
         var _loc2_:Vector.<_52> = new Vector.<_52>();
         var _loc3_:Array = _2226._2889;
         _87._2199(_loc3_,{
            "filterBone":0,
            "filterSlot":2
         });
         if(!this._4398(_loc3_))
         {
            return;
         }
         for each(_loc4_ in _loc3_)
         {
            _loc2_.push(_loc4_);
         }
         _loc5_ = 1;
         if(_loc2_.length == 2)
         {
            _loc5_ = _loc2_[1]._1724.rotation > 0 ? 1 : -1;
         }
         var _loc6_:_52 = _2226._3872.rootArmatureData._1990;
         var _loc7_:_52 = _52._1729(_124._1747("bone_ikTarget",_loc6_.rootArmatureData._1793),_loc6_);
         var _loc8_:_86 = new _86();
         var _loc9_:_52 = _loc2_[_loc2_.length - 1];
         var _loc10_:Point = new Point(_loc9_.length,0);
         _88._2135(_loc10_,_loc9_._2009);
         _loc8_.x = _loc10_.x;
         _loc8_.y = _loc10_.y;
         _loc7_._1724.copyFrom(_loc8_._2195(_loc6_._2009,_loc6_.globalTransform,_loc7_._2036,true),true);
         var _loc11_:Object = _469._2916(_loc7_,_loc6_);
         var _loc12_:String = _124._1747("bone_ik",_loc6_.rootArmatureData._1959);
         var _loc13_:Object = _469._3469(_loc12_,_loc7_,_loc2_,_loc5_,1);
         var _loc14_:Object;
         (_loc14_ = new Object()).bone = _loc11_;
         _loc14_.ikConstraint = _loc13_;
         _1567(new CommandNotification(CommandNotification.MODIFY_CREATING_IKCONSTRAINT_NEW_BONE,_loc14_));
         this._11323(_loc2_.length,_11105.IKConstraintMode_Auto);
      }
      
      private function _11323(param1:Number, param2:String) : void
      {
         _11110.instance._11322._11130(_11108.Panel);
         _11110.instance._11322._11139(_11105.CreateIKConstraint_BoneNum,param1.toFixed());
         _11110.instance._11322._11139(_11105.CreateIKConstraint_Mode,param2);
         _11110.instance._11322._11132();
      }
      
      private function _4398(param1:Array, param2:_52 = null) : Boolean
      {
         var _loc3_:_52 = null;
         if(param1.length > 2)
         {
            _1567(new TipNotification(TipNotification.TIP_BOTTOM,tr("Tip.IK.MoreBones")));
            return false;
         }
         if(!this._4387(param1))
         {
            _1567(new TipNotification(TipNotification.TIP_BOTTOM,tr("Tip.IK.NoParentChild")));
            return false;
         }
         if(!_52(param1[0]).parentBoneData)
         {
            _1567(new TipNotification(TipNotification.TIP_BOTTOM,tr("Tip.IK.RootNoIK")));
            return false;
         }
         for each(_loc3_ in param1)
         {
            if(_loc3_._1980)
            {
               _1567(new TipNotification(TipNotification.TIP_BOTTOM,tr("Tip.IK.HasConstraint")));
               return false;
            }
         }
         if(param2)
         {
            if(this._4430(param2,param1))
            {
               _1567(new TipNotification(TipNotification.TIP_BOTTOM,tr("Tip.IK.NoChild")));
               return false;
            }
         }
         return true;
      }
      
      private function _4430(param1:_52, param2:Array) : Boolean
      {
         var _loc4_:_52 = null;
         var _loc3_:_52 = param1;
         while(_loc3_)
         {
            for each(_loc4_ in param2)
            {
               if(_loc4_.name == _loc3_.name)
               {
                  return true;
               }
            }
            _loc3_ = _loc3_.parentBoneData;
         }
         return false;
      }
      
      private function _4387(param1:Array) : Boolean
      {
         var _loc2_:_52 = null;
         var _loc3_:_52 = null;
         if(param1.length == 2)
         {
            _loc2_ = param1[0];
            _loc3_ = param1[1];
            if(Boolean(_loc3_.parentBoneData) && _loc3_.parentBoneData.name == _loc2_.name)
            {
               return true;
            }
            if(Boolean(_loc2_.parentBoneData) && _loc2_.parentBoneData.name == _loc3_.name)
            {
               param1.reverse();
               return true;
            }
            return false;
         }
         return true;
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
      
      private function _4386(param1:FocusEvent) : void
      {
         var _loc2_:int = int(_2226._2889.length);
         var _loc3_:Array = [];
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            if(!(_2226._2889[_loc4_] is _52))
            {
               return;
            }
            _loc3_.push(Number(this._4044._4424._4441.txt.text));
            _loc4_++;
         }
         _1567(new CommandNotification(CommandNotification.MODIFY_BONE_ITEMS_LENGTH,_469._2979(_2226._2889,_loc3_)));
         _2217._1651();
      }
      
      private function _4391(param1:AnimationEvent) : void
      {
         var _loc2_:_83 = this._4044.model._1837._1926.clone();
         _loc2_.alphaMultiplier = param1.data.to;
         var _loc3_:_83 = _loc2_.clone();
         _loc3_.alphaMultiplier = param1.data.from;
         this._13802(_loc2_,_loc3_,true);
         _2217._1651();
      }
      
      private function _4392(param1:AnimationEvent) : void
      {
         var _loc2_:_83 = this._4044.model._1837._1926.clone();
         _loc2_.alphaMultiplier = param1.data.to;
         var _loc3_:_83 = _loc2_.clone();
         _loc3_.alphaMultiplier = param1.data.from;
         this._13802(_loc2_,_loc3_,true);
      }
      
      private function _14565(param1:AnimationEvent) : void
      {
         var _loc2_:_77 = param1.data;
         this._14566(_loc2_,_loc2_._14310,_loc2_._14311,true);
      }
      
      private function _14561(param1:AnimationEvent) : void
      {
         var _loc2_:_77 = param1.data;
         this._14566(_loc2_,_loc2_._14310,_loc2_._14311,true);
      }
      
      private function _14023(param1:TimelineNotification) : void
      {
         var _loc3_:_79 = null;
         var _loc4_:_70 = null;
         var _loc5_:Boolean = false;
         var _loc2_:Object = param1.data;
         if(_loc2_)
         {
            _loc3_ = _loc2_._1837;
            _loc4_ = _loc2_._3013;
            _loc5_ = this._2852.autoKey;
            if(_loc3_)
            {
               this._13795(_loc3_,_loc4_,_loc5_);
            }
         }
      }
      
      private function _13805(param1:AnimationEvent) : void
      {
         var _loc2_:_79 = this._4044.model._1837;
         var _loc3_:_70 = _loc2_._2049;
         this._13795(_loc2_,_loc3_,true);
      }
      
      private function _13804(param1:AnimationEvent) : void
      {
      }
      
      private function _14024(param1:AnimationEvent) : void
      {
         var _loc2_:_79 = this._4044.model._1837;
         if(_loc2_)
         {
            this._14022(_loc2_,_loc2_.currentAnimation,true);
         }
      }
      
      private function _14026(param1:AnimationEvent) : void
      {
         var _loc2_:_79 = this._4044.model._1837;
         if(_loc2_ && _loc2_._2049 && _loc2_._2049._2165 && Boolean(_loc2_._2049.mesh))
         {
            this._14027(_loc2_._2049);
         }
      }
      
      private function _13807(param1:AnimationEvent) : void
      {
         var _loc2_:_79 = this._4044.model._1837;
         var _loc3_:_83 = _loc2_._1926.clone();
         this._13797(_loc3_,_loc3_,true);
         _2217._1651();
      }
      
      private function _14027(param1:_70) : void
      {
         var _loc2_:_13502 = null;
         var _loc3_:int = 0;
         var _loc4_:_13507 = null;
         var _loc5_:_13501 = null;
         var _loc6_:Vector.<Number> = null;
         var _loc7_:Object = null;
         if(param1)
         {
            _loc2_ = this._2852._13704;
            _loc3_ = this._2852.timeline.curFrame;
            _loc4_ = _loc2_._1881(param1);
            _loc5_ = _loc4_.getFrameByIndex(_loc3_) as _13501;
            _loc6_ = !!param1.mesh._3142 ? param1.mesh._3142.concat() : new Vector.<Number>();
            _loc7_ = {};
            if(_loc5_)
            {
               _loc7_._3005 = false;
               _loc7_.oldValue = _loc5_.value;
               _loc7_.newValue = _loc6_;
            }
            else
            {
               (_loc5_ = new _13501()).tweenType = 1;
               _loc5_.startPos = _loc3_;
               _loc5_.value = _loc6_;
               _loc7_.newValue = _loc6_;
               _loc7_._3005 = true;
            }
            _loc7_._1945 = _loc4_;
            _loc7_._1946 = _loc5_;
            _1567(new CommandNotification(CommandNotification.ADD_AUTO_FFD_FRAME,_loc7_));
         }
      }
      
      private function _4393(param1:AnimationEvent) : void
      {
         var _loc2_:uint = uint(param1.data.to);
         var _loc3_:uint = uint(param1.data.from);
         var _loc4_:Number = Number(param1.data.alpha);
         var _loc5_:ColorTransform;
         (_loc5_ = new ColorTransform()).color = _loc2_;
         var _loc6_:_83;
         (_loc6_ = new _83(_loc5_.redOffset / 255,_loc5_.greenOffset / 255,_loc5_.blueOffset / 255)).alphaMultiplier = _loc4_;
         _loc5_.color = _loc3_;
         var _loc7_:_83;
         (_loc7_ = new _83(_loc5_.redOffset / 255,_loc5_.greenOffset / 255,_loc5_.blueOffset / 255)).alphaMultiplier = _loc4_;
         this._13802(_loc6_,_loc7_);
         _2217._1651();
      }
      
      private function _4394(param1:AnimationEvent) : void
      {
         var _loc2_:uint = uint(param1.data.to);
         var _loc3_:uint = uint(param1.data.from);
         var _loc4_:Number = Number(param1.data.alpha);
         var _loc5_:ColorTransform;
         (_loc5_ = new ColorTransform()).color = _loc2_;
         var _loc6_:_83;
         (_loc6_ = new _83(_loc5_.redOffset / 255,_loc5_.greenOffset / 255,_loc5_.blueOffset / 255)).alphaMultiplier = _loc4_;
         _loc5_.color = _loc3_;
         var _loc7_:_83;
         (_loc7_ = new _83(_loc5_.redOffset / 255,_loc5_.greenOffset / 255,_loc5_.blueOffset / 255)).alphaMultiplier = _loc4_;
         this._13802(_loc6_,_loc7_);
      }
      
      private function _13802(param1:_83, param2:_83, param3:Boolean = false) : void
      {
         var _loc4_:String = null;
         var _loc5_:Boolean = false;
         switch(this._2873)
         {
            case _715.ARMATURE:
               _loc4_ = CommandNotification.MODIFY_SLOT_COLOR;
               break;
            case _715.ANIMATE:
               _loc5_ = this._2852.autoKey;
               this._13797(param1,param2,_loc5_,param3);
               return;
            case _715.GENERAL:
               this._13793(param1,param2,true,param3);
               return;
         }
         _1567(new CommandNotification(_loc4_,_469._3484(this._4044.model._1837,param1,param2)));
      }
      
      public function _13797(param1:_83, param2:_83, param3:Boolean, param4:Boolean = false) : void
      {
         var _loc5_:Object = null;
         var _loc9_:_13508 = null;
         var _loc10_:_13510 = null;
         var _loc11_:_13494 = null;
         var _loc12_:_421 = null;
         _loc5_ = {};
         var _loc6_:int = this._2852.timeline.curFrame;
         var _loc7_:_13502 = this._2852._13704;
         var _loc8_:_79 = this._4044.model._1837;
         _loc5_.frameIndex = _loc6_;
         _loc5_._1992 = _loc7_;
         _loc5_.autoKey = param3;
         _loc5_._1837 = _loc8_;
         _loc5_.newColor = param1;
         _loc5_.alpha = param4;
         if(param3)
         {
            _loc9_ = _loc7_._1875(_loc8_);
            if(_loc9_)
            {
               _loc10_ = _loc9_._13599;
               if((_loc11_ = _loc10_.getFrameByIndex(_loc6_) as _13494) == null)
               {
                  _loc5_._3005 = true;
                  (_loc11_ = new _13494()).startPos = _loc6_;
                  _loc11_.tweenType = 1;
                  _loc11_.value = param1;
               }
               _loc5_._3007 = _loc11_._13601;
               _loc5_._1945 = _loc10_;
               _loc5_._1946 = _loc11_;
            }
            _1567(new CommandNotification(CommandNotification.MODIFY_SLOT_FRAME_COLOR,_loc5_));
         }
         else
         {
            _loc12_ = new _421();
            _loc12_._1572(_loc5_);
            _loc12_.execute();
         }
      }
      
      private function _13793(param1:_83, param2:_83, param3:Boolean, param4:Boolean = false) : void
      {
         var _loc5_:Object = null;
         var _loc11_:_13504 = null;
         var _loc12_:_13510 = null;
         var _loc13_:_13494 = null;
         var _loc14_:int = 0;
         var _loc15_:_86 = null;
         var _loc16_:Object = null;
         var _loc17_:_13510 = null;
         var _loc18_:_13498 = null;
         var _loc19_:_13510 = null;
         var _loc20_:_13499 = null;
         var _loc21_:_13510 = null;
         var _loc22_:_13498 = null;
         var _loc23_:_13510 = null;
         var _loc24_:_13494 = null;
         var _loc25_:_13510 = null;
         var _loc26_:_13495 = null;
         var _loc27_:_13510 = null;
         var _loc28_:_13493 = null;
         _loc5_ = {};
         var _loc6_:int = this._2852.timeline.curFrame;
         var _loc7_:_13502 = this._2852._13704;
         var _loc8_:_79 = this._4044.model._1837;
         var _loc9_:_52 = _loc8_.parentBoneData;
         _loc5_.frameIndex = _loc6_;
         _loc5_._1992 = _loc7_;
         _loc5_.autoKey = param3;
         _loc5_._1837 = _loc8_;
         _loc5_.newColor = param1;
         _loc5_.alpha = param4;
         var _loc10_:_13508 = _loc7_._1875(_loc8_);
         if(_loc10_)
         {
            _loc12_ = _loc10_._13599;
            if((_loc13_ = _loc12_.getFrameByIndex(_loc6_) as _13494) != null)
            {
               _loc5_._3007 = _loc13_._13601;
               _loc5_._1945 = _loc12_;
               _loc5_._1946 = _loc13_;
               _1567(new CommandNotification(CommandNotification.MODIFY_SLOT_FRAME_COLOR,_loc5_));
            }
            else
            {
               _loc5_._3005 = true;
               (_loc13_ = new _13494()).startPos = _loc6_;
               _loc13_.tweenType = 1;
               _loc13_.value = param1;
               if(Boolean(_loc8_) && Boolean(_loc9_))
               {
                  _loc11_ = _loc7_._1873(_loc9_);
                  _loc14_ = _loc6_;
                  if(Boolean(_loc11_) && Boolean(_loc10_))
                  {
                     if(!_loc11_._5819(_loc14_) && !_loc10_._5819(_loc14_))
                     {
                        _loc15_ = _loc9_.currentLocalTransform.clone();
                        _loc15_._1930(_loc9_._1724);
                        (_loc16_ = {})._1992 = _3028;
                        _loc16_.frameIndex = _loc14_;
                        _loc17_ = _loc11_._13581;
                        (_loc18_ = new _13498()).startPos = _loc14_;
                        _loc18_.value = new Point(_loc15_.x,_loc15_.y);
                        _loc19_ = _loc11_._13586;
                        (_loc20_ = new _13499()).startPos = _loc14_;
                        _loc20_.value = _loc15_.rotation;
                        _loc21_ = _loc11_._13598;
                        (_loc22_ = new _13498()).startPos = _loc14_;
                        _loc22_.value = new Point(_loc15_.scaleX,_loc15_.scaleY);
                        _loc23_ = _loc10_._13599;
                        (_loc24_ = new _13494()).startPos = _loc14_;
                        _loc24_.value = param1;
                        _loc25_ = _loc10_._13572;
                        (_loc26_ = new _13495()).startPos = _loc14_;
                        _loc26_.value = _loc8_._1923;
                        _loc27_ = _loc10_._13592;
                        (_loc28_ = new _13493()).startPos = _loc14_;
                        _loc28_.value = _loc8_._13682;
                        _loc16_._13581 = _loc17_;
                        _loc16_._13595 = _loc19_;
                        _loc16_._13598 = _loc21_;
                        _loc16_._13627 = _loc18_;
                        _loc16_._13710 = _loc20_;
                        _loc16_._13631 = _loc22_;
                        _loc16_._13599 = _loc23_;
                        _loc16_._13632 = _loc24_;
                        _loc16_._13593 = _loc25_;
                        _loc16_._13707 = _loc26_;
                        _loc16_._13592 = _loc27_;
                        _loc16_._13708 = _loc28_;
                        _1567(new CommandNotification(CommandNotification.ADD_BASIC_FRAMES,[_loc16_]));
                     }
                  }
               }
            }
         }
      }
      
      private function _10585(param1:AnimationEvent) : void
      {
         var _loc2_:Object = new Object();
         _loc2_._1837 = param1.data.item;
         _loc2_._10564 = param1.data.blendMode;
         if(param1.data.item.blendMode)
         {
            _loc2_._10563 = param1.data.item.blendMode;
         }
         else
         {
            _loc2_._10563 = BlendMode.NORMAL;
         }
         _1567(new CommandNotification(CommandNotification.MODIFY_SLOT_BLENDMODE,_loc2_));
      }
      
      private function _4375(param1:AnimationEvent) : void
      {
         var _loc4_:Object = null;
         var _loc5_:String = null;
         var _loc6_:Boolean = false;
         var _loc2_:_70 = param1.data as _70;
         var _loc3_:_79 = this._4044.model._1837;
         if(this._2873 == _715.ARMATURE)
         {
            _loc4_ = _469._3152(_loc3_,_loc2_);
            _loc5_ = CommandNotification.MODIFY_SLOT_DISPLAY;
            _1567(new CommandNotification(_loc5_,_loc4_));
         }
         else
         {
            _loc6_ = this._2852.autoKey;
            this._13795(_loc3_,_loc2_,_loc6_);
         }
      }
      
      private function _14566(param1:_77, param2:int, param3:Number, param4:Boolean) : void
      {
         if(this._2873 != _715.ARMATURE)
         {
            if(this._2873 == _715.ANIMATE)
            {
               this._14563(param1,param2,param3,param4);
            }
         }
      }
      
      private function _14563(param1:_77, param2:int, param3:Number, param4:Boolean) : void
      {
         var _loc9_:_14034 = null;
         var _loc10_:String = null;
         var _loc5_:Object = {};
         var _loc6_:int = this._2852.timeline.curFrame;
         var _loc7_:_13502 = this._2852._13704;
         _loc5_.frameIndex = _loc6_;
         _loc5_._1992 = _loc7_;
         _loc5_.autoKey = param4;
         _loc5_._2942 = param1;
         _loc5_._2990 = param2;
         _loc5_._2991 = param3;
         _loc5_.autoKey = param4;
         var _loc8_:_14035 = _loc7_._14304(param1);
         if(_loc8_)
         {
            _loc9_ = _loc8_.getFrameByIndex(_loc6_) as _14034;
            if(_loc9_ == null)
            {
               _loc5_._3005 = true;
               (_loc9_ = new _14034()).tweenType = 1;
               _loc9_.startPos = _loc6_;
               _loc9_.value = param1._14311;
               _loc9_.bend = param1._14310;
            }
            _loc5_._2992 = _loc9_._14279;
            _loc5_._2989 = _loc9_.bend;
            _loc5_._1945 = _loc8_;
            _loc5_._1946 = _loc9_;
            _loc10_ = CommandNotification.MODIFY_IK_FRAME;
            _1567(new CommandNotification(_loc10_,_loc5_));
         }
      }
      
      private function _14022(param1:_79, param2:String, param3:Boolean) : void
      {
         var _loc10_:_13510 = null;
         var _loc11_:_13495 = null;
         var _loc4_:Object = {};
         var _loc5_:int = this._2852.timeline.curFrame;
         var _loc6_:_13502 = this._2852._13704;
         _loc4_.frameIndex = _loc5_;
         _loc4_._1992 = _loc6_;
         _loc4_.autoKey = param3;
         _loc4_._1837 = param1;
         _loc4_._14020 = param2;
         var _loc7_:_70 = param1._2049;
         var _loc8_:_13508 = _loc6_._1875(param1);
         if(_loc8_)
         {
            _loc10_ = _loc8_._13572;
            if((_loc11_ = _loc10_.getFrameByIndex(_loc5_) as _13495) == null)
            {
               _loc4_._3005 = true;
               (_loc11_ = new _13495()).startPos = _loc5_;
               _loc11_.value = !!_loc7_ ? _loc7_._1733 : null;
               _loc11_._13603 = param2 == _79.CACHE_NO_ANIM ? null : param2;
            }
            _loc4_.oldDisplay = param1.currentAnimation;
            _loc4_._1945 = _loc10_;
            _loc4_._1946 = _loc11_;
         }
         var _loc9_:String = CommandNotification.MODIFY_SLOT_FRAME_GOTO;
         _1567(new CommandNotification(_loc9_,_loc4_));
      }
      
      public function _13795(param1:_79, param2:_70, param3:Boolean) : void
      {
         var _loc7_:_13508 = null;
         var _loc8_:String = null;
         var _loc9_:_13510 = null;
         var _loc10_:_13495 = null;
         var _loc11_:_422 = null;
         var _loc4_:Object = {};
         var _loc5_:int = this._2852.timeline.curFrame;
         var _loc6_:_13502 = this._2852._13704;
         _loc4_.frameIndex = _loc5_;
         _loc4_._1992 = _loc6_;
         _loc4_.autoKey = param3;
         _loc4_._1837 = param1;
         _loc4_._3013 = param2;
         if(param3)
         {
            _loc7_ = _loc6_._1875(param1);
            if(_loc7_)
            {
               _loc9_ = _loc7_._13572;
               if((_loc10_ = _loc9_.getFrameByIndex(_loc5_) as _13495) == null)
               {
                  _loc4_._3005 = true;
                  (_loc10_ = new _13495()).startPos = _loc5_;
                  _loc10_.value = !!param2 ? param2._1733 : null;
               }
               _loc4_.oldDisplay = param1._1765[_loc10_._13613];
               _loc4_._1945 = _loc9_;
               _loc4_._1946 = _loc10_;
            }
            _loc8_ = CommandNotification.MODIFY_SLOT_FRAME_DISPLAY;
            _1567(new CommandNotification(_loc8_,_loc4_));
         }
         else
         {
            _loc11_ = new _422();
            _loc11_._1572(_loc4_);
            _loc11_.execute();
         }
      }
      
      private function _11327(param1:AnimationEvent) : void
      {
         var _loc2_:_557 = _1407.getInstance(_557) as _557;
         switch(param1.type)
         {
            case AnimationEvent.MODIFY_FRAMES_TWEEN_TYPE:
               _11495._11570(CommandNotification.MODIFY_FRAMES_TWEEN_TYPE,_11495.create(param1.data[0]).add("tweenType",param1.data[1]).add("tweenCurve",null),_loc2_._11613);
               break;
            case AnimationEvent.MODIFY_FRAMES_TWEEN_ROTATE:
               _11495._11570(CommandNotification.MODIFY_FRAMES_TWEEN_ROTATE,_11495.create(param1.data[0]).add("tweenRotate",param1.data[1]),_loc2_._11613);
         }
      }
      
      private function _11326(param1:AnimationEvent) : void
      {
         var _loc2_:_13491 = null;
         var _loc3_:_75 = null;
         var _loc4_:String = null;
         var _loc5_:_44 = null;
         switch(param1.type)
         {
            case AnimationEvent.ADD_FRAME_ACTION:
               _loc2_ = param1.data[0];
               _loc3_ = param1.data[1];
               _loc4_ = param1.data[2];
               if(_loc2_ && _loc4_ && Boolean(_loc2_._13637))
               {
                  _loc5_ = _44.create(_loc3_,_loc4_);
                  param1.data[1] = _loc5_;
                  _1567(new CommandNotification(CommandNotification.ADD_FRAME_ACTION,param1.data));
               }
               break;
            case AnimationEvent.MODIFY_FRAME_ACTION:
               break;
            case AnimationEvent.MODIFY_FRAME_EVENT:
               _1567(new CommandNotification(CommandNotification.MODIFY_FRAME_EVENT,param1.data));
               break;
            case AnimationEvent.DEL_FRAME_ACTION:
               _1567(new CommandNotification(CommandNotification.DEL_FRAME_ACTION,param1.data));
         }
      }
      
      private function _11333(param1:AnimationEvent) : void
      {
         _1567(new TipNotification(TipNotification.SHOW_TIP_TEXT,{
            "showText":tr("Property.frame.event.target.pick"),
            "x":stage.mouseX,
            "y":stage.mouseY
         }));
      }
      
      private function _4423(param1:AnimationEvent) : void
      {
         var _loc2_:_52 = null;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:_719 = null;
         var _loc6_:Array = null;
         var _loc7_:Object = null;
         if(_2226._3872)
         {
            _loc2_ = _2226._3872;
         }
         else if(_2226._3150)
         {
            _loc2_ = _2226._3150.parentBoneData;
         }
         if(_loc2_)
         {
            _loc3_ = _loc2_.globalTransform.x - (param1.data.x - _loc2_._1882.currentLocalTransform.x) * _loc2_.globalTransform.scaleX;
            _loc4_ = _loc2_.globalTransform.y - (param1.data.y - _loc2_._1882.currentLocalTransform.y) * _loc2_.globalTransform.scaleY;
            _loc5_ = _719.GLOBAL;
            _loc6_ = [_718.X,_loc3_,_718.Y,_loc4_];
            _loc7_ = _469._2980(_loc2_,_loc5_,_loc6_,1,0);
            this._1567(new CommandNotification(CommandNotification.MODIFY_PIVOT,_loc7_));
         }
      }
      
      private function _4411(param1:AnimationEvent) : void
      {
         _1567(new CommandNotification(CommandNotification.MODIFY_STAGE_CANVAS,param1.data));
      }
      
      public function _3453(param1:_13496) : void
      {
         this._4044._3453(param1);
         if(param1 == null)
         {
            this.refresh();
         }
      }
      
      public function _13801(param1:int) : void
      {
         if(this._4044)
         {
            if(this._4044._4426)
            {
               this._4044._4426._13801(param1);
            }
            if(this._4044._4406)
            {
               this._4044._4406._13801(param1);
            }
         }
      }
      
      public function _3039(param1:_79) : void
      {
         if(Boolean(this._4044.model) && this._4044.model._1946 != null)
         {
            return;
         }
         this.refresh(param1);
      }
      
      public function _14432() : void
      {
         if(Boolean(this._4044) && Boolean(this._4044._4424))
         {
            this._4044._4424._14432();
         }
      }
      
      public function refresh(param1:Object = null) : void
      {
         var _loc4_:Object = null;
         var _loc5_:* = false;
         var _loc6_:_665 = null;
         var _loc7_:_50 = null;
         if(this._4044 == null || this._4044.setParentBtn == null)
         {
            return;
         }
         this._4044.setParentBtn.enabled = false;
         this._4044.setParentBtn.visible = _2220._2873 == _715.ARMATURE;
         if(!(_2214 && _2214._1844 && Boolean(_2214._1844._2871) && _2214._1844._2871._2865))
         {
            return;
         }
         if(_3028._1811 == SymbolType.SHEET)
         {
            this._4044._13276(_3028);
            return;
         }
         var _loc2_:Array = _2226._2889;
         var _loc3_:Number = 0;
         if(_loc2_.length > 1)
         {
            _loc3_ = this._4429(_loc2_[0]);
            for each(_loc4_ in _loc2_)
            {
               if(_loc3_ != this._4429(_loc4_) || _loc3_ != 1 && _loc4_ != _loc2_[0])
               {
                  this._4044._4417(_2214._1844._2871._2865);
                  return;
               }
            }
         }
         if(param1 != null && _2226._3150 != param1 && _2226._3872 != param1)
         {
            return;
         }
         if(_2226._2484 is _52)
         {
            if(!(this._4549._2889.length == 1 && this._4549._2889[0].duration > 0 && this._4549._2889[0].flag == _13510.FLAG_ROTATE && this._4549._2889[0].parent && this._4549._2889[0].parent.parent is _13504 && (this._4549._2889[0].parent.parent as _13504)._1823 == _2226._2484))
            {
               this._4044._4435(_2226._2889);
            }
            if(_2220._2873 == _715.ARMATURE && _2226._2889.length == 1 && Boolean((_2226._2484 as _52).parentBoneData))
            {
               this._4044.setParentBtn.enabled = true;
            }
            else
            {
               this._4044.setParentBtn.enabled = false;
            }
         }
         else if(_2226._2484 is _79)
         {
            _loc5_ = _2220._2873 == _715.GENERAL;
            this._4044._4434(_2226._3150,_loc5_);
            if(_2220._2873 == _715.ARMATURE && _2226._2889.length == 1)
            {
               this._4044.setParentBtn.enabled = true;
            }
            else
            {
               this._4044.setParentBtn.enabled = false;
            }
         }
         else if(_2226._2484 is _70)
         {
            this._4044._4420(_2226._2484 as _70);
         }
         else if(_2226._2484 is _50)
         {
            this._4044._4417(_2214._1844._2871._2865);
         }
         else if(_2226._2484 is _39)
         {
            if(!(this._2873 == _715.ANIMATE || this._2873 == _715.GENERAL))
            {
               this._4044._4417(_2214._1844._2871._2865);
            }
         }
         else if(_2226._2484 == null)
         {
            if(this._2873 == _715.ANIMATE && this._13796._2889.length == 1 && this._13796._2889[0] is _13506)
            {
               this._13798();
            }
            else if(this._2873 == _715.ANIMATE && this._4549._2889.length == 1 && this._4549._2889[0].flag == _13510.FLAG_EVENT)
            {
               this._13798();
            }
            else if(this._2214._1844)
            {
               _loc6_ = this._2214._1844._2871;
               _loc7_ = _loc6_._2865;
               if(_loc6_ && _loc6_._3286 && Boolean(_loc6_._3286._4409))
               {
                  this._4044._4417(_2214._1844._2871._2865,_loc6_._3286._4409[_loc7_]);
               }
            }
         }
      }
      
      private function _4429(param1:Object) : int
      {
         if(param1 is _52)
         {
            return 1;
         }
         if(param1 is _79 || param1 is _70)
         {
            return 2;
         }
         return 0;
      }
      
      private function _4379(param1:Point) : Point
      {
         return (_1407.getInstance(_580) as _580).stagePanel.stageView._4428.globalToLocal(param1);
      }
      
      public function _3396() : void
      {
         this._4044._11332.refresh();
         this._4044._11331.refresh();
      }
      
      public function _11313() : void
      {
         _99(function():void
         {
            var _loc1_:EventFolderItem = _4044._11331._11340.getElementAt(_4044._11331._11340._2249 - 1) as EventFolderItem;
            _4044.stage.focus = _loc1_._11343;
            _loc1_._11343.selectAll();
         });
      }
      
      public function _11312() : void
      {
         _99(function():void
         {
            _4044.stage.focus = _4044._11331._11342._11343;
            _4044._11331._11342._11343.selectAll();
         });
      }
      
      private function get _2873() : _715
      {
         return _2220._2873;
      }
      
      public function get _4384() : Rectangle
      {
         var _loc1_:Point = this._4044.localToGlobal(new Point());
         return new Rectangle(_loc1_.x,_loc1_.y,this._4044.width,this._4044.height);
      }
      
      protected function get _2580() : Number
      {
         return (_1407.getInstance(_580) as _580)._2212._2580;
      }
      
      private function _11338(param1:BoundingBoxEvent) : void
      {
         _1567(new BoundingBoxNotification(BoundingBoxNotification.FREEZE));
      }
      
      private function _11341(param1:BoundingBoxEvent) : void
      {
         _1567(new BoundingBoxNotification(BoundingBoxNotification.EDIT));
      }
      
      private function _11625(param1:MeshEvent) : void
      {
         _1567(new MeshNotification(MeshNotification.EDIT_UV));
      }
      
      public function _11328() : Boolean
      {
         if(this._4044)
         {
            return this._4044._4406._11328() || this._4044._4426._11328();
         }
         return false;
      }
      
      public function _11622() : Boolean
      {
         if(this._4044)
         {
            return this._4044._4406._11622() || this._4044._4426._11622();
         }
         return false;
      }
      
      private function get _11296() : _11247
      {
         return _1407.getInstance(_11247) as _11247;
      }
      
      private function get _11621() : _11505
      {
         return _1407.getInstance(_11505) as _11505;
      }
      
      private function get _2852() : TimelinePanelController
      {
         return _1407.getInstance(TimelinePanelController) as TimelinePanelController;
      }
      
      protected function get _2877() : _588
      {
         return _1407.getInstance(_588) as _588;
      }
   }
}

