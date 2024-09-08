package _1495
{
   public class _1496
   {
      private static const EGRET_DOMAIN:String = " www.egret.com";
      
      private static const COPY_RIGHT:String = "Copyright © ";
      
      public function _1496()
      {
         super();
      }
      
      public static function get _2452() : String
      {
         var _loc1_:Number = new Date().fullYear;
         if(_loc1_ > 2014)
         {
            return COPY_RIGHT + "2014-" + _loc1_ + EGRET_DOMAIN;
         }
         return COPY_RIGHT + "2014" + _loc1_ + EGRET_DOMAIN;
      }
   }
}

