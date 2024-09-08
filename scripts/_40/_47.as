package _40
{
   import _51._69;
   import _51._79;
   import _81._83;
   
   public class _47 extends _45
   {
      public var zOrder:int;
      
      public var gotoAndPlay:String;
      
      public var _1824:_79;
      
      public var _1732:_69;
      
      private var _1921:_83;
      
      public function _47(param1:_79, param2:Boolean, param3:int = 0, param4:Object = null)
      {
         this._1921 = _83._1920.clone();
         super(param2,param3,param4);
         this._1824 = param1;
      }
      
      public static function _1572(param1:_79, param2:Boolean, param3:_69 = null, param4:_83 = null) : _47
      {
         var _loc5_:_47;
         (_loc5_ = new _47(param1,param2))._1732 = param3;
         _loc5_.colorTransform = param4;
         return _loc5_;
      }
      
      public function set colorTransform(param1:_83) : void
      {
         this._1921 = param1;
      }
      
      public function get colorTransform() : _83
      {
         return !!this._1921 ? this._1921 : _83._1920;
      }
      
      public function get _1919() : Boolean
      {
         return this._1921 != null;
      }
      
      override public function copyFrom(param1:_45) : void
      {
         super.copyFrom(param1);
         var _loc2_:_47 = param1 as _47;
         this.zOrder = _loc2_.zOrder;
         this.gotoAndPlay = _loc2_.gotoAndPlay;
         this._1824 = _loc2_._1824;
         this._1732 = _loc2_._1732;
         this._1921.copyFrom(_loc2_.colorTransform);
      }
      
      public function _1918(param1:_45) : void
      {
         var _loc2_:_69 = this._1732;
         this.copyFrom(param1);
         this._1732 = _loc2_;
      }
      
      override public function clone() : _45
      {
         var _loc1_:_47 = new _47(this._1824,tweenEnabled);
         _loc1_.copyFrom(this);
         return _loc1_;
      }
   }
}

