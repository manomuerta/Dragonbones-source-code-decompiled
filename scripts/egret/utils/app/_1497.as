package egret.utils.app
{
   import egret.utils.SystemInfo;
   import flash.desktop.NativeApplication;
   import flash.desktop.NativeProcess;
   import flash.desktop.NativeProcessStartupInfo;
   import flash.filesystem.File;
   
   public class _1497
   {
      public function _1497()
      {
         super();
      }
      
      public static function start() : void
      {
         var _loc5_:File = null;
         var _loc6_:File = null;
         var _loc7_:NativeProcessStartupInfo = null;
         var _loc8_:Vector.<String> = null;
         var _loc9_:NativeProcess = null;
         var _loc2_:XML = NativeApplication.nativeApplication.applicationDescriptor;
         var _loc3_:Namespace = _loc2_.namespace();
         var _loc4_:String = _loc2_._loc3_::filename[0].toString();
         if(SystemInfo.isMacOS)
         {
            _loc6_ = new File(File.applicationDirectory.nativePath);
            _loc5_ = _loc6_.parent.resolvePath("MacOS/" + _loc4_);
         }
         else
         {
            _loc5_ = File.applicationDirectory.resolvePath(_loc4_ + ".exe");
         }
         try
         {
            (_loc7_ = new NativeProcessStartupInfo()).executable = _loc5_;
            _loc8_ = new Vector.<String>();
            _loc7_.arguments = _loc8_;
            _loc9_ = new NativeProcess();
            _loc9_.start(_loc7_);
         }
         catch(error:Error)
         {
         }
         NativeApplication.nativeApplication.exit();
      }
   }
}

