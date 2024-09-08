package _10264
{
   import _97._117;
   import egret.utils.FileUtil;
   import egret.utils.SystemInfo;
   import flash.desktop.NativeProcess;
   import flash.desktop.NativeProcessStartupInfo;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.NativeProcessExitEvent;
   import flash.events.ProgressEvent;
   import flash.filesystem.File;
   import flash.system.MessageChannel;
   import flash.system.Worker;
   import flash.utils.IDataInput;
   
   public class _10263
   {
      private static var _instance:_10263;
      
      private var _10424:Worker;
      
      protected var mainToWorker:MessageChannel;
      
      protected var workerToMain:MessageChannel;
      
      public var shareString:String;
      
      public var shareByteArray:String;
      
      private var _5880:Vector.<Function>;
      
      private var _lastTime:int;
      
      private var _10427:NativeProcess;
      
      private var _2352:String;
      
      public function _10263()
      {
         super();
         this._5880 = new Vector.<Function>();
      }
      
      public static function get instance() : _10263
      {
         if(_instance == null)
         {
            _instance = new _10263();
         }
         return _instance;
      }
      
      public function _10423() : MessageChannel
      {
         return this._10424.createMessageChannel(Worker.current);
      }
      
      private function _10420(param1:Event) : void
      {
      }
      
      protected function _10421(param1:Event) : void
      {
         var _loc3_:Function = null;
         var _loc2_:String = this.workerToMain.receive();
         if(_loc2_ == "CRYPTO_COMPLETE")
         {
            this.shareString = this._10424.getSharedProperty("shareString");
            if(this._5880.length > 0)
            {
               _loc3_ = this._5880.shift();
               _loc3_(this.shareString);
            }
         }
      }
      
      public function _10392(param1:String, param2:Function) : void
      {
         var _loc4_:File = null;
         var _loc5_:File = null;
         var _loc6_:NativeProcessStartupInfo = null;
         var _loc7_:Vector.<String> = null;
         this._5880.push(param2);
         this._2352 = "";
         this._10426(param1);
         _loc5_ = File.applicationDirectory.resolvePath("egretlauncher");
         if(!_loc5_.exists)
         {
            _loc5_ = File.applicationDirectory;
            _loc5_ = new File(FileUtil.getDirectory(_loc5_.nativePath));
            _loc5_ = _loc5_.resolvePath("doc").resolvePath("egretlauncher");
         }
         if(SystemInfo.isMacOS)
         {
            _loc4_ = File.applicationDirectory.resolvePath(_loc5_.nativePath + "/server/mac/node");
         }
         else
         {
            _loc4_ = File.applicationDirectory.resolvePath(_loc5_.nativePath + "/server/win/node.exe");
         }
         try
         {
            (_loc6_ = new NativeProcessStartupInfo()).executable = _loc4_;
            (_loc7_ = new Vector.<String>())[0] = "faakrsa.js";
            _loc6_.arguments = _loc7_;
            _loc6_.workingDirectory = File.applicationStorageDirectory.resolvePath("");
            this._10427 = new NativeProcess();
            this._10427.start(_loc6_);
            this._10427.addEventListener(ProgressEvent.STANDARD_OUTPUT_DATA,this._3847);
            this._10427.addEventListener(ProgressEvent.STANDARD_ERROR_DATA,this._10425);
            this._10427.addEventListener(IOErrorEvent.STANDARD_ERROR_IO_ERROR,this.error);
            this._10427.addEventListener(IOErrorEvent.STANDARD_INPUT_IO_ERROR,this.error);
            this._10427.addEventListener(IOErrorEvent.STANDARD_OUTPUT_IO_ERROR,this.error);
            this._10427.addEventListener(NativeProcessExitEvent.EXIT,this._3841);
         }
         catch(ee:Error)
         {
         }
      }
      
      private function _3841(param1:NativeProcessExitEvent) : void
      {
         var _loc2_:Function = null;
         if(this._5880.length > 0 && this._2352.length > 0)
         {
            _loc2_ = this._5880.shift();
            _loc2_(this._2352);
         }
         this._10422();
      }
      
      private function _10425(param1:ProgressEvent) : void
      {
         _117._10284();
      }
      
      private function error(param1:IOErrorEvent) : void
      {
      }
      
      private function _3847(param1:ProgressEvent) : void
      {
         var _loc2_:IDataInput = null;
         _loc2_ = this._10427.standardOutput;
         var _loc3_:String = _loc2_.readUTFBytes(_loc2_.bytesAvailable);
         this._2352 += _loc3_;
      }
      
      private function _10426(param1:String) : void
      {
         var _loc2_:* = File.applicationStorageDirectory.nativePath + "/faakrsa.js";
         var _loc3_:* = "var NodeRSA = require(\'./node_modules/node-rsa/src/NodeRSA\');\n" + "var PEM = \'-----BEGIN PUBLIC KEY-----\\n\'+\n" + "\'MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDEpwciY7jq4nfehn5JhMzrh8jw\\n\'+\n" + "\'ZSwUMiyDk6f+JcZJFT++WSmtrP2TWlP7Q+C2FWBK6q+kKB6hWj1bGIhKK+jyMPIT\\n\'+\n" + "\'VTwXVfTfqj46u1/PytwO6ooPXiPJwiHLiPIRHBT/0rDXmC1Xpyawi9+x/N5FWdFe\\n\'+\n" + "\'MDOcf49rCVdlhStHawIDAQAB\\n\'+\n" + "\'-----END PUBLIC KEY-----\';\n" + "var rsakey = new NodeRSA(PEM, undefined, { encryptionScheme: { scheme: \'pkcs1\', hash: \'sha1\', label: null } });\n" + "function encrypt(data) {\n" + "var base64 = rsakey.encrypt(data, \'base64\');\n" + "base64 = base64.split(\'+\').join(\'-\');\n" + "base64 = base64.split(\'/\').join(\'_\');\n" + "return base64;\n" + "}\n" + "var text = \'" + param1 + "\';\n" + "console.log(encrypt(text));\n";
         FileUtil.save(_loc2_,_loc3_);
      }
      
      private function _10422() : void
      {
         var _loc1_:* = File.applicationStorageDirectory.nativePath + "/faakrsa.js";
         FileUtil.deletePath(_loc1_);
      }
   }
}

