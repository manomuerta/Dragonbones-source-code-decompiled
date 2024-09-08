package _586
{
   import _1404._1407;
   import _40.TimelineVOBase;
   import _40._41;
   import _40._48;
   import _472._473;
   import _51._52;
   import _51._70;
   import _51._79;
   import _521._523;
   import _521._524;
   import _54._10242;
   import _54._10243;
   import _54._10244;
   import _54._10245;
   import _54._10246;
   import _54._10428;
   import _54._10429;
   import _54._10430;
   import _54._56;
   import _54._57;
   import _54._58;
   import _54._59;
   import _54._60;
   import _54._61;
   import _54._63;
   import _54._64;
   import _54._65;
   import _54._67;
   import _541._540;
   import _555._556;
   import _6._9;
   import _636.ComicEvent;
   import _644._643;
   import _644._645;
   import _644._646;
   import _708._715;
   import _710._711;
   import _710._712;
   import _73._72;
   import _777._779;
   import _783.ComicNotification;
   import _783.CommandNotification;
   import _783.MenuNotification;
   import _783.PanelNotification;
   import _783.StageNotification;
   import _790._808;
   import _790._810;
   import _790._811;
   import _790._812;
   import _81._86;
   import _81._91;
   import _813.ComicOrderPanel;
   import _93._94;
   import _953._956;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.utils.getTimer;
   
   public class _589 extends _94
   {
      private static const DEFAULT_POSITION_X:Number = 200;
      
      private static const DEFAULT_ROTATION:Number = Math.PI / 4;
      
      private static const DEFAULT_SCALE:Number = 2;
      
      private static const DEFAULT_ALPHA:Number = 0.5;
      
      private static const DEFAULT_EASING:int = 1;
      
      private static const DEFAULT_DURING:Number = 1;
      
      private var _5078:_811;
      
      private var _5042:_812;
      
      private var _5048:_810;
      
      private var _5033:_808;
      
      private var _5097:_956;
      
      private var _4761:_643;
      
      private var _5079:_79;
      
      private var _5028:_590;
      
      private var _5034:_523;
      
      private var _5067:Boolean;
      
      private var _5075:Boolean;
      
      private var _5091:Boolean;
      
      private var _5041:_41;
      
      private var _5040:_48;
      
      private var _5099:int;
      
      private var _lastTime:int;
      
      private var _5055:_79;
      
      private var _5080:Boolean;
      
      private var _10478:Boolean;
      
      private var _10354:Boolean;
      
      private var _3582:ComicOrderPanel;
      
      private var _10353:Vector.<TimelineVOBase>;
      
      private var _10475:Vector.<TimelineVOBase>;
      
      public function _589()
      {
         super();
         this._5028 = _1407.getInstance(_590) as _590;
         this._5034 = _1407.getInstance(_523) as _523;
      }
      
      override public function start() : void
      {
         super.start();
         this._5028.start();
      }
      
      public function stop() : void
      {
         this.dispose();
         this._5028.stop();
         this._5051 = null;
      }
      
      public function _4906(param1:_811, param2:_956) : void
      {
         this._5078 = param1;
         this._5042 = param1._5084;
         this._5048 = param1._5092;
         this._5033 = param1._5056;
         this._5097 = param2;
         this._3582 = _1407.getInstance(ComicOrderPanel) as ComicOrderPanel;
      }
      
      override protected function dispose() : void
      {
         super.dispose();
         this._5101();
         _1564(StageNotification.UPDATE_SELECTED_ITEMS,this._3580);
         _1564(ComicNotification.ROLLOVER_ITEM,this._5065);
         _1564(ComicNotification.ROLLOUT_ITEM,this._5074);
         _1564(ComicNotification.UPDATE_SELCTEDS,this._5036);
         _1564(StageNotification.STOP_TRANSFORM,this._5059);
         _1564(StageNotification.START_TRANSFORM,this._4355);
         _1564(ComicNotification.SHOW_ANIMATION,this._5060);
         _1564(ComicNotification.HIDE_ANIMATION,this._5061);
         _1564(ComicNotification.PREVIEW_TRACK,this._5054);
         _1564(MenuNotification.ADD_COMIC_TWEEN,this._5063);
         _1564(ComicNotification.SELECT_TWEENS,this._5037);
         _1564(MenuNotification.CHANGE_COMIC_TWEEN,this._5045);
         _1564(MenuNotification.CHANGE_COMIC_APPEAR_TWEEN,this._5030);
         _1564(MenuNotification.CHANGE_COMIC_DISAPPEAR_TWEEN,this._10350);
         _1564(ComicNotification.UPDATE_STRIP,this._3589);
         _1564(StageNotification.CANCEL_SELECTION,this._4974);
         _1564(PanelNotification.SCENE_PANEL_DELETE_ITEM,this._5064);
         this._5042.removeEventListener(ComicEvent.OVER_TRACK,this._5082);
         this._5042.removeEventListener(ComicEvent.OUT_TRACK,this._5087);
         this._5033.removeEventListener(ComicEvent.OVER_SLOT,this._5089);
         this._5033.removeEventListener(ComicEvent.OUT_SLOT,this._5093);
         if(this._5097)
         {
            this._5097.removeEventListener(MouseEvent.MOUSE_MOVE,this._5052);
            this._5097.removeEventListener(MouseEvent.MOUSE_DOWN,this._5053);
            stage.removeEventListener(MouseEvent.MOUSE_UP,this._5073);
            this._5097.removeEventListener(MouseEvent.RIGHT_MOUSE_DOWN,this._4013);
            this._5097.removeEventListener(MouseEvent.RIGHT_MOUSE_UP,this._5094);
            this._5097.removeEventListener(MouseEvent.RIGHT_CLICK,this._10510);
         }
         _1564(MenuNotification.SWAP_IMAGE,this._10507);
      }
      
      override protected function _1576() : void
      {
         super._1576();
         _1565(StageNotification.UPDATE_SELECTED_ITEMS,this._3580);
         _1565(ComicNotification.ROLLOVER_ITEM,this._5065);
         _1565(ComicNotification.ROLLOUT_ITEM,this._5074);
         _1565(ComicNotification.UPDATE_SELCTEDS,this._5036);
         _1565(StageNotification.STOP_TRANSFORM,this._5059);
         _1565(StageNotification.START_TRANSFORM,this._4355);
         _1565(ComicNotification.SHOW_ANIMATION,this._5060);
         _1565(ComicNotification.HIDE_ANIMATION,this._5061);
         _1565(ComicNotification.PREVIEW_TRACK,this._5054);
         _1565(MenuNotification.ADD_COMIC_TWEEN,this._5063);
         _1565(ComicNotification.SELECT_TWEENS,this._5037);
         _1565(MenuNotification.CHANGE_COMIC_TWEEN,this._5045);
         _1565(MenuNotification.CHANGE_COMIC_APPEAR_TWEEN,this._5030);
         _1565(MenuNotification.CHANGE_COMIC_DISAPPEAR_TWEEN,this._10350);
         _1565(ComicNotification.UPDATE_STRIP,this._3589);
         _1565(StageNotification.CANCEL_SELECTION,this._4974);
         _1565(StageNotification.UPDATE_EDIT_MODE,this._10781);
         _1565(PanelNotification.SCENE_PANEL_DELETE_ITEM,this._5064);
         _1565(PanelNotification.COMIC_PANEL_DELETE_ITEM,this._5038);
         this._5042.addEventListener(ComicEvent.OVER_TRACK,this._5082);
         this._5042.addEventListener(ComicEvent.OUT_TRACK,this._5087);
         this._5033.addEventListener(ComicEvent.OVER_SLOT,this._5089);
         this._5033.addEventListener(ComicEvent.OUT_SLOT,this._5093);
         if(this._5097)
         {
            this._5097.addEventListener(MouseEvent.MOUSE_MOVE,this._5052);
            this._5097.addEventListener(MouseEvent.MOUSE_DOWN,this._5053);
            this._5097.addEventListener(MouseEvent.RIGHT_MOUSE_DOWN,this._4013);
            this._5097.addEventListener(MouseEvent.RIGHT_MOUSE_UP,this._5094);
            this._5097.addEventListener(MouseEvent.RIGHT_CLICK,this._10510,false,100);
         }
         _1565(MenuNotification.SWAP_IMAGE,this._10507);
      }
      
      private function _10781(param1:StageNotification) : void
      {
         if(_2220._2873 == _715.COMIC)
         {
            if(Boolean(this._4761) && Boolean(this._4761._5046))
            {
               this._4761._5046.refresh();
            }
         }
      }
      
      private function _10507(param1:MenuNotification) : void
      {
         var _loc2_:_79 = null;
         var _loc3_:_70 = null;
         if(this._5034._3050.length == 1)
         {
            _loc2_ = this._5034._3050[0];
         }
         if(_loc2_)
         {
            _loc3_ = _loc2_._2049;
         }
         if(Boolean(_loc2_) && Boolean(_loc3_))
         {
            _1567(new StageNotification(StageNotification.SWAP_IMAGE,_loc2_));
         }
      }
      
      private function _10510(param1:MouseEvent) : void
      {
         param1.stopImmediatePropagation();
      }
      
      private function _3589(param1:ComicNotification) : void
      {
         this._3089();
      }
      
      public function _3089() : void
      {
         var _loc1_:Vector.<_645> = this._4761._3089();
         if(_loc1_.length > 0)
         {
            this.refresh();
         }
      }
      
      private function _5038(param1:PanelNotification) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:_67 = null;
         var _loc5_:Boolean = false;
         var _loc6_:_645 = null;
         var _loc7_:_79 = null;
         var _loc8_:_52 = null;
         var _loc9_:_52 = null;
         var _loc10_:int = 0;
         var _loc11_:Object = null;
         var _loc12_:Vector.<_67> = null;
         var _loc13_:_79 = null;
         var _loc14_:_646 = null;
         var _loc15_:Vector.<_67> = null;
         var _loc16_:_645 = null;
         var _loc17_:Object = null;
         if(stage.focus == null)
         {
            return;
         }
         if(this._3055._3582.contains(stage.focus))
         {
            _loc12_ = this._3055._3592;
            if(_loc12_.length > 0)
            {
               _loc7_ = _loc12_[0]._1837;
               _loc6_ = this._3565(_loc7_);
               _loc8_ = _loc7_.parentBoneData;
               (_loc11_ = {})._3110 = _loc12_;
               _loc11_._3070 = this._4761._3116(_loc8_,_loc7_);
               _1567(new CommandNotification(CommandNotification.DELETE_COMIC_TWEENS,_loc11_));
            }
         }
         else
         {
            if(this._5034._2889[0] is _79)
            {
               _loc13_ = this._5034._2889[0] as _79;
               _loc16_ = this._3567._3116(_loc13_.parentBoneData,_loc13_);
               _loc14_ = _loc16_.tracks[0];
            }
            else if(this._5034._2889[0] is _646)
            {
               _loc14_ = this._5034._2889[0] as _646;
               _loc13_ = _loc14_._1837;
            }
            _loc15_ = _loc14_.tweens;
            if(_loc15_.length > 0)
            {
               (_loc17_ = {})._3110 = _loc15_;
               _loc17_._3070 = this._4761._3116(_loc13_.parentBoneData,_loc13_);
               _1567(new CommandNotification(CommandNotification.DELETE_COMIC_TWEENS,_loc17_));
            }
         }
      }
      
      private function _5064(param1:PanelNotification) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:_67 = null;
         var _loc5_:Boolean = false;
         var _loc6_:_645 = null;
         var _loc7_:_79 = null;
         var _loc8_:_52 = null;
         var _loc9_:_52 = null;
         var _loc10_:int = 0;
         var _loc11_:Object = null;
         var _loc12_:Vector.<_67> = null;
         var _loc13_:_646 = null;
         if(stage.focus == null)
         {
            return;
         }
         if(this._3055._3582.contains(stage.focus))
         {
            _loc12_ = this._3055._3592;
            if(_loc12_.length > 0 && this._10479(_loc12_))
            {
               _loc7_ = _loc12_[0]._1837;
               _loc6_ = this._3565(_loc7_);
               _loc8_ = _loc7_.parentBoneData;
               (_loc11_ = {})._3110 = _loc12_;
               _loc11_._3070 = this._4761._3116(_loc8_,_loc7_);
               _1567(new CommandNotification(CommandNotification.DELETE_COMIC_TWEENS,_loc11_));
            }
         }
         else if(this._5034._3050.length > 0)
         {
            _loc7_ = this._5034._3050[0];
            _loc9_ = (_loc8_ = _loc7_.parentBoneData).parentBoneData;
            _loc10_ = int(_loc8_.rootArmatureData._1780.indexOf(_loc7_));
            (_loc11_ = {})._1836 = _loc8_;
            _loc11_._1837 = _loc7_;
            _loc11_._3052 = _loc9_;
            _loc11_._3070 = this._4761._3116(_loc8_,_loc7_);
            if(_loc10_ >= 0)
            {
               _loc11_.zOrder = _loc10_;
            }
            _1567(new CommandNotification(CommandNotification.DELETE_COMICOBJECT,_loc11_));
         }
         else if(this._5034._3584.length > 0)
         {
            _loc13_ = this._5034._3584[0];
            (_loc11_ = {})._3070 = _loc13_.parent;
            _loc11_._3077 = _loc13_;
            _loc11_._1992 = this._4761._1992;
            _loc11_._2070 = _loc13_.track._2070;
            _loc11_._2069 = _loc13_.track;
            _loc11_._3067 = _loc13_.parent.tracks.indexOf(_loc13_);
            _loc11_._3074 = _loc13_.track.parent.tracks.indexOf(_loc13_.track);
            _loc11_.deleteTrack = _loc13_.track.tweens.length == _loc13_.tweens.length;
            if(_loc11_.deleteTrack)
            {
               _loc11_.deleteStrip = _loc13_.track.parent.tracks.length == 1;
            }
            _1567(new CommandNotification(CommandNotification.DELETE_COMIC_TRACKMODEL,_loc11_));
         }
      }
      
      private function _10479(param1:Vector.<_67>) : Boolean
      {
         var _loc3_:_67 = null;
         var _loc4_:_79 = null;
         var _loc5_:_56 = null;
         var _loc2_:_67 = param1[0];
         if(_loc2_.index == 0 && _loc2_._2069.index == 0)
         {
            if(_loc2_._2069.tweens.length > 1)
            {
               _loc3_ = _loc2_._2069.tweens[1];
            }
            else if(_loc2_._2070.tracks.length > 1)
            {
               _loc3_ = _loc2_._2070.tracks[1].tweens[0];
            }
            if(_loc3_)
            {
               _loc4_ = _loc3_._1837;
               _loc5_ = this._4761._1992._2045(_loc4_);
               if(_loc5_ != null && _loc5_ != _loc2_._2070)
               {
                  return false;
               }
            }
         }
         return true;
      }
      
      public function _3057(param1:_646) : void
      {
         if(param1)
         {
            _1567(new ComicNotification(ComicNotification.PREVIEW_TRACK,param1));
         }
      }
      
      private function _5054(param1:ComicNotification) : void
      {
         var _loc2_:_646 = param1.data as _646;
         if(_loc2_)
         {
            this._5076(_loc2_);
         }
      }
      
      private function _5063(param1:MenuNotification) : void
      {
         var _loc2_:_72 = param1.data as _72;
         if(_loc2_)
         {
            this._5081(_loc2_);
         }
      }
      
      private function _5066(param1:MenuNotification) : void
      {
         this._5081(_72.SCALE);
      }
      
      private function _5043(param1:MenuNotification) : void
      {
         this._5081(_72.ROTATION);
      }
      
      private function _5044(param1:MenuNotification) : void
      {
         this._5081(_72.POSITION);
      }
      
      private function _5062(param1:MenuNotification) : void
      {
         this._5081(_72.ALPHA);
      }
      
      private function _5032(param1:_72) : void
      {
         var _loc2_:_79 = null;
         var _loc3_:_646 = null;
         if(this._5034._2889.length == 0)
         {
            return;
         }
         if(this._5034._2889[0] is _79)
         {
            _loc2_ = this._5034._2889[0] as _79;
         }
         else if(this._5034._2889[0] is _646)
         {
            _loc3_ = this._5034._2889[0] as _646;
            _loc2_ = _loc3_._1837;
         }
         if(_loc2_)
         {
            this._5029(param1,_loc2_);
         }
      }
      
      private function _5081(param1:_72) : void
      {
         var _loc2_:_79 = null;
         var _loc3_:_52 = null;
         var _loc4_:_646 = null;
         var _loc6_:_67 = null;
         var _loc7_:_57 = null;
         var _loc8_:_57 = null;
         var _loc9_:Object = null;
         var _loc10_:_86 = null;
         var _loc11_:_86 = null;
         var _loc5_:int = -1;
         if(this._5034._2889[0] is _79)
         {
            _loc2_ = this._5034._2889[0] as _79;
            this._5029(param1,_loc2_);
         }
         else if(this._5034._2889[0] is _646)
         {
            _loc4_ = this._5034._2889[0] as _646;
            _loc3_ = _loc4_._1836;
            _loc2_ = _loc4_._1837;
            _loc7_ = _loc4_.track;
            _loc10_ = new _86();
            _loc11_ = _loc3_._1724;
            _loc4_.parent._5039(_loc4_,_loc10_);
            _loc10_.x -= _loc11_.x;
            _loc10_.y -= _loc11_.y;
            _loc10_.rotation -= _loc11_.rotation;
            _loc10_.scaleX /= _loc11_.scaleX;
            _loc10_.scaleY /= _loc11_.scaleY;
            _loc6_ = this._5090(param1,_loc7_,_loc3_,_loc2_,_loc10_);
            this._5027(_loc4_,_loc6_);
            _779.instance._10351(_loc6_);
         }
      }
      
      private function _5029(param1:_72, param2:_79) : void
      {
         var _loc3_:_52 = null;
         var _loc5_:_67 = null;
         var _loc6_:_57 = null;
         var _loc7_:Object = null;
         var _loc8_:_86 = null;
         var _loc10_:_57 = null;
         var _loc11_:_56 = null;
         var _loc4_:int = -1;
         _loc3_ = param2.parentBoneData;
         var _loc9_:_645 = this._4761._3116(_loc3_,param2);
         _loc8_ = new _86();
         if(_loc9_.tracks.length > 0 || _loc9_._3107 != null || _loc9_._10287 != null)
         {
            if(_loc9_.tracks.length > 0)
            {
               _loc10_ = _loc9_.tracks[0].track;
               _loc4_ = int(_loc10_.parent.tracks.indexOf(_loc10_));
            }
            else if(_loc9_._3107)
            {
               _loc10_ = _loc9_._3107.track;
               _loc4_ = _loc10_.parent.tracks.indexOf(_loc10_) + 1;
            }
            else if(_loc9_._10287)
            {
               _loc10_ = _loc9_._10287.track;
               _loc4_ = _loc10_.index + 1;
            }
            _loc5_ = this._5090(param1,_loc10_,_loc3_,param2,_loc8_);
            _loc6_ = new _57(_loc10_.parent);
            _loc6_.addTween(_loc5_);
            (_loc7_ = {})._2070 = _loc10_.parent;
            _loc7_._2069 = _loc6_;
            _loc7_._2071 = _loc5_;
            _loc7_._3070 = _loc9_;
            _loc7_._3067 = 0;
            _loc7_._3074 = _loc4_;
            _1567(new CommandNotification(CommandNotification.ADD_COMIC_TRACK_TWEEN,_loc7_));
         }
         else
         {
            _loc11_ = new _56(this._4761._1992);
            _loc6_ = new _57(_loc11_);
            _loc5_ = this._5090(param1,_loc6_,_loc3_,param2,_loc8_);
            if(!_loc5_)
            {
               return;
            }
            _loc6_.addTween(_loc5_);
            _loc11_._1829(_loc6_);
            (_loc7_ = {})._2070 = _loc11_;
            _loc7_._2069 = _loc6_;
            _loc7_._2071 = _loc5_;
            _loc7_._3070 = _loc9_;
            _loc7_._1744 = this._4761._1992;
            _loc7_._3067 = 0;
            _loc7_._3074 = 0;
            _1567(new CommandNotification(CommandNotification.ADD_COMIC_STRIP_TRACK_TWEEN,_loc7_));
         }
         _779.instance._10351(_loc5_);
      }
      
      private function _5090(param1:_72, param2:_57, param3:_52, param4:_79, param5:_86) : _67
      {
         var _loc6_:_67 = null;
         var _loc7_:Point = null;
         var _loc8_:Number = NaN;
         var _loc9_:Point = null;
         var _loc10_:Number = NaN;
         switch(param1)
         {
            case _72.POSITION:
            case _72.CHANGE_POSITION:
               (_loc7_ = new Point()).x = param5.x + DEFAULT_POSITION_X;
               _loc7_.y = 0;
               _loc6_ = new _63(param2,param3,param4,DEFAULT_EASING,_loc7_,DEFAULT_DURING,0);
               break;
            case _72.ROTATION:
            case _72.CHANGE_ROTATION:
               _loc8_ = param5.rotation + DEFAULT_ROTATION;
               _loc6_ = new _64(param2,param3,param4,DEFAULT_EASING,_loc8_,DEFAULT_DURING);
               break;
            case _72.SCALE:
            case _72.CHANGE_SCALE:
               (_loc9_ = new Point(1,1)).x = param5.scaleX * DEFAULT_SCALE;
               _loc9_.y = param5.scaleY * DEFAULT_SCALE;
               _loc6_ = new _65(param2,param3,param4,DEFAULT_EASING,_loc9_,DEFAULT_DURING,0);
               break;
            case _72.ALPHA:
            case _72.CHANGE_ALPHA:
               _loc10_ = DEFAULT_ALPHA;
               _loc6_ = new _58(param2,param3,param4,DEFAULT_EASING,_loc10_,DEFAULT_DURING,0);
               break;
            case _72.APPEAR_POSITION:
            case _72.CHANGE_APPEAR_POSITION:
               _loc6_ = new _60(param2,param3,param4,DEFAULT_EASING,_60.DIRECT_LEFT,DEFAULT_DURING,0);
               break;
            case _72.APPEAR_ALPHA:
            case _72.CHANGE_APPEAR_ALPHA:
               _loc6_ = new _59(param2,param3,param4,DEFAULT_EASING,0,DEFAULT_DURING,0);
               break;
            case _72.APPEAR_SCALE:
            case _72.CHANGE_APPEAR_SCALE:
               _loc6_ = new _61(param2,param3,param4,DEFAULT_EASING,new Point(0.1,0.1),DEFAULT_DURING,0);
               break;
            case _72.APPEAR_DROP:
            case _72.CHANGE_APPEAR_DROP:
               _loc6_ = new _10428(param2,param3,param4);
               break;
            case _72.SHAKE:
            case _72.CHANGE_SHAKE:
               _loc6_ = new _10245(param2,param3,param4);
               break;
            case _72.SWING:
            case _72.CHANGE_SWING:
               _loc6_ = new _10246(param2,param3,param4);
               break;
            case _72.HEARTBEAT:
            case _72.CHANGE_HEARTBEAT:
               _loc6_ = new _10244(param2,param3,param4);
               break;
            case _72.TWINKLE:
            case _72.CHANGE_TWINKLE:
               _loc6_ = new _10430(param2,param3,param4);
               break;
            case _72.INVERT:
            case _72.CHANGE_INVERT:
               _loc6_ = new _10429(param2,param3,param4);
               break;
            case _72.DISAPPEAR_POSITION:
            case _72.CHANGE_DISAPPEAR_POSITION:
               _loc6_ = new _10243(param2,param3,param4);
               break;
            case _72.DISAPPEAR_ALPHA:
            case _72.CHANGE_DISAPPEAR_ALPHA:
               _loc6_ = new _10242(param2,param3,param4);
         }
         return _loc6_;
      }
      
      private function _5027(param1:_646, param2:_67) : void
      {
         var _loc3_:_79 = null;
         var _loc4_:_52 = null;
         var _loc5_:int = -1;
         var _loc6_:_57 = param1.track;
         _loc5_ = _loc6_.parent.tracks.indexOf(_loc6_) + 1;
         _loc4_ = param1._1836;
         _loc3_ = param1._1837;
         var _loc7_:_57 = new _57(_loc6_.parent);
         _loc7_.addTween(param2);
         var _loc8_:_645 = this._4761._3116(_loc4_,_loc3_);
         var _loc9_:Object;
         (_loc9_ = {})._2070 = _loc6_.parent;
         _loc9_._2069 = _loc7_;
         _loc9_._2071 = param2;
         _loc9_._3070 = _loc8_;
         _loc9_._3067 = _loc8_.tracks.indexOf(param1) + 1;
         _loc9_._3074 = _loc5_;
         _1567(new CommandNotification(CommandNotification.ADD_COMIC_TRACK_TWEEN,_loc9_));
      }
      
      private function _5045(param1:MenuNotification) : void
      {
         var _loc2_:_72 = param1.data as _72;
         if(_loc2_)
         {
            if(_loc2_ == _72.CHANGE_NULL)
            {
               _1567(new PanelNotification(PanelNotification.COMIC_PANEL_DELETE_ITEM));
            }
            else
            {
               this._5095(_loc2_);
            }
         }
      }
      
      private function _5030(param1:MenuNotification) : void
      {
         var _loc3_:_79 = null;
         var _loc4_:_646 = null;
         var _loc5_:Vector.<_67> = null;
         var _loc6_:_645 = null;
         var _loc7_:Object = null;
         var _loc2_:_72 = param1.data as _72;
         if(_loc2_)
         {
            if(_loc2_ == _72.CHANGE_APPEAR_NULL)
            {
               if(this._5034._2889[0] is _79)
               {
                  _loc3_ = this._5034._2889[0] as _79;
                  _loc6_ = this._3567._3116(_loc3_.parentBoneData,_loc3_);
                  _loc4_ = _loc6_._3107;
               }
               else if(this._5034._2889[0] is _646)
               {
                  _loc4_ = _646(this._5034._2889[0]).parent._3107;
                  _loc3_ = _loc4_._1837;
               }
               _loc5_ = _loc4_.tweens;
               if(_loc5_.length > 0)
               {
                  (_loc7_ = {})._3110 = _loc5_;
                  _loc7_._3070 = this._4761._3116(_loc3_.parentBoneData,_loc3_);
                  _1567(new CommandNotification(CommandNotification.DELETE_COMIC_TWEENS,_loc7_));
               }
            }
            else
            {
               this._5047(_loc2_);
            }
         }
      }
      
      private function _10350(param1:MenuNotification) : void
      {
         var _loc3_:_79 = null;
         var _loc4_:_646 = null;
         var _loc5_:Vector.<_67> = null;
         var _loc6_:_645 = null;
         var _loc7_:Object = null;
         var _loc2_:_72 = param1.data as _72;
         if(_loc2_)
         {
            if(_loc2_ == _72.CHANGE_DISAPPEAR_NULL)
            {
               if(this._5034._2889[0] is _79)
               {
                  _loc3_ = this._5034._2889[0] as _79;
                  _loc6_ = this._3567._3116(_loc3_.parentBoneData,_loc3_);
                  _loc4_ = _loc6_._10287;
               }
               else if(this._5034._2889[0] is _646)
               {
                  _loc4_ = _646(this._5034._2889[0]).parent._10287;
                  _loc3_ = _loc4_._1837;
               }
               _loc5_ = _loc4_.tweens;
               if(_loc5_.length > 0)
               {
                  (_loc7_ = {})._3110 = _loc5_;
                  _loc7_._3077 = _loc4_;
                  _loc7_._3070 = this._4761._3116(_loc3_.parentBoneData,_loc3_);
                  _1567(new CommandNotification(CommandNotification.DELETE_COMIC_TWEENS,_loc7_));
               }
            }
            else
            {
               this._10352(_loc2_);
            }
         }
      }
      
      private function _5095(param1:_72) : void
      {
         var _loc3_:_79 = null;
         var _loc4_:_52 = null;
         var _loc5_:_646 = null;
         var _loc7_:_67 = null;
         var _loc8_:_67 = null;
         var _loc9_:_57 = null;
         var _loc10_:_57 = null;
         var _loc11_:_86 = null;
         var _loc12_:_86 = null;
         var _loc13_:_645 = null;
         var _loc2_:Object = new Object();
         var _loc6_:int = -1;
         if(this._5034._2889[0] is _79)
         {
            _loc3_ = this._5034._2889[0] as _79;
            _loc13_ = this._3567._3116(_loc3_.parentBoneData,_loc3_);
            _loc5_ = _loc13_.tracks[0];
         }
         else if(this._5034._2889[0] is _646)
         {
            _loc5_ = this._5034._2889[0] as _646;
         }
         if(_loc5_.tweens.length > 1)
         {
            if(Boolean(this._3056._10301) && this._3056._10301.length > 0)
            {
               _loc7_ = this._3056._10301[0];
            }
            else
            {
               _loc7_ = _loc5_.tweens[0];
            }
         }
         else
         {
            _loc7_ = _loc5_.tweens[0];
         }
         _loc4_ = _loc5_._1836;
         _loc3_ = _loc5_._1837;
         _loc9_ = _loc5_.track;
         _loc11_ = new _86();
         _loc12_ = _loc4_._1724;
         _loc8_ = this._5090(param1,_loc9_,_loc4_,_loc3_,_loc11_);
         _loc2_._2069 = _loc9_;
         _loc2_._3077 = _loc5_;
         _loc2_._2071 = _loc7_;
         _loc2_._3117 = _loc8_;
         _1567(new CommandNotification(CommandNotification.MODIFY_COMIC_DISAPPEAR_TWEEN_TYPE,_loc2_));
      }
      
      private function _5047(param1:_72) : void
      {
         var _loc3_:_79 = null;
         var _loc4_:_52 = null;
         var _loc5_:_646 = null;
         var _loc7_:_67 = null;
         var _loc8_:_67 = null;
         var _loc9_:_57 = null;
         var _loc10_:_57 = null;
         var _loc11_:_86 = null;
         var _loc12_:_86 = null;
         var _loc13_:_645 = null;
         var _loc2_:Object = new Object();
         var _loc6_:int = -1;
         if(this._5034._2889[0] is _79)
         {
            _loc3_ = this._5034._2889[0] as _79;
            _loc13_ = this._3567._3116(_loc3_.parentBoneData,_loc3_);
            _loc5_ = _loc13_._3107;
         }
         else if(this._5034._2889[0] is _646)
         {
            _loc5_ = _646(this._5034._2889[0]).parent._3107;
         }
         _loc7_ = _loc5_._3106;
         _loc4_ = _loc5_._1836;
         _loc3_ = _loc5_._1837;
         _loc9_ = _loc5_.track;
         _loc11_ = new _86();
         _loc12_ = _loc4_._1724;
         _loc5_.parent._5039(_loc5_,_loc11_);
         _loc11_.x -= _loc12_.x;
         _loc11_.y -= _loc12_.y;
         _loc11_.rotation -= _loc12_.rotation;
         _loc11_.scaleX /= _loc12_.scaleX;
         _loc11_.scaleY /= _loc12_.scaleY;
         _loc8_ = this._5090(param1,_loc9_,_loc4_,_loc3_,_loc11_);
         _loc2_._2069 = _loc9_;
         _loc2_._3077 = _loc5_;
         _loc2_._2071 = _loc7_;
         _loc2_._3117 = _loc8_;
         _1567(new CommandNotification(CommandNotification.MODIFY_COMIC_DISAPPEAR_TWEEN_TYPE,_loc2_));
      }
      
      private function _10352(param1:_72) : void
      {
         var _loc3_:_79 = null;
         var _loc4_:_52 = null;
         var _loc5_:_646 = null;
         var _loc7_:_67 = null;
         var _loc8_:_67 = null;
         var _loc9_:_57 = null;
         var _loc10_:_57 = null;
         var _loc11_:_86 = null;
         var _loc12_:_86 = null;
         var _loc13_:_645 = null;
         var _loc2_:Object = new Object();
         var _loc6_:int = -1;
         if(this._5034._2889[0] is _79)
         {
            _loc3_ = this._5034._2889[0] as _79;
            _loc13_ = this._3567._3116(_loc3_.parentBoneData,_loc3_);
            _loc5_ = _loc13_._10287;
         }
         else if(this._5034._2889[0] is _646)
         {
            _loc5_ = _646(this._5034._2889[0]).parent._10287;
         }
         _loc7_ = _loc5_._10288;
         _loc4_ = _loc5_._1836;
         _loc3_ = _loc5_._1837;
         _loc9_ = _loc5_.track;
         _loc11_ = new _86();
         _loc12_ = _loc4_._1724;
         _loc5_.parent._5039(_loc5_,_loc11_);
         _loc11_.x -= _loc12_.x;
         _loc11_.y -= _loc12_.y;
         _loc11_.rotation -= _loc12_.rotation;
         _loc11_.scaleX /= _loc12_.scaleX;
         _loc11_.scaleY /= _loc12_.scaleY;
         _loc8_ = this._5090(param1,_loc9_,_loc4_,_loc3_,_loc11_);
         _loc2_._2069 = _loc9_;
         _loc2_._3077 = _loc5_;
         _loc2_._2071 = _loc7_;
         _loc2_._3117 = _loc8_;
         _1567(new CommandNotification(CommandNotification.MODIFY_COMIC_DISAPPEAR_TWEEN_TYPE,_loc2_));
      }
      
      private function _5061(param1:ComicNotification) : void
      {
         this._4055(null);
      }
      
      private function _5060(param1:ComicNotification) : void
      {
         if(this._5034._3050.length > 0)
         {
            this._4055(this._5034._3050,param1.data);
         }
         else if(this._5034._3584.length > 0)
         {
            this._5050(this._5034._3584);
         }
         else
         {
            this._4055(null);
         }
      }
      
      protected function _4974(param1:_9) : void
      {
         if(this._5034._2889.length > 0)
         {
            this._5034._2986(null);
            _1567(new ComicNotification(ComicNotification.UPDATE_ORDER_SELECTED));
         }
      }
      
      private function _5094(param1:MouseEvent) : void
      {
         if(this._5091)
         {
            if(this._5034._2889.length > 0)
            {
               this._5034._2986(null);
               _1567(new ComicNotification(ComicNotification.UPDATE_ORDER_SELECTED));
            }
         }
         else if(this._5034._3050.length == 1)
         {
            this._3975._3934(_711.COMIC,_712.SLOT,[this._5034._3050[0]]);
            param1.stopImmediatePropagation();
         }
      }
      
      private function _4013(param1:MouseEvent) : void
      {
         if(this._5034._3054 != null)
         {
            this._5034._2986(null,this._5034._3053);
            _1567(new ComicNotification(ComicNotification.UPDATE_ORDER_SELECTED));
         }
         else
         {
            this._5091 = true;
         }
      }
      
      private function _4355(param1:StageNotification) : void
      {
         this._5075 = true;
      }
      
      private function _5059(param1:StageNotification) : void
      {
         this._5075 = false;
      }
      
      public function _3065() : void
      {
         var _loc1_:_79 = null;
         var _loc2_:_646 = null;
         var _loc3_:Vector.<_79> = null;
         if(this._5034._2889.length > 0)
         {
            if(this._5034._2889[0] is _79)
            {
               _loc1_ = this._5034._2889[0] as _79;
            }
            else if(this._5034._2889[0] is _646)
            {
               _loc2_ = this._5034._2889[0] as _646;
               if(_loc2_.isEmpty())
               {
                  this._5034._2986(null);
               }
               else
               {
                  _loc1_ = _loc2_._1837;
               }
            }
            if(_loc1_)
            {
               _loc3_ = new Vector.<_79>();
               _loc3_.push(_loc1_);
               this._4055(_loc3_);
            }
         }
      }
      
      public function _3076(param1:_646) : void
      {
         var _loc2_:_645 = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(_2227)
         {
            if(this._5042)
            {
               _loc2_ = param1.parent;
               _loc3_ = int(_loc2_.tracks.indexOf(param1));
               _loc4_ = int(_loc2_.tracks.length);
               while(_loc3_ < _loc4_)
               {
                  if(_loc3_ >= 0)
                  {
                     this._5042._3076(_loc2_.tracks[_loc3_]);
                  }
                  _loc3_++;
               }
            }
            if(this._5048)
            {
               this._5048._5069();
               this._5048._5077();
            }
            this._5028._4313._1751();
         }
      }
      
      private function _3580(param1:StageNotification) : void
      {
         if(_2226._2889.length > 0)
         {
            this._5034._2986(null);
         }
      }
      
      private function _5037(param1:ComicNotification) : void
      {
         var _loc4_:_646 = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc2_:Vector.<_67> = param1.data as Vector.<_67>;
         var _loc3_:Vector.<_646> = new Vector.<_646>();
         if(Boolean(_loc2_) && Boolean(_loc2_.length))
         {
            _loc5_ = 0;
            _loc6_ = int(_loc2_.length);
            while(_loc5_ < _loc6_)
            {
               _loc4_ = this._3098(_loc2_[_loc5_]);
               if(_loc4_)
               {
                  _loc3_.push(_loc4_);
               }
               _loc5_++;
            }
         }
         if(_loc3_.length > 0)
         {
            _loc4_ = _loc3_[0];
            if(_loc4_._3071)
            {
               this._5034._2986(null,_loc4_._1837);
            }
            else if(_loc4_._10286)
            {
               this._5034._2986(null,_loc4_._1837);
            }
            else
            {
               this._5034._2986(null,_loc4_);
            }
            _1567(new ComicNotification(ComicNotification.SHOW_ANIMATION,false));
         }
      }
      
      private function _5036(param1:ComicNotification) : void
      {
         this._5048._2986(this._5034._2889);
      }
      
      private function _5074(param1:ComicNotification) : void
      {
         this._5033._5021 = null;
         this._5048._5085 = this._5042._5057 = null;
      }
      
      private function _5065(param1:ComicNotification) : void
      {
         this._5048._5085 = param1.data as _91;
         if(param1.data is _646)
         {
            this._5042._5057 = param1.data as _646;
         }
         else if(param1.data is _79)
         {
            this._5033._5021 = param1.data as _79;
         }
      }
      
      private function _5087(param1:ComicEvent) : void
      {
         this._5034._3782 = null;
      }
      
      private function _5082(param1:ComicEvent) : void
      {
         var _loc2_:_646 = param1.data as _646;
         this._5034._3782 = _loc2_;
      }
      
      private function _5093(param1:ComicEvent) : void
      {
         this._5034._3054 = null;
         this._5079 = null;
      }
      
      private function _5089(param1:ComicEvent) : void
      {
         var _loc2_:_79 = param1.data as _79;
         this._5034._3054 = _loc2_;
         this._5079 = _loc2_;
      }
      
      private function _5073(param1:MouseEvent) : void
      {
         this._5067 = false;
         stage.removeEventListener(MouseEvent.MOUSE_UP,this._5073);
      }
      
      private function _5053(param1:MouseEvent) : void
      {
         this._5067 = true;
         if(this._5034._3584.length > 0 || Boolean(this._5034._3782))
         {
            _524._3785(true);
         }
         if(this._5034._3053 != null)
         {
            this._5034._2986(null,this._5034._3053);
            _1567(new ComicNotification(ComicNotification.UPDATE_ORDER_SELECTED));
         }
         stage.addEventListener(MouseEvent.MOUSE_UP,this._5073);
      }
      
      private function _5052(param1:MouseEvent) : void
      {
         var _loc2_:Point = null;
         this._5091 = false;
         if(this._5075)
         {
            return;
         }
         if(this._5067)
         {
            if(this._5034._2986.length > 0)
            {
               this._5075 = true;
               if(this._5034.isSelected(this._5034._3053))
               {
                  this._5028._5031();
               }
               else
               {
                  this._5028._5035();
               }
            }
         }
         else
         {
            _loc2_ = new Point(stage.mouseX,stage.mouseY);
            this._5042._5068(_loc2_);
            if(this._5034._3782 == null)
            {
               this._5033._5068(_loc2_);
            }
         }
      }
      
      public function set _5051(param1:_643) : void
      {
         this._4761 = param1;
         if(this._4761 == null)
         {
            this._5033.dataProvider = null;
         }
         else
         {
            this._5033.dataProvider = this._4761._5046;
         }
         this._5042._4035 = null;
         this._5048._4035 = null;
      }
      
      public function _5101() : void
      {
         this._5048._5101();
      }
      
      public function _5088(param1:Number, param2:Number) : void
      {
         if(this._4761 && this._4761._5046 && this._4761._5046.length > 0)
         {
            this._5048._5101();
         }
         else
         {
            this._5048._5100(param1);
         }
      }
      
      public function _5050(param1:Vector.<_646>) : void
      {
         var _loc2_:_646 = null;
         var _loc3_:_645 = null;
         var _loc4_:Vector.<_645> = null;
         if(param1.length > 0)
         {
            _loc2_ = param1[0];
            _loc3_ = this._4761._3116(_loc2_._1836,_loc2_._1837);
            _loc4_ = new Vector.<_645>();
            if(_loc3_)
            {
               _loc4_.push(_loc3_);
               this._5048._4035 = _loc4_;
               this._5042._4035 = _loc4_;
            }
         }
      }
      
      public function _4055(param1:Vector.<_79>, param2:Boolean = false) : void
      {
         var _loc3_:Vector.<_645> = null;
         var _loc4_:_645 = null;
         if(param1 == null || param1.length == 0)
         {
            this._5048._4035 = null;
            this._5042._4035 = null;
         }
         else
         {
            _loc3_ = this._4761._5049(param1);
            if(_loc3_.length > 0)
            {
               _loc4_ = _loc3_[_loc3_.length - 1];
               if(param2 && _loc4_.tracks.length > 0)
               {
                  this._5034._2986(null,_loc4_.tracks[_loc4_.tracks.length - 1]);
                  _1567(new ComicNotification(ComicNotification.UPDATE_ORDER_SELECTED));
               }
            }
            this._5048._4035 = _loc3_;
            this._5042._4035 = _loc3_;
         }
      }
      
      public function _10497(param1:_79) : void
      {
         this._2907(param1);
         var _loc2_:Vector.<_91> = this._5034._2889.concat();
         this._5034._3024();
         this._5034._2986(_loc2_);
      }
      
      public function _2907(param1:_79) : void
      {
         param1._1751();
         param1._1988();
         this._5033._2907(param1);
         if(this._5048)
         {
            this._5048._5069();
            this._5048._5077();
         }
         this._5028._4313._1751();
      }
      
      public function refresh() : void
      {
         this._5048.refresh();
         this._5042.refresh();
         this._5028._4313._1751();
      }
      
      public function _5076(param1:_646) : void
      {
         if(this._5041)
         {
            this._5041._1888();
            this._5041 = null;
         }
         if(this._5040)
         {
            this._5040._1889();
            this._5040 = null;
         }
         this._5055 = param1._1837;
         this._10353 = param1._5070();
         if(param1.loop)
         {
            this._10475 = param1._10477();
         }
         var _loc2_:int = 0;
         var _loc3_:int = int(this._10353.length);
         while(_loc2_ < _loc3_)
         {
            if(this._10353[_loc2_] is _41)
            {
               (this._10353[_loc2_] as _41)._1894();
            }
            else if(this._10353[_loc2_] is _48)
            {
               (this._10353[_loc2_] as _48)._1895();
            }
            _loc2_++;
         }
         this._10354 = param1.loop;
         this._5072();
      }
      
      private function _10476() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = int(this._10475.length);
         while(_loc1_ < _loc2_)
         {
            if(this._10475[_loc1_] is _41)
            {
               (this._10475[_loc1_] as _41)._1894();
            }
            else if(this._10475[_loc1_] is _48)
            {
               (this._10475[_loc1_] as _48)._1895();
            }
            _loc1_++;
         }
      }
      
      private function _5072() : void
      {
         this._5042.visible = false;
         this._5048.visible = false;
         this._5028._4313.visible = false;
         this._5080 = true;
         stage.addEventListener(Event.ENTER_FRAME,this._5071);
         stage.addEventListener(MouseEvent.MOUSE_DOWN,this._5058,true);
         this._5099 = 0;
         this._lastTime = getTimer();
         this._5102(this._5099);
         _1567(new ComicNotification(ComicNotification.PREVIEW_START));
      }
      
      private function _5058(param1:MouseEvent) : void
      {
         this._5083();
      }
      
      private function _5083() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         this._5080 = false;
         this._5042.visible = true;
         this._5048.visible = true;
         this._5028._4313.visible = true;
         stage.removeEventListener(Event.ENTER_FRAME,this._5071);
         stage.removeEventListener(MouseEvent.MOUSE_DOWN,this._5058,true);
         if(this._10478)
         {
            _loc1_ = 0;
            _loc2_ = int(this._10475.length);
            while(_loc1_ < _loc2_)
            {
               if(this._10475[_loc1_] is _41)
               {
                  (this._10475[_loc1_] as _41)._1888();
               }
               else if(this._10475[_loc1_] is _48)
               {
                  (this._10475[_loc1_] as _48)._1889();
               }
               _loc1_++;
            }
            this._10478 = false;
         }
         _loc1_ = 0;
         _loc2_ = int(this._10353.length);
         while(_loc1_ < _loc2_)
         {
            if(this._10353[_loc1_] is _41)
            {
               (this._10353[_loc1_] as _41)._1888();
            }
            else if(this._10353[_loc1_] is _48)
            {
               (this._10353[_loc1_] as _48)._1889();
            }
            _loc1_++;
         }
         this._5055.parentBoneData._1751();
         this._5055._1751();
         this._5033._2907(this._5055);
         this._5028._1751();
         _1567(new ComicNotification(ComicNotification.PREVIEW_END));
      }
      
      private function _5071(param1:Event) : void
      {
         var _loc2_:int = getTimer();
         this._5099 += _loc2_ - this._lastTime;
         this._5102(this._5099);
         this._lastTime = _loc2_;
      }
      
      private function _5102(param1:Number) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc2_:Number = param1 / this._4761.fps;
         if(this._10478)
         {
            _loc4_ = 0;
            _loc5_ = int(this._10475.length);
            while(_loc4_ < _loc5_)
            {
               if(this._10475[_loc4_] is _41)
               {
                  (this._10475[_loc4_] as _41)._1858(_loc2_);
                  (this._10475[_loc4_] as _41)._1823._1751();
               }
               else if(this._10475[_loc4_] is _48)
               {
                  (this._10475[_loc4_] as _48)._1858(_loc2_);
                  (this._10475[_loc4_] as _48)._1824._2153();
               }
               if(_loc3_ < this._10475[_loc4_].duration)
               {
                  _loc3_ = this._10475[_loc4_].duration;
               }
               _loc4_++;
            }
         }
         else
         {
            _loc4_ = 0;
            _loc5_ = int(this._10353.length);
            while(_loc4_ < _loc5_)
            {
               if(this._10353[_loc4_] is _41)
               {
                  (this._10353[_loc4_] as _41)._1858(_loc2_);
                  (this._10353[_loc4_] as _41)._1823._1751();
               }
               else if(this._10353[_loc4_] is _48)
               {
                  (this._10353[_loc4_] as _48)._1858(_loc2_);
                  (this._10353[_loc4_] as _48)._1824._2153();
               }
               if(_loc3_ < this._10353[_loc4_].duration)
               {
                  _loc3_ = this._10353[_loc4_].duration;
               }
               _loc4_++;
            }
         }
         this._5055._1988();
         this._5055._1751();
         this._5033._2907(this._5055);
         if(_loc2_ > _loc3_)
         {
            if(this._10354)
            {
               if(!this._10478)
               {
                  this._10478 = true;
                  this._10476();
               }
               this._5099 = 0;
            }
            else
            {
               this._5083();
            }
         }
      }
      
      public function _4050(param1:_79) : Boolean
      {
         var _loc2_:_645 = this._4761._3116(param1.parentBoneData,param1);
         if(_loc2_.tracks.length > 0 || _loc2_._3107 || Boolean(_loc2_._10287))
         {
            return true;
         }
         return false;
      }
      
      public function _3098(param1:_67) : _646
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:_645 = this._3116(param1);
         if(_loc2_._3107)
         {
            _loc3_ = 0;
            _loc4_ = int(_loc2_._3107.tweens.length);
            while(_loc3_ < _loc4_)
            {
               if(_loc2_._3107.tweens[_loc3_] == param1)
               {
                  return _loc2_._3107;
               }
               _loc3_++;
            }
         }
         if(_loc2_._10287)
         {
            _loc3_ = 0;
            _loc4_ = int(_loc2_._10287.tweens.length);
            while(_loc3_ < _loc4_)
            {
               if(_loc2_._10287.tweens[_loc3_] == param1)
               {
                  return _loc2_._10287;
               }
               _loc3_++;
            }
         }
         _loc3_ = 0;
         _loc4_ = int(_loc2_.tracks.length);
         while(_loc3_ < _loc4_)
         {
            if(_loc2_.tracks[_loc3_].tweens.indexOf(param1) != -1)
            {
               return _loc2_.tracks[_loc3_];
            }
            _loc3_++;
         }
         return null;
      }
      
      public function _3116(param1:_67) : _645
      {
         return this._4761._3116(param1._1836,param1._1837);
      }
      
      public function _3565(param1:_79) : _645
      {
         return this._4761._3116(param1.parentBoneData,param1);
      }
      
      public function get _3567() : _643
      {
         return this._4761;
      }
      
      public function get _3055() : _473
      {
         return _1407.getInstance(_473) as _473;
      }
      
      public function get _3056() : _556
      {
         return _1407.getInstance(_556) as _556;
      }
      
      private function get _3975() : _540
      {
         return _1407.getInstance(_540) as _540;
      }
   }
}

