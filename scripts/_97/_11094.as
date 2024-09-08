package _97
{
   import flash.utils.ByteArray;
   
   public class _11094
   {
      protected static var _11124:uint;
      
      protected static var _11123:uint;
      
      protected static var _11120:uint;
      
      protected static var _11116:Boolean;
      
      protected static var _11117:Boolean;
      
      protected static var address:int;
      
      private static var _11119:Array;
      
      private static var _11118:ByteArray;
      
      protected static const SOF0:Array = [255,192,0,17,8];
      
      public static const PARSE_COMPLETE:String = "parseComplete";
      
      public static const PARSE_FAILED:String = "parseFailed";
      
      public function _11094()
      {
         super();
      }
      
      protected static function _11121(param1:uint) : void
      {
         var _loc2_:uint = 0;
         while(_loc2_ < param1)
         {
            _11118.readByte();
            ++address;
            _loc2_++;
         }
         if(_11117)
         {
         }
      }
      
      public static function _11122(param1:ByteArray) : Array
      {
         var _loc4_:int = 0;
         var _loc5_:Boolean = false;
         var _loc6_:Array = null;
         _11118 = param1;
         if(!_11119)
         {
            _11119 = new Array();
            _loc4_ = 1;
            while(_loc4_ < 16)
            {
               _11119[_loc4_] = [255,224 + _loc4_];
               _loc4_++;
            }
         }
         address = 0;
         _11120 = 0;
         var _loc2_:uint = 0;
         var _loc3_:int = 0;
         while(address < _11118.length)
         {
            _loc5_ = false;
            if(_11120 == 0)
            {
               _loc3_ = int(_11118.readUnsignedByte());
               ++address;
               for each(_loc6_ in _11119)
               {
                  if(address > 12800 && address < 13056)
                  {
                  }
                  if(_loc3_ == _loc6_[_loc2_])
                  {
                     _loc5_ = true;
                     if(_loc2_ + 1 >= _loc6_.length)
                     {
                        if(_11117)
                        {
                        }
                        _11120 = _11118.readUnsignedShort() - 2;
                        address += 2;
                        break;
                     }
                  }
               }
            }
            if(_11120 > 0)
            {
               if(_11118.length < _11120)
               {
                  break;
               }
               if(_11117)
               {
               }
               _11121(_11120);
               _loc5_ = false;
               _11120 = 0;
               _loc2_ = 0;
            }
            else
            {
               if(_loc3_ == SOF0[_loc2_])
               {
                  _loc5_ = true;
                  if(_loc2_ + 1 >= SOF0.length)
                  {
                     if(_11117)
                     {
                     }
                     _11123 = _11118.readUnsignedShort();
                     address += 2;
                     _11124 = _11118.readUnsignedShort();
                     address += 2;
                     if(_11117)
                     {
                     }
                     return [_11124,_11123];
                  }
               }
               if(_loc5_)
               {
                  _loc2_++;
               }
               else
               {
                  _loc2_ = 0;
               }
            }
         }
         return null;
      }
   }
}

