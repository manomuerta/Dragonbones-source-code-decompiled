package egret.utils
{
   import flash.net.SharedObject;
   
   public class _1296
   {
      public function _1296()
      {
         super();
      }
      
      public static function write(param1:String, param2:String, param3:*) : void
      {
         var _loc4_:SharedObject = null;
         try
         {
            _loc4_ = SharedObject.getLocal(param1,"/");
            _loc4_.data[param2] = param3;
            _loc4_.flush(1000);
         }
         catch(e:Error)
         {
         }
      }
      
      public static function read(param1:String, param2:String) : *
      {
         var _loc3_:SharedObject = null;
         try
         {
            _loc3_ = SharedObject.getLocal(param1,"/");
            return _loc3_.data[param2];
         }
         catch(e:Error)
         {
         }
         return null;
      }
   }
}

