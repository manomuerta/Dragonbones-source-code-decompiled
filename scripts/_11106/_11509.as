package _11106
{
   import _11111._11110;
   import flash.system.Capabilities;
   
   public class _11509
   {
      private var OS:String;
      
      public function _11509()
      {
         this.OS = Capabilities.manufacturer;
         super();
      }
      
      public function _11132(param1:String, param2:Error = null) : void
      {
         var _loc3_:String = !!param2 ? param1 + " - " + param2.message : param1;
         _11110.instance.trackEvent(_11109.Error + "-" + _11110.instance.appVersion,_loc3_,"OS:" + this.OS);
      }
   }
}

