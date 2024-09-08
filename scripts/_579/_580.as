package _579
{
   import _11106._11108;
   import _11111._11110;
   import _11220._11219;
   import _1146.Fade;
   import _1177.UIEvent;
   import _13._12;
   import _13._14;
   import _1404._1407;
   import _14106.RulerEvent;
   import _24.Shortcut;
   import _24._25;
   import _24._26;
   import _470._469;
   import _51._70;
   import _51._79;
   import _521._530;
   import _555.LibraryPanelController;
   import _555._13202;
   import _555._576;
   import _573.TimelinePanelController;
   import _586._11247;
   import _586._11505;
   import _586._13204;
   import _586._597;
   import _586._599;
   import _586._600;
   import _586._603;
   import _586._604;
   import _586._605;
   import _586._606;
   import _636.BoundingBoxEvent;
   import _636.DBPanelEvent;
   import _636.MeshEvent;
   import _639._642;
   import _668._671;
   import _668._706;
   import _708._714;
   import _708._715;
   import _708._716;
   import _73.SymbolType;
   import _73._74;
   import _783.BoundingBoxNotification;
   import _783.CommandNotification;
   import _783.MeshNotification;
   import _783.PanelNotification;
   import _783.StageNotification;
   import _93._94;
   import _935._13219;
   import _935._937;
   import _935._939;
   import _935._940;
   import _935._941;
   import _944.StagePanel;
   import _953._13222;
   import _953._959;
   import _953._960;
   import _953._961;
   import _953._962;
   import _953._963;
   import egret.utils.tr;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.Timer;
   
   public class _580 extends _94
   {
      public static var gap:int = 5;
      
      private var _4867:_603;
      
      private var _3331:_578;
      
      private var _4896:StagePanel;
      
      private var _4894:_716;
      
      private var _4897:Boolean = false;
      
      private var _11641:Boolean = false;
      
      private var _4878:Boolean = false;
      
      private var _11376:Fade;
      
      private var _12634:Fade;
      
      private var _11375:Fade;
      
      private var _12633:Fade;
      
      private var _12957:Boolean;
      
      private var _4890:String;
      
      private var _4898:Number;
      
      private var _4899:Number;
      
      private var _4879:Number = 0;
      
      private var _4880:Number = 0;
      
      private var _4903:Boolean;
      
      private var _12632:Boolean;
      
      private var _4886:_716;
      
      private var _4309:String = "auto";
      
      public function _580()
      {
         this._3331 = _1407.getInstance(_578);
         this._11376 = new Fade();
         this._12634 = new Fade();
         this._11375 = new Fade();
         this._12633 = new Fade();
         super();
         gap = _642.getInstance().useruler ? 25 : 5;
      }
      
      override public function start() : void
      {
         var _loc1_:Timer = null;
         if(_2227)
         {
            return;
         }
         if(this._4896.stageView)
         {
            super.start();
            this._4906();
            this._4870();
            this._14624();
            this._14617();
         }
         else
         {
            _loc1_ = new Timer(100);
            _loc1_.addEventListener(TimerEvent.TIMER,this.onTimer);
            _loc1_.start();
            this._4896.addEventListener(UIEvent.CREATION_COMPLETE,this._4851);
         }
      }
      
      private function onTimer(param1:TimerEvent) : void
      {
         if(!_2227 && this._4896 && Boolean(this._4896.stageView))
         {
            this.start();
         }
         if(Boolean(this._4896) && Boolean(this._4896.stageView))
         {
            param1.target.stop();
            param1.target.removeEventListener(TimerEvent.TIMER,this.onTimer);
         }
      }
      
      override protected function _1576() : void
      {
         _1565(StageNotification.UPDATE_RULER,this._14623);
         _1565(StageNotification.UPDATE_RULER_USABLE,this._14623);
         _1565(StageNotification.UPDATE_RULER_ASSIST_LINE_USABLE,this._14623);
         _1565(StageNotification.UPDATE_RULER_ASSIST_LINE_SELECT,this._14623);
         _1565(StageNotification.UPDATE_RULER_ASSIST_LINE_COLOR,this._14623);
         _1565(StageNotification.UPDATE_CURRENT_ARMATURE,this._3973);
         _1565(StageNotification.UPDATE_EDIT_MODE,this._3864);
         _1565(StageNotification.UPDATE_ANIMATION_MODE,this._4702);
         _1565(StageNotification.START_FRAMESELECT,this._4874);
         _1565(StageNotification.START_PICK,this._4524);
         _1565(StageNotification.STOP_WEIGHT_TOOL,this._4404);
         _1565(StageNotification.CHANGE_TRANSFORM_MODEL,this._10764);
         _1565(StageNotification.SET_CURSOR,this._4900);
         _1565(StageNotification.REMOVE_CURSOR,this._4889);
         _1565(StageNotification.START_EDIT_BOUNDINGBOX,this._11329);
         _1565(StageNotification.STOP_EDIT_BOUNDINGBOX,this._11345);
         _1565(StageNotification.UPDATE_BG_COLOR,this._13883);
         _1565(BoundingBoxNotification.START_EDIT,this._11370);
         _1565(BoundingBoxNotification.STOP_EDIT,this._11371);
         _1565(BoundingBoxNotification.CHANGE_MODE,this._11367);
         _1565(MeshNotification.EDIT_UV,this._11690,100);
         _1565(MeshNotification.CHANGE_UV_TOOL,this._11639);
         _1565(MeshNotification.CHANGE_DEFORM,this._11638);
         _1565(StageNotification.START_EDIT_MESH_UV,this._11645);
         _1565(StageNotification.STOP_EDIT_MESH_UV,this._11648);
         this._4896.addEventListener(DBPanelEvent.EDIT_MODE_CHANGED,this._4853);
         this._4896.addEventListener(DBPanelEvent.TOOL_CHANGED,this._4861);
         this._4896.addEventListener(DBPanelEvent.ZOOM_CHANGED,this._4862);
         this._4896.addEventListener(MouseEvent.RIGHT_MOUSE_DOWN,this._4854);
         this._4896.addEventListener(Event.DEACTIVATE,this._4864);
         this._4896.addEventListener(DBPanelEvent.IMPORT_ASSET,this._4860);
         this._4896.addEventListener(BoundingBoxEvent.CHANGE_MODE,this._11372);
         this._4896.addEventListener(BoundingBoxEvent.CLOSE_EDIT,this._11368);
         this._4896.addEventListener(MeshEvent.CLOSE_EDIT,this._11646);
         this._4896.addEventListener(MeshEvent.CHANGE_MODE,this._11644);
         this._4896.addEventListener(MeshEvent.CLICK_RESET,this._11650);
         this._4896.addEventListener(MeshEvent.DEFORM_CHANGE,this._11640);
         this._4896.addEventListener(MeshEvent.CLICK_AUTO,this._13884);
         if(stage)
         {
            stage.addEventListener(KeyboardEvent.KEY_DOWN,this._12953);
         }
      }
      
      private function _14624() : void
      {
         this._4896.skin._14625(_2216.useruler ? 25 : 5);
         this.stageView.init(_2214._1844._2871._14621);
      }
      
      private function _14623(param1:StageNotification) : void
      {
         switch(param1.type)
         {
            case StageNotification.UPDATE_RULER:
               this._14624();
               break;
            case StageNotification.UPDATE_RULER_USABLE:
               this.stageView._14616();
               this._4896.skin._14625(_2216.useruler ? 25 : 5);
               break;
            case StageNotification.UPDATE_RULER_ASSIST_LINE_USABLE:
               this.stageView._14611();
               break;
            case StageNotification.UPDATE_RULER_ASSIST_LINE_SELECT:
               this.stageView._14610();
               break;
            case StageNotification.UPDATE_RULER_ASSIST_LINE_COLOR:
               this.stageView._14612();
         }
      }
      
      private function _14614() : void
      {
         if(this.stageView)
         {
            _2216.assistLine = !_2216.assistLine;
            this.stageView._14611();
         }
      }
      
      private function _14613() : void
      {
         if(this.stageView)
         {
            _2216.assistLineenable = !_2216.assistLineenable;
            this.stageView._14610();
         }
      }
      
      private function _12955(param1:KeyboardEvent) : void
      {
      }
      
      private function _12953(param1:KeyboardEvent) : void
      {
         var _loc2_:Array = _25._1691[_26.DRAG_MOVE_STAGE];
         if(_loc2_ && _loc2_.length == 1 && param1.keyCode == _loc2_[0] && !this._12957)
         {
            this._11642 = true;
         }
      }
      
      private function _11646(param1:MeshEvent) : void
      {
         _1567(new MeshNotification(MeshNotification.STOP_EDIT));
      }
      
      private function _11644(param1:MeshEvent) : void
      {
         _1567(new MeshNotification(MeshNotification.CHANGE_UV_TOOL,param1.data));
      }
      
      private function _11650(param1:MeshEvent) : void
      {
         _1567(new MeshNotification(MeshNotification.RESET_UV));
      }
      
      private function _13884(param1:MeshEvent) : void
      {
         _1567(new MeshNotification(MeshNotification.AUTO_UV,param1.data));
      }
      
      private function _11640(param1:MeshEvent) : void
      {
         _1567(new MeshNotification(MeshNotification.CHANGE_DEFORM,param1.data));
      }
      
      private function _11345(param1:StageNotification) : void
      {
         this._4896._4905.enabled = !this._11296.editing;
      }
      
      private function _13883(param1:StageNotification) : void
      {
         this.stagePanel.invalidateDisplayList();
      }
      
      private function _11329(param1:StageNotification) : void
      {
         this._4896._4905.enabled = !this._11296.editing;
      }
      
      private function _11368(param1:BoundingBoxEvent) : void
      {
         _1567(new BoundingBoxNotification(BoundingBoxNotification.STOP_EDIT));
      }
      
      private function _11372(param1:BoundingBoxEvent) : void
      {
         _1567(new BoundingBoxNotification(BoundingBoxNotification.CHANGE_MODE,param1.data));
      }
      
      public function _11298() : void
      {
         var _loc1_:_11219 = null;
         if(Boolean(this.stagePanel) && Boolean(this.stagePanel._11369))
         {
            if(_2226._2484 is _79 && (_2226._2484 as _79)._2049 && (_2226._2484 as _79)._2049.type == _74.BOUNDINGBOX)
            {
               _loc1_ = (_2226._2484 as _79)._2049._11278;
            }
            else if(_2226._2484 is _70 && (_2226._2484 as _70).type == _74.BOUNDINGBOX)
            {
               _loc1_ = (_2226._2484 as _70)._11278;
            }
            if(_loc1_)
            {
               this.stagePanel._11369._11373.text = tr("BoundingBoxPanel.vertices",_loc1_.vertices.length);
            }
         }
      }
      
      private function _11367(param1:BoundingBoxNotification) : void
      {
         var _loc2_:int = int(param1.data);
         if(Boolean(this.stagePanel) && Boolean(this.stagePanel._11369))
         {
            this.stagePanel._11369._11374.selected = false;
            this.stagePanel._11369._4197.selected = false;
            this.stagePanel._11369._11377.selected = false;
            this.stagePanel._11369._11374.enabled = true;
            this.stagePanel._11369._4197.enabled = true;
            switch(_loc2_)
            {
               case _11247.BOUNDINGBOX_MODE_CREATE:
                  this.stagePanel._11369._11374.selected = true;
                  break;
               case _11247.BOUNDINGBOX_MODE_DELETE:
                  this.stagePanel._11369._4197.selected = true;
                  break;
               case _11247.BOUNDINGBOX_MODE_NEW:
               case _11247.BOUNDINGBOX_MODE_STOP_NEW:
                  this.stagePanel._11369._11377.selected = true;
                  this.stagePanel._11369._11374.enabled = false;
                  this.stagePanel._11369._4197.enabled = false;
            }
         }
      }
      
      private function _11690(param1:MeshNotification) : void
      {
         if(this._4894 != _716.SELECT)
         {
            _1567(new CommandNotification(CommandNotification.CHANGE_TOOL,_716.SELECT));
         }
      }
      
      private function _11639(param1:MeshNotification) : void
      {
         var _loc2_:int = int(param1.data);
         if(Boolean(this.stagePanel) && Boolean(this.stagePanel._11651))
         {
            this.stagePanel._11651._6412.selected = false;
            this.stagePanel._11651._6419.selected = false;
            this.stagePanel._11651._6417.selected = false;
            this.stagePanel._11651._6416.selected = false;
            switch(_loc2_)
            {
               case _11505.TOOL_ADD_VERTEX:
                  this.stagePanel._11651._6412.selected = true;
                  break;
               case _11505.TOOL_MODIFY_VERTEX:
                  this.stagePanel._11651._6417.selected = true;
                  break;
               case _11505.TOOL_DEL:
                  this.stagePanel._11651._6419.selected = true;
                  break;
               case _11505.TOOL_OUTLINE:
                  this.stagePanel._11651._6416.selected = true;
            }
         }
      }
      
      private function _11638(param1:MeshNotification) : void
      {
         var _loc2_:Boolean = param1.data;
         if(Boolean(this.stagePanel) && Boolean(this.stagePanel._11651))
         {
            this.stagePanel._11651._11649.selected = _loc2_;
         }
      }
      
      private function _11371(param1:BoundingBoxNotification) : void
      {
         this._11366(false);
      }
      
      private function _11370(param1:BoundingBoxNotification) : void
      {
         this._11366(true);
         this._11298();
      }
      
      private function _11648(param1:StageNotification) : void
      {
         this._11647(false);
      }
      
      private function _11645(param1:StageNotification) : void
      {
         this._11647(true);
         this._11643();
      }
      
      private function _11366(param1:Boolean) : void
      {
         if(Boolean(this.stagePanel) && Boolean(this.stagePanel._11369))
         {
            this.stagePanel._11369.visible = param1;
            this.stagePanel._10765.visible = !param1;
            if(param1)
            {
               this._11376.target = this.stagePanel._11369;
               this._11375.target = this.stagePanel._10765;
            }
            else
            {
               this._11376.target = this.stagePanel._10765;
               this._11375.target = this.stagePanel._11369;
            }
            this._11376._5444 = 0;
            this._11376._5452 = 1;
            this._11376.duration = 500;
            this._11376.play();
            this._11375._5444 = 1;
            this._11375._5452 = 0;
            this._11375.duration = 500;
            this._11375.play();
         }
      }
      
      private function _11647(param1:Boolean) : void
      {
         if(Boolean(this.stagePanel) && Boolean(this.stagePanel._11651))
         {
            this.stagePanel._11651.visible = param1;
            this.stagePanel._10765.visible = !param1;
            if(param1)
            {
               this._11376.target = this.stagePanel._11651;
               this._11375.target = this.stagePanel._10765;
               this._12633.target = this.stagePanel._4904;
               this._12634.target = null;
            }
            else
            {
               this._11376.target = this.stagePanel._10765;
               this._12634.target = this.stagePanel._4904;
               this._11375.target = this.stagePanel._11651;
               this._12633.target = null;
            }
            this._11376._5444 = 0;
            this._11376._5452 = 1;
            this._11376.duration = 500;
            this._11376.play();
            this._11375._5444 = 1;
            this._11375._5452 = 0;
            this._11375.duration = 500;
            this._11375.play();
            this._12634._5444 = 0;
            this._12634._5452 = 1;
            this._12634.duration = 500;
            this._12634.play();
            this._12633._5444 = 1;
            this._12633._5452 = 0;
            this._12633.duration = 500;
            this._12633.play();
         }
      }
      
      public function _11643() : void
      {
         var _loc1_:_70 = null;
         if(Boolean(this.stagePanel) && Boolean(this.stagePanel._11651))
         {
            if(_2226._2484 is _79 && (_2226._2484 as _79)._2049 && (_2226._2484 as _79)._2049.type == _74.MESH)
            {
               _loc1_ = (_2226._2484 as _79)._2049;
            }
            else if(_2226._2484 is _70 && (_2226._2484 as _70).type == _74.MESH)
            {
               _loc1_ = _2226._2484 as _70;
            }
            if(Boolean(_loc1_) && Boolean(_loc1_.mesh))
            {
               this.stagePanel._11651._11373.text = tr("Mesh.tool.info",_loc1_.mesh.vertices.length);
            }
         }
      }
      
      private function _10764(param1:StageNotification) : void
      {
         if(param1.data != _599.TRANSFORM_FREE)
         {
            if(this._4894 != _716.SELECT)
            {
               this._3332 = _716.SELECT;
            }
         }
      }
      
      private function _4860(param1:DBPanelEvent) : void
      {
         _1567(new CommandNotification(CommandNotification.IMPORT_COMIC_ASSETS));
      }
      
      private function _4404(param1:StageNotification) : void
      {
         if(this._4894 == _716.WEIGHT && Boolean(this._4896))
         {
            this._4896._4892();
         }
      }
      
      override protected function dispose() : void
      {
         super.dispose();
         this._4896.mouseChildren = true;
         this._4896.mouseEnabled = true;
         this._1564(StageNotification.UPDATE_EDIT_MODE,this._3864);
         this._1564(StageNotification.UPDATE_ANIMATION_MODE,this._4702);
         this._1564(StageNotification.START_FRAMESELECT,this._4874);
         this._1564(StageNotification.STOP_WEIGHT_TOOL,this._4404);
         _1564(BoundingBoxNotification.START_EDIT,this._11370);
         _1564(BoundingBoxNotification.STOP_EDIT,this._11371);
         this._4896.removeEventListener(DBPanelEvent.EDIT_MODE_CHANGED,this._4853);
         this._4896.removeEventListener(DBPanelEvent.TOOL_CHANGED,this._4861);
         this._4896.removeEventListener(UIEvent.CREATION_COMPLETE,this._4851);
      }
      
      public function _3386(param1:Number) : void
      {
         if(Boolean(this._4896) && Boolean(this._4896._4883))
         {
            this._4896._4883._4866(Math.round(param1 * 100));
         }
      }
      
      public function _3345() : void
      {
         this.stageView._3345();
      }
      
      private function _4851(param1:UIEvent) : void
      {
         this._4896.removeEventListener(UIEvent.CREATION_COMPLETE,this._4851);
         if(this._4896.stageView)
         {
            super.start();
            this._4906();
            this._4870();
            return;
         }
         throw new Error("StageView Creation Failed");
      }
      
      private function _4870() : void
      {
         if(this._4896.stage)
         {
            Shortcut._1681(this._4896.stage,_26.DELETE,this._4885);
            Shortcut._1681(this._4896.stage,_26.DRAG_MOVE_STAGE,this._3971);
            Shortcut._1681(this._4896.stage,_26.HIDE_RULERLINE,this._14614);
            Shortcut._1681(this._4896.stage,_26.ENABLE_RULERLINE,this._14613);
         }
         else
         {
            this._4896.addEventListener(Event.ADDED_TO_STAGE,this._4888);
         }
      }
      
      private function _14617() : void
      {
         this.stageView._14626.addEventListener(RulerEvent._14622,this._14619);
         this.stageView._14626.addEventListener(RulerEvent._14615,this._14619);
         this.stageView._14626.addEventListener(RulerEvent._14618,this._14619);
      }
      
      private function _4888(param1:Event) : void
      {
         param1.target.removeEventListener(Event.ADDED_TO_STAGE,this._4888);
         Shortcut._1681(this._4896.stage,_26.DELETE,this._4885);
         Shortcut._1681(this._4896.stage,_26.DRAG_MOVE_STAGE,this._3971);
         Shortcut._1681(this._4896.stage,_26.HIDE_RULERLINE,this._14614);
         Shortcut._1681(this._4896.stage,_26.ENABLE_RULERLINE,this._14613);
      }
      
      private function _14619(param1:RulerEvent) : void
      {
         var _loc2_:Array = _2214._1844._2871._14621;
         var _loc3_:Object = param1.data;
         var _loc4_:int = this._14620(_loc3_);
         switch(param1.type)
         {
            case RulerEvent._14622:
               if(_loc4_ != -1)
               {
                  return;
               }
               _loc2_.push(_loc3_);
               _2214._1844._2871.save();
               break;
            case RulerEvent._14615:
               if(_loc4_ == -1)
               {
                  return;
               }
               _loc2_.splice(_loc4_,1);
               _2214._1844._2871.save();
               break;
            case RulerEvent._14618:
               if(_loc4_ == -1)
               {
                  return;
               }
               _loc2_[_loc4_].value = _loc3_.mValue;
               _2214._1844._2871.save();
               break;
         }
      }
      
      public function clearRulerLines() : void
      {
         var _loc1_:Array = null;
         if(this.stageView)
         {
            this.stageView.clearRulerLines();
            _loc1_ = _2214._1844._2871._14621;
            _loc1_.length = 0;
            _2214._1844._2871.save();
         }
      }
      
      private function _14620(param1:Object) : int
      {
         var _loc5_:Object = null;
         var _loc2_:Array = _2214._1844._2871._14621;
         var _loc3_:int = int(_loc2_.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = _loc2_[_loc4_];
            if(_loc5_.type == param1.type && _loc5_.value == param1.value)
            {
               return _loc4_;
            }
            _loc4_++;
         }
         return -1;
      }
      
      protected function _4906() : void
      {
         if(this.stageView)
         {
            this.stageView.addEventListener(MouseEvent.ROLL_OVER,this._4868);
            this.stageView.addEventListener(MouseEvent.ROLL_OUT,this._4869);
         }
         if(this.stageView is _959)
         {
            this._2212 = _1407.getInstance(_606);
         }
         else if(this.stageView is _962 || this.stageView is _963)
         {
            this._2212 = _1407.getInstance(_604);
         }
         else if(this.stageView is _961)
         {
            this._2212 = _1407.getInstance(_605);
         }
         else if(this.stageView is _13222)
         {
            this._2212 = _1407.getInstance(_13204);
         }
         this._2212.stageView = this.stageView;
         this._3331._4846 = this._4896._4904;
         this._3009.stagePanel = this._4896._10765;
         this._13353.stagePanel = this._4896.sheetPanel;
         this._3332 = _716.SELECT;
      }
      
      private function _3973(param1:StageNotification) : void
      {
         var _loc2_:Object = null;
         var _loc3_:* = undefined;
         var _loc4_:SymbolType = this._4896._2871._2865._1811;
         switch(_loc4_)
         {
            case SymbolType.ARMATURE:
               _loc2_ = _937;
               break;
            case SymbolType.MC:
               _loc2_ = _940;
               break;
            case SymbolType.STAGE:
               _loc2_ = _941;
               break;
            case SymbolType.COMIC:
               _loc2_ = _939;
               break;
            case SymbolType.SHEET:
               _loc2_ = _13219;
               break;
            default:
               _loc2_ = _937;
         }
         if(this._4896.skinName != _loc2_)
         {
            this._2212.stageView = null;
            this._4896.skinName = _loc2_;
            this._4906();
            if(this.stageView)
            {
               this._14624();
               this._14617();
            }
         }
      }
      
      private function _3864(param1:StageNotification = null) : void
      {
         this._4896._2873 = this._2873;
         this._3332 = _716.SELECT;
      }
      
      private function _4702(param1:StageNotification) : void
      {
         if(_2220._4000 == _714.PLAY)
         {
            this._2212._4876 = true;
         }
         else
         {
            this._2212._4876 = false;
         }
      }
      
      private function _4874(param1:StageNotification) : void
      {
         this._4878 = true;
         this._4595();
         _1565(StageNotification.STOP_FRAMESELECT,this._4881);
      }
      
      private function _4881(param1:StageNotification) : void
      {
         this._4878 = false;
         this._4595();
         _1564(StageNotification.STOP_FRAMESELECT,this._4881);
      }
      
      private function _4524(param1:StageNotification) : void
      {
         this._4222();
         _1565(StageNotification.STOP_PICK,this._4439);
      }
      
      private function _4439(param1:StageNotification) : void
      {
         this._4222();
         _1564(StageNotification.STOP_PICK,this._4439);
      }
      
      private function _4900(param1:StageNotification) : void
      {
         if(this._4309 != param1.data)
         {
            this._4890 = this._4309;
            this._4314 = param1.data;
         }
      }
      
      private function _4889(param1:StageNotification) : void
      {
         if(this._4309 == param1.data)
         {
            this._4314 = this._4890;
         }
      }
      
      private function _4885(param1:String) : void
      {
         if(_2220._2873 == _715.ARMATURE)
         {
            if(this._2861._4152(this._4896.stage.focus))
            {
               _1567(new PanelNotification(PanelNotification.DELETE_ARMATURE));
            }
            else
            {
               _1567(new PanelNotification(PanelNotification.SCENE_PANEL_DELETE_ITEM));
            }
         }
         else if(_2220._2873 == _715.GENERAL)
         {
            if(!this._2852._4152(this._4896.stage.focus))
            {
               _1567(new PanelNotification(PanelNotification.SCENE_PANEL_DELETE_ITEM));
            }
         }
         else if(_2220._2873 == _715.COMIC)
         {
            _1567(new PanelNotification(PanelNotification.SCENE_PANEL_DELETE_ITEM));
         }
         else if(_2220._2873 == _715.SHEET)
         {
            if(this._2861._4152(this._4896.stage.focus))
            {
               _1567(new PanelNotification(PanelNotification.DELETE_ARMATURE));
            }
         }
      }
      
      private function _3971(param1:String) : void
      {
      }
      
      public function _3377() : void
      {
         var _loc1_:int = 0;
         var _loc2_:_715 = null;
         var _loc3_:_671 = null;
         if(Boolean(this.stagePanel) && Boolean(this.stagePanel._4895))
         {
            _loc1_ = this.stagePanel._4895.selectedIndex;
            if(_loc1_ >= 0)
            {
               _loc2_ = _loc1_ == 0 ? _715.ANIMATE : _715.ARMATURE;
               if(_2220._2873 == _loc2_)
               {
                  return;
               }
               if(this.stagePanel.data)
               {
                  _loc3_ = this.stagePanel.data as _671;
                  if(!(_loc3_ is _706) && _loc3_._2871._2865._1811 != SymbolType.COMIC)
                  {
                     this._1567(new CommandNotification(CommandNotification.CHANGE_EDITMODE,_469._2860(_loc3_._2871.projectPath,_loc2_)));
                  }
               }
            }
         }
      }
      
      private function _4853(param1:DBPanelEvent) : void
      {
         var _loc2_:* = param1.data.newIndex;
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:_671 = (param1.target as StagePanel).data as _671;
         var _loc4_:_715 = _loc2_ == 0 ? _715.ARMATURE : _715.ANIMATE;
         if(_2220._2873 == _loc4_)
         {
            return;
         }
         _11110.instance._11593(CommandNotification.STAGE_CHANGE,_11108.Stage);
         this._1567(new CommandNotification(CommandNotification.CHANGE_EDITMODE,_469._2860(_loc3_._2871.projectPath,_loc4_)));
      }
      
      private function _4861(param1:DBPanelEvent) : void
      {
         _1567(new CommandNotification(CommandNotification.CHANGE_TOOL,param1.data));
      }
      
      private function _4862(param1:DBPanelEvent) : void
      {
         var _loc2_:Number = param1.data;
         if(_loc2_ <= 0)
         {
            this._2212._4858();
         }
         else
         {
            this._2212._4857(_loc2_);
         }
      }
      
      protected function _4868(param1:MouseEvent) : void
      {
         this._4873();
         if(this._11641 || this._4897)
         {
            _14.setCursor(_12.CURSOR_DRAG_HAND_FORKEY,3);
         }
      }
      
      protected function _4869(param1:MouseEvent) : void
      {
         if(this._11641 || this._4897)
         {
         }
         this._4863();
      }
      
      protected function _4873() : void
      {
         if(this._4309 != _12.AUTO)
         {
            _14.setCursor(this._4309,2);
         }
      }
      
      protected function _4863() : void
      {
         if(this._4309 != _12.AUTO)
         {
            _14._1602(this._4309);
         }
      }
      
      private function _4222() : void
      {
         var _loc1_:String = null;
         if(_530.instance._3832)
         {
            _loc1_ = _12.CURSOR_PICK;
         }
         else if(this._4894 == _716.SELECT || this._4894 == _716.POSE)
         {
            _loc1_ = _12.AUTO;
         }
         else if(this._4894 == _716.CREATE_BONE)
         {
            _loc1_ = _12.CURSOR_CREATE_BONE;
         }
         else if(this._4894 == _716.WEIGHT)
         {
            _loc1_ = _12.CURSOR_MESH_WEIGHT;
         }
         this._4314 = _loc1_;
      }
      
      private function _4875() : void
      {
         this.stageView.addEventListener(MouseEvent.MOUSE_DOWN,this._4848,false,3);
      }
      
      private function _4882() : void
      {
         this.stageView.removeEventListener(MouseEvent.MOUSE_DOWN,this._4848);
      }
      
      private function _4651(param1:KeyboardEvent) : void
      {
         var _loc2_:Array = _25._1691[_26.DRAG_MOVE_STAGE];
         if(_loc2_ && _loc2_.length == 1 && param1.keyCode == _loc2_[0] && !this._12957)
         {
            this._11642 = false;
         }
      }
      
      private function _4848(param1:MouseEvent) : void
      {
         this._4897 = true;
         this._4898 = stage.mouseX;
         this._4899 = stage.mouseY;
         this._4879 = this.stageView._4871;
         this._4880 = this.stageView._4872;
         stage.addEventListener(MouseEvent.MOUSE_MOVE,this._4852);
         stage.addEventListener(MouseEvent.MOUSE_UP,this._4849);
         stage.addEventListener(Event.MOUSE_LEAVE,this._4849);
         stage.addEventListener(MouseEvent.RIGHT_MOUSE_UP,this._4849);
         this._4595();
         _14.lock();
         param1.stopImmediatePropagation();
      }
      
      private function _4852(param1:MouseEvent) : void
      {
         this._4867._4856(new Point(this._4879 + param1.stageX - this._4898,this._4880 + param1.stageY - this._4899));
      }
      
      private function _4864(param1:Event) : void
      {
         this._4903 = false;
         this._12632 = false;
         this._11642 = false;
      }
      
      private function _4854(param1:MouseEvent) : void
      {
         this._4898 = stage.mouseX;
         this._4899 = stage.mouseY;
         if(this.stageView)
         {
            this._4879 = this.stageView._4871;
            this._4880 = this.stageView._4872;
         }
         this._12632 = true;
         if(stage)
         {
            stage.addEventListener(MouseEvent.MOUSE_MOVE,this._4865);
            stage.addEventListener(MouseEvent.RIGHT_MOUSE_UP,this._4859);
         }
      }
      
      private function _4859(param1:MouseEvent) : void
      {
         if(stage)
         {
            stage.removeEventListener(MouseEvent.MOUSE_MOVE,this._4865);
            stage.removeEventListener(MouseEvent.RIGHT_MOUSE_UP,this._4859);
         }
         this._4903 = false;
         this._12632 = false;
         this._11642 = false;
      }
      
      private function _4865(param1:MouseEvent) : void
      {
         if(this._12632 && !this._4903)
         {
            if(Math.abs(stage.mouseX - this._4898) + Math.abs(stage.mouseY - this._4899) >= 5)
            {
               this._4903 = true;
            }
         }
         if(this._4903 && param1.buttonDown && Boolean(param1.target))
         {
            this._11642 = true;
            this._4867._4856(new Point(this._4879 + param1.stageX - this._4898,this._4880 + param1.stageY - this._4899));
         }
      }
      
      private function _4849(param1:Event) : void
      {
         this._4897 = false;
         this._4896._2581();
         stage.removeEventListener(MouseEvent.MOUSE_MOVE,this._4852);
         stage.removeEventListener(MouseEvent.MOUSE_UP,this._4849);
         stage.removeEventListener(Event.MOUSE_LEAVE,this._4849);
         stage.removeEventListener(MouseEvent.RIGHT_MOUSE_UP,this._4849);
         if(!this._11641)
         {
            _14._1602(_12.CURSOR_DRAG_HAND_FORKEY);
         }
         this._4595();
         _14.unlock();
      }
      
      private function _4595() : void
      {
         var _loc1_:Boolean = this._11641 || this._4897;
         this.stageView.mouseChildren = !_loc1_ && !this._4878;
         this._2212._4877 = !_loc1_;
      }
      
      public function get stagePanel() : StagePanel
      {
         return this._4896;
      }
      
      public function set stagePanel(param1:StagePanel) : void
      {
         if(this._4896 == param1)
         {
            return;
         }
         if(this._4896)
         {
            this.dispose();
         }
         this._4896 = param1;
         if(this._4896)
         {
            this.start();
         }
      }
      
      protected function get stageView() : _960
      {
         if(this._4896)
         {
            return this._4896.stageView;
         }
         return null;
      }
      
      protected function get _2873() : _715
      {
         return _2220._2873;
      }
      
      protected function set _11642(param1:Boolean) : void
      {
         if(this._11641 == param1 || !_2214._1844)
         {
            return;
         }
         this._11641 = param1;
         if(this._11641)
         {
            stage.addEventListener(KeyboardEvent.KEY_UP,this._4651);
            if(this.stageView._4901)
            {
               _14.setCursor(_12.CURSOR_DRAG_HAND_FORKEY,3);
            }
            this._4875();
         }
         else
         {
            stage.removeEventListener(KeyboardEvent.KEY_UP,this._4651);
            if(!this._4897)
            {
               _14._1602(_12.CURSOR_DRAG_HAND_FORKEY);
            }
            this._4882();
         }
         this._4595();
      }
      
      public function get _3332() : _716
      {
         return this._4894;
      }
      
      public function set _3332(param1:_716) : void
      {
         var _loc2_:Boolean = false;
         if(this._4894 == param1 || !this._4896 || !this._4896._4905)
         {
            return;
         }
         if(this._4894 == _716.CREATE_BONE)
         {
            this._2212._4887 = false;
            _2226._3851 = true;
         }
         else if(this._4894 == _716.POSE)
         {
            this._4855.enabled = false;
         }
         else if(this._4894 == _716.PIVOT)
         {
            this._4850._4902 = false;
            _2226._3851 = true;
         }
         this._4894 = param1;
         this._4896._4893 = param1;
         this._4850._4891();
         if(this._4894 == _716.CREATE_BONE)
         {
            this._2212._4887 = true;
            _2226._3851 = false;
         }
         else if(this._4894 == _716.POSE)
         {
            this._4855.enabled = true;
         }
         else if(this._4894 == _716.PIVOT)
         {
            this._4850._4902 = true;
            _2226._3850 = false;
         }
         else if(this._4894 == _716.WEIGHT)
         {
            _loc2_ = false;
            if(_2226._2889.length == 1)
            {
               if(_2226._2484 is _79 && _2226._3150._2165 || _2226._2484 is _70 && (_2226._2484 as _70).type == _74.MESH)
               {
                  _loc2_ = true;
               }
            }
            if(!_loc2_)
            {
               _2226._2484 = null;
            }
         }
         _1567(new StageNotification(StageNotification.UPDATE_CURRENT_TOOL,this._4894));
         this._4222();
      }
      
      protected function get _4314() : String
      {
         return this._4309;
      }
      
      protected function set _4314(param1:String) : void
      {
         if(this._4309 == param1)
         {
            return;
         }
         this._4863();
         this._4309 = param1;
         if(this.stageView._4901)
         {
            this._4873();
         }
         this._4595();
      }
      
      public function get _15585() : Rectangle
      {
         return new Rectangle(0,0,this._4896.width,this._4896.height);
      }
      
      public function get _4884() : Rectangle
      {
         var _loc1_:Point = this._4896.localToGlobal(new Point());
         return new Rectangle(_loc1_.x,_loc1_.y,this._4896.width,this._4896.height);
      }
      
      public function get _2212() : _603
      {
         return this._4867;
      }
      
      public function set _2212(param1:_603) : void
      {
         if(this._4867 == param1)
         {
            return;
         }
         if(this._4867)
         {
            this._4867.stageView = null;
         }
         this._4867 = param1;
      }
      
      public function get _3009() : _576
      {
         return _1407.getInstance(_576) as _576;
      }
      
      public function get _4850() : _600
      {
         return _1407.getInstance(_600) as _600;
      }
      
      public function get _4855() : _597
      {
         return _1407.getInstance(_597) as _597;
      }
      
      public function get _2852() : TimelinePanelController
      {
         return _1407.getInstance(TimelinePanelController) as TimelinePanelController;
      }
      
      public function get _2861() : LibraryPanelController
      {
         return _1407.getInstance(LibraryPanelController) as LibraryPanelController;
      }
      
      public function get _11296() : _11247
      {
         return _1407.getInstance(_11247) as _11247;
      }
      
      public function get _13353() : _13202
      {
         return _1407.getInstance(_13202) as _13202;
      }
      
      public function _2581() : void
      {
         if(Boolean(stage) && Boolean(this._4896))
         {
            stage.focus = this._4896;
         }
      }
      
      public function _9587() : Boolean
      {
         if(Boolean(stage) && Boolean(this._4896))
         {
            return stage.focus == this._4896 || this._4896.contains(stage.focus);
         }
         return false;
      }
   }
}

