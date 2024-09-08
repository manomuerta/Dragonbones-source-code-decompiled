package _40
{
   public class _10598 extends _45
   {
      public var zOrder:Array;
      
      public function _10598(param1:int = 0, param2:Object = null)
      {
         this.zOrder = [];
         super(false,param1,param2);
      }
      
      public static function _1572(param1:Array) : _10598
      {
         var _loc2_:_10598 = new _10598();
         _loc2_.zOrder = param1;
         return _loc2_;
      }
      
      override public function copyFrom(param1:_45) : void
      {
         super.copyFrom(param1);
         var _loc2_:_10598 = param1 as _10598;
         this.zOrder = _loc2_.zOrder.concat();
      }
      
      override public function clone() : _45
      {
         var _loc1_:_10598 = new _10598();
         _loc1_.copyFrom(this);
         return _loc1_;
      }
   }
}

