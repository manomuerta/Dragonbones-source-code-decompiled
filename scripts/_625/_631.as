package _625
{
   import _1009._1027;
   import _1177.CloseEvent;
   import _1177.UIEvent;
   import _1374.Alert;
   import _6._9;
   import _636.PluginEvent;
   import _648.PluginModel;
   import _783.CommandNotification;
   import _93._94;
   import _97._117;
   import _97._118;
   import egret.utils.FileUtil;
   import egret.utils._1501;
   import egret.utils.tr;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.filesystem.File;
   import flash.utils.ByteArray;
   import zero.zip.Zip;
   import zero.zip.ZipFile;
   
   public class _631 extends _94
   {
      private var window:_1027;
      
      public var _5596:Array;
      
      private var _5588:Array;
      
      private var _1890:Boolean;
      
      private var i:int = 1;
      
      private var _3710:int;
      
      private var _5591:int;
      
      private var _5593:String;
      
      private var _5557:int = 0;
      
      private var _5587:int = 0;
      
      private var _5580:Boolean = false;
      
      public function _631()
      {
         this._5596 = new Array();
         this._5588 = new Array();
         super();
      }
      
      override protected function init() : void
      {
         try
         {
            this._5592();
         }
         catch(error:Error)
         {
            Alert.show(tr("Plugin.PluginDamaged"));
         }
      }
      
      override protected function _1576() : void
      {
         _1565(CommandNotification.PLUGIN_MANAGER,this._3652);
         _1565(CommandNotification.PLUGIN_CHECK_TYPE,this._3652);
      }
      
      private function _5581(param1:Event) : void
      {
         switch(param1.type)
         {
            case PluginEvent.PLUGIN_ENABLED_START:
               this._5577(this.window._5598._2484.name).enabled = 0;
               this._5577(this.window._5598._2484.name).run(this._5573);
               break;
            case PluginEvent.PLUGIN_ENABLED_STOP:
               this._5577(this.window._5598._2484.name).enabled = 1;
               this._5577(this.window._5598._2484.name).run(this._5573);
         }
      }
      
      private function _5574(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.window._4020:
               this.install();
               break;
            case this.window._4019:
               if(this.window._5598._2484)
               {
                  this._5579(this.window._5598._2484.name);
               }
               else
               {
                  Alert.show(tr("Plugin.selectaplugin"));
                  this.window._4019.enabled = false;
               }
               break;
            case this.window._4203:
               this._5590();
         }
      }
      
      private function _3652(param1:_9) : void
      {
         switch(param1.type)
         {
            case CommandNotification.PLUGIN_MANAGER:
               this._3155();
               break;
            case CommandNotification.PLUGIN_CHECK_TYPE:
               this._5583(param1.data);
         }
      }
      
      private function _3155() : void
      {
         this.window = new _1027();
         this.window.addEventListener(UIEvent.CREATION_COMPLETE,this._5483);
         this._5596.sort(this._2735);
         this.window.open();
         this.window.invalidateDisplayList();
         this.window._5597(this._5596.length);
         this.window._5572(this._5596);
      }
      
      protected function _5483(param1:UIEvent) : void
      {
         if(this.window.hasEventListener(UIEvent.CREATION_COMPLETE))
         {
            this.window.removeEventListener(UIEvent.CREATION_COMPLETE,this._5483);
         }
         this.window.invalidateDisplayList();
         this.window._5597(this._5596.length);
         this.window._5572(this._5596);
         this.window._4020.addEventListener(MouseEvent.CLICK,this._5574);
         this.window._4019.addEventListener(MouseEvent.CLICK,this._5574);
         this.window._4203.addEventListener(MouseEvent.CLICK,this._5574);
         this.window._5598.addEventListener(PluginEvent.PLUGIN_ENABLED_START,this._5581);
         this.window._5598.addEventListener(PluginEvent.PLUGIN_ENABLED_STOP,this._5581);
      }
      
      private function _5590() : void
      {
         var _loc1_:File = new File(File.applicationStorageDirectory.resolvePath("plugins/").nativePath);
         if(Boolean(_loc1_.exists) && Boolean(_loc1_.isDirectory))
         {
            _loc1_.openWithDefaultApplication();
         }
      }
      
      private function install() : void
      {
         FileUtil.browseForOpen(this._5575,1);
      }
      
      private function _5575(param1:File) : void
      {
         var fileName:String;
         var zipByte:ByteArray;
         var onCloseBtnClick:Function;
         var fileArr:Vector.<ZipFile> = null;
         var plugin:PluginModel = null;
         var isPluginFormat:Boolean = false;
         var obj:ZipFile = null;
         var zipF:Zip = null;
         var zipfile:ZipFile = null;
         var file:File = param1;
         if(!file)
         {
            return;
         }
         fileName = FileUtil.getFileName(file.nativePath);
         if(fileName == "")
         {
            Alert(tr("Plugin.InvalidPath"));
            return;
         }
         zipByte = FileUtil.openAsByteArray(file.nativePath);
         if(zipByte == null)
         {
            this._5513(tr("Import.error.zip"));
         }
         else
         {
            try
            {
               zipF = new Zip();
               zipF.decode(zipByte);
            }
            catch(e:Error)
            {
               _5513(e.message);
               return;
            }
            fileArr = zipF.fileV;
            isPluginFormat = false;
            for each(obj in fileArr)
            {
               if(FileUtil.getExtension(obj.name) == "excfg")
               {
                  isPluginFormat = true;
                  plugin = new PluginModel();
                  plugin.modificationDate = obj.date.toString();
                  plugin._5585(obj.data.toString());
                  if(!this._5577(plugin.name))
                  {
                     for each(zipfile in fileArr)
                     {
                        if(zipfile.name)
                        {
                           FileUtil.save(File.applicationStorageDirectory.resolvePath("plugins/" + plugin.name + "/" + zipfile.name).nativePath,zipfile.data);
                        }
                     }
                     try
                     {
                        plugin.run(this._5576);
                        this._5594(plugin);
                     }
                     catch(error:Error)
                     {
                        Alert.show(error.message);
                     }
                     continue;
                  }
                  onCloseBtnClick = function(param1:CloseEvent):void
                  {
                     var zipfile:ZipFile = null;
                     var evt:CloseEvent = param1;
                     if(evt.detail == Alert.FIRST_BUTTON)
                     {
                        _5579(plugin.name);
                        for each(zipfile in fileArr)
                        {
                           FileUtil.save(File.applicationStorageDirectory.resolvePath("plugins/" + plugin.name + "/" + zipfile.name).nativePath,zipfile.data);
                        }
                        try
                        {
                           plugin.run(_5576);
                           _5594(plugin);
                        }
                        catch(error:Error)
                        {
                           Alert.show(error.message);
                        }
                     }
                  };
                  Alert.show(tr("Plugin.NameIncluded"),tr(""),null,onCloseBtnClick,tr("Alert.Confirm"),tr("Alert.Cancel"));
               }
            }
            if(!isPluginFormat)
            {
               Alert.show(tr("Plugin.formatError"));
            }
         }
      }
      
      private function _5576(param1:PluginModel) : void
      {
         var _loc2_:String = File.applicationStorageDirectory.resolvePath("plugins/plugin.plg").nativePath;
         var _loc3_:String = FileUtil.openAsString(_loc2_);
         var _loc4_:Object = new Object();
         if(_loc3_)
         {
            _loc4_ = JSON.parse(_loc3_);
         }
         _loc4_[param1.name] = param1._5599();
         FileUtil.save(_loc2_,JSON.stringify(_loc4_));
      }
      
      private function _5513(param1:String) : void
      {
         Alert.show(param1);
      }
      
      private function _5573(param1:PluginModel) : void
      {
         var _loc6_:Object = null;
         var _loc2_:String = File.applicationStorageDirectory.resolvePath("plugins/plugin.plg").nativePath;
         var _loc3_:String = FileUtil.openAsString(_loc2_);
         var _loc4_:Object = new Object();
         if(_loc3_)
         {
            _loc4_ = JSON.parse(_loc3_);
         }
         var _loc5_:Boolean = true;
         for each(_loc6_ in _loc4_)
         {
            if(_loc6_.name == param1.name)
            {
               _loc6_.name = param1.name;
               _loc6_.path = param1.path;
               _loc6_.description = param1.name;
               _loc6_.author = param1.author;
               _loc6_.version = param1.version;
               _loc6_.type = param1.type;
               _loc6_.icon = param1.icon;
               _loc6_.enabled = param1.enabled;
            }
         }
         if(_loc5_)
         {
            _loc4_[param1.name] = param1._5599();
         }
         FileUtil.save(_loc2_,JSON.stringify(_loc4_));
         if(this.window)
         {
            this.window.invalidateDisplayList();
            this.window._5597(this._5596.length);
            this.window._5572(this._5596,param1.name);
         }
      }
      
      private function _5594(param1:PluginModel) : void
      {
         this._5596.push(param1);
         if(this.window)
         {
            this.window.invalidateDisplayList();
            this.window._5597(this._5596.length);
            this.window._5572(this._5596,param1.name);
         }
      }
      
      private function _5579(param1:String) : void
      {
         var _loc5_:PluginModel = null;
         var _loc6_:String = null;
         var _loc2_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < this._5596.length)
         {
            if(this._5596[_loc2_].name == param1)
            {
               this._5596.splice(_loc2_,1);
               _loc6_ = File.applicationStorageDirectory.resolvePath("plugins/" + param1 + "/").nativePath;
               FileUtil.deletePath(_loc6_);
            }
            _loc2_++;
         }
         var _loc3_:String = File.applicationStorageDirectory.resolvePath("plugins/plugin.plg").nativePath;
         var _loc4_:Object = new Object();
         for each(_loc5_ in this._5596)
         {
            _loc4_[_loc5_.name] = _loc5_._5599();
         }
         FileUtil.save(_loc3_,JSON.stringify(_loc4_));
         if(this.window)
         {
            this.window.invalidateDisplayList();
            this.window._5597(this._5596.length);
            this.window._5572(this._5596);
         }
      }
      
      private function _5592() : void
      {
         var _loc3_:File = null;
         var _loc4_:String = null;
         var _loc5_:File = null;
         var _loc1_:String = File.applicationStorageDirectory.resolvePath("plugins/version.txt").nativePath;
         var _loc2_:String = FileUtil.openAsString(_loc1_);
         if(_loc2_ != _1501.currentVersion + _1501.currentVersionLabel)
         {
            this.deleteAll(File.applicationStorageDirectory.resolvePath("plugins").nativePath);
            _117._2373();
            FileUtil.save(_loc1_,_1501.currentVersion + _1501.currentVersionLabel);
            _loc3_ = File.applicationDirectory.resolvePath("plugins/egretPluginSdk.js");
            if(!_loc3_.exists)
            {
               _loc3_ = File.applicationDirectory;
               _loc3_ = new File(FileUtil.getDirectory(_loc3_.nativePath));
               _loc3_ = _loc3_.resolvePath("doc").resolvePath("plugins/egretPluginSdk.js");
            }
            _loc4_ = FileUtil.openAsString(_loc3_.nativePath);
            _118.save(File.applicationStorageDirectory.resolvePath("plugins/egretPluginSdk.js").nativePath,_loc4_,true,"",false,this._2378,this._2379);
         }
         else
         {
            _loc5_ = File.applicationStorageDirectory.resolvePath("plugins/egretPluginSdk.js");
            if(!_loc5_.exists)
            {
               _loc5_ = File.applicationDirectory.resolvePath("plugins/egretPluginSdk.js");
               if(!_loc5_.exists)
               {
                  _loc5_ = File.applicationDirectory;
                  _loc5_ = new File(FileUtil.getDirectory(_loc5_.nativePath));
                  _loc5_ = _loc5_.resolvePath("doc").resolvePath("plugins/egretPluginSdk.js");
               }
               FileUtil.copyTo(_loc5_.nativePath,File.applicationStorageDirectory.resolvePath("plugins/egretPluginSdk.js").nativePath);
            }
            this._5582();
         }
      }
      
      private function _2378() : void
      {
         this._5582();
      }
      
      private function _2379() : void
      {
      }
      
      private function _5582() : void
      {
         var _loc4_:Object = null;
         var _loc5_:File = null;
         var _loc6_:Boolean = false;
         var _loc7_:PluginModel = null;
         var _loc8_:File = null;
         var _loc9_:PluginModel = null;
         var _loc10_:File = null;
         var _loc11_:String = null;
         this._5596.length = 0;
         this._5588.length = 0;
         var _loc1_:String = File.applicationStorageDirectory.resolvePath("plugins/plugin.plg").nativePath;
         var _loc2_:String = FileUtil.openAsString(_loc1_);
         var _loc3_:Object = new Object();
         if(_loc2_)
         {
            _loc3_ = JSON.parse(_loc2_);
         }
         for each(_loc4_ in _loc3_)
         {
            _loc7_ = new PluginModel();
            _loc7_._5586(_loc4_);
            this._5588.push(_loc7_);
         }
         _loc5_ = File.applicationStorageDirectory.resolvePath("plugins");
         this._3710 = 0;
         this._5591 = 0;
         this._1890 = false;
         _loc6_ = false;
         if(_loc5_.isDirectory)
         {
            for each(_loc8_ in _loc5_.getDirectoryListing())
            {
               if(_loc8_.isDirectory)
               {
                  for each(_loc10_ in _loc8_.getDirectoryListing())
                  {
                     if(FileUtil.getExtension(_loc10_.name) == "excfg")
                     {
                        ++this._3710;
                        (_loc9_ = new PluginModel()).modificationDate = _loc10_.modificationDate.toString();
                        _loc9_._5589(_loc10_.url,this._5584);
                        _loc6_ = true;
                     }
                  }
               }
            }
         }
         this._1890 = true;
         if(!_loc6_)
         {
            _loc11_ = File.applicationStorageDirectory.resolvePath("plugins/plugin.plg").nativePath;
            FileUtil.save(_loc11_,"{}");
         }
         if(this.window)
         {
            this.window.invalidateDisplayList();
            this.window._5597(this._5596.length);
            this.window._5572(this._5596);
         }
      }
      
      private function _5584(param1:Object) : void
      {
         var _loc4_:PluginModel = null;
         var _loc5_:String = null;
         var _loc6_:PluginModel = null;
         ++this._5591;
         var _loc2_:Boolean = false;
         var _loc3_:int = 0;
         while(_loc3_ < this._5588.length)
         {
            if(this._5588[_loc3_].name == param1.name)
            {
               if(this._5588[_loc3_].modificationDate == param1.modificationDate)
               {
                  if(this._5588[_loc3_].type != null)
                  {
                     this._5596.push(this._5588[_loc3_]);
                     _loc2_ = true;
                  }
               }
            }
            _loc3_++;
         }
         if(!_loc2_)
         {
            _loc4_ = new PluginModel();
            _loc4_._5585(JSON.stringify(param1));
            this._5594(_loc4_);
            _loc4_.run(this._5576);
         }
         if(this._1890)
         {
            if(this._3710 == this._5591)
            {
               _loc5_ = File.applicationStorageDirectory.resolvePath("plugins/plugin.plg").nativePath;
               param1 = new Object();
               for each(_loc6_ in this._5596)
               {
                  param1[_loc6_.name] = _loc6_._5599();
               }
               FileUtil.save(_loc5_,JSON.stringify(param1));
               if(this.window)
               {
                  this.window.invalidateDisplayList();
                  this.window._5597(this._5596.length);
                  this.window._5572(this._5596);
               }
               this._5588.length = 0;
            }
         }
      }
      
      private function _5577(param1:String) : PluginModel
      {
         var _loc2_:PluginModel = null;
         for each(_loc2_ in this._5596)
         {
            if(_loc2_.name == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      private function _5583(param1:String) : void
      {
         var _loc3_:PluginModel = null;
         this._5593 = param1;
         this._5557 = 0;
         this._5587 = 0;
         this._5580 = false;
         var _loc2_:Boolean = false;
         for each(_loc3_ in this._5596)
         {
            if(_loc3_.type == this._5593)
            {
               if(!_loc3_._3668)
               {
                  _loc2_ = true;
                  ++this._5557;
                  _loc3_.run(this._5578);
               }
            }
         }
         this._5580 = true;
         if(!_loc2_)
         {
            ++this._5557;
            this._5578(null);
         }
      }
      
      private function _5578(param1:PluginModel) : void
      {
         var _loc2_:Array = null;
         var _loc3_:PluginModel = null;
         ++this._5587;
         if(this._5580)
         {
            if(this._5557 == this._5587)
            {
               _loc2_ = [];
               for each(_loc3_ in this._5596)
               {
                  if(_loc3_.type == this._5593 && _loc3_.enabled == 1 && _loc3_._5520)
                  {
                     _loc2_.push(_loc3_);
                  }
               }
               _1567(new CommandNotification(CommandNotification.PLUGIN_CHECK_IMPORT_TYPE_COMPLETE,_loc2_));
            }
         }
      }
      
      private function _2735(param1:Object, param2:Object) : int
      {
         var _loc3_:int = int(param1.enabled);
         var _loc4_:int = int(param2.enabled);
         if(_loc3_ > _loc4_)
         {
            return -1;
         }
         if(_loc3_ < _loc4_)
         {
            return 1;
         }
         return 0;
      }
      
      public function deleteAll(param1:String, param2:Boolean = false) : void
      {
         param1 = FileUtil.escapePath(param1);
         var _loc3_:File = new File(File.applicationStorageDirectory.resolvePath(param1).nativePath);
         if(_loc3_.isDirectory)
         {
            this._5595(param1,param2);
         }
         else
         {
            FileUtil.deletePath(_loc3_.nativePath,param2);
         }
      }
      
      private function _5595(param1:String, param2:Boolean = false) : void
      {
         var _loc4_:File = null;
         var _loc3_:File = new File(File.applicationStorageDirectory.resolvePath(param1).nativePath);
         if(_loc3_.isDirectory)
         {
            for each(_loc4_ in _loc3_.getDirectoryListing())
            {
               if(_loc4_.isDirectory)
               {
                  this._5595(_loc4_.nativePath,param2);
               }
               else
               {
                  FileUtil.deletePath(_loc4_.nativePath,param2);
               }
            }
            FileUtil.deletePath(_loc3_.nativePath,param2);
         }
      }
   }
}

