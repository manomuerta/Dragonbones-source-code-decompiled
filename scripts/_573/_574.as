package _573
{
   import _1038._1042;
   import _1177.ListEvent;
   import _13._12;
   import _13._14;
   import _13492._13491;
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
   import _13505._13509;
   import _13505._13510;
   import _13505._14035;
   import _13545._13544;
   import _13545._13547;
   import _13545._13548;
   import _1404._1407;
   import _214._213;
   import _24.Shortcut;
   import _24._26;
   import _40.BoneFrameVO;
   import _40.TimelineVOBase;
   import _40._10599;
   import _40._39;
   import _40._41;
   import _40._42;
   import _40._43;
   import _40._45;
   import _40._47;
   import _40._48;
   import _413._435;
   import _413._452;
   import _413._458;
   import _413._460;
   import _413._466;
   import _439._445;
   import _472._577;
   import _51._50;
   import _51._52;
   import _51._70;
   import _51._77;
   import _51._79;
   import _521._522;
   import _537._13540;
   import _537._13541;
   import _537._538;
   import _541._540;
   import _555._571;
   import _555._576;
   import _586._596;
   import _586._599;
   import _6.Context;
   import _636.DBModelEvent;
   import _636.TimelineEvent;
   import _639._12462;
   import _648._663;
   import _676._690;
   import _703._705;
   import _708._714;
   import _708._715;
   import _710._711;
   import _710._712;
   import _721._753;
   import _73._74;
   import _783.CommandNotification;
   import _783.MenuNotification;
   import _783.StageNotification;
   import _783.TimelineNotification;
   import _81._86;
   import _93._94;
   import _97._116;
   import _978.Timeline;
   import _978.TimelinePanel;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.ui.Keyboard;
   import flash.utils.Dictionary;
   import flash.utils.Timer;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   
   public class _574 extends _94
   {
      public const WAIT_BLANK_TIME:int = 300;
      
      public const SPEED_BLANK_TIME:int = 100;
      
      public var timeline:Timeline;
      
      protected var _4549:_538;
      
      protected var _13815:_13540;
      
      protected var _13796:_13541;
      
      protected var _4581:_1042;
      
      protected var _2482:Object;
      
      protected var _3870:Object;
      
      protected var _4555:Array;
      
      protected var _3896:_13544;
      
      protected var _4656:Boolean;
      
      protected var _4598:_39;
      
      protected var _4628:_47;
      
      protected var _4588:Boolean;
      
      protected var _4617:Boolean = false;
      
      protected var _4638:Boolean;
      
      protected var _4608:Boolean;
      
      protected var _4603:Boolean;
      
      protected var _4295:Boolean;
      
      protected var _4592:Boolean;
      
      private var _11361:Boolean;
      
      private var _12630:Boolean;
      
      private var _13185:Timer;
      
      private var _13186:Boolean;
      
      private var _13188:Boolean;
      
      private var _13184:int;
      
      private var _13838:Boolean;
      
      private var _14594:Boolean = true;
      
      private var _13827:Vector.<_52>;
      
      private var _15584:Array;
      
      public function _574()
      {
         this._4628 = new _47(null,true,-1);
         this._15584 = [];
         super();
         this._4555 = [];
         this._4549 = new _538();
         this._13815 = _1407.getInstance(_13540) as _13540;
         this._13796 = _1407.getInstance(_13541) as _13541;
         this._4592 = true;
      }
      
      override public function start() : void
      {
         if(this._4295)
         {
            return;
         }
         super.start();
         this._4295 = true;
      }
      
      public function set _4650(param1:_13544) : void
      {
         this._3896 = param1;
      }
      
      public function set _4662(param1:_1042) : void
      {
         this._4581 = param1;
      }
      
      public function setData(param1:_13544, param2:_1042, param3:Timeline) : void
      {
         var _loc4_:_50 = null;
         this._4646();
         this._4656 = true;
         this.timeline = param3;
         this.timeline._4666 = param2;
         this._3896 = param1;
         this._4581 = param2;
         if(Boolean(param1) && Boolean(this.timeline))
         {
            _loc4_ = (param1.vo as _13502).rootArmatureData;
            param1._13785();
            param1._13839();
            param2.refresh();
            this.start();
            this._4549._3912 = this._4581;
            this._13815._3912 = this._4581;
         }
         if(this.timeline)
         {
            this.timeline._4666 = param2;
            this.timeline.dataChange();
            if(this._3896)
            {
               this.timeline._4637();
            }
            this.timeline._4653();
         }
      }
      
      public function stop() : void
      {
         this._4295 = false;
         _1564(StageNotification.UPDATE_SELECTED_ITEMS,this._4548);
         _1564(StageNotification.UPDATE_FILTER_STATUS,this._4606);
         _1564(StageNotification.UPDATE_EDIT_MODE,this._4548);
         _1564(TimelineNotification.ADD_ZORDER_KEY,this._10750);
         _1564(TimelineNotification.ADJUST_CHANGE,this._11360);
         _1564(TimelineNotification.ADD_EVENT_FRAME,this._11359);
         _1564(TimelineNotification.SET_LOOP,this._13844);
         _1564(TimelineNotification.FILTER_REFRESH,this._13836);
         _1564(TimelineNotification.FILTER_SELECT,this._13837);
         _1564(TimelineNotification.UPDATE_SELECT_FRAMES,this._13826);
         _1564(TimelineNotification.UPDATE_SELECT_TIMELINES,this._13823);
         _1564(StageNotification.CHANGE_TRANSFORM_MODEL,this._10753);
         _1564(TimelineNotification.ADD_BONE_KEY,this._13841);
         _1564(TimelineNotification.MODIFY_ZORDER,this._13840);
         _1564(StageNotification.UPDATE_CURRENT_ARMATURE,this._3973);
         if(this.timeline == null)
         {
            return;
         }
         this.timeline.removeEventListener(TimelineEvent.SELECT_TIMELINE,this._4571);
         this.timeline.removeEventListener(TimelineEvent.SELECT_TIMELINES,this._10349);
         this.timeline.removeEventListener(TimelineEvent._4636,this._4630);
         this.timeline.removeEventListener(TimelineEvent.SELECT_FRAMES,this._4094);
         this.timeline.removeEventListener(TimelineEvent.SELECT_FRAME_LINE,this._4614);
         this.timeline.removeEventListener(TimelineEvent._4622,this._4615);
         this.timeline.removeEventListener(TimelineEvent.MOVE_KEY_FRAME,this._4648);
         this.timeline.removeEventListener(TimelineEvent.SCALE_KEY_FRAME,this._4640);
         this.timeline.removeEventListener(TimelineEvent.MOVE_FRAME,this._4660);
         this.timeline.removeEventListener(TimelineEvent.SCALE_FRAME,this._4658);
         this.timeline.removeEventListener(TimelineEvent.MOVE_FRAME_START,this._4631);
         this.timeline.removeEventListener(TimelineEvent.MOVE_FRAME_END,this._4647);
         this.timeline.removeEventListener(TimelineEvent.VISIBLE_CHANGE,this._4566);
         this.timeline.removeEventListener(TimelineEvent.LOCK_CHANGE,this._4579);
         this.timeline.removeEventListener(TimelineEvent.LAST_FRAME_CHANGE,this._4616);
         this.timeline.removeEventListener(TimelineEvent.SELECT_RECT_START,this._13834);
         this.timeline.removeEventListener(TimelineEvent.SELECT_RECT,this._4657);
         this.timeline.removeEventListener(TimelineEvent.SELECT_RECT_END,this._4639);
         this.timeline.removeEventListener(MouseEvent.MOUSE_OVER,this._4604);
         this.timeline.removeEventListener(MouseEvent.MOUSE_OUT,this._4607);
         this.timeline.removeEventListener(TimelineEvent.UPDATE,this._4629);
         this.timeline.removeEventListener(TimelineEvent.FRAME_CHANGE,this._4654);
         this.timeline.removeEventListener(TimelineEvent.FRAME_RATE_CHANGE,this._4613);
         this.timeline.removeEventListener(TimelineEvent.SCALE_CHANGE,this._4316);
         this.timeline.removeEventListener(TimelineEvent.ONION_CHANGE,this._4611);
         this.timeline.removeEventListener(TimelineEvent.ANIMATION_TREE_OPEN,this._13829);
         if(this.timeline._11362)
         {
            this.timeline._11362.removeEventListener(MouseEvent.CLICK,this._11363);
         }
         if(this.timeline._11607)
         {
            this.timeline._11607.removeEventListener(MouseEvent.CLICK,this._11609);
         }
         if(this.timeline._4667)
         {
            this.timeline._4667.removeEventListener(MouseEvent.CLICK,this.onKey);
         }
         if(this.timeline._4663)
         {
            this.timeline._4663.removeEventListener(MouseEvent.CLICK,this._4652);
         }
         if(this.timeline._4605)
         {
            this.timeline._4605.removeEventListener(MouseEvent.MOUSE_DOWN,this._13181);
         }
         if(this.timeline._4635)
         {
            this.timeline._4635.removeEventListener(MouseEvent.MOUSE_DOWN,this._13180);
         }
         if(this._4627)
         {
            this._4627.removeEventListener(DBModelEvent.PANEL_STATUS_CHANGED,this._4601);
         }
         if(this.timeline.stage)
         {
            Shortcut._1673(this.timeline.stage,_26.KEY_FRAME,this._4596);
            Shortcut._1673(this.timeline.stage,_26.ADD_TWEEN,this._13833);
         }
         _1564(MenuNotification.KEY_FRAME,this._4649);
         this.timeline.removeEventListener(TimelineEvent.RIGHT_DOWN_FRAME,this._4659);
         this.timeline.removeEventListener(ListEvent.ITEM_RIGHT_MOUSE_DOWN,this._4013);
         _1564(MenuNotification.ADD_TWEEN,this._4567);
         _1564(MenuNotification.DELETE_TWEEN,this._4558);
      }
      
      override protected function _1576() : void
      {
         super._1576();
         _1565(StageNotification.UPDATE_TIMELINE_SELECTED_ITEMS,this._14588);
         _1565(StageNotification.UPDATE_SELECTED_ITEMS,this._4548);
         _1565(StageNotification.UPDATE_FILTER_STATUS,this._4606);
         _1565(StageNotification.UPDATE_EDIT_MODE,this._4548);
         _1565(TimelineNotification.ADD_ZORDER_KEY,this._10750);
         _1565(TimelineNotification.ADJUST_CHANGE,this._11360);
         _1565(TimelineNotification.ADD_EVENT_FRAME,this._11359);
         _1565(TimelineNotification.SET_LOOP,this._13844);
         _1565(TimelineNotification.FILTER_REFRESH,this._13836);
         _1565(TimelineNotification.FILTER_SELECT,this._13837);
         _1565(TimelineNotification.UPDATE_SELECT_FRAMES,this._13826);
         _1565(TimelineNotification.UPDATE_SELECT_TIMELINES,this._13823);
         _1565(StageNotification.CHANGE_TRANSFORM_MODEL,this._10753);
         _1565(TimelineNotification.ADD_BONE_KEY,this._13841);
         _1565(TimelineNotification.MODIFY_ZORDER,this._13840);
         _1565(StageNotification.UPDATE_CURRENT_ARMATURE,this._3973);
         this.timeline.addEventListener(TimelineEvent.SELECT_TIMELINE,this._4571);
         this.timeline.addEventListener(TimelineEvent.SELECT_TIMELINES,this._10349);
         this.timeline.addEventListener(TimelineEvent._4636,this._4630);
         this.timeline.addEventListener(TimelineEvent.SELECT_FRAMES,this._4094);
         this.timeline.addEventListener(TimelineEvent.SELECT_FRAME_LINE,this._4614);
         this.timeline.addEventListener(TimelineEvent._4622,this._4615);
         this.timeline.addEventListener(TimelineEvent.MOVE_KEY_FRAME,this._4648);
         this.timeline.addEventListener(TimelineEvent.SCALE_KEY_FRAME,this._4640);
         this.timeline.addEventListener(TimelineEvent.MOVE_FRAME,this._4660);
         this.timeline.addEventListener(TimelineEvent.SCALE_FRAME,this._4658);
         this.timeline.addEventListener(TimelineEvent.MOVE_FRAME_START,this._4631);
         this.timeline.addEventListener(TimelineEvent.MOVE_FRAME_END,this._4647);
         this.timeline.addEventListener(TimelineEvent.VISIBLE_CHANGE,this._4566);
         this.timeline.addEventListener(TimelineEvent.LOCK_CHANGE,this._4579);
         this.timeline.addEventListener(TimelineEvent.LAST_FRAME_CHANGE,this._4616);
         this.timeline.addEventListener(TimelineEvent.SELECT_RECT_START,this._13834);
         this.timeline.addEventListener(TimelineEvent.SELECT_RECT,this._4657);
         this.timeline.addEventListener(TimelineEvent.SELECT_RECT_END,this._4639);
         this.timeline.addEventListener(MouseEvent.MOUSE_OVER,this._4604);
         this.timeline.addEventListener(MouseEvent.MOUSE_OUT,this._4607);
         this.timeline.addEventListener(TimelineEvent.UPDATE,this._4629);
         this.timeline.addEventListener(TimelineEvent.FRAME_CHANGE,this._4654);
         this.timeline.addEventListener(TimelineEvent.FRAME_RATE_CHANGE,this._4613);
         this.timeline.addEventListener(TimelineEvent.SCALE_CHANGE,this._4316);
         this.timeline.addEventListener(TimelineEvent.ONION_CHANGE,this._4611);
         this.timeline.addEventListener(TimelineEvent.ANIMATION_TREE_OPEN,this._13829);
         this.timeline._11362.addEventListener(MouseEvent.CLICK,this._11363);
         this.timeline._11607.addEventListener(MouseEvent.CLICK,this._11609);
         this.timeline._4667.addEventListener(MouseEvent.CLICK,this.onKey);
         this.timeline._4663.addEventListener(MouseEvent.CLICK,this._4652);
         this.timeline._4605.addEventListener(MouseEvent.MOUSE_DOWN,this._13181);
         this.timeline._4635.addEventListener(MouseEvent.MOUSE_DOWN,this._13180);
         this._4627.addEventListener(DBModelEvent.PANEL_STATUS_CHANGED,this._4601);
         if(this.timeline.stage)
         {
            Shortcut._1681(this.timeline.stage,_26.KEY_FRAME,this._4596);
            Shortcut._1681(this.timeline.stage,_26.ADD_TWEEN,this._13833);
         }
         _1565(MenuNotification.KEY_FRAME,this._4649);
         this.timeline.addEventListener(TimelineEvent.RIGHT_DOWN_FRAME,this._4659);
         this.timeline.addEventListener(ListEvent.ITEM_RIGHT_MOUSE_DOWN,this._4013);
         _1565(MenuNotification.ADD_TWEEN,this._4567);
         _1565(MenuNotification.DELETE_TWEEN,this._4558);
      }
      
      private function _3973(param1:StageNotification) : void
      {
         this._13815._3024();
         this._13796._3024();
      }
      
      private function _13840(param1:TimelineNotification) : void
      {
         var _loc3_:_50 = null;
         var _loc4_:Object = null;
         var _loc2_:Array = param1.data.zOrder;
         if(_12462.getInstance().autoKey && Boolean(this.timeline))
         {
            this._10749(_loc2_);
         }
         else
         {
            _loc3_ = this._3896._1992.rootArmatureData;
            (_loc4_ = {}).newValue = _loc2_;
            _loc4_._1897 = _loc3_;
            _1567(new CommandNotification(CommandNotification.ADD_ZORDER_FRAME_CACHE,_loc4_));
         }
      }
      
      private function _13829(param1:TimelineEvent) : void
      {
         this._13815._3024();
         if(this.timeline)
         {
            this.timeline._3446();
         }
      }
      
      private function _13826(param1:TimelineNotification) : void
      {
         if(this.timeline)
         {
            this.timeline._6812();
            this.timeline._6848();
         }
         this._4564();
      }
      
      private function _10753(param1:StageNotification) : void
      {
         var _loc3_:_13510 = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc2_:Vector.<_13510> = new Vector.<_13510>();
         switch(param1.data)
         {
            case _599.TRANSFORM_FREE:
               _loc4_ = 0;
               _loc5_ = int(this._13796._2889.length);
               while(_loc4_ < _loc5_)
               {
                  _loc3_ = this._13796._2889[_loc4_];
                  if(!(_loc3_.flag == _13510.FLAG_TRANSLATE || _loc3_.flag == _13510.FLAG_ROTATE || _loc3_.flag == _13510.FLAG_SCALE))
                  {
                     if(_loc2_.indexOf(_loc3_) == -1)
                     {
                        _loc2_.push(_loc3_);
                     }
                  }
                  _loc4_++;
               }
               break;
            case _599.TRANSFORM_TRANSLATE:
               _loc4_ = 0;
               _loc5_ = int(this._13796._2889.length);
               while(_loc4_ < _loc5_)
               {
                  _loc3_ = this._13796._2889[_loc4_];
                  if(!(_loc3_.flag == _13510.FLAG_ROTATE || _loc3_.flag == _13510.FLAG_SCALE))
                  {
                     if(_loc2_.indexOf(_loc3_) == -1)
                     {
                        _loc2_.push(_loc3_);
                     }
                  }
                  if(_loc3_ is _13504)
                  {
                     if(_loc2_.indexOf((_loc3_ as _13504)._13581) == -1)
                     {
                        _loc2_.push((_loc3_ as _13504)._13581);
                     }
                  }
                  _loc4_++;
               }
               break;
            case _599.TRANSFORM_ROTATE:
               _loc4_ = 0;
               _loc5_ = int(this._13796._2889.length);
               while(_loc4_ < _loc5_)
               {
                  _loc3_ = this._13796._2889[_loc4_];
                  if(!(_loc3_.flag == _13510.FLAG_TRANSLATE || _loc3_.flag == _13510.FLAG_SCALE))
                  {
                     if(_loc2_.indexOf(_loc3_) == -1)
                     {
                        _loc2_.push(_loc3_);
                     }
                  }
                  if(_loc3_ is _13504)
                  {
                     if(_loc2_.indexOf((_loc3_ as _13504)._13586) == -1)
                     {
                        _loc2_.push((_loc3_ as _13504)._13586);
                     }
                  }
                  _loc4_++;
               }
               break;
            case _599.TRANSFORM_SCALE:
               _loc4_ = 0;
               _loc5_ = int(this._13796._2889.length);
               while(_loc4_ < _loc5_)
               {
                  _loc3_ = this._13796._2889[_loc4_];
                  if(!(_loc3_.flag == _13510.FLAG_TRANSLATE || _loc3_.flag == _13510.FLAG_ROTATE))
                  {
                     if(_loc2_.indexOf(_loc3_) == -1)
                     {
                        _loc2_.push(_loc3_);
                     }
                  }
                  if(_loc3_ is _13504)
                  {
                     if(_loc2_.indexOf((_loc3_ as _13504)._13598) == -1)
                     {
                        _loc2_.push((_loc3_ as _13504)._13598);
                     }
                  }
                  _loc4_++;
               }
         }
         this._13796._2986(_loc2_);
      }
      
      private function _13823(param1:TimelineNotification) : void
      {
         if(this.timeline)
         {
            this.timeline._13835();
         }
      }
      
      private function _13837(param1:TimelineNotification) : void
      {
         var _loc2_:Array = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(Boolean(this._13827) && this._13827.length > 0)
         {
            _loc2_ = [];
            _loc3_ = 0;
            _loc4_ = int(this._13827.length);
            while(_loc3_ < _loc4_)
            {
               _loc2_.push(this._13827[_loc3_]);
               _loc3_++;
            }
            _2226._2889 = _loc2_;
         }
         else
         {
            _1567(new CommandNotification(CommandNotification.SELECT_ALL));
         }
      }
      
      private function _13836(param1:TimelineNotification) : void
      {
         var _loc3_:int = 0;
         var _loc2_:Array = _2226._2889.concat();
         if(this._11632 && _2220._2873 == _715.ANIMATE && this._13842)
         {
            this._15584 = [];
            _loc3_ = 0;
            while(_loc3_ < this._3870.length)
            {
               this._15584.push(this._3870[_loc3_]);
               _loc3_++;
            }
         }
         this._4618(_loc2_);
         this._11631(_loc2_,true);
      }
      
      private function _13844(param1:TimelineNotification) : void
      {
         var _loc2_:int = int(param1.data.left);
         var _loc3_:int = int(param1.data.right);
         if(this.timeline && this.timeline._13845 && Boolean(this.timeline._13843))
         {
            this.timeline._13845.curFrame = _loc2_;
            this.timeline._13843.curFrame = _loc3_;
            this.timeline._13831();
            this.timeline._4714._13845 = _loc2_;
            this.timeline._4714._13843 = _loc3_;
            this.timeline._4714.refresh();
         }
      }
      
      private function _13187(param1:MouseEvent) : void
      {
         _2217._1651();
         if(this._13188)
         {
            this._13179();
            this._13188 = false;
         }
         else
         {
            clearTimeout(this._13184);
            if(this._13186)
            {
               this._3439();
            }
            else
            {
               this._4623();
            }
         }
         if(stage)
         {
            stage.removeEventListener(MouseEvent.MOUSE_UP,this._13187);
         }
      }
      
      private function _13181(param1:MouseEvent) : void
      {
         var e:MouseEvent = param1;
         this._13186 = true;
         this._13184 = setTimeout(function():void
         {
            _13188 = true;
            _13182();
         },this.WAIT_BLANK_TIME);
         if(stage)
         {
            stage.addEventListener(MouseEvent.MOUSE_UP,this._13187);
         }
      }
      
      private function _13180(param1:MouseEvent) : void
      {
         var e:MouseEvent = param1;
         this._13186 = false;
         this._13184 = setTimeout(function():void
         {
            _13188 = true;
            _13182();
         },this.WAIT_BLANK_TIME);
         if(stage)
         {
            stage.addEventListener(MouseEvent.MOUSE_UP,this._13187);
         }
      }
      
      private function _11359(param1:TimelineNotification) : void
      {
         var _loc2_:Object = null;
         var _loc3_:Object = null;
         var _loc4_:int = this.timeline.curFrame;
         var _loc5_:_13502 = this._3896._1992;
         var _loc6_:_13491 = param1.data as _13491;
         if(_loc6_)
         {
            _loc2_ = {};
            _loc2_._1945 = _loc5_._13597;
            _loc2_._1946 = _loc6_;
            _loc6_.startPos = _loc4_;
            _1567(new CommandNotification(CommandNotification.ADD_EVENT_FRAEM,_loc2_));
         }
      }
      
      private function _11360(param1:TimelineNotification) : void
      {
         this._11361 = !this._11361;
         if(Boolean(this.timeline) && Boolean(this.timeline._11362))
         {
            this.timeline._11362.selected = this._11361;
         }
      }
      
      protected function _4558(param1:MenuNotification) : void
      {
      }
      
      protected function _4567(param1:MenuNotification) : void
      {
      }
      
      private function _4013(param1:ListEvent) : void
      {
         var _loc3_:Object = null;
         var _loc2_:_13548 = param1.item as _13548;
         if(_loc2_)
         {
            if(_loc2_._1945 is _13504)
            {
               _loc3_ = (_loc2_._1945 as _13504)._1823;
            }
            else if(_loc2_._1945 is _13508)
            {
               _loc3_ = (_loc2_._1945 as _13508)._1824;
            }
            else if(_loc2_._1945 is _13507)
            {
               _loc3_ = (_loc2_._1945 as _13507)._1826._1760;
            }
            if(_loc3_)
            {
               this._3975._3934(_711.TIMELINE,_712.TIMELINE,[_loc3_]);
            }
         }
      }
      
      private function _4659(param1:TimelineEvent) : void
      {
         var _loc2_:_13547 = param1.data;
         if(_loc2_)
         {
            if(!this._13815._13776(_loc2_.frames))
            {
               this._13815._2986(_loc2_.frames);
            }
         }
      }
      
      private function _4649(param1:MenuNotification) : void
      {
         this.onKey(null);
      }
      
      private function _4606(param1:StageNotification) : void
      {
         this.timeline._4563();
      }
      
      private function _4601(param1:DBModelEvent) : void
      {
         var _loc2_:_753 = null;
         if(this._4656)
         {
            _loc2_ = param1.data as _753;
            if(_loc2_.name == _116.CURVE_PANEL)
            {
               this._4617 = _loc2_.visible;
               this.timeline._4663.selected = this._4617;
            }
         }
      }
      
      private function _13833() : void
      {
         if(this._3918)
         {
            this._4567(null);
         }
         else if(this._3911)
         {
            this._4558(null);
         }
      }
      
      private function _4596() : void
      {
         if(_2220._2873 == _715.ANIMATE && _2220._4000 == _714.STOP || _2220._2873 == _715.GENERAL)
         {
            this.onKey(null);
         }
      }
      
      private function _4641(param1:MouseEvent) : void
      {
         this._4623();
         _2217._1651();
      }
      
      private function onInsertBlankFrame(param1:MouseEvent) : void
      {
         this._3439();
         _2217._1651();
      }
      
      private function _4652(param1:MouseEvent) : void
      {
         this._4617 = !this.timeline._4663.selected;
         if(this._4617)
         {
            _1567(new CommandNotification(CommandNotification.CLOSE_PANEL,_116.CURVE_PANEL));
         }
         else
         {
            _1567(new CommandNotification(CommandNotification.OPEN_PANEL,_116.CURVE_PANEL));
         }
      }
      
      private function _11363(param1:MouseEvent) : void
      {
         _1567(new TimelineNotification(TimelineNotification.ADJUST_CHANGE));
      }
      
      private function _11609(param1:MouseEvent) : void
      {
         _1567(new TimelineNotification(TimelineNotification.DELETE_UNNECESSARY_FRAMES));
      }
      
      private function onKey(param1:MouseEvent) : void
      {
         if(!this.timeline)
         {
            return;
         }
         if(this._4589())
         {
            _1567(new TimelineNotification(TimelineNotification.ADD_KEY));
         }
      }
      
      private function _10750(param1:TimelineNotification) : void
      {
         if(!this.timeline)
         {
            return;
         }
         if(this._10749())
         {
            _1567(new TimelineNotification(TimelineNotification.ADD_KEY));
         }
      }
      
      private function _4611(param1:TimelineEvent) : void
      {
         _1567(new TimelineNotification(TimelineNotification.ONION_CHANGE,param1.data));
      }
      
      private function _4316(param1:TimelineEvent) : void
      {
         _1567(new TimelineNotification(TimelineNotification.SCALE_CHANGE,param1.data));
      }
      
      private function _4613(param1:TimelineEvent) : void
      {
         _1567(new TimelineNotification(TimelineNotification.FRAME_RATE_CHANGE,param1.data));
      }
      
      private function _4654(param1:TimelineEvent) : void
      {
         _1567(new TimelineNotification(TimelineNotification.FRAME_CHANGE,param1.data));
      }
      
      private function _4629(param1:TimelineEvent) : void
      {
         this._2209._3151();
         this._10708();
         _1567(new TimelineNotification(TimelineNotification.UPDATE,param1.data));
      }
      
      public function _10708() : void
      {
         var _loc1_:_13509 = null;
         var _loc2_:int = 0;
         var _loc3_:_13491 = null;
         var _loc4_:_13491 = null;
         var _loc5_:Array = null;
         var _loc6_:Array = null;
         if(this._3896 && this._3896._1992 && Boolean(this._3896._1992._10657))
         {
            _loc1_ = this._3896._1992._10657;
            _loc2_ = this.timeline.curFrame;
            _loc3_ = _loc1_.getFrameByIndex(_loc2_) as _13491;
            if(this._3896._1992.rootArmatureData)
            {
               _loc5_ = this._3896._1992.rootArmatureData._10662;
            }
            if(Boolean(_loc3_) && _loc5_ == null)
            {
               _loc5_ = _loc3_._13637;
            }
            if(_loc2_ >= 0)
            {
               _loc4_ = _loc1_._1938(_loc2_ - 1) as _13491;
               if(_loc4_ == null && _loc2_ > _loc1_.duration)
               {
                  _loc4_ = _loc1_._1816[_loc1_._1816.length - 1];
               }
               if(_loc4_)
               {
                  _loc6_ = _loc4_._13637;
               }
               else if(this._3896._1992.rootArmatureData)
               {
                  _loc6_ = this._3896._1992.rootArmatureData._10658;
               }
            }
            else if(this._3896._1992.rootArmatureData)
            {
               _loc6_ = this._3896._1992.rootArmatureData._10658;
            }
            if(Boolean(_loc5_) && Boolean(_loc6_))
            {
               _1567(new TimelineNotification(TimelineNotification.UPDATE_ZORDER,{
                  "_10659":_loc5_,
                  "prevZOrder":_loc6_
               }));
            }
            else
            {
               _1567(new TimelineNotification(TimelineNotification.UPDATE_ZORDER));
            }
         }
      }
      
      protected function _14588(param1:StageNotification) : void
      {
         if(_2220._2873 == _715.ANIMATE)
         {
            this._14594 = false;
            this._4556();
         }
      }
      
      protected function _4548(param1:StageNotification) : void
      {
         if(param1.data != "noFresh")
         {
            this._14594 = true;
            this._4556();
         }
      }
      
      protected function _4571(param1:TimelineEvent) : void
      {
         if(_12462.getInstance().timelineFilter)
         {
            return;
         }
         var _loc2_:_13548 = param1.data as _13548;
         this._13818(_loc2_);
      }
      
      protected function _13818(param1:_13548) : void
      {
         var _loc4_:_13510 = null;
         var _loc5_:_13510 = null;
         var _loc2_:_13510 = !!param1 ? param1._1945 : null;
         var _loc3_:Array = [];
         if(_loc2_)
         {
            if(_loc2_ is _13504)
            {
               if((_loc2_ as _13504)._1823)
               {
                  _loc3_.push((_loc2_ as _13504)._1823);
               }
            }
            else if(_loc2_ is _13508)
            {
               if((_loc2_ as _13508)._1824)
               {
                  _loc3_.push((_loc2_ as _13508)._1824);
               }
            }
            else if(_loc2_ is _13507)
            {
               if((_loc2_ as _13507)._1826)
               {
                  _loc3_.push((_loc2_ as _13507)._1826);
               }
            }
            else if(_loc2_ is _13506)
            {
               _loc5_ = _loc2_;
            }
            else if(_loc2_ is _14035)
            {
               if((_loc2_ as _14035)._2942.target)
               {
                  _loc3_.push((_loc2_ as _14035)._2942.target);
               }
            }
            else
            {
               switch(_loc2_.flag)
               {
                  case _13510.FLAG_TRANSLATE:
                  case _13510.FLAG_SCALE:
                  case _13510.FLAG_ROTATE:
                     _loc4_ = _loc2_.parent;
                     break;
                  case _13510.FLAG_COLOR:
                  case _13510.FLAG_DISPLAY_INDEX:
                  case _13510.FLAG_VISIBLE:
                     _loc4_ = _loc2_.parent;
               }
               if(_loc4_ is _13504)
               {
                  if((_loc4_ as _13504)._1823)
                  {
                     _loc3_.push((_loc4_ as _13504)._1823);
                  }
               }
               else if(_loc4_ is _13508)
               {
                  if((_loc4_ as _13508)._1824)
                  {
                     _loc3_.push((_loc4_ as _13508)._1824);
                  }
               }
            }
            this._4588 = true;
            if(Shortcut._1677())
            {
               _2226._13772(_loc3_);
            }
            else
            {
               _2226._2889 = _loc3_;
            }
            if(_loc5_)
            {
               if(Shortcut._1677())
               {
                  this._13796._3875(null,_loc5_);
               }
               else
               {
                  this._13796._2986(null,_loc5_);
               }
            }
            this._4588 = false;
            if(_loc3_.length > 0)
            {
               switch(_loc2_.flag)
               {
                  case _13510.FLAG_TRANSLATE:
                     _1567(new StageNotification(StageNotification.CHANGE_TRANSFORM_MODEL,_599.TRANSFORM_TRANSLATE));
                     break;
                  case _13510.FLAG_SCALE:
                     _1567(new StageNotification(StageNotification.CHANGE_TRANSFORM_MODEL,_599.TRANSFORM_SCALE));
                     break;
                  case _13510.FLAG_ROTATE:
                     _1567(new StageNotification(StageNotification.CHANGE_TRANSFORM_MODEL,_599.TRANSFORM_ROTATE));
                     break;
                  case _13510.FLAG_COLOR:
                  case _13510.FLAG_DISPLAY_INDEX:
                     if(Shortcut._1677())
                     {
                        this._13796._3875(null,_loc2_);
                     }
                     else
                     {
                        this._14590(_loc2_);
                     }
               }
            }
         }
      }
      
      private function _14590(param1:_13510) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:Vector.<_13510> = new Vector.<_13510>();
         var _loc5_:String = param1.flag == _13510.FLAG_COLOR ? _13510.FLAG_DISPLAY_INDEX : _13510.FLAG_COLOR;
         _loc3_ = 0;
         _loc4_ = int(this._13796._2889.length);
         while(_loc3_ < _loc4_)
         {
            if(!(this._13796._2889[_loc3_].parent == param1.parent && this._13796._2889[_loc3_].flag == _loc5_))
            {
               _loc2_.push(this._13796._2889[_loc3_]);
            }
            _loc3_++;
         }
         if(_loc2_.indexOf(param1) == -1)
         {
            _loc2_.push(param1);
         }
         this._13796._2986(_loc2_);
      }
      
      protected function _10349(param1:TimelineEvent) : void
      {
         var _loc3_:_13548 = null;
         if(this._11632)
         {
            if(Boolean(this.timeline) && Boolean(this.timeline.stage))
            {
               if(this._12630 || this.timeline._12631(this.timeline.stage.mouseX,this.timeline.stage.mouseY))
               {
                  this._12630 = false;
                  if(this.timeline)
                  {
                     this.timeline._4552.selectedIndex = -1;
                  }
                  return;
               }
            }
         }
         this._12630 = false;
         var _loc2_:Vector.<Object> = param1.data as Vector.<Object>;
         if(_loc2_.length > 0)
         {
            _loc3_ = _loc2_[0] as _13548;
            this._13818(_loc3_);
         }
      }
      
      private function _4630(param1:TimelineEvent) : void
      {
         var _loc2_:Vector.<_13496> = null;
         if(param1.data)
         {
            _loc2_ = (param1.data as _13547).frames.concat();
            if(Shortcut._1677())
            {
               this._13815._3877(_loc2_);
            }
            else
            {
               this._13815._2986(_loc2_);
            }
         }
      }
      
      private function _4094(param1:TimelineEvent) : void
      {
      }
      
      private function _4614(param1:TimelineEvent) : void
      {
         var _loc2_:int = int(param1.data);
      }
      
      private function _4615(param1:TimelineEvent) : void
      {
         this._13815._3024();
      }
      
      public function _13832() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:_13496 = null;
         if(this._13815._3915)
         {
            _loc1_ = 0;
            _loc1_ = 0;
            _loc2_ = int(this._13815._2889.length);
            while(_loc1_ < _loc2_)
            {
               _loc3_ = this._13815._2889[_loc1_];
               if(_loc3_ == null || _loc3_.startPos <= 0)
               {
                  return;
               }
               _loc1_++;
            }
            if(this.timeline)
            {
               this.timeline._6857(-1);
            }
            this._4643(this._13815._2889,-1);
         }
      }
      
      public function _13828() : void
      {
         if(this._13815._3915)
         {
            if(this.timeline)
            {
               this.timeline._6857(1);
            }
            this._4643(this._13815._2889,1);
         }
      }
      
      private function _4648(param1:TimelineEvent) : void
      {
         if(this._13815._2889.length > 0)
         {
            this._4643(this._13815._2889,int(param1.data));
         }
      }
      
      private function _4640(param1:TimelineEvent) : void
      {
         if(this._13815._2889.length > 0)
         {
            this._4609(this._13815._2889);
         }
      }
      
      private function _3921(param1:Vector.<_13496>, param2:int) : void
      {
         var _loc3_:Boolean = this._13815._3921(param1,param2);
         this.refresh();
         if(_loc3_ && param1.length > 0)
         {
         }
      }
      
      private function _4658(param1:TimelineEvent) : void
      {
         if(this._13815._2889.length > 0)
         {
            this._3919(this._4549._3916,param1.data.delta,param1.data.startIndex,param1.data.endIndex,param1.data.scaleRight);
         }
      }
      
      private function _4631(param1:TimelineEvent) : void
      {
         this._13815._3920();
      }
      
      private function _4660(param1:TimelineEvent) : void
      {
         if(this._13815._2889.length > 0)
         {
            this._3921(this._13815._2889,int(param1.data));
         }
      }
      
      private function _4647(param1:TimelineEvent) : void
      {
         this._13815._3926();
      }
      
      protected function _4566(param1:TimelineEvent) : void
      {
         var _loc3_:_50 = null;
         var _loc4_:_52 = null;
         var _loc5_:_79 = null;
         this._4588 = true;
         var _loc2_:_13548 = param1.data;
         if(_loc2_)
         {
            if(_loc2_._1945 is _13502)
            {
               _loc3_ = (_loc2_._1945 as _13502).rootArmatureData;
               this._2880._3209(_loc3_,"visible",param1.data.visible);
            }
            else if(_loc2_._1945 is _13504)
            {
               _loc4_ = (_loc2_._1945 as _13504)._1823;
               this._2880._3209(_loc4_,"visible",param1.data.visible);
            }
            else if(_loc2_._1945 is _13508)
            {
               _loc5_ = (_loc2_._1945 as _13508)._1824;
               this._2880._3209(_loc5_,"visible",param1.data.visible);
            }
         }
      }
      
      protected function _4579(param1:TimelineEvent) : void
      {
         var _loc3_:_50 = null;
         var _loc4_:_52 = null;
         var _loc5_:_79 = null;
         var _loc2_:_13548 = param1.data;
         if(_loc2_)
         {
            if(_loc2_._1945 is _13502)
            {
               _loc3_ = (_loc2_._1945 as _13502).rootArmatureData;
               this._2880._3209(_loc3_,"selectable",param1.data.locked);
            }
            else if(_loc2_._1945 is _13504)
            {
               _loc4_ = (_loc2_._1945 as _13504)._1823;
               this._2880._3209(_loc4_,"selectable",param1.data.locked);
            }
            else if(_loc2_._1945 is _13508)
            {
               _loc5_ = (_loc2_._1945 as _13508)._1824;
               this._2880._3209(_loc5_,"selectable",param1.data.locked);
            }
            this.timeline._4563();
         }
      }
      
      private function _4616(param1:TimelineEvent) : void
      {
         _1567(new TimelineNotification(TimelineNotification.UPDATE_ANIMATION_DURATION));
         this._3392._4642 = int(param1.data);
      }
      
      private function _13834(param1:TimelineEvent) : void
      {
         this._13815._13775();
      }
      
      private function _4657(param1:TimelineEvent) : void
      {
         var _loc2_:int = int(param1.data.timelineY);
         var _loc3_:int = int(param1.data.timelineHeight);
         var _loc4_:int = int(param1.data.frameStart);
         var _loc5_:int = int(param1.data.frameEnd);
         var _loc6_:Boolean = Boolean(param1.data.isCtrl);
         var _loc7_:int = int(param1.data.id);
         var _loc8_:Boolean = this._13815._3900(_loc4_,_loc5_,_loc2_,_loc3_,_loc7_,_loc6_);
         this._4603 = !_loc8_;
         this._12630 = true;
      }
      
      private function _4639(param1:TimelineEvent) : void
      {
         var e:TimelineEvent = param1;
         if(this._4603)
         {
            this.timeline._4655();
         }
         setTimeout(function():void
         {
            _12630 = false;
         },1);
      }
      
      private function _4604(param1:MouseEvent) : void
      {
         this._4608 = true;
         if(this._4638)
         {
            _14.setCursor(_12.CURSOR_DRAG_HAND_FORKEY,3);
         }
      }
      
      private function _4607(param1:MouseEvent) : void
      {
         this._4608 = false;
         if(this._4638)
         {
            _14._1602(_12.CURSOR_DRAG_HAND_FORKEY);
         }
      }
      
      private function _4646() : void
      {
         var _loc1_:_466 = null;
         if(this._4549._3915)
         {
            this._4549._3024();
            if(this._3896 && this._3896._1992 && Boolean(this.timeline))
            {
               this.timeline._4637();
            }
            _loc1_ = new _466();
            _1567(new CommandNotification(CommandNotification.SELECT_FRAME,_loc1_));
         }
      }
      
      public function _4626(param1:Array, param2:Boolean = true) : void
      {
         this._4549._3892(param1,param2);
         this._4625();
      }
      
      public function _4625(param1:Boolean = false) : void
      {
         var _loc2_:_466 = new _466();
         _1567(new CommandNotification(CommandNotification.SELECT_FRAME,_loc2_));
         if(!param1)
         {
            this.timeline._3024();
         }
         this._4549._3893();
         this.timeline._3898(this._4549._3910);
         if(this._4549._3915)
         {
            if(this._4549._3929)
            {
               this._4645();
            }
         }
         this._4564();
      }
      
      protected function _4564() : void
      {
         _1567(new TimelineNotification(TimelineNotification.SELECT_FRAMES,this._13815._2889));
      }
      
      private function _4645() : void
      {
      }
      
      public function _4643(param1:Vector.<_13496>, param2:int) : void
      {
         var _loc3_:_13496 = null;
         var _loc4_:_13510 = null;
         var _loc5_:Dictionary = new Dictionary();
         var _loc6_:int = 0;
         var _loc7_:int = int(param1.length);
         while(_loc6_ < _loc7_)
         {
            _loc3_ = param1[_loc6_];
            _loc4_ = _loc3_.parent;
            if(_loc4_ != null)
            {
               if(_loc5_[_loc4_] == null)
               {
                  _loc5_[_loc4_] = [];
               }
               _loc5_[_loc4_].push(_loc3_);
            }
            _loc6_++;
         }
         var _loc8_:_458;
         (_loc8_ = new _458())._3448 = _loc5_;
         _loc8_.delta = param2;
         _1567(new CommandNotification(CommandNotification.MOVE_MUTI_FRAME,_loc8_));
      }
      
      public function _2891(param1:Boolean = true) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         if(param1 && Boolean(this.timeline))
         {
            if(Boolean(this.timeline._4569) && Boolean(this.timeline._4569._2490))
            {
               _loc2_ = this.timeline._4569._2490.verticalScrollPosition;
            }
            if(Boolean(this.timeline._4552) && Boolean(this.timeline._4552._2490))
            {
               _loc3_ = this.timeline._4552._2490.verticalScrollPosition;
            }
            if(Boolean(this.timeline._4551) && Boolean(this.timeline._4551._2490))
            {
               _loc4_ = this.timeline._4551._2490.verticalScrollPosition;
            }
         }
         this._4581.refresh();
         if(param1 && Boolean(this.timeline))
         {
            if(Boolean(this.timeline._4569) && Boolean(this.timeline._4569._2490))
            {
               this.timeline._4569._2449();
               this.timeline._4569._2490.verticalScrollPosition = _loc2_;
            }
            if(Boolean(this.timeline._4552) && Boolean(this.timeline._4552._2490))
            {
               this.timeline._4552._2449();
               this.timeline._4552._2490.verticalScrollPosition = _loc3_;
            }
            if(Boolean(this.timeline._4551) && Boolean(this.timeline._4551._2490))
            {
               this.timeline._4551._2449();
               this.timeline._4551._2490.verticalScrollPosition = _loc4_;
            }
         }
      }
      
      public function refresh() : void
      {
         this.timeline._4637();
         this.timeline._3173();
      }
      
      public function _4609(param1:Vector.<_13496>) : void
      {
         var _loc2_:_13496 = null;
         var _loc3_:_690 = null;
         var _loc4_:_13510 = null;
         var _loc5_:Dictionary = new Dictionary();
         var _loc6_:int = 0;
         var _loc7_:int = int(param1.length);
         while(_loc6_ < _loc7_)
         {
            _loc2_ = param1[_loc6_];
            _loc4_ = _loc2_.parent;
            if(_loc4_ != null)
            {
               if(_loc5_[_loc4_] == null)
               {
                  _loc5_[_loc4_] = [];
               }
               _loc5_[_loc4_].push({
                  "frame":_loc2_,
                  "moveTo":_loc2_._1917,
                  "origin":_loc2_.startPos
               });
            }
            _loc6_++;
         }
         this._13815._3922();
         var _loc8_:_458;
         (_loc8_ = new _458())._3448 = _loc5_;
         _1567(new CommandNotification(CommandNotification.SCALE_MUTI_FRAME,_loc8_));
      }
      
      private function _3919(param1:Array, param2:int, param3:int, param4:int, param5:Boolean) : void
      {
         var _loc6_:Boolean = this._13815._3927(param2,param5);
         this.refresh();
         if(_loc6_ && this._4549._3915)
         {
         }
      }
      
      public function _4556() : void
      {
         var _loc2_:_39 = null;
         var _loc3_:int = 0;
         var _loc1_:Array = _2226._2889.concat();
         var _loc4_:int = int(_loc1_.length);
         this._4618(_loc1_);
         if(this._3896)
         {
            this._2986(_loc1_);
         }
         if(Boolean(this.timeline) && !this.timeline._12629)
         {
            this.timeline._3446();
         }
      }
      
      protected function _4618(param1:Array) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = int(param1.length);
         while(_loc2_ < _loc3_)
         {
            if(param1[_loc2_] is _70)
            {
               if((param1[_loc2_] as _70).type != _74.MESH)
               {
                  param1[_loc2_] = (param1[_loc2_] as _70)._1760;
               }
            }
            _loc2_++;
         }
      }
      
      protected function _11634(param1:Array) : Vector.<_52>
      {
         var _loc5_:_79 = null;
         var _loc2_:Vector.<_52> = new Vector.<_52>();
         var _loc3_:int = 0;
         var _loc4_:int = int(param1.length);
         while(_loc3_ < _loc4_)
         {
            if(param1[_loc3_] is _79)
            {
               if((param1[_loc3_] as _79).parentBoneData)
               {
                  _loc2_.push((param1[_loc3_] as _79).parentBoneData);
               }
            }
            else if(param1[_loc3_] is _70)
            {
               _loc5_ = (param1[_loc3_] as _70)._1760;
               if((Boolean(_loc5_)) && _loc5_.parentBoneData != null)
               {
                  _loc2_.push(_loc5_.parentBoneData);
               }
            }
            else if(param1[_loc3_] is _52)
            {
               _loc2_.push(param1[_loc3_] as _52);
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      public function _11631(param1:Array, param2:Boolean = false) : void
      {
         var _2889:Array = param1;
         var force:Boolean = param2;
         if(this._11632 && _2220._2873 == _715.ANIMATE && (!this._13842 || force))
         {
            if(!(_2889.length == 1 && _2889[0] is _39))
            {
               this._13827 = this._11634(_2889);
               this._3896._11633(this._13827);
            }
            this._2891(true);
            if(this.timeline)
            {
               setTimeout(function():void
               {
                  if(timeline)
                  {
                     timeline._6848();
                  }
               },1);
            }
         }
         else if(this._11632 && _2220._2873 == _715.ANIMATE && this._13842)
         {
            if(!(this._15584.length == 1 && this._15584[0] is _39))
            {
               this._13827 = this._11634(this._15584);
               this._3896._11633(this._13827);
            }
            this._2891(true);
            if(this.timeline)
            {
               setTimeout(function():void
               {
                  timeline._6848();
               },1);
            }
         }
      }
      
      protected function _2986(param1:Array) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:Object = null;
         var _loc5_:_13502 = null;
         var _loc6_:_13504 = null;
         var _loc7_:_14035 = null;
         var _loc8_:_13508 = null;
         var _loc9_:_13507 = null;
         var _loc11_:_13548 = null;
         var _loc12_:_13510 = null;
         var _loc13_:int = 0;
         var _loc10_:Vector.<_13510> = new Vector.<_13510>();
         _loc5_ = !!this._3896 ? this._3896._1992 : null;
         if(_loc5_)
         {
            _loc2_ = 0;
            _loc3_ = int(param1.length);
            while(_loc2_ < _loc3_)
            {
               _loc4_ = param1[_loc2_];
               if(_loc4_ is _52)
               {
                  _loc6_ = _loc5_._1873(_loc4_ as _52);
                  if(_loc6_)
                  {
                     _loc10_.push(_loc6_);
                  }
                  _loc7_ = _loc5_._14300(_loc4_ as _52);
                  if(_loc7_)
                  {
                     _loc10_.push(_loc7_);
                  }
               }
               else if(_loc4_ is _79)
               {
                  _loc8_ = _loc5_._1875(_loc4_ as _79);
                  if(_loc8_)
                  {
                     _loc10_.push(_loc8_);
                  }
               }
               else if(_loc4_ is _70)
               {
                  _loc9_ = _loc5_._1881(_loc4_ as _70);
                  if(_loc9_)
                  {
                     _loc10_.push(_loc9_);
                  }
               }
               _loc2_++;
            }
            if(_loc10_.length > 0)
            {
               if(Shortcut._1677())
               {
                  this._13796._3877(_loc10_);
               }
               else
               {
                  this._13796._2986(_loc10_);
               }
            }
            else
            {
               this._13796._3024();
            }
         }
         this._11631(param1);
         this._3870 = param1.filter(this._4547);
         if(this._14594)
         {
            if(!this._4588 && this._13796._2889.length > 0)
            {
               _loc2_ = 0;
               _loc3_ = int(this._13796._2889.length);
               while(_loc2_ < _loc3_)
               {
                  _loc12_ = this._13796._2889[_loc2_];
                  if(_loc12_ is _13504 || _loc12_ is _13508 || _loc12_ is _13507)
                  {
                     _loc11_ = _705._13820(_loc12_);
                     if(_loc11_)
                     {
                        if(_loc12_ is _13504 || _loc12_ is _13508)
                        {
                           this.timeline._4552._4529(_loc11_);
                           this.timeline._4569._4529(_loc11_);
                           this.timeline._4551._4529(_loc11_);
                        }
                        this.timeline._4552._4550(_loc11_);
                        this.timeline._4569._4550(_loc11_);
                        this.timeline._4551._4550(_loc11_);
                     }
                  }
                  _loc2_++;
               }
               if(_loc11_)
               {
                  _loc13_ = this._4581.getItemIndex(_loc11_);
                  this.timeline._4561(_loc13_);
               }
            }
         }
         this._4588 = false;
      }
      
      protected function _4547(param1:Object, param2:int, param3:Array) : Boolean
      {
         return param1 is _52 || param1 is _79 || param1 is _39 || param1 is _70 || param1 is _10599;
      }
      
      public function get _13778() : Boolean
      {
         return false;
      }
      
      public function get _4580() : int
      {
         var _loc1_:Object = null;
         var _loc2_:_13510 = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(this._3896 != null && this._3896._1992 != null && this._13796._2889.length > 0)
         {
            if(this._3870)
            {
               _loc3_ = 0;
               _loc4_ = int(this._3870.length);
               while(_loc3_ < _loc4_)
               {
                  _loc1_ = this._3870[_loc3_];
                  if(_loc1_ is _52)
                  {
                     if(_52(_loc1_)._2002 != null)
                     {
                        return 2;
                     }
                  }
                  if(_loc1_ is _79)
                  {
                     if(this._2209._3774(_loc1_ as _79))
                     {
                        return 2;
                     }
                  }
                  if(_loc1_ is _70)
                  {
                     if(this._2209._3773(_loc1_ as _70))
                     {
                        return 2;
                     }
                  }
                  _loc3_++;
               }
            }
            _loc3_ = 0;
            _loc4_ = int(this._13796._2889.length);
            if(_loc3_ < _loc4_)
            {
               _loc2_ = this._13796._2889[_loc3_];
               if(_loc2_.getFrameByIndex(this.timeline.curFrame) == null)
               {
                  return 0;
               }
               return 1;
            }
         }
         return -1;
      }
      
      public function get _10748() : int
      {
         if(this._3896 != null && this._3896._1992 != null)
         {
            if(this._2209._10736(this._3896._1992.rootArmatureData))
            {
               return 2;
            }
            if(Boolean(this._3896._1992._10657) && this._3896._1992._10657.getFrameByIndex(this.timeline.curFrame) != null)
            {
               return 1;
            }
         }
         return -1;
      }
      
      public function get _3918() : Boolean
      {
         var _loc1_:int = 0;
         var _loc2_:_13510 = null;
         var _loc3_:_13496 = null;
         if(this.timeline)
         {
            _loc1_ = this.timeline.curFrame;
            if(this._13796._2889.length > 0)
            {
               _loc2_ = this._13796._2889[0];
               if(_loc2_ is _13504)
               {
                  _loc3_ = (_loc2_ as _13504)._13581._11281(_loc1_);
                  if(_loc3_ && _loc3_._13663 && !_loc3_._13642 && _loc2_._1816[_loc2_._1816.length - 1] != _loc3_)
                  {
                     return true;
                  }
               }
            }
         }
         return false;
      }
      
      public function get _3911() : Boolean
      {
         var _loc1_:int = 0;
         var _loc2_:_13510 = null;
         var _loc3_:_13496 = null;
         if(this.timeline)
         {
            _loc1_ = this.timeline.curFrame;
            if(this._13796._2889.length > 0)
            {
               _loc2_ = this._13796._2889[0];
               if(_loc2_ is _13504)
               {
                  _loc3_ = (_loc2_ as _13504)._13581._11281(_loc1_);
                  if(_loc3_ && _loc3_._13663 && _loc3_._13642 && _loc2_._1816[_loc2_._1816.length - 1] != _loc3_)
                  {
                     return true;
                  }
               }
            }
         }
         return false;
      }
      
      public function get _3915() : Boolean
      {
         return this._13815._2889.length > 0;
      }
      
      public function get _3907() : Boolean
      {
         return this._13815._3907;
      }
      
      public function get _3913() : Boolean
      {
         return this._13815._3913;
      }
      
      public function _11628() : void
      {
         var _loc1_:Boolean = false;
         var _loc4_:_460 = null;
         var _loc2_:_13502 = this._3896._1992;
         var _loc3_:Dictionary = _loc2_._13669();
         if(_loc3_)
         {
            (_loc4_ = new _460())._3429 = _loc3_;
            _1567(new CommandNotification(CommandNotification.DEL_FRAMES,_loc4_));
         }
      }
      
      public function _4600() : void
      {
         var _loc1_:Dictionary = null;
         var _loc2_:_460 = null;
         if(this._13815._3915)
         {
            _loc1_ = this._13815._3904();
            _loc2_ = new _460();
            _loc2_._3429 = _loc1_;
            _1567(new CommandNotification(CommandNotification.DEL_FRAMES,_loc2_));
         }
      }
      
      public function _4610() : void
      {
         var _loc1_:Vector.<_13496> = this._13815._2889.concat();
         _1567(new CommandNotification(CommandNotification.COPY_FRAME,_loc1_));
      }
      
      public function _4619() : void
      {
         this._4610();
         this._4600();
      }
      
      public function _14591() : void
      {
         var _loc1_:Vector.<_13496> = null;
         var _loc2_:Vector.<_13496> = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:_13496 = null;
         var _loc6_:_13510 = null;
         var _loc8_:Array = null;
         var _loc9_:_52 = null;
         var _loc10_:Array = null;
         var _loc11_:_79 = null;
         var _loc12_:Array = null;
         var _loc13_:_52 = null;
         var _loc14_:int = 0;
         var _loc15_:_13508 = null;
         var _loc7_:_13502 = this._3896._1992;
         if(_213._3437._14382() && _2226._14529() && _2226._3862.length > 0)
         {
            _loc8_ = _2226._3862;
            _loc2_ = new Vector.<_13496>();
            _loc3_ = 0;
            while(_loc3_ < _loc8_.length)
            {
               _loc9_ = _loc8_[_loc3_] as _52;
               _loc1_ = _213._3437._2845(this.timeline.curFrame);
               _loc4_ = 0;
               while(_loc4_ < _loc1_.length)
               {
                  _loc5_ = _loc1_[_loc4_].clone();
                  if(_loc5_)
                  {
                     _loc6_ = this._14585(_loc5_,_loc7_,_loc9_);
                     if(_loc6_)
                     {
                        _loc5_.parent = _loc6_;
                        _loc2_.push(_loc5_);
                     }
                  }
                  _loc4_++;
               }
               _loc3_++;
            }
            if(Boolean(_loc2_) && _loc2_.length > 0)
            {
               this._14584(_loc2_);
            }
            return;
         }
         if(_213._3437._14383() && _2226._14509() && _2226._3863.length > 0)
         {
            _loc10_ = _2226._3863;
            _loc2_ = new Vector.<_13496>();
            _loc3_ = 0;
            while(_loc3_ < _loc10_.length)
            {
               _loc11_ = _loc10_[_loc3_];
               _loc1_ = _213._3437._2845(this.timeline.curFrame);
               _loc4_ = 0;
               while(_loc4_ < _loc1_.length)
               {
                  _loc5_ = _loc1_[_loc4_].clone();
                  if(_loc5_)
                  {
                     if(_loc5_ is _13495)
                     {
                        this._14587(_loc5_,_loc11_);
                     }
                     _loc6_ = this._14586(_loc5_,_loc7_,_loc11_);
                     if(_loc6_)
                     {
                        _loc5_.parent = _loc6_;
                        _loc2_.push(_loc5_);
                     }
                  }
                  _loc4_++;
               }
               _loc3_++;
            }
            if(Boolean(_loc2_) && _loc2_.length > 0)
            {
               this._14584(_loc2_);
            }
            return;
         }
         if(_2226._14530() && _213._3437._14384())
         {
            _loc12_ = _2226._14528;
            _loc2_ = new Vector.<_13496>();
            _loc3_ = 0;
            while(_loc3_ < _loc12_.length)
            {
               _loc13_ = _loc12_[_loc3_];
               _loc1_ = _213._3437._2845(this.timeline.curFrame);
               _loc4_ = 0;
               while(_loc4_ < _loc1_.length)
               {
                  _loc5_ = _loc1_[_loc4_].clone();
                  if(_loc5_)
                  {
                     _loc6_ = _loc7_._14300(_loc13_);
                     if(_loc6_)
                     {
                        _loc5_.parent = _loc6_;
                        _loc2_.push(_loc5_);
                     }
                  }
                  _loc4_++;
               }
               _loc3_++;
            }
            if(Boolean(_loc2_) && _loc2_.length > 0)
            {
               this._14584(_loc2_);
            }
            return;
         }
         if(_213.project == _2214._1844)
         {
            _loc1_ = _213._3437._2845(this.timeline.curFrame);
            _loc2_ = new Vector.<_13496>();
            _loc14_ = int(_loc1_.length);
            _loc3_ = 0;
            while(_loc3_ < _loc14_)
            {
               _loc5_ = _loc1_[_loc3_].clone();
               if(_loc5_)
               {
                  _loc6_ = this._14028(_loc5_,_loc7_);
                  if(_loc6_)
                  {
                     _loc5_.parent = _loc6_;
                     _loc2_.push(_loc5_);
                  }
               }
               _loc3_++;
            }
            if(Boolean(_loc2_) && _loc2_.length > 0)
            {
               this._14584(_loc2_);
            }
         }
         else
         {
            _loc1_ = _213._3437._2845(this.timeline.curFrame);
            _loc2_ = new Vector.<_13496>();
            _loc14_ = int(_loc1_.length);
            _loc3_ = 0;
            while(_loc3_ < _loc14_)
            {
               _loc5_ = _loc1_[_loc3_].clone();
               if(_loc5_)
               {
                  _loc6_ = this._14589(_loc5_,_loc7_);
                  if(_loc5_ is _13495)
                  {
                     if(Boolean(_loc6_) && _loc6_.parent is _13508)
                     {
                        _loc15_ = _loc6_.parent as _13508;
                        _loc11_ = _loc15_._1824;
                        this._14587(_loc5_,_loc11_);
                     }
                  }
                  if(_loc6_)
                  {
                     _loc5_.parent = _loc6_;
                     _loc2_.push(_loc5_);
                  }
               }
               _loc3_++;
            }
            if(Boolean(_loc2_) && _loc2_.length > 0)
            {
               this._14584(_loc2_);
            }
         }
      }
      
      private function _14587(param1:_13496, param2:_79) : void
      {
         var _loc3_:_13495 = null;
         var _loc4_:_79 = null;
         var _loc5_:int = 0;
         var _loc6_:Array = null;
         _loc3_ = param1 as _13495;
         _loc4_ = (_loc3_.parent.parent as _13508)._1824;
         if(_loc4_)
         {
            _loc5_ = _loc3_._13613 == null ? -1 : _loc3_._13613.displayIndex;
            _loc6_ = param2._1715;
            if(_loc5_ < 0 || _loc6_.length == 0)
            {
               _loc3_.value = null;
            }
            else if(_loc5_ >= 0)
            {
               if(_loc5_ <= _loc6_.length - 1)
               {
                  _loc3_.value = _loc6_[_loc5_];
               }
               else
               {
                  _loc3_.value = _loc6_[0];
               }
            }
         }
      }
      
      private function _14584(param1:Vector.<_13496>) : void
      {
         var _loc2_:_435 = new _435();
         var _loc3_:_13502 = this._3896._1992;
         _loc2_._1992 = _loc3_;
         _loc2_.frames = param1;
         _1567(new CommandNotification(CommandNotification.PASTE_FRAMES,_loc2_));
      }
      
      public function _4546() : void
      {
         var _loc3_:_13510 = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc8_:Vector.<_13496> = null;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:_13496 = null;
         var _loc13_:_13510 = null;
         var _loc1_:_435 = new _435();
         var _loc2_:Vector.<_13510> = new Vector.<_13510>();
         var _loc6_:Vector.<_13510> = new Vector.<_13510>();
         if(this._13796._2889.length > 0)
         {
            _loc4_ = 0;
            _loc5_ = int(this._13796._2889.length);
            while(_loc4_ < _loc5_)
            {
               _loc3_ = this._13796._2889[_loc4_];
               if(_loc3_.flag != _13510.FLAG_ANIMATION && _loc3_.flag != _13510.FLAG_BONE && _loc3_.flag != _13510.FLAG_SLOT)
               {
                  _loc6_.push(_loc3_);
               }
               _loc4_++;
            }
            if(_loc6_.length > 0)
            {
               _loc3_ = _loc6_[0];
               if(_loc3_.flag != _13510.FLAG_DISPLAY_INDEX && _loc3_.flag != _13510.FLAG_FFD && _213._3437._13698() == _loc3_.flag)
               {
                  _loc2_.push(_loc3_);
                  _loc5_ = int(_loc6_.length);
                  if(_loc5_ > 1)
                  {
                     _loc4_ = 1;
                     while(_loc4_ < _loc5_)
                     {
                        if(_loc6_[_loc4_].flag != _loc3_.flag)
                        {
                           _loc2_ = null;
                           break;
                        }
                        _loc2_.push(_loc6_[_loc4_]);
                        _loc4_++;
                     }
                  }
               }
            }
         }
         var _loc7_:Vector.<_13496> = _213._3437._2845(this.timeline.curFrame);
         var _loc9_:_13502 = this._3896._1992;
         if(Boolean(_loc2_) && _loc2_.length > 0)
         {
            _loc8_ = new Vector.<_13496>();
            _loc4_ = 0;
            _loc5_ = int(_loc2_.length);
            while(_loc4_ < _loc5_)
            {
               _loc13_ = _loc2_[_loc4_];
               _loc10_ = 0;
               _loc11_ = int(_loc7_.length);
               while(_loc10_ < _loc11_)
               {
                  (_loc12_ = _loc4_ == 0 ? _loc7_[_loc10_] : _loc7_[_loc10_].clone()).parent = _loc13_;
                  _loc8_.push(_loc12_);
                  _loc10_++;
               }
               _loc4_++;
            }
         }
         else
         {
            _loc8_ = new Vector.<_13496>();
            _loc4_ = 0;
            _loc5_ = int(_loc7_.length);
            while(_loc4_ < _loc5_)
            {
               _loc12_ = _loc7_[_loc4_].clone();
               if(_loc12_)
               {
                  _loc13_ = this._14028(_loc12_,_loc9_);
                  if(_loc13_)
                  {
                     _loc12_.parent = _loc13_;
                     _loc8_.push(_loc12_);
                  }
               }
               _loc4_++;
            }
         }
         if(Boolean(_loc8_) && _loc8_.length > 0)
         {
            _loc1_._1992 = _loc9_;
            _loc1_.frames = _loc8_;
            _1567(new CommandNotification(CommandNotification.PASTE_FRAMES,_loc1_));
         }
      }
      
      private function _14585(param1:_13496, param2:_13502, param3:_52) : _13510
      {
         var _loc4_:_13504 = param2._1873(param3);
         if(_loc4_)
         {
            switch(param1.flag)
            {
               case _13510.FLAG_TRANSLATE:
                  return _loc4_._13581;
               case _13510.FLAG_ROTATE:
                  return _loc4_._13586;
               case _13510.FLAG_SCALE:
                  return _loc4_._13598;
            }
         }
         return null;
      }
      
      private function _14586(param1:_13496, param2:_13502, param3:_79) : _13510
      {
         var _loc4_:_13508 = param2._1875(param3);
         if(_loc4_)
         {
            switch(param1.flag)
            {
               case _13510.FLAG_COLOR:
                  return _loc4_._13599;
               case _13510.FLAG_DISPLAY_INDEX:
                  return _loc4_._13572;
            }
         }
         return null;
      }
      
      private function _14028(param1:_13496, param2:_13502) : _13510
      {
         var _loc3_:_13504 = null;
         var _loc4_:_52 = null;
         var _loc5_:_13508 = null;
         var _loc6_:_79 = null;
         var _loc7_:_13507 = null;
         var _loc8_:_70 = null;
         var _loc9_:_14035 = null;
         if(param1.flag == _13510.FLAG_ROTATE || param1.flag == _13510.FLAG_SCALE || param1.flag == _13510.FLAG_TRANSLATE)
         {
            if(Boolean(param1.parent) && param1.parent.parent is _13504)
            {
               _loc3_ = param1.parent.parent as _13504;
               _loc4_ = _loc3_._1823;
            }
            if(_loc4_)
            {
               _loc3_ = param2._1873(_loc4_);
               if(_loc3_)
               {
                  switch(param1.flag)
                  {
                     case _13510.FLAG_TRANSLATE:
                        return _loc3_._13581;
                     case _13510.FLAG_ROTATE:
                        return _loc3_._13586;
                     case _13510.FLAG_SCALE:
                        return _loc3_._13598;
                  }
               }
            }
            return null;
         }
         if(param1.flag == _13510.FLAG_COLOR || param1.flag == _13510.FLAG_DISPLAY_INDEX)
         {
            if(Boolean(param1.parent) && param1.parent.parent is _13508)
            {
               _loc5_ = param1.parent.parent as _13508;
               _loc6_ = _loc5_._1824;
            }
            if(_loc6_)
            {
               _loc5_ = param2._1875(_loc6_);
               if(_loc5_)
               {
                  switch(param1.flag)
                  {
                     case _13510.FLAG_COLOR:
                        return _loc5_._13599;
                     case _13510.FLAG_DISPLAY_INDEX:
                        return _loc5_._13572;
                  }
               }
            }
            return null;
         }
         if(param1.flag == _13510.FLAG_FFD)
         {
            _loc7_ = param1.parent as _13507;
            if(_loc8_ = _loc7_._1826)
            {
               return param2._1881(_loc8_);
            }
            return null;
         }
         if(param1.flag == _13510.FLAG_EVENT)
         {
            return param2._13597;
         }
         if(param1.flag == _13510.FLAG_ZORDER)
         {
            return param2._10657;
         }
         if(param1.flag == _13510.FLAG_IK)
         {
            _loc9_ = param1.parent as _14035;
            if(_loc9_)
            {
               return _loc9_;
            }
         }
         return null;
      }
      
      private function _14589(param1:_13496, param2:_13502) : _13510
      {
         var _loc3_:_13504 = null;
         var _loc4_:_52 = null;
         var _loc5_:_13508 = null;
         var _loc6_:_79 = null;
         var _loc7_:_13507 = null;
         var _loc8_:_70 = null;
         var _loc9_:_14035 = null;
         if(param1.flag == _13510.FLAG_ROTATE || param1.flag == _13510.FLAG_SCALE || param1.flag == _13510.FLAG_TRANSLATE)
         {
            if(Boolean(param1.parent) && param1.parent.parent is _13504)
            {
               _loc3_ = param1.parent.parent as _13504;
               _loc4_ = _loc3_._1823;
            }
            if(_loc4_)
            {
               _loc3_ = param2._1860(_loc4_.name);
               if(_loc3_)
               {
                  switch(param1.flag)
                  {
                     case _13510.FLAG_TRANSLATE:
                        return _loc3_._13581;
                     case _13510.FLAG_ROTATE:
                        return _loc3_._13586;
                     case _13510.FLAG_SCALE:
                        return _loc3_._13598;
                  }
               }
            }
            return null;
         }
         if(param1.flag == _13510.FLAG_COLOR || param1.flag == _13510.FLAG_DISPLAY_INDEX)
         {
            if(Boolean(param1.parent) && param1.parent.parent is _13508)
            {
               _loc5_ = param1.parent.parent as _13508;
               _loc6_ = _loc5_._1824;
            }
            if(_loc6_)
            {
               _loc5_ = param2._1859(_loc6_.name);
               if(_loc5_)
               {
                  switch(param1.flag)
                  {
                     case _13510.FLAG_COLOR:
                        return _loc5_._13599;
                     case _13510.FLAG_DISPLAY_INDEX:
                        return _loc5_._13572;
                  }
               }
            }
            return null;
         }
         if(param1.flag == _13510.FLAG_FFD)
         {
            _loc7_ = param1.parent as _13507;
            if(_loc8_ = _loc7_._1826)
            {
               return param2._1862(_loc8_.name,_loc8_._1760.name);
            }
            return null;
         }
         if(param1.flag == _13510.FLAG_IK)
         {
            _loc9_ = param1.parent as _14035;
            return param2._14301(_loc9_.name);
         }
         if(param1.flag == _13510.FLAG_EVENT)
         {
            return param2._13597;
         }
         return null;
      }
      
      private function _13841(param1:TimelineNotification) : void
      {
         var _loc3_:Object = null;
         var _loc9_:Object = null;
         if(!this._3870)
         {
            return;
         }
         var _loc2_:Array = [];
         var _loc4_:int = this.timeline.curFrame;
         var _loc5_:_13502 = this._3896._1992;
         var _loc6_:String = param1.data;
         var _loc7_:int = 0;
         var _loc8_:int = int(this._3870.length);
         while(_loc7_ < _loc8_)
         {
            _loc3_ = this._3870[_loc7_];
            if(_loc3_ is _52)
            {
               _loc9_ = this._13822(_loc3_ as _52,_loc4_,_loc5_,_loc6_);
               if(_loc9_)
               {
                  _loc2_.push(_loc9_);
               }
            }
            _loc7_++;
         }
         if(_loc2_.length > 0)
         {
            _1567(new CommandNotification(CommandNotification.ADD_BONE_FRAME,_loc2_));
         }
      }
      
      private function _14593(param1:_52) : Boolean
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(this._13796._2889.length > 0)
         {
            _loc2_ = 0;
            _loc3_ = int(this._13796._2889.length);
            while(_loc2_ < _loc3_)
            {
               if(this._13796._2889[_loc2_].flag == _13510.FLAG_IK)
               {
                  if((this._13796._2889[_loc2_] as _14035)._2942.target == param1)
                  {
                     return true;
                  }
               }
               _loc2_++;
            }
         }
         return false;
      }
      
      public function _4589() : Boolean
      {
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:_52 = null;
         var _loc12_:_79 = null;
         var _loc13_:Object = null;
         var _loc14_:Boolean = false;
         var _loc15_:Object = null;
         var _loc16_:Boolean = false;
         var _loc17_:Object = null;
         var _loc18_:Boolean = false;
         var _loc19_:Boolean = false;
         var _loc20_:Boolean = false;
         var _loc21_:_13507 = null;
         var _loc22_:_14035 = null;
         var _loc23_:Object = null;
         var _loc24_:Object = null;
         var _loc25_:Object = null;
         if(this.timeline == null || this._3896 == null || this._3896._1992 == null || _2220._2873 != _715.ANIMATE)
         {
            return false;
         }
         var _loc1_:_50 = _3028;
         var _loc2_:int = this.timeline.curFrame;
         var _loc3_:_13502 = this._3896._1992;
         var _loc4_:Array = [];
         var _loc5_:Array = [];
         var _loc6_:Array = [];
         var _loc7_:Array = [];
         var _loc8_:Array = [];
         if(_loc1_)
         {
            _loc9_ = 0;
            _loc10_ = int(_loc1_._1779.length);
            for(; _loc9_ < _loc10_; _loc9_++)
            {
               _loc11_ = _loc1_._1779[_loc9_];
               if(!_loc11_)
               {
                  continue;
               }
               if(_loc11_._13657)
               {
                  _loc13_ = this._13822(_loc11_,_loc2_,_loc3_,_13510.FLAG_TRANSLATE);
                  if(_loc13_)
                  {
                     _loc14_ = true;
                     _loc4_.push(_loc13_);
                  }
               }
               if(_loc11_._13658)
               {
                  _loc13_ = this._13822(_loc11_,_loc2_,_loc3_,_13510.FLAG_ROTATE);
                  if(_loc13_)
                  {
                     _loc14_ = true;
                     _loc4_.push(_loc13_);
                  }
               }
               if(_loc11_._13659)
               {
                  _loc13_ = this._13822(_loc11_,_loc2_,_loc3_,_13510.FLAG_SCALE);
                  if(_loc13_)
                  {
                     _loc14_ = true;
                     _loc4_.push(_loc13_);
                  }
               }
               if(!(!_loc14_ && _2226._3871(_loc11_)))
               {
                  continue;
               }
               switch(this._3009._10761)
               {
                  case _599.TRANSFORM_FREE:
                     _loc13_ = this._13822(_loc11_,_loc2_,_loc3_,_13510.FLAG_TRANSLATE);
                     if(_loc13_)
                     {
                        _loc4_.push(_loc13_);
                     }
                     _loc13_ = this._13822(_loc11_,_loc2_,_loc3_,_13510.FLAG_ROTATE);
                     if(_loc13_)
                     {
                        _loc4_.push(_loc13_);
                     }
                     _loc13_ = this._13822(_loc11_,_loc2_,_loc3_,_13510.FLAG_SCALE);
                     if(_loc13_)
                     {
                        _loc4_.push(_loc13_);
                     }
                     break;
                  case _599.TRANSFORM_TRANSLATE:
                     _loc13_ = this._13822(_loc11_,_loc2_,_loc3_,_13510.FLAG_TRANSLATE);
                     if(_loc13_)
                     {
                        _loc4_.push(_loc13_);
                     }
                     break;
                  case _599.TRANSFORM_ROTATE:
                     _loc13_ = this._13822(_loc11_,_loc2_,_loc3_,_13510.FLAG_ROTATE);
                     if(_loc13_)
                     {
                        _loc4_.push(_loc13_);
                     }
                     break;
                  case _599.TRANSFORM_SCALE:
                     _loc13_ = this._13822(_loc11_,_loc2_,_loc3_,_13510.FLAG_SCALE);
                     if(_loc13_)
                     {
                        _loc4_.push(_loc13_);
                     }
                     break;
               }
            }
            _loc9_ = 0;
            _loc10_ = int(_loc1_._1780.length);
            while(_loc9_ < _loc10_)
            {
               _loc12_ = _loc1_._1780[_loc9_];
               if(_loc12_)
               {
                  if(_loc12_._2147)
                  {
                     _loc15_ = this._13824(_loc12_,_loc2_,_loc3_,_13510.FLAG_COLOR);
                     if(_loc15_)
                     {
                        _loc16_ = true;
                        _loc5_.push(_loc15_);
                     }
                  }
                  else if(_loc12_._2149)
                  {
                     _loc15_ = this._13824(_loc12_,_loc2_,_loc3_,_13510.FLAG_DISPLAY_INDEX);
                     if(_loc15_)
                     {
                        _loc16_ = true;
                        _loc6_.push(_loc15_);
                     }
                  }
                  if(_loc12_._2049 && _loc12_._2049._2165 && _loc12_._2049._2094 != null)
                  {
                     _loc17_ = this._13825(_loc12_._2049,_loc2_,_loc3_);
                     if(_loc17_)
                     {
                        _loc16_ = true;
                        _loc7_.push(_loc17_);
                     }
                  }
                  if(!_loc16_)
                  {
                     if(_2226._3871(_loc12_))
                     {
                        _loc18_ = this._13796._14531(_loc12_,_13510.FLAG_COLOR);
                        _loc19_ = this._13796._14531(_loc12_,_13510.FLAG_DISPLAY_INDEX);
                        if(!_loc18_ && !_loc19_)
                        {
                           _loc18_ = true;
                           _loc19_ = true;
                        }
                        if(_loc18_)
                        {
                           _loc15_ = this._13824(_loc12_,_loc2_,_loc3_,_13510.FLAG_COLOR);
                           if(_loc15_)
                           {
                              _loc5_.push(_loc15_);
                           }
                        }
                        if(_loc19_)
                        {
                           _loc15_ = this._13824(_loc12_,_loc2_,_loc3_,_13510.FLAG_DISPLAY_INDEX);
                           if(_loc15_)
                           {
                              _loc6_.push(_loc15_);
                           }
                        }
                     }
                     if(Boolean(_loc12_._2049) && _loc12_._2049._2165)
                     {
                        _loc21_ = _loc12_._2049.mesh._1903;
                        if((Boolean(_loc21_)) && this._13796.isSelected(_loc21_))
                        {
                           _loc20_ = true;
                        }
                        if(_loc20_)
                        {
                           _loc17_ = this._13825(_loc12_._2049,_loc2_,_loc3_);
                           if(_loc17_)
                           {
                              _loc7_.push(_loc17_);
                           }
                        }
                     }
                  }
               }
               _loc9_++;
            }
            if(this._13796._2889.length > 0)
            {
               _loc9_ = 0;
               _loc10_ = int(this._13796._2889.length);
               while(_loc9_ < _loc10_)
               {
                  if(this._13796._2889[_loc9_].flag == _13510.FLAG_IK)
                  {
                     _loc22_ = this._13796._2889[_loc9_] as _14035;
                     if(_loc22_)
                     {
                        _loc23_ = this._14592(_loc22_,_loc2_,_loc3_);
                        if(_loc23_)
                        {
                           _loc8_.push(_loc23_);
                        }
                     }
                  }
                  _loc9_++;
               }
            }
            if(_loc1_._10662)
            {
               _loc24_ = this._13821(_loc3_,_loc2_,_loc1_._10662);
            }
            if(_loc4_.length > 0 || _loc5_.length > 0 || _loc6_.length > 0 || _loc7_.length > 0 || _loc8_.length > 0 || _loc24_ != null)
            {
               (_loc25_ = {})._13726 = _loc4_;
               _loc25_._13727 = _loc5_;
               _loc25_._13725 = _loc6_;
               _loc25_._13729 = _loc7_;
               _loc25_._13728 = _loc24_;
               _loc25_._14424 = _loc8_;
               _1567(new CommandNotification(CommandNotification.ADD_KEY_FRAMES,_loc25_));
            }
         }
         return false;
      }
      
      public function _10749(param1:Array = null) : Boolean
      {
         var _loc2_:Object = null;
         var _loc3_:int = this.timeline.curFrame;
         var _loc4_:_13502 = this._3896._1992;
         var _loc5_:Object = this._13821(_loc4_,_loc3_,param1);
         if(_loc5_)
         {
            _1567(new CommandNotification(CommandNotification.ADD_ZORDER_FRAME,_loc5_));
         }
         return false;
      }
      
      private function _13825(param1:_70, param2:int, param3:_13502) : Object
      {
         var _loc4_:_13507 = null;
         var _loc5_:_13501 = null;
         var _loc6_:Vector.<Number> = null;
         var _loc7_:Object = null;
         if(param1)
         {
            _loc4_ = param3._1881(param1);
            _loc5_ = _loc4_.getFrameByIndex(param2) as _13501;
            _loc6_ = param1._2094;
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
               _loc5_.startPos = param2;
               _loc5_.value = param1._2121.concat();
               _loc7_.newValue = _loc5_.value;
               _loc7_._3005 = true;
            }
            _loc7_._1945 = _loc4_;
            _loc7_._1946 = _loc5_;
            return _loc7_;
         }
         return null;
      }
      
      private function _13824(param1:_79, param2:int, param3:_13502, param4:String) : Object
      {
         var _loc5_:Object = null;
         var _loc6_:_13508 = null;
         var _loc7_:_13510 = null;
         var _loc8_:_13494 = null;
         var _loc9_:_70 = null;
         var _loc10_:_13510 = null;
         var _loc11_:_13495 = null;
         (_loc5_ = {}).frameIndex = param2;
         _loc5_._1992 = param3;
         _loc5_.autoKey = true;
         _loc5_._1837 = param1;
         if(param4 == _13510.FLAG_COLOR)
         {
            _loc5_.newColor = param1._2147;
            _loc6_ = param3._1875(param1);
            if(_loc6_)
            {
               _loc7_ = _loc6_._13599;
               if((_loc8_ = _loc7_.getFrameByIndex(param2) as _13494) == null)
               {
                  _loc5_._3005 = true;
                  (_loc8_ = new _13494()).startPos = param2;
                  _loc8_.tweenType = 1;
                  _loc8_.value = _loc5_.newColor;
               }
               _loc5_._3007 = _loc8_._13601;
               _loc5_._1945 = _loc7_;
               _loc5_._1946 = _loc8_;
               return _loc5_;
            }
         }
         else if(param4 == _13510.FLAG_DISPLAY_INDEX)
         {
            _loc9_ = param1._2049;
            _loc5_._3013 = _loc9_;
            _loc6_ = param3._1875(param1);
            if(_loc6_)
            {
               _loc10_ = _loc6_._13572;
               if((_loc11_ = _loc10_.getFrameByIndex(param2) as _13495) == null)
               {
                  _loc5_._3005 = true;
                  (_loc11_ = new _13495()).startPos = param2;
                  _loc11_.value = !!_loc9_ ? _loc9_._1733 : null;
               }
               _loc5_.oldDisplay = param1._1765[_loc11_._13613];
               _loc5_._1945 = _loc10_;
               _loc5_._1946 = _loc11_;
               return _loc5_;
            }
         }
         return null;
      }
      
      protected function _13822(param1:_52, param2:int, param3:_13502, param4:String) : Object
      {
         var _loc5_:_13504 = null;
         var _loc6_:_13496 = null;
         var _loc7_:_13510 = null;
         _loc5_ = param3._1873(param1);
         var _loc8_:Object;
         (_loc8_ = {}).frameIndex = param2;
         _loc8_._1897 = param1;
         _loc8_._1992 = param3;
         _loc8_._2977 = param1.currentLocalTransform.clone();
         if(_loc5_)
         {
            switch(param4)
            {
               case _13510.FLAG_TRANSLATE:
                  _loc7_ = _loc5_._13581;
                  if((_loc6_ = _loc7_.getFrameByIndex(param2)) == null)
                  {
                     (_loc6_ = new _13498()).startPos = param2;
                     _loc6_.tweenType = 1;
                     _loc8_._3005 = true;
                  }
                  _loc8_._13627 = _loc6_;
                  _loc8_._13581 = _loc7_;
                  break;
               case _13510.FLAG_ROTATE:
                  _loc7_ = _loc5_._13586;
                  if((_loc6_ = _loc7_.getFrameByIndex(param2)) == null)
                  {
                     (_loc6_ = new _13499()).startPos = param2;
                     _loc6_.tweenType = 1;
                     _loc8_._3005 = true;
                  }
                  _loc8_._13710 = _loc6_;
                  _loc8_._13595 = _loc7_;
                  break;
               case _13510.FLAG_SCALE:
                  _loc7_ = _loc5_._13598;
                  if((_loc6_ = _loc7_.getFrameByIndex(param2)) == null)
                  {
                     (_loc6_ = new _13498()).startPos = param2;
                     _loc6_.tweenType = 1;
                     _loc8_._3005 = true;
                  }
                  _loc8_._13631 = _loc6_;
                  _loc8_._13598 = _loc7_;
            }
            return _loc8_;
         }
         return null;
      }
      
      protected function _4559(param1:_52, param2:int, param3:_39, param4:Array) : void
      {
         var _loc5_:_41 = null;
         var _loc6_:BoneFrameVO = null;
         var _loc7_:_86 = null;
         var _loc8_:_445 = null;
         var _loc9_:BoneFrameVO = null;
         var _loc10_:_452 = null;
         _loc5_ = param3._1873(param1);
         if(_loc5_)
         {
            _loc6_ = _loc5_.getFrameByIndex(param2) as BoneFrameVO;
            if(_loc6_)
            {
               _loc7_ = param1.currentLocalTransform.clone();
               _loc7_._1930(param1._1724);
               _loc8_ = _445._1572(_loc6_,_445.TRANSFORM,_loc7_);
               param4.push(_loc8_);
            }
            else
            {
               (_loc9_ = new BoneFrameVO(param1,this._4592)).startPos = param2;
               _loc9_.transform = param1.currentLocalTransform.clone();
               _loc9_.transform._1930(param1._1724);
               (_loc10_ = new _452())._1945 = _loc5_;
               _loc10_._1946 = _loc9_;
               param4.push(_loc10_);
            }
         }
      }
      
      protected function _4560(param1:_79, param2:int, param3:_39, param4:Array) : void
      {
         var _loc5_:_48 = null;
         var _loc6_:_47 = null;
         var _loc7_:_47 = null;
         var _loc8_:_445 = null;
         var _loc9_:_47 = null;
         var _loc10_:_452 = null;
         _loc5_ = param3._1875(param1);
         if(_loc6_ = _loc5_.getFrameByIndex(param2) as _47)
         {
            _loc7_ = new _47(param1,this._4592);
            _loc7_.copyFrom(_loc6_);
            _loc7_._1732 = param1._1923;
            _loc7_.colorTransform.copyFrom(param1._1926);
            _loc7_.gotoAndPlay = param1.currentAnimation;
            _loc8_ = _445._1572(_loc6_,_445.ALL,_loc7_);
            param4.push(_loc8_);
         }
         else
         {
            (_loc9_ = new _47(param1,this._4592)).startPos = param2;
            _loc9_._1732 = param1._1923;
            _loc9_.colorTransform = param1._1926.clone();
            _loc9_.gotoAndPlay = null;
            (_loc10_ = new _452())._1945 = _loc5_;
            _loc10_._1946 = _loc9_;
            param4.push(_loc10_);
         }
      }
      
      protected function _4620(param1:_70, param2:int, param3:_39, param4:Array) : void
      {
         var _loc5_:_43 = null;
         var _loc6_:_42 = null;
         var _loc7_:_42 = null;
         var _loc8_:_445 = null;
         var _loc9_:_42 = null;
         var _loc10_:_452 = null;
         _loc5_ = param3._1881(param1);
         if(_loc6_ = _loc5_.getFrameByIndex(param2) as _42)
         {
            _loc7_ = new _42(param1,this._4592);
            _loc7_.copyFrom(_loc6_);
            _loc7_.ffd = param1._2121.concat();
            _loc8_ = _445._1572(_loc6_,_445.ALL,_loc7_);
            param4.push(_loc8_);
         }
         else
         {
            (_loc9_ = new _42(param1,this._4592)).startPos = param2;
            _loc9_.ffd = param1._2121.concat();
            (_loc10_ = new _452())._1945 = _loc5_;
            _loc10_._1946 = _loc9_;
            param4.push(_loc10_);
         }
      }
      
      public function _4624(param1:Object) : void
      {
         var _loc2_:_70 = null;
         var _loc5_:* = undefined;
         var _loc6_:_13507 = null;
         var _loc7_:_13501 = null;
         if(this.timeline == null || this._3896 == null)
         {
            return;
         }
         var _loc3_:int = this.timeline.curFrame;
         var _loc4_:_13502 = this._3896._1992;
         if((_loc4_) && this._3870 && this._3870.length == 1)
         {
            _loc2_ = this._3870[0] as _70;
            if(_loc2_)
            {
               _loc6_ = _loc4_._1881(_loc2_);
               if(_loc6_ == null)
               {
                  return;
               }
               _loc7_ = _loc6_.getFrameByIndex(_loc3_) as _13501;
               _loc5_ = {};
               if(_loc7_)
               {
                  _loc5_._3005 = false;
                  _loc5_.oldValue = _loc7_.value;
                  _loc5_.newValue = _loc2_._2121.concat();
               }
               else
               {
                  (_loc7_ = new _13501()).tweenType = 1;
                  _loc7_.startPos = _loc3_;
                  _loc7_.value = _loc2_._2121.concat();
                  _loc5_.newValue = _loc7_.value;
                  _loc5_._3005 = true;
               }
               _loc5_._1945 = _loc6_;
               _loc5_._1946 = _loc7_;
               if(_loc5_)
               {
                  _1567(new CommandNotification(CommandNotification.ADD_AUTO_FFD_FRAME,_loc5_));
               }
            }
         }
      }
      
      protected function _11357(param1:_39, param2:int, param3:Array, param4:_45) : void
      {
         var _loc5_:TimelineVOBase = null;
         var _loc6_:_45 = null;
         var _loc7_:_452 = null;
         if(param4 == null)
         {
            return;
         }
         _loc5_ = param1;
         if(!(_loc6_ = _loc5_.getFrameByIndex(param2)))
         {
            (_loc6_ = param4).startPos = param2;
            _loc6_.duration = 0;
            (_loc7_ = new _452())._1945 = param1;
            _loc7_._1946 = _loc6_;
            param3.push(_loc7_);
         }
      }
      
      protected function _4545(param1:_39, param2:int, param3:Array) : void
      {
         var _loc4_:TimelineVOBase = null;
         var _loc5_:_45 = null;
         var _loc6_:_452 = null;
         _loc4_ = param1;
         if(!(_loc5_ = _loc4_.getFrameByIndex(param2)))
         {
            (_loc5_ = new _45(false)).startPos = param2;
            _loc5_.duration = 0;
            (_loc6_ = new _452())._1945 = param1;
            _loc6_._1946 = _loc5_;
            param3.push(_loc6_);
         }
      }
      
      protected function _13821(param1:_13502, param2:int, param3:Array) : Object
      {
         var _loc6_:_13491 = null;
         var _loc7_:Array = null;
         var _loc4_:Object = {};
         var _loc5_:_13509 = param1._10657;
         if(param3 == null)
         {
            _loc7_ = param1.rootArmatureData._10659.concat();
         }
         else
         {
            _loc7_ = param3.concat();
         }
         _loc6_ = _loc5_.getFrameByIndex(param2) as _13491;
         _loc4_._1897 = param1.rootArmatureData;
         _loc4_._1992 = param1;
         _loc4_.frameIndex = param2;
         _loc4_._1945 = _loc5_;
         _loc4_.newValue = _loc7_;
         if(_loc6_ == null)
         {
            (_loc6_ = new _13491()).startPos = param2;
            _loc6_.value = _loc7_;
            _loc4_._3005 = true;
         }
         else
         {
            _loc4_.oldValue = _loc6_._13637;
         }
         _loc4_._1946 = _loc6_;
         return _loc4_;
      }
      
      protected function _14592(param1:_14035, param2:int, param3:_13502) : Object
      {
         var _loc5_:_14034 = null;
         var _loc6_:Number = NaN;
         var _loc7_:int = 0;
         var _loc4_:Object = {};
         var _loc8_:_77 = param1._2942;
         _loc6_ = _loc8_._14311;
         _loc7_ = _loc8_._14310;
         _loc5_ = param1.getFrameByIndex(param2) as _14034;
         _loc4_._1897 = param3.rootArmatureData;
         _loc4_._2942 = _loc8_;
         _loc4_._1992 = param3;
         _loc4_.frameIndex = param2;
         _loc4_._1945 = param1;
         _loc4_._2991 = _loc6_;
         _loc4_._2990 = _loc7_;
         _loc4_.autoKey = true;
         if(_loc5_ == null)
         {
            _loc4_._3005 = true;
            (_loc5_ = new _14034()).tweenType = 1;
            _loc5_.startPos = param2;
            _loc5_.value = _loc6_;
            _loc5_.bend = _loc7_;
         }
         else
         {
            if(_loc6_ == _loc5_.value && _loc7_ == _loc5_.bend)
            {
               return null;
            }
            _loc4_._2992 = _loc5_.value;
            _loc4_._2989 = _loc5_.bend;
         }
         _loc4_._1946 = _loc5_;
         return _loc4_;
      }
      
      protected function _10747(param1:_39, param2:int, param3:Array) : void
      {
      }
      
      public function _4623() : void
      {
         var _loc1_:Dictionary = this._13815._3903();
         var _loc2_:_458 = new _458();
         _loc2_._3448 = _loc1_;
         _loc2_.delta = -1;
         _1567(new CommandNotification(CommandNotification.MOVE_MUTI_FRAME,_loc2_));
      }
      
      public function _3439() : void
      {
         var _loc1_:Dictionary = this._13815._3903();
         var _loc2_:_458 = new _458();
         _loc2_._3448 = _loc1_;
         _loc2_.delta = 1;
         _1567(new CommandNotification(CommandNotification.MOVE_MUTI_FRAME,_loc2_));
      }
      
      private function _13182() : void
      {
         if(this._13185 == null)
         {
            this._13185 = new Timer(this.SPEED_BLANK_TIME);
            this._13185.addEventListener(TimerEvent.TIMER,this._13183);
         }
         this._13185.start();
      }
      
      private function _13179() : void
      {
         if(this._13185)
         {
            this._13185.stop();
            this._13185.reset();
         }
      }
      
      private function _13183(param1:TimerEvent) : void
      {
         if(this._13186)
         {
            this._13178();
         }
         else
         {
            this._13177();
         }
      }
      
      private function _13177() : void
      {
         if(this._3913)
         {
            this._4623();
         }
      }
      
      private function _13178() : void
      {
         if(this._3907)
         {
            this._3439();
         }
      }
      
      public function _3442(param1:int) : void
      {
         this._4549._3442(param1);
      }
      
      protected function get _2209() : _522
      {
         return Context.getInstance()._1568._2209;
      }
      
      protected function get _3392() : _596
      {
         return _1407.getInstance(_596) as _596;
      }
      
      public function _3186() : void
      {
         this._4549._3024();
         this._13815._3024();
         this._4625();
         this.timeline._3446();
      }
      
      private function _4661() : void
      {
         if(_2220._4000 == _714.PLAY)
         {
            return;
         }
      }
      
      protected function set _4644(param1:Boolean) : void
      {
         if(this._4638 == param1)
         {
            return;
         }
         this._4638 = param1;
         if(this._4638)
         {
            stage.addEventListener(KeyboardEvent.KEY_UP,this._4651);
            if(this._4608)
            {
               _14.setCursor(_12.CURSOR_DRAG_HAND_FORKEY,3);
            }
         }
         else
         {
            stage.removeEventListener(KeyboardEvent.KEY_UP,this._4651);
            _14._1602(_12.CURSOR_DRAG_HAND_FORKEY);
         }
         this._4595();
      }
      
      public function get autoTween() : Boolean
      {
         return this._4592;
      }
      
      private function _4651(param1:KeyboardEvent) : void
      {
         if(param1.keyCode == Keyboard.SPACE)
         {
            this._4644 = false;
         }
      }
      
      private function _4595() : void
      {
         if(this.timeline)
         {
            this.timeline.mouseChildren = !this._4638;
         }
      }
      
      public function _1871() : void
      {
      }
      
      public function _4599() : _13510
      {
         if(this._13796._2889.length > 0)
         {
            return this._13796._2889[this._13796._2889.length - 1];
         }
         return null;
      }
      
      public function _3149(param1:Array, param2:int) : void
      {
      }
      
      public function _3140() : void
      {
         if(this.timeline == null)
         {
            return;
         }
         this.timeline._4664.enabled = true;
         this.timeline._4605.enabled = this._3907;
         this.timeline._4635.enabled = this._3913;
         var _loc1_:int = this._4580;
         var _loc2_:int = this._10748;
         switch(_loc1_)
         {
            case 0:
               this.timeline._4667.enabled = true;
               this.timeline._4667.icon = TimelinePanel.ADD_KEY_WHITE;
               break;
            case 1:
               this.timeline._4667.enabled = true;
               this.timeline._4667.icon = TimelinePanel.ADD_KEY_RED;
               break;
            case 2:
               this.timeline._4667.enabled = true;
               this.timeline._4667.icon = TimelinePanel.ADD_KEY_YELLOW;
               break;
            default:
               this.timeline._4667.enabled = false;
               this.timeline._4667.icon = TimelinePanel.ADD_KEY_WHITE;
         }
         _1567(new TimelineNotification(TimelineNotification.UPDATE_KEY_STATUS,this.timeline.curFrame));
         _1567(new TimelineNotification(TimelineNotification.UPDATE_ZORDER_KEY_STATUS,_loc2_));
      }
      
      public function _3132() : void
      {
      }
      
      public function _3015() : void
      {
      }
      
      public function _4621() : void
      {
         if(this.timeline)
         {
            this.timeline._4602(0);
         }
      }
      
      public function _11324() : _13491
      {
         var _loc1_:int = 0;
         var _loc2_:_13502 = null;
         var _loc3_:_13506 = null;
         var _loc4_:_13491 = null;
         if(this.timeline)
         {
            _loc1_ = this.timeline.curFrame;
            if(this._3896)
            {
               _loc2_ = this._3896._1992;
               _loc3_ = _loc2_._13597;
               return _loc3_.getFrameByIndex(_loc1_) as _13491;
            }
         }
         return null;
      }
      
      public function _11358() : Array
      {
         return this._4549._3916.concat();
      }
      
      protected function get _2880() : _571
      {
         return _1407.getInstance(_571) as _571;
      }
      
      protected function get _4627() : _663
      {
         return (_1407.getInstance(_577) as _577)._4627;
      }
      
      private function get _3975() : _540
      {
         return _1407.getInstance(_540) as _540;
      }
      
      public function get adjusting() : Boolean
      {
         return this._11361;
      }
      
      public function get _11632() : Boolean
      {
         return _12462.getInstance().timelineFilter;
      }
      
      public function set _11632(param1:Boolean) : void
      {
         if(param1 != this._11632)
         {
            _12462.getInstance().timelineFilter = param1;
            if(!this._11632)
            {
               this._13842 = false;
               if(this._3896)
               {
                  this._3896._13785();
               }
               this._2891(false);
            }
            this._4556();
         }
      }
      
      public function get _13842() : Boolean
      {
         return this._13838;
      }
      
      public function set _13842(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(this._13838 != param1)
         {
            this._13838 = param1;
            _1567(new TimelineNotification(TimelineNotification.FILTER_LOCK_CHANGE,this._13838));
            this._15584 = [];
            _loc2_ = 0;
            while(_loc2_ < this._3870.length)
            {
               this._15584.push(this._3870[_loc2_]);
               _loc2_++;
            }
         }
      }
      
      public function _13830() : void
      {
         if(this.timeline)
         {
            this.timeline._13830();
         }
      }
      
      public function _13702(param1:_52, param2:String) : Vector.<_13496>
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:_13496 = null;
         var _loc6_:Vector.<_13496> = new Vector.<_13496>();
         _loc3_ = 0;
         _loc4_ = int(this._13815._2889.length);
         while(_loc3_ < _loc4_)
         {
            _loc5_ = this._13815._2889[_loc3_];
            if(_loc5_.flag == param2)
            {
               if(_loc5_.parent && _loc5_.parent.parent && _loc5_.parent.parent is _13504 && (_loc5_.parent.parent as _13504)._1823 == param1)
               {
                  _loc6_.push(_loc5_);
               }
            }
            _loc3_++;
         }
         return _loc6_;
      }
      
      public function get _3009() : _576
      {
         return _1407.getInstance(_576) as _576;
      }
   }
}

