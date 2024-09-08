package _1533
{
   import flash.system.Capabilities;
   import flash.utils.getDefinitionByName;
   
   public class _1535
   {
      private static var FileClass:Class;
      
      private static var checked:Boolean = false;
      
      private static var _10184:Boolean = false;
      
      public function _1535()
      {
         super();
      }
      
      public static function path2Url(param1:String) : String
      {
         if(!checked)
         {
            _10183();
         }
         if(!_10184 || !param1 || param1.charAt(0) != "/")
         {
            return param1;
         }
         param1 = param1.split("\\").join("/");
         var _loc2_:Object = FileClass.applicationDirectory.resolvePath(param1.substring(1));
         if(_loc2_.exists)
         {
            return param1;
         }
         return "file://" + param1;
      }
      
      private static function _10183() : void
      {
         checked = true;
         if(Capabilities.playerType != "Desktop" || Capabilities.os.indexOf("Windows") != -1)
         {
            return;
         }
         try
         {
            FileClass = getDefinitionByName("flash.filesystem.File") as Class;
         }
         catch(e:Error)
         {
         }
         if(!FileClass)
         {
            return;
         }
         _10184 = true;
      }
   }
}

