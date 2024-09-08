package _978
{
   import _1038._1037;
   import _1038._1039;
   import _1038._1042;
   import _1045.Button;
   import _1045.Group;
   import _1045.Label;
   import _1045.Scroller;
   import _1045.SkinnableContainer;
   import _1045.Tree;
   import _1045._1082;
   import _1177.IndexChangeEvent;
   import _1177.ListEvent;
   import _1177.TreeEvent;
   import _1177.UIEvent;
   import _1177._1181;
   import _1185._1186;
   import _1193._1192;
   import _127._130;
   import _13._12;
   import _13._14;
   import _13492._13496;
   import _13545._13544;
   import _13545._13547;
   import _13545._13548;
   import _1374.IconButton;
   import _1404._1407;
   import _1439._1242;
   import _24.Shortcut;
   import _24._26;
   import _537._13540;
   import _636.TimelineEvent;
   import _639.HotkeysModel;
   import _648._666;
   import _676._683;
   import _676._688;
   import _676._690;
   import _676._699;
   import _676._701;
   import _822._10262;
   import _822._829;
   import _822._842;
   import _834._838;
   import _965._973;
   import egret.core._1139;
   import egret.utils.tr;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.ui.Keyboard;
   import flash.utils.getTimer;
   import flash.utils.setTimeout;
   
   public class Timeline extends SkinnableContainer
   {
      public static var _6806:int;
      
      public static var curFrame:int;
      
      public static var _6923:int;
      
      public static var _6909:int;
      
      public static var _6908:int;
      
      public static var index:int;
      
      public static var _6190:int;
      
      public static const ICON_ANIMATION:String = "/assets/panelIcon/animation.png";
      
      public static const ADD_LAYER_IOCN:String = "/assets/button/layer_add.png";
      
      public static const DEL_LAYER_ICON:String = "/assets/button/layer_del.png";
      
      public static const COLLAPSE_IOCN:String = "/assets/button/fold.png";
      
      public static const EXPAND_ICON:String = "/assets/button/unfold.png";
      
      public static const LABEL_KEY_HEIGHT:int = 26;
      
      public static const LABEL_HEIGHT:int = 58;
      
      public static const FRAME_HEIGHT:int = 24;
      
      public static const FRAME_NAME_WIDTH:int = 242;
      
      public static const POINTER_Y:int = 2;
      
      public static const LAST_LINE_Y:int = LABEL_HEIGHT - _989.LONG_LINE_HEIGHT;
      
      public static const KEY_FRAME_HEIGHT:int = 23;
      
      public static const CONTROL_PANEL_HEIGHT:int = 6;
      
      public static const STATUS_PANEL_HEIGHT:int = 26;
      
      public static const PLAY_RATE:Array = [0.1,0.2,0.5,1,2,4,10];
      
      public static const DEFAULT_FPS:uint = 24;
      
      public static const LABEL_GAP:int = 10;
      
      public static const DEFAULT_SCALE:Number = 0.4;
      
      public static const TOP_GAP:int = 0;
      
      public static const LEFT_GAP:int = 10;
      
      public static const JUMP_LEFT_GAP:int = 20;
      
      public static const ONION_STATUS_NONE:int = 0;
      
      public static const ONION_STATUS_BEFORE:int = 1;
      
      public static const ONION_STATUS_AFTER:int = 2;
      
      protected var _6832:Boolean;
      
      protected var _6843:Boolean;
      
      protected var _6844:Point;
      
      protected var _6867:Point;
      
      protected var _6805:Number = 0;
      
      public var _6799:IconButton;
      
      public var _6800:IconButton;
      
      public var _2513:Group;
      
      public var _6794:_130;
      
      public var _11174:_985;
      
      public var _4714:_988;
      
      public var _4760:_992;
      
      public var _13845:_13565;
      
      public var _13843:_13565;
      
      public var _13992:_13566;
      
      public var _4552:_979;
      
      public var _4569:Tree;
      
      public var _4551:Tree;
      
      public var _6795:_1082;
      
      public var _6797:_987;
      
      public var _4740:_991;
      
      public var _4664:_829;
      
      public var _4667:IconButton;
      
      public var _4605:IconButton;
      
      public var _4635:IconButton;
      
      public var _4663:_829;
      
      public var _11362:_829;
      
      public var _11607:IconButton;
      
      protected var _6918:Group;
      
      public var _11173:Label;
      
      public var _6943:_10262;
      
      public var _6941:_10262;
      
      public var _4901:Boolean;
      
      protected var _6886:int;
      
      protected var _6876:int;
      
      protected var _6877:_1039;
      
      protected var _6868:_13544;
      
      protected var _6914:_1042;
      
      protected var _3932:int = -1;
      
      protected var _6895:int = 1;
      
      protected var _6894:int = 1;
      
      protected var _4761:_666;
      
      protected var _6903:int = 24;
      
      protected var _6866:int = 3;
      
      public var loop:Boolean = true;
      
      protected var _6913:Boolean;
      
      protected var _6919:Boolean;
      
      protected var _5099:int;
      
      protected var _6907:int;
      
      protected var _13997:int;
      
      protected var _13999:int;
      
      protected var _13996:int;
      
      protected var _13998:int;
      
      protected var _6878:Number;
      
      protected var _lastTime:int;
      
      protected var _6804:int = -1;
      
      protected var _6847:int = 0;
      
      protected var _6879:Boolean;
      
      protected var _4018:Boolean;
      
      protected var _6880:Boolean;
      
      protected var _6463:Boolean;
      
      protected var _6849:int;
      
      protected var _6893:Number;
      
      protected var _6865:_842;
      
      protected var _6887:Vector.<_842>;
      
      protected var _11185:Vector.<_842>;
      
      protected var _6850:Vector.<_842>;
      
      protected var _6881:Boolean;
      
      protected var _6915:Scroller;
      
      protected var _6892:Boolean;
      
      protected var _6851:Boolean;
      
      protected var _6882:Boolean;
      
      protected var _6885:Number = 0;
      
      protected var _6855:int = 5;
      
      protected var _6820:Number = 0.4;
      
      protected var _6888:Boolean;
      
      protected var _6842:Boolean;
      
      protected var _6859:Boolean;
      
      private var _6839:Boolean;
      
      private var _6817:Boolean;
      
      private var _5091:Boolean;
      
      private var _6864:Boolean;
      
      public var _13854:Boolean = false;
      
      private var _13994:_13540;
      
      private var _14853:Boolean = false;
      
      private var _14854:Number;
      
      private var _6856:int = -1;
      
      private var _6834:Object;
      
      private var _14849:_13496;
      
      private var _14855:Boolean = false;
      
      private var _14850:int = -1;
      
      private var _6118:Vector.<_690>;
      
      private var _6838:Vector.<_690>;
      
      private var _6814:int;
      
      private var _6823:int;
      
      private var _6803:int;
      
      private var _6901:Boolean;
      
      private var _6900:Boolean;
      
      public function Timeline()
      {
         this._6844 = new Point();
         this._6867 = new Point();
         this._4664 = new _829();
         this._4667 = new IconButton();
         this._4605 = new IconButton();
         this._4635 = new IconButton();
         this._4663 = new _829();
         this._11362 = new _829();
         this._11607 = new IconButton();
         this._6118 = new Vector.<_690>();
         this._6838 = new Vector.<_690>();
         super();
         this.skinName = _973;
         this._6887 = new Vector.<_842>();
         this._11185 = new Vector.<_842>();
         this._6850 = new Vector.<_842>();
         this._13994 = _1407.getInstance(_13540) as _13540;
      }
      
      public function _4716() : void
      {
         this._6878 = 0;
      }
      
      public function _4653() : void
      {
         Timeline._6806 = this._6804;
         Timeline.curFrame = this.curFrame;
         Timeline._6923 = this._6923;
         Timeline._6909 = this._6909;
         Timeline._6908 = this._6908;
         Timeline.index = this.index;
         this._3173();
      }
      
      private function _6837(param1:MouseEvent) : void
      {
         if(param1.delta < 0)
         {
            this.zoomIn();
         }
         else
         {
            this.zoomOut();
         }
      }
      
      override protected function _2438() : void
      {
         var _loc1_:_1082 = null;
         var _loc2_:_1082 = null;
         var _loc4_:_26 = null;
         super._2438();
         _loc1_ = new _1082();
         _loc1_.fillColor = 2765110;
         _loc1_.height = Timeline.KEY_FRAME_HEIGHT;
         _loc1_.x = FRAME_NAME_WIDTH;
         _loc1_.y = LABEL_HEIGHT - FRAME_HEIGHT;
         _loc1_.left = 1;
         _loc1_.right = 0;
         addElement(_loc1_);
         this._4714.x = FRAME_NAME_WIDTH;
         addElement(this._4714);
         _loc2_ = new _1082();
         _loc2_.fillColor = 16711680;
         _loc2_._2529 = 0;
         _loc2_.height = Timeline.KEY_FRAME_HEIGHT;
         _loc2_.x = FRAME_NAME_WIDTH;
         _loc2_.y = LABEL_HEIGHT - FRAME_HEIGHT;
         _loc2_.left = FRAME_NAME_WIDTH;
         _loc2_.right = 0;
         addElement(_loc2_);
         this._6794.layout = new _1186();
         this._6794.itemRenderer = _990;
         this._6794.x = FRAME_NAME_WIDTH;
         this._4569.x = FRAME_NAME_WIDTH;
         this._4569.y = LABEL_HEIGHT;
         addElement(this._4569);
         this._6797.y = LABEL_HEIGHT;
         addElement(this._6797);
         this._4551.x = FRAME_NAME_WIDTH + LABEL_GAP;
         this._4551.y = LABEL_HEIGHT;
         addElement(this._4551);
         this._6795.x = FRAME_NAME_WIDTH + LABEL_GAP;
         this._6795.y = LAST_LINE_Y;
         addElement(this._6795);
         this._4760.y = POINTER_Y;
         this._13845.y = POINTER_Y;
         this._13843.y = POINTER_Y;
         this._13992.y = POINTER_Y;
         addElement(this._4760);
         addElement(this._13845);
         addElement(this._13843);
         addElement(this._13992);
         this._11174.layout = new _1186();
         this._11174.percentWidth = 100;
         this._11174.itemRenderer = _986;
         this._11174.x = FRAME_NAME_WIDTH;
         this._11174.y = LABEL_HEIGHT - FRAME_HEIGHT + 2;
         addElement(this._11174);
         this._4740.x = this._4760.x;
         this._4740.y = this._4760.y - 4;
         this._4740.visible = false;
         addElement(this._4740);
         this._4552.y = LABEL_HEIGHT;
         this._4552._3854 = false;
         addElement(this._4552);
         var _loc3_:HotkeysModel = HotkeysModel.getInstance();
         this._11362.skinName = _838;
         this._11362.data = {"icon":"/assets/timeline/timeline_adjust"};
         this._11362.toolTip = tr("Timeline.adjust.tooltip");
         this._11607.icon = "/assets/timeline/timeline_delUnnecessary.png";
         this._11607.toolTip = tr("Timeline.delUnnecessary.tooltip");
         this._4664.skinName = _838;
         this._4664.data = {"icon":"/assets/timeline/timeline_autoKey"};
         this._4664.toolTip = tr("Timeline.autoKey.tooltip");
         this._4667.icon = TimelinePanel.ADD_KEY_WHITE;
         this._4667.toolTip = tr("Timeline.addKey.tooltip",_loc3_._11726(_26.KEY_FRAME));
         this._4667.enabled = false;
         this._4605.icon = "/assets/timeline/timeline_moveFrameRight.png";
         this._4605.toolTip = tr("Timeline.addFrame.tooltip");
         this._4605.enabled = false;
         this._4635.icon = "/assets/timeline/timeline_moveFrameLeft.png";
         this._4635.toolTip = tr("Timeline.delFrame.tooltip");
         this._4635.enabled = false;
         this._4663.skinName = _838;
         this._4663.data = {"icon":"/assets/timeline/timeline_curve"};
         this._4663.toolTip = tr("Timeline.autoTween.tooltip");
         this._6846();
         _842._2140 = FRAME_NAME_WIDTH;
         _842._2141 = LABEL_HEIGHT;
         this._6604();
      }
      
      protected function _6846() : void
      {
      }
      
      protected function _6604() : void
      {
         this._4714.addEventListener(MouseEvent.MOUSE_WHEEL,this._6837);
         this._4714.addEventListener(MouseEvent.MOUSE_DOWN,this._6826);
         this._4714.addEventListener(MouseEvent.MOUSE_UP,this._6828);
         this._4714.addEventListener(UIEvent.UPDATE_COMPLETE,this._6862);
         this._11174.addEventListener(ListEvent.ITEM_ROLL_OUT,this._11182);
         this._11174.addEventListener(ListEvent.ITEM_ROLL_OVER,this._11180);
         this._4569.addEventListener(UIEvent.UPDATE_COMPLETE,this._6852);
         this._4551.addEventListener(UIEvent.UPDATE_COMPLETE,this._6822);
         this._4552.addEventListener(ListEvent.ITEM_ROLL_OUT,this._6912);
         this._4552.addEventListener(ListEvent.ITEM_ROLL_OVER,this._6910);
         this._4552.addEventListener(TreeEvent.ITEM_OPEN,this._14000);
         this._4552.addEventListener(TreeEvent.ITEM_CLOSE,this._14000);
         this._4552.addEventListener(TimelineEvent.SELECT_TIMELINE,this._6825);
         this._4552.addEventListener(TimelineEvent.LOCK_CHANGE,this._4579);
         this._4552.addEventListener(TimelineEvent.VISIBLE_CHANGE,this._4566);
         this._4552.addEventListener(UIEvent.UPDATE_COMPLETE,this._6824);
         this._4552.addEventListener(IndexChangeEvent.CHANGE,this._3552);
         this.addEventListener(MouseEvent.MOUSE_DOWN,this._6854);
         this.addEventListener(MouseEvent.MOUSE_UP,this._6872);
         this.addEventListener(MouseEvent.RIGHT_MOUSE_DOWN,this._4013);
         if(stage)
         {
            stage.addEventListener(MouseEvent.MOUSE_UP,this._6869);
         }
         this._4714.addEventListener(TimelineEvent._5619,this._3587);
         this._4714.addEventListener(TimelineEvent.SCALE_CHANGE,this._4316);
         this._4760.addEventListener(TimelineEvent.FRAME_CHANGE,this._4654);
         this._4740._6902.addEventListener(MouseEvent.MOUSE_DOWN,this._6833);
         this._4740._6904.addEventListener(MouseEvent.MOUSE_DOWN,this._6840);
         this._6943.addEventListener(MouseEvent.CLICK,this._6937);
         this._6941.addEventListener(MouseEvent.CLICK,this._6936);
         this._13845.curFrame = 0;
         this._13843.curFrame = 10;
         this._13831();
      }
      
      private function _14000(param1:TreeEvent) : void
      {
         var e:TreeEvent = param1;
         dispatchEvent(new TimelineEvent(TimelineEvent.ANIMATION_TREE_OPEN));
         setTimeout(function():void
         {
            _6848();
         },1);
      }
      
      private function _6936(param1:MouseEvent) : void
      {
         if(this._6868)
         {
            this._6868.locked = !this._6868.locked;
            dispatchEvent(new TimelineEvent(TimelineEvent.LOCK_CHANGE,this._6868));
         }
      }
      
      private function _6937(param1:MouseEvent) : void
      {
         if(this._6868)
         {
            this._6868.visible = !this._6868.visible;
            dispatchEvent(new TimelineEvent(TimelineEvent.VISIBLE_CHANGE,this._6868));
         }
      }
      
      private function _3552(param1:IndexChangeEvent) : void
      {
         dispatchEvent(new TimelineEvent(TimelineEvent.SELECT_TIMELINES,this._4552._2889));
      }
      
      private function _6869(param1:MouseEvent) : void
      {
         this._6880 = false;
         if(this._6832)
         {
            dispatchEvent(new TimelineEvent(TimelineEvent.SELECT_RECT_END));
         }
         this._6463 = false;
         this._6832 = false;
         this._6843 = false;
         if(stage)
         {
            stage.removeEventListener(MouseEvent.MOUSE_MOVE,this._4363);
            stage.removeEventListener(MouseEvent.MOUSE_MOVE,this._6830);
            stage.removeEventListener(MouseEvent.MOUSE_MOVE,this._11179);
         }
         this._6892 = false;
         if(this._6865)
         {
            this._6801();
         }
         if(this._6888)
         {
            this._6888 = false;
         }
         _14.unlock();
      }
      
      private function _4363(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         if(this._6463)
         {
            _loc2_ = this._6863(stage.mouseX - this._6893);
            if(this._6849 < _loc2_)
            {
               this._6849 = _loc2_;
            }
            this.startIndex = this._6849 - _loc2_;
         }
      }
      
      private function _6863(param1:Number) : int
      {
         return int(param1 / this._4714._6254);
      }
      
      private function _6833(param1:MouseEvent) : void
      {
         if(stage)
         {
            this._6847 = ONION_STATUS_BEFORE;
            stage.addEventListener(MouseEvent.MOUSE_UP,this._6911);
            stage.addEventListener(MouseEvent.MOUSE_MOVE,this._6899);
         }
      }
      
      private function _6840(param1:MouseEvent) : void
      {
         if(stage)
         {
            this._6847 = ONION_STATUS_AFTER;
            stage.addEventListener(MouseEvent.MOUSE_UP,this._6911);
            stage.addEventListener(MouseEvent.MOUSE_MOVE,this._6899);
         }
      }
      
      private function _6899(param1:MouseEvent) : void
      {
         var _loc3_:int = 0;
         var _loc2_:int = this._4714._6883(mouseX - this._4714.x);
         if(this._6847 == ONION_STATUS_BEFORE)
         {
            _loc3_ = this.curFrame - _loc2_;
            if(_loc3_ < 0)
            {
               _loc3_ = 0;
            }
            else
            {
               _loc3_ = _loc3_;
            }
            if(_loc3_ < 0)
            {
               _loc3_ = 0;
            }
            else if(_loc3_ > this._6804)
            {
               _loc3_ = this._6804;
            }
            if(_loc3_ != this._4740._4744)
            {
               this._4740._4744 = _loc3_;
               this._6879 = true;
            }
         }
         else if(this._6847 == ONION_STATUS_AFTER)
         {
            _loc3_ = _loc2_ < this._4642 ? _loc2_ - this.curFrame : this._4642 - this.curFrame;
            if(_loc3_ < 0)
            {
               _loc3_ = 0;
            }
            else if(_loc3_ > this._6804)
            {
               _loc3_ = this._6804;
            }
            if(_loc3_ != this._4740._4751)
            {
               this._4740._4751 = _loc3_;
               this._6879 = true;
            }
         }
         this._4740._4704();
      }
      
      private function _6911(param1:MouseEvent) : void
      {
         if(stage)
         {
            this._6847 = 0;
            stage.removeEventListener(MouseEvent.MOUSE_UP,this._6911);
            stage.removeEventListener(MouseEvent.MOUSE_MOVE,this._6899);
         }
         if(this._6879)
         {
            dispatchEvent(new TimelineEvent(TimelineEvent.ONION_CHANGE,{
               "before":this._4740._4744,
               "after":this._4740._4751
            }));
         }
      }
      
      protected function _6921(param1:MouseEvent) : void
      {
         if(this._6914)
         {
            this._4540();
         }
         this._3446();
      }
      
      protected function _6906(param1:MouseEvent) : void
      {
         if(this._6914)
         {
            this._4537();
         }
         this._3446();
      }
      
      private function _6822(param1:UIEvent) : void
      {
         this._4551.removeEventListener(UIEvent.UPDATE_COMPLETE,this._6822);
         var _loc2_:Scroller = _1242(this._4551.skin)._2491;
         if(_loc2_)
         {
            _loc2_._6052 = _1139.OFF;
            _loc2_._6182 = _1139.OFF;
         }
      }
      
      private function _6852(param1:UIEvent) : void
      {
         this._4569.removeEventListener(UIEvent.UPDATE_COMPLETE,this._6852);
         var _loc2_:Scroller = _1242(this._4569.skin)._2491;
         if(_loc2_)
         {
            _loc2_._6052 = _1139.OFF;
            _loc2_._6182 = _1139.OFF;
         }
      }
      
      private function _6824(param1:UIEvent) : void
      {
         var _loc2_:_1192 = null;
         this._4552.removeEventListener(UIEvent.UPDATE_COMPLETE,this._6824);
         if(this._4552._2490)
         {
            _loc2_ = this._4552._2490.layout;
            if(_loc2_)
            {
               _loc2_.addEventListener(_1181.PROPERTY_CHANGE,this._6917);
            }
         }
         if(this._4552.skin)
         {
            this._6915 = _1242(this._4552.skin)._2491;
            if(this._6915)
            {
               this._6915._6052 = _1139.OFF;
            }
         }
      }
      
      private function _4566(param1:TimelineEvent) : void
      {
         dispatchEvent(param1);
      }
      
      private function _4579(param1:TimelineEvent) : void
      {
         dispatchEvent(param1);
      }
      
      private function _6825(param1:TimelineEvent) : void
      {
         dispatchEvent(param1);
      }
      
      private function _4316(param1:TimelineEvent) : void
      {
         dispatchEvent(param1);
      }
      
      private function _4654(param1:TimelineEvent) : void
      {
         dispatchEvent(param1);
         Timeline.curFrame = this._4760.curFrame;
      }
      
      private function _3587(param1:TimelineEvent) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         dispatchEvent(param1);
         if(this._6887.length > 0)
         {
            _loc2_ = 0;
            _loc3_ = int(this._6887.length);
            while(_loc2_ < _loc3_)
            {
               this._6887[_loc2_]._6254 = this._4714._6254;
               this._6887[_loc2_].endIndex = this._4714.index;
               _loc2_++;
            }
         }
         if(this._11185.length > 0)
         {
            _loc2_ = 0;
            _loc3_ = int(this._11185.length);
            while(_loc2_ < _loc3_)
            {
               this._11185[_loc2_]._6254 = this._4714._6254;
               this._11185[_loc2_].endIndex = this._4714.index;
               _loc2_++;
            }
         }
         Timeline.index = this._4714.index;
      }
      
      public function get _6821() : _13547
      {
         var _loc1_:int = 0;
         var _loc2_:_13547 = null;
         var _loc3_:int = 0;
         var _loc4_:_13548 = null;
         var _loc5_:int = 0;
         var _loc6_:_13547 = null;
         var _loc7_:int = 0;
         if(this._14849 == null)
         {
            return null;
         }
         if(this._14855)
         {
            _loc1_ = 0;
            while(_loc1_ < this._11174.dataProvider.length)
            {
               _loc2_ = this._11174.dataProvider.getItemAt(_loc1_) as _13547;
               if(_loc2_.frames[0] == this._14849)
               {
                  return _loc2_;
               }
               _loc1_++;
            }
         }
         else
         {
            _loc3_ = 0;
            while(_loc3_ < this._4552.dataProvider.length)
            {
               _loc4_ = this._4552.dataProvider.getItemAt(_loc3_) as _13548;
               _loc5_ = 0;
               while(_loc5_ < _loc4_.frames.length)
               {
                  _loc6_ = _loc4_.frames.getItemAt(_loc5_) as _13547;
                  if(this._14850 > 0 && _loc6_.frames.length == this._14850)
                  {
                     _loc7_ = 0;
                     while(_loc7_ < _loc6_.frames.length)
                     {
                        if(_loc6_.frames[0] == this._14849)
                        {
                           return _loc6_;
                        }
                        _loc7_++;
                     }
                  }
                  _loc5_++;
               }
               _loc3_++;
            }
         }
         return null;
      }
      
      private function _11180(param1:ListEvent) : void
      {
         if(param1.itemRenderer is _986)
         {
            this._14855 = true;
            if(((param1.itemRenderer as _986).data as _13547).frames.length > 0)
            {
               this._14849 = ((param1.itemRenderer as _986).data as _13547).frames[0];
            }
            this._6856 = ((param1.itemRenderer as _986).data as _13547).frameIndex;
            this._6834 = this._6868;
         }
      }
      
      private function _11182(param1:ListEvent) : void
      {
         if(param1.itemRenderer is _986)
         {
            this._14849 = null;
            this._14850 = -1;
            this._6856 = -1;
            this._6834 = null;
         }
      }
      
      private function _6910(param1:ListEvent) : void
      {
         if(param1.itemRenderer is _986)
         {
            this._14855 = false;
            if(((param1.itemRenderer as _986).data as _13547).frames.length > 0)
            {
               this._14849 = ((param1.itemRenderer as _986).data as _13547).frames[0];
            }
            this._6856 = ((param1.itemRenderer as _986).data as _13547).frameIndex;
            this._14850 = ((param1.itemRenderer as _986).data as _13547).frames.length;
         }
         else if(param1.itemRenderer is _982)
         {
            this._6834 = (param1.itemRenderer as _982).data;
         }
      }
      
      private function _6912(param1:ListEvent) : void
      {
         if(param1.itemRenderer is _986)
         {
            this._14849 = null;
            this._14850 = -1;
            this._6856 = -1;
         }
         else if(param1.itemRenderer is _982)
         {
            if(this._6834 == param1.itemRenderer.data)
            {
               this._6834 = null;
            }
         }
      }
      
      private function _6841(param1:*, param2:_13547) : void
      {
         dispatchEvent(new TimelineEvent(TimelineEvent._4636,param2));
      }
      
      public function _3898(param1:Vector.<_690>) : void
      {
         this._6815();
         this._6118 = param1;
         this._6853();
      }
      
      private function _6853() : void
      {
      }
      
      public function _4637() : void
      {
         this._4674();
      }
      
      private function _6815() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         _loc1_ = 0;
         _loc2_ = int(this._6838.length);
         while(_loc1_ < _loc2_)
         {
            this._6838[_loc1_].selected = false;
            _loc1_++;
         }
         this._6838.length = 0;
      }
      
      private function _6884() : void
      {
         dispatchEvent(new TimelineEvent(TimelineEvent._4622));
      }
      
      public function _3024() : void
      {
         this._6815();
      }
      
      public function _3173() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         this._6812();
         this._6816();
         this._6848();
         this._4674();
         this._6860();
         if(this._4552 && this._4552._2490 && this._4552._2490.verticalScrollPosition > 0)
         {
            this._6836();
         }
         this._4740._4704();
         if(this._6887.length > 0)
         {
            _loc1_ = 0;
            _loc2_ = int(this._6887.length);
            while(_loc1_ < _loc2_)
            {
               this._6887[_loc1_]._6254 = this._4714._6254;
               this._6887[_loc1_]._6262 = this._4714._4718;
               _loc1_++;
            }
         }
         if(this._11185.length > 0)
         {
            _loc1_ = 0;
            _loc2_ = int(this._11185.length);
            while(_loc1_ < _loc2_)
            {
               this._11185[_loc1_]._6254 = this._4714._6254;
               this._11185[_loc1_]._6262 = this._4714._4718;
               _loc1_++;
            }
         }
      }
      
      public function _6816() : void
      {
         this._6797._6909 = this._4714._6909;
         this._6797._6923 = this._4714._6923;
         this._6797._6908 = this._4714._6908;
         this._6797.index = this._4714.index;
         this._6797.refresh();
      }
      
      public function _4563() : void
      {
         var _loc1_:_982 = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(Boolean(this._4552) && Boolean(this._4552._2490))
         {
            _loc2_ = 0;
            _loc3_ = this._4552._2490._2249;
            while(_loc2_ < _loc3_)
            {
               _loc1_ = this._4552._2490.getElementAt(_loc2_) as _982;
               if(_loc1_)
               {
                  _loc1_._6845();
               }
               _loc2_++;
            }
         }
      }
      
      private function _6836() : void
      {
         var _loc1_:_990 = null;
         var _loc2_:int = 0;
         var _loc3_:int = this._6794._2249;
         while(_loc2_ < _loc3_)
         {
            _loc1_ = this._6794.getElementAt(_loc2_) as _990;
            if(_loc1_)
            {
               _loc1_.refresh();
            }
            _loc2_++;
         }
      }
      
      public function _13835() : void
      {
         var _loc1_:_982 = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:_984 = null;
         if(Boolean(this._4552) && Boolean(this._4552._2490))
         {
            _loc2_ = 0;
            _loc3_ = this._4552._2490._2249;
            while(_loc2_ < _loc3_)
            {
               _loc1_ = this._4552._2490.getElementAt(_loc2_) as _982;
               if(_loc1_)
               {
                  _loc1_._13835();
               }
               _loc2_++;
            }
         }
         if(Boolean(this._4569) && Boolean(this._4569._2490))
         {
            _loc2_ = 0;
            _loc3_ = this._4569._2490._2249;
            while(_loc2_ < _loc3_)
            {
               _loc4_ = this._4569._2490.getElementAt(_loc2_) as _984;
               if(_loc4_)
               {
                  _loc4_.refresh();
               }
               _loc2_++;
            }
         }
      }
      
      public function _6812() : void
      {
         var _loc1_:_982 = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(Boolean(this._4552) && Boolean(this._4552._2490))
         {
            _loc2_ = 0;
            _loc3_ = this._4552._2490._2249;
            while(_loc2_ < _loc3_)
            {
               _loc1_ = this._4552._2490.getElementAt(_loc2_) as _982;
               if(_loc1_)
               {
                  _loc1_._6890();
               }
               _loc2_++;
            }
         }
         if(this._6868)
         {
            this._6868._13839();
         }
      }
      
      public function _6848() : void
      {
         var _loc1_:_983 = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(Boolean(this._4551) && Boolean(this._4551._2490))
         {
            _loc2_ = 0;
            _loc3_ = this._4551._2490._2249;
            while(_loc2_ < _loc3_)
            {
               _loc1_ = this._4551._2490.getElementAt(_loc2_) as _983;
               if(_loc1_)
               {
                  _loc1_.refresh();
               }
               _loc2_++;
            }
         }
      }
      
      public function _3433(param1:_701) : void
      {
         var _loc2_:_983 = null;
         var _loc3_:int = 0;
         if(param1)
         {
            _loc3_ = this._6914.getItemIndex(param1);
            if(Boolean(this._4551) && Boolean(this._4551._2490))
            {
               _loc2_ = this._4551._2490.getElementAt(_loc3_) as _983;
               if(_loc2_)
               {
                  _loc2_.refresh();
               }
            }
         }
         else
         {
            this._6848();
         }
      }
      
      public function _6860() : void
      {
         this._4760.x = this._4714.x + this._4714._6796(this._4760.curFrame);
         this._4760.visible = this._4760.curFrame >= this._4714.index;
         this._4740.x = this._4760.x;
         this._13831();
         this._13993();
      }
      
      public function _13831() : void
      {
         this._13845.x = this._4714.x + this._4714._6796(this._13845.curFrame);
         this._13843.x = this._4714.x + this._4714._6796(this._13843.curFrame);
         this._13845.visible = this._13845.curFrame >= this._4714.index;
         this._13843.visible = this._13843.curFrame >= this._4714.index;
      }
      
      public function _13993() : void
      {
         this._13992.x = this._4714.x + this._4714._6796(this._13992.curFrame);
         this._13992.visible = this._13992.startFrame >= 0;
      }
      
      public function _4674() : void
      {
         var _loc1_:int = 0;
         if(this._6868)
         {
            _loc1_ = this._6868._4642;
         }
         else
         {
            _loc1_ = 0;
         }
         if(this._6804 != _loc1_)
         {
            this._6804 = _loc1_;
            Timeline._6806 = this._6804;
            dispatchEvent(new TimelineEvent(TimelineEvent.LAST_FRAME_CHANGE,this._6804));
         }
         this._6795.x = FRAME_NAME_WIDTH + this._4714._6796(this._6804);
         this._6795.visible = this._4714.index <= this._6804;
      }
      
      private function _6807(param1:int) : void
      {
         var _loc3_:_1037 = null;
         var _loc4_:_690 = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:_701 = null;
         var _loc8_:_683 = null;
         var _loc9_:_699 = null;
         var _loc2_:_1042 = this._4552.dataProvider as _1042;
         for each(_loc7_ in this._6868.children)
         {
            if(_loc7_ is _683)
            {
               _loc8_ = _683(_loc7_);
               _loc5_ = 0;
               _loc6_ = _loc8_.frames.length;
               while(_loc5_ < _loc6_)
               {
                  _loc4_ = _loc8_.frames.getItemAt(_loc5_) as _690;
                  if((_loc4_) && !_loc4_.selected && _loc4_.frameIndex == param1)
                  {
                     _loc4_.selected = true;
                     this._6118.push(_loc4_);
                  }
                  _loc5_++;
               }
               for each(_loc9_ in _loc8_.children)
               {
                  _loc5_ = 0;
                  _loc6_ = _loc9_.frames.length;
                  while(_loc5_ < _loc6_)
                  {
                     _loc4_ = _loc9_.frames.getItemAt(_loc5_) as _690;
                     if((_loc4_) && !_loc4_.selected && _loc4_.frameIndex == param1)
                     {
                        _loc4_.selected = true;
                        this._6118.push(_loc4_);
                     }
                     _loc5_++;
                  }
               }
            }
            else if(_loc7_ is _688)
            {
               _loc5_ = 0;
               _loc6_ = _loc7_.frames.length;
               while(_loc5_ < _loc6_)
               {
                  _loc4_ = _loc7_.frames.getItemAt(_loc5_) as _690;
                  if((_loc4_) && !_loc4_.selected && _loc4_.frameIndex == param1)
                  {
                     _loc4_.selected = true;
                     this._6118.push(_loc4_);
                  }
                  _loc5_++;
               }
            }
         }
      }
      
      private function _6862(param1:UIEvent) : void
      {
         this._4714.removeEventListener(UIEvent.UPDATE_COMPLETE,this._6862);
         this._6797.x = this._4714.x + LABEL_GAP;
         this._4760.x = this._4714.x + this._4714._6796(this._4760.curFrame);
         this._4740.x = this._4760.x;
      }
      
      private function _6826(param1:MouseEvent) : void
      {
         if(param1.ctrlKey)
         {
            return;
         }
         if(this._4018)
         {
            return;
         }
         var _loc2_:int = this._4714._6883(param1.localX);
         this._11186(_loc2_);
         if(this._14851.curFrame <= _loc2_ && _loc2_ <= this._14852.curFrame)
         {
            this._14853 = true;
         }
         else
         {
            this._14853 = false;
         }
         if(stage)
         {
            stage.addEventListener(Event.ENTER_FRAME,this._6819);
         }
      }
      
      private function get _14852() : _13565
      {
         return this._13843.curFrame > this._13845.curFrame ? this._13843 : this._13845;
      }
      
      private function get _14851() : _13565
      {
         return this._13843.curFrame > this._13845.curFrame ? this._13845 : this._13843;
      }
      
      public function _11186(param1:int) : void
      {
         if(param1 != this._4760.curFrame)
         {
            this._4760.curFrame = param1;
            this._6878 = param1;
            this._4760.x = this._4714.x + this._4714._6796(this._4760.curFrame);
            this._4760.visible = true;
            this._4740.x = this._4760.x;
            this._6831();
         }
      }
      
      public function _14598() : void
      {
         var _loc1_:int = this._4760.curFrame;
         if(_loc1_ < JUMP_LEFT_GAP)
         {
            this.startIndex = 0;
            return;
         }
         _loc1_ = this._4760.curFrame - JUMP_LEFT_GAP;
         this.startIndex = _loc1_;
      }
      
      private function _6872(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         if(this._14853)
         {
            return;
         }
         if(this._6847 > 0 || param1.target is Button || this._6880 || this._6888)
         {
            this._6880 = false;
            return;
         }
         if(!this._6901 && !this._6843)
         {
            if(mouseX > this._4714.x && mouseX < this._4714.x + this._4714.width && mouseY > this._4714.y + this._4714.height - 23)
            {
               if(this._6821 == null)
               {
                  _loc2_ = mouseX - this._4714.x;
                  this._4760.curFrame = this._4714._6883(_loc2_);
               }
               else
               {
                  this._4760.curFrame = this._6856;
               }
               this._4760.x = this._4714.x + this._4714._6796(this._4760.curFrame);
               this._4740.x = this._4760.x;
               this._4760.visible = true;
               this._6831();
            }
         }
         this._6901 = false;
      }
      
      private function _11178() : Boolean
      {
         return mouseX > this._4714.x - 10 && mouseX < this._4714.x + this._4714.width && mouseY > this._4714.y + this._4714.height;
      }
      
      private function _11177() : Boolean
      {
         return mouseX > this._4714.x - 10 && mouseX < this._4714.x + this._4714.width && mouseY < this._4714.y + this._4714.height && mouseY > this._4714.y + this._4714.height - KEY_FRAME_HEIGHT;
      }
      
      private function _11183(param1:Boolean = false) : void
      {
         this._6832 = true;
         this._6844.x = mouseX;
         this._6844.y = mouseY + this._6805;
         if(param1)
         {
            this._6865 = this._11184();
         }
         else
         {
            this._6865 = this._6874();
         }
         if(this._6865.parent == null)
         {
            addElement(this._6865);
         }
         this._6865._5123 = this._4714._4718;
         this._6865._6254 = this._4714._6254;
         this._6865.startIndex = this._4714.index;
         if(param1)
         {
            stage.addEventListener(MouseEvent.MOUSE_MOVE,this._11179);
         }
         else
         {
            stage.addEventListener(MouseEvent.MOUSE_MOVE,this._6830);
         }
         dispatchEvent(new TimelineEvent(TimelineEvent.SELECT_RECT_START));
      }
      
      private function _11181() : void
      {
         if(this._13994._2889.length > 0)
         {
            dispatchEvent(new TimelineEvent(TimelineEvent.MOVE_FRAME_START));
            this._6814 = this._4714._6883(mouseX - this._4714.x);
            this._6823 = this._6814;
            this._6803 = this._6808();
            stage.addEventListener(MouseEvent.MOUSE_MOVE,this._4660);
            stage.addEventListener(MouseEvent.MOUSE_UP,this._6858);
            this._13992.startFrame = this._6814;
            this._13992.curFrame = this._6814;
            this._13993();
         }
      }
      
      private function _6854(param1:MouseEvent) : void
      {
         this._6900 = false;
         this._6839 = false;
         if(this._4018)
         {
            return;
         }
         if(param1.target is Button)
         {
            this._6880 = true;
            return;
         }
         if(Shortcut._1685(Keyboard.SPACE))
         {
         }
         if(this._11177() && !this._6888 && this._6821 == null)
         {
            this._3446();
            if(this._6821 == null)
            {
               this._6884();
            }
            this._11183(true);
         }
         if(this._11178() || this._6834 != null && this._6821 != null && this._6856 >= 0)
         {
            if(Shortcut._1677())
            {
               this._6900 = true;
               if(this._6821 != null && this._6834 != null)
               {
                  this._6841(this._6834,this._6821);
               }
               else
               {
                  this._11183();
               }
            }
            else if(!this._6888)
            {
               this._3446();
               if(this._6821 == null)
               {
                  this._6884();
                  if(!(param1.target is Button || this._6880))
                  {
                     this._11183();
                  }
               }
               else if(!(param1.target is _982) && this._6834 != null)
               {
                  if(!this._14847(this._6821))
                  {
                     this._6841(this._6834,this._6821);
                     this._6839 = true;
                  }
               }
               if(this._13994._2889.length > 0)
               {
                  dispatchEvent(new TimelineEvent(TimelineEvent.MOVE_FRAME_START));
                  this._13992.startFrame = this._6856;
                  this._13992.curFrame = this._6856;
                  this._13993();
                  this._6814 = this._6856;
                  this._6823 = this._6814;
                  this._6803 = this._6808();
                  stage.addEventListener(MouseEvent.MOUSE_MOVE,this._4660);
                  stage.addEventListener(MouseEvent.MOUSE_UP,this._6858);
               }
            }
            else
            {
               this._11181();
            }
         }
         else if(this._11177())
         {
            if(this._6888 && !param1.ctrlKey)
            {
               this._11181();
            }
         }
      }
      
      private function _14847(param1:_13547) : Boolean
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         _loc2_ = 0;
         _loc3_ = int(param1.frames.length);
         while(_loc2_ < _loc3_)
         {
            if(this._13994._2889.indexOf(param1.frames[_loc2_]) == -1)
            {
               return false;
            }
            _loc2_++;
         }
         return true;
      }
      
      private function _4013(param1:MouseEvent) : void
      {
         if(this._4018)
         {
            return;
         }
         if(param1.target is Button)
         {
            return;
         }
         this._5091 = true;
         stage.addEventListener(MouseEvent.MOUSE_MOVE,this._6898);
         stage.addEventListener(MouseEvent.RIGHT_MOUSE_UP,this._5094);
      }
      
      private function _5094(param1:MouseEvent) : void
      {
         var _loc2_:Point = null;
         var _loc3_:int = 0;
         if(this._5091 && !this._6864)
         {
            if(mouseX > this._4714.x - 10 && mouseX < this._4714.x + this._4714.width && mouseY > this._4714.y + this._4714.height)
            {
               _loc2_ = new Point(param1.stageX,param1.stageY);
               _loc3_ = this._4714._6883(this._4714.globalToLocal(_loc2_).x);
               if(_loc3_ != this._4760.curFrame)
               {
                  this._4760.curFrame = _loc3_;
                  this._4760.x = this._4714.x + this._4714._6796(this._4760.curFrame);
                  this._4760.visible = true;
                  this._4740.x = this._4760.x;
                  this._6831();
               }
               if(!this._6817 && !(this._6834 && this._6821 != null))
               {
                  this._6884();
                  this._3446();
               }
               dispatchEvent(new TimelineEvent(TimelineEvent.RIGHT_DOWN_FRAME,this._6821,true));
            }
         }
         if(this._5091)
         {
            this._5091 = false;
            this._6864 = false;
            stage.removeEventListener(MouseEvent.MOUSE_MOVE,this._6898);
         }
         this._6901 = false;
         _14._1602(_12.CURSOR_DRAG_HAND_FORKEY);
         stage.removeEventListener(MouseEvent.MOUSE_MOVE,this._6898);
         stage.removeEventListener(MouseEvent.RIGHT_MOUSE_UP,this._5094);
      }
      
      private function _6898(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         if(!this._6864)
         {
            this._6864 = true;
            this._6463 = true;
            this._6849 = this._3932;
            this._6893 = stage.mouseX;
            _14.setCursor(_12.CURSOR_DRAG_HAND_FORKEY,3);
         }
         else if(this._6463)
         {
            _loc2_ = this._6863(stage.mouseX - this._6893);
            if(this._6849 < _loc2_)
            {
               this._6849 = _loc2_;
            }
            this.startIndex = this._6849 - _loc2_;
         }
      }
      
      private function _6808() : int
      {
         var _loc1_:int = int.MAX_VALUE;
         var _loc2_:int = 0;
         var _loc3_:int = int(this._13994._2889.length);
         while(_loc2_ < _loc3_)
         {
            if(_loc1_ > this._13994._2889[_loc2_].startPos)
            {
               _loc1_ = this._13994._2889[_loc2_].startPos;
            }
            _loc2_++;
         }
         return _loc1_;
      }
      
      private function _6873(param1:MouseEvent) : void
      {
         stage.removeEventListener(MouseEvent.MOUSE_MOVE,this._6873);
         stage.addEventListener(Event.ENTER_FRAME,this._4660);
      }
      
      private function _4660(param1:Event) : void
      {
         var _loc3_:int = 0;
         var _loc4_:Array = null;
         var _loc5_:Object = null;
         var _loc2_:int = this._4714._6883(mouseX - this._4714.x);
         if(this._6859 || this._6842)
         {
            _loc3_ = _loc2_ - this._6814;
            _loc4_ = this._6827();
            _loc5_ = {
               "delta":_loc3_,
               "startIndex":_loc4_[0],
               "endIndex":_loc4_[1],
               "scaleRight":this._6842
            };
            dispatchEvent(new TimelineEvent(TimelineEvent.SCALE_FRAME,_loc5_));
            _loc3_ = _loc2_ - this._6823;
            this._6823 = _loc2_;
            if(this._6859)
            {
               this._6811(_loc3_);
            }
            else
            {
               this._6810(_loc3_);
            }
         }
         else
         {
            if(this._6814 - _loc2_ > this._6803)
            {
               _loc2_ = this._6814 - this._6803;
            }
            if(this._6823 != _loc2_)
            {
               _loc3_ = _loc2_ - this._6823;
               dispatchEvent(new TimelineEvent(TimelineEvent.MOVE_FRAME,_loc3_));
               this._13992.curFrame = _loc2_;
               this._13993();
               this._6823 = _loc2_;
               if(this._6823 != this._3932)
               {
                  this._6901 = true;
               }
               if(this._6888)
               {
                  this._6857(_loc3_);
               }
            }
         }
         this._13992.curFrame = this._6823;
         this._13993();
         this._6831();
      }
      
      private function _6858(param1:MouseEvent) : void
      {
         if(stage)
         {
            stage.removeEventListener(MouseEvent.MOUSE_MOVE,this._4660);
            stage.removeEventListener(MouseEvent.MOUSE_UP,this._6858);
         }
         if(this._13994._2889.length > 0)
         {
            dispatchEvent(new TimelineEvent(TimelineEvent.MOVE_FRAME_END));
         }
         if(this._6814 != this._6823)
         {
            if(this._6859 || this._6842)
            {
               dispatchEvent(new TimelineEvent(TimelineEvent.SCALE_KEY_FRAME));
            }
            else
            {
               dispatchEvent(new TimelineEvent(TimelineEvent.MOVE_KEY_FRAME,this._6823 - this._6814));
            }
         }
         this._6802();
         this._6842 = false;
         this._6859 = false;
         this._13992.startFrame = -1;
         this._13993();
      }
      
      private function _6828(param1:Event) : void
      {
         if(this._4018)
         {
            return;
         }
         if(stage)
         {
            this._6881 = false;
            stage.removeEventListener(Event.ENTER_FRAME,this._6819);
            stage.removeEventListener(MouseEvent.MOUSE_UP,this._6828);
            stage.removeEventListener(FocusEvent.FOCUS_OUT,this._6828);
         }
         this._14853 = false;
      }
      
      private function _6819(param1:Event) : void
      {
         var _loc6_:_13565 = null;
         var _loc7_:_13565 = null;
         var _loc8_:* = false;
         var _loc9_:Boolean = false;
         var _loc10_:* = false;
         var _loc11_:int = 0;
         var _loc2_:int = this._4714.index;
         if(!this._6881)
         {
            stage.addEventListener(MouseEvent.MOUSE_UP,this._6828);
            stage.addEventListener(FocusEvent.FOCUS_OUT,this._6828);
            this._6881 = true;
         }
         if(mouseX - this._4714.x < 0)
         {
            if(this._4714.index > 0)
            {
               --this._4714.index;
            }
         }
         else if(mouseX - this._4714.x > this._6835)
         {
            this._4714.index += 1;
         }
         var _loc3_:int = mouseX;
         if(_loc3_ > this.width - _988.MAX_GAP)
         {
            _loc3_ = this.width - _988.MAX_GAP;
         }
         var _loc4_:int = this._4714.index;
         var _loc5_:int = this._6804 + 1;
         if(this._14853)
         {
            if(Math.abs(mouseX - this._14854) < this._4714._6923)
            {
               return;
            }
            _loc6_ = this._14851;
            _loc7_ = this._14852;
            _loc4_ = _loc6_.curFrame;
            _loc5_ = _loc7_.curFrame + 1;
            _loc8_ = mouseX < this._14854;
            _loc9_ = mouseX > _loc6_.x && mouseX < _loc7_.x;
            _loc10_ = mouseX > this._14854;
            if(_loc9_)
            {
               this._4760.curFrame = this._4714._6883(_loc3_ - this._4714.x);
            }
            else if(_loc8_)
            {
               --this._4760.curFrame;
            }
            else if(_loc10_)
            {
               this._4760.curFrame += 1;
            }
            if(this._4760.curFrame < _loc6_.curFrame)
            {
               this._4760.curFrame = _loc7_.curFrame;
            }
            if(this._4760.curFrame > _loc7_.curFrame)
            {
               this._4760.curFrame = _loc6_.curFrame;
            }
            this._4760.x = this._4714.x + this._4714._6796(this._4760.curFrame);
            this._4740.x = this._4760.x;
            this._6831();
            if(_loc2_ != _loc4_ && _loc4_ <= _loc5_)
            {
               this._3173();
            }
            else if(_loc4_ > _loc5_)
            {
               this._6816();
            }
         }
         else
         {
            _loc11_ = this._4714._6883(_loc3_ - this._4714.x);
            if(_loc11_ != this._4760.curFrame)
            {
               this._4760.curFrame = _loc11_;
               this._4760.x = this._4714.x + this._4714._6796(this._4760.curFrame);
               this._4740.x = this._4760.x;
               this._6831();
               if(_loc2_ != _loc4_ && _loc4_ <= _loc5_)
               {
                  this._3173();
               }
               else if(_loc4_ > _loc5_)
               {
                  this._6816();
               }
            }
         }
         this._14854 = mouseX;
         this._13831();
         this._6878 = this._4760.curFrame;
      }
      
      private function get _13995() : int
      {
         if(this._4714)
         {
            return this.index + int(this._6835 / this._4714._6254 * 0.5);
         }
         return 0;
      }
      
      private function _6831() : void
      {
         dispatchEvent(new TimelineEvent(TimelineEvent.UPDATE,this.curFrame));
      }
      
      public function get _6891() : int
      {
         return this._6886;
      }
      
      public function set _6891(param1:int) : void
      {
         this.width = param1;
         this._6886 = param1;
         this._4552.width = param1;
         _6190 = this._6835;
         this._4714._6916 = this._6835;
         this._6797.x = this._4714.x + LABEL_GAP;
         this._6797._6916 = this._6835;
         this._4569.width = param1;
         this._6818();
      }
      
      public function set _6889(param1:int) : void
      {
         this.height = param1 - (CONTROL_PANEL_HEIGHT + STATUS_PANEL_HEIGHT + LABEL_HEIGHT);
         var _loc2_:int = height - LABEL_HEIGHT;
         this._6797._6905 = height;
         this._6795.height = height + _989.LONG_LINE_HEIGHT < 0 ? 0 : height + _989.LONG_LINE_HEIGHT;
         if(Boolean(this._4552) && Boolean(this._4552._2490))
         {
            this._4552._2490.height = height;
         }
         if(Boolean(this._4551) && Boolean(this._4551._2490))
         {
            this._4551._2490.height = height;
         }
         if(Boolean(this._4569) && Boolean(this._4569._2490))
         {
            this._4569._2490.height = height;
         }
         if(this._4552)
         {
            this._4552.height = height;
         }
         this._4760._6905 = height + 40;
         this._13845._6905 = this._4760._6905;
         this._13843._6905 = this._4760._6905;
         _842._2139 = this.height + LABEL_HEIGHT;
         this._6829();
         this._6818();
      }
      
      private function _6818() : void
      {
         if(this._6897())
         {
            _842._2142 = this._6835 - 13;
         }
         else
         {
            _842._2142 = this._6835;
         }
      }
      
      private function _6897() : Boolean
      {
         if(this._6915)
         {
            return this._6915.viewport.contentHeight > this.height;
         }
         return false;
      }
      
      private function get _6835() : int
      {
         return this._6886 - FRAME_NAME_WIDTH;
      }
      
      public function get dataProvider() : _1039
      {
         return this._6877;
      }
      
      public function dataChange() : void
      {
         if(this._6914)
         {
            this._6868 = this._6914.source as _13544;
            this._6914._5804 = false;
            this._6868._1992._1874();
            if(this._6919)
            {
               this._6907 = this._6868._4642 * (1000 / this._6903);
            }
            this._6794.dataProvider = this._6868.frames;
            this._11174.dataProvider = this._6868.frames;
            this._6943.selected = this._6868.visible;
            this._6941.selected = this._6868.locked;
            this._11173.text = this._6868.name;
         }
         else
         {
            if(Boolean(this._6868) && Boolean(this._6868._1992))
            {
               this._6868._1992._1868();
            }
            this._6794.dataProvider = null;
            this._11174.dataProvider = null;
            this._6868 = null;
            if(this._6919)
            {
               this.stop();
            }
         }
         this._5099 = 0;
         this._4552.dataProvider = this._6914;
         this._4569.dataProvider = this._6914;
         this._4551.dataProvider = this._6914;
         this._4674();
         this._6860();
         dispatchEvent(new TimelineEvent(TimelineEvent.UPDATE,this._4760.curFrame));
      }
      
      public function _4708() : void
      {
         if(Boolean(this._6868) && Boolean(this._6868._1992))
         {
            this._6868._1992._1868();
         }
      }
      
      public function _4561(param1:int) : void
      {
         var _loc2_:int = param1 * FRAME_HEIGHT;
         if(Boolean(this._4569) && Boolean(this._4569._2490))
         {
            if(_loc2_ > this._4569._2490.verticalScrollPosition + this._4569.height || _loc2_ < this._4569._2490.verticalScrollPosition)
            {
               _loc2_ -= this._4569.height * 0.5;
            }
            else
            {
               _loc2_ = this._4569._2490.verticalScrollPosition;
            }
            this._4569._2490.verticalScrollPosition = _loc2_;
         }
         if(Boolean(this._4551) && Boolean(this._4551._2490))
         {
            this._4551._2490.verticalScrollPosition = _loc2_;
         }
         if(Boolean(this._4552) && Boolean(this._4552._2490))
         {
            this._4552._2490.verticalScrollPosition = _loc2_;
         }
      }
      
      private function _6917(param1:_1181) : void
      {
         if(Boolean(this._4552) && Boolean(this._4552._2490))
         {
            this._6805 = this._4552._2490.verticalScrollPosition;
            if(Boolean(this._4569) && Boolean(this._4569._2490))
            {
               this._4569._2490.verticalScrollPosition = this._6805;
            }
            if(Boolean(this._4551) && Boolean(this._4551._2490))
            {
               this._4551._2490.verticalScrollPosition = this._6805;
            }
            _842._4534 = this._6805;
         }
         this._6829();
      }
      
      private function _6870(param1:int) : void
      {
         if(this._6805 >= this._6915.viewport.contentHeight - this.height && param1 > 0 || this._6805 <= 0 && param1 < 0)
         {
            return;
         }
         this._6805 += param1;
         if(Boolean(this._4569) && Boolean(this._4569._2490))
         {
            this._4569._2490.verticalScrollPosition = this._6805;
         }
         if(Boolean(this._4551) && Boolean(this._4551._2490))
         {
            this._4551._2490.verticalScrollPosition = this._6805;
         }
         if(Boolean(this._4552) && Boolean(this._4552._2490))
         {
            this._4552._2490.verticalScrollPosition = this._6805;
         }
         _842._4534 = this._6805;
         this._6829();
      }
      
      public function _4540() : void
      {
         var _loc1_:_13548 = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = int(this._6868.children.length);
         while(_loc2_ < _loc3_)
         {
            this._6914._4529(this._6868.children[_loc2_]);
            _loc1_ = this._6868.children[_loc2_];
            if(Boolean(_loc1_.children) && _loc1_.children.length > 0)
            {
               _loc4_ = 0;
               _loc5_ = int(_loc1_.children.length);
               while(_loc4_ < _loc5_)
               {
                  this._6914._4529(_loc1_.children[_loc4_]);
                  _loc4_++;
               }
            }
            _loc2_++;
         }
      }
      
      public function _4537() : void
      {
         var _loc1_:_13548 = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = int(this._6868.children.length);
         while(_loc2_ < _loc3_)
         {
            this._6914._4529(this._6868.children[_loc2_],false);
            _loc1_ = this._6868.children[_loc2_];
            if(Boolean(_loc1_.children) && _loc1_.children.length > 0)
            {
               _loc4_ = 0;
               _loc5_ = int(_loc1_.children.length);
               while(_loc4_ < _loc5_)
               {
                  this._6914._4529(_loc1_.children[_loc4_],false);
                  _loc4_++;
               }
            }
            _loc2_++;
         }
      }
      
      public function _4752(param1:Object) : void
      {
         this._6914._4529(param1,true);
      }
      
      public function _4745(param1:Object) : void
      {
         this._6914._4529(param1,false);
      }
      
      public function _3966(param1:Object) : Boolean
      {
         return this._6914._4530(param1);
      }
      
      public function get _6923() : int
      {
         return this._4714._6923;
      }
      
      public function get index() : int
      {
         return this._4714.index;
      }
      
      public function get _6909() : int
      {
         return this._4714._6909;
      }
      
      public function get _6908() : int
      {
         return this._4714._6908;
      }
      
      public function get frameRate() : int
      {
         return this._6903;
      }
      
      public function set frameRate(param1:int) : void
      {
         if(param1 <= 0)
         {
            param1 = int(DEFAULT_FPS);
         }
         if(this._6903 == param1)
         {
            return;
         }
         this._6903 = param1;
         if(this._6868)
         {
            this._6907 = this._6868._4642 * (1000 / this._6903);
            this._6868._1992.frameRate = this._6903;
         }
         dispatchEvent(new TimelineEvent(TimelineEvent.FRAME_RATE_CHANGE));
      }
      
      public function get curTime() : Number
      {
         return this._4760.curFrame / this._6903;
      }
      
      public function get curFrame() : int
      {
         return this._4760.curFrame;
      }
      
      public function get startIndex() : int
      {
         return this._4714.index;
      }
      
      public function get _6861() : int
      {
         return int((this._6835 - _988.MAX_GAP) / (this._6923 / this._6908));
      }
      
      public function get _4642() : int
      {
         if(this._6868)
         {
            return this._6868._4642;
         }
         return 0;
      }
      
      public function set startIndex(param1:int) : void
      {
         this._3932 = param1;
         if(this._3932 < 0)
         {
            this._3932 = 0;
         }
         this._4714.index = this._3932;
         this._3173();
      }
      
      public function get _4715() : int
      {
         return this._6866;
      }
      
      public function set _4715(param1:int) : void
      {
         this._6866 = param1;
      }
      
      public function get _4759() : Boolean
      {
         return this._6919;
      }
      
      public function get _6806() : int
      {
         return this._6804;
      }
      
      public function set _6920(param1:Boolean) : void
      {
         if(this._4018 != param1)
         {
            this._4018 = param1;
         }
      }
      
      public function set _4666(param1:_1042) : void
      {
         this._6914 = param1;
      }
      
      public function get _12629() : Boolean
      {
         return this._6832;
      }
      
      public function nextFrame() : void
      {
         this.gotoFrame(this._4760.curFrame + 1);
      }
      
      public function prevFrame() : void
      {
         this.gotoFrame(this._4760.curFrame - 1);
      }
      
      public function _14603() : void
      {
         var _loc1_:int = this._14848(true);
         if(_loc1_ > 0)
         {
            this.gotoFrame(_loc1_);
         }
      }
      
      public function _14492() : void
      {
         var _loc1_:int = this._14848(false);
         if(_loc1_ >= 0)
         {
            this.gotoFrame(_loc1_);
         }
      }
      
      private function _14848(param1:Boolean) : int
      {
         var _loc3_:_13547 = null;
         var _loc2_:int = -1;
         var _loc4_:int = this._6868.frames.length;
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc3_ = this._6868.frames[_loc5_];
            if(param1)
            {
               if(_loc3_.frameIndex > this._4760.curFrame)
               {
                  return this._6868.frames[_loc5_].frameIndex;
               }
            }
            else if(_loc3_.frameIndex < this._4760.curFrame)
            {
               _loc2_ = int(this._6868.frames[_loc5_].frameIndex);
            }
            _loc5_++;
         }
         return _loc2_;
      }
      
      public function gotoFrame(param1:int) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         this._4714.gotoFrame(param1);
         this._4760.curFrame = param1;
         this._4760.x = this._4714.x + this._4714._6796(this._4760.curFrame);
         this._4740.x = this._4760.x;
         this._3932 = this._4714.index;
         this._3173();
         dispatchEvent(new TimelineEvent(TimelineEvent.UPDATE,param1));
      }
      
      public function _6922(param1:Number) : void
      {
      }
      
      public function _4717() : void
      {
         if(this._6868)
         {
            this.gotoFrame(this._6868._4642);
         }
      }
      
      public function _4755() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:Number = NaN;
         if(this._6868)
         {
            _loc1_ = this._6868._4642;
            _loc2_ = _loc1_ * _988.MAX_GAP * 1.2;
            _loc3_ = this._4714._6190 / _loc2_;
            if(_loc3_ > 1)
            {
               _loc3_ = 1;
            }
            this._4714._4718 = _loc3_;
            if(this.startIndex != 0)
            {
               this.startIndex = 0;
            }
            else
            {
               this._3173();
            }
         }
         else
         {
            this.startIndex = 0;
         }
      }
      
      public function zoomIn() : void
      {
         this._4714.zoomIn();
         this._3173();
      }
      
      public function zoomOut() : void
      {
         this._4714.zoomOut();
         this._3173();
      }
      
      public function _4699(param1:Number) : void
      {
         if(this._4714._4718 != param1)
         {
            this._4714._4718 = param1;
            this._3173();
         }
      }
      
      private function tick(param1:int) : void
      {
         var _loc2_:Number = NaN;
         if(this._6919)
         {
            if(this._6907 <= 0)
            {
               return;
            }
            param1 *= PLAY_RATE[this._6866];
            if(this._6913)
            {
               this._5099 -= param1;
            }
            else
            {
               this._5099 += param1;
            }
            if(this._5099 > this._13999)
            {
               if(this.loop)
               {
                  this._5099 = this._13997;
               }
               else
               {
                  this._5099 = this._13999;
                  this._6878 = this._13998;
                  this.stop();
               }
            }
            else if(this._5099 < this._13997)
            {
               if(this.loop)
               {
                  this._5099 = this._13999;
               }
               else
               {
                  this._5099 = this._13997;
                  this._6878 = this._13996;
                  this.stop();
               }
            }
            if(this._6919)
            {
               this._6878 = this._5099 * this._6903 / 1000;
            }
            _loc2_ = (this._6878 - this.index) * (this._6923 / this._6908);
            if(_loc2_ < 0)
            {
               this._4760.visible = false;
               this._4740.x = LABEL_GAP + this._4714.x + (this._6878 - this.index) * (this._6923 / this._6908);
            }
            else
            {
               this._4760.visible = true;
               this._4760.x = LABEL_GAP + this._4714.x + (this._6878 - this.index) * (this._6923 / this._6908);
               this._4740.x = this._4760.x;
            }
            this._4760.curFrame = int(this._6878);
            if(this._13854)
            {
               if(this._6878 < this._4714.index)
               {
                  this.startIndex = this._6878;
               }
               else if(this._6878 > this._13995)
               {
                  this.startIndex = this._4714.index + (this._4760.curFrame - this._13995);
               }
            }
            dispatchEvent(new TimelineEvent(TimelineEvent.UPDATE,this._6878));
         }
         if(this._6892 && (this._6851 || this._6882))
         {
            if(this._6885 < this._6855)
            {
               this._6885 += this._6820;
               if(this._6885 > this._6855)
               {
                  this._6885 = this._6855;
               }
            }
            if(this._6851)
            {
               this._6870(this._6885);
            }
            else
            {
               this._6870(-this._6885);
            }
            this._6830(null);
         }
         else if(this._6851 || this._6882)
         {
            if(this._6885 > 0)
            {
               this._6885 -= this._6820;
               if(this._6885 < 0)
               {
                  this._6885 = 0;
                  this._6851 = false;
                  this._6882 = false;
               }
            }
            if(this._6851)
            {
               this._6870(this._6885);
            }
            else
            {
               this._6870(-this._6885);
            }
         }
         else if(!(this._6892 || this._6851 || this._6882))
         {
            if(!this._6919)
            {
               this.removeEventListener(Event.ENTER_FRAME,this._5071);
            }
         }
      }
      
      public function _4756() : void
      {
         this._6913 = true;
         if(this._4760.curFrame == 0)
         {
            this._4760.curFrame = this._6804;
         }
         this.play();
      }
      
      public function _4728() : void
      {
         this._6913 = false;
         if(this._4760.curFrame == this._6804)
         {
            this._4760.curFrame = 0;
         }
         this.play();
      }
      
      public function play() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         if(this._6868)
         {
            if(this._6919)
            {
               this.stop();
            }
            else
            {
               this._6907 = this._6868._4642 * (1000 / this._6903);
               if(this._13845 && this._13843 && this._13845.curFrame >= 0 && this._13843.curFrame >= 0)
               {
                  _loc1_ = this._13845.curFrame;
                  _loc2_ = this._13843.curFrame;
                  if(_loc1_ > _loc2_)
                  {
                     _loc1_ = this._13843.curFrame;
                     _loc2_ = this._13845.curFrame;
                  }
                  this._13997 = _loc1_ * (1000 / this._6903);
                  this._13999 = _loc2_ * (1000 / this._6903);
                  this._13996 = _loc1_;
                  this._13998 = _loc2_;
                  if(this._4760.curFrame < this._13996 || this._4760.curFrame > this._13998)
                  {
                     this._4760.curFrame = this._13996;
                  }
                  this._5099 = this._4760.curFrame * (1000 / this._6903);
               }
               else
               {
                  this._5099 = this._4760.curFrame * (1000 / this._6903);
                  this._13997 = 0;
                  this._13999 = this._6907;
                  this._13996 = 0;
                  this._13998 = this._6868._4642;
               }
               this._lastTime = getTimer();
               this._6919 = true;
               addEventListener(Event.ENTER_FRAME,this._5071);
            }
         }
      }
      
      public function _13846() : void
      {
         if(this._6919)
         {
            if(!(this._13845 && this._13843 && this._13845.curFrame >= 0 && this._13843.curFrame >= 0))
            {
               this._13999 = this._6907;
               this._13998 = this._6868._4642;
            }
         }
      }
      
      private function _5071(param1:Event) : void
      {
         var _loc2_:int = getTimer();
         this.tick(_loc2_ - this._lastTime);
         this._lastTime = _loc2_;
      }
      
      public function stop() : void
      {
         if(!this._6882 && !this._6851 && !this._6892)
         {
            removeEventListener(Event.ENTER_FRAME,this._5071);
         }
         this._4760.curFrame = int(this._6878);
         this._6919 = false;
         this._6860();
         dispatchEvent(new TimelineEvent(TimelineEvent.STOP_ANIMATION));
      }
      
      private function _6830(param1:MouseEvent) : void
      {
         this._6843 = true;
         var _loc2_:Number = mouseY + this._6805;
         if(_loc2_ < LABEL_HEIGHT)
         {
            _loc2_ = LABEL_HEIGHT;
         }
         var _loc3_:Number = mouseX < FRAME_NAME_WIDTH ? FRAME_NAME_WIDTH : mouseX;
         var _loc4_:Number = _loc3_ > this._6844.x ? this._6844.x : _loc3_;
         var _loc5_:Number = _loc2_ > this._6844.y ? this._6844.y : _loc2_;
         var _loc6_:Number = _loc3_ > this._6844.x ? _loc3_ : this._6844.x;
         var _loc7_:Number = _loc2_ > this._6844.y ? _loc2_ : this._6844.y;
         var _loc8_:Number = Math.abs(_loc4_ - _loc6_);
         var _loc9_:Number = Math.abs(_loc5_ - _loc7_);
         var _loc10_:Array = this._6813(_loc4_,_loc5_,_loc8_,_loc9_);
         this._6865.frameX = _loc4_;
         this._6865.frameY = _loc10_[0] * FRAME_HEIGHT + LABEL_HEIGHT;
         this._6865.frameWidth = _loc8_;
         this._6865.frameHeight = _loc10_[1] * FRAME_HEIGHT;
         this._6865.draw();
         if(mouseY > _842._2139)
         {
            if(!this._6851)
            {
               this._6892 = true;
               this._6851 = true;
               this._6885 = 0;
            }
            this._6882 = false;
            if(!this.hasEventListener(Event.ENTER_FRAME))
            {
               this.addEventListener(Event.ENTER_FRAME,this._5071);
            }
         }
         else if(mouseY < LABEL_HEIGHT)
         {
            if(!this._6882)
            {
               this._6892 = true;
               this._6882 = true;
               this._6885 = 0;
            }
            this._6851 = false;
            if(!this.hasEventListener(Event.ENTER_FRAME))
            {
               this.addEventListener(Event.ENTER_FRAME,this._5071);
            }
         }
         else
         {
            this._6892 = false;
         }
      }
      
      private function _11179(param1:MouseEvent) : void
      {
         this._6843 = true;
         var _loc2_:Number = LABEL_HEIGHT - FRAME_HEIGHT;
         var _loc3_:Number = mouseX < FRAME_NAME_WIDTH ? FRAME_NAME_WIDTH : mouseX;
         var _loc4_:Number = _loc3_ > this._6844.x ? this._6844.x : _loc3_;
         var _loc5_:Number = _loc2_;
         var _loc6_:Number = _loc3_ > this._6844.x ? _loc3_ : this._6844.x;
         var _loc7_:Number = _loc2_;
         var _loc8_:Number = Math.abs(_loc4_ - _loc6_);
         var _loc9_:Number = FRAME_HEIGHT;
         var _loc10_:Array = this._6813(_loc4_,_loc5_,_loc8_,_loc9_);
         this._6865.frameX = _loc4_;
         this._6865.frameY = _loc2_;
         this._6865.frameWidth = _loc8_;
         this._6865.frameHeight = FRAME_HEIGHT;
         this._6865.draw();
         this._6892 = false;
      }
      
      private function _6813(param1:Number, param2:Number, param3:Number, param4:Number) : Array
      {
         var _loc5_:int = int((param2 - LABEL_HEIGHT) / FRAME_HEIGHT);
         var _loc6_:int = FRAME_HEIGHT - (param2 - LABEL_HEIGHT) % FRAME_HEIGHT;
         var _loc7_:int = Math.ceil((param4 - _loc6_) / FRAME_HEIGHT);
         if(_loc6_ != 0)
         {
            _loc7_++;
         }
         var _loc8_:int = this._4714._6883(param1 - FRAME_NAME_WIDTH);
         var _loc9_:int = this._4714._6883(param1 + param3 - FRAME_NAME_WIDTH);
         this._6865._5701 = _loc8_;
         this._6865._5699 = _loc9_;
         var _loc10_:Object = {
            "timelineY":_loc5_,
            "timelineHeight":_loc7_,
            "frameStart":_loc8_,
            "frameEnd":_loc9_,
            "id":this._6865._6266,
            "isCtrl":this._6900
         };
         dispatchEvent(new TimelineEvent(TimelineEvent.SELECT_RECT,_loc10_));
         return [_loc5_,_loc7_];
      }
      
      private function _11176() : _842
      {
         var _loc1_:_842 = null;
         if(this._6850.length > 0)
         {
            _loc1_ = this._6850.pop();
         }
         else
         {
            _loc1_ = new _842();
         }
         _loc1_.mouseChildren = false;
         _loc1_.mouseEnabled = false;
         _loc1_.addEventListener(MouseEvent.MOUSE_DOWN,this._6809);
         _loc1_.addEventListener(MouseEvent.MOUSE_OVER,this._6871);
         _loc1_.addEventListener(MouseEvent.MOUSE_OUT,this._6875);
         _loc1_.addEventListener(MouseEvent.MOUSE_WHEEL,this._6896);
         _loc1_._6247 = this._4714._6254;
         return _loc1_;
      }
      
      private function _11175(param1:_842) : void
      {
         param1.removeEventListener(MouseEvent.MOUSE_DOWN,this._6809);
         param1.removeEventListener(MouseEvent.ROLL_OVER,this._6871);
         param1.removeEventListener(MouseEvent.ROLL_OUT,this._6875);
         param1.removeEventListener(MouseEvent.MOUSE_WHEEL,this._6896);
         param1.hide();
         this._6850.push(param1);
      }
      
      private function _6874() : _842
      {
         var _loc1_:_842 = null;
         _loc1_ = this._11176();
         _loc1_._11170 = false;
         if(this._6887.indexOf(_loc1_) == -1)
         {
            this._6887.push(_loc1_);
         }
         return _loc1_;
      }
      
      private function _11184() : _842
      {
         var _loc1_:_842 = null;
         _loc1_ = this._11176();
         _loc1_._11170 = true;
         if(this._11185.indexOf(_loc1_) == -1)
         {
            this._11185.push(_loc1_);
         }
         return _loc1_;
      }
      
      private function _6829() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         if(this._6887.length > 0)
         {
            _loc1_ = 0;
            _loc2_ = int(this._6887.length);
            while(_loc1_ < _loc2_)
            {
               this._6887[_loc1_].draw();
               _loc1_++;
            }
         }
         if(this._11185.length > 0)
         {
            _loc1_ = 0;
            _loc2_ = int(this._11185.length);
            while(_loc1_ < _loc2_)
            {
               this._11185[_loc1_].draw();
               _loc1_++;
            }
         }
      }
      
      public function _3446() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         if(this._6887.length > 0)
         {
            _loc1_ = 0;
            _loc2_ = int(this._6887.length);
            while(_loc1_ < _loc2_)
            {
               this._11175(this._6887[_loc1_]);
               _loc1_++;
            }
            this._6887.length = 0;
            this._6817 = false;
         }
         if(this._11185.length > 0)
         {
            _loc1_ = 0;
            _loc2_ = int(this._11185.length);
            while(_loc1_ < _loc2_)
            {
               this._11175(this._11185[_loc1_]);
               _loc1_++;
            }
            this._11185.length = 0;
            this._6817 = false;
         }
      }
      
      public function _4655() : void
      {
         var _loc1_:int = 0;
         if(this._6865)
         {
            _loc1_ = int(this._6887.indexOf(this._6865));
            if(_loc1_ != -1)
            {
               this._6887.splice(_loc1_,1);
            }
            else
            {
               _loc1_ = int(this._11185.indexOf(this._6865));
               if(_loc1_ != -1)
               {
                  this._11185.splice(_loc1_,1);
               }
            }
            this._11175(this._6865);
            this._6865 = null;
         }
      }
      
      private function _6801() : void
      {
         this._6865.mouseEnabled = true;
         this._6865.mouseChildren = true;
      }
      
      private function _6875(param1:MouseEvent) : void
      {
         _14._1602(_12.CURSOR_FRAME_MOVE);
         _14._1602(_12.CURSOR_FRAME_SCALE);
         this._6817 = false;
      }
      
      private function _6871(param1:MouseEvent) : void
      {
         if(this._6888)
         {
            return;
         }
         if(param1.target.name == _842.LEFT_HANDLER || param1.target.name == _842.RIGHT_HANDLER)
         {
            _14.setCursor(_12.CURSOR_FRAME_SCALE,4);
         }
         else
         {
            _14.setCursor(_12.CURSOR_FRAME_MOVE,4);
         }
         this._6817 = true;
      }
      
      private function _6809(param1:MouseEvent) : void
      {
         this._6888 = true;
         if(param1.target.name == _842.LEFT_HANDLER)
         {
            this._6859 = true;
            this._6842 = false;
            _14.setCursor(_12.CURSOR_FRAME_SCALE,4);
            _14.lock();
         }
         else if(param1.target.name == _842.RIGHT_HANDLER)
         {
            this._6859 = false;
            this._6842 = true;
            _14.setCursor(_12.CURSOR_FRAME_SCALE,4);
            _14.lock();
         }
         else
         {
            this._6859 = false;
            this._6842 = false;
            this._6875(null);
            _14.setCursor(_12.CURSOR_FRAME_MOVE,5);
         }
      }
      
      private function _6896(param1:MouseEvent) : void
      {
         if(this._6897())
         {
            this._6915.viewport.dispatchEvent(param1);
         }
      }
      
      public function _6857(param1:int) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = int(this._6887.length);
         while(_loc2_ < _loc3_)
         {
            this._6887[_loc2_]._6250(param1);
            _loc2_++;
         }
         _loc2_ = 0;
         _loc3_ = int(this._11185.length);
         while(_loc2_ < _loc3_)
         {
            this._11185[_loc2_]._6250(param1);
            _loc2_++;
         }
      }
      
      private function _6810(param1:int) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = int(this._6887.length);
         while(_loc2_ < _loc3_)
         {
            this._6887[_loc2_]._6249(param1);
            _loc2_++;
         }
         _loc2_ = 0;
         _loc3_ = int(this._11185.length);
         while(_loc2_ < _loc3_)
         {
            this._11185[_loc2_]._6249(param1);
            _loc2_++;
         }
      }
      
      private function _6811(param1:int) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = int(this._6887.length);
         while(_loc2_ < _loc3_)
         {
            this._6887[_loc2_]._6253(param1);
            _loc2_++;
         }
         _loc2_ = 0;
         _loc3_ = int(this._11185.length);
         while(_loc2_ < _loc3_)
         {
            this._11185[_loc2_]._6253(param1);
            _loc2_++;
         }
      }
      
      private function _6802() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = int(this._6887.length);
         while(_loc1_ < _loc2_)
         {
            this._6887[_loc1_]._6248();
            _loc1_++;
         }
         _loc1_ = 0;
         _loc2_ = int(this._11185.length);
         while(_loc1_ < _loc2_)
         {
            this._11185[_loc1_]._6248();
            _loc1_++;
         }
      }
      
      private function _6827() : Array
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc1_:int = int.MAX_VALUE;
         var _loc2_:int = 0;
         _loc4_ = int(this._6887.length);
         if(_loc4_ > 0)
         {
            _loc3_ = 0;
            while(_loc3_ < _loc4_)
            {
               if(_loc1_ > this._6887[_loc3_]._5701)
               {
                  _loc1_ = this._6887[_loc3_]._5701;
               }
               if(_loc2_ < this._6887[_loc3_]._5699)
               {
                  _loc2_ = this._6887[_loc3_]._5699;
               }
               _loc3_++;
            }
         }
         _loc4_ = int(this._11185.length);
         if(_loc4_ > 0)
         {
            _loc3_ = 0;
            while(_loc3_ < _loc4_)
            {
               if(_loc1_ > this._11185[_loc3_]._5701)
               {
                  _loc1_ = this._11185[_loc3_]._5701;
               }
               if(_loc2_ < this._11185[_loc3_]._5699)
               {
                  _loc2_ = this._11185[_loc3_]._5699;
               }
               _loc3_++;
            }
         }
         var _loc5_:Array;
         (_loc5_ = [])[0] = _loc1_;
         _loc5_[1] = _loc2_;
         return _loc5_;
      }
      
      public function _4602(param1:int) : void
      {
         this._6878 = param1;
         this._4760.curFrame = this._6878;
         this._6860();
      }
      
      public function _12631(param1:Number, param2:Number) : Boolean
      {
         var _loc3_:Point = this.globalToLocal(new Point(param1,param2));
         if(_loc3_.x > FRAME_NAME_WIDTH)
         {
            return true;
         }
         return false;
      }
      
      public function _13830() : void
      {
         if(this._6914)
         {
            this._11173.text = this._6868.name;
         }
      }
   }
}

