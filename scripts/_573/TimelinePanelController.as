package _573
{
   import _1038._1042;
   import _1177.UIEvent;
   import _13492._13491;
   import _13492._13496;
   import _13503._13502;
   import _13505._13504;
   import _13505._13508;
   import _13505._13510;
   import _13545._13544;
   import _13545._13548;
   import _1404._1407;
   import _14075._14077;
   import _214._213;
   import _24.Shortcut;
   import _24._26;
   import _40.BoneFrameVO;
   import _40._39;
   import _40._45;
   import _51._50;
   import _51._52;
   import _51._79;
   import _521._522;
   import _537._13541;
   import _541._540;
   import _555._557;
   import _555._570;
   import _555._576;
   import _586._596;
   import _6.Context;
   import _636.TimelineEvent;
   import _639._12462;
   import _648._665;
   import _668._674;
   import _676._675;
   import _703._705;
   import _708._714;
   import _708._715;
   import _710._711;
   import _710._712;
   import _73.SymbolType;
   import _783.CommandNotification;
   import _783.MenuNotification;
   import _783.StageNotification;
   import _783.TimelineNotification;
   import _93._94;
   import _97._116;
   import _978.Timeline;
   import _978.TimelinePanel;
   import _978._980;
   import _978._993;
   import egret.utils.tr;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.MouseEvent;
   import flash.utils.Dictionary;
   import flash.utils.setTimeout;
   
   public class TimelinePanelController extends _94
   {
      private var _4693:Dictionary;
      
      private var _4706:TimelinePanel;
      
      private var _4761:_674;
      
      private var _4581:_1042;
      
      private var _4713:_13544;
      
      private var _4656:Boolean;
      
      private var _4598:_13502;
      
      private var _4133:_665;
      
      private var _14605:int = -1;
      
      private var _13872:int = -1;
      
      private var _13870:int = -1;
      
      private var _13866:Boolean;
      
      private var _4678:_574;
      
      protected var _13796:_13541;
      
      public function TimelinePanelController()
      {
         this._4693 = new Dictionary();
         super();
         this._4761 = new _674();
         this._13796 = _1407.getInstance(_13541) as _13541;
      }
      
      override protected function init() : void
      {
         super.init();
         this._4706 = _1407.getInstance(TimelinePanel);
      }
      
      override protected function _1576() : void
      {
         if(this.timeline)
         {
            this._4685();
         }
         else
         {
            this._4706.addEventListener(UIEvent.CREATION_COMPLETE,this._3991);
         }
         _1565(TimelineNotification.SELECT_FRAMES,this._4094);
         _1565(TimelineNotification.UPDATE_SELECT_FRAMES,this._4094);
         _1565(StageNotification.UPDATE_CURRENT_ARMATURE,this._3973);
         _1565(StageNotification.UPDATE_SELECTED_ITEMS,this._4548,-1);
         _1565(StageNotification.UPDATE_EDIT_MODE,this._3864);
         _1565(StageNotification.UPDATE_ANIMATION_MODE,this._4702);
         _1565(TimelineNotification.UPDATE,this._4629);
         _1565(TimelineNotification.FRAME_CHANGE,this._4654);
         _1565(TimelineNotification.FRAME_RATE_CHANGE,this._4613);
         _1565(TimelineNotification.SCALE_CHANGE,this._4316);
         _1565(TimelineNotification.ONION_CHANGE,this._4611);
         _1565(TimelineNotification.AUTO_KEY,this._4747);
         _1565(TimelineNotification.ADJUST_CHANGE,this._11365);
         _1565(TimelineNotification.DELETE_UNNECESSARY_FRAMES,this._11635);
         _1565(TimelineNotification.SET_LOOP,this._13844);
         _1565(TimelineNotification.FILTER_LOCK_CHANGE,this._13849);
         _1565(TimelineNotification.SELECT_ANIMATION,this._13783);
         _1565(MenuNotification.CUT_FRAME,this._4703);
         _1565(MenuNotification.COPY_FRAME,this._4689);
         _1565(MenuNotification.PASTE_FRAME,this._4684);
         _1565(MenuNotification.DELETE_FRAME,this._4683);
         _1565(MenuNotification.COLLAPSE_ALL,this._4682);
         _1565(MenuNotification.EXPAND_ALL,this._4697);
      }
      
      private function _13783(param1:TimelineNotification) : void
      {
         var _loc2_:_13502 = param1.data as _13502;
         this._2854(_loc2_);
      }
      
      private function _13844(param1:TimelineNotification) : void
      {
         if(Boolean(this.timeline) && Boolean(this.timeline._13845))
         {
            this.timeline._13845.curFrame = this._13872;
            this.timeline._13843.curFrame = this._13870;
         }
         if(Boolean(this._4706) && Boolean(this._4706._13863))
         {
            this._4706._13863.selected = this._13872 >= 0;
            this._4706._13868.selected = this._13870 >= 0;
            this._4706._13862.text = this._13872 >= 0 ? this._13872.toString() : "";
            this._4706._13869.text = this._13870 >= 0 ? this._13870.toString() : "";
         }
      }
      
      private function _11635(param1:TimelineNotification) : void
      {
         this._4678._11628();
      }
      
      private function _11365(param1:TimelineNotification) : void
      {
         this._2209._3151();
         this._3002();
      }
      
      private function _4697(param1:MenuNotification) : void
      {
         if(param1.data == "timeline")
         {
            this._4540();
         }
      }
      
      private function _4682(param1:MenuNotification) : void
      {
         if(param1.data == "timeline")
         {
            this._4537();
         }
      }
      
      private function _4683(param1:MenuNotification) : void
      {
         this._4712();
      }
      
      private function _4684(param1:MenuNotification) : void
      {
         this._4726();
      }
      
      private function _4689(param1:MenuNotification) : void
      {
         this._4734();
      }
      
      private function _4703(param1:MenuNotification) : void
      {
         this._4742();
      }
      
      private function _3973(param1:StageNotification) : void
      {
         setTimeout(this.refresh,1);
         this._4621();
         _14077.instance.clear();
      }
      
      private function _4094(param1:TimelineNotification) : void
      {
         this._3140();
      }
      
      private function _4702(param1:StageNotification) : void
      {
         if(_2220._4000 == _714.PLAY)
         {
            this._4706.mode = TimelinePanel.MODE_PLAY;
            this.timeline._4740.visible = false;
         }
         else
         {
            this._4706.mode = TimelinePanel.MODE_EDIT;
            if(this._3392.open)
            {
               this.timeline._4740.visible = true;
            }
            this._3140();
         }
      }
      
      private function _3864(param1:StageNotification) : void
      {
         var e:StageNotification = param1;
         if(_2220._2873 == _715.NULL)
         {
            return;
         }
         this._4706._4707(_2220._2873);
         this._4670();
         this._13853();
         if(_2220._2873 == _715.ANIMATE || _2220._2873 == _715.GENERAL)
         {
            if(this.timeline == null)
            {
               _1567(new CommandNotification(CommandNotification.OPEN_PANEL,_116.TIMELINE_PANEL));
            }
            if(Boolean(this._4706) && Boolean(this._4706.timeline))
            {
               setTimeout(function():void
               {
                  _4706.timeline._6848();
               },1);
            }
         }
         else if(this.timeline)
         {
            this._2209._3151();
            if(_2220._2873 == _715.ARMATURE)
            {
               this.timeline._4708();
            }
            this._2855();
         }
         this._13856();
      }
      
      public function _2855() : void
      {
         _2220._4000 = _714.STOP;
         if(Boolean(this._4706) && Boolean(this.timeline))
         {
            this.timeline.stop();
            this._4706._4758.selected = false;
            this._4706._4732.selected = false;
         }
      }
      
      public function _2963(param1:_52) : void
      {
         var _loc2_:_13504 = null;
         var _loc3_:_13548 = null;
         if(this._4713 == null)
         {
            return;
         }
         if(_2220._2873 == _715.ANIMATE || _2220._2873 == _715.GENERAL)
         {
            _loc2_ = this._4713._1992._1873(param1);
            if(_loc2_)
            {
               _loc3_ = _705._13820(_loc2_);
               if(_loc3_)
               {
                  _1042(this.timeline._4552.dataProvider)._4016(_loc3_);
               }
            }
         }
      }
      
      public function _2998(param1:_79) : void
      {
         var _loc2_:_13508 = null;
         var _loc3_:_13548 = null;
         if(this._4713 == null)
         {
            return;
         }
         if(_2220._2873 == _715.ANIMATE)
         {
            _loc2_ = this._4713._1992._1875(param1);
            if(_loc2_)
            {
               _loc3_ = _705._13820(_loc2_);
               if(_loc3_)
               {
                  _1042(this.timeline._4552.dataProvider)._4016(_loc3_);
               }
            }
         }
      }
      
      private function _4548(param1:StageNotification) : void
      {
         if(_2220._2873 == _715.ANIMATE || _2220._2873 == _715.GENERAL)
         {
            this._3140();
         }
      }
      
      private function _3991(param1:UIEvent) : void
      {
         this._4656 = true;
         this._4706.removeEventListener(UIEvent.CREATION_COMPLETE,this._3991);
         this._4685();
         if(this._4598)
         {
            this._2854(this._4598);
            this._4598 = null;
         }
      }
      
      private function _4685() : void
      {
         Shortcut._1681(this._4706.stage,_26.PLAY,this._4671);
         this._4706._4749.addEventListener(MouseEvent.CLICK,this._4753);
         this._4706._4739.addEventListener(MouseEvent.CLICK,this._4746);
         this._4706._4750.addEventListener(MouseEvent.CLICK,this._4754);
         this._4706._4733.addEventListener(MouseEvent.CLICK,this._4743);
         this._4706._4719.addEventListener(MouseEvent.CLICK,this._4694);
         this._4706._4721.addEventListener(MouseEvent.CLICK,this._4735);
         this._4706._4722.addEventListener(MouseEvent.CLICK,this._4736);
         this._4706._4758.addEventListener(MouseEvent.CLICK,this._4762);
         this._4706._4732.addEventListener(MouseEvent.CLICK,this._4741);
         this._4706._4727.addEventListener(MouseEvent.CLICK,this._4700);
         this._4706._4709.addEventListener(MouseEvent.CLICK,this._4710);
         this._4706._4688.addEventListener(MouseEvent.CLICK,this._4692);
         this._4706._4679.addEventListener(MouseEvent.CLICK,this._4686);
         this._4706._4730.addEventListener(FocusEvent.FOCUS_OUT,this._4687);
         this._4706._4724.addEventListener(FocusEvent.FOCUS_OUT,this._4673);
         this._4706._4723.addEventListener(Event.CHANGE,this._4675);
         this._4706._4729.addEventListener(Event.CHANGE,this._4672);
         this._4706.addEventListener(TimelineEvent.STOP_ANIMATION,this._4701);
         this._4706._4729.value = Timeline.DEFAULT_SCALE * 100;
         this._4706._4720.addEventListener(MouseEvent.CLICK,this._4725);
         this._4706._13860.addEventListener(Event.CHANGE,this._13848);
         this._4706._13863.addEventListener(Event.CHANGE,this._13865);
         this._4706._13868.addEventListener(Event.CHANGE,this._13871);
         this._4706._13862.addEventListener(FocusEvent.FOCUS_OUT,this._13851);
         this._4706._13869.addEventListener(FocusEvent.FOCUS_OUT,this._13857);
         this._4706._13859.addEventListener(FocusEvent.FOCUS_OUT,this._14601);
         this._4672(null);
         this._13844(null);
         this._4706._4757.addEventListener(Event.CHANGE,this._4711);
         this._4706._11637.addEventListener(Event.CHANGE,this._11636);
         this._4706._11637.selected = _12462.getInstance().timelineFilter;
         this._4706._13864.addEventListener(Event.CHANGE,this._13867);
         this._4706._13855.addEventListener(MouseEvent.CLICK,this._13836);
         this._4706._13861.addEventListener(MouseEvent.CLICK,this._13837);
         Shortcut._1681(this._4706,_26.COPY,this._4734);
         Shortcut._1681(this._4706,_26.CUT,this._4742);
         Shortcut._1681(this._4706,_26.PASTE,this._4726);
         Shortcut._1681(this._4706,_26.DELETE,this._4712);
         Shortcut._1681(this._4706,_26.MOVE_LEFT,this._13858);
         Shortcut._1681(this._4706,_26.MOVE_RIGHT,this._13852);
         Shortcut._1681(stage,_26.NEXT_FRAME,this._4695);
         Shortcut._1681(stage,_26.PREV_FRAME,this._4696);
         Shortcut._1681(stage,_26.NEXT_KEYFRAME,this._14599);
         Shortcut._1681(stage,_26.PREV_KEYFRAME,this._14600);
         Shortcut._1681(stage,_26.TIMELINE_FILTER,this._13847);
         this._4706.addEventListener(TimelineEvent.RIGHT_DOWN_FRAME,this._4659);
      }
      
      private function _13852() : void
      {
         if(this._4678)
         {
            this._4678._13828();
         }
      }
      
      private function _13858() : void
      {
         if(this._4678)
         {
            this._4678._13832();
         }
      }
      
      private function _13847() : void
      {
         if(Boolean(this._4706) && Boolean(this._4706._11637))
         {
            this._4706._11637.selected = !this._4706._11637.selected;
            this._11636(null);
         }
      }
      
      private function _13853() : void
      {
         if(Boolean(this._4706) && Boolean(this._4678))
         {
            this._4706._13864.enabled = this._4678._11632;
            this._4706._13855.enabled = this._4706._13861.enabled = this._4706._13864.selected = this._4678._13842;
         }
      }
      
      private function _13837(param1:MouseEvent) : void
      {
         _1567(new TimelineNotification(TimelineNotification.FILTER_SELECT));
      }
      
      private function _13836(param1:MouseEvent) : void
      {
         _1567(new TimelineNotification(TimelineNotification.FILTER_REFRESH));
      }
      
      private function _13867(param1:Event) : void
      {
         this._4678._13842 = this._4706._13864.selected;
      }
      
      private function _13851(param1:FocusEvent) : void
      {
         this._13872 = this._14604(int(this._4706._13862.text));
         this._4706._13862.text = String(this._13872);
         this._13856();
      }
      
      private function _13857(param1:FocusEvent) : void
      {
         this._13870 = this._14604(int(this._4706._13869.text));
         this._4706._13869.text = String(this._13870);
         this._13856();
      }
      
      private function _14604(param1:int) : int
      {
         if(param1 > this.timeline._4642)
         {
            return this.timeline._4642;
         }
         return param1;
      }
      
      private function _14601(param1:FocusEvent) : void
      {
         this._14605 = int(this._4706._13859.text);
         this.timeline._11186(this._14605);
         this.timeline._14598();
      }
      
      private function _13848(param1:Event) : void
      {
         this._13854 = this._4706._13860.selected;
      }
      
      private function set _13854(param1:Boolean) : void
      {
         this._13866 = param1;
         if(this.timeline)
         {
            this.timeline._13854 = this._13866;
         }
      }
      
      private function _13865(param1:Event) : void
      {
         if(this._13872 == this.timeline.curFrame)
         {
            this._13872 = -1;
            this._13870 = -1;
         }
         else
         {
            this._13872 = this.timeline.curFrame;
         }
         this._13856();
      }
      
      private function _13871(param1:Event) : void
      {
         if(this._13870 == this.timeline.curFrame)
         {
            this._13872 = -1;
            this._13870 = -1;
         }
         else
         {
            this._13870 = this.timeline.curFrame;
         }
         this._13856();
      }
      
      private function _13856() : void
      {
         if(this._13872 == this._13870)
         {
            this._13872 = this._13870 = -1;
         }
         _1567(new TimelineNotification(TimelineNotification.SET_LOOP,{
            "left":this._13872,
            "right":this._13870
         }));
      }
      
      private function _4659(param1:TimelineEvent) : void
      {
         this._3975._3934(_711.TIMELINE,_712.FRAME);
      }
      
      private function _4701(param1:TimelineEvent) : void
      {
         _2220._4000 = _714.STOP;
      }
      
      private function _4696() : void
      {
         if(_2220._4000 == _714.PLAY)
         {
            return;
         }
         this._4735(null);
      }
      
      private function _14600() : void
      {
         if(_2220._4000 == _714.PLAY)
         {
            return;
         }
         if(this._13796._2889.length == 0)
         {
            this.timeline._14492();
         }
         else
         {
            this._14595(true);
         }
      }
      
      private function _14599() : void
      {
         if(_2220._4000 == _714.PLAY)
         {
            return;
         }
         if(this._13796._2889.length == 0)
         {
            this.timeline._14603();
         }
         else
         {
            this._14595(false);
         }
      }
      
      private function _14595(param1:Boolean) : void
      {
         var _loc7_:_13510 = null;
         var _loc9_:int = 0;
         var _loc10_:_13508 = null;
         var _loc11_:_13504 = null;
         var _loc2_:Vector.<_13510> = this._13796._2889;
         var _loc3_:Vector.<_13504> = new Vector.<_13504>();
         var _loc4_:Vector.<_13508> = new Vector.<_13508>();
         var _loc5_:Vector.<_13510> = new Vector.<_13510>();
         var _loc6_:int = 0;
         _loc6_ = 0;
         while(_loc6_ < _loc2_.length)
         {
            _loc7_ = _loc2_[_loc6_];
            if(_loc7_ is _13504)
            {
               _loc3_.push(_loc7_);
            }
            else if(_loc7_ is _13508)
            {
               _loc4_.push(_loc7_);
            }
            else
            {
               _loc5_.push(_loc7_);
            }
            _loc6_++;
         }
         if(_loc3_.length > 1 || _loc4_.length > 1)
         {
            return;
         }
         _loc6_ = 0;
         while(_loc6_ < _loc5_.length)
         {
            _loc7_ = _loc5_[_loc6_];
            if(_loc7_.flag != _13510.FLAG_TRANSLATE && _loc7_.flag != _13510.FLAG_SCALE && _loc7_.flag != _13510.FLAG_ROTATE && _loc7_.flag != _13510.FLAG_COLOR && _loc7_.flag != _13510.FLAG_DISPLAY_INDEX && _loc7_.flag != _13510.FLAG_FFD && _loc7_.flag != _13510.FLAG_IK)
            {
               return;
            }
            _loc6_++;
         }
         var _loc8_:Array = [];
         if(_loc5_.length == 1)
         {
            this._13628(_loc5_[0]._1816,_loc8_);
            _loc8_.sort(Array.NUMERIC);
            this._14606(param1,_loc8_);
         }
         else if(_loc4_.length == 1)
         {
            _loc10_ = _loc4_[0];
            this._13628(_loc10_._13599._1816,_loc8_);
            this._13628(_loc10_._13572._1816,_loc8_);
            _loc8_.sort(Array.NUMERIC);
            this._14606(param1,_loc8_);
         }
         else if(_loc3_.length == 1)
         {
            _loc11_ = _loc3_[0];
            this._13628(_loc11_._13581._1816,_loc8_);
            this._13628(_loc11_._13598._1816,_loc8_);
            this._13628(_loc11_._13586._1816,_loc8_);
            _loc8_.sort(Array.NUMERIC);
            this._14606(param1,_loc8_);
         }
      }
      
      private function _14606(param1:Boolean, param2:Array) : void
      {
         var _loc4_:int = 0;
         if(param2.length == 0)
         {
            return;
         }
         var _loc3_:int = this.timeline._4760.curFrame;
         if(param1)
         {
            _loc4_ = this._14597(param2,0,param2.length,_loc3_);
         }
         else
         {
            _loc4_ = this._14596(param2,0,param2.length,_loc3_);
         }
         if(_loc4_ >= 0)
         {
            this.timeline.gotoFrame(_loc4_);
         }
      }
      
      private function _13628(param1:Array, param2:Array) : void
      {
         var _loc3_:_13496 = null;
         var _loc4_:int = 0;
         while(_loc4_ < param1.length)
         {
            _loc3_ = param1[_loc4_];
            if(param2.indexOf(_loc3_.startPos) < 0)
            {
               param2.push(_loc3_.startPos);
            }
            _loc4_++;
         }
      }
      
      private function _14597(param1:Array, param2:int, param3:int, param4:int) : int
      {
         var _loc5_:int = 0;
         if(param1[0] >= param4)
         {
            return -1;
         }
         if(param1[param3 - 1] < param4)
         {
            return param1[param3 - 1];
         }
         while(param3 - param2 > 1)
         {
            _loc5_ = param2 + (param3 - param2) / 2;
            if(param1[_loc5_] < param4)
            {
               param2 = _loc5_;
            }
            else
            {
               param3 = _loc5_;
            }
         }
         return param1[param2];
      }
      
      private function _14596(param1:Array, param2:int, param3:int, param4:int) : int
      {
         var _loc5_:int = 0;
         if(param1[param3 - 1] <= param4)
         {
            return -1;
         }
         if(param1[0] > param4)
         {
            return param1[0];
         }
         while(param3 - param2 > 1)
         {
            _loc5_ = param2 + (param3 - param2) / 2;
            if(param1[_loc5_] <= param4)
            {
               param2 = _loc5_;
            }
            else
            {
               param3 = _loc5_;
            }
         }
         return param1[param3];
      }
      
      private function _4695() : void
      {
         if(_2220._4000 == _714.PLAY)
         {
            return;
         }
         this._4736(null);
      }
      
      private function _4712() : void
      {
         if(_2220._4000 == _714.PLAY)
         {
            return;
         }
         if(this._4678._3915)
         {
            this._4753(null);
         }
      }
      
      private function _4726() : void
      {
         if(_2220._4000 == _714.PLAY)
         {
            return;
         }
         if(this._3961)
         {
            this._4743(null);
         }
      }
      
      private function _4734() : void
      {
         if(_2220._4000 == _714.PLAY)
         {
            return;
         }
         if(this._4678._3915)
         {
            this._4746(null);
         }
      }
      
      private function _4742() : void
      {
         if(_2220._4000 == _714.PLAY)
         {
            return;
         }
         if(this._4678._3915)
         {
            this._4754(null);
         }
      }
      
      private function _4611(param1:TimelineNotification) : void
      {
         this._3392._4738(param1.data.before,true);
         this._3392._4738(param1.data.after,false);
         this._3002();
      }
      
      private function _4711(param1:Event) : void
      {
         this._3392.open = this._4706._4757.selected;
         this._4706.timeline._4740.visible = this._3392.open && _2220._4000 == _714.STOP;
         this._4706.timeline._4740._4744 = this._3392._4744;
         this._4706.timeline._4740._4751 = this._3392._4751;
         this._4706.timeline._4740._4704();
         this._3002();
      }
      
      private function _13849(param1:TimelineNotification) : void
      {
         if(this._4706)
         {
            this._13853();
         }
         if(!this._4678._13842)
         {
            _1567(new TimelineNotification(TimelineNotification.FILTER_REFRESH));
         }
      }
      
      private function _11636(param1:Event) : void
      {
         if(this._4678)
         {
            this._4678._11632 = this._4706._11637.selected;
            if(this._4706)
            {
               this._13853();
            }
         }
      }
      
      public function _4690() : void
      {
         if(this._4706)
         {
            this._4706._4757.selected = this._3392.open;
            if(this._4706.timeline)
            {
               this._4706.timeline._4740.visible = this._3392.open && _2220._4000 == _714.STOP;
            }
         }
      }
      
      public function onInsertBlankFrame(param1:MouseEvent) : void
      {
         this._4678._3439();
      }
      
      public function _3442(param1:int) : void
      {
         this._4678._3442(param1);
      }
      
      public function _3439(param1:_45, param2:int) : void
      {
      }
      
      public function _3024() : void
      {
         this._4678._3186();
      }
      
      private function _4747(param1:TimelineNotification) : void
      {
         _12462.getInstance().autoKey = param1.data;
         this._2209._3151();
      }
      
      public function _3140() : void
      {
         if(_2220._4000 == _714.PLAY)
         {
            return;
         }
         if(this._4678)
         {
            this._4706._4739.enabled = this._4706._4750.enabled = this._4706._4749.enabled = this._3965;
            this._4706._4733.enabled = this._3961;
            this._4678._3140();
         }
      }
      
      public function get _3965() : Boolean
      {
         return this._4678._3915;
      }
      
      public function get _3962() : Boolean
      {
         return this._4678._3918;
      }
      
      public function get _3959() : Boolean
      {
         return this._4678._3911;
      }
      
      public function get _3961() : Boolean
      {
         if(_213.type == _213.TYPE_FRAME)
         {
            return true;
         }
         return false;
      }
      
      public function get _3960() : Boolean
      {
         if(this._4678)
         {
            return this._4678._4580 >= 0;
         }
         return false;
      }
      
      public function get _13778() : Boolean
      {
         if(this._4678)
         {
            return this._4678._13778;
         }
         return false;
      }
      
      private function _4547(param1:Object, param2:int, param3:Array) : Boolean
      {
         return param1 is _52 || param1 is _79 || param1 is _39;
      }
      
      private function _4316(param1:TimelineNotification) : void
      {
         if(this._4706._4729.value != this.timeline._4714._4718 * 100)
         {
            this._4706._4729.value = this.timeline._4714._4718 * 100;
         }
      }
      
      private function _4672(param1:Event) : void
      {
         this.timeline._4699(this._4706._4729.value / 100);
      }
      
      private function _4675(param1:Event) : void
      {
         var _loc2_:int = this._4706._4723.value;
         if(_loc2_ != this.timeline._4715)
         {
            this.timeline._4715 = _loc2_;
         }
         this._4706._4731.text = "x" + Timeline.PLAY_RATE[_loc2_];
      }
      
      private function _4654(param1:TimelineNotification) : void
      {
         this._4706._4680.text = this.timeline.curTime.toFixed(2) + " " + tr("Timeline.second");
         this._4706._13859.text = this.timeline._4760.curFrame.toString();
      }
      
      private function _4694(param1:MouseEvent) : void
      {
         this.timeline.gotoFrame(0);
      }
      
      private function _4735(param1:MouseEvent) : void
      {
         this.timeline.prevFrame();
      }
      
      private function _4736(param1:MouseEvent) : void
      {
         this.timeline.nextFrame();
      }
      
      private function _4671() : void
      {
         if(!Shortcut._1677())
         {
            if(Boolean(this.timeline) && (_2220._2873 == _715.ANIMATE || _2220._2873 == _715.GENERAL))
            {
               if(this._4706._4758.selected)
               {
                  this._4741(null);
               }
               else
               {
                  this._4706._4758.selected = true;
                  this._4762(null);
               }
            }
         }
      }
      
      private function _4741(param1:MouseEvent) : void
      {
         if(this._4706._4758.selected)
         {
            this.timeline.stop();
            this._4706._4758.selected = false;
            this._4706._14602(true);
         }
         if(this._4706._4732.selected)
         {
            if(Boolean(this._4713) && this._4713._4642 > 0)
            {
               this.timeline._4756();
               this._4706._14602(false);
               _2220._4000 = _714.PLAY;
            }
            else
            {
               this._4706._4732.selected = false;
               this._4706._14602(true);
            }
         }
         else
         {
            this.timeline.stop();
            this._4706._14602(true);
            _2220._4000 = _714.STOP;
         }
      }
      
      private function _4762(param1:MouseEvent) : void
      {
         if(this._4706._4732.selected)
         {
            this.timeline.stop();
            this._4706._4732.selected = false;
            this._4706._14602(true);
         }
         if(this._4706._4758.selected)
         {
            if(Boolean(this._4713) && this._4713._4642 > 0)
            {
               this.timeline._4728();
               this._4706._14602(false);
               _2220._4000 = _714.PLAY;
            }
            else
            {
               this._4706._4758.selected = false;
               this._4706._14602(true);
            }
         }
         else
         {
            this.timeline.stop();
            this._4706._14602(true);
            _2220._4000 = _714.STOP;
         }
      }
      
      private function _4700(param1:MouseEvent) : void
      {
         this.timeline._4717();
      }
      
      private function _4725(param1:MouseEvent) : void
      {
         this.timeline.loop = this._4706._4720.selected;
      }
      
      private function _4710(param1:MouseEvent) : void
      {
         this.timeline._4755();
      }
      
      private function _4692(param1:MouseEvent) : void
      {
         this.timeline.zoomOut();
      }
      
      private function _4686(param1:MouseEvent) : void
      {
         this.timeline.zoomIn();
      }
      
      private function _4687(param1:Event) : void
      {
         var _loc2_:int = int(this._4706._4730.text);
         this.timeline.gotoFrame(_loc2_);
      }
      
      private function _4673(param1:Event) : void
      {
         var _loc2_:uint = uint(this._4706._4724.text);
         if(_loc2_ <= 0)
         {
            _loc2_ = 24;
         }
         else if(_loc2_ > 60)
         {
            _loc2_ = 60;
         }
         var _loc3_:_50 = this._4713._1992.rootArmatureData;
         if(Boolean(_loc3_) && _loc2_ != _loc3_.frameRate)
         {
            _1567(new CommandNotification(CommandNotification.MODIFY_ARMATURE_FRAMERATE,{
               "_1886":_loc3_,
               "_2947":_loc2_
            }));
         }
      }
      
      public function _2946() : void
      {
         var _loc2_:uint = 0;
         var _loc1_:_50 = this._4713._1992.rootArmatureData;
         if(_loc1_)
         {
            _loc2_ = _loc1_.frameRate;
            this._4706._4724.text = _loc2_.toString();
            if(_loc2_ != this.timeline.frameRate)
            {
               _2214._1844._2871.dragonBonesVO.frameRate = _loc2_;
               this.timeline.frameRate = _loc2_;
            }
         }
      }
      
      private function _4613(param1:TimelineNotification) : void
      {
         _1567(new TimelineNotification(TimelineNotification.UPDATE_ANIMATION_DURATION));
         this._4706._4680.text = this.timeline.curTime.toFixed(2) + " " + tr("Timeline.second");
      }
      
      private function _4629(param1:TimelineNotification) : void
      {
         this._3392._4698 = param1.data;
         this._2209._3151();
         var _loc2_:Number = param1.data;
         this._4691(_loc2_);
         _576(_1407.getInstance(_576)).refresh();
         if(_2226._3150)
         {
            this._2853._3039(_2226._3150);
         }
         else if(_2226._14527())
         {
            this._2853._14432();
         }
         else if(_2226._2484 is _39)
         {
            this._2853.refresh();
         }
      }
      
      private function _4691(param1:Number) : void
      {
         if(Boolean(this._4713) && Boolean(this._4713._1992))
         {
            this._4713._1992._1858(param1);
         }
         _1567(new TimelineNotification(TimelineNotification.UPDATE_STAGE_VIEW));
         if(this._4706.mode == TimelinePanel.MODE_EDIT)
         {
            this._3140();
         }
      }
      
      public function _2854(param1:_13502) : void
      {
         var _loc2_:_13544 = null;
         var _loc3_:uint = 0;
         var _loc4_:_1042 = null;
         if(!this._4656)
         {
            this._4598 = param1;
            return;
         }
         if(_2226 == null || _2226._2889 == null || this.timeline == null || this._4706 == null || this._3431 == null)
         {
            return;
         }
         if(_2226._2889.length == 1 && _2226._2889[0] is _13502)
         {
            _2226._2484 = null;
         }
         this.timeline._3446();
         this._3431._4103(null);
         if(this._4678)
         {
            this._4678._4621();
            this._4678._3186();
         }
         if(param1)
         {
            _loc2_ = _705._13784(param1);
            this._4713 = _loc2_;
            _loc3_ = 24;
            if(_2214 && _2214._1844 && _2214._1844._2871 && Boolean(_2214._1844._2871.dragonBonesVO))
            {
               _loc3_ = _2214._1844._2871.dragonBonesVO.frameRate;
            }
            if(this._4713 && this._4713._1992 && Boolean(this._4713._1992.rootArmatureData))
            {
               _loc3_ = this._4713._1992.rootArmatureData.frameRate;
            }
            this._4706._4681 = this._4761;
            this.timeline.frameRate = _loc3_;
            if(Boolean(param1) && this._4693[_loc2_] == null)
            {
               (_loc4_ = new _1042()).source = _loc2_;
               this._4693[_loc2_] = _loc4_;
            }
            this._4581 = this._4693[this._4713];
            this._3002();
            if(Boolean(this._4706) && Boolean(this._4706._4724))
            {
               this._4706._4724.text = _loc3_.toString();
            }
            this._3392._3648 = this._4713._1992;
         }
         else
         {
            this._3392._3648 = null;
            this._4713 = null;
            this._4581 = null;
            if(this.timeline._4759)
            {
               this._4706._4758.selected = false;
               this._4706._4732.selected = false;
               _2220._4000 = _714.STOP;
            }
         }
         this._4670();
         if(this._4678)
         {
            this._4678._4556();
            this._13853();
         }
         if(_2220._4000 == _714.PLAY)
         {
            if(Boolean(this._4713) && this._4713._4642 <= 0)
            {
               this._2855();
            }
            else
            {
               this._13846();
            }
         }
      }
      
      private function _13846() : void
      {
         if(this.timeline)
         {
            this.timeline._13846();
         }
      }
      
      public function _2875() : void
      {
         if(this._3001)
         {
            this._3001._1874();
         }
         this._2886();
         this._3002();
      }
      
      public function _2886() : void
      {
         if(this._4581)
         {
            this._4581.refresh();
         }
      }
      
      public function rename(param1:_13502) : void
      {
         var _loc2_:_13544 = _705._13850[param1];
         if(this._4678)
         {
            this._4678._13830();
         }
      }
      
      public function get timeline() : Timeline
      {
         return this._4706.timeline;
      }
      
      private function onKey(param1:MouseEvent) : void
      {
         if(this._4678._4589())
         {
            this._3140();
            this._3133();
            this._3002();
         }
      }
      
      public function _3133() : void
      {
         this._3392._3444(this._13704.name,null);
      }
      
      private function _11609(param1:MouseEvent) : void
      {
         this._4678._11628();
      }
      
      private function _4753(param1:MouseEvent) : void
      {
         this._4678._4600();
      }
      
      private function _4746(param1:MouseEvent) : void
      {
         this._4678._4610();
      }
      
      private function _4754(param1:MouseEvent) : void
      {
         this._4678._4619();
      }
      
      private function _4743(param1:MouseEvent) : void
      {
         this._4678._14591();
      }
      
      public function _2891() : void
      {
         if(this._4678)
         {
            this._4678._11631(_2226._2889);
            this._4678._2891();
         }
      }
      
      public function refresh() : void
      {
         if(this.timeline)
         {
            this.timeline._4637();
            this.timeline._3173();
         }
      }
      
      public function _3411() : void
      {
         this.timeline._4674();
      }
      
      public function _3433(param1:_13496) : void
      {
         if(this.timeline)
         {
            this.timeline._6848();
         }
      }
      
      public function _4556() : void
      {
         if(this._4678)
         {
            this._4678._4556();
         }
      }
      
      public function _3002() : void
      {
         this._4691(this.timeline.curFrame);
      }
      
      protected function get _2209() : _522
      {
         return Context.getInstance()._1568._2209;
      }
      
      public function get autoKey() : Boolean
      {
         if(this._4133._2865._1811 == SymbolType.MC || this._4133._2865._1811 == SymbolType.STAGE)
         {
            return true;
         }
         return _12462.getInstance().autoKey;
      }
      
      public function get _3001() : _39
      {
         return null;
      }
      
      public function get _13704() : _13502
      {
         return !!this._4713 ? this._4713._1992 : null;
      }
      
      protected function get _3392() : _596
      {
         return _1407.getInstance(_596) as _596;
      }
      
      protected function get _3431() : _557
      {
         return _1407.getInstance(_557) as _557;
      }
      
      public function get _2871() : _665
      {
         return this._4133;
      }
      
      public function set _2871(param1:_665) : void
      {
         if(this._4133 != param1)
         {
            this._4133 = param1;
         }
         this._4737();
      }
      
      private function _4737() : void
      {
         this._3392.open = false;
         if(this._4706)
         {
            this._4706._4757.selected = this._3392.open;
         }
         if(this.timeline)
         {
            this.timeline._4716();
            this.timeline._4740.visible = this._3392.open;
         }
      }
      
      public function _3446() : void
      {
         this.timeline._3446();
      }
      
      public function _3186() : void
      {
         this._4678._3186();
      }
      
      private function _4705() : Boolean
      {
         var _loc1_:SymbolType = this._2871._2865._1811;
         return _loc1_ == SymbolType.MC && _2220._2873 == _715.GENERAL || _loc1_ == SymbolType.STAGE && _2220._2873 == _715.GENERAL || _loc1_ == SymbolType.ARMATURE && _2220._2873 == _715.ANIMATE;
      }
      
      private function _4670() : void
      {
         if(!this._4705())
         {
            return;
         }
         if(this._4678 == null || this.timeline is _980 && this._4678 is _575 || this.timeline is _993 && this._4678 is _572)
         {
            if(this._4678)
            {
               this._4678.stop();
               this._4678.timeline = null;
            }
            if(this.timeline is _980)
            {
               this._4678 = _1407.getInstance(_572) as _574;
            }
            else
            {
               this._4678 = _1407.getInstance(_575) as _574;
            }
         }
         if(this.timeline)
         {
            this._4678.setData(this._4713,this._4581,this.timeline);
         }
      }
      
      public function _1871() : void
      {
         this._4678._1871();
      }
      
      public function _4669() : _13510
      {
         return this._4678._4599();
      }
      
      public function _3149(param1:Array, param2:int) : void
      {
         this._4678._3149(param1,param2);
      }
      
      public function get autoTween() : Boolean
      {
         return this._4678.autoTween;
      }
      
      public function _3132() : void
      {
         this._4678._3132();
      }
      
      public function _3015() : void
      {
         if(this._4678)
         {
            this._4678._3015();
         }
      }
      
      public function _4152(param1:DisplayObject) : Boolean
      {
         if(this._4706 && param1 && this._4706.contains(param1))
         {
            return true;
         }
         return false;
      }
      
      public function _4624(param1:Object) : void
      {
         if(this._4678)
         {
            this._4678._4624(param1);
         }
      }
      
      public function _4621() : void
      {
         if(this._4678)
         {
            this._4678._4621();
         }
      }
      
      private function get _3975() : _540
      {
         return _1407.getInstance(_540) as _540;
      }
      
      public function _4752(param1:Object) : void
      {
         if(this.timeline)
         {
            this.timeline._4752(param1);
         }
      }
      
      public function _4745(param1:Object) : void
      {
         if(this.timeline)
         {
            this.timeline._4745(param1);
         }
      }
      
      public function _3966(param1:Object) : Boolean
      {
         if(this.timeline)
         {
            return this.timeline._3966(param1);
         }
         return false;
      }
      
      public function _4540() : void
      {
         if(this.timeline)
         {
            this.timeline._4540();
         }
      }
      
      public function _4537() : void
      {
         if(this.timeline)
         {
            this.timeline._4537();
         }
      }
      
      public function _3336(param1:Array) : void
      {
         if(Boolean(this.timeline) && Boolean(this.timeline._4552))
         {
            this.timeline._4552.dispatchEvent(new TimelineEvent(TimelineEvent.SHOW_ALL,param1));
         }
      }
      
      public function get _3357() : int
      {
         var _loc1_:_1042 = null;
         var _loc2_:_675 = null;
         if(Boolean(this.timeline) && Boolean(this.timeline._4552))
         {
            _loc1_ = this.timeline._4552.dataProvider as _1042;
            _loc2_ = _loc1_.source as _675;
            if(_loc2_)
            {
               if(_loc2_.locked)
               {
                  return 1;
               }
               return 2;
            }
         }
         return 0;
      }
      
      public function get _3356() : int
      {
         var _loc1_:_1042 = null;
         var _loc2_:_675 = null;
         if(Boolean(this.timeline) && Boolean(this.timeline._4552))
         {
            _loc1_ = this.timeline._4552.dataProvider as _1042;
            _loc2_ = _loc1_.source as _675;
            if(_loc2_)
            {
               if(_loc2_.visible)
               {
                  return 1;
               }
               return 2;
            }
         }
         return 0;
      }
      
      public function get adjusting() : Boolean
      {
         if(this._4678)
         {
            return this._4678.adjusting;
         }
         return false;
      }
      
      public function _3958() : Boolean
      {
         return _2226._3872 != null || _2226._3150 != null;
      }
      
      public function _10708() : void
      {
         if(this._4678)
         {
            this._4678._10708();
         }
      }
      
      public function _3338(param1:String, param2:int = 0) : void
      {
         var _loc3_:* = false;
         if(this.timeline)
         {
            if(param1 == "selectable")
            {
               if(this.timeline._6941)
               {
                  if(param2 == 0)
                  {
                     _loc3_ = !this.timeline._6941.selected;
                  }
                  else if(param2 == 1)
                  {
                     _loc3_ = true;
                  }
                  else
                  {
                     _loc3_ = false;
                  }
                  this.timeline._6941.selected = _loc3_;
                  if(this._4713)
                  {
                     this._4713.locked = _loc3_;
                  }
               }
            }
            else if(this.timeline._6943)
            {
               if(param2 == 0)
               {
                  _loc3_ = !this.timeline._6943.selected;
               }
               else if(param2 == 1)
               {
                  _loc3_ = true;
               }
               else
               {
                  _loc3_ = false;
               }
               this.timeline._6943.selected = _loc3_;
               if(this._4713)
               {
                  this._4713.visible = _loc3_;
               }
            }
         }
      }
      
      public function _11358() : Array
      {
         if(this._4678)
         {
            return this._4678._11358();
         }
         return null;
      }
      
      public function _11364() : Vector.<BoneFrameVO>
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc1_:Array = this._11358();
         var _loc2_:Vector.<BoneFrameVO> = new Vector.<BoneFrameVO>();
         if(_loc1_)
         {
            _loc3_ = 0;
            _loc4_ = int(_loc1_.length);
            while(_loc3_ < _loc4_)
            {
               if(_loc1_[_loc3_] is BoneFrameVO)
               {
                  _loc2_.push(_loc1_[_loc3_] as BoneFrameVO);
               }
               _loc3_++;
            }
         }
         return _loc2_;
      }
      
      public function _11308(param1:_52) : Vector.<BoneFrameVO>
      {
         var _loc2_:Vector.<BoneFrameVO> = this._11364();
         var _loc3_:Vector.<BoneFrameVO> = new Vector.<BoneFrameVO>();
         var _loc4_:int = 0;
         var _loc5_:int = int(_loc2_.length);
         while(_loc4_ < _loc5_)
         {
            if(_loc2_[_loc4_]._1823 == param1)
            {
               _loc3_.push(_loc2_[_loc4_]);
            }
            _loc4_++;
         }
         return _loc3_;
      }
      
      public function _13702(param1:_52, param2:String) : Vector.<_13496>
      {
         if(this._4678)
         {
            return this._4678._13702(param1,param2);
         }
         return null;
      }
      
      public function _11324() : _13491
      {
         if(this._4678)
         {
            return this._4678._11324();
         }
         return null;
      }
      
      private function get _2853() : _570
      {
         return _1407.getInstance(_570) as _570;
      }
      
      public function _12614() : Boolean
      {
         if(_2220._2873 == _715.ANIMATE && this._4706 && this._4706.stage && Boolean(this._4706.stage.focus))
         {
            return this._4706.contains(this._4706.stage.focus);
         }
         return false;
      }
   }
}

