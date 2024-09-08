package _40
{
   import _51._70;
   
   public class _42 extends _45
   {
      public var _1826:_70;
      
      private var _1906:Vector.<Number>;
      
      public function _42(param1:_70, param2:Boolean, param3:int = 0, param4:Object = null)
      {
         this._1906 = new Vector.<Number>();
         super(param2,param3,param4);
         this._1826 = param1;
      }
      
      public static function _1572(param1:_70, param2:Boolean, param3:Vector.<Number> = null) : _42
      {
         var _loc4_:_42;
         (_loc4_ = new _42(param1,param2))._1906 = param3;
         return _loc4_;
      }
      
      public function get ffd() : Vector.<Number>
      {
         return this._1906;
      }
      
      public function set ffd(param1:Vector.<Number>) : void
      {
         this._1906 = param1;
      }
      
      override public function copyFrom(param1:_45) : void
      {
         super.copyFrom(param1);
         var _loc2_:_42 = param1 as _42;
         this._1826 = _loc2_._1826;
         this._1906 = _loc2_.ffd.concat();
      }
      
      override public function clone() : _45
      {
         var _loc1_:_42 = new _42(this._1826,tweenEnabled);
         _loc1_.copyFrom(this);
         return _loc1_;
      }
   }
}

