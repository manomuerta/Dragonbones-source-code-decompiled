package _97
{
   import flash.utils.ByteArray;
   
   public class _104
   {
      private static const KEY:String = "DRAGONBONES_IS_BEST";
      
      private static const ENABLE:Boolean = true;
      
      public function _104()
      {
         super();
      }
      
      public static function encode(param1:Object) : ByteArray
      {
         var _loc5_:int = 0;
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeObject(param1);
         var _loc3_:int = 0;
         var _loc4_:ByteArray = new ByteArray();
         if(ENABLE)
         {
            _loc4_.writeByte(111);
            _loc5_ = 0;
            while(_loc5_ < _loc2_.length)
            {
               if(_loc3_ >= KEY.length)
               {
                  _loc3_ = 0;
               }
               _loc4_.writeByte(_loc2_[_loc5_] + KEY.charCodeAt(_loc3_));
               _loc5_++;
               _loc3_++;
            }
         }
         else
         {
            _loc4_.writeUTFBytes(JSON.stringify(param1));
         }
         return _loc4_;
      }
      
      public static function decode(param1:ByteArray) : Object
      {
         var _loc2_:int = 0;
         var _loc3_:ByteArray = null;
         var _loc4_:int = 0;
         if(param1.readByte() == 111)
         {
            param1.position = 0;
            _loc2_ = 0;
            _loc3_ = new ByteArray();
            _loc4_ = 1;
            while(_loc4_ < param1.length)
            {
               if(_loc2_ >= KEY.length)
               {
                  _loc2_ = 0;
               }
               _loc3_.writeByte(param1[_loc4_] - KEY.charCodeAt(_loc2_));
               _loc4_++;
               _loc2_++;
            }
            _loc3_.position = 0;
            return _loc3_.readObject();
         }
         param1.position = 0;
         return JSON.parse(param1.readUTFBytes(param1.length));
      }
   }
}

