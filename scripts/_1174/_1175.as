package _1174
{
   public class _1175 implements _1173
   {
      private static var _8895:_1175;
      
      public function _1175()
      {
         super();
      }
      
      public static function getInstance() : _1175
      {
         if(!_8895)
         {
            _8895 = new _1175();
         }
         return _8895;
      }
      
      public function interpolate(param1:Number, param2:Object, param3:Object) : Object
      {
         if(param1 == 0)
         {
            return param2;
         }
         if(param1 == 1)
         {
            return param3;
         }
         if(param2 is Number && isNaN(Number(param2)) || param3 is Number && isNaN(Number(param3)))
         {
            throw new Error("cannotCalculateValue");
         }
         return Number(param2) + param1 * (Number(param3) - Number(param2));
      }
      
      public function increment(param1:Object, param2:Object) : Object
      {
         return Number(param1) + Number(param2);
      }
      
      public function decrement(param1:Object, param2:Object) : Object
      {
         return Number(param1) - Number(param2);
      }
   }
}

