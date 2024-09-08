package _764
{
   import egret.utils.SystemInfo;
   
   public class _11508
   {
      private static var _11552:String;
      
      private static var _11751:Class = _11508__11751;
      
      public function _11508()
      {
         super();
      }
      
      public static function generate() : String
      {
         var _loc1_:RegExp = null;
         if(!_11552)
         {
            _11552 = String(new _11751());
            if(SystemInfo.isMacOS)
            {
               _loc1_ = /Ctrl/g;
               _11552 = _11552.replace(_loc1_,"Cmd");
               _11552 = _11552.replace("Alt + Q","Cmd + Q");
            }
         }
         return _11552;
      }
   }
}

