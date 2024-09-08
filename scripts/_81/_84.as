package _81
{
   public class _84
   {
      public function _84()
      {
         super();
      }
      
      public static function _1979(param1:_90, param2:Array) : void
      {
         if(!param1 || param2.indexOf(param1) >= 0)
         {
            throw new ArgumentError();
         }
         param2.push(param1);
      }
      
      public static function _1967(param1:_90, param2:Array, param3:int) : void
      {
         if(!param1 || param2.indexOf(param1) >= 0)
         {
            throw new ArgumentError();
         }
         param2.splice(param3,0,param1);
      }
      
      public static function _1958(param1:_90, param2:Array) : void
      {
         var _loc3_:int = 0;
         if(param1)
         {
            _loc3_ = int(param2.indexOf(param1));
            if(_loc3_ >= 0)
            {
               param2.splice(_loc3_,1);
               return;
            }
         }
         throw new ArgumentError();
      }
      
      public static function _1952(param1:String, param2:Array) : _90
      {
         var _loc3_:_90 = null;
         for each(_loc3_ in param2)
         {
            if(_loc3_.name == param1)
            {
               return _loc3_;
            }
         }
         return null;
      }
      
      public static function _1961(param1:String, param2:Array) : Boolean
      {
         var _loc3_:_90 = null;
         for each(_loc3_ in param2)
         {
            if(_loc3_.name == param1)
            {
               return true;
            }
         }
         return false;
      }
   }
}

