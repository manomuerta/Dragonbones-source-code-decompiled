package _555
{
   import _1177.UIEvent;
   import _1404._1407;
   import _470._469;
   import _51._79;
   import _521._523;
   import _54._10244;
   import _54._10245;
   import _54._10246;
   import _54._10429;
   import _54._10430;
   import _54._58;
   import _54._63;
   import _54._64;
   import _54._65;
   import _54._67;
   import _541._540;
   import _586._589;
   import _586._605;
   import _644._645;
   import _644._646;
   import _710._711;
   import _710._712;
   import _783.ComicNotification;
   import _783.CommandNotification;
   import _81._88;
   import _81._91;
   import _813.ActionPropertyGroup;
   import _813.ComicPropertyPanel;
   import _813._814;
   import _813._815;
   import _813._816;
   import _93._94;
   import _97._116;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class _556 extends _94
   {
      private var _4044:ComicPropertyPanel;
      
      private var _4075:Boolean;
      
      private var _4060:Boolean;
      
      private var _10347:_646;
      
      private var _10332:_646;
      
      private var _10320:_646;
      
      private var _10341:_646;
      
      private var _10321:_646;
      
      private var _10313:_646;
      
      public var _10301:Vector.<_67>;
      
      private var _4062:Number;
      
      private var _10325:int = 1;
      
      private var _10307:Boolean = false;
      
      public function _556()
      {
         super();
      }
      
      override protected function init() : void
      {
         super.init();
         this._4044 = _1407.getInstance(ComicPropertyPanel);
      }
      
      override protected function _1576() : void
      {
         if(this._4044._4048)
         {
            this._3990();
         }
         else
         {
            this._4044.addEventListener(UIEvent.CREATION_COMPLETE,this._3991);
         }
         _1565(ComicNotification.UPDATE_SELCTEDS,this._4023);
      }
      
      private function _4023(param1:ComicNotification) : void
      {
         this.refresh();
      }
      
      private function _3991(param1:UIEvent) : void
      {
         this._4044.removeEventListener(UIEvent.CREATION_COMPLETE,this._3991);
         this._3990();
      }
      
      private function _3990() : void
      {
         this._4044._4065.addEventListener(MouseEvent.CLICK,this._4065);
         this._4043._4046.addEventListener(MouseEvent.CLICK,this.addAction);
         this._4043._4082.addEventListener(MouseEvent.CLICK,this.addAction);
         this._4043._4051.addEventListener(MouseEvent.CLICK,this._4051);
         this._4043._4081.addEventListener(MouseEvent.CLICK,this._4033);
         this._4043._3754.addEventListener(MouseEvent.CLICK,this._4057);
         this._4043._4067.addEventListener(MouseEvent.CLICK,this._4038);
         this._4043._4078._2599 = this._4076;
         this._4043._4079._2599 = this._4073;
         this._4043._4078.addEventListener(FocusEvent.FOCUS_OUT,this._4076);
         this._4043._4079.addEventListener(FocusEvent.FOCUS_OUT,this._4073);
         this._4043._4077._2599 = this._4074;
         this._4043._4077.addEventListener(FocusEvent.FOCUS_OUT,this._4074);
         this._4043._4070._2599 = this._4059;
         this._4043._4070.addEventListener(FocusEvent.FOCUS_OUT,this._4059);
         this._4043._4069._2599 = this._4058;
         this._4043._4069.addEventListener(FocusEvent.FOCUS_OUT,this._4058);
         this._4043._4071._2599 = this._4064;
         this._4043._4071.addEventListener(FocusEvent.FOCUS_OUT,this._4064);
         this._4043._4047._2599 = this._4041;
         this._4043._4047.addEventListener(FocusEvent.FOCUS_OUT,this._4041);
         this._4043._10342.addEventListener(Event.CHANGE,this._10322);
         this._4043._4077.addEventListener(FocusEvent.FOCUS_IN,this._10340);
         this._4043._4078.addEventListener(FocusEvent.FOCUS_IN,this._10340);
         this._4043._4079.addEventListener(FocusEvent.FOCUS_IN,this._10340);
         this._4043._4070.addEventListener(FocusEvent.FOCUS_IN,this._10340);
         this._4043._4069.addEventListener(FocusEvent.FOCUS_IN,this._10340);
         this._4043._4071.addEventListener(FocusEvent.FOCUS_IN,this._10340);
         this._4043._4047.addEventListener(FocusEvent.FOCUS_IN,this._10340);
         this._4043._4068.addEventListener(Event.CHANGE,this._4053);
         this._4043._4056.addEventListener(Event.CHANGE,this._4039);
         this._4043._4056.addEventListener(UIEvent.CHANGE_END,this._4030);
         this._4043._4056.addEventListener(UIEvent.CHANGE_START,this._4026);
         this._4043._10339.addEventListener(Event.CHANGE,this._10331);
         this._4043._10329.addEventListener(Event.CHANGE,this._10331);
         this._4043._10326.addEventListener(Event.CHANGE,this._10331);
         this._4043._10343.addEventListener(Event.CHANGE,this._10334);
         this._4043._10338.addEventListener(Event.CHANGE,this._10330);
         this._4043._10328.addEventListener(Event.CHANGE,this._10330);
         this._4043._10344.addEventListener(Event.CHANGE,this._10333);
         this._4043._10327.addEventListener(Event.CHANGE,this._10314);
         this._4043._10309.addEventListener(Event.CHANGE,this._10314);
         this._4043._10310.addEventListener(Event.CHANGE,this._10314);
         this._4043._10336.addEventListener(Event.CHANGE,this._10319);
         this._4043._10464.addEventListener(Event.CHANGE,this._10460);
         this._4043._10466.addEventListener(Event.CHANGE,this._10462);
         this._4043._10465.addEventListener(Event.CHANGE,this._10461);
         this._4043._10467.addEventListener(Event.CHANGE,this._10463);
         this._4042._4077._2599 = this._4034;
         this._4042._4077.addEventListener(FocusEvent.FOCUS_IN,this._10340);
         this._4042._4077.addEventListener(FocusEvent.FOCUS_OUT,this._4034);
         this._4042._4068.addEventListener(Event.CHANGE,this._4027);
         this._4042._4072.addEventListener(Event.CHANGE,this._4029);
         this._4042._4046.addEventListener(MouseEvent.CLICK,this._4040);
         this._4042._4081.addEventListener(MouseEvent.CLICK,this._4032);
         this._4042._3754.addEventListener(MouseEvent.CLICK,this._4031);
         this._6183._4077._2599 = this._10318;
         this._6183._4077.addEventListener(FocusEvent.FOCUS_IN,this._10340);
         this._6183._4077.addEventListener(FocusEvent.FOCUS_OUT,this._10318);
         this._6183._4068.addEventListener(Event.CHANGE,this._10308);
         this._6183._4072.addEventListener(Event.CHANGE,this._10311);
         this._6183._4046.addEventListener(MouseEvent.CLICK,this._10323);
         this._6183._4081.addEventListener(MouseEvent.CLICK,this._10316);
         this._6183._3754.addEventListener(MouseEvent.CLICK,this._10312);
         this._4028._4025.addEventListener(FocusEvent.FOCUS_OUT,this._4045);
         this._4028._4024.addEventListener(FocusEvent.FOCUS_OUT,this._4045);
         this._4028._4066.addEventListener(UIEvent.CONFIRM,this._4052);
         this._4028._4066.addEventListener(Event.CLEAR,this._4052);
         this._4028._4066.addEventListener(Event.CHANGE,this._10324);
         this._4028._4066.addEventListener(Event.CANCEL,this._4052);
         stage.addEventListener(MouseEvent.MOUSE_DOWN,this._4063,true);
         stage.addEventListener(MouseEvent.MOUSE_UP,this._4083);
         _1565(ComicNotification.TWEEN_SELECTED_FOR_PROPERTY,this._4054);
      }
      
      private function _4054(param1:ComicNotification) : void
      {
         var _loc2_:Vector.<_67> = param1.data as Vector.<_67>;
         if(Boolean(_loc2_) && _loc2_.length > 0)
         {
            if(_loc2_[0].appear)
            {
               this._4044._2565.selectedIndex = 0;
               this._4044._4048.selectedIndex = 0;
               this._10325 = 0;
            }
            else if(_loc2_[0]._10283)
            {
               this._4044._2565.selectedIndex = 2;
               this._4044._4048.selectedIndex = 2;
               this._10325 = 2;
            }
            else
            {
               this._4044._2565.selectedIndex = 1;
               this._4044._4048.selectedIndex = 1;
               this._10325 = 1;
            }
         }
         this._4044._2894();
      }
      
      private function _4083(param1:MouseEvent) : void
      {
         this._4075 = false;
         if(this._4060)
         {
            _2217._1651();
            this._4060 = false;
         }
      }
      
      private function _4063(param1:MouseEvent) : void
      {
         this._4075 = true;
      }
      
      private function _10340(param1:FocusEvent) : void
      {
         var _loc2_:_79 = null;
         var _loc3_:_645 = null;
         if(Boolean(this._4044._4080) && this._4044._4080.length == 1)
         {
            if(this._4044._4080[0] is _646)
            {
               this._10347 = this._4044._4080[0] as _646;
               this._10332 = this._10347.parent._3107;
               this._10320 = this._10347.parent._10287;
            }
            else if(this._4044._4080[0] is _79)
            {
               _loc2_ = this._4044._4080[0] as _79;
               _loc3_ = this._3112._3567._3116(_loc2_.parentBoneData,_loc2_);
               if(_loc3_.tracks.length > 0)
               {
                  this._10347 = _loc3_.tracks[0];
               }
               this._10332 = _loc3_._3107;
               this._10320 = _loc3_._10287;
            }
         }
         else
         {
            this._10347 = null;
            this._10332 = null;
            this._10320 = null;
         }
      }
      
      private function _4073(param1:FocusEvent) : void
      {
         var _loc2_:Object = null;
         var _loc3_:_67 = null;
         this._10325 = 1;
         if(Boolean(this._10347) && Boolean(this._10341) && this._10341 != this._10347)
         {
            return;
         }
         if(this._10341)
         {
            for each(_loc3_ in this._10341.tweens)
            {
               if(_loc3_ is _63)
               {
                  _loc2_ = new Object();
                  _loc2_._2071 = _loc3_;
                  _loc2_.newValue = new Point(_loc3_.value.x,Number(this._4043._4079.txt.text) - _loc3_._1836.globalTransform.y);
               }
            }
            if(_loc2_)
            {
               _1567(new CommandNotification(CommandNotification.MODIFY_COMIC_TWEEN_VALUE,_loc2_));
            }
         }
      }
      
      private function _4076(param1:FocusEvent) : void
      {
         var _loc2_:Object = null;
         var _loc3_:_67 = null;
         this._10325 = 1;
         if(Boolean(this._10347) && Boolean(this._10341) && this._10341 != this._10347)
         {
            return;
         }
         if(this._10341)
         {
            for each(_loc3_ in this._10341.tweens)
            {
               if(_loc3_ is _63)
               {
                  _loc2_ = new Object();
                  _loc2_._2071 = _loc3_;
                  _loc2_.newValue = new Point(Number(this._4043._4078.txt.text) - _loc3_._1836.globalTransform.x,_loc3_.value.y);
               }
            }
            if(_loc2_)
            {
               _1567(new CommandNotification(CommandNotification.MODIFY_COMIC_TWEEN_VALUE,_loc2_));
            }
         }
      }
      
      private function _4074(param1:FocusEvent) : void
      {
         var _loc2_:Object = null;
         this._10325 = 1;
         if(Boolean(this._10347) && Boolean(this._10341) && this._10341 != this._10347)
         {
            return;
         }
         if(Number(this._4043._4077.txt.text) < 0)
         {
            this._4043._4077.txt.text = String(0);
         }
         if(Number(this._4043._4077.txt.text) > 60)
         {
            this._4043._4077.txt.text = String(60);
         }
         if(this._10341)
         {
            _loc2_ = new Object();
            _loc2_.tweens = this._10341.tweens;
            _loc2_.newValue = Number(this._4043._4077.txt.text);
            if(_loc2_)
            {
               _1567(new CommandNotification(CommandNotification.MODIFY_COMIC_TWEENS_DURING,_loc2_));
            }
         }
      }
      
      private function _4034(param1:FocusEvent) : void
      {
         var _loc2_:Object = null;
         var _loc3_:_645 = null;
         this._10325 = 0;
         if(Boolean(this._10332) && Boolean(this._10321) && this._10321 != this._10332)
         {
            return;
         }
         if(Number(this._4042._4077.txt.text) < 0)
         {
            this._4042._4077.txt.text = String(0);
         }
         if(Number(this._4042._4077.txt.text) > 60)
         {
            this._4042._4077.txt.text = String(60);
         }
         if(this._10321)
         {
            _loc3_ = this._10321.parent;
            _loc2_ = new Object();
            _loc2_._2071 = _loc3_._3107.tweens[0];
            _loc2_.newValue = Number(this._4042._4077.txt.text);
            if(_loc2_)
            {
               this._10307 = true;
               _1567(new CommandNotification(CommandNotification.MODIFY_COMIC_TWEEN_DURING,_loc2_));
            }
         }
      }
      
      private function _10318(param1:FocusEvent) : void
      {
         var _loc2_:Object = null;
         var _loc3_:_645 = null;
         this._10325 = 2;
         if(Boolean(this._10320) && Boolean(this._10313) && this._10313 != this._10320)
         {
            return;
         }
         if(Number(this._6183._4077.txt.text) < 0)
         {
            this._6183._4077.txt.text = String(0);
         }
         if(Number(this._6183._4077.txt.text) > 60)
         {
            this._6183._4077.txt.text = String(60);
         }
         if(this._10313)
         {
            _loc3_ = this._10313.parent;
            _loc2_ = new Object();
            _loc2_._2071 = _loc3_._10287.tweens[0];
            _loc2_.newValue = Number(this._6183._4077.txt.text);
            if(_loc2_)
            {
               this._10307 = true;
               _1567(new CommandNotification(CommandNotification.MODIFY_COMIC_TWEEN_DURING,_loc2_));
            }
         }
      }
      
      private function _4059(param1:FocusEvent) : void
      {
         var _loc2_:Object = null;
         var _loc3_:_67 = null;
         this._10325 = 1;
         if(Boolean(this._10347) && Boolean(this._10341) && this._10341 != this._10347)
         {
            return;
         }
         if(this._10341)
         {
            for each(_loc3_ in this._10341.tweens)
            {
               if(_loc3_ is _65)
               {
                  _loc2_ = new Object();
                  _loc2_._2071 = _loc3_;
                  _loc2_.newValue = new Point(Number(this._4043._4070.txt.text),_loc3_.value.y);
               }
               if(_loc2_)
               {
                  _1567(new CommandNotification(CommandNotification.MODIFY_COMIC_TWEEN_VALUE,_loc2_));
               }
            }
         }
      }
      
      private function _4058(param1:FocusEvent) : void
      {
         var _loc2_:Object = null;
         var _loc3_:_67 = null;
         this._10325 = 1;
         if(Boolean(this._10347) && Boolean(this._10341) && this._10341 != this._10347)
         {
            return;
         }
         if(this._10341)
         {
            for each(_loc3_ in this._10341.tweens)
            {
               if(_loc3_ is _65)
               {
                  _loc2_ = new Object();
                  _loc2_._2071 = _loc3_;
                  _loc2_.newValue = new Point(_loc3_.value.x,Number(this._4043._4069.txt.text));
               }
            }
            if(_loc2_)
            {
               _1567(new CommandNotification(CommandNotification.MODIFY_COMIC_TWEEN_VALUE,_loc2_));
            }
         }
      }
      
      private function _4064(param1:FocusEvent) : void
      {
         var _loc2_:Object = null;
         var _loc3_:_67 = null;
         this._10325 = 1;
         if(Boolean(this._10347) && Boolean(this._10341) && this._10341 != this._10347)
         {
            return;
         }
         if(Number(this._4043._4071.txt.text) > 100)
         {
            this._4043._4071.txt.text = String(100);
         }
         if(Number(this._4043._4071.txt.text) < 0)
         {
            this._4043._4071.txt.text = String(0);
         }
         if(this._10341)
         {
            for each(_loc3_ in this._10341.tweens)
            {
               if(_loc3_ is _58)
               {
                  _loc2_ = new Object();
                  _loc2_._2071 = _loc3_;
                  _loc2_.newValue = Number(this._4043._4071.txt.text) == 0 ? 0 : Number(this._4043._4071.txt.text) / 100;
               }
            }
            if(_loc2_)
            {
               _1567(new CommandNotification(CommandNotification.MODIFY_COMIC_TWEEN_VALUE,_loc2_));
            }
         }
      }
      
      private function _4041(param1:FocusEvent) : void
      {
         var _loc2_:Object = null;
         var _loc3_:_67 = null;
         this._10325 = 1;
         if(Boolean(this._10347) && Boolean(this._10341) && this._10341 != this._10347)
         {
            return;
         }
         if(this._10341)
         {
            for each(_loc3_ in this._10341.tweens)
            {
               if(_loc3_ is _64)
               {
                  _loc2_ = new Object();
                  _loc2_._2071 = _loc3_;
                  _loc2_.newValue = Number(this._4043._4047.txt.text) * _88.ANGLE_TO_RADIAN - _loc3_._1836.globalTransform.rotation;
               }
            }
            if(_loc2_)
            {
               _1567(new CommandNotification(CommandNotification.MODIFY_COMIC_TWEEN_VALUE,_loc2_));
            }
         }
      }
      
      private function _10322(param1:Event) : void
      {
         var _loc2_:Object = null;
         var _loc3_:_67 = null;
         this._10325 = 1;
         if(this._10341)
         {
            for each(_loc3_ in this._10341.tweens)
            {
               if(_loc3_ is _64)
               {
                  _loc2_ = new Object();
                  _loc2_._2071 = _loc3_;
                  _loc2_.newValue = this._4043._10342.selected;
               }
            }
            if(_loc2_)
            {
               _1567(new CommandNotification(CommandNotification.MODIFY_COMIC_TWEEN_LOOP,_loc2_));
            }
         }
      }
      
      private function _4053(param1:Event) : void
      {
         var _loc2_:Object = null;
         this._10325 = 1;
         if(this._10341)
         {
            _loc2_ = new Object();
            _loc2_.tweens = this._10341.tweens;
            _loc2_.newValue = this._4043._4068.selectedIndex + 1;
            if(_loc2_)
            {
               _1567(new CommandNotification(CommandNotification.MODIFY_COMIC_TWEENS_EASING,_loc2_));
            }
         }
      }
      
      private function _4027(param1:Event) : void
      {
         var _loc2_:Object = null;
         var _loc3_:_645 = null;
         this._10325 = 0;
         if(this._10321)
         {
            _loc3_ = this._10321.parent;
            _loc2_ = new Object();
            _loc2_._2071 = _loc3_._3107.tweens[0];
            _loc2_.newValue = this._4042._4068.selectedIndex + 1;
            if(_loc2_)
            {
               this._10307 = true;
               _1567(new CommandNotification(CommandNotification.MODIFY_COMIC_TWEEN_EASING,_loc2_));
            }
         }
      }
      
      private function _10308(param1:Event) : void
      {
         var _loc2_:Object = null;
         var _loc3_:_645 = null;
         this._10325 = 2;
         if(this._10313)
         {
            _loc3_ = this._10313.parent;
            _loc2_ = new Object();
            _loc2_._2071 = _loc3_._10287.tweens[0];
            _loc2_.newValue = this._6183._4068.selectedIndex + 1;
            if(_loc2_)
            {
               this._10307 = true;
               _1567(new CommandNotification(CommandNotification.MODIFY_COMIC_TWEEN_EASING,_loc2_));
            }
         }
      }
      
      private function _4029(param1:Event) : void
      {
         var _loc2_:Object = null;
         var _loc3_:_645 = null;
         this._10325 = 0;
         if(this._10321)
         {
            _loc3_ = this._10321.parent;
            _loc2_ = new Object();
            _loc2_._2071 = _loc3_._3107.tweens[0];
            _loc2_.newValue = this._4042._4072.selectedIndex;
            if(_loc2_)
            {
               this._10307 = true;
               _1567(new CommandNotification(CommandNotification.MODIFY_COMIC_TWEEN_VALUE,_loc2_));
            }
         }
      }
      
      private function _10311(param1:Event) : void
      {
         var _loc2_:Object = null;
         var _loc3_:_645 = null;
         this._10325 = 2;
         if(this._10313)
         {
            _loc3_ = this._10313.parent;
            _loc2_ = new Object();
            _loc2_._2071 = _loc3_._10287.tweens[0];
            _loc2_.newValue = this._6183._4072.selectedIndex;
            if(_loc2_)
            {
               this._10307 = true;
               _1567(new CommandNotification(CommandNotification.MODIFY_COMIC_TWEEN_VALUE,_loc2_));
            }
         }
      }
      
      private function _4039(param1:Event) : void
      {
         var _loc2_:int = this._4043._4056.value;
         this._4043._4071.txt.text = _loc2_.toFixed();
      }
      
      private function _4030(param1:Event) : void
      {
         this._4037(null);
         this._4064(null);
      }
      
      private function _4026(param1:Event) : void
      {
         this._4062 = int(this._4043._4056.value);
      }
      
      private function _4037(param1:FocusEvent) : void
      {
         var _loc2_:Number = Number(this._4043._4071.txt.text);
         if(_loc2_ > 100)
         {
            _loc2_ = 100;
         }
         else if(_loc2_ < 0)
         {
            _loc2_ = 0;
         }
         var _loc3_:Number = this._4062;
         if(_loc3_ != _loc2_)
         {
            this._4043._4056.value = _loc2_;
            this._4043._4071.txt.text = _loc2_.toFixed();
            this._4062 = _loc2_;
         }
      }
      
      private function _4040(param1:MouseEvent) : void
      {
         this._10325 = 0;
         this._3975._3934(_711.COMIC,_712.ADD_APPEAR);
      }
      
      private function _10323(param1:MouseEvent) : void
      {
         this._10325 = 2;
         this._3975._3934(_711.COMIC,_712.ADD_DISAPPEAR);
      }
      
      private function _4045(param1:Event) : void
      {
         var _loc2_:int = int(this._4028._4025.txt.text);
         var _loc3_:int = int(this._4028._4024.txt.text);
         var _loc4_:Object = _469._3494(this._3118._4049,_loc2_,_loc3_,this._4028._4066._4061);
         _1567(new CommandNotification(CommandNotification.MODIFY_COMIC_STAGE_CANVAS,_loc4_));
         if(this._4075)
         {
            this._4060 = true;
         }
         else
         {
            _2217._1651();
         }
      }
      
      private function _10324(param1:Event) : void
      {
         var _loc2_:Object = _469._3494(this._3118._4049,this._3118._4049.width,this._3118._4049.height,this._4028._4066._4061);
         _1567(new CommandNotification(CommandNotification.MODIFY_COMIC_STAGE_CANVAS,_loc2_));
      }
      
      private function _4052(param1:Event) : void
      {
         var _loc2_:Object = _469._3494(this._3118._4049,this._3118._4049.width,this._3118._4049.height,this._4028._4066._4061);
         _1567(new CommandNotification(CommandNotification.MODIFY_COMIC_STAGE_CANVAS,_loc2_));
         _2217._1651();
      }
      
      private function addAction(param1:MouseEvent) : void
      {
         this._10325 = 1;
         this._3118._3055.start();
         this._3975._3934(_711.COMIC,_712.ADD_TWEEN);
      }
      
      private function _4065(param1:MouseEvent) : void
      {
         _1567(new CommandNotification(CommandNotification.OPEN_PANEL,_116.COMIC_ORDER_PANEL));
      }
      
      private function _4051(param1:MouseEvent) : void
      {
         _1567(new ComicNotification(ComicNotification.SHOW_ANIMATION,true));
      }
      
      private function _4033(param1:MouseEvent) : void
      {
         this._10325 = 1;
         this._3975._3934(_711.COMIC,_712.CHANGE_TWEEN);
      }
      
      private function _4032(param1:MouseEvent) : void
      {
         this._10325 = 0;
         this._3975._3934(_711.COMIC,_712.CHANGE_APPEAR_TWEEN);
      }
      
      private function _10316(param1:MouseEvent) : void
      {
         this._10325 = 2;
         this._3975._3934(_711.COMIC,_712.CHANGE_DISAPPEAR_TWEEN);
      }
      
      private function _4031(param1:MouseEvent) : void
      {
         var _loc2_:_645 = null;
         if(Boolean(this._4044._4080) && this._4044._4080.length == 1)
         {
            if(this._4044._4080[0] is _79)
            {
               _loc2_ = this._3112._3567._3116((this._4044._4080[0] as _79).parentBoneData,this._4044._4080[0] as _79);
            }
            else if(this._4044._4080[0] is _646)
            {
               _loc2_ = (this._4044._4080[0] as _646).parent;
            }
            if(Boolean(_loc2_) && Boolean(_loc2_._3107))
            {
               this._3112._1567(new ComicNotification(ComicNotification.PREVIEW_TRACK,_loc2_._3107));
            }
         }
      }
      
      private function _10312(param1:MouseEvent) : void
      {
         var _loc2_:_645 = null;
         if(Boolean(this._4044._4080) && this._4044._4080.length == 1)
         {
            if(this._4044._4080[0] is _79)
            {
               _loc2_ = this._3112._3567._3116((this._4044._4080[0] as _79).parentBoneData,this._4044._4080[0] as _79);
            }
            else if(this._4044._4080[0] is _646)
            {
               _loc2_ = (this._4044._4080[0] as _646).parent;
            }
            if(Boolean(_loc2_) && Boolean(_loc2_._10287))
            {
               this._3112._1567(new ComicNotification(ComicNotification.PREVIEW_TRACK,_loc2_._10287));
            }
         }
      }
      
      private function _4038(param1:MouseEvent) : void
      {
      }
      
      private function _4057(param1:MouseEvent) : void
      {
         var _loc2_:_645 = null;
         var _loc3_:_646 = null;
         if(Boolean(this._4044._4080) && this._4044._4080.length == 1)
         {
            if(this._4044._4080[0] as _646)
            {
               _loc3_ = this._4044._4080[0] as _646;
               if(!_loc3_._3071 && !_loc3_._10286)
               {
                  this._3112._1567(new ComicNotification(ComicNotification.PREVIEW_TRACK,_loc3_));
               }
               else
               {
                  _loc2_ = _646(this._4044._4080[0]).parent;
                  if(_loc2_.tracks)
                  {
                     this._3112._1567(new ComicNotification(ComicNotification.PREVIEW_TRACK,_loc2_.tracks[0]));
                  }
               }
            }
            else if(this._4044._4080[0] as _79)
            {
               _loc2_ = this._3112._3567._3116((this._4044._4080[0] as _79).parentBoneData,this._4044._4080[0] as _79);
               if(_loc2_.tracks)
               {
                  this._3112._1567(new ComicNotification(ComicNotification.PREVIEW_TRACK,_loc2_.tracks[0]));
               }
            }
         }
      }
      
      private function _10331(param1:Event) : void
      {
         var _loc2_:Object = null;
         var _loc3_:_67 = null;
         this._10325 = 1;
         if(this._10341)
         {
            for each(_loc3_ in this._10341.tweens)
            {
               if(_loc3_ is _10245)
               {
                  _loc2_ = new Object();
                  _loc2_._2071 = _loc3_;
                  _loc2_.newValue = new Object();
                  _loc2_.newValue.direction = this._4043._10326.selectedIndex;
                  _loc2_.newValue.speed = this._4043._10346._10335(this._4043._10339.selectedIndex);
                  _loc2_.newValue.intensity = this._4043._10346._10317(this._4043._10329.selectedIndex);
               }
            }
            if(_loc2_)
            {
               _1567(new CommandNotification(CommandNotification.MODIFY_COMIC_TWEEN_VALUE,_loc2_));
            }
         }
      }
      
      private function _10334(param1:Event) : void
      {
         var _loc2_:Object = null;
         var _loc3_:_67 = null;
         this._10325 = 1;
         if(this._10341)
         {
            for each(_loc3_ in this._10341.tweens)
            {
               if(_loc3_ is _10245)
               {
                  _loc2_ = new Object();
                  _loc2_._2071 = _loc3_;
                  _loc2_.newValue = this._4043._10343.selected;
               }
            }
            if(_loc2_)
            {
               _1567(new CommandNotification(CommandNotification.MODIFY_COMIC_TWEEN_LOOP,_loc2_));
            }
         }
      }
      
      private function _10330(param1:Event) : void
      {
         var _loc2_:Object = null;
         var _loc3_:_67 = null;
         this._10325 = 1;
         if(this._10341)
         {
            for each(_loc3_ in this._10341.tweens)
            {
               if(_loc3_ is _10246)
               {
                  _loc2_ = new Object();
                  _loc2_._2071 = _loc3_;
                  _loc2_.newValue = new Object();
                  _loc2_.newValue.speed = this._4043._10345._10335(this._4043._10338.selectedIndex);
                  _loc2_.newValue.intensity = this._4043._10345._10317(this._4043._10328.selectedIndex);
               }
            }
            if(_loc2_)
            {
               _1567(new CommandNotification(CommandNotification.MODIFY_COMIC_TWEEN_VALUE,_loc2_));
            }
         }
      }
      
      private function _10333(param1:Event) : void
      {
         var _loc2_:Object = null;
         var _loc3_:_67 = null;
         this._10325 = 1;
         if(this._10341)
         {
            for each(_loc3_ in this._10341.tweens)
            {
               if(_loc3_ is _10246)
               {
                  _loc2_ = new Object();
                  _loc2_._2071 = _loc3_;
                  _loc2_.newValue = this._4043._10344.selected;
               }
            }
            if(_loc2_)
            {
               _1567(new CommandNotification(CommandNotification.MODIFY_COMIC_TWEEN_LOOP,_loc2_));
            }
         }
      }
      
      private function _10314(param1:Event) : void
      {
         var _loc2_:Object = null;
         var _loc3_:_67 = null;
         this._10325 = 1;
         if(this._10341)
         {
            for each(_loc3_ in this._10341.tweens)
            {
               if(_loc3_ is _10244)
               {
                  _loc2_ = new Object();
                  _loc2_._2071 = _loc3_;
                  _loc2_.newValue = new Object();
                  _loc2_.newValue.direction = this._4043._10310.selectedIndex;
                  _loc2_.newValue.speed = this._4043._10337._10335(this._4043._10327.selectedIndex);
                  _loc2_.newValue.intensity = this._4043._10337._10317(this._4043._10309.selectedIndex);
               }
            }
            if(_loc2_)
            {
               _1567(new CommandNotification(CommandNotification.MODIFY_COMIC_TWEEN_VALUE,_loc2_));
            }
         }
      }
      
      private function _10319(param1:Event) : void
      {
         var _loc2_:Object = null;
         var _loc3_:_67 = null;
         this._10325 = 1;
         if(this._10341)
         {
            for each(_loc3_ in this._10341.tweens)
            {
               if(_loc3_ is _10244)
               {
                  _loc2_ = new Object();
                  _loc2_._2071 = _loc3_;
                  _loc2_.newValue = this._4043._10336.selected;
               }
            }
            if(_loc2_)
            {
               _1567(new CommandNotification(CommandNotification.MODIFY_COMIC_TWEEN_LOOP,_loc2_));
            }
         }
      }
      
      private function _10460(param1:Event) : void
      {
         var _loc2_:Object = null;
         var _loc3_:_67 = null;
         this._10325 = 1;
         if(this._10341)
         {
            for each(_loc3_ in this._10341.tweens)
            {
               if(_loc3_ is _10430)
               {
                  _loc2_ = new Object();
                  _loc2_._2071 = _loc3_;
                  _loc2_.newValue = this._4043._10468._10335(this._4043._10464.selectedIndex);
               }
            }
            if(_loc2_)
            {
               _1567(new CommandNotification(CommandNotification.MODIFY_COMIC_TWEEN_VALUE,_loc2_));
            }
         }
      }
      
      private function _10462(param1:Event) : void
      {
         var _loc2_:Object = null;
         var _loc3_:_67 = null;
         this._10325 = 1;
         if(this._10341)
         {
            for each(_loc3_ in this._10341.tweens)
            {
               if(_loc3_ is _10430)
               {
                  _loc2_ = new Object();
                  _loc2_._2071 = _loc3_;
                  _loc2_.newValue = this._4043._10466.selected;
               }
            }
            if(_loc2_)
            {
               _1567(new CommandNotification(CommandNotification.MODIFY_COMIC_TWEEN_LOOP,_loc2_));
            }
         }
      }
      
      private function _10461(param1:Event) : void
      {
         var _loc2_:Object = null;
         var _loc3_:_67 = null;
         this._10325 = 1;
         if(this._10341)
         {
            for each(_loc3_ in this._10341.tweens)
            {
               if(_loc3_ is _10429)
               {
                  _loc2_ = new Object();
                  _loc2_._2071 = _loc3_;
                  _loc2_.newValue = this._4043._10469._10335(this._4043._10465.selectedIndex);
               }
            }
            if(_loc2_)
            {
               _1567(new CommandNotification(CommandNotification.MODIFY_COMIC_TWEEN_VALUE,_loc2_));
            }
         }
      }
      
      private function _10463(param1:Event) : void
      {
         var _loc2_:Object = null;
         var _loc3_:_67 = null;
         this._10325 = 1;
         if(this._10341)
         {
            for each(_loc3_ in this._10341.tweens)
            {
               if(_loc3_ is _10429)
               {
                  _loc2_ = new Object();
                  _loc2_._2071 = _loc3_;
                  _loc2_.newValue = this._4043._10467.selected;
               }
            }
            if(_loc2_)
            {
               _1567(new CommandNotification(CommandNotification.MODIFY_COMIC_TWEEN_LOOP,_loc2_));
            }
         }
      }
      
      public function set _10315(param1:int) : void
      {
         this._10325 = param1;
      }
      
      public function refresh(param1:Object = null) : void
      {
         var _loc3_:_645 = null;
         var _loc4_:_79 = null;
         var _loc5_:_645 = null;
         var _loc2_:Vector.<_91> = this._3061._2889;
         this._4044._4080 = _loc2_;
         if(_loc2_ == null || _loc2_.length == 0)
         {
            this._4028.model = this._3118._4049;
         }
         else
         {
            if(_loc2_[0] is _79)
            {
               if(this._10307)
               {
                  this._10307 = false;
               }
               else if(this._3112._4050(_loc2_[0] as _79))
               {
                  _loc3_ = this._3112._3567._3116((_loc2_[0] as _79).parentBoneData,_loc2_[0] as _79);
                  if(_loc3_.tracks)
                  {
                     if(_loc3_.tracks.length == 1)
                     {
                        this._10325 = 1;
                     }
                  }
               }
            }
            this._4044._2565.selectedIndex = this._10325;
            this._4044._4048.selectedIndex = this._10325;
         }
         this._4044._2894();
         if(Boolean(this._4044._4080) && this._4044._4080.length == 1)
         {
            if(this._4044._4080[0] is _646)
            {
               this._10341 = this._4044._4080[0] as _646;
               this._10321 = this._10341.parent._3107;
               this._10313 = this._10341.parent._10287;
            }
            else if(this._4044._4080[0] is _79)
            {
               _loc4_ = this._4044._4080[0] as _79;
               _loc5_ = this._3112._3567._3116(_loc4_.parentBoneData,_loc4_);
               if(_loc5_.tracks.length > 0)
               {
                  this._10341 = _loc5_.tracks[0];
               }
               this._10321 = _loc5_._3107;
               this._10313 = _loc5_._10287;
            }
         }
         else
         {
            this._10341 = null;
            this._10321 = null;
            this._10313 = null;
         }
      }
      
      private function get _3061() : _523
      {
         return _1407.getInstance(_523) as _523;
      }
      
      protected function get _3975() : _540
      {
         return _1407.getInstance(_540) as _540;
      }
      
      protected function get _3112() : _589
      {
         return _1407.getInstance(_589) as _589;
      }
      
      protected function get _3118() : _605
      {
         return _1407.getInstance(_605) as _605;
      }
      
      private function get _4043() : ActionPropertyGroup
      {
         return this._4044._4043;
      }
      
      private function get _4042() : _814
      {
         return this._4044._4042;
      }
      
      private function get _6183() : _816
      {
         return this._4044._6183;
      }
      
      private function get _4028() : _815
      {
         return this._4044._4028;
      }
   }
}

