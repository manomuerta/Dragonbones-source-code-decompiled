package zero.codec
{
   public class DOSTime
   {
      public function DOSTime()
      {
         super();
      }
      
      public static function decode(param1:int) : Date
      {
         return new Date(1980 + (param1 >>> 25),(param1 >> 21 & 0x0F) - 1,param1 >> 16 & 0x1F,param1 >> 11 & 0x1F,param1 >> 5 & 0x3F,(param1 & 0x1F) << 1);
      }
      
      public static function encode(param1:Date) : int
      {
         return param1.fullYear - 1980 << 25 | param1.month + 1 << 21 | param1.date << 16 | param1.hours << 11 | param1.minutes << 5 | int(param1.seconds / 2);
      }
   }
}

