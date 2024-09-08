package _573
{
   import _13492._13495;
   import _13492._13496;
   import _13505._13508;
   import _13505._13510;
   import _1404._1407;
   import _413._11100;
   import _413._458;
   import _470._11495;
   import _51._79;
   import _555._557;
   import _639._12462;
   import _783.CommandNotification;
   import _783.MenuNotification;
   import _783.TimelineNotification;
   import flash.events.MouseEvent;
   import flash.utils.Dictionary;
   
   public class _575 extends _574
   {
      private var _11356:_557;
      
      public function _575()
      {
         super();
      }
      
      override protected function _1576() : void
      {
         super._1576();
         timeline._4664.addEventListener(MouseEvent.CLICK,this._4747);
         timeline._4664.selected = _12462.getInstance().autoKey;
         _1565(MenuNotification.DISTRIBUTE_SLOT_TO_FRAMES,this._11152);
      }
      
      private function _11152(param1:MenuNotification) : void
      {
         this._11151();
      }
      
      override public function get _3918() : Boolean
      {
         var _loc2_:Vector.<_11495> = null;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:_13496 = null;
         var _loc6_:int = 0;
         var _loc7_:Vector.<_11495> = null;
         var _loc8_:_13510 = null;
         var _loc9_:_13496 = null;
         var _loc1_:Vector.<_13496> = _13815._2889;
         if(Boolean(_loc1_) && _loc1_.length > 0)
         {
            _loc2_ = new Vector.<_11495>();
            _loc3_ = 0;
            _loc4_ = _loc1_.length;
            while(_loc3_ < _loc4_)
            {
               _loc5_ = _loc1_[_loc3_] as _13496;
               if((_loc5_) && _loc5_._13663 && !_loc5_._13642)
               {
                  return true;
               }
               _loc3_++;
            }
         }
         else if(timeline)
         {
            _loc6_ = timeline.curFrame;
            _loc7_ = new Vector.<_11495>();
            if(_13796._2889.length > 0)
            {
               _loc3_ = 0;
               _loc4_ = _13796._2889.length;
               while(_loc3_ < _loc4_)
               {
                  _loc8_ = _13796._2889[_loc3_];
                  if((Boolean(_loc8_)) && (_loc8_.flag == _13510.FLAG_TRANSLATE || _loc8_.flag == _13510.FLAG_ROTATE || _loc8_.flag == _13510.FLAG_SCALE || _loc8_.flag == _13510.FLAG_COLOR))
                  {
                     _loc9_ = _loc8_._11281(_loc6_);
                     if((_loc9_) && _loc9_._13663 && !_loc9_._13642 && _loc9_ != _loc8_._1816[_loc8_._1816.length - 1])
                     {
                        return true;
                     }
                  }
                  _loc3_++;
               }
            }
         }
         return false;
      }
      
      override public function get _3911() : Boolean
      {
         var _loc2_:Vector.<_11495> = null;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:_13496 = null;
         var _loc6_:int = 0;
         var _loc7_:Vector.<_11495> = null;
         var _loc8_:_13510 = null;
         var _loc9_:_13496 = null;
         var _loc1_:Vector.<_13496> = _13815._2889;
         if(Boolean(_loc1_) && _loc1_.length > 0)
         {
            _loc2_ = new Vector.<_11495>();
            _loc3_ = 0;
            _loc4_ = _loc1_.length;
            while(_loc3_ < _loc4_)
            {
               _loc5_ = _loc1_[_loc3_] as _13496;
               if((_loc5_) && _loc5_._13663 && _loc5_._13642)
               {
                  return true;
               }
               _loc3_++;
            }
         }
         else if(timeline)
         {
            _loc6_ = timeline.curFrame;
            _loc7_ = new Vector.<_11495>();
            if(_13796._2889.length > 0)
            {
               _loc3_ = 0;
               _loc4_ = _13796._2889.length;
               while(_loc3_ < _loc4_)
               {
                  _loc8_ = _13796._2889[_loc3_];
                  if((Boolean(_loc8_)) && (_loc8_.flag == _13510.FLAG_TRANSLATE || _loc8_.flag == _13510.FLAG_ROTATE || _loc8_.flag == _13510.FLAG_SCALE || _loc8_.flag == _13510.FLAG_COLOR))
                  {
                     _loc9_ = _loc8_._11281(_loc6_);
                     if((_loc9_) && _loc9_._13663 && _loc9_._13642 && _loc9_ != _loc8_._1816[_loc8_._1816.length - 1])
                     {
                        return true;
                     }
                  }
                  _loc3_++;
               }
            }
         }
         return false;
      }
      
      override protected function _4567(param1:MenuNotification) : void
      {
         var _loc3_:Vector.<_11495> = null;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:_13496 = null;
         var _loc7_:int = 0;
         var _loc8_:Vector.<_11495> = null;
         var _loc9_:_13510 = null;
         var _loc10_:_13496 = null;
         if(!this._11356)
         {
            this._11356 = _1407.getInstance(_557) as _557;
         }
         var _loc2_:Vector.<_13496> = _13815._2889;
         if(Boolean(_loc2_) && _loc2_.length > 0)
         {
            _loc3_ = new Vector.<_11495>();
            _loc4_ = 0;
            _loc5_ = _loc2_.length;
            while(_loc4_ < _loc5_)
            {
               _loc6_ = _loc2_[_loc4_] as _13496;
               if((_loc6_) && _loc6_._13663 && !_loc6_._13642)
               {
                  _loc3_.push(_11495.create(_loc6_).add("tweenType",1).add("tweenCurve",null));
               }
               _loc4_++;
            }
            _11495._11566(CommandNotification.MODIFY_FRAMES_TWEEN_CURVE,_loc3_,this._11356._11613);
         }
         else if(timeline)
         {
            _loc7_ = timeline.curFrame;
            _loc8_ = new Vector.<_11495>();
            if(_13796._2889.length > 0)
            {
               _loc4_ = 0;
               _loc5_ = _13796._2889.length;
               while(_loc4_ < _loc5_)
               {
                  _loc9_ = _13796._2889[_loc4_];
                  if((Boolean(_loc9_)) && (_loc9_.flag == _13510.FLAG_TRANSLATE || _loc9_.flag == _13510.FLAG_ROTATE || _loc9_.flag == _13510.FLAG_SCALE || _loc9_.flag == _13510.FLAG_COLOR))
                  {
                     _loc10_ = _loc9_._11281(_loc7_);
                     if((_loc10_) && _loc10_._13663 && !_loc10_._13642)
                     {
                        _loc8_.push(_11495.create(_loc10_).add("tweenType",1).add("tweenCurve",null));
                     }
                  }
                  _loc4_++;
               }
            }
            if(_loc8_.length > 0)
            {
               _11495._11566(CommandNotification.MODIFY_FRAMES_TWEEN_CURVE,_loc8_,this._11356._11613);
            }
         }
      }
      
      override protected function _4558(param1:MenuNotification) : void
      {
         var _loc3_:Vector.<_11495> = null;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:_13496 = null;
         var _loc7_:Vector.<_11495> = null;
         var _loc8_:int = 0;
         var _loc9_:_13510 = null;
         var _loc10_:_13496 = null;
         if(!this._11356)
         {
            this._11356 = _1407.getInstance(_557) as _557;
         }
         var _loc2_:Vector.<_13496> = _13815._2889;
         if(Boolean(_loc2_) && _loc2_.length > 0)
         {
            _loc3_ = new Vector.<_11495>();
            _loc4_ = 0;
            _loc5_ = _loc2_.length;
            while(_loc4_ < _loc5_)
            {
               _loc6_ = _loc2_[_loc4_] as _13496;
               if((_loc6_) && _loc6_._13663 && _loc6_._13642)
               {
                  _loc3_.push(_11495.create(_loc6_).add("tweenType",0).add("tweenCurve",null));
               }
               _loc4_++;
            }
            _11495._11566(CommandNotification.MODIFY_FRAMES_TWEEN_CURVE,_loc3_,this._11356._11613);
         }
         else if(timeline)
         {
            _loc7_ = new Vector.<_11495>();
            _loc8_ = timeline.curFrame;
            if(_13796._2889.length > 0)
            {
               _loc4_ = 0;
               _loc5_ = _13796._2889.length;
               while(_loc4_ < _loc5_)
               {
                  _loc9_ = _13796._2889[_loc4_];
                  if((Boolean(_loc9_)) && (_loc9_.flag == _13510.FLAG_TRANSLATE || _loc9_.flag == _13510.FLAG_ROTATE || _loc9_.flag == _13510.FLAG_SCALE || _loc9_.flag == _13510.FLAG_COLOR))
                  {
                     _loc10_ = _loc9_._11281(_loc8_);
                     if((_loc10_) && _loc10_._13663 && _loc10_._13642)
                     {
                        _loc7_.push(_11495.create(_loc10_).add("tweenType",0).add("tweenCurve",null));
                     }
                  }
                  _loc4_++;
               }
            }
            if(_loc7_.length > 0)
            {
               _11495._11566(CommandNotification.MODIFY_FRAMES_TWEEN_CURVE,_loc7_,this._11356._11613);
            }
         }
      }
      
      private function _4747(param1:MouseEvent) : void
      {
         _1567(new TimelineNotification(TimelineNotification.AUTO_KEY,timeline._4664.selected));
      }
      
      override public function stop() : void
      {
         super.stop();
         if(timeline)
         {
            timeline._4664.removeEventListener(MouseEvent.CLICK,this._4747);
         }
      }
      
      private function _11151() : void
      {
         var _loc1_:_79 = null;
         var _loc2_:_13508 = null;
         var _loc3_:_13510 = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:_11100 = null;
         var _loc8_:int = 0;
         var _loc9_:* = false;
         var _loc10_:int = 0;
         var _loc11_:Array = null;
         var _loc12_:Array = null;
         var _loc13_:_13495 = null;
         var _loc14_:Object = null;
         var _loc15_:int = 0;
         var _loc16_:_13495 = null;
         var _loc17_:Dictionary = null;
         var _loc18_:_458 = null;
         if(_13796._2889.length == 1)
         {
            _loc2_ = _13796._2889[0] as _13508;
            if(_loc2_)
            {
               _loc1_ = _loc2_._1824;
               _loc3_ = _loc2_._13572;
            }
         }
         if(_loc3_ && _loc1_ && _loc1_._1715.length > 1)
         {
            _loc7_ = new _11100();
            _loc8_ = int(_loc1_._1715.length);
            _loc4_ = timeline.curFrame;
            _loc9_ = _loc3_.getFrameByIndex(_loc4_) != null;
            _loc10_ = _loc9_ ? _loc4_ + 1 : _loc4_;
            _loc11_ = _loc3_._1936(_loc4_);
            if((Boolean(_loc11_)) && _loc11_.length > 0)
            {
               _loc16_ = _loc11_[0] as _13495;
               if(_loc16_.startPos < _loc10_ + _loc8_)
               {
                  (_loc17_ = new Dictionary())[_loc3_] = _loc11_;
                  (_loc18_ = new _458())._3448 = _loc17_;
                  _loc18_.delta = _loc10_ + _loc8_ - _loc16_.startPos;
                  _loc18_._3445 = -1;
                  _loc7_.moveFrame = _loc18_;
               }
            }
            _loc12_ = [];
            _loc15_ = 0;
            if(_loc1_._1923 != null && !_loc9_)
            {
               (_loc13_ = new _13495()).startPos = _loc10_ + _loc15_;
               _loc13_.value = _loc1_._1923;
               (_loc14_ = {})._1945 = _loc3_;
               _loc14_._1946 = _loc13_;
               _loc12_.push(_loc14_);
               _loc15_++;
            }
            _loc5_ = 0;
            while(_loc5_ < _loc8_)
            {
               if(_loc1_._1715[_loc5_] != _loc1_._1923 || _loc9_)
               {
                  (_loc13_ = new _13495()).startPos = _loc10_ + _loc15_;
                  _loc13_.value = _loc1_._1715[_loc5_];
                  (_loc14_ = {})._1945 = _loc3_;
                  _loc14_._1946 = _loc13_;
                  _loc12_.push(_loc14_);
                  _loc15_++;
               }
               _loc5_++;
            }
            if(_loc12_.length > 0)
            {
               _loc7_._11134 = _loc12_;
            }
            _1567(new CommandNotification(CommandNotification.DISPERSE_SLOT_TO_TIMELINE,_loc7_));
         }
      }
      
      override public function get _4580() : int
      {
         return -1;
      }
   }
}

