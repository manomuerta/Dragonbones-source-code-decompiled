package _54
{
   import _11489.Curve;
   import _40._39;
   import _40._45;
   import _51._50;
   import _51._52;
   import _51._79;
   import _555._557;
   import _73._72;
   import _978.Timeline;
   
   public class _67
   {
      public static const EASING_NONE:int = 0;
      
      public static const EASING_LINEAR:int = 1;
      
      public static const EASING_IN:int = 2;
      
      public static const EASING_OUT:int = 3;
      
      public static const EASING_INOUT:int = 4;
      
      public var title:String;
      
      public var name:String;
      
      public var type:_72;
      
      public var easing:int;
      
      public var value:Object;
      
      public var during:Number;
      
      public var delay:Number;
      
      public var appear:Boolean;
      
      public var _10283:Boolean;
      
      public var _1836:_52;
      
      public var _1837:_79;
      
      public var parent:_57;
      
      public var loop:Boolean;
      
      public var _2081:Boolean = false;
      
      public var _2080:String = "";
      
      public var _2079:Vector.<_72>;
      
      public var visible:Boolean = true;
      
      protected var _10274:Boolean;
      
      protected var _10275:Boolean;
      
      protected var _10276:Boolean;
      
      protected var _10273:Boolean;
      
      public function _67(param1:_57, param2:_72, param3:_52, param4:_79, param5:int, param6:Object, param7:Number, param8:Number, param9:Boolean, param10:Boolean = false, param11:Boolean = false)
      {
         this._2079 = new Vector.<_72>();
         super();
         this.name = param3.name;
         this.type = param2;
         this.easing = param5;
         this.value = param6;
         this.during = param7;
         this.delay = param8;
         this.appear = param10;
         this._10283 = param11;
         this._1836 = param3;
         this._1837 = param4;
         this.parent = param1;
         this.loop = param9;
      }
      
      public function _2059() : Curve
      {
         switch(this.easing)
         {
            case EASING_NONE:
               return null;
            case EASING_LINEAR:
               return null;
            case EASING_IN:
               return _557.CurveEaseIn.clone();
            case EASING_OUT:
               return _557.CurveEaseOut.clone();
            case EASING_INOUT:
               return _557.CurveEaseInOut.clone();
            default:
               return null;
         }
      }
      
      public function get children() : Array
      {
         return [];
      }
      
      public function _2065() : Vector.<_45>
      {
         return null;
      }
      
      public function _10450(param1:_52, param2:_79) : Vector.<_45>
      {
         return null;
      }
      
      public function _10451(param1:_52, param2:_79) : Vector.<_45>
      {
         var _loc6_:_62 = null;
         var _loc7_:_66 = null;
         var _loc3_:uint = this._1992.parent.frameRate;
         if(_loc3_ <= 0)
         {
            _loc3_ = Timeline.DEFAULT_FPS;
         }
         var _loc4_:Vector.<_45> = new Vector.<_45>();
         var _loc5_:int = this.during * _loc3_;
         (_loc6_ = new _62(param1,false)).tweenCurve = null;
         _loc6_.startPos = 0;
         _loc6_.duration = this.during * _loc3_;
         (_loc7_ = new _66(param2,false)).tweenCurve = null;
         _loc7_.startPos = 0;
         _loc7_.duration = this.during * _loc3_;
         _loc7_._1732 = param2._1923;
         _loc7_.gotoAndPlay = this._10454;
         var _loc8_:_62;
         (_loc8_ = new _62(param1,false)).startPos = _loc5_;
         _loc8_.duration = 0;
         var _loc9_:_66;
         (_loc9_ = new _66(param2,false))._1732 = param2._1923;
         _loc9_.startPos = _loc5_;
         _loc9_.gotoAndPlay = this._10454;
         _loc9_.duration = 0;
         _loc4_.push(_loc6_,_loc8_,_loc7_,_loc9_);
         return _loc4_;
      }
      
      public function _10457(param1:_50) : _39
      {
         return null;
      }
      
      public function get _1886() : _50
      {
         return this._1992.parent;
      }
      
      public function get _1992() : _53
      {
         return this.parent.parent.parent;
      }
      
      public function get _2070() : _56
      {
         return this.parent.parent;
      }
      
      public function get _2069() : _57
      {
         return this.parent;
      }
      
      public function get index() : int
      {
         return this.parent.tweens.indexOf(this);
      }
      
      public function get _10279() : Boolean
      {
         return this._10274;
      }
      
      public function get _10280() : Boolean
      {
         return this._10275;
      }
      
      public function get _10281() : Boolean
      {
         return this._10276;
      }
      
      public function get flag() : String
      {
         return this._2070.index + "-" + this._2069.index + "-" + this.index;
      }
      
      public function get _10282() : Boolean
      {
         return this._10273;
      }
      
      public function get _10454() : String
      {
         return this.name;
      }
   }
}

