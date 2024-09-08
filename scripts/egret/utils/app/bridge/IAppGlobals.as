package egret.utils.app.bridge
{
   public interface IAppGlobals
   {
      function get updateServer() : String;
      
      function getUpdateURL(param1:String) : String;
      
      function getUseDev(param1:String) : Boolean;
      
      function setUseDev(param1:String, param2:Boolean) : void;
      
      function checkNeedUpdate(param1:String, param2:Function) : void;
      
      function checkUpdate(param1:String, param2:Boolean = false) : void;
      
      function checkVersion(param1:String, param2:Function) : void;
      
      function getAppXML(param1:String) : XML;
      
      function findInstallPath(param1:String) : String;
      
      function compareVersion(param1:String, param2:String) : Boolean;
   }
}

