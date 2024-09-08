package _1331
{
   import _1529._1528;
   import egret.utils.FileUtil;
   import egret.utils.SystemInfo;
   import egret.utils._1501;
   import egret.utils._1522;
   import flash.desktop.NativeApplication;
   import flash.filesystem.File;
   import flash.net.URLVariables;
   import flash.system.Capabilities;
   import flash.utils.getTimer;
   
   public class _1340 extends _1339
   {
      private static var version:String = "";
      
      public var _5964:String = "";
      
      public var uuid:String;
      
      public var act:String = "heartbeat";
      
      public function _1340()
      {
         super();
         this.serverURL = _1335.SOFT_INFO_URL;
      }
      
      override protected function _9223() : URLVariables
      {
         var _loc1_:URLVariables = new URLVariables();
         var _loc2_:Object = {
            "toolsId":NativeApplication.nativeApplication.applicationID,
            "uid":this._5964,
            "os":Capabilities.os,
            "randStr":this.uuid,
            "toolsVersion":_1501.currentVersion,
            "toolsLang":_1528.language,
            "toolsUseTime":(getTimer() / 1000).toString(),
            "act":this.act,
            "egretVersion":this.getVersion()
         };
         _loc1_["data"] = Crypto._5963(JSON.stringify(_loc2_));
         return _loc1_;
      }
      
      private function getVersion() : String
      {
         var egretPath:String;
         var file:File = null;
         var packagejson:String = null;
         if(version)
         {
            return version;
         }
         egretPath = _1522._9225();
         if(egretPath)
         {
            file = new File(egretPath);
            if(SystemInfo.isMacOS)
            {
               file = file.resolvePath("Contents/Resources/mac/egret/package.json");
            }
            else
            {
               file = file.resolvePath("win/egret/package.json");
            }
            try
            {
               packagejson = FileUtil.openAsString(file.nativePath);
               version = JSON.parse(packagejson)["version"];
            }
            catch(error:Error)
            {
               version = "";
            }
         }
         return version;
      }
   }
}

