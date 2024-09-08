package egret.utils
{
   import flash.desktop.NativeProcess;
   import flash.desktop.NativeProcessStartupInfo;
   import flash.filesystem.File;
   import flash.system.Capabilities;
   
   public class _1526
   {
      public function _1526()
      {
         super();
      }
      
      public static function _10168(param1:String) : void
      {
         var file:File = null;
         var _10072:NativeProcess = null;
         var processArg:Vector.<String> = null;
         var _10165:NativeProcessStartupInfo = null;
         var _2376:String = param1;
         try
         {
            file = new File(_2376);
         }
         catch(error:Error)
         {
         }
         if(!file || !file.exists)
         {
            return;
         }
         try
         {
            _10072 = new NativeProcess();
            processArg = new Vector.<String>();
            _10165 = new NativeProcessStartupInfo();
            if(Capabilities.manufacturer == "Adobe Macintosh")
            {
               processArg.push("-c");
               processArg.push("open -R \'" + file.nativePath + "\'");
               _10165.executable = new File("/bin/bash");
            }
            else if(Capabilities.manufacturer == "Adobe Windows")
            {
               processArg.push("/c");
               processArg.push("Explorer /select," + file.nativePath + "");
               _10165.executable = new File("c:/Windows/system32/cmd.exe");
            }
            _10165.arguments = processArg;
            _10072.start(_10165);
         }
         catch(error:Error)
         {
            if(file.isDirectory)
            {
               file.openWithDefaultApplication();
            }
            else if(file.parent.isDirectory)
            {
               file.parent.openWithDefaultApplication();
            }
         }
      }
   }
}

