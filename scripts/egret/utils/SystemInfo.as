package egret.utils
{
   import flash.filesystem.File;
   import flash.net.NetworkInfo;
   import flash.net.NetworkInterface;
   import flash.system.Capabilities;
   
   public class SystemInfo
   {
      private static var _nativeStoragePath:String = "";
      
      public function SystemInfo()
      {
         super();
      }
      
      public static function get isMacOS() : Boolean
      {
         return Capabilities.manufacturer == "Adobe Macintosh";
      }
      
      public static function get nativeStoragePath() : String
      {
         var _loc1_:File = null;
         if(_nativeStoragePath)
         {
            return _nativeStoragePath;
         }
         if(isMacOS)
         {
            _nativeStoragePath = File.userDirectory.nativePath + "/Library/Application Support/";
         }
         else
         {
            _loc1_ = new File(File.applicationStorageDirectory.nativePath);
            _nativeStoragePath = _loc1_.parent.parent.nativePath + "\\";
         }
         return _nativeStoragePath;
      }
      
      public static function get IP() : String
      {
         var _loc4_:int = 0;
         var _loc1_:NetworkInfo = NetworkInfo.networkInfo;
         var _loc2_:Vector.<NetworkInterface> = _loc1_.findInterfaces();
         var _loc3_:String = "";
         if(_loc2_ != null)
         {
            _loc4_ = 0;
            while(_loc4_ < _loc2_.length)
            {
               if(_loc2_[_loc4_].active == true)
               {
                  _loc3_ = _loc2_[_loc4_].addresses[0].address;
                  break;
               }
               _loc4_++;
            }
         }
         return _loc3_.toLocaleUpperCase();
      }
   }
}

