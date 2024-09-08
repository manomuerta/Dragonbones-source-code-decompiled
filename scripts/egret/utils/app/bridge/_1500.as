package egret.utils.app.bridge
{
   import egret.utils.FileUtil;
   import egret.utils._1539;
   import egret.utils._1550;
   import egret.utils.app.AppConnection;
   import flash.display.Loader;
   import flash.events.IOErrorEvent;
   import flash.system.ApplicationDomain;
   import flash.utils.ByteArray;
   
   public class _1500
   {
      private static var comp:Function;
      
      private static var bridge:IAppGlobals;
      
      public function _1500()
      {
         super();
      }
      
      public static function get updateServer() : String
      {
         if(bridge)
         {
            return bridge.updateServer;
         }
         return "";
      }
      
      public static function getUpdateURL(param1:String) : String
      {
         if(bridge)
         {
            return bridge.getUpdateURL(param1);
         }
         return "";
      }
      
      public static function checkNeedUpdate(param1:String, param2:Function) : void
      {
         if(bridge)
         {
            bridge.checkNeedUpdate(param1,param2);
         }
      }
      
      public static function checkUpdate(param1:String, param2:Boolean = false) : void
      {
         if(bridge)
         {
            bridge.checkUpdate(param1,param2);
         }
      }
      
      public static function checkVersion(param1:String, param2:Function) : void
      {
         if(bridge)
         {
            bridge.checkVersion(param1,param2);
         }
      }
      
      public static function compareVersion(param1:String, param2:String) : Boolean
      {
         if(bridge)
         {
            return bridge.compareVersion(param1,param2);
         }
         return false;
      }
      
      public static function findInstallPath(param1:String) : String
      {
         if(bridge)
         {
            return bridge.findInstallPath(param1);
         }
         return "";
      }
      
      public static function getUseDev(param1:String) : Boolean
      {
         if(bridge)
         {
            return bridge.getUseDev(param1);
         }
         return false;
      }
      
      public static function setUseDev(param1:String, param2:Boolean) : void
      {
         if(bridge)
         {
            bridge.setUseDev(param1,param2);
         }
      }
      
      public static function getAppXML(param1:String) : XML
      {
         if(bridge)
         {
            return bridge.getAppXML(param1);
         }
         return null;
      }
      
      public static function get _10080() : Boolean
      {
         return !!bridge ? true : false;
      }
      
      public static function load(param1:Function, param2:String = "") : void
      {
         if(!param2 || !FileUtil.exists(param2))
         {
            param2 = AppConnection.appManagerPath + "bin/EgretBridge.swc";
         }
         var _loc3_:ByteArray = _1550.open(param2);
         if(_loc3_)
         {
            comp = param1;
            _1539._10081(_loc3_,_10082,null,onError);
         }
         else
         {
            param1(false);
         }
      }
      
      private static function onError(param1:IOErrorEvent) : void
      {
         if(comp != null)
         {
            comp(false);
         }
         comp = null;
      }
      
      private static function _10082(param1:Loader) : void
      {
         var _loc2_:ApplicationDomain = param1.contentLoaderInfo.applicationDomain;
         var _loc3_:Class = _loc2_.getDefinition("egret.bridge.AppGlobals") as Class;
         bridge = new _loc3_() as IAppGlobals;
         if(comp != null)
         {
            comp(true);
         }
         comp = null;
      }
   }
}

