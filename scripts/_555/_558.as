package _555
{
   import _1177.IndexChangeEvent;
   import _1177.ListEvent;
   import _127._10547;
   import _127._163;
   import _1374.IconButton;
   import _1404._1407;
   import _1421.TreeDragEvent;
   import _24.Shortcut;
   import _24._26;
   import _470._469;
   import _51._50;
   import _51._70;
   import _51._79;
   import _521._523;
   import _648._665;
   import _668._669;
   import _676._700;
   import _703._702;
   import _703._705;
   import _708._715;
   import _724._725;
   import _73.SymbolType;
   import _73._74;
   import _783.ComicNotification;
   import _783.CommandNotification;
   import _783.MenuNotification;
   import _783.PanelNotification;
   import _783.StageNotification;
   import _783.TimelineNotification;
   import _783.TipNotification;
   import _81._87;
   import _81._91;
   import _857.DrawOrderPanel;
   import _93._94;
   import _978.TimelinePanel;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   import flash.utils.setTimeout;
   
   public class _558 extends _94
   {
      public static const ICON_ARMATURE:String = "/assets/panelIcon/soltarmature.png";
      
      public static const ICON_MOVIECLIP:String = "/assets/skins/tree/mcSlot.png";
      
      public static const ICON_MESH:String = "/assets/skins/tree/meshSlot.png";
      
      public static const ICON_IMAGE:String = "/assets/skins/tree/photoSlot.png";
      
      public static const ICON_NULL:String = "/assets/skins/tree/emptySlot.png";
      
      public static const ICON_STAGE:String = "/assets/skins/tree/armatrueSlot.png";
      
      public static const ICON_SLOT:String = "/assets/panelIcon/slot.png";
      
      public static const ICON_SLOTMISS:String = "/assets/panelIcon/slotMiss.png";
      
      public static const ICON_SLOTMISSMESH:String = "/assets/panelIcon/slotMissMesh.png";
      
      public static const ICON_BOUNDINGBOX:String = "/assets/panelIcon/boundingBoxSlot.png";
      
      public static const ICON_ONLYBOUNDINGBOX:String = "/assets/panelIcon/onlyBoundingBoxSlot.png";
      
      private var _4120:_669;
      
      private var _4131:DrawOrderPanel;
      
      private var _4133:_665;
      
      private var _10745:Boolean;
      
      private var _14536:Array;
      
      private var _14537:Number = 0;
      
      private var _10580:int = -1;
      
      private var _10579:int = -1;
      
      public function _558()
      {
         this._4120 = new _669();
         this._4131 = _1407.getInstance(DrawOrderPanel);
         super();
      }
      
      override protected function _1576() : void
      {
         Shortcut._1681(stage,_26.BRING_FORWARD,this._4128);
         Shortcut._1681(stage,_26.SEND_BACKWARD,this._4128);
         Shortcut._1681(stage,_26.BRING_TO_FRONT,this._4128);
         Shortcut._1681(stage,_26.SEND_TO_BOTTOM,this._4128);
         _1565(StageNotification.UPDATE_SELECTED_ITEMS,this._4121);
         _1565(StageNotification.UPDATE_CURRENT_ARMATURE,this._3973);
         _1565(TimelineNotification.UPDATE,this._10741);
         _1565(TimelineNotification.UPDATE_ZORDER,this._10743);
         _1565(TimelineNotification.UPDATE_ZORDER_KEY_STATUS,this._10740);
         _1565(StageNotification.UPDATE_EDIT_MODE,this._3864,-1);
         this.upBtn.addEventListener(MouseEvent.CLICK,this._4123);
         this.downBtn.addEventListener(MouseEvent.CLICK,this._4123);
         this._4131._4667.addEventListener(MouseEvent.CLICK,this._10742);
         this.tree.addEventListener(IndexChangeEvent.CHANGE,this._3552);
         this.tree.addEventListener(ListEvent.ITEM_ROLL_OVER,this._4124);
         this.tree.addEventListener(ListEvent.ITEM_ROLL_OUT,this._4125);
         this.tree.addEventListener(ListEvent.ITEM_DOUBLE_CLICK,this._3561);
         this.tree.addEventListener(TreeDragEvent.ITEMS_DRAG_START,this._4119);
         this.tree.addEventListener(TreeDragEvent.ITEMS_DRAG_MOVE_COMPLETE,this._4117);
         this.tree.addEventListener(TreeDragEvent.ITEMS_DRAG_COMPLETE,this._13808);
         this.tree.addEventListener(_10547.ITEMS_DRAG_UP_REFRESH,this._10581);
         this.tree.addEventListener(_10547.ITEMS_DRAG_DOWN_REFRESH,this._10581);
         _1565(MenuNotification.BRING_TO_FRONT,this._4135);
         _1565(MenuNotification.BRING_FORWARD,this._4130);
         _1565(MenuNotification.SEND_BACKWARD,this._4129);
         _1565(MenuNotification.SEND_TO_BOTTOM,this._4132);
         _1565(ComicNotification.UPDATE_SELCTEDS,this.refresh);
      }
      
      private function _10742(param1:MouseEvent) : void
      {
         _1567(new TimelineNotification(TimelineNotification.ADD_ZORDER_KEY));
      }
      
      private function _10740(param1:TimelineNotification) : void
      {
         switch(param1.data)
         {
            case 0:
               this._4131._4667.enabled = true;
               this._4131._4667.icon = TimelinePanel.ADD_KEY_WHITE;
               break;
            case 1:
               this._4131._4667.enabled = true;
               this._4131._4667.icon = TimelinePanel.ADD_KEY_RED;
               break;
            case 2:
               this._4131._4667.enabled = true;
               this._4131._4667.icon = TimelinePanel.ADD_KEY_YELLOW;
               break;
            default:
               this._4131._4667.enabled = true;
               this._4131._4667.icon = TimelinePanel.ADD_KEY_WHITE;
         }
      }
      
      private function _3864(param1:StageNotification) : void
      {
         if(_2220._2873 == _715.NULL)
         {
            return;
         }
         if(_2220._2873 == _715.ANIMATE)
         {
            this._4131._4667.visible = true;
         }
         else
         {
            this._4131._4667.visible = false;
         }
         if(this._4120)
         {
            this._4120._10744(null,null);
         }
         this._10687();
      }
      
      private function _10743(param1:TimelineNotification) : void
      {
         var _loc2_:Array = null;
         var _loc3_:Array = null;
         if(param1.data)
         {
            _loc2_ = param1.data._10659;
            _loc3_ = param1.data.prevZOrder;
            if(this._4120)
            {
               this._4120._10744(_loc2_,_loc3_);
            }
            if(!this._10745)
            {
               this._10745 = true;
               if(this._2870)
               {
                  this._2870._10665 = true;
               }
            }
         }
         else
         {
            if(this._4120)
            {
               this._4120._10744(null,null);
            }
            if(this._10745)
            {
               this._10745 = false;
               if(this._2870)
               {
                  this._2870._10665 = true;
               }
            }
         }
      }
      
      private function _10741(param1:TimelineNotification) : void
      {
         this._10687();
      }
      
      public function _10687() : void
      {
         var _loc1_:Array = null;
         var _loc2_:Array = null;
         if(Boolean(this._2870) && this._2870._10665)
         {
            _loc1_ = this._2870._10659;
            _loc2_ = this._2910._2911.children;
            this._2891();
            this._2870._10665 = false;
         }
      }
      
      private function refresh(param1:ComicNotification) : void
      {
         var _loc3_:_702 = null;
         var _loc5_:Object = null;
         var _loc2_:Vector.<_91> = this._3061._2889.concat();
         var _loc4_:Vector.<Object> = new Vector.<Object>();
         for each(_loc5_ in _loc2_)
         {
            if(_loc5_ is _79)
            {
               _loc3_ = _705._2997[_loc5_];
               _loc4_.push(_loc3_);
            }
         }
         this._4131._4127(_loc4_);
         this._4115();
      }
      
      private function _4129(param1:MenuNotification) : void
      {
         this._4134(false);
      }
      
      private function _4130(param1:MenuNotification) : void
      {
         this._4134(true);
      }
      
      private function _4135(param1:MenuNotification) : void
      {
         this._4134(true,true);
      }
      
      private function _4132(param1:MenuNotification) : void
      {
         this._4134(false,true);
      }
      
      private function _4128(param1:String) : void
      {
         if(_2214._1844._2871._2865._1811 == SymbolType.COMIC)
         {
            return;
         }
         switch(param1)
         {
            case _26.BRING_FORWARD:
               this._4134(true);
               break;
            case _26.SEND_BACKWARD:
               this._4134(false);
               break;
            case _26.BRING_TO_FRONT:
               this._4134(true,true);
               break;
            case _26.SEND_TO_BOTTOM:
               this._4134(false,true);
         }
      }
      
      private function _4116(param1:StageNotification) : void
      {
      }
      
      private function _4121(param1:StageNotification) : void
      {
         var _loc3_:_702 = null;
         var _loc5_:Object = null;
         var _loc2_:Array = _2226._2889.concat();
         _87._2199(_loc2_,{
            "filterBone":2,
            "filterSlot":0,
            "filterBlankSlot":false
         });
         var _loc4_:Vector.<Object> = new Vector.<Object>();
         for each(_loc5_ in _loc2_)
         {
            if(_loc5_ is _79)
            {
               _loc3_ = _705._2997[_loc5_];
               _loc4_.push(_loc3_);
            }
         }
         this._4131._4127(_loc4_);
         this._4115();
      }
      
      private function _3973(param1:StageNotification = null) : void
      {
         var _loc2_:_50 = !!this._4133 ? this._4133._2865 : null;
         if(this._4120._1886 == _loc2_)
         {
            return;
         }
         this._4120._1886 = _loc2_;
         if(_loc2_)
         {
            this._4131._4122 = this._4120;
         }
      }
      
      private function _4123(param1:MouseEvent) : void
      {
         this._4134(param1.currentTarget == this.upBtn);
      }
      
      private function _4118(param1:_79, param2:_79) : Number
      {
         var _loc3_:Array = param1.parentBoneData.rootArmatureData._1780;
         if(_loc3_.indexOf(param1) < _loc3_.indexOf(param2))
         {
            return 1;
         }
         return -1;
      }
      
      private function _4134(param1:Boolean, param2:Boolean = false) : void
      {
         var _loc3_:_79 = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         if(this._4131 && this._4131.tree && Boolean(this._4131.tree._2490))
         {
            this._14537 = this._4131.tree._2490.verticalScrollPosition;
         }
         var _loc7_:Array = this._2910._3997.source.children;
         var _loc8_:Array = this._14535(_loc7_);
         var _loc9_:Array = _loc8_.concat();
         var _loc10_:Array = _2226._2889.concat();
         _87._2199(_loc10_,{
            "filterBone":2,
            "filterSlot":0,
            "filterBlankSlot":false
         });
         if(_loc10_[0] is _79)
         {
            _loc3_ = _loc10_[0] as _79;
            _loc6_ = int(_loc8_.indexOf(_loc3_));
            if(param2)
            {
               _loc9_.splice(_loc6_,1);
               if(param1)
               {
                  _loc9_.unshift(_loc3_);
               }
               else
               {
                  _loc9_.push(_loc3_);
               }
            }
            else if(param1)
            {
               _loc9_.splice(_loc6_,1);
               _loc9_.splice(_loc6_ - 1,0,_loc3_);
            }
            else
            {
               _loc9_.splice(_loc6_,1);
               _loc9_.splice(_loc6_ + 1,0,_loc3_);
            }
            this._14534(_loc8_,_loc9_);
         }
      }
      
      private function _3552(param1:IndexChangeEvent) : void
      {
         var _loc5_:Object = null;
         var _loc2_:Vector.<Object> = this.tree._2889;
         var _loc3_:Array = [];
         var _loc4_:Vector.<_91> = new Vector.<_91>();
         for each(_loc5_ in _loc2_)
         {
            _loc3_.push((_loc5_ as _702).vo);
            _loc4_.push((_loc5_ as _702).vo);
         }
         if(_2214._1844._2871._2865._1811 == SymbolType.COMIC)
         {
            this._3061._2986(_loc4_);
         }
         else
         {
            _1567(new CommandNotification(CommandNotification.SELECT_ITEMS,_loc3_));
         }
      }
      
      private function _4124(param1:ListEvent) : void
      {
         var _loc3_:_725 = null;
         var _loc4_:DisplayObject = null;
         var _loc5_:Object = null;
         var _loc2_:_702 = param1.itemRenderer.data as _702;
         if(_loc2_ is _700)
         {
            _1567(new StageNotification(StageNotification.ROLLOVER_SLOT,_loc2_.vo));
            if((_loc2_ as _700)._1837._2049)
            {
               _loc3_ = (_loc2_ as _700)._1837._2049._2104;
            }
            if(_loc3_)
            {
               _loc4_ = param1.itemRenderer as DisplayObject;
               _loc5_ = {
                  "_2104":_loc3_,
                  "render":_loc4_
               };
               _1567(new TipNotification(TipNotification.SHOW_TIP_IMAGE,_loc5_));
            }
         }
      }
      
      private function _4125(param1:ListEvent) : void
      {
         var _loc2_:_702 = param1.itemRenderer.data as _702;
         if(_loc2_ is _700)
         {
            _1567(new StageNotification(StageNotification.ROLLOUT_SLOT,_loc2_.vo));
         }
         _1567(new TipNotification(TipNotification.HIDE_TIP_IMAGE));
      }
      
      private function _3561(param1:ListEvent) : void
      {
         var _loc2_:_702 = param1.itemRenderer.data as _702;
         if(_loc2_ is _700)
         {
         }
      }
      
      private function _14535(param1:Array) : Array
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:_700 = null;
         var _loc6_:Boolean = false;
         var _loc5_:Array = [];
         _loc2_ = 0;
         _loc3_ = int(param1.length);
         while(_loc2_ < _loc3_)
         {
            _loc4_ = param1[_loc2_];
            if(!((Boolean(_loc4_)) && Boolean(_loc4_._1837)))
            {
               return null;
            }
            _loc5_.push(_loc4_._1837);
            _loc2_++;
         }
         return _loc5_;
      }
      
      private function _4119(param1:TreeDragEvent) : void
      {
         var _loc2_:Array = this._2910._3997.source.children;
         this._14536 = this._14535(_loc2_);
         _1567(new PanelNotification(PanelNotification.SCENETREE_START_DRAG));
         stage.addEventListener(MouseEvent.MOUSE_UP,this._4126);
      }
      
      private function _13808(param1:TreeDragEvent) : void
      {
         var _loc2_:Array = this._2910._3997.source.children;
         var _loc3_:Array = this._14535(_loc2_);
         this._14534(this._14536,_loc3_);
      }
      
      private function _14534(param1:Array, param2:Array) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:Boolean = false;
         var _loc6_:Array = null;
         var _loc7_:Object = null;
         var _loc8_:Object = null;
         if(param1 && param1.length > 0 && param2 && param1.length == param2.length)
         {
            _loc3_ = 0;
            _loc4_ = int(param1.length);
            while(_loc3_ < _loc4_)
            {
               if(param1[_loc3_] != param2[_loc3_])
               {
                  _loc5_ = true;
                  break;
               }
               _loc3_++;
            }
            if(_loc5_)
            {
               if(this._2873 == _715.ANIMATE)
               {
                  _loc6_ = [];
                  _loc3_ = int(param2.length - 1);
                  while(_loc3_ >= 0)
                  {
                     _loc6_.push(param2[_loc3_].name);
                     _loc3_--;
                  }
                  (_loc7_ = {}).zOrder = _loc6_;
                  this._2870._10663(_loc6_);
                  _1567(new TimelineNotification(TimelineNotification.MODIFY_ZORDER,_loc7_));
               }
               else
               {
                  (_loc8_ = {})._1886 = this._2870;
                  _loc8_._3018 = param1.concat();
                  _loc8_._3019 = param2;
                  _1567(new CommandNotification(CommandNotification.MODIFY_ARMATURE_ZORDER,_loc8_));
               }
            }
         }
      }
      
      private function _4117(param1:TreeDragEvent) : void
      {
         if(this._4131 && this._4131.tree && Boolean(this._4131.tree._2490))
         {
            this._14537 = this._4131.tree._2490.verticalScrollPosition;
         }
      }
      
      private function _10578(param1:_10547) : void
      {
         var _loc7_:int = 0;
         var _loc8_:_700 = null;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         if(this._10579 < 0 || this._10580 < 0)
         {
            return;
         }
         if(this._10580 > this._10579)
         {
            ++this._10580;
         }
         var _loc2_:Array = this._2910._3997.source.children;
         var _loc3_:Array = [];
         var _loc4_:Array = [];
         var _loc5_:Array = [];
         var _loc6_:int = this._10580;
         var _loc9_:Array = param1._3597;
         var _loc10_:int = 0;
         _loc11_ = 0;
         _loc12_ = int(_loc9_.length);
         while(_loc11_ < _loc12_)
         {
            _loc8_ = _loc9_[_loc11_];
            _loc7_ = this._10579;
            if(_loc7_ < _loc6_)
            {
               _loc3_.push(_loc8_._1837);
               _loc5_.push(_loc7_);
               _loc10_++;
            }
            else
            {
               _loc3_.unshift(_loc8_._1837);
               _loc5_.unshift(_loc7_);
            }
            _loc11_++;
         }
         _loc11_ = 1;
         while(_loc11_ <= _loc10_)
         {
            _loc4_.unshift(_loc6_ - _loc11_);
            _loc11_++;
         }
         _loc11_ = 0;
         _loc12_ = _loc9_.length - _loc10_;
         while(_loc11_ < _loc12_)
         {
            _loc4_.unshift(_loc6_ + _loc11_);
            _loc11_++;
         }
         var _loc13_:Object = _469._3473(_loc3_,_loc4_,_loc5_);
         if(_2214._1844._2871._2865._1811 != SymbolType.COMIC)
         {
            _1567(new CommandNotification(CommandNotification.MODIFY_SLOT_ITEMS_ZORDER_TEMP,_loc13_));
         }
         this._10580 = -1;
         this._10579 = -1;
      }
      
      private function _10581(param1:_10547) : void
      {
         var rate:int;
         var startIndex:int;
         var newSlotList:Array = null;
         var i:int = 0;
         var len:int = 0;
         var found:Boolean = false;
         var order:Object = null;
         var sortSlot:Function = null;
         var _11129:Object = null;
         var event:_10547 = param1;
         sortSlot = function(param1:_79, param2:_79):int
         {
            return order[param1.name] < order[param2.name] ? -1 : 1;
         };
         var dragSlotModels:Array = event._3597;
         var dropSlotVO:_79 = !!event._4137 ? event._4137._1837 : null;
         var upOrDown:Boolean = event._4136;
         var dragSlotVOs:Array = [];
         if(dragSlotModels == null || dragSlotModels.length == 0 || dropSlotVO == null || this._14536 == null)
         {
            return;
         }
         newSlotList = this._14536.concat();
         i = 0;
         len = int(dragSlotModels.length);
         while(i < len)
         {
            if(dragSlotModels[i]._1837)
            {
               dragSlotVOs.push(dragSlotModels[i]._1837);
            }
            i++;
         }
         rate = dragSlotVOs.length * 10;
         order = {};
         i = 0;
         len = int(newSlotList.length);
         while(i < len)
         {
            order[newSlotList[i].name] = i * rate;
            i++;
         }
         if(dragSlotVOs.length > 0)
         {
            dragSlotVOs = dragSlotVOs.sort(sortSlot);
         }
         startIndex = int(order[dropSlotVO.name]);
         if(upOrDown)
         {
            startIndex -= rate;
         }
         i = 0;
         len = int(dragSlotVOs.length);
         while(i < len)
         {
            order[dragSlotVOs[i].name] = startIndex + i + 1;
            i++;
         }
         newSlotList = newSlotList.sort(sortSlot);
         if(this._14536 && this._14536.length > 0 && newSlotList && this._14536.length == newSlotList.length)
         {
            _11129 = {};
            _11129._1886 = this._2870;
            _11129._3019 = newSlotList;
            _1567(new CommandNotification(CommandNotification.MODIFY_ARMATURE_ZORDER_TEMP,_11129));
         }
      }
      
      private function _4126(param1:MouseEvent) : void
      {
         stage.removeEventListener(MouseEvent.MOUSE_UP,this._4126);
         _1567(new PanelNotification(PanelNotification.SCENETREE_STOP_DRAG));
      }
      
      public function _3017(param1:_79, param2:int) : void
      {
         var _loc3_:_700 = _705._2997[param1];
         var _loc4_:Array = this._2910._2911.children;
         _loc4_.splice(_loc4_.indexOf(_loc3_),1);
         _loc4_.splice(param2,0,_loc3_);
      }
      
      public function _2943(param1:_702) : void
      {
         this.tree.dataProvider._4016(param1);
      }
      
      public function _2891() : void
      {
         var i:int = 0;
         var len:int = 0;
         var _1837:_79 = null;
         var slotTreeNode:_700 = null;
         var dataSource:Array = this._2910._2911.children;
         dataSource.length = 0;
         i = int(this._2870._1780.length - 1);
         while(i >= 0)
         {
            _1837 = this._2870._1780[i];
            slotTreeNode = _705._2997[_1837];
            dataSource.push(slotTreeNode);
            i--;
         }
         this._4120._3997.refresh();
         this._4121(null);
         if(this._4131 && this._4131.tree && Boolean(this._4131.tree._2490))
         {
            this._4131.tree._2490.verticalScrollPosition = this._14537;
            setTimeout(function():void
            {
               _4131.tree._2490.verticalScrollPosition = _14537;
            },1);
         }
      }
      
      public function get _2910() : _669
      {
         return this._4120;
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
      
      private function _4115() : void
      {
         var _loc2_:Array = null;
         var _loc3_:int = 0;
         var _loc4_:_700 = null;
         var _loc1_:Vector.<Object> = this.tree._2889;
         if(_loc1_.length > 0)
         {
            this.upBtn.enabled = true;
            this.downBtn.enabled = true;
            _loc2_ = this._2910._2911.children;
            _loc3_ = int(_loc2_.length);
            for each(_loc4_ in _loc1_)
            {
               this.upBtn.enabled = this.upBtn.enabled && _loc2_.indexOf(_loc4_) != 0;
               this.downBtn.enabled = this.downBtn.enabled && _loc2_.indexOf(_loc4_) != _loc3_ - 1;
            }
         }
         else
         {
            this.upBtn.enabled = false;
            this.downBtn.enabled = false;
         }
      }
      
      private function get _2873() : _715
      {
         return _2220._2873;
      }
      
      private function get tree() : _163
      {
         return this._4131.tree;
      }
      
      private function get upBtn() : IconButton
      {
         return this._4131.upBtn;
      }
      
      private function get downBtn() : IconButton
      {
         return this._4131.downBtn;
      }
      
      public function _3954() : Array
      {
         var _loc1_:Boolean = false;
         var _loc2_:Boolean = false;
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         var _loc6_:_700 = null;
         var _loc3_:Vector.<Object> = this.tree._2889;
         if(_loc3_.length > 0)
         {
            _loc1_ = true;
            _loc2_ = true;
            _loc4_ = this._2910._2911.children;
            _loc5_ = int(_loc4_.length);
            for each(_loc6_ in _loc3_)
            {
               _loc1_ &&= _loc4_.indexOf(_loc6_) != 0;
               _loc2_ &&= _loc4_.indexOf(_loc6_) != _loc5_ - 1;
            }
         }
         else
         {
            _loc1_ = false;
            _loc2_ = false;
         }
         return [_loc1_,_loc2_];
      }
      
      public function get _3061() : _523
      {
         return _1407.getInstance(_523) as _523;
      }
      
      private function get _2870() : _50
      {
         if(_2214 && _2214._1844 && Boolean(_2214._1844._2871))
         {
            return _2214._1844._2871._2865;
         }
         return null;
      }
      
      public function _4538(param1:_702) : String
      {
         var _loc2_:_70 = null;
         var _loc3_:String = null;
         if(param1.vo is _79)
         {
            _loc2_ = (param1.vo as _79)._2049;
            if(!_loc2_)
            {
               return ICON_NULL;
            }
            _loc3_ = _loc2_.type.toString();
            if(_loc3_ == _74.ARMATURE.toString())
            {
               return ICON_ARMATURE;
            }
            if(_loc3_ == _74.IMAGE.toString())
            {
               if(Boolean(_loc2_) && _loc2_._2104.missing)
               {
                  return ICON_SLOTMISS;
               }
               return ICON_IMAGE;
            }
            if(_loc3_ == _74.MESH.toString())
            {
               if(Boolean(_loc2_) && _loc2_._2104.missing)
               {
                  return ICON_SLOTMISSMESH;
               }
               return ICON_MESH;
            }
            if(_loc3_ == _74.MOVIECLIP.toString())
            {
               return ICON_MOVIECLIP;
            }
            if(_loc3_ == _74.STAGE.toString())
            {
               return ICON_STAGE;
            }
            if(_loc3_ == _74.BOUNDINGBOX.toString())
            {
               if((param1.vo as _79).onlyBoundingBox)
               {
                  return ICON_ONLYBOUNDINGBOX;
               }
               return ICON_BOUNDINGBOX;
            }
         }
         return ICON_SLOT;
      }
   }
}

