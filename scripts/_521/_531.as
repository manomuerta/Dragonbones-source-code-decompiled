package _521
{
   import _1404._1407;
   import _472._12461;
   import _477.ExportController;
   import _579._580;
   import _6._9;
   import _721._720;
   import _73.SymbolType;
   import _783.CommandNotification;
   import _93._94;
   import _953._960;
   import _97._117;
   import _97._118;
   import egret.utils.FileUtil;
   import egret.utils.SystemInfo;
   import egret.utils._1501;
   import flash.desktop.NativeProcess;
   import flash.desktop.NativeProcessStartupInfo;
   import flash.errors.IOError;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.NativeProcessExitEvent;
   import flash.events.ProgressEvent;
   import flash.filesystem.File;
   import flash.utils.IDataInput;
   
   public class _531 extends _94
   {
      private var _12617:File;
      
      private var _12620:Boolean = false;
      
      private var _11795:int = 30;
      
      private var _12616:String = "";
      
      private var _12623:int = 1;
      
      private var _12622:int = 2;
      
      private var _12618:int = 0;
      
      private var _12621:int = 2;
      
      private var _3842:Boolean = false;
      
      private var _10427:NativeProcess;
      
      private var _12615:Boolean = false;
      
      private var _12619:String = null;
      
      public function _531()
      {
         this._12569 = _1407.getInstance(_12461);
         super();
      }
      
      override protected function init() : void
      {
         var _loc1_:String = File.applicationStorageDirectory.resolvePath("release/version.txt").nativePath;
         var _loc2_:String = FileUtil.openAsString(_loc1_);
         if(_loc2_ != _1501.currentVersion + _1501.currentVersionLabel)
         {
            _117._2372();
            _117._2374();
            _117._10284();
            FileUtil.save(_loc1_,_1501.currentVersion + _1501.currentVersionLabel);
         }
      }
      
      override protected function _1576() : void
      {
         this._1565(CommandNotification.PREVIEW,this._3835);
         this._1565(CommandNotification.APPLICATION_EXIT,this._3835);
      }
      
      private function _3837() : void
      {
         var _loc1_:String = File.applicationStorageDirectory.resolvePath("release/version.txt").nativePath;
         if(_2214._1844._2871._2865._1811 == SymbolType.COMIC)
         {
            _117._2374();
         }
         else
         {
            _117._2372();
         }
         FileUtil.save(_loc1_,_1501.currentVersion + _1501.currentVersionLabel);
         this.exportFile();
      }
      
      private function _3835(param1:_9) : void
      {
         switch(param1.type)
         {
            case CommandNotification.PREVIEW:
               this._12569.callPaidFunction(1,this.exportFile);
               break;
            case CommandNotification.APPLICATION_EXIT:
               this.stop();
         }
      }
      
      private function exportFile() : void
      {
         var _3238:_720 = null;
         this._12618 = 0;
         this._12622 = 2;
         this._12621 = 2;
         try
         {
            _3238 = new _720();
            _3238.dragonBonesVO = _2214._1844._2871.dragonBonesVO;
            _3238.projectName = _2214._1844.label;
            _3238.scale = 1;
            _3238.dataType = _720.DATA_TYPE_JSON;
            this._11795 = _3238.dragonBonesVO.frameRate;
            this._12620 = _2214._1844._2871._2865._1811 === SymbolType.STAGE;
            if(_2214._1844._2871._2865._1811 === SymbolType.COMIC)
            {
               this._3602._13771(_3238,this.exportData);
            }
            else if(this._12620)
            {
               this._3602._3625(_3238,this.exportData);
            }
            else
            {
               this._3602._12578(_3238);
            }
         }
         catch(error:Error)
         {
            ++_12618;
            if(_12618 < _12621)
            {
               _3837();
            }
            else
            {
               _117._2377("DBProjectRunWork,exportFile 没有骨骼数据-----");
            }
         }
      }
      
      private function exportData(param1:String, param2:Array) : void
      {
         var _loc4_:File = null;
         var _loc5_:File = null;
         var _loc6_:_960 = null;
         var _loc7_:File = null;
         var _loc8_:String = null;
         var _loc9_:Object = null;
         var _loc10_:* = null;
         var _loc11_:Object = null;
         var _loc12_:Object = null;
         var _loc13_:Object = null;
         var _loc14_:Object = null;
         var _loc15_:Object = null;
         var _loc16_:Object = null;
         var _loc17_:Object = null;
         var _loc18_:Object = null;
         var _loc19_:_960 = null;
         var _loc20_:String = null;
         var _loc21_:File = null;
         var _loc22_:String = null;
         var _loc23_:Object = null;
         var _loc24_:String = null;
         var _loc25_:Object = null;
         var _loc26_:Object = null;
         var _loc27_:Object = null;
         var _loc28_:Object = null;
         var _loc29_:Object = null;
         var _loc3_:int = 0;
         if(_2214._1844._2871._2865._1811 == SymbolType.COMIC)
         {
            this._12616 = "/server/startservercomic";
            _loc4_ = File.applicationStorageDirectory.resolvePath("comic/resource");
            for each(_loc5_ in _loc4_)
            {
               if(!(_loc5_.name == "arrowtexture" && _loc5_.name == "arrow"))
               {
                  FileUtil.deletePath(_loc5_.nativePath);
               }
            }
            _loc6_ = this._3176.stagePanel.stageView;
            this._12623 = 1;
            _loc7_ = File.applicationDirectory.resolvePath("egretlauncher/comic/index.html");
            if(!_loc7_.exists)
            {
               _loc7_ = File.applicationDirectory;
               _loc7_ = new File(FileUtil.getDirectory(_loc7_.nativePath));
               _loc7_ = _loc7_.resolvePath("doc").resolvePath("egretlauncher/comic/index.html");
            }
            _loc8_ = FileUtil.openAsString(_loc7_.nativePath);
            if(_loc6_)
            {
               _loc8_ = _loc8_.split("width: 1200px;height: 900px").join("width:100%" + ";height:100%" + ";background:#" + _117._2375);
               _loc8_ = (_loc8_ = (_loc8_ = _loc8_.split("data-content-width=\"1200\"").join("data-content-width=\"" + _loc6_._3233 + "\"")).split("data-content-height=\"900\"").join("data-content-height=\"" + _loc6_._3231 + "\"")).split("data-frame-rate=\"30\"").join("data-frame-rate=\"" + 24 + "\"");
            }
            _118.save(File.applicationStorageDirectory.resolvePath("comic/index.html").nativePath,_loc8_,true,"",false,this._2378,this._2379);
            _118.save(File.applicationStorageDirectory.resolvePath("comic/resource/skeleton.json").nativePath,param1,true,"",false,this._2378,this._2379);
            _loc9_ = new Object();
            _loc10_ = "";
            _loc9_.resources = [];
            _loc9_.groups = [];
            (_loc11_ = new Object()).name = "skeleton_json";
            _loc11_.type = "json";
            _loc11_.url = "skeleton.json";
            _loc10_ += _loc11_.name;
            _loc9_.resources.push(_loc11_);
            _loc3_ = 0;
            while(_loc3_ < param2.length)
            {
               _loc16_ = param2[_loc3_];
               this._12622 += 2;
               this._12621 += 2;
               _118.save(File.applicationStorageDirectory.resolvePath("comic/resource/texture_" + _loc3_ + ".png").nativePath,_loc16_._1854,true,"",false,this._2378,this._2379);
               _118.save(File.applicationStorageDirectory.resolvePath("comic/resource/texture_" + _loc3_ + ".json").nativePath,_loc16_.textureConfig,true,"",false,this._2378,this._2379);
               (_loc17_ = new Object()).name = "texture_json" + _loc3_;
               _loc17_.type = "json";
               _loc17_.url = "texture_" + _loc3_ + ".json";
               _loc10_ += "," + _loc17_.name;
               _loc9_.resources.push(_loc17_);
               (_loc18_ = new Object()).name = "texture_png" + _loc3_;
               _loc18_.type = "image";
               _loc18_.url = "texture_" + _loc3_ + ".png";
               _loc10_ += "," + _loc18_.name;
               _loc9_.resources.push(_loc18_);
               _loc3_++;
            }
            _loc12_ = {
               "url":"arrow.json",
               "type":"json",
               "name":"arrow_json"
            };
            _loc13_ = {
               "url":"arrowtexture.json",
               "type":"json",
               "name":"arrowtexture_json"
            };
            _loc14_ = {
               "url":"arrowtexture.png",
               "type":"image",
               "name":"arrowtexture_png"
            };
            _loc9_.resources.push(_loc12_);
            _loc9_.resources.push(_loc13_);
            _loc9_.resources.push(_loc14_);
            _loc10_ += ",arrow_json,arrowtexture_json,arrowtexture_png";
            (_loc15_ = new Object()).name = "TestArmature";
            _loc15_.keys = _loc10_;
            _loc9_.groups.push(_loc15_);
            ++this._12622;
            ++this._12621;
            _118.save(File.applicationStorageDirectory.resolvePath("comic/resource/resource.json").nativePath,JSON.stringify(_loc9_),true,"",false,this._2378,this._2379);
         }
         else
         {
            this._12616 = "/server/startserver";
            _loc19_ = this._3176.stagePanel.stageView;
            this._12623 = 1;
            _loc20_ = File.applicationStorageDirectory.resolvePath("release/resource").nativePath;
            FileUtil.deletePath(_loc20_);
            _loc21_ = File.applicationDirectory.resolvePath("egretlauncher/release/index.html");
            if(!_loc21_.exists)
            {
               _loc21_ = File.applicationDirectory;
               _loc21_ = new File(FileUtil.getDirectory(_loc21_.nativePath));
               _loc21_ = _loc21_.resolvePath("doc").resolvePath("egretlauncher/release/index.html");
            }
            _loc22_ = FileUtil.openAsString(_loc21_.nativePath);
            if(this._12620)
            {
               _loc22_ = _loc22_.split("width: 100%;height: 100%").join("width:" + _loc19_._3233 + "px;height:" + _loc19_._3231 + "px");
               _loc22_ = (_loc22_ = (_loc22_ = _loc22_.split("data-content-width=\"1200\"").join("data-content-width=\"" + _loc19_._3233 + "\"")).split("data-content-height=\"900\"").join("data-content-height=\"" + _loc19_._3231 + "\"")).split("data-frame-rate=\"30\"").join("data-frame-rate=\"" + this._11795 + "\"");
            }
            _118.save(File.applicationStorageDirectory.resolvePath("release/index.html").nativePath,_loc22_,true,"",false,this._2378,this._2379);
            _118.save(File.applicationStorageDirectory.resolvePath("release/resource/skeleton.json").nativePath,param1,true,"",false,this._2378,this._2379);
            _loc23_ = new Object();
            _loc24_ = "";
            _loc23_.resources = [];
            _loc23_.groups = [];
            (_loc25_ = new Object()).name = "skeleton_json";
            _loc25_.type = "json";
            _loc25_.url = "skeleton.json";
            _loc24_ += _loc25_.name;
            _loc23_.resources.push(_loc25_);
            _loc3_ = 0;
            while(_loc3_ < param2.length)
            {
               _loc27_ = param2[_loc3_];
               this._12622 += 2;
               this._12621 += 2;
               _118.save(File.applicationStorageDirectory.resolvePath("release/resource/texture_" + _loc3_ + ".png").nativePath,_loc27_._1854,true,"",false,this._2378,this._2379);
               _118.save(File.applicationStorageDirectory.resolvePath("release/resource/texture_" + _loc3_ + ".json").nativePath,_loc27_.textureConfig,true,"",false,this._2378,this._2379);
               (_loc28_ = new Object()).name = "texture_json" + _loc3_;
               _loc28_.type = "json";
               _loc28_.url = "texture_" + _loc3_ + ".json";
               _loc24_ += "," + _loc28_.name;
               _loc23_.resources.push(_loc28_);
               (_loc29_ = new Object()).name = "texture_png" + _loc3_;
               _loc29_.type = "image";
               _loc29_.url = "texture_" + _loc3_ + ".png";
               _loc24_ += "," + _loc29_.name;
               _loc23_.resources.push(_loc29_);
               _loc3_++;
            }
            (_loc26_ = new Object()).name = "TestArmature";
            _loc26_.keys = _loc24_;
            _loc23_.groups.push(_loc26_);
            ++this._12622;
            ++this._12621;
            _118.save(File.applicationStorageDirectory.resolvePath("release/resource/resource.json").nativePath,JSON.stringify(_loc23_),true,"",false,this._2378,this._2379);
         }
      }
      
      private function _2378() : void
      {
         ++this._12623;
         if(this._12623 == this._12622)
         {
            this.run();
         }
      }
      
      private function _2379() : void
      {
         ++this._12618;
         if(this._12618 < this._12621)
         {
            this._3837();
         }
         else
         {
            _117._2377("DBProjectRunWork, Export file error：第" + this._12623 + "个文件-----");
         }
      }
      
      private function get _3843() : Boolean
      {
         return this._3842;
      }
      
      private function set _3843(param1:Boolean) : void
      {
         this._3842 = param1;
      }
      
      public function run(param1:String = null) : void
      {
         var nodeFile:File = null;
         var nodePath:File = null;
         var processInfo:NativeProcessStartupInfo = null;
         var arg:Vector.<String> = null;
         var path:String = param1;
         this._12619 = path;
         if(this._3843)
         {
            this.stop();
            this._12615 = true;
            return;
         }
         nodePath = File.applicationDirectory.resolvePath("egretlauncher");
         if(!nodePath.exists)
         {
            nodePath = File.applicationDirectory;
            nodePath = new File(FileUtil.getDirectory(nodePath.nativePath));
            nodePath = nodePath.resolvePath("doc").resolvePath("egretlauncher");
         }
         if(SystemInfo.isMacOS)
         {
            nodeFile = File.applicationDirectory.resolvePath(nodePath.nativePath + "/server/mac/node");
         }
         else
         {
            nodeFile = File.applicationDirectory.resolvePath(nodePath.nativePath + "/server/win/node.exe");
         }
         try
         {
            processInfo = new NativeProcessStartupInfo();
            processInfo.executable = nodeFile;
            arg = new Vector.<String>();
            if(this._12619)
            {
               arg[0] = nodePath.nativePath + "/server/start";
               arg[1] = this._12619;
            }
            else
            {
               arg[0] = nodePath.nativePath + this._12616;
            }
            processInfo.arguments = arg;
            processInfo.workingDirectory = File.applicationStorageDirectory.resolvePath("");
            this._10427 = new NativeProcess();
            this._10427.start(processInfo);
            this._10427.addEventListener(ProgressEvent.STANDARD_OUTPUT_DATA,this._3847);
            this._10427.addEventListener(ProgressEvent.STANDARD_ERROR_DATA,this._3847);
            this._10427.addEventListener(IOErrorEvent.STANDARD_ERROR_IO_ERROR,this.error);
            this._10427.addEventListener(IOErrorEvent.STANDARD_INPUT_IO_ERROR,this.error);
            this._10427.addEventListener(IOErrorEvent.STANDARD_OUTPUT_IO_ERROR,this.error);
            this._10427.addEventListener(NativeProcessExitEvent.EXIT,this._3841);
            this._3843 = true;
         }
         catch(ee:Error)
         {
            ++_12618;
            if(_12618 < _12621)
            {
               _3837();
            }
            else
            {
               _117._2377("DBProjectRunWork,Egret 预览容错-----");
            }
         }
      }
      
      private function error(param1:Event) : void
      {
         var _loc2_:String = "运行时发生错误!\n";
         if(param1 is IOError)
         {
            _loc2_ += IOError(param1).message;
         }
         this.stop();
      }
      
      private function _3847(param1:ProgressEvent) : void
      {
         var _loc2_:IDataInput = null;
         var _loc3_:String = null;
         switch(param1.type)
         {
            case ProgressEvent.STANDARD_ERROR_DATA:
               if(this._10427)
               {
                  _loc2_ = this._10427.standardError;
                  this.stop();
               }
               break;
            case ProgressEvent.STANDARD_OUTPUT_DATA:
               if(this._10427)
               {
                  _loc2_ = this._10427.standardOutput;
               }
         }
         if(_loc2_)
         {
            _loc3_ = _loc2_.readUTFBytes(_loc2_.bytesAvailable);
         }
      }
      
      private function _3841(param1:NativeProcessExitEvent) : void
      {
         this._3843 = false;
         if(this._12615)
         {
            this._12615 = false;
            this.run(this._12619);
         }
      }
      
      private function stop() : void
      {
         if(Boolean(this._10427) && this._3843)
         {
            this._10427.exit(true);
            this._10427 = null;
         }
      }
      
      private function get _3602() : ExportController
      {
         return _1407.getInstance(ExportController) as ExportController;
      }
      
      public function get _3176() : _580
      {
         return _1407.getInstance(_580) as _580;
      }
   }
}

