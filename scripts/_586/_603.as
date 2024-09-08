package _586
{
   import _1177.DragEvent;
   import _13._12;
   import _13._14;
   import _1374.Alert;
   import _1404._1407;
   import _14159._14158;
   import _15.DBDragFormat;
   import _24.Shortcut;
   import _24._26;
   import _470._469;
   import _472._13203;
   import _472._623;
   import _51._50;
   import _51._52;
   import _51._70;
   import _51._79;
   import _521._524;
   import _521._530;
   import _541._540;
   import _555.LibraryPanelController;
   import _573.TimelinePanelController;
   import _579._580;
   import _6._9;
   import _708._715;
   import _708._716;
   import _710._711;
   import _710._712;
   import _724._14084;
   import _724._723;
   import _724._725;
   import _73.SymbolType;
   import _755._760;
   import _783.CommandNotification;
   import _783.PanelNotification;
   import _783.StageNotification;
   import _783.TimelineNotification;
   import _81._82;
   import _81._91;
   import _822._832;
   import _825._827;
   import _859._861;
   import _859._862;
   import _93._94;
   import _953._954;
   import _953._957;
   import _953._958;
   import _953._960;
   import _97._103;
   import egret.core._1111;
   import egret.managers.DragManager;
   import egret.utils.tr;
   import flash.display.DisplayObjectContainer;
   import flash.display.InteractiveObject;
   import flash.events.IEventDispatcher;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class _603 extends _94
   {
      protected var _5335:_600;
      
      protected var _5333:_601;
      
      protected var _4941:StageDragController;
      
      protected var _3443:_596;
      
      protected var _4291:_594;
      
      protected var _11434:_11247;
      
      protected var _3058:_589;
      
      protected var _5334:_587;
      
      protected var _11553:_11505;
      
      public var _3334:_623;
      
      public var _3317:_585;
      
      public var _13355:_13203;
      
      protected var _5141:_960;
      
      protected var _5356:_832;
      
      protected var _4309:String = "auto";
      
      protected var _5352:Boolean;
      
      protected var _13899:Point;
      
      protected var _13900:Number;
      
      private var _1989:Array;
      
      private var _5355:Boolean = false;
      
      private var _5348:Array;
      
      private var _5353:Array;
      
      private var _14648:int = 0;
      
      private var _5272:Point;
      
      private var _5362:Point;
      
      protected var _5351:Boolean = true;
      
      public function _603()
      {
         this._5335 = _1407.getInstance(_600) as _600;
         this._5333 = _1407.getInstance(_601) as _601;
         this._4941 = _1407.getInstance(StageDragController) as StageDragController;
         this._3443 = _1407.getInstance(_596) as _596;
         this._4291 = _1407.getInstance(_594) as _594;
         this._11434 = _1407.getInstance(_11247) as _11247;
         this._3058 = _1407.getInstance(_589) as _589;
         this._5334 = _1407.getInstance(_587) as _587;
         this._11553 = _1407.getInstance(_11505) as _11505;
         this._3334 = _1407.getInstance(_623) as _623;
         this._3317 = _1407.getInstance(_585) as _585;
         this._13355 = _1407.getInstance(_13203) as _13203;
         this._5356 = new _832();
         this._1989 = [];
         this._5362 = new Point();
         super();
      }
      
      override public function start() : void
      {
         super.start();
         this._5141.active();
         this._4941.stageView = this._5141;
         _2226._2484 = null;
         this._3443._5233(this._5141._5357,this._5141._5361);
         this._3443._1886 = this._5141._2762;
         this._3443.start();
         this._4291.start();
         this._11434.start();
         this._11553.start();
         this._13355.start();
      }
      
      override protected function init() : void
      {
         this._5335._4313 = _960._4313;
         this._5333._4906(this._3198,this._5273,this._5141._5098);
         this._4291._4906(this._5141._4269,this._5141._5098,_960._5347);
         this._11434._4906(this._5141._11395,this._5141._5098,_960._5347);
         this._11553._4906(this._5141._4269,this._5141._5098,_960._5347);
         this._3058._4906(this._5141._5086,this._5141._5098);
         this._5334._3198 = this._3198;
      }
      
      override protected function _1576() : void
      {
         _1565(StageNotification.UPDATE_SELECTED_ITEMS,this._4023);
         _1565(StageNotification.UPDATE_EDIT_MODE,this._3864);
         _1565(StageNotification.UPDATE_FILTER_STATUS,this._3856);
         _1565(StageNotification.UPDATE_CURRENT_ARMATURE,this._3973);
         _1565(TimelineNotification.UPDATE_STAGE_VIEW,this._5367);
         _1565(StageNotification.UPDATE_MESH,this._5270);
         _1565(StageNotification.GPU_READY,this._5367);
         _1565(StageNotification.CANCEL_SELECTION,this._4974);
         _1565(StageNotification.ROLLOVER_SLOT,this._5331);
         _1565(StageNotification.ROLLOUT_SLOT,this._5332);
         _1565(StageNotification.START_EDIT_BOUNDINGBOX,this._11329);
         _1565(StageNotification.STOP_EDIT_BOUNDINGBOX,this._11329);
         _1565(StageNotification.START_EDIT_MESH_UV,this._11624);
         _1565(StageNotification.STOP_EDIT_MESH_UV,this._11624);
         _1565(StageNotification.START_TRANSFORM,this._5329);
         _1565(StageNotification.STOP_TRANSFORM,this._5330);
         _1565(StageNotification.ADD_ASSETS_TO_STAGE,this._11154);
         _1565(StageNotification.UPDATE_SLOT_DOWN_LAYER,this._13897);
         _1565(PanelNotification.SCENETREE_START_DRAG,this._5327);
         _1565(PanelNotification.SCENETREE_STOP_DRAG,this._5328);
         _1565(PanelNotification.LIBRARYTREE_START_DRAG,this._5325);
         _1565(PanelNotification.LIBRARYTREE_STOP_DRAG,this._5326);
         _1565(PanelNotification.ADD_CANVAS,this._13359);
         this._5141.addEventListener(MouseEvent.MOUSE_DOWN,this._5129,false,-1);
         this._5141.addEventListener(MouseEvent.ROLL_OVER,this._4868);
         this._5141.addEventListener(MouseEvent.ROLL_OUT,this._4869);
         this._5141.addEventListener(MouseEvent.MOUSE_MOVE,this._5341);
         this._5141.addEventListener(MouseEvent.RIGHT_CLICK,this._5338);
         this._5141.addEventListener(MouseEvent.MOUSE_WHEEL,this._5339);
         this._5141.addEventListener(MouseEvent.DOUBLE_CLICK,this._5336);
         this._5141.addEventListener(DragEvent.DRAG_ENTER,this._5343);
         this._5141.addEventListener(MouseEvent.MIDDLE_MOUSE_DOWN,this._13901);
         this._5141.addEventListener(MouseEvent.MIDDLE_MOUSE_UP,this._13902);
         Shortcut._1681(this._5141.stage,_26.SCALE_BIG_STAGE,this._15587);
         Shortcut._1681(this._5141.stage,_26.SCALE_SMALL_STAGE,this._15586);
         if(_2220._2873 == _715.GENERAL)
         {
            this._2939();
         }
      }
      
      private function _15587() : void
      {
         var _loc3_:Number = NaN;
         var _loc1_:Number = this._5141.mouseX;
         var _loc2_:Number = this._5141.mouseY;
         if(this._3176._15585.containsPoint(new Point(_loc1_,_loc2_)))
         {
            _loc3_ = 3 / 15;
            this._13903(_loc3_,_loc1_,_loc2_);
         }
      }
      
      private function _15586() : void
      {
         var _loc3_:Number = NaN;
         var _loc1_:Number = this._5141.mouseX;
         var _loc2_:Number = this._5141.mouseY;
         if(this._3176._15585.containsPoint(new Point(_loc1_,_loc2_)))
         {
            _loc3_ = -3 / 15;
            this._13903(_loc3_,_loc1_,_loc2_);
         }
      }
      
      private function _13897(param1:StageNotification) : void
      {
         if(this._5350)
         {
            this._5350._2939();
         }
      }
      
      private function _13902(param1:MouseEvent) : void
      {
         this._13899 = null;
      }
      
      private function _13901(param1:MouseEvent) : void
      {
         this._13899 = new Point(param1.stageX,param1.stageY);
         this._13900 = this._13899.y;
         if(this._5141.stage)
         {
            this._5141.stage.addEventListener(MouseEvent.MOUSE_MOVE,this._13898);
         }
      }
      
      private function _13898(param1:MouseEvent) : void
      {
         if(this._13899 == null)
         {
            return;
         }
         var _loc2_:Number = param1.stageY;
         var _loc3_:Number = (_loc2_ - this._13900) / 30;
         this._13900 = _loc2_;
         this._13903(_loc3_,this._13899.x,this._13899.y);
      }
      
      private function _13359(param1:PanelNotification) : void
      {
         if(this._5141)
         {
            this._5141._5340();
         }
      }
      
      private function _11624(param1:StageNotification) : void
      {
         this._5350.visible = !this._11553.editing;
      }
      
      private function _11329(param1:StageNotification) : void
      {
         this._5350.visible = !this._11434.editing;
      }
      
      override protected function dispose() : void
      {
         super.dispose();
         _1564(StageNotification.UPDATE_SELECTED_ITEMS,this._4023);
         _1564(StageNotification.UPDATE_EDIT_MODE,this._3864);
         _1564(StageNotification.UPDATE_FILTER_STATUS,this._3856);
         _1564(StageNotification.UPDATE_CURRENT_ARMATURE,this._3973);
         _1564(TimelineNotification.UPDATE_STAGE_VIEW,this._5367);
         _1564(StageNotification.CANCEL_SELECTION,this._4974);
         _1564(StageNotification.ROLLOVER_SLOT,this._5331);
         _1564(StageNotification.ROLLOUT_SLOT,this._5332);
         _1564(StageNotification.START_TRANSFORM,this._5329);
         _1564(StageNotification.STOP_TRANSFORM,this._5330);
         _1564(StageNotification.ADD_ASSETS_TO_STAGE,this._11154);
         _1564(PanelNotification.SCENETREE_START_DRAG,this._5327);
         _1564(PanelNotification.SCENETREE_STOP_DRAG,this._5328);
         _1564(PanelNotification.LIBRARYTREE_START_DRAG,this._5325);
         _1564(PanelNotification.LIBRARYTREE_STOP_DRAG,this._5326);
         _1564(PanelNotification.ADD_CANVAS,this._13359);
         this._5141.removeEventListener(MouseEvent.MOUSE_DOWN,this._5129);
         this._5141.removeEventListener(MouseEvent.ROLL_OVER,this._4868);
         this._5141.removeEventListener(MouseEvent.ROLL_OUT,this._4869);
         this._5141.removeEventListener(MouseEvent.MOUSE_MOVE,this._5341);
         this._5141.removeEventListener(MouseEvent.RIGHT_CLICK,this._5338);
         this._5141.removeEventListener(MouseEvent.MOUSE_WHEEL,this._5339);
         this._5141.removeEventListener(MouseEvent.DOUBLE_CLICK,this._5336);
         this._5141.removeEventListener(DragEvent.DRAG_ENTER,this._5343);
         this._5141.removeEventListener(MouseEvent.MIDDLE_MOUSE_DOWN,this._13901);
         this._5141.removeEventListener(MouseEvent.MIDDLE_MOUSE_UP,this._13902);
         if(this._5141.stage)
         {
            this._5141.stage.removeEventListener(MouseEvent.MOUSE_MOVE,this._13898);
            Shortcut._1673(this._5141.stage,_26.SCALE_BIG_STAGE,this._15587);
            Shortcut._1673(this._5141.stage,_26.SCALE_SMALL_STAGE,this._15586);
         }
         this._13899 = null;
         this._5141.dispose();
      }
      
      protected function _4023(param1:StageNotification) : void
      {
      }
      
      private function _3864(param1:StageNotification) : void
      {
         this._2939();
      }
      
      protected function _3856(param1:StageNotification) : void
      {
         this._5333._5320();
      }
      
      protected function _3973(param1:StageNotification) : void
      {
         if(this._5141)
         {
            _2226._2484 = null;
            this._5141._5340();
            this._3443._1886 = this._5141._2762;
            this._2852._4690();
            this._5141._6788();
         }
      }
      
      private function _5367(param1:_9) : void
      {
         this._2939(this._1989);
         if(this._1989.length > 0)
         {
            _1567(new StageNotification(StageNotification.UPDATE_DISPLAY_LIST,this._1989));
         }
      }
      
      private function _5270(param1:_9) : void
      {
         this._5333._5319();
      }
      
      private function _5331(param1:StageNotification) : void
      {
         this._5141._5268 = param1.data as _79;
         this._4222();
      }
      
      private function _5332(param1:StageNotification) : void
      {
         this._5141._5268 = null;
      }
      
      protected function _5329(param1:StageNotification) : void
      {
         this._5366.alpha = 0;
         this._5350.alpha = 0.5;
         _14.lock();
      }
      
      protected function _5330(param1:StageNotification) : void
      {
         this._5366.alpha = 1;
         this._5350.alpha = 1;
         _14.unlock();
         _2217._1651();
      }
      
      private function _5327(param1:PanelNotification) : void
      {
         this._5366.alpha = 0;
      }
      
      private function _5328(param1:PanelNotification) : void
      {
         this._5366.alpha = 1;
      }
      
      private function _5325(param1:PanelNotification) : void
      {
         this._5366.alpha = 0;
      }
      
      private function _5326(param1:PanelNotification) : void
      {
         this._5366.alpha = 1;
      }
      
      protected function _5129(param1:MouseEvent) : void
      {
         var _loc3_:Object = null;
         if(this._5352 || _530.instance._3832 || this._3176._3332 == _716.WEIGHT)
         {
            return;
         }
         if(_524._3784())
         {
            return;
         }
         if(Shortcut._1677())
         {
            if(_2226._2889.length == 1 && _2226._3150 != null && (_2226._3150._11287 || _2226._3150._2165))
            {
               return;
            }
         }
         this._5141._4428.addElement(this._5356);
         this._5356.frameX = this._5141._4428.mouseX / this._2580;
         this._5356.frameY = this._5141._4428.mouseY / this._2580;
         this._5356.frameWidth = 0;
         this._5356.frameHeight = 0;
         this._5356.zoom = this._2580;
         this._5356._5371();
         _82.clearCache();
         stage.addEventListener(MouseEvent.MOUSE_MOVE,this._4157);
         stage.addEventListener(MouseEvent.MOUSE_UP,this._4126);
         var _loc2_:Boolean = _2226._3316 && (Boolean(_715.ARMATURE) || Boolean(_715.ANIMATE));
         if(_loc2_ && this._2873 && _2226._3315)
         {
            this._5348 = this._2762._1780.concat();
            for each(_loc3_ in this._2762._1779)
            {
               this._5348.unshift(_loc3_);
            }
         }
         else if(_loc2_)
         {
            this._5348 = this._2762._1779;
         }
         else if(_2226._3315)
         {
            this._5348 = this._2762._1780;
         }
         else
         {
            this._5348 = [];
         }
         this._5353 = _2226._2889.concat();
      }
      
      private function _4157(param1:MouseEvent) : void
      {
         var _loc5_:Array = null;
         var _loc6_:Array = null;
         var _loc7_:Boolean = false;
         var _loc8_:Boolean = false;
         var _loc9_:int = 0;
         var _loc10_:Object = null;
         if(!this._5355)
         {
            this._5355 = true;
            this._1567(new StageNotification(StageNotification.START_FRAMESELECT));
         }
         var _loc2_:Number = this._5141._4428.mouseX / this._2580;
         var _loc3_:Number = this._5141._4428.mouseY / this._2580;
         this._5356.frameWidth = Math.abs(_loc2_ - this._5356.frameX);
         this._5356.frameHeight = Math.abs(_loc3_ - this._5356.frameY);
         this._5356._5368 = _loc2_ < this._5356.frameX;
         this._5356._5369 = _loc3_ < this._5356.frameY;
         var _loc4_:Array = this._2174(this._5356.rect,this._5348);
         if(Shortcut._1677())
         {
            _loc5_ = [];
            _loc6_ = [];
            _loc7_ = false;
            _loc8_ = false;
            for each(_loc10_ in _loc4_)
            {
               _loc9_ = int(this._5353.indexOf(_loc10_));
               if(_loc9_ == -1)
               {
                  _loc6_.push(_loc10_);
               }
               else
               {
                  _loc5_.push(_loc9_);
               }
            }
            _loc4_ = this._5353.concat();
            if(_loc5_.length != 0 && _loc6_.length == 0)
            {
               _loc5_.sort(Array.NUMERIC | Array.DESCENDING);
               for each(_loc9_ in _loc5_)
               {
                  _loc4_.splice(_loc9_,1);
               }
            }
            else
            {
               for each(_loc10_ in _loc6_)
               {
                  _loc4_.push(_loc10_);
               }
            }
         }
         if(this._14648 == _loc4_.length)
         {
            return;
         }
         if(_loc4_.length > 0)
         {
            this._1567(new CommandNotification(CommandNotification.SELECT_DRAG_ITEMS,_loc4_));
         }
         this._14648 = _loc4_.length;
      }
      
      protected function _2174(param1:Rectangle, param2:Array) : Array
      {
         return _82._2174(param1,param2);
      }
      
      private function _4126(param1:MouseEvent) : void
      {
         param1.stopImmediatePropagation();
         param1.stopPropagation();
         this._5141._4428.removeElement(this._5356);
         stage.removeEventListener(MouseEvent.MOUSE_MOVE,this._4157);
         stage.removeEventListener(MouseEvent.MOUSE_UP,this._4126);
         this._1567(new StageNotification(StageNotification.STOP_FRAMESELECT));
         this._1567(new StageNotification(StageNotification.UPDATE_TIMELINE_SELECTED_ITEMS));
         this._5355 = false;
      }
      
      private function _4868(param1:MouseEvent) : void
      {
         this._5141._4901 = true;
         _14.setCursor(this._4309);
      }
      
      private function _4869(param1:MouseEvent) : void
      {
         this._5141._4901 = false;
         _14.setCursor(_12.AUTO);
      }
      
      private function _5341(param1:MouseEvent) : void
      {
         this._4222();
      }
      
      private function _5338(param1:MouseEvent) : void
      {
         this._5363(true);
      }
      
      public function _5363(param1:Boolean = false) : void
      {
         if(_530.instance._3832)
         {
            _530.instance._3834();
            return;
         }
         if(_2226._2889.length > 0)
         {
            _1567(new CommandNotification(CommandNotification.SELECT_ITEMS,[]));
         }
         else if(param1)
         {
            this._3975._3934(_711.STAGE,_712.BLANK,[this._2762]);
         }
      }
      
      protected function _4974(param1:_9) : void
      {
         this._5363();
      }
      
      private function _5339(param1:MouseEvent) : void
      {
         var _loc2_:Number = param1.delta / 15;
         this._13903(_loc2_,param1.stageX,param1.stageY);
      }
      
      private function _13903(param1:Number, param2:Number, param3:Number) : void
      {
         var _loc5_:Object = null;
         var _loc4_:Number = this._2580 * (1 + param1);
         _loc4_ = (_loc4_ = _loc4_ < 20 ? _loc4_ : 20) > 0.2 ? _loc4_ : 0.2;
         if(this._2580 != _loc4_)
         {
            this._5362.x = param2;
            this._5362.y = param3;
            this._5272 = this._5141._4428.globalToLocal(new Point(param2,param3));
            _loc5_ = _469._3497(_loc4_,this._5272);
            _1567(new CommandNotification(CommandNotification.ZOOM_STAGE,_loc5_));
         }
      }
      
      public function _5359() : Point
      {
         return this._5141._4428.globalToLocal(new Point(this._5362.x,this._5362.y));
      }
      
      public function _3378() : Point
      {
         return new Point(this._5141._4871,this._5141._4872);
      }
      
      public function _3379(param1:Number, param2:Point) : Point
      {
         var _loc3_:Number = (this._3286.zoom - param1) / this._3286.zoom;
         var _loc4_:Number = this._5141._4871 + param2.x * _loc3_;
         var _loc5_:Number = this._5141._4872 + param2.y * _loc3_;
         return new Point(_loc4_,_loc5_);
      }
      
      public function _3384(param1:Number) : void
      {
         this._5141._4871 = param1;
      }
      
      public function _3383(param1:Number) : void
      {
         this._5141._4872 = param1;
      }
      
      public function _10459(param1:Number) : void
      {
         if(this._2580 == param1)
         {
            return;
         }
         this._5141.zoom = param1;
         this._5366._1988();
         this._5350._2939();
         this._5335._1751();
         this._5356.zoom = param1;
         this._4291._5170(param1);
         this._11553._5170(param1);
         this._11434._5170(param1);
         this._4855.update();
      }
      
      private function _5336(param1:MouseEvent) : void
      {
         if(this._5333._2909._5266)
         {
            return;
         }
         if(Math.round(this._2580 * 100) != 100)
         {
            this._4857(1);
         }
         else
         {
            this._4858();
         }
      }
      
      private function _5343(param1:DragEvent) : void
      {
         var _loc3_:DisplayObjectContainer = null;
         var _loc4_:Vector.<_862> = null;
         var _loc5_:Vector.<_861> = null;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         if(this._5352)
         {
            return;
         }
         var _loc2_:_1111 = param1._1611 as _1111;
         if(this._4525(_loc2_))
         {
            this._5360(this._5141);
            if(_loc2_.hasFormat(DBDragFormat.IMAGE))
            {
               _loc4_ = _loc2_._4508(DBDragFormat.IMAGE) as Vector.<_862>;
               if((Boolean(_loc4_)) && Boolean(_loc4_.length))
               {
                  _loc3_ = _loc4_[0].parent;
               }
            }
            else
            {
               _loc5_ = _loc2_._4508(DBDragFormat.ARMATURE) as Vector.<_861>;
               if((Boolean(_loc5_)) && Boolean(_loc5_.length))
               {
                  _loc3_ = _loc5_[0].parent;
               }
            }
            if(_loc3_)
            {
               _loc6_ = this._5141._3286.zoom;
               _loc7_ = _loc3_.width * _loc6_ * 0.5;
               _loc8_ = _loc3_.height * _loc6_ * 0.5;
               _loc3_.scaleX = _loc3_.scaleY = _loc6_;
            }
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
               if(Boolean(_3028) && _3028._1811 == SymbolType.SHEET)
               {
                  return false;
               }
               _loc3_ = param1._4508(DBDragFormat.ARMATURE) as Vector.<_861>;
               _loc4_ = (_loc3_[0]._2104 as _723)._1886;
               _loc5_ = _2214._1844._2871._2865.name;
               _loc2_ = !_2214._1844._2871.dragonBonesVO._2127(_loc4_,_loc5_);
            }
         }
         return _loc2_;
      }
      
      private function _5360(param1:IEventDispatcher) : void
      {
         DragManager.acceptDragDrop(param1 as InteractiveObject);
         param1.addEventListener(DragEvent.DRAG_DROP,this._5346);
         param1.addEventListener(DragEvent.DRAG_EXIT,this._5345);
      }
      
      private function _5365(param1:IEventDispatcher) : void
      {
         param1.removeEventListener(DragEvent.DRAG_DROP,this._5346);
         param1.removeEventListener(DragEvent.DRAG_EXIT,this._5345);
      }
      
      private function _5346(param1:DragEvent) : void
      {
         this._5365(this._5141);
         this._4541(param1._1611);
      }
      
      private function _5345(param1:DragEvent) : void
      {
         var _loc3_:DisplayObjectContainer = null;
         var _loc4_:Vector.<_862> = null;
         var _loc5_:Vector.<_861> = null;
         this._5365(this._5141);
         var _loc2_:_1111 = param1._1611 as _1111;
         if(_loc2_.hasFormat(DBDragFormat.IMAGE))
         {
            _loc4_ = _loc2_._4508(DBDragFormat.IMAGE) as Vector.<_862>;
            if((Boolean(_loc4_)) && Boolean(_loc4_.length))
            {
               _loc3_ = _loc4_[0].parent;
            }
         }
         else
         {
            _loc5_ = _loc2_._4508(DBDragFormat.ARMATURE) as Vector.<_861>;
            if((Boolean(_loc5_)) && Boolean(_loc5_.length))
            {
               _loc3_ = _loc5_[0].parent;
            }
         }
         if(_loc3_)
         {
            _loc3_.scaleX = _loc3_.scaleY = 1;
         }
      }
      
      private function _4541(param1:_1111) : void
      {
         var _loc2_:Vector.<_862> = null;
         var _loc3_:Array = null;
         var _loc4_:Array = null;
         var _loc5_:Point = null;
         var _loc6_:Number = NaN;
         var _loc7_:_862 = null;
         var _loc8_:Point = null;
         var _loc9_:Vector.<_861> = null;
         var _loc10_:_861 = null;
         if(param1.hasFormat(DBDragFormat.IMAGE))
         {
            _loc2_ = param1._4508(DBDragFormat.IMAGE) as Vector.<_862>;
            if(Boolean(_loc2_) && Boolean(_loc2_.length))
            {
               _loc3_ = [];
               _loc4_ = [];
               _loc5_ = new Point();
               _loc6_ = _loc2_[0].parent.scaleX;
               for each(_loc7_ in _loc2_)
               {
                  if(this._2762._1811 == SymbolType.MC || this._2762._1811 == SymbolType.STAGE)
                  {
                     _loc3_.push(_loc7_._2104);
                  }
                  else
                  {
                     _loc3_.push(_70._2090(_loc7_._2104));
                  }
                  _loc8_ = _loc7_.localToGlobal(_loc5_);
                  _loc8_.x += _loc7_.width / 2 * _loc6_;
                  _loc8_.y += _loc7_.height / 2 * _loc6_;
                  _loc4_.push(_loc8_);
               }
               this._5342(_loc3_,_loc4_);
            }
         }
         else if(param1.hasFormat(DBDragFormat.ARMATURE))
         {
            _loc9_ = param1._4508(DBDragFormat.ARMATURE) as Vector.<_861>;
            if((Boolean(_loc9_)) && Boolean(_loc9_.length))
            {
               _loc3_ = [];
               _loc4_ = [];
               _loc5_ = new Point();
               _loc6_ = _loc9_[0].parent.scaleX;
               for each(_loc10_ in _loc9_)
               {
                  if(this._2762._1811 == SymbolType.MC || this._2762._1811 == SymbolType.STAGE)
                  {
                     _loc3_.push(_loc10_._2104);
                  }
                  else
                  {
                     if(this._2762._1811 == SymbolType.SHEET)
                     {
                        continue;
                     }
                     _loc3_.push(_70._2090(_loc10_._2104));
                  }
                  _loc8_ = _loc10_.localToGlobal(_loc5_);
                  _loc4_.push(_loc8_);
               }
               this._5342(_loc3_,_loc4_);
            }
         }
      }
      
      private function _11154(param1:StageNotification) : void
      {
         var _loc2_:Array = param1.data._13225;
         var _loc3_:Array = param1.data.positionList;
         this._5342(_loc2_,_loc3_,true);
      }
      
      public function _14541(param1:Array) : void
      {
         var i:int = 0;
         var display:Object = null;
         var _4204:_725 = null;
         var _13229:Array = param1;
         var _13225:Array = [];
         var positionList:Array = [];
         var len:int = int(_13229.length);
         try
         {
            i = len;
            while(i > 0)
            {
               display = _13229[i - 1];
               _4204 = this._2861._2106._3806(display["path"]);
               _13225.push(_70._2090(_4204));
               positionList.push(new Point(display["x"],display["y"]));
               i--;
            }
            this._5342(_13225,positionList,true);
         }
         catch(e:Error)
         {
            Alert.show(tr("Import.psdexport.errorTip"));
         }
      }
      
      public function _14636(param1:String, param2:Point) : void
      {
         var _4204:_725 = null;
         var svg:_14084 = null;
         var addSVGSuccess:Function = null;
         var path:String = param1;
         var point:Point = param2;
         try
         {
            _4204 = this._2861._2106._3806(path);
            if(Boolean(_4204) && _4204 is _14084)
            {
               svg = _4204 as _14084;
               if(svg._5879 == _14084.IMAGE_STATUS_NORMAL)
               {
                  this._5342([_70._2090(_4204)],[point],true);
               }
               else
               {
                  addSVGSuccess = function():void
                  {
                     _5342([_70._2090(_4204)],[point],true);
                     _14158._14642(addSVGSuccess);
                  };
                  _14158._14646(this._14647);
                  _14158._14644(addSVGSuccess);
                  svg.loadImage();
               }
            }
         }
         catch(e:Error)
         {
            Alert.show(tr("Import.svgexport.errorTip"));
         }
      }
      
      private function _14647(param1:*) : void
      {
         if(param1 is String && param1 == _14158.PARSER_ERROR)
         {
            Alert.show(tr("Import.svgexport.errorTip"));
         }
         _14158._14643(this._14647);
      }
      
      protected function _5342(param1:Array, param2:Array, param3:Boolean = false) : void
      {
      }
      
      private function _5364(param1:_50, param2:_52) : _79
      {
         var _loc3_:_79 = null;
         var _loc4_:int = 0;
         var _loc5_:int = int(param1._1780.length);
         while(_loc4_ < _loc5_)
         {
            _loc3_ = param1._1780[_loc4_];
            if(_loc3_.parentBoneData == param2)
            {
               return _loc3_;
            }
            _loc4_++;
         }
         return null;
      }
      
      protected function _4222() : void
      {
         this._5344();
      }
      
      private function _5344(param1:TimerEvent = null) : void
      {
         if(this._5141._4901 && _2226._3855 && this._3176._3332 != _716.POSE && !this._5352)
         {
            switch(this._5335._10761)
            {
               case _599.TRANSFORM_FREE:
                  if(this._5335._4368 || this._5335._4369)
                  {
                     this._4314 = _12.CURSOR_MOVE;
                  }
                  else if(this._5335._5119 || this._5335._5118)
                  {
                     this._4314 = _12.CURSOR_SCALE;
                  }
                  else if(this._5335._5295)
                  {
                     this._4314 = _12.CURSOR_ROTATE;
                  }
                  else if(!this._5333._5012 && (this._2873 != _715.ANIMATE || _2226._3872))
                  {
                     this._4314 = _12.CURSOR_ROTATE;
                  }
                  else if(_2226._2889.indexOf(this._5333._5012) != -1 && (this._2873 != _715.ANIMATE || this._5333._5012 is _52))
                  {
                     this._4314 = _12.CURSOR_MOVE;
                  }
                  else
                  {
                     this._4314 = _12.AUTO;
                  }
                  break;
               case _599.TRANSFORM_TRANSLATE:
                  this._4314 = _12.CURSOR_MOVE;
                  break;
               case _599.TRANSFORM_ROTATE:
                  this._4314 = _12.CURSOR_ROTATE;
                  break;
               case _599.TRANSFORM_SCALE:
                  this._4314 = _12.CURSOR_SCALE;
            }
         }
         else
         {
            this._4314 = _12.AUTO;
         }
      }
      
      public function _14422() : void
      {
      }
      
      public function _2939(param1:Array = null) : void
      {
         if(this._5141 == null)
         {
            return;
         }
         this._2762._1988(param1);
         this._2762._1751();
         this._5333._5320();
         var _loc2_:_91 = this._5335._1897;
         if(_loc2_)
         {
            this._5335._1988();
         }
         if(this._5366._1837)
         {
            this._5366._1988();
         }
         this._5350._2939();
         this._3443.draw();
         this._5141.invalidateDisplayList();
         this._4291._3173();
         this._11553._3173();
         this._11434._3173();
      }
      
      public function _14645(param1:Array = null) : void
      {
         if(this._5141 == null)
         {
            return;
         }
         this._2762._1988(param1);
         this._2762._1751();
         this._5333._5320();
         var _loc2_:_91 = this._5335._1897;
         if(_loc2_)
         {
            this._5335._1988();
         }
      }
      
      public function _2881(param1:_52, param2:Boolean = true) : void
      {
         var _loc5_:Array = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:_52 = null;
         var _loc11_:_79 = null;
         this._2762._1751();
         this._5349(param1);
         var _loc3_:Array = [param1];
         if(param2)
         {
            _loc5_ = this._2762._1779;
            _loc7_ = _loc6_ = _loc5_.indexOf(param1) + 1;
            _loc8_ = int(_loc5_.length);
            while(_loc7_ < _loc8_)
            {
               _loc10_ = _loc5_[_loc7_] as _52;
               if(_loc3_.indexOf(_loc10_.parentBoneData) != -1)
               {
                  _loc3_.push(_loc10_);
                  this._5349(_loc10_);
               }
               _loc7_++;
            }
            _loc9_ = 0;
            while(_loc9_ < this._5273.dataProvider.length)
            {
               _loc11_ = this._5273.dataProvider.getItemAt(_loc9_) as _79;
               if(_loc3_.indexOf(_loc11_.parentBoneData) != -1)
               {
                  _103.addItem(_loc11_);
                  this._5273.dataProvider._4016(_loc11_);
               }
               _loc9_++;
            }
            if(Boolean(this._5366._1837) && _loc3_.indexOf(this._5366._1837.parentBoneData) != -1)
            {
               this._5366._1988();
            }
            this._5350._5337(_loc3_);
         }
         var _loc4_:_91 = this._5335._1897;
         if(_loc4_)
         {
            if(_loc4_ is _52 && _loc3_.indexOf(_loc4_) != -1 || _loc4_ is _79 && _loc3_.indexOf((_loc4_ as _79).parentBoneData) != -1)
            {
               this._5335._1988();
            }
            this._4291._3173();
            this._11553._3173();
            this._11434._3173();
         }
      }
      
      public function _2954(param1:_52) : void
      {
         this._5349(param1);
      }
      
      protected function _5349(param1:_52) : void
      {
         if(this._3198)
         {
            this._3198._5370(param1);
         }
      }
      
      public function _2907(param1:_79) : void
      {
         param1._1751();
         param1._1988();
         this._5273._2907(param1);
         if(this._5366._1837 == param1)
         {
            this._5366._1988();
         }
         this._5350._5354(param1);
         if(this._5335._1897 == param1)
         {
            this._5335._1988();
         }
         this._4291._3173();
         this._11553._3173();
         this._11434._3173();
      }
      
      public function _3006(param1:_79) : void
      {
         param1._2153();
         this._5273._2907(param1);
      }
      
      public function _4858() : void
      {
         _82.clearCache();
         var _loc1_:_50 = this._5141._2762;
         var _loc2_:Rectangle = _82._2182(_loc1_._1779,_loc1_._1780,[this._5141.canvas]);
         var _loc3_:Number = (this._5141.width - 10) / _loc2_.width;
         var _loc4_:Number = (this._5141.height - 10) / _loc2_.height;
         var _loc5_:Number = _loc3_ < _loc4_ ? _loc3_ : _loc4_;
         this._4856(new Point(-_loc5_ * ((_loc2_.width - this._5141._3233) / 2 + _loc2_.x),-_loc5_ * ((_loc2_.height - this._5141._3231) / 2 + _loc2_.y)));
         this._4857(_loc5_);
      }
      
      public function _4856(param1:Point) : void
      {
         _1567(new CommandNotification(CommandNotification.MOVE_STAGE,param1));
      }
      
      public function _4857(param1:Number) : void
      {
         _1567(new CommandNotification(CommandNotification.ZOOM_STAGE,_469._3497(param1,new Point(0,0))));
      }
      
      public function _3348(param1:Point) : void
      {
         this._5141._3348(param1);
      }
      
      public function _3387(param1:Number, param2:Point) : void
      {
         if(this._2580 == param1)
         {
            return;
         }
         this._5141._3387(param1,param2);
         this._5366._1988();
         this._5350._2939();
         this._5335._1751();
         this._5356.zoom = param1;
         this._4291._5170(param1);
         this._11553._5170(param1);
         this._11434._5170(param1);
         this._4855.update();
      }
      
      public function get _2580() : Number
      {
         return this._5141._3286.zoom;
      }
      
      public function get stageView() : _960
      {
         return this._5141;
      }
      
      public function set stageView(param1:_960) : void
      {
         if(this._5141 == param1)
         {
            return;
         }
         if(this._5141)
         {
            this.dispose();
         }
         this._5141 = param1;
         if(this._5141)
         {
            this.start();
         }
      }
      
      protected function get _3198() : _954
      {
         return this._5141._3198;
      }
      
      protected function get _5273() : _958
      {
         return this._5141._5273;
      }
      
      protected function get _5366() : _827
      {
         return _960._5366;
      }
      
      protected function get _5350() : _957
      {
         return _960._5350;
      }
      
      protected function get _2762() : _50
      {
         return this._5141._2762;
      }
      
      protected function get _3286() : _760
      {
         return this._5141._3286;
      }
      
      protected function get _2861() : LibraryPanelController
      {
         return _1407.getInstance(LibraryPanelController) as LibraryPanelController;
      }
      
      protected function get _2852() : TimelinePanelController
      {
         return _1407.getInstance(TimelinePanelController) as TimelinePanelController;
      }
      
      protected function get _3975() : _540
      {
         return _1407.getInstance(_540) as _540;
      }
      
      public function set _4887(param1:Boolean) : void
      {
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
         this._4309 = param1;
         _14.setCursor(this._4309);
      }
      
      public function set _4877(param1:Boolean) : void
      {
         if(this._5351 == param1)
         {
            return;
         }
         this._5351 = param1;
         if(this._5351)
         {
            this._5141.addEventListener(MouseEvent.MOUSE_DOWN,this._5129);
         }
         else
         {
            this._5141.removeEventListener(MouseEvent.MOUSE_DOWN,this._5129);
         }
      }
      
      public function get _4876() : Boolean
      {
         return this._5352;
      }
      
      public function set _4876(param1:Boolean) : void
      {
         if(this._5352 != param1)
         {
            this._5352 = param1;
         }
      }
      
      private function get _2873() : _715
      {
         return _2220._2873;
      }
      
      protected function get _3176() : _580
      {
         return _1407.getInstance(_580);
      }
      
      protected function get _4855() : _597
      {
         return _1407.getInstance(_597);
      }
      
      public function _11422() : Boolean
      {
         if(this._5141)
         {
            return this._5141._11422();
         }
         return false;
      }
   }
}

