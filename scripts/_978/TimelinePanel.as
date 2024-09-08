package _978
{
   import _1033._13223;
   import _1045.Group;
   import _1045.HSlider;
   import _1045.Label;
   import _1045.ToggleButton;
   import _1045._1082;
   import _1185._1189;
   import _1185._1196;
   import _1185._1197;
   import _127._13511;
   import _127._156;
   import _1374.IconButton;
   import _1374.TextInput;
   import _24._26;
   import _636.TimelineEvent;
   import _639.HotkeysModel;
   import _668._674;
   import _708._715;
   import _822._829;
   import _834._838;
   import _965._967;
   import _965._970;
   import _97._125;
   import egret.utils.SystemInfo;
   import egret.utils.tr;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.text.TextFormatAlign;
   
   public class TimelinePanel extends _156
   {
      public static const MODE_EDIT:int = 0;
      
      public static const MODE_PLAY:int = 1;
      
      public static const ADD_KEY_WHITE:String = "/assets/timeline/timeline_addKey_white.png";
      
      public static const ADD_KEY_RED:String = "/assets/timeline/timeline_addKey_red.png";
      
      public static const ADD_KEY_GREEN:String = "/assets/timeline/timeline_addKey_green.png";
      
      public static const ADD_KEY_YELLOW:String = "/assets/timeline/timeline_addKey_yellow.png";
      
      public var _4739:IconButton;
      
      public var _4750:IconButton;
      
      public var _4733:IconButton;
      
      public var _4749:IconButton;
      
      public var _4758:_829;
      
      public var _4732:_829;
      
      public var _4722:IconButton;
      
      public var _4721:IconButton;
      
      public var _4719:IconButton;
      
      public var _4727:IconButton;
      
      public var _4720:_829;
      
      public var _6988:Label;
      
      public var _4731:Label;
      
      public var _6992:Label;
      
      public var _6989:Label;
      
      public var _4723:HSlider;
      
      public var _6990:Label;
      
      public var _4730:TextInput;
      
      public var _6991:Label;
      
      public var _6993:TextInput;
      
      public var _4680:Label;
      
      public var _6986:Label;
      
      public var _4724:TextInput;
      
      public var _6983:Label;
      
      public var _4709:IconButton;
      
      public var _4688:IconButton;
      
      public var _4679:IconButton;
      
      public var _4729:HSlider;
      
      public var _4757:_829;
      
      public var _11637:_829;
      
      public var _13864:_829;
      
      public var _13855:IconButton;
      
      public var _13861:IconButton;
      
      public var _13860:ToggleButton;
      
      public var _13859:TextInput;
      
      public var _13863:ToggleButton;
      
      public var _13862:TextInput;
      
      public var _13868:ToggleButton;
      
      public var _13869:TextInput;
      
      public var timeline:Timeline;
      
      public var _6985:_994;
      
      private var _4761:_674;
      
      private var _mode:int;
      
      private var _6987:_980;
      
      private var _6982:_993;
      
      private var group:Group;
      
      private var _5641:_715;
      
      private var _11189:Group;
      
      private var _6156:Group;
      
      private var _14009:Group;
      
      private var _14006:_13223;
      
      private var _14007:_13223;
      
      private var _14008:Group;
      
      public function TimelinePanel()
      {
         this._4739 = new IconButton();
         this._4750 = new IconButton();
         this._4733 = new IconButton();
         this._4749 = new IconButton();
         this._4758 = new _829();
         this._4732 = new _829();
         this._4722 = new IconButton();
         this._4721 = new IconButton();
         this._4719 = new IconButton();
         this._4727 = new IconButton();
         this._4720 = new _829();
         this._6988 = new Label();
         this._4731 = new Label();
         this._6992 = new Label();
         this._6989 = new Label();
         this._4723 = new HSlider();
         this._6990 = new Label();
         this._4730 = new TextInput();
         this._6991 = new Label();
         this._6993 = new TextInput();
         this._4680 = new Label();
         this._6986 = new Label();
         this._4724 = new TextInput();
         this._6983 = new Label();
         this._4709 = new IconButton();
         this._4688 = new IconButton();
         this._4679 = new IconButton();
         this._4729 = new HSlider();
         this._4757 = new _829();
         this._11637 = new _829();
         this._13864 = new _829();
         this._13855 = new IconButton();
         this._13861 = new IconButton();
         this._13860 = new ToggleButton();
         this._13859 = new TextInput();
         this._13863 = new ToggleButton();
         this._13862 = new TextInput();
         this._13868 = new ToggleButton();
         this._13869 = new TextInput();
         super();
         this.title = tr("Timeline.panel.title");
         this.icon = "/assets/panel/timeline.png";
      }
      
      public function set _4681(param1:_674) : void
      {
         if(param1 == this._4761)
         {
            return;
         }
         this._4761 = param1;
      }
      
      public function get mode() : int
      {
         return this._mode;
      }
      
      public function set mode(param1:int) : void
      {
         if(this._mode != param1)
         {
            this._mode = param1;
            if(this._mode == MODE_EDIT)
            {
               this.timeline._6920 = false;
            }
            else
            {
               this.timeline._6920 = true;
               this._4739.enabled = false;
               this._4750.enabled = false;
               this._4733.enabled = false;
               this._4749.enabled = false;
            }
         }
      }
      
      override protected function _5823(param1:Number, param2:Number) : void
      {
         var _loc3_:int = 0;
         super._5823(param1,param2);
         if(this.contains(this._4758))
         {
            _loc3_ = 24;
         }
         this.timeline._6891 = param1;
         this.timeline._6889 = param2 - _loc3_;
         this._6985.width = param1 - Timeline.FRAME_NAME_WIDTH - this._6156.width - 90;
         this.timeline.dispatchEvent(new TimelineEvent(TimelineEvent.SCALE_CHANGE));
      }
      
      override protected function _2438() : void
      {
         super._2438();
         var _loc1_:String = SystemInfo.isMacOS ? "Command" : "Ctrl";
         var _loc2_:_1197 = new _1197();
         _loc2_.gap = 2;
         this.group = new Group();
         this.group.layout = _loc2_;
         this.addElement(this.group);
         var _loc3_:Group = new Group();
         var _loc4_:_1189;
         (_loc4_ = new _1189()).gap = 2;
         _loc4_._2419 = 10;
         _loc4_.verticalAlign = "middle";
         _loc3_.layout = _loc4_;
         _loc3_.height = 6;
         this.group.addElement(_loc3_);
         this._6987 = new _980();
         this._6982 = new _993();
         this.timeline = this._6982;
         if(this._5641 == _715.GENERAL)
         {
            this.timeline = this._6987;
         }
         this.timeline.addEventListener(TimelineEvent._5619,this._6984);
         this.timeline.addEventListener(TimelineEvent.SCALE_CHANGE,this._6984);
         this.timeline.addEventListener(TimelineEvent.LAST_FRAME_CHANGE,this._6984);
         this.timeline.addEventListener(TimelineEvent.STOP_ANIMATION,this._4701);
         this.group.addElement(this.timeline);
         var _loc5_:Group;
         (_loc5_ = new Group()).percentWidth = 100;
         _loc5_.layout = new _1189();
         this._4757.skinName = _838;
         this._4757.data = {"icon":"/assets/timeline/onion"};
         this._4757.toolTip = tr("Timeline.onion.tooltip");
         this._14008 = _125._2414(2);
         this._11637.skinName = _838;
         this._11637.selected = true;
         this._11637.data = {"icon":"/assets/timeline/filter"};
         this._11637.toolTip = tr("Timeline.filter.tooltip");
         this._13864.skinName = _838;
         this._13864.selected = false;
         this._13864.data = {"icon":"/assets/timeline/filterLock"};
         this._13864.toolTip = tr("Timeline.filter.lock");
         this._13855.icon = "/assets/button/refresh.png";
         this._13855.toolTip = tr("Timeline.filter.refresh");
         this._13855.enabled = false;
         this._13861.icon = "/assets/timeline/filterSelect.png";
         this._13861.toolTip = tr("Timeline.filter.select");
         this._13861.enabled = false;
         this._14008.addElement(this._11637);
         this._14008.addElement(this._13864);
         this._14008.addElement(this._13855);
         this._14008.addElement(this._13861);
         _loc5_.addElement(this._4757);
         if(this._5641 == _715.GENERAL)
         {
            this._14008.visible = this._14008.includeInLayout = false;
         }
         var _loc6_:HotkeysModel = HotkeysModel.getInstance();
         this._14009 = new Group();
         this._14009.percentHeight = 100;
         this._14009.layout = new _1189();
         (this._14009.layout as _1189).gap = 2;
         this._4739.icon = "/assets/timeline/timeline_copy.png";
         this._4739.toolTip = tr("Timeline.copyKey.tooltip",_loc6_._11726(_26.COPY));
         this._4739.enabled = false;
         this._4750.icon = "/assets/timeline/timeline_cut.png";
         this._4750.toolTip = tr("Timeline.cutKey.tooltip",_loc6_._11726(_26.CUT));
         this._4750.enabled = false;
         this._4733.icon = "/assets/timeline/timeline_paste.png";
         this._4733.toolTip = tr("Timeline.pasteKey.tooltip",_loc6_._11726(_26.PASTE));
         this._4733.enabled = false;
         this._4749.icon = "/assets/timeline/timeline_del.png";
         this._4749.toolTip = tr("Timeline.delKey.tooltip",_loc6_._11726(_26.DELETE));
         this._4749.enabled = false;
         this._14009.addElement(this._4739);
         this._14009.addElement(this._4750);
         this._14009.addElement(this._4733);
         this._14009.addElement(this._4749);
         var _loc7_:Group;
         (_loc7_ = new Group()).percentHeight = 100;
         _loc7_.layout = new _1189();
         (_loc7_.layout as _1189).gap = 2;
         this._4758.skinName = _838;
         this._4758.data = {"icon":"/assets/timeline/timeline_play"};
         this._4758.toolTip = tr("Timeline.play.tooltip",_loc6_._11726(_26.PLAY));
         this._4732.skinName = _838;
         this._4732.data = {"icon":"/assets/timeline/timeline_playback"};
         this._4732.toolTip = tr("Timeline.playback.tooltip");
         this._4722.icon = "/assets/timeline/timeline_nextFrame.png";
         this._4722.toolTip = tr("Timeline.nextFrame.tooltip",_loc6_._11726(_26.NEXT_FRAME));
         this._4721.icon = "/assets/timeline/timeline_prevFrame.png";
         this._4721.toolTip = tr("Timeline.prevFrame.tooltip",_loc6_._11726(_26.PREV_FRAME));
         this._4719.icon = "/assets/timeline/timeline_1stFrame.png";
         this._4719.toolTip = tr("Timeline.1stFrame.tooltip");
         this._4727.icon = "/assets/timeline/timeline_lastFrame.png";
         this._4727.toolTip = tr("Timeline.lastFrame.tooltip");
         this._4720.skinName = _838;
         this._4720.data = {"icon":"/assets/timeline/repeatPlay"};
         this._4720.toolTip = tr("Timeline.repeatPlay.tooltip");
         this._4720.selected = true;
         _loc7_.addElement(this._4719);
         _loc7_.addElement(this._4721);
         _loc7_.addElement(this._4732);
         _loc7_.addElement(this._4758);
         _loc7_.addElement(this._4722);
         _loc7_.addElement(this._4727);
         _loc7_.addElement(this._4720);
         var _loc8_:Group;
         (_loc8_ = new Group()).percentHeight = 100;
         var _loc9_:_1189;
         (_loc9_ = new _1189()).gap = 2;
         _loc9_.verticalAlign = "middle";
         _loc8_.layout = _loc9_;
         this._6988.text = tr("Timline.playRate");
         this._6988.alpha = 0.6;
         this._4731.width = 32;
         this._4731.text = "x" + Timeline.PLAY_RATE[this.timeline._4715];
         this._6992.text = tr("Timline.playRateLow");
         this._6989.text = tr("Timline.playRateHigh");
         this._4723.skinName = _970;
         this._4723.maximum = 6;
         this._4723.minimum = 0;
         this._4723.value = 3;
         _loc8_.addElement(this._6988);
         _loc8_.addElement(this._4723);
         _loc8_.addElement(this._4731);
         var _loc10_:Group;
         (_loc10_ = new Group()).percentHeight = 100;
         var _loc11_:_1189;
         (_loc11_ = new _1189()).gap = 2;
         _loc11_.verticalAlign = "middle";
         _loc10_.layout = _loc11_;
         this._6990.text = tr("Timeline.curFrame");
         this._6990.alpha = 0.6;
         this._4730.restrict = "0-9";
         this._4730.maxChars = 4;
         this._4730.setStyle("textAlign",TextFormatAlign.CENTER);
         this._4730.width = 36;
         this._4730.text = "0";
         this._6991.text = tr("Timeline.curTime");
         this._6991.alpha = 0.6;
         this._4680.text = "0.00 " + tr("Timeline.second");
         this._6986.text = tr("Timeline.frameRate");
         this._6986.alpha = 0.6;
         this._4724.width = 24;
         this._4724.text = Timeline.DEFAULT_FPS.toString();
         this._4724.restrict = "0-9";
         this._4724.maxChars = 2;
         this._4724.setStyle("textAlign",TextFormatAlign.CENTER);
         _loc10_.addElement(this._6991);
         _loc10_.addElement(this._4680);
         _loc10_.addElement(this._6986);
         _loc10_.addElement(this._4724);
         var _loc12_:Group;
         (_loc12_ = _125._2414()).percentWidth = 100;
         this._13860.skinName = _13511;
         this._13860.label = tr("Timeline.play.current");
         this._13860.toolTip = tr("Timeline.play.currentTip");
         this._13863.skinName = _13511;
         this._13863.label = tr("Timeline.play.start");
         this._13863.toolTip = tr("Timeline.play.startTip");
         this._13868.skinName = _13511;
         this._13868.label = tr("Timeline.play.end");
         this._13868.toolTip = tr("Timeline.play.endTip");
         var _loc13_:int = 23;
         this._13860.height = _loc13_;
         this._13863.height = _loc13_;
         this._13868.height = _loc13_;
         var _loc14_:int = 30;
         this._13859.restrict = "0-9";
         this._13862.restrict = "0-9";
         this._13869.restrict = "0-9";
         this._13859.enabled = true;
         this._13859.width = _loc14_;
         this._13862.width = _loc14_;
         this._13869.width = _loc14_;
         var _loc15_:Group = _125._2414(0);
         _loc15_.addElement(this._13860);
         _loc15_.addElement(this._13859);
         var _loc16_:Group = _125._2414(0);
         _loc16_.addElement(this._13863);
         _loc16_.addElement(this._13862);
         var _loc17_:Group = _125._2414(0);
         _loc17_.addElement(this._13868);
         _loc17_.addElement(this._13869);
         _loc12_.addElement(_loc15_);
         _loc12_.addElement(_loc16_);
         _loc12_.addElement(_loc17_);
         _2527.addElement(_loc12_);
         _2527.addElement(new _13223(20));
         _2527.addElement(_loc7_);
         _2527.addElement(new _13223(20));
         _2527.addElement(_loc8_);
         _2527.addElement(new _13223(20));
         _2527.addElement(_loc10_);
         _2527.addElement(new _13223(20));
         var _loc18_:Group = new Group();
         var _loc19_:_1189;
         (_loc19_ = new _1189()).verticalAlign = _1196.MIDDLE;
         _loc18_.layout = _loc19_;
         _loc18_.height = Timeline.STATUS_PANEL_HEIGHT - 3;
         _loc18_.left = 10;
         _loc18_.right = 0;
         var _loc20_:_1082;
         (_loc20_ = new _1082()).fillColor = 1843496;
         _loc20_.height = _loc18_.height;
         _loc20_.left = 0;
         _loc20_.right = 0;
         _loc20_.bottom = 0;
         addElement(_loc20_);
         _loc18_.bottom = 0;
         addElement(_loc18_);
         this._6156 = new Group();
         var _loc21_:_1189;
         (_loc21_ = new _1189()).verticalAlign = _1196.MIDDLE;
         this._6156.layout = _loc21_;
         this._4709.icon = "/assets/timeline/timeline_fit.png";
         this._4709.toolTip = tr("Timeline.fit.tooltip");
         this._4688.icon = "/assets/timeline/timeline_zoomIn.png";
         this._4688.toolTip = tr("Timeline.zoomIn.tooltip");
         this._4679.icon = "/assets/timeline/timeline_zoomOut.png";
         this._4679.toolTip = tr("Timeline.zoomOut.tooltip");
         this._4729.skinName = _967;
         this._4729.maximum = 100;
         this._4729.minimum = this.timeline._4714._6970 * 100;
         this._4729.value = 100;
         this._6156.addElement(this._4709);
         this._6156.addElement(this._4679);
         this._6156.addElement(this._4729);
         this._6156.addElement(this._4688);
         var _loc22_:_1082;
         (_loc22_ = new _1082())._2529 = 0;
         _loc22_.width = 16;
         this._11189 = new Group();
         var _loc23_:_1189 = new _1189();
         this._11189.layout = _loc23_;
         this._11189.width = Timeline.FRAME_NAME_WIDTH - 6;
         this._6985 = new _994();
         this._6985.addEventListener(TimelineEvent.GOTO_FIRST_FRAME,this._4694);
         this._6985.addEventListener(Event.CHANGE,this._6981);
         this._6985.setData(0,20,0);
         _loc18_.addElement(this._11189);
         var _loc24_:Group;
         (_loc24_ = _125._2398()).percentWidth = 100;
         _loc24_.right = 1;
         _loc24_.addElement(this._6985);
         _loc24_.addElement(this._6156);
         _loc18_.addElement(_loc24_);
         this._14006 = new _13223(10);
         this._14007 = new _13223(10);
         if(this._5641 == _715.GENERAL)
         {
            this._11189.addElement(this._6987._6798);
            this._11189.addElement(this._6987._4590);
         }
         else
         {
            this._11189.addElement(this._6982._6799);
            this._11189.addElement(this._6982._6800);
            this._11189.addElement(this._14006);
            this._11189.addElement(this._14008);
         }
         this._11189.addElement(this._14007);
         this._11189.addElement(this._14009);
      }
      
      public function _14602(param1:Boolean) : void
      {
         this._4724.enabled = param1;
         this._13869.enabled = param1;
         this._13862.enabled = param1;
         this._13859.enabled = param1;
         this._13860.enabled = param1;
         this._13863.enabled = param1;
         this._13868.enabled = param1;
      }
      
      private function _4701(param1:TimelineEvent) : void
      {
         this._4758.selected = false;
         this._4732.selected = false;
         dispatchEvent(param1);
      }
      
      private function _6981(param1:Event) : void
      {
         this.timeline.startIndex = int(this._6985.value);
      }
      
      private function _4694(param1:TimelineEvent) : void
      {
         this.timeline.startIndex = 0;
      }
      
      private function _6984(param1:TimelineEvent) : void
      {
         dispatchEvent(param1);
         var _loc2_:int = this.timeline.index;
         var _loc3_:int = this.timeline._6861;
         var _loc4_:int = this.timeline._4642;
         this._6985.setData(_loc4_,_loc3_,_loc2_);
      }
      
      override public function contains(param1:DisplayObject) : Boolean
      {
         var _loc2_:Boolean = super.contains(param1);
         if(!_loc2_)
         {
            if(this._4730.contains(param1) || this._4724.contains(param1) || this._13859.contains(param1) || this._13862.contains(param1) || this._13869.contains(param1))
            {
               return true;
            }
         }
         return _loc2_;
      }
      
      public function _4707(param1:_715) : void
      {
         this._5641 = param1;
         if(param1 == _715.ANIMATE)
         {
            if(this.timeline is _980)
            {
               this.timeline.removeEventListener(TimelineEvent._5619,this._6984);
               this.timeline.removeEventListener(TimelineEvent.SCALE_CHANGE,this._6984);
               this.timeline.removeEventListener(TimelineEvent.LAST_FRAME_CHANGE,this._6984);
               this.timeline.removeEventListener(TimelineEvent.STOP_ANIMATION,this._4701);
               this.group.removeElement(this.timeline);
               this.timeline = this._6982;
               this.timeline.addEventListener(TimelineEvent._5619,this._6984);
               this.timeline.addEventListener(TimelineEvent.SCALE_CHANGE,this._6984);
               this.timeline.addEventListener(TimelineEvent.LAST_FRAME_CHANGE,this._6984);
               this.timeline.addEventListener(TimelineEvent.STOP_ANIMATION,this._4701);
               this._4720.selected = this.timeline.loop;
               this.group.addElement(this.timeline);
               this._11189._2426();
               this._11189.addElement(this._6982._6800);
               this._11189.addElement(this._6982._6799);
               this._11189.addElement(this._14006);
               this._11189.addElement(this._14008);
               this._11189.addElement(this._14007);
               this._11189.addElement(this._14009);
               this._14008.visible = true;
               this._14008.includeInLayout = true;
            }
            if(Boolean(this.timeline) && Boolean(this.timeline._4667))
            {
               this.timeline._4667.visible = this.timeline._4667.includeInLayout = false;
               this._6982._2513.addElementAt(this._4757,2);
            }
         }
         else if(param1 == _715.GENERAL)
         {
            if(this.timeline is _993)
            {
               this.timeline.removeEventListener(TimelineEvent._5619,this._6984);
               this.timeline.removeEventListener(TimelineEvent.SCALE_CHANGE,this._6984);
               this.timeline.removeEventListener(TimelineEvent.LAST_FRAME_CHANGE,this._6984);
               this.timeline.removeEventListener(TimelineEvent.STOP_ANIMATION,this._4701);
               this.group.removeElement(this.timeline);
               this.timeline = this._6987;
               this.timeline.addEventListener(TimelineEvent._5619,this._6984);
               this.timeline.addEventListener(TimelineEvent.SCALE_CHANGE,this._6984);
               this.timeline.addEventListener(TimelineEvent.LAST_FRAME_CHANGE,this._6984);
               this.timeline.addEventListener(TimelineEvent.STOP_ANIMATION,this._4701);
               this._4720.selected = this.timeline.loop;
               this.group.addElement(this.timeline);
               this._11189._2426();
               this._11189.addElement(this._6987._6798);
               this._11189.addElement(this._6987._4590);
               this._11189.addElement(this._14006);
               this._11189.addElement(this._14009);
               this._14008.visible = false;
               this._14008.includeInLayout = false;
               this._6987._2513.addElementAt(this._4757,0);
            }
            if(Boolean(this.timeline) && Boolean(this.timeline._4667))
            {
               this.timeline._4667.visible = this.timeline._4667.includeInLayout = true;
            }
         }
      }
   }
}

