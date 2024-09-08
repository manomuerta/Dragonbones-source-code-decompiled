package _1148
{
   import _1155.Linear;
   import _1155._1158;
   import egret.core.ns_egret;
   
   use namespace ns_egret;
   
   public class _1149
   {
      private static var _8479:_1158 = new Linear();
      
      public var value:Object;
      
      public var time:Number;
      
      ns_egret var _8821:Number;
      
      public var _3772:_1158;
      
      public var _8782:Object;
      
      public function _1149(param1:Number = NaN, param2:Object = null, param3:Object = null)
      {
         this._3772 = _8479;
         super();
         this.value = param2;
         this.time = param1;
         this._8782 = param3;
      }
      
      public function clone() : _1149
      {
         var _loc1_:_1149 = new _1149(this.time,this.value,this._8782);
         _loc1_._3772 = this._3772;
         _loc1_.ns_egret::_8821 = this.ns_egret::_8821;
         return _loc1_;
      }
   }
}

