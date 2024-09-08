package _11910
{
   import _11845._11949;
   
   public class _11939 extends _11944
   {
      public static const API:Number = 2;
      
      public function _11939()
      {
         super("shortRotation");
         _12295.pop();
      }
      
      override public function _12284(param1:Object, param2:*, param3:_11949) : Boolean
      {
         var _loc5_:Number = NaN;
         var _loc6_:String = null;
         if(typeof param2 == "number")
         {
            return false;
         }
         var _loc4_:Boolean = Boolean(param2.useRadians == true);
         for(_loc6_ in param2)
         {
            if(_loc6_ != "useRadians")
            {
               _loc5_ = param1[_loc6_] is Function ? Number(param1[Boolean(_loc6_.indexOf("set")) || !("get" + _loc6_.substr(3) in param1) ? _loc6_ : "get" + _loc6_.substr(3)]()) : Number(param1[_loc6_]);
               this._12350(param1,_loc6_,_loc5_,typeof param2[_loc6_] == "number" ? Number(param2[_loc6_]) : _loc5_ + Number(param2[_loc6_].split("=").join("")),_loc4_);
            }
         }
         return true;
      }
      
      public function _12350(param1:Object, param2:String, param3:Number, param4:Number, param5:Boolean = false) : void
      {
         var _loc6_:Number = param5 ? Math.PI * 2 : 360;
         var _loc7_:Number = (param4 - param3) % _loc6_;
         if(_loc7_ != _loc7_ % (_loc6_ / 2))
         {
            _loc7_ = _loc7_ < 0 ? _loc7_ + _loc6_ : _loc7_ - _loc6_;
         }
         _12285(param1,param2,param3,param3 + _loc7_,param2);
         _12295[_12295.length] = param2;
      }
   }
}

