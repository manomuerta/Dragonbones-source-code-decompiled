package _226
{
   import _13492._13493;
   import _13492._13494;
   import _13492._13495;
   import _13492._13496;
   import _13492._13498;
   import _13492._13499;
   import _13503._13502;
   import _13505._13504;
   import _13505._13508;
   import _13505._13510;
   import _13515._13525;
   import _13527._13526;
   import _1404._1407;
   import _18.IAction;
   import _416._11232;
   import _425._429;
   import _470._469;
   import _51._52;
   import _51._70;
   import _51._79;
   import _555._576;
   import _573.TimelinePanelController;
   import _586._597;
   import _708._715;
   import _708._718;
   import _708._719;
   import _81._86;
   import _93._92;
   import flash.geom.Point;
   
   public class _256 extends _92
   {
      public const UNDO:String = "undo";
      
      public const REDO:String = "redo";
      
      public const NORMAL:String = "normal";
      
      private var _15574:String = "normal";
      
      public function _256()
      {
         super();
         _2219 = true;
         _2215 = true;
         _2224 = true;
      }
      
      override public function _1572(param1:*) : void
      {
         var _loc2_:Object = null;
         var _loc3_:Array = null;
         var _loc5_:_86 = null;
         var _loc6_:_52 = null;
         var _loc7_:_92 = null;
         var _loc11_:_79 = null;
         var _loc12_:int = 0;
         super._1572(param1);
         var _loc4_:int = int(this._2953.length);
         var _loc8_:Array = [];
         var _loc9_:int = 0;
         while(_loc9_ < this._2996)
         {
            _loc6_ = this.items[_loc9_];
            _loc3_ = [];
            _loc12_ = 0;
            while(_loc12_ < _loc4_)
            {
               _loc3_.push(this._2953[_loc12_]);
               _loc3_.push((this._2953[_loc12_ + 1] as Array)[_loc9_]);
               _loc12_ += 2;
            }
            _loc7_ = this._2995(_loc6_,this._2974,_loc3_,this._2969,this._2968);
            if(_loc7_)
            {
               _loc8_.push(_loc7_);
            }
            _loc9_++;
         }
         var _loc10_:int = int(this.items.length);
         while(_loc9_ < _loc10_)
         {
            if(this.items[_loc9_] is _70)
            {
               _loc11_ = _70(this.items[_loc9_])._1760;
            }
            else
            {
               _loc11_ = this.items[_loc9_];
            }
            _loc3_ = [];
            _loc12_ = 0;
            while(_loc12_ < _loc4_)
            {
               _loc3_.push(this._2953[_loc12_]);
               _loc3_.push((this._2953[_loc12_ + 1] as Array)[_loc9_]);
               _loc12_ += 2;
            }
            _loc7_ = this._2994();
            _loc2_ = _469._2980(_loc11_,this._2974,_loc3_);
            _loc7_._1572(_loc2_);
            _loc7_._2213();
            _loc8_.push(_loc7_);
            _loc9_++;
         }
         param1._2941 = _loc8_;
      }
      
      override public function undo() : void
      {
         super.undo();
      }
      
      override public function redo() : void
      {
         super.redo();
      }
      
      override public function execute() : void
      {
         var _loc2_:_92 = null;
         super.execute();
         var _loc1_:_13526 = null;
         for each(_loc2_ in this._2941)
         {
            if(_loc2_ is _13526)
            {
               _loc1_ = _loc2_ as _13526;
               _loc1_._14420();
            }
            else if(_loc2_ is _248)
            {
               (_loc2_ as _248)._14420();
            }
            else
            {
               _loc2_.execute();
            }
         }
         _2212._2939();
         if(_loc1_)
         {
            _loc1_._14423();
            _loc1_ = null;
         }
         _576(_1407.getInstance(_576)).refresh();
      }
      
      override public function revert() : void
      {
         var _loc2_:_92 = null;
         var _loc1_:_13526 = null;
         for each(_loc2_ in this._2941)
         {
            if(_loc2_ is _13526)
            {
               _loc1_ = _loc2_ as _13526;
               _loc1_._14421();
            }
            else if(_loc2_ is _248)
            {
               (_loc2_ as _248)._14421();
            }
            else
            {
               _loc2_.revert();
            }
         }
         _2212._2939();
         if(_loc1_)
         {
            _loc1_._14423();
            _loc1_ = null;
         }
         _576(_1407.getInstance(_576)).refresh();
         this._4855.update();
      }
      
      override public function merge(param1:IAction) : Boolean
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:* = false;
         var _loc6_:Boolean = false;
         var _loc2_:_256 = param1 as _256;
         if(_loc2_)
         {
            _loc4_ = int(this._2953.length);
            _loc5_ = this._2941.length == _loc2_._2941.length;
            _loc6_ = true;
            if(_loc5_)
            {
               _loc3_ = 0;
               _loc4_ = int(this._2941.length);
               while(_loc3_ < _loc4_)
               {
                  if(!this._1639 || !_loc2_._1639)
                  {
                     return false;
                  }
                  if(this._2941[_loc3_] is _11232 && _loc2_._2941[_loc3_] is _11232)
                  {
                     _loc6_ = Boolean(this._2941[_loc3_].merge(_loc2_._2941[_loc3_]));
                  }
                  if(this._2941[_loc3_] is _248 && _loc2_._2941[_loc3_] is _248)
                  {
                     _loc6_ = Boolean(this._2941[_loc3_].merge(_loc2_._2941[_loc3_]));
                  }
                  if(this._2941[_loc3_] is _13526 && _loc2_._2941[_loc3_] is _13526)
                  {
                     _loc6_ = Boolean(this._2941[_loc3_].merge(_loc2_._2941[_loc3_]));
                  }
                  if(this._2941[_loc3_] is _264 && _loc2_._2941[_loc3_] is _264)
                  {
                     _loc6_ = Boolean(this._2941[_loc3_].merge(_loc2_._2941[_loc3_]));
                  }
                  if(!_loc6_)
                  {
                     return false;
                  }
                  _loc3_++;
               }
               return true;
            }
         }
         return false;
      }
      
      protected function _2995(param1:_52, param2:_719, param3:Array, param4:int = -1, param5:int = -1) : _92
      {
         var _loc6_:Object = null;
         var _loc7_:_92 = null;
         var _loc8_:_13504 = null;
         var _loc9_:int = 0;
         var _loc10_:Boolean = false;
         var _loc11_:Boolean = false;
         var _loc12_:Boolean = false;
         var _loc13_:Boolean = false;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc16_:int = 0;
         var _loc17_:Boolean = false;
         var _loc18_:_13498 = null;
         var _loc19_:_13499 = null;
         var _loc20_:_13498 = null;
         var _loc21_:String = null;
         var _loc22_:Vector.<_13496> = null;
         _loc6_ = {
            "_1897":param1,
            "_2974":param2,
            "_2953":param3,
            "_2969":param4,
            "_2968":param5
         };
         switch(this._2873)
         {
            case _715.ARMATURE:
               if(param1._1980)
               {
                  _loc7_ = new _14062();
               }
               else
               {
                  _loc7_ = new _248();
               }
               _loc7_._1572(_loc6_);
               _loc7_._2213();
               break;
            case _715.ANIMATE:
               _loc7_ = new _11232();
               if(this._2852 == null || this._2852._13704 == null || this._2852.timeline == null || param1 == null)
               {
                  return null;
               }
               _loc8_ = this._2852._13704._1873(param1);
               _loc9_ = this._2852.timeline.curFrame;
               if(_loc8_)
               {
                  _loc6_._1992 = this._2852._13704;
                  _loc6_.frameIndex = _loc9_;
                  _loc6_.autoKey = this._2852.autoKey;
                  _loc10_ = this._2852.autoKey;
                  _loc17_ = this._2852.adjusting;
                  _loc14_ = 0;
                  _loc15_ = int(param3.length);
                  while(_loc14_ < _loc15_)
                  {
                     switch(param3[_loc14_])
                     {
                        case _718.X:
                        case _718.Y:
                           _loc11_ = true;
                           break;
                        case _718.ROTATION:
                           _loc12_ = true;
                           break;
                        case _718.SCALE:
                        case _718.SCALE_X:
                        case _718.SCALE_Y:
                           _loc13_ = true;
                           break;
                     }
                     _loc14_ += 2;
                  }
                  if(_loc11_)
                  {
                     _loc16_++;
                     _loc6_._13581 = _loc8_._13581;
                     _loc6_._13627 = _loc8_._13581.getFrameByIndex(_loc9_);
                     if(_loc6_._13627 == null && _loc10_)
                     {
                        _loc6_._3005 = true;
                        (_loc18_ = new _13498()).startPos = _loc9_;
                        _loc18_.tweenType = 1;
                        _loc6_._13627 = _loc18_;
                     }
                  }
                  if(_loc12_)
                  {
                     _loc16_++;
                     _loc6_._13595 = _loc8_._13586;
                     _loc6_._13710 = _loc8_._13586.getFrameByIndex(_loc9_);
                     if(_loc6_._13710 == null && _loc10_)
                     {
                        _loc6_._3005 = true;
                        (_loc19_ = new _13499()).startPos = _loc9_;
                        _loc19_.tweenType = 1;
                        _loc6_._13710 = _loc19_;
                     }
                  }
                  if(_loc13_)
                  {
                     _loc16_++;
                     _loc6_._13598 = _loc8_._13598;
                     _loc6_._13631 = _loc8_._13598.getFrameByIndex(_loc9_);
                     if(_loc6_._13631 == null && _loc10_)
                     {
                        _loc6_._3005 = true;
                        (_loc20_ = new _13498()).startPos = _loc9_;
                        _loc20_.tweenType = 1;
                        _loc6_._13631 = _loc20_;
                     }
                  }
                  if(_loc11_ || _loc12_ || _loc13_)
                  {
                     if(_loc16_ == 1 && _loc17_)
                     {
                        if(_loc11_)
                        {
                           _loc21_ = _13510.FLAG_TRANSLATE;
                        }
                        if(_loc12_)
                        {
                           _loc21_ = _13510.FLAG_ROTATE;
                        }
                        if(_loc13_)
                        {
                           _loc21_ = _13510.FLAG_SCALE;
                        }
                        _loc22_ = this._2852._13702(param1,_loc21_);
                        if((Boolean(_loc22_)) && _loc22_.length > 0)
                        {
                           _loc7_ = this._13706(_loc6_,_loc22_,_loc21_);
                        }
                        else
                        {
                           _loc7_ = new _13526();
                           _loc7_._1572(_loc6_);
                        }
                     }
                     else
                     {
                        _loc7_ = new _13526();
                        _loc7_._1572(_loc6_);
                     }
                  }
               }
               break;
            case _715.GENERAL:
               _loc7_ = this._13705(_loc6_,param1,param2,param3,param4,param5);
         }
         return _loc7_;
      }
      
      private function _13706(param1:Object, param2:Vector.<_13496>, param3:String) : _92
      {
         var _loc11_:_13510 = null;
         var _loc15_:_13496 = null;
         var _loc16_:_13496 = null;
         var _loc4_:_52 = param1._1897 as _52;
         var _loc5_:_86 = this._1947(this._2953,_loc4_);
         var _loc6_:_86 = _loc4_.currentLocalTransform;
         var _loc7_:_86 = _loc5_.clone();
         _loc7_._1930(_loc6_);
         param1._2977 = _loc5_;
         param1._13711 = _loc6_;
         param1._11297 = _loc7_;
         param1.frames = param2;
         param1.flag = param3;
         param1._1836 = _loc4_;
         var _loc8_:_13502 = this._2852._13704;
         var _loc9_:int = this._2852.timeline.curFrame;
         var _loc10_:_13504 = _loc8_._1873(_loc4_);
         switch(param3)
         {
            case _13510.FLAG_TRANSLATE:
               _loc11_ = _loc10_._13581;
               break;
            case _13510.FLAG_ROTATE:
               _loc11_ = _loc10_._13586;
               break;
            case _13510.FLAG_SCALE:
               _loc11_ = _loc10_._13598;
         }
         var _loc12_:_13496 = _loc11_._11281(_loc9_);
         var _loc13_:_13496 = _loc11_.getFrameByIndex(_loc9_);
         if(_loc13_ == null)
         {
            _loc15_ = _loc11_._1934(_loc9_);
         }
         if(param1.autoKey)
         {
            if(_loc13_ == null && (param2.indexOf(_loc12_) == -1 || _loc15_))
            {
               param1._13703 = true;
               switch(param3)
               {
                  case _13510.FLAG_TRANSLATE:
                     (_loc16_ = new _13498()).startPos = _loc9_;
                     _loc16_.tweenType = 1;
                     _loc16_.value = new Point(_loc5_.x,_loc5_.y);
                     break;
                  case _13510.FLAG_ROTATE:
                     (_loc16_ = new _13499()).startPos = _loc9_;
                     _loc16_.tweenType = 1;
                     _loc16_.value = _loc5_.rotation;
                     break;
                  case _13510.FLAG_SCALE:
                     (_loc16_ = new _13498()).startPos = _loc9_;
                     _loc16_.tweenType = 1;
                     _loc16_.value = new Point(_loc5_.scaleX,_loc5_.scaleY);
               }
               param1._13712 = _loc16_;
               param1._13709 = _loc11_;
            }
            else if(_loc13_)
            {
               param2.push(_loc13_);
            }
         }
         else
         {
            param1._13713 = true;
         }
         var _loc14_:_13525 = new _13525();
         _loc14_._1572(param1);
         return _loc14_;
      }
      
      private function _13705(param1:Object, param2:_52, param3:_719, param4:Array, param5:int = -1, param6:int = -1) : _265
      {
         var _loc7_:_265 = null;
         var _loc15_:int = 0;
         var _loc16_:int = 0;
         var _loc17_:_13498 = null;
         var _loc18_:_13499 = null;
         var _loc19_:_13498 = null;
         var _loc20_:_13494 = null;
         var _loc21_:_13495 = null;
         var _loc22_:_13493 = null;
         if(this._2852 == null || this._2852._13704 == null || this._2852.timeline == null || param2 == null)
         {
            return null;
         }
         var _loc8_:_79 = param2._1882;
         if(_loc8_ == null)
         {
            return null;
         }
         var _loc9_:_13508 = this._2852._13704._1875(_loc8_);
         var _loc10_:_13504 = this._2852._13704._1873(param2);
         if(_loc10_ == null || _loc9_ == null)
         {
            return null;
         }
         var _loc11_:int = this._2852.timeline.curFrame;
         param1._1992 = this._2852._13704;
         param1.frameIndex = _loc11_;
         param1.autoKey = this._2852.autoKey;
         var _loc12_:Boolean = true;
         var _loc13_:Boolean = true;
         var _loc14_:Boolean = true;
         if(_loc12_)
         {
            param1._13581 = _loc10_._13581;
            param1._13627 = _loc10_._13581.getFrameByIndex(_loc11_);
            if(param1._13627 == null)
            {
               param1._3005 = true;
               (_loc17_ = new _13498()).startPos = _loc11_;
               param1._13627 = _loc17_;
            }
         }
         if(_loc13_)
         {
            param1._13595 = _loc10_._13586;
            param1._13710 = _loc10_._13586.getFrameByIndex(_loc11_);
            if(param1._13710 == null)
            {
               param1._3005 = true;
               (_loc18_ = new _13499()).startPos = _loc11_;
               param1._13710 = _loc18_;
            }
         }
         if(_loc14_)
         {
            param1._13598 = _loc10_._13598;
            param1._13631 = _loc10_._13598.getFrameByIndex(_loc11_);
            if(param1._13631 == null)
            {
               param1._3005 = true;
               (_loc19_ = new _13498()).startPos = _loc11_;
               param1._13631 = _loc19_;
            }
         }
         if(param1._3005)
         {
            param1._13599 = _loc9_._13599;
            param1._13632 = _loc9_._13599.getFrameByIndex(_loc11_);
            if(param1._13632 == null)
            {
               (_loc20_ = new _13494()).startPos = _loc11_;
               param1._13632 = _loc20_;
            }
            param1._13593 = _loc9_._13572;
            param1._13707 = _loc9_._13572.getFrameByIndex(_loc11_);
            if(param1._13707 == null)
            {
               (_loc21_ = new _13495()).value = _loc8_._1923;
               _loc21_.startPos = _loc11_;
               param1._13707 = _loc21_;
            }
            param1._13592 = _loc9_._13592;
            param1._13708 = _loc9_._13592.getFrameByIndex(_loc11_);
            if(param1._13708 == null)
            {
               (_loc22_ = new _13493()).value = _loc8_._13682;
               _loc22_.startPos = _loc11_;
               param1._13708 = _loc22_;
            }
         }
         _loc7_ = new _429();
         _loc7_._1572(param1);
         return _loc7_;
      }
      
      protected function _1947(param1:Array, param2:_52) : _86
      {
         var _loc5_:_718 = null;
         var _loc6_:* = undefined;
         var _loc3_:_86 = param2.currentLocalTransform.clone();
         if(!_loc3_)
         {
            _loc3_ = new _86();
         }
         var _loc4_:int = int(param1.length);
         var _loc7_:int = 0;
         while(_loc7_ < _loc4_)
         {
            _loc5_ = param1[_loc7_];
            _loc6_ = param1[_loc7_ + 1];
            _loc3_[_loc5_.toString()] = _loc6_;
            _loc7_ += 2;
         }
         return _loc3_;
      }
      
      protected function _2994() : _265
      {
         return new _264();
      }
      
      public function get items() : Array
      {
         return _2223.items;
      }
      
      public function get _1836() : _52
      {
         return _2223._1897;
      }
      
      public function get _2996() : int
      {
         return _2223._2996;
      }
      
      public function get _2873() : _715
      {
         return _2223._2873;
      }
      
      public function get _2974() : _719
      {
         return _2223._2974;
      }
      
      public function get _2953() : Array
      {
         return _2223._2953;
      }
      
      public function get _2969() : int
      {
         return _2223._2969;
      }
      
      public function get _2968() : int
      {
         return _2223._2968;
      }
      
      protected function get _2941() : Array
      {
         return _2223._2941;
      }
      
      private function get _4855() : _597
      {
         return _1407.getInstance(_597) as _597;
      }
      
      protected function get _2852() : TimelinePanelController
      {
         return _1407.getInstance(TimelinePanelController) as TimelinePanelController;
      }
   }
}

