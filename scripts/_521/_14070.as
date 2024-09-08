package _521
{
   import _6._9;
   import _783.CommandNotification;
   import _93._94;
   import egret.utils.FileUtil;
   import egret.utils.SystemInfo;
   import flash.desktop.NativeProcess;
   import flash.desktop.NativeProcessStartupInfo;
   import flash.errors.IOError;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.NativeProcessExitEvent;
   import flash.events.ProgressEvent;
   import flash.filesystem.File;
   import flash.net.URLLoader;
   import flash.net.URLLoaderDataFormat;
   import flash.net.URLRequest;
   import flash.utils.ByteArray;
   import zero.zip.Zip;
   import zero.zip.ZipFile;
   
   public class _14070 extends _94
   {
      public static var serverURL:String = "";
      
      public static var workingDirectory:File = File.applicationStorageDirectory.resolvePath("tools");
      
      private var _10427:NativeProcess = null;
      
      public function _14070()
      {
         this._5981 = new URLLoader();
         super();
      }
      
      override protected function init() : void
      {
      }
      
      override protected function _1576() : void
      {
         this._1565(CommandNotification.APPLICATION_EXIT,this._14521);
         this._update("tools/","egretlauncher/",this._start);
      }
      
      private function _14521(param1:_9) : void
      {
         switch(param1.type)
         {
            case CommandNotification.APPLICATION_EXIT:
               this._14524();
         }
      }
      
      private function _14523(param1:ProgressEvent) : void
      {
         var _loc2_:String = null;
         switch(param1.type)
         {
            case ProgressEvent.STANDARD_ERROR_DATA:
               if(this._10427)
               {
                  if(this._10427.standardError)
                  {
                     _loc2_ = this._10427.standardError.readUTFBytes(this._10427.standardError.bytesAvailable);
                  }
                  this._start();
               }
               break;
            case ProgressEvent.STANDARD_OUTPUT_DATA:
               if(Boolean(this._10427) && Boolean(this._10427.standardOutput))
               {
                  serverURL = this._10427.standardOutput.readUTFBytes(this._10427.standardOutput.bytesAvailable);
                  serverURL = serverURL.replace(/[\r\n]/g,"");
               }
         }
      }
      
      private function _14520(param1:Event) : void
      {
         var _loc2_:String = "运行时发生错误!\n";
         if(param1 is IOError)
         {
            _loc2_ += IOError(param1).message;
         }
         this._start();
      }
      
      private function _14522(param1:NativeProcessExitEvent) : void
      {
         this._start();
      }
      
      private function _start() : void
      {
         var debugDirectory:String;
         var debugServer:String = null;
         var loaderHandler:Function = null;
         loaderHandler = function(param1:Event):void
         {
            var result:Object = null;
            var nodePath:File = null;
            var nodeFile:File = null;
            var processInfo:NativeProcessStartupInfo = null;
            var arg:Vector.<String> = null;
            var event:Event = param1;
            _5981.removeEventListener(Event.COMPLETE,loaderHandler);
            _5981.removeEventListener(IOErrorEvent.IO_ERROR,loaderHandler);
            if(event.type === Event.COMPLETE)
            {
               result = JSON.parse(_5981.data);
               serverURL = result.data.url;
               workingDirectory = new File(result.data.workingDirectory);
            }
            else
            {
               nodePath = File.applicationDirectory.resolvePath("egretlauncher/server");
               if(!nodePath.exists)
               {
                  nodePath = new File(FileUtil.getDirectory(File.applicationDirectory.nativePath)).resolvePath("doc").resolvePath("egretlauncher/server");
               }
               if(SystemInfo.isMacOS)
               {
                  nodeFile = File.applicationDirectory.resolvePath(nodePath.nativePath + "/mac/node");
               }
               else
               {
                  nodeFile = File.applicationDirectory.resolvePath(nodePath.nativePath + "/win/node.exe");
               }
               try
               {
                  processInfo = new NativeProcessStartupInfo();
                  arg = new Vector.<String>();
                  arg[0] = workingDirectory.resolvePath("remote").nativePath;
                  processInfo.executable = nodeFile;
                  processInfo.arguments = arg;
                  processInfo.workingDirectory = workingDirectory;
                  _10427 = new NativeProcess();
                  _10427.addEventListener(IOErrorEvent.STANDARD_ERROR_IO_ERROR,_14520);
                  _10427.addEventListener(IOErrorEvent.STANDARD_INPUT_IO_ERROR,_14520);
                  _10427.addEventListener(IOErrorEvent.STANDARD_OUTPUT_IO_ERROR,_14520);
                  _10427.addEventListener(ProgressEvent.STANDARD_OUTPUT_DATA,_14523);
                  _10427.addEventListener(ProgressEvent.STANDARD_ERROR_DATA,_14523);
                  _10427.addEventListener(NativeProcessExitEvent.EXIT,_14522);
                  _10427.start(processInfo);
               }
               catch(error:Error)
               {
                  _10427 = null;
               }
            }
         };
         this._14524();
         debugServer = "http://localhost:48080/dragonbones";
         debugDirectory = debugServer + "/working_directory";
         this._5981.addEventListener(Event.COMPLETE,loaderHandler);
         this._5981.addEventListener(IOErrorEvent.IO_ERROR,loaderHandler);
         this._5981.load(new URLRequest(debugDirectory));
      }
      
      private function _14524() : void
      {
         if(this._10427)
         {
            this._10427.removeEventListener(IOErrorEvent.STANDARD_ERROR_IO_ERROR,this._14520);
            this._10427.removeEventListener(IOErrorEvent.STANDARD_INPUT_IO_ERROR,this._14520);
            this._10427.removeEventListener(IOErrorEvent.STANDARD_OUTPUT_IO_ERROR,this._14520);
            this._10427.removeEventListener(ProgressEvent.STANDARD_OUTPUT_DATA,this._14523);
            this._10427.removeEventListener(ProgressEvent.STANDARD_ERROR_DATA,this._14523);
            this._10427.removeEventListener(NativeProcessExitEvent.EXIT,this._14522);
            this._10427.exit(true);
            this._10427 = null;
         }
      }
      
      private function _update(param1:String, param2:String, param3:Function) : void
      {
         var REMOTE_URL:String = null;
         var VERSION_TXT:String = null;
         var UPDATE_ZIP:String = null;
         var localVersion:uint = 0;
         var localPath:File = null;
         var storageVersion:uint = 0;
         var storagePath:File = null;
         var _10085:uint = 0;
         var urlLoader:URLLoader = null;
         var loaderHandler:Function = null;
         var moduleName:String = param1;
         var localURL:String = param2;
         var callback:Function = param3;
         var unzipToStorage:Function = function(param1:ByteArray):void
         {
            var zip:Zip = null;
            var files:Vector.<ZipFile> = null;
            var file:ZipFile = null;
            var byteArray:ByteArray = param1;
            try
            {
               zip = new Zip();
               zip.decode(byteArray);
               FileUtil.deletePath(storagePath.nativePath);
               files = zip.fileV;
               for each(file in files)
               {
                  if(!file.isDirectory)
                  {
                     FileUtil.save(storagePath.resolvePath(file.name).nativePath,file.data);
                  }
               }
               FileUtil.save(storagePath.resolvePath(VERSION_TXT).nativePath,storageVersion.toString());
            }
            catch(e:Error)
            {
            }
            if(callback !== null)
            {
               callback();
            }
         };
         var checkUpdate:Function = function():void
         {
            if(_10085 > localVersion && _10085 > storageVersion)
            {
               urlLoader.addEventListener(Event.COMPLETE,loaderHandler);
               urlLoader.addEventListener(IOErrorEvent.IO_ERROR,loaderHandler);
               urlLoader.addEventListener(IOErrorEvent.NETWORK_ERROR,loaderHandler);
               urlLoader.dataFormat = URLLoaderDataFormat.BINARY;
               urlLoader.load(new URLRequest(REMOTE_URL + moduleName + UPDATE_ZIP));
            }
            else if(localVersion > storageVersion)
            {
               storageVersion = localVersion;
               unzipToStorage(FileUtil.openAsByteArray(localPath.resolvePath(UPDATE_ZIP).nativePath));
            }
            else if(callback !== null)
            {
               callback();
            }
         };
         loaderHandler = function(param1:Event):void
         {
            urlLoader.removeEventListener(Event.COMPLETE,loaderHandler);
            urlLoader.removeEventListener(IOErrorEvent.IO_ERROR,loaderHandler);
            urlLoader.removeEventListener(IOErrorEvent.NETWORK_ERROR,loaderHandler);
            switch(param1.type)
            {
               case Event.COMPLETE:
                  if(_10085 > 0)
                  {
                     storageVersion = _10085;
                     unzipToStorage((param1.target as URLLoader).data);
                     return;
                  }
                  _10085 = uint((param1.target as URLLoader).data);
                  break;
               default:
                  _10085 = 0;
            }
            checkUpdate();
         };
         REMOTE_URL = "http://www.dragonbones.com/update/dragonbones_pro/";
         VERSION_TXT = "version.txt";
         UPDATE_ZIP = "update.zip";
         localVersion = 0;
         localPath = File.applicationDirectory.resolvePath(localURL).resolvePath(moduleName);
         if(!localPath.exists)
         {
            localPath = new File(FileUtil.getDirectory(File.applicationDirectory.nativePath)).resolvePath("doc").resolvePath(localURL).resolvePath(moduleName);
         }
         localVersion = uint(FileUtil.openAsString(localPath.resolvePath(VERSION_TXT).nativePath));
         storageVersion = 0;
         storagePath = File.applicationStorageDirectory.resolvePath(moduleName);
         if(storagePath.exists)
         {
            storageVersion = uint(FileUtil.openAsString(storagePath.resolvePath(VERSION_TXT).nativePath));
         }
         _10085 = 0;
         urlLoader = new URLLoader();
         urlLoader.addEventListener(Event.COMPLETE,loaderHandler);
         urlLoader.addEventListener(IOErrorEvent.IO_ERROR,loaderHandler);
         urlLoader.addEventListener(IOErrorEvent.NETWORK_ERROR,loaderHandler);
         urlLoader.load(new URLRequest(REMOTE_URL + moduleName + VERSION_TXT));
      }
   }
}

