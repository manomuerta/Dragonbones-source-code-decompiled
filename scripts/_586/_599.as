package _586
{
   import _1404._1407;
   import _470._469;
   import _472._607;
   import _51._52;
   import _51._79;
   import _579._580;
   import _708._715;
   import _708._718;
   import _708._719;
   import _783.CommandNotification;
   import _783.StageNotification;
   import _81._85;
   import _81._86;
   import _81._87;
   import _81._91;
   import _93._94;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.utils.Dictionary;
   import flash.utils.getTimer;
   
   public class _599 extends _94
   {
      public static const DEGREE_5:Number = Math.PI / 180 * 5;
      
      public static const TRANSFORM_FREE:int = 0;
      
      public static const TRANSFORM_TRANSLATE:int = 1;
      
      public static const TRANSFORM_ROTATE:int = 2;
      
      public static const TRANSFORM_SCALE:int = 3;
      
      public static var _14425:Boolean = true;
      
      protected var _4971:Dictionary;
      
      protected var _5113:Point;
      
      protected var _2549:Point;
      
      protected var _2938:Array = null;
      
      protected var _2200:int;
      
      protected var _5124:int = 0;
      
      protected var _10760:int = 0;
      
      protected var _13876:Boolean;
      
      private var _14641:Number = 0;
      
      public function _599()
      {
         this._5113 = new Point();
         super();
      }
      
      override protected function _1576() : void
      {
         super._1576();
         _1565(StageNotification.CHANGE_TRANSFORM_MODEL,this._10753);
         _1565(StageNotification.CHANGE_LOCK_WIDTH_HEIGHT,this._13873);
      }
      
      private function _10753(param1:StageNotification) : void
      {
         this._10761 = int(param1.data);
      }
      
      private function _13873(param1:StageNotification) : void
      {
         this._13877 = Boolean(param1.data);
      }
      
      protected function _5111(param1:Array) : void
      {
         var _loc2_:_91 = null;
         this._5124 = 1;
         this._4971 = new Dictionary();
         for each(_loc2_ in param1)
         {
            if(_loc2_ is _52 && _52(_loc2_)._1980 && this._2873 == _715.ARMATURE)
            {
               this._4971[_loc2_] = (_loc2_ as _52)._14283.clone();
            }
            else
            {
               this._4971[_loc2_] = _loc2_.globalTransform.clone();
            }
         }
         this._4355(param1);
      }
      
      protected function _5123(param1:Array) : void
      {
         var _loc3_:_91 = null;
         this._5124 = 2;
         this._4971 = new Dictionary();
         var _loc2_:String = this._2969 ? "currentLocalTransform" : "globalTransform";
         for each(_loc3_ in param1)
         {
            this._4971[_loc3_] = _loc3_[_loc2_].clone();
         }
         this._4355(param1);
      }
      
      protected function _10783(param1:Array) : void
      {
         var _loc3_:_91 = null;
         this._5124 = 7;
         this._4971 = new Dictionary();
         var _loc2_:String = this._2969 ? "currentLocalTransform" : "globalTransform";
         for each(_loc3_ in param1)
         {
            this._4971[_loc3_] = _loc3_[_loc2_].clone();
         }
         this._4355(param1);
      }
      
      protected function _5117(param1:Array) : void
      {
         var _loc3_:_91 = null;
         this._5124 = 3;
         this._4971 = new Dictionary();
         var _loc2_:String = this._2969 ? "currentLocalTransform" : "globalTransform";
         for each(_loc3_ in param1)
         {
            this._4971[_loc3_] = _loc3_[_loc2_].clone();
         }
         this._4355(param1);
      }
      
      protected function _5264(param1:Array) : void
      {
         var _loc2_:_91 = null;
         this._5124 = 4;
         this._4971 = new Dictionary();
         for each(_loc2_ in param1)
         {
            this._4971[_loc2_] = _loc2_.currentLocalTransform.clone();
         }
         this._4355(param1);
      }
      
      protected function _5282(param1:_52) : void
      {
         this._5124 = 5;
         this._4971 = new Dictionary();
         this._4971[param1] = param1.globalTransform.clone();
         this._4355([param1]);
      }
      
      protected function _5281(param1:Array) : void
      {
         var _loc2_:_91 = null;
         this._5124 = 6;
         this._4971 = new Dictionary();
         for each(_loc2_ in param1)
         {
            this._4971[_loc2_] = (_loc2_ as _52).length;
         }
         this._4355(param1);
      }
      
      protected function _4355(param1:Array) : void
      {
         this._2938 = param1;
         stage.addEventListener(MouseEvent.MOUSE_MOVE,this._5277);
         stage.addEventListener(MouseEvent.MOUSE_UP,this._5103);
         _607.instance._4355();
      }
      
      protected function _5103(param1:MouseEvent) : void
      {
         _14425 = true;
         this._4157(param1);
         this._5124 = 0;
         stage.removeEventListener(MouseEvent.MOUSE_UP,this._5103);
         stage.removeEventListener(MouseEvent.MOUSE_MOVE,this._5277);
         this._2938 = null;
      }
      
      protected function _5277(param1:MouseEvent) : void
      {
         var _loc2_:Number = getTimer();
         if(_loc2_ - this._14641 < 20)
         {
            return;
         }
         this._14641 = _loc2_;
         this._4157(param1);
         _14425 = false;
      }
      
      protected function _4157(param1:MouseEvent) : void
      {
         switch(this._5124)
         {
            case 1:
               this._5274(param1);
               break;
            case 2:
               this._5280(param1);
               break;
            case 3:
               this._5279(param1);
               break;
            case 4:
               this._5256(param1);
               break;
            case 5:
               this._5278(param1);
               break;
            case 6:
               this._5275(param1);
               break;
            case 7:
               this._10782(param1);
         }
      }
      
      protected function _5274(param1:MouseEvent) : void
      {
         var _loc2_:Number = (param1.stageX - this._5113.x) / this._2580;
         var _loc3_:Number = (param1.stageY - this._5113.y) / this._2580;
         this._5107(this._2938,_719.GLOBAL,[_718.X,_loc2_,this.add,_718.Y,_loc3_,this.add]);
      }
      
      protected function _5279(param1:MouseEvent) : void
      {
         var _loc5_:Number = NaN;
         var _loc2_:Point = new Point(param1.stageX,param1.stageY);
         var _loc3_:Number = _85._2187(this._2549,this._5113,this._2549,_loc2_);
         var _loc4_:_719 = this._2969 ? _719.LOCAL : _719.GLOBAL;
         if(param1.shiftKey)
         {
            if(Math.abs(_loc3_) > DEGREE_5)
            {
               _loc5_ = int(_loc3_ / DEGREE_5) * DEGREE_5;
               this._5107(this._2938,_loc4_,[_718.ROTATION,_loc5_,this.add]);
            }
         }
         else
         {
            this._5107(this._2938,_loc4_,[_718.ROTATION,_loc3_,this.add]);
         }
      }
      
      protected function _10782(param1:MouseEvent) : void
      {
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc2_:Number = 0.01;
         var _loc3_:Point = new Point(param1.stageX,param1.stageY);
         var _loc4_:Number = 1;
         var _loc5_:Number = _loc3_.x - this._5113.x;
         var _loc6_:Number = _loc3_.y - this._5113.y;
         var _loc7_:Number = _85._2185(this._5113,_loc3_);
         if(_loc7_ == 0)
         {
            _loc4_ = 1;
         }
         else
         {
            _loc9_ = Math.abs(_loc6_) + Math.abs(_loc5_);
            _loc10_ = _loc5_ / _loc9_;
            _loc11_ = _loc6_ / _loc9_;
            _loc4_ = 1 + (_loc10_ + _loc11_) * _loc7_ * _loc2_ / this._2580;
         }
         if(_loc4_ == 0)
         {
            _loc4_ = 0.01;
         }
         var _loc8_:_719 = this._2969 ? _719.LOCAL : _719.GLOBAL;
         this._5107(this._2938,_loc8_,[_718.SCALE_X,_loc4_,this.mul,_718.SCALE_Y,_loc4_,this.mul]);
      }
      
      protected function _5280(param1:MouseEvent) : void
      {
         var _loc2_:Point = new Point(param1.stageX,param1.stageY);
         if(_loc2_.x > this._2549.x)
         {
            if(_loc2_.y > this._2549.y)
            {
               _loc2_.x = this._2549.x;
               _loc2_.y = this._2549.y;
            }
         }
         var _loc3_:Number = _85._2185(this._5113,this._2549);
         var _loc4_:Number = _85._2185(_loc2_,this._2549);
         var _loc5_:Number;
         if((_loc5_ = _loc4_ / _loc3_) < 0.01)
         {
            _loc5_ = 0.01;
         }
         var _loc6_:_719 = this._2969 ? _719.LOCAL : _719.GLOBAL;
         this._5107(this._2938,_loc6_,[_718.SCALE_X,_loc5_,this.mul,_718.SCALE_Y,_loc5_,this.mul]);
      }
      
      protected function _5256(param1:MouseEvent) : void
      {
      }
      
      protected function _5278(param1:MouseEvent) : void
      {
      }
      
      protected function _5275(param1:MouseEvent) : void
      {
      }
      
      public function _4969(param1:Dictionary, param2:int, param3:Array, param4:_719, param5:Array, param6:int = -1, param7:int = -1) : void
      {
         this._4971 = param1;
         this._2200 = param2;
         this._5107(param3,param4,param5,param6,param7);
      }
      
      protected function _5107(param1:Array, param2:_719, param3:Array, param4:int = -1, param5:int = -1) : void
      {
         var _loc7_:_86 = null;
         var _loc8_:_718 = null;
         var _loc9_:Object = null;
         var _loc10_:Function = null;
         var _loc11_:int = 0;
         var _loc13_:_91 = null;
         var _loc14_:Array = null;
         var _loc15_:Array = null;
         var _loc16_:int = 0;
         var _loc17_:Number = NaN;
         var _loc18_:_91 = null;
         param1 = this._5276(param1);
         var _loc6_:int = int(param1.length);
         var _loc12_:int = int(param3.length);
         if(_loc6_ == 1 && this._4763 == CommandNotification.MODIFY_PIVOT)
         {
            _loc13_ = param1[0];
            _loc7_ = this._4971[_loc13_];
            _loc11_ = 0;
            while(_loc11_ < param3.length)
            {
               _loc10_ = param3[_loc11_ + 2];
               _loc8_ = param3[_loc11_];
               param3[_loc11_ + 1] = _loc10_(this._4971[_loc13_][_loc8_.toString()],param3[_loc11_ + 1]);
               param3.splice(_loc11_ + 2,1);
               _loc11_ = --_loc11_ + 3;
            }
            _loc9_ = _469._2980(_loc13_,param2,param3,param4,param5);
            this._1567(new CommandNotification(this._4763,_loc9_));
            return;
         }
         if(_loc6_ > 0)
         {
            _loc14_ = [];
            _loc15_ = [];
            _loc11_ = 0;
            while(_loc11_ < param3.length)
            {
               _loc17_ = Number(param3[_loc11_ + 1]);
               _loc10_ = param3[_loc11_ + 2];
               _loc8_ = param3[_loc11_];
               param3[_loc11_ + 1] = [];
               for each(_loc18_ in param1)
               {
                  param3[_loc11_ + 1].push(_loc10_(this._4971[_loc18_][_loc8_.toString()],_loc17_));
               }
               param3.splice(_loc11_ + 2,1);
               _loc11_ = --_loc11_ + 3;
            }
            _loc16_ = 0;
            _loc11_ = 0;
            _loc12_ = int(param1.length);
            while(_loc11_ < _loc12_)
            {
               if(param1[_loc11_] is _52)
               {
                  _loc16_++;
               }
               _loc11_++;
            }
            _loc9_ = _469._3476(param1,_loc16_,this._2873,param2,param3,param4,param5);
            this._1567(new CommandNotification(CommandNotification.MODIFY_ITEMS_TRANSFORM,_loc9_));
         }
      }
      
      protected function _5276(param1:Array) : Array
      {
         var _loc2_:_79 = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(this._2873 == _715.GENERAL)
         {
            _loc3_ = 0;
            _loc4_ = int(param1.length);
            while(_loc3_ < _loc4_)
            {
               if(param1[_loc3_] is _52)
               {
                  _loc2_ = (param1[_loc3_] as _52)._1882;
               }
               else if(param1[_loc3_] is _79)
               {
                  _loc2_ = param1[_loc3_] as _79;
               }
               if(_loc2_ == null || _loc2_._2049 == null)
               {
                  param1.splice(_loc3_,1);
                  _loc4_--;
                  _loc3_--;
               }
               _loc3_++;
            }
         }
         return param1;
      }
      
      protected function _2199(param1:Array, param2:int = 1, param3:int = 1, param4:Boolean = false) : Array
      {
         this._2200 = _87._2199(param1,{
            "filterBone":param2,
            "filterSlot":param3,
            "convertSlotToBone":param4
         });
         return param1;
      }
      
      protected function add(param1:Number, param2:Number) : Number
      {
         return param1 + param2;
      }
      
      protected function mul(param1:Number, param2:Number) : Number
      {
         return param1 * param2;
      }
      
      public function get _4763() : String
      {
         return "";
      }
      
      protected function get _2873() : _715
      {
         return _2220._2873;
      }
      
      protected function get _2969() : Boolean
      {
         return _2214._1844._2969;
      }
      
      protected function get _2968() : Boolean
      {
         if(Boolean(_2214) && Boolean(_2214._1844))
         {
            return _2214._1844._2968;
         }
         return true;
      }
      
      protected function get _2580() : Number
      {
         return (_1407.getInstance(_580) as _580)._2212._2580;
      }
      
      public function set _10761(param1:int) : void
      {
         this._10760 = param1;
      }
      
      public function get _10761() : int
      {
         return this._10760;
      }
      
      public function get _13877() : Boolean
      {
         return this._13876;
      }
      
      public function set _13877(param1:Boolean) : void
      {
         this._13876 = param1;
      }
   }
}

