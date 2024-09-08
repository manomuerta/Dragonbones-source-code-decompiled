package _573
{
   import _13492._13493;
   import _13492._13494;
   import _13492._13495;
   import _13492._13496;
   import _13492._13498;
   import _13492._13499;
   import _13503._13502;
   import _13505._13504;
   import _13505._13507;
   import _13505._13508;
   import _13505._13510;
   import _13545._13548;
   import _1404._1407;
   import _1421.TreeDragEvent;
   import _172._174;
   import _24.Shortcut;
   import _40.BoneFrameVO;
   import _40.TimelineVOBase;
   import _40._39;
   import _40._47;
   import _40._48;
   import _413._458;
   import _413._460;
   import _470._11495;
   import _470._469;
   import _51._50;
   import _51._52;
   import _51._70;
   import _51._79;
   import _537._536;
   import _555.AnimationPanelController;
   import _555._557;
   import _636.TimelineEvent;
   import _703._705;
   import _708._715;
   import _783.CommandNotification;
   import _783.MenuNotification;
   import _783.StageNotification;
   import _783.TimelineNotification;
   import _81._86;
   import _978._980;
   import egret.utils.tr;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.utils.Dictionary;
   
   public class _572 extends _574
   {
      private var _11356:_557;
      
      public function _572()
      {
         super();
         _4555 = [];
         _4549 = new _536();
         _4592 = false;
      }
      
      private function get _4577() : _980
      {
         return timeline as _980;
      }
      
      override protected function _1576() : void
      {
         super._1576();
         timeline.addEventListener(TimelineEvent.DEL_LAYER,this._4594);
         timeline.addEventListener(TimelineEvent.ADD_LAYER,this._4593);
         timeline.addEventListener(TimelineEvent.CHANGE_LAYER_NAME,this._4562);
         this._4577._4578.addEventListener(MouseEvent.CLICK,this._4587);
         _1565(TimelineNotification.CLEAR_KEY_FRAME,this._4568);
         this._4577._4552.addEventListener(TreeDragEvent.ITEMS_DRAG_MOVE_COMPLETE,this._4117);
         _1565(MenuNotification.DISTRIBUTE_TO_FRAMES,this._4565);
         _1565(MenuNotification.INSERT_LAYER,this._4554);
         _1565(MenuNotification.DELETE_LAYER,this._4557);
         _1565(MenuNotification.RENAME,this._4006);
      }
      
      override protected function _4567(param1:MenuNotification) : void
      {
         var _loc3_:Vector.<_11495> = null;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:_13496 = null;
         var _loc7_:int = 0;
         var _loc8_:_13510 = null;
         var _loc9_:_13504 = null;
         var _loc10_:_13496 = null;
         var _loc11_:_13496 = null;
         var _loc12_:_13496 = null;
         var _loc13_:_13496 = null;
         var _loc14_:Vector.<_11495> = null;
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
               _loc6_ = _loc2_[_loc4_];
               this._13816(_loc3_,_loc6_);
               _loc4_++;
            }
            _11495._11566(CommandNotification.MODIFY_FRAMES_TWEEN_CURVE,_loc3_,this._11356._11613);
         }
         else if(timeline)
         {
            _loc7_ = timeline.curFrame;
            if(_13796._2889.length > 0)
            {
               _loc8_ = _13796._2889[0];
               if((Boolean(_loc8_)) && _loc8_ is _13504)
               {
                  _loc9_ = _loc8_ as _13504;
                  _loc10_ = _loc9_._13581._11281(_loc7_);
                  _loc11_ = _loc9_._13586._11281(_loc7_);
                  _loc12_ = _loc9_._13598._11281(_loc7_);
                  _loc13_ = this._4542(_loc10_);
                  _loc14_ = new Vector.<_11495>();
                  this._13816(_loc14_,_loc10_);
                  this._13816(_loc14_,_loc11_);
                  this._13816(_loc14_,_loc12_);
                  this._13816(_loc14_,_loc13_);
                  if(_loc14_.length > 0)
                  {
                     _11495._11566(CommandNotification.MODIFY_FRAMES_TWEEN_CURVE,_loc14_,this._11356._11613);
                  }
               }
            }
         }
      }
      
      private function _13816(param1:Vector.<_11495>, param2:_13496) : void
      {
         if(param2 && param2._13663 && !param2._13642)
         {
            param1.push(_11495.create(param2).add("tweenType",1).add("tweenCurve",null));
         }
      }
      
      private function _13817(param1:Vector.<_11495>, param2:_13496) : void
      {
         if(param2 && param2._13663 && param2._13642)
         {
            param1.push(_11495.create(param2).add("tweenType",0).add("tweenCurve",null));
         }
      }
      
      override protected function _4558(param1:MenuNotification) : void
      {
         var _loc3_:Vector.<_11495> = null;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:_13496 = null;
         var _loc7_:int = 0;
         var _loc8_:_13510 = null;
         var _loc9_:_13504 = null;
         var _loc10_:_13496 = null;
         var _loc11_:_13496 = null;
         var _loc12_:_13496 = null;
         var _loc13_:_13496 = null;
         var _loc14_:Vector.<_11495> = null;
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
               _loc6_ = _loc2_[_loc4_];
               this._13817(_loc3_,_loc6_);
               _loc4_++;
            }
            _11495._11566(CommandNotification.MODIFY_FRAMES_TWEEN_CURVE,_loc3_,this._11356._11613);
         }
         else if(timeline)
         {
            _loc7_ = timeline.curFrame;
            if(_13796._2889.length > 0)
            {
               _loc8_ = _13796._2889[0];
               if((Boolean(_loc8_)) && _loc8_ is _13504)
               {
                  _loc9_ = _loc8_ as _13504;
                  _loc10_ = _loc9_._13581._11281(_loc7_);
                  _loc11_ = _loc9_._13586._11281(_loc7_);
                  _loc12_ = _loc9_._13598._11281(_loc7_);
                  _loc13_ = this._4542(_loc10_);
                  _loc14_ = new Vector.<_11495>();
                  this._13817(_loc14_,_loc10_);
                  this._13817(_loc14_,_loc11_);
                  this._13817(_loc14_,_loc12_);
                  this._13817(_loc14_,_loc13_);
                  if(_loc14_.length > 0)
                  {
                     _11495._11566(CommandNotification.MODIFY_FRAMES_TWEEN_CURVE,_loc14_,this._11356._11613);
                  }
               }
            }
         }
      }
      
      private function _4557(param1:MenuNotification) : void
      {
         this._4594(null);
      }
      
      private function _4554(param1:MenuNotification) : void
      {
         this._4593(null);
      }
      
      private function _4583(param1:MenuNotification) : void
      {
         this._4568(null);
      }
      
      private function _4565(param1:MenuNotification) : void
      {
         this._4572();
      }
      
      override public function stop() : void
      {
         super.stop();
         timeline.removeEventListener(TimelineEvent.DEL_LAYER,this._4594);
         timeline.removeEventListener(TimelineEvent.ADD_LAYER,this._4593);
         this._4577._4578.removeEventListener(MouseEvent.CLICK,this._4587);
         _1564(TimelineNotification.CLEAR_KEY_FRAME,this._4568);
         this._4577._4552.removeEventListener(TreeDragEvent.ITEMS_DRAG_MOVE_COMPLETE,this._4117);
         _1564(MenuNotification.DISTRIBUTE_TO_FRAMES,this._4565);
         _1564(MenuNotification.INSERT_LAYER,this._4554);
         _1564(MenuNotification.DELETE_LAYER,this._4557);
         _1564(MenuNotification.RENAME,this._4006);
      }
      
      private function _4006(param1:MenuNotification) : void
      {
         var _loc2_:Object = null;
         var _loc3_:_52 = null;
         if(param1.data == "timeline")
         {
            _loc2_ = _2226._2484;
            if(_loc2_ is _52)
            {
               _loc3_ = _loc2_ as _52;
            }
            else if(_loc2_ is _79)
            {
               _loc3_ = (_loc2_ as _79).parentBoneData;
            }
            if(_loc3_)
            {
               this._4585(_loc3_);
            }
         }
      }
      
      public function _11612(param1:Array) : void
      {
         var _loc4_:_13496 = null;
         var _loc5_:int = 0;
         var _loc6_:_13504 = null;
         var _loc7_:_13496 = null;
         var _loc8_:_13496 = null;
         var _loc9_:_52 = null;
         var _loc10_:_79 = null;
         var _loc11_:_13502 = null;
         var _loc12_:_13508 = null;
         var _loc13_:_13496 = null;
         var _loc2_:uint = 0;
         var _loc3_:uint = param1.length;
         while(_loc2_ < _loc3_)
         {
            _loc4_ = param1[_loc2_] as _13496;
            _loc5_ = _loc4_.startPos;
            _loc6_ = _loc4_.parent.parent as _13504;
            if(_loc6_)
            {
               _loc7_ = _loc6_._13586.getFrameByIndex(_loc5_);
               _loc8_ = _loc6_._13598.getFrameByIndex(_loc5_);
               if(_loc7_)
               {
                  param1.push(_loc7_);
               }
               if(_loc8_)
               {
                  param1.push(_loc8_);
               }
               _loc9_ = _loc6_._1823;
               if(_loc10_ = _loc9_._1882)
               {
                  _loc11_ = _loc6_.parent as _13502;
                  if(_loc11_)
                  {
                     _loc12_ = _loc11_._1875(_loc10_);
                     if(_loc12_)
                     {
                        _loc13_ = _loc12_._13599.getFrameByIndex(_loc5_);
                        if(_loc13_)
                        {
                           param1.push(_loc13_);
                        }
                     }
                  }
               }
            }
            _loc2_++;
         }
      }
      
      public function _4572() : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:_13504 = null;
         var _loc5_:_13508 = null;
         var _loc6_:_79 = null;
         var _loc7_:_13496 = null;
         var _loc8_:_13496 = null;
         var _loc9_:_13496 = null;
         var _loc10_:_13496 = null;
         var _loc11_:_13496 = null;
         var _loc12_:_13496 = null;
         var _loc13_:int = 0;
         var _loc16_:_13504 = null;
         var _loc17_:_13508 = null;
         var _loc20_:_460 = null;
         var _loc21_:_458 = null;
         var _loc22_:Object = null;
         var _loc24_:Object = null;
         var _loc25_:Array = null;
         var _loc26_:Array = null;
         var _loc27_:Array = null;
         var _loc28_:Array = null;
         var _loc29_:BoneFrameVO = null;
         var _loc30_:_13496 = null;
         var _loc31_:_13496 = null;
         var _loc32_:_13496 = null;
         var _loc33_:Array = null;
         var _loc34_:Array = null;
         var _loc35_:Array = null;
         var _loc36_:Array = null;
         var _loc37_:_13496 = null;
         var _loc38_:_13496 = null;
         var _loc39_:_13496 = null;
         var _loc40_:_47 = null;
         var _loc41_:String = null;
         var _loc42_:int = 0;
         var _loc43_:_52 = null;
         var _loc44_:_13504 = null;
         var _loc46_:int = 0;
         var _loc47_:int = 0;
         var _loc48_:_13508 = null;
         var _loc50_:Array = null;
         var _loc51_:Array = null;
         var _loc52_:Array = null;
         var _loc53_:Array = null;
         var _loc54_:Array = null;
         var _loc55_:Array = null;
         var _loc56_:Dictionary = null;
         var _loc1_:Array = [];
         var _loc14_:Dictionary = new Dictionary();
         var _loc15_:Vector.<_13508> = new Vector.<_13508>();
         var _loc18_:int = 0;
         var _loc19_:Vector.<_13504> = new Vector.<_13504>();
         var _loc23_:Array = [];
         _loc13_ = timeline.curFrame;
         _loc2_ = int(_13796._2889.length - 1);
         while(_loc2_ >= 0)
         {
            if(_13796._2889[_loc2_] is _13504)
            {
               _loc19_.push(_13796._2889[_loc2_] as _13504);
            }
            _loc2_--;
         }
         _loc3_ = int(_loc19_.length);
         if(_loc3_ > 1)
         {
            _loc2_ = 0;
            while(_loc2_ < _loc3_)
            {
               _loc4_ = _loc19_[_loc2_];
               if(_loc16_ == null)
               {
                  _loc16_ = _loc4_;
                  _loc6_ = _loc4_._1823._1882;
                  _loc17_ = _3896._1992._1875(_loc6_);
                  _loc7_ = _loc16_._13581._1933(_loc13_);
                  _loc8_ = _loc16_._13586._1933(_loc13_);
                  _loc9_ = _loc16_._13598._1933(_loc13_);
                  _loc13_ = _loc7_.startPos;
               }
               else
               {
                  _loc7_ = _loc4_._13581._1933(_loc13_);
                  _loc8_ = _loc4_._13586._1933(_loc13_);
                  _loc9_ = _loc4_._13598._1933(_loc13_);
                  if(_loc7_)
                  {
                     if(_loc14_[_loc4_._13581] == null)
                     {
                        _loc14_[_loc4_._13581] = [];
                     }
                     _loc14_[_loc4_._13581].push(_loc7_);
                  }
                  if(_loc8_)
                  {
                     if(_loc14_[_loc4_._13586] == null)
                     {
                        _loc14_[_loc4_._13586] = [];
                     }
                     _loc14_[_loc4_._13586].push(_loc8_);
                  }
                  if(_loc9_)
                  {
                     if(_loc14_[_loc4_._13598] == null)
                     {
                        _loc14_[_loc4_._13598] = [];
                     }
                     _loc14_[_loc4_._13598].push(_loc9_);
                  }
                  _loc6_ = _loc4_._1823._1882;
                  _loc5_ = _3896._1992._1875(_loc6_);
                  _loc10_ = _loc5_._13599._1933(_loc13_);
                  _loc11_ = _loc5_._13572._1933(_loc13_);
                  _loc12_ = _loc5_._13592._1933(_loc13_);
                  if(_loc10_)
                  {
                     if(_loc14_[_loc5_._13599] == null)
                     {
                        _loc14_[_loc5_._13599] = [];
                     }
                     _loc14_[_loc5_._13599].push(_loc10_);
                     _loc18_++;
                  }
                  if(_loc11_)
                  {
                     if(_loc14_[_loc5_._13572] == null)
                     {
                        _loc14_[_loc5_._13572] = [];
                     }
                     _loc14_[_loc5_._13572].push(_loc11_);
                  }
                  if(_loc12_)
                  {
                     if(_loc14_[_loc5_._13592] == null)
                     {
                        _loc14_[_loc5_._13592] = [];
                     }
                     _loc14_[_loc5_._13592].push(_loc12_);
                  }
                  _loc15_.push(_loc5_);
               }
               _loc2_++;
            }
            (_loc20_ = new _460())._3429 = _loc14_;
            if(_loc16_)
            {
               _loc50_ = _loc16_._13581._1936(_loc13_);
               _loc51_ = _loc16_._13586._1936(_loc13_);
               _loc52_ = _loc16_._13598._1936(_loc13_);
               if(Boolean(_loc50_) && _loc50_.length > 0)
               {
                  _loc53_ = _loc17_._13599._1936(_loc13_);
                  _loc54_ = _loc17_._13572._1936(_loc13_);
                  _loc55_ = _loc17_._13592._1936(_loc13_);
                  (_loc56_ = new Dictionary())[_loc16_._13581] = _loc50_;
                  _loc56_[_loc16_._13586] = _loc51_;
                  _loc56_[_loc16_._13598] = _loc52_;
                  _loc56_[_loc17_._13599] = _loc53_;
                  _loc56_[_loc17_._13572] = _loc54_;
                  _loc56_[_loc17_._13592] = _loc55_;
                  (_loc21_ = new _458())._3448 = _loc56_;
                  _loc21_.delta = _loc18_;
                  _loc21_._3445 = -1;
               }
            }
            var _loc45_:String = _3896._1992.rootArmatureData._1795.name;
            _loc46_ = 0;
            _loc47_ = int(_loc15_.length);
            while(_loc46_ < _loc47_)
            {
               _loc48_ = _loc15_[_loc46_];
               _loc24_ = {
                  "bones":{},
                  "slots":{}
               };
               _loc43_ = _loc48_._1824.parentBoneData;
               _loc44_ = _3896._1992._1873(_loc43_);
               _loc42_ = int(_loc19_.indexOf(_loc44_));
               _loc41_ = _loc48_._1824.name;
               _loc34_ = _loc14_[_loc48_._13599];
               _loc2_ = 0;
               _loc3_ = int(_loc34_.length);
               while(_loc2_ < _loc3_)
               {
                  _loc37_ = _loc34_[_loc2_] as _13496;
                  if(_loc24_.slots[_loc41_] == null)
                  {
                     _loc24_.slots[_loc41_] = [];
                  }
                  if(_loc24_.slots[_loc41_]["color"] == null)
                  {
                     _loc24_.slots[_loc41_]["color"] = [];
                  }
                  (_loc37_ = _loc37_.clone()).startPos = _loc13_ + _loc42_;
                  _loc24_.slots[_loc41_]["color"].push(_loc37_);
                  _loc2_++;
               }
               _loc35_ = _loc14_[_loc48_._13572];
               _loc2_ = 0;
               _loc3_ = int(_loc35_.length);
               while(_loc2_ < _loc3_)
               {
                  _loc38_ = _loc35_[_loc2_] as _13496;
                  if(_loc24_.slots[_loc41_] == null)
                  {
                     _loc24_.slots[_loc41_] = [];
                  }
                  if(_loc24_.slots[_loc41_]["display"] == null)
                  {
                     _loc24_.slots[_loc41_]["display"] = [];
                  }
                  (_loc38_ = _loc38_.clone()).startPos = _loc13_ + _loc42_;
                  _loc24_.slots[_loc41_]["display"].push(_loc38_);
                  _loc2_++;
               }
               _loc36_ = _loc14_[_loc48_._13592];
               _loc2_ = 0;
               _loc3_ = int(_loc36_.length);
               while(_loc2_ < _loc3_)
               {
                  _loc39_ = _loc36_[_loc2_] as _13496;
                  if(_loc24_.slots[_loc41_] == null)
                  {
                     _loc24_.slots[_loc41_] = [];
                  }
                  if(_loc24_.slots[_loc41_]["visible"] == null)
                  {
                     _loc24_.slots[_loc41_]["visible"] = [];
                  }
                  (_loc39_ = _loc39_.clone()).startPos = _loc13_ + _loc42_;
                  _loc24_.slots[_loc41_]["visible"].push(_loc39_);
                  _loc2_++;
               }
               _loc41_ = _loc44_._1823.name;
               _loc26_ = _loc14_[_loc44_._13581];
               _loc2_ = 0;
               _loc3_ = int(_loc26_.length);
               while(_loc2_ < _loc3_)
               {
                  _loc30_ = _loc26_[_loc2_] as _13496;
                  if(_loc24_.bones[_loc41_] == null)
                  {
                     _loc24_.bones[_loc41_] = [];
                  }
                  if(_loc24_.bones[_loc41_]["translate"] == null)
                  {
                     _loc24_.bones[_loc41_]["translate"] = [];
                  }
                  (_loc30_ = _loc30_.clone() as _13496).startPos = _loc13_ + _loc42_;
                  _loc24_.bones[_loc41_]["translate"].push(_loc30_);
                  _loc2_++;
               }
               _loc27_ = _loc14_[_loc44_._13586];
               _loc2_ = 0;
               _loc3_ = int(_loc27_.length);
               while(_loc2_ < _loc3_)
               {
                  _loc31_ = _loc27_[_loc2_] as _13496;
                  if(_loc24_.bones[_loc41_] == null)
                  {
                     _loc24_.bones[_loc41_] = [];
                  }
                  if(_loc24_.bones[_loc41_]["rotate"] == null)
                  {
                     _loc24_.bones[_loc41_]["rotate"] = [];
                  }
                  (_loc31_ = _loc31_.clone() as _13496).startPos = _loc13_ + _loc42_;
                  _loc24_.bones[_loc41_]["rotate"].push(_loc31_);
                  _loc2_++;
               }
               _loc28_ = _loc14_[_loc44_._13598];
               _loc2_ = 0;
               _loc3_ = int(_loc28_.length);
               while(_loc2_ < _loc3_)
               {
                  _loc32_ = _loc28_[_loc2_] as _13496;
                  if(_loc24_.bones[_loc41_] == null)
                  {
                     _loc24_.bones[_loc41_] = [];
                  }
                  if(_loc24_.bones[_loc41_]["scale"] == null)
                  {
                     _loc24_.bones[_loc41_]["scale"] = [];
                  }
                  (_loc32_ = _loc32_.clone() as _13496).startPos = _loc13_ + _loc42_;
                  _loc24_.bones[_loc41_]["scale"].push(_loc32_);
                  _loc2_++;
               }
               _loc22_ = _469._3495(_loc24_,_loc16_,_loc17_,_3896._1992,_loc45_);
               _loc23_.push(_loc22_);
               _loc46_++;
            }
            var _loc49_:Object = _469._3486(_loc20_,_loc21_,_loc23_);
            _1567(new CommandNotification(CommandNotification.DISPERSE_TO_LAYER,_loc49_));
            return;
         }
      }
      
      private function _4117(param1:TreeDragEvent) : void
      {
         var _loc7_:int = 0;
         var _loc8_:_13548 = null;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:Boolean = false;
         var _loc14_:Object = null;
         var _loc2_:Array = _3896.children;
         var _loc3_:Array = [];
         var _loc4_:Array = [];
         var _loc5_:Array = [];
         var _loc6_:int = _loc2_.indexOf(param1._4137) + (param1._4136 ? 0 : 1);
         var _loc9_:Array = param1._3597;
         var _loc10_:int = 0;
         _loc11_ = 0;
         _loc12_ = int(_loc9_.length);
         while(_loc11_ < _loc12_)
         {
            _loc8_ = _loc9_[_loc11_];
            _loc7_ = int(_loc2_.indexOf(_loc8_));
            if(_loc7_ < _loc6_)
            {
               _loc3_.push((_loc8_._1945 as _13504)._1823._1882);
               _loc5_.push(_loc7_);
               _loc10_++;
            }
            else
            {
               _loc3_.unshift((_loc8_._1945 as _13504)._1823._1882);
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
         _loc11_ = 0;
         _loc12_ = int(_loc4_.length);
         while(_loc11_ < _loc12_)
         {
            if(_loc4_[_loc11_] != _loc5_[_loc11_])
            {
               _loc13_ = true;
               break;
            }
            _loc11_++;
         }
         if(_loc13_)
         {
            _loc14_ = _469._3473(_loc3_,_loc4_,_loc5_);
            _1567(new CommandNotification(CommandNotification.Modify_SLOT_ITEMS_ZORDER,_loc14_));
         }
      }
      
      private function _4562(param1:TimelineEvent) : void
      {
         var _loc2_:_52 = param1.data as _52;
         if(_loc2_)
         {
            this._4585(_loc2_);
         }
      }
      
      private function _4585(param1:_52) : void
      {
         var curName:String = null;
         var onRenameClose:Function = null;
         var _1836:_52 = param1;
         var checkSameName:Function = function(param1:String):String
         {
            var _loc2_:String = null;
            var _loc3_:_79 = null;
            if(_1836.rootArmatureData._1793(param1))
            {
               _loc2_ = tr("Rename.bone.same");
            }
            return _loc2_;
         };
         onRenameClose = function(param1:Event):void
         {
            var _loc2_:Object = null;
            var _loc3_:_174 = param1.currentTarget as _174;
            var _loc4_:String = _loc3_.value;
            if(_loc4_ == null)
            {
               return;
            }
            var _loc5_:_79 = _1836._1882;
            _loc2_ = {
               "_1836":_1836,
               "_1837":_loc5_,
               "oldValue":_1836.name,
               "newValue":_loc4_
            };
            _1567(new CommandNotification(CommandNotification.MODIFY_LAYER_NAME,_loc2_));
         };
         curName = _1836.name;
         var renameDialog:_174 = new _174();
         renameDialog.title = tr("RenameWindow.title");
         renameDialog._2653 = tr("RenameWindow.newName");
         renameDialog.value = curName;
         renameDialog._2651 = function(param1:String):String
         {
            if(!param1)
            {
               return "";
            }
            if(param1 == curName)
            {
               return tr("RenameWindow.error.same");
            }
            return checkSameName(param1);
         };
         renameDialog.addEventListener(Event.CLOSE,onRenameClose);
         renameDialog.open();
      }
      
      private function _4587(param1:MouseEvent) : void
      {
         _4592 = this._4577._4578.selected;
      }
      
      private function _4593(param1:TimelineEvent) : void
      {
         var _loc2_:Object = _469._3498(_3896._1992);
         _1567(new CommandNotification(CommandNotification.ADD_LAYER,_loc2_));
      }
      
      private function _4594(param1:TimelineEvent) : void
      {
         var _loc2_:Array = _13796._13777();
         var _loc3_:_52 = _3896._13819(_loc2_);
         if(_loc2_.length > 0)
         {
            _1567(new CommandNotification(CommandNotification.DELETE_LAYERS,{
               "_2889":_loc2_,
               "_3412":_loc3_
            }));
         }
      }
      
      private function _4568(param1:TimelineNotification) : void
      {
         var _loc4_:_79 = null;
         var _loc5_:int = 0;
         var _loc6_:_13504 = null;
         var _loc7_:_13508 = null;
         var _loc11_:_13510 = null;
         var _loc12_:_13495 = null;
         var _loc13_:Object = null;
         var _loc2_:Array = [];
         var _loc3_:int = int(_13796._2889.length);
         var _loc8_:_13502 = _3896._1992;
         var _loc9_:int = timeline.curFrame;
         var _loc10_:Array = [];
         if(_loc3_ > 0)
         {
            _loc5_ = 0;
            while(_loc5_ < _loc3_)
            {
               if(_13796._2889[_loc5_] is _13504)
               {
                  _loc6_ = _13796._2889[_loc5_] as _13504;
                  if(_loc4_ = _loc6_._1823._1882)
                  {
                     _loc7_ = _loc8_._1875(_loc4_);
                     if(_loc7_)
                     {
                        _loc11_ = _loc7_._13572;
                        if((Boolean(_loc12_ = _loc11_._1933(_loc9_) as _13495)) && _loc12_._13613 != null)
                        {
                           (_loc13_ = {}).newValue = null;
                           _loc13_.oldValue = _loc12_._13613;
                           _loc13_._1946 = _loc12_;
                           _loc10_.push(_loc13_);
                        }
                     }
                  }
               }
               _loc5_++;
            }
            if(_loc10_.length > 0)
            {
               _1567(new CommandNotification(CommandNotification.CLEAR_KEY_FRAMES,_loc10_));
            }
         }
      }
      
      protected function _4543(param1:_79, param2:_48, param3:int, param4:Array) : void
      {
      }
      
      override public function _1871() : void
      {
         _3896._13785();
         _4581.refresh();
      }
      
      override protected function _4548(param1:StageNotification) : void
      {
         if(_2220._2873 == _715.GENERAL)
         {
            _4556();
            _3140();
         }
         if(Boolean(timeline) && timeline is _980)
         {
            (timeline as _980)._4590.enabled = _2226._3872 != null || _2226._3150 != null;
         }
      }
      
      override protected function _2986(param1:Array) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:Object = null;
         var _loc5_:_13502 = null;
         var _loc6_:_13504 = null;
         var _loc7_:_13508 = null;
         var _loc8_:_13507 = null;
         var _loc10_:_52 = null;
         var _loc11_:_79 = null;
         var _loc12_:_13548 = null;
         var _loc13_:_13510 = null;
         var _loc14_:int = 0;
         var _loc9_:Vector.<_13510> = new Vector.<_13510>();
         _loc5_ = !!_3896 ? _3896._1992 : null;
         if(_loc5_)
         {
            _loc2_ = 0;
            _loc3_ = int(param1.length);
            while(_loc2_ < _loc3_)
            {
               _loc4_ = param1[_loc2_];
               if(_loc4_ is _52)
               {
                  _loc10_ = _loc4_ as _52;
               }
               else if(_loc4_ is _79)
               {
                  _loc10_ = (_loc4_ as _79).parentBoneData;
               }
               else if(_loc4_ is _70)
               {
                  _loc11_ = (_loc4_ as _70)._1760;
                  if(_loc11_)
                  {
                     _loc10_ = _loc11_.parentBoneData;
                  }
               }
               if(_loc10_ != null)
               {
                  _loc6_ = _loc5_._1873(_loc10_);
                  if((Boolean(_loc6_)) && _loc9_.indexOf(_loc6_) == -1)
                  {
                     _loc9_.push(_loc6_);
                  }
               }
               _loc2_++;
            }
            if(_loc9_.length > 0)
            {
               if(Shortcut._1677())
               {
                  _13796._3877(_loc9_);
               }
               else
               {
                  _13796._2986(_loc9_);
               }
            }
            else
            {
               _13796._3024();
            }
         }
         _11631(param1);
         _3870 = param1.filter(this._4547);
         if(!_4588 && _13796._2889.length > 0)
         {
            _loc13_ = _13796._2889[0];
            _loc12_ = _705._13820(_loc13_);
            if(_loc12_)
            {
               timeline._4552._4550(_loc12_);
               timeline._4569._4550(_loc12_);
               timeline._4551._4550(_loc12_);
               _loc14_ = _4581.getItemIndex(_loc12_);
               timeline._4561(_loc14_);
            }
         }
         _4588 = false;
      }
      
      override protected function _4571(param1:TimelineEvent) : void
      {
         var _loc2_:_13548 = param1.data as _13548;
         _13818(_loc2_);
      }
      
      override protected function _10349(param1:TimelineEvent) : void
      {
         var _loc4_:_13510 = null;
         var _loc5_:_79 = null;
         var _loc7_:_13548 = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc2_:Vector.<Object> = param1.data as Vector.<Object>;
         var _loc3_:Vector.<_13510> = new Vector.<_13510>();
         var _loc6_:Array = [];
         if(_loc2_.length > 0)
         {
            _loc8_ = 0;
            _loc9_ = int(_loc2_.length);
            while(_loc8_ < _loc9_)
            {
               _loc7_ = _loc2_[_loc8_] as _13548;
               if((Boolean(_loc7_)) && Boolean(_loc7_._1945))
               {
                  _loc4_ = _loc7_._1945;
                  if(_loc3_.indexOf(_loc4_) == -1)
                  {
                     _loc3_.push(_loc4_);
                  }
                  if(_loc4_ is _13504)
                  {
                     _loc5_ = (_loc4_ as _13504)._1823._1882;
                     if((Boolean(_loc5_)) && _loc6_.indexOf(_loc5_) == -1)
                     {
                        _loc6_.push(_loc5_);
                     }
                  }
               }
               _loc8_++;
            }
            _13796._2986(_loc3_);
            _4588 = true;
            _2226._2889 = _loc6_;
         }
      }
      
      override protected function _4547(param1:Object, param2:int, param3:Array) : Boolean
      {
         return param1 is _52 || param1 is _79 || param1 is _39;
      }
      
      override public function _4589() : Boolean
      {
         var _loc2_:Object = null;
         var _loc5_:_79 = null;
         var _loc6_:_52 = null;
         var _loc7_:_13504 = null;
         var _loc8_:_13508 = null;
         var _loc11_:_86 = null;
         var _loc12_:Object = null;
         var _loc13_:_13510 = null;
         var _loc14_:_13498 = null;
         var _loc15_:_13510 = null;
         var _loc16_:_13499 = null;
         var _loc17_:_13510 = null;
         var _loc18_:_13498 = null;
         var _loc19_:_13510 = null;
         var _loc20_:_13494 = null;
         var _loc21_:_13510 = null;
         var _loc22_:_13495 = null;
         var _loc23_:_13510 = null;
         var _loc24_:_13493 = null;
         var _loc1_:Array = [];
         var _loc3_:int = timeline.curFrame;
         var _loc4_:_13502 = _3896._1992;
         var _loc9_:int = 0;
         var _loc10_:int = int(_3870.length);
         while(_loc9_ < _loc10_)
         {
            _loc2_ = _3870[_loc9_];
            if(_loc2_ is _52)
            {
               _loc6_ = _loc2_ as _52;
               _loc5_ = _loc6_._1882;
            }
            else if(_loc2_ is _79)
            {
               _loc5_ = _loc2_ as _79;
               _loc6_ = _loc5_.parentBoneData;
            }
            if(Boolean(_loc5_) && Boolean(_loc6_))
            {
               _loc7_ = _loc4_._1873(_loc6_);
               _loc8_ = _loc4_._1875(_loc5_);
               if(Boolean(_loc7_) && Boolean(_loc8_))
               {
                  if(!_loc7_._5819(_loc3_) && !_loc8_._5819(_loc3_))
                  {
                     _loc11_ = _loc6_.currentLocalTransform.clone();
                     _loc11_._1930(_loc6_._1724);
                     (_loc12_ = {})._1992 = _3028;
                     _loc12_.frameIndex = _loc3_;
                     _loc13_ = _loc7_._13581;
                     (_loc14_ = new _13498()).startPos = _loc3_;
                     _loc14_.value = new Point(_loc11_.x,_loc11_.y);
                     _loc15_ = _loc7_._13586;
                     (_loc16_ = new _13499()).startPos = _loc3_;
                     _loc16_.value = _loc11_.rotation;
                     _loc17_ = _loc7_._13598;
                     (_loc18_ = new _13498()).startPos = _loc3_;
                     _loc18_.value = new Point(_loc11_.scaleX,_loc11_.scaleY);
                     _loc19_ = _loc8_._13599;
                     (_loc20_ = new _13494()).startPos = _loc3_;
                     _loc20_.value = _loc5_._1926.clone();
                     _loc21_ = _loc8_._13572;
                     (_loc22_ = new _13495()).startPos = _loc3_;
                     _loc22_.value = _loc5_._1923;
                     _loc23_ = _loc8_._13592;
                     (_loc24_ = new _13493()).startPos = _loc3_;
                     _loc24_.value = _loc5_._13682;
                     _loc12_._13581 = _loc13_;
                     _loc12_._13595 = _loc15_;
                     _loc12_._13598 = _loc17_;
                     _loc12_._13627 = _loc14_;
                     _loc12_._13710 = _loc16_;
                     _loc12_._13631 = _loc18_;
                     _loc12_._13599 = _loc19_;
                     _loc12_._13632 = _loc20_;
                     _loc12_._13593 = _loc21_;
                     _loc12_._13707 = _loc22_;
                     _loc12_._13592 = _loc23_;
                     _loc12_._13708 = _loc24_;
                     _loc1_.push(_loc12_);
                  }
               }
            }
            _loc9_++;
         }
         if(_loc1_.length > 0)
         {
            _1567(new CommandNotification(CommandNotification.ADD_BASIC_FRAMES,_loc1_));
            return true;
         }
         return false;
      }
      
      private function get _2858() : AnimationPanelController
      {
         return _1407.getInstance(AnimationPanelController) as AnimationPanelController;
      }
      
      override public function _3149(param1:Array, param2:int) : void
      {
      }
      
      public function _4542(param1:_13496) : _13496
      {
         var _loc4_:_52 = null;
         var _loc5_:_79 = null;
         var _loc6_:_13502 = null;
         var _loc7_:_13508 = null;
         var _loc8_:_13496 = null;
         var _loc2_:int = param1.startPos;
         var _loc3_:_13504 = param1.parent.parent as _13504;
         if(_loc3_)
         {
            _loc4_ = _loc3_._1823;
            if(_loc5_ = _loc4_._1882)
            {
               _loc6_ = _loc3_.parent as _13502;
               if(_loc6_)
               {
                  _loc7_ = _loc6_._1875(_loc5_);
                  if(_loc7_)
                  {
                     return _loc7_._13599.getFrameByIndex(_loc2_);
                  }
               }
            }
         }
         return null;
      }
      
      override public function get _4580() : int
      {
         var _loc1_:Object = null;
         var _loc2_:_13510 = null;
         var _loc3_:Boolean = false;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(_3896 != null && _3896._1992 != null && _13796._2889.length > 0)
         {
            if(_3870)
            {
               _loc4_ = 0;
               _loc5_ = int(_3870.length);
               while(_loc4_ < _loc5_)
               {
                  _loc1_ = _3870[_loc4_];
                  if(_loc1_ is _52)
                  {
                     if(_52(_loc1_)._2002 != null)
                     {
                        return 2;
                     }
                  }
                  if(_loc1_ is _79)
                  {
                     if(_2209._3774(_loc1_ as _79))
                     {
                        return 2;
                     }
                  }
                  _loc4_++;
               }
            }
            _loc3_ = true;
            _loc4_ = 0;
            _loc5_ = int(_13796._2889.length);
            if(_loc4_ < _loc5_)
            {
               _loc2_ = _13796._2889[_loc4_];
               if(!_loc2_._5819(timeline.curFrame))
               {
                  return 0;
               }
               return 1;
            }
         }
         return -1;
      }
      
      private function _4573(param1:TimelineVOBase) : Boolean
      {
         return false;
      }
      
      override public function _3132() : void
      {
      }
      
      override public function _3015() : void
      {
         _3896._13785();
         _4581.refresh();
      }
      
      override protected function _4566(param1:TimelineEvent) : void
      {
         var _loc2_:_52 = null;
         var _loc3_:_79 = null;
         var _loc4_:Boolean = false;
         var _loc6_:_50 = null;
         var _loc5_:_13548 = param1.data;
         _loc4_ = Boolean(param1.data.visible);
         if(_loc5_)
         {
            if(_loc5_._1945 is _13502)
            {
               _loc6_ = (_loc5_._1945 as _13502).rootArmatureData;
               _2880._3209(_loc6_,"visible",_loc4_);
            }
            else if(_loc5_._1945 is _13504)
            {
               _loc2_ = (_loc5_._1945 as _13504)._1823;
               _loc3_ = _loc2_._1882;
               _2880._3209(_loc2_,"visible",_loc4_);
               _2880._3209(_loc3_,"visible",_loc4_);
            }
            else if(_loc5_._1945 is _13508)
            {
               _loc3_ = (_loc5_._1945 as _13508)._1824;
               _loc2_ = _loc3_.parentBoneData;
               _2880._3209(_loc3_,"visible",_loc4_);
               _2880._3209(_loc2_,"visible",_loc4_);
            }
         }
      }
      
      override protected function _4579(param1:TimelineEvent) : void
      {
         var _loc2_:_52 = null;
         var _loc3_:_79 = null;
         var _loc4_:Boolean = false;
         var _loc6_:_50 = null;
         var _loc5_:_13548 = param1.data;
         _loc4_ = Boolean(param1.data.locked);
         if(_loc5_)
         {
            if(_loc5_._1945 is _13502)
            {
               _loc6_ = (_loc5_._1945 as _13502).rootArmatureData;
               _2880._3209(_loc6_,"selectable",_loc4_);
            }
            else if(_loc5_._1945 is _13504)
            {
               _loc2_ = (_loc5_._1945 as _13504)._1823;
               _loc3_ = _loc2_._1882;
               _2880._3209(_loc2_,"selectable",_loc4_);
               _2880._3209(_loc3_,"selectable",_loc4_);
            }
            else if(_loc5_._1945 is _13508)
            {
               _loc3_ = (_loc5_._1945 as _13508)._1824;
               _loc2_ = _loc3_.parentBoneData;
               _2880._3209(_loc3_,"selectable",_loc4_);
               _2880._3209(_loc2_,"selectable",_loc4_);
            }
            timeline._4563();
         }
      }
      
      override public function _11628() : void
      {
         var _loc1_:Boolean = false;
         var _loc4_:_460 = null;
         var _loc2_:_13502 = _3896._1992;
         var _loc3_:Dictionary = _loc2_._13667();
         if(_loc3_)
         {
            (_loc4_ = new _460())._3429 = _loc3_;
            _1567(new CommandNotification(CommandNotification.DEL_FRAMES,_loc4_));
         }
      }
      
      override public function get _13778() : Boolean
      {
         return true;
      }
   }
}

