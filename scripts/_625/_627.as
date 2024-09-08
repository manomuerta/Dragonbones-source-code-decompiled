package _625
{
   import _1009._1024;
   import _11106._11105;
   import _11111._11110;
   import _1177.UIEvent;
   import _120._121;
   import _120._123;
   import _1315._1318;
   import _1374.Alert;
   import _1404._1407;
   import _1529._1528;
   import _1529._1530;
   import _35.HashObject;
   import _35._13488;
   import _35._34;
   import _35._36;
   import _35._37;
   import _512.LoadZipFileTask;
   import _512._11498;
   import _512._511;
   import _512._513;
   import _512._514;
   import _512._517;
   import _521._527;
   import _555.LibraryPanelController;
   import _6._9;
   import _636.ImportEvent;
   import _639._638;
   import _648.PluginModel;
   import _648._650;
   import _721._722;
   import _73.SymbolType;
   import _772._773;
   import _777._779;
   import _783.CommandNotification;
   import _890._904;
   import _93._94;
   import egret.utils.FileUtil;
   import egret.utils.SystemInfo;
   import egret.utils.tr;
   import flash.display.BitmapData;
   import flash.display.MovieClip;
   import flash.filesystem.File;
   import flash.utils.ByteArray;
   import flash.utils.Dictionary;
   
   public class _627 extends _94
   {
      public static const ERROR_NO_DRAGONBONES_DATA:String = "ERROR_NO_DRAGONBONES_DATA";
      
      public static const ERROR_NO_TEXTURE_DATA:String = "ERROR_NO_TEXTURE_DATA";
      
      public static const ERROR_ZIP_DATA:String = "ERROR_ZIP_DATA";
      
      public static const XML_SUFFIX:String = "xml";
      
      public static const JSON_SUFFIX:String = "json";
      
      public static const AMF3_SUFFIX:String = "amf3";
      
      public static const SWF_SUFFIX:String = "swf";
      
      public static const PNG_SUFFIX:String = "png";
      
      public static const DBSWF_SUFFIX:String = "dbswf";
      
      public static const ZIP_SUFFIX:String = "zip";
      
      public static const JPG_SUFFIX:String = "jpg";
      
      public static const ATF_SUFFIX:String = "atf";
      
      private var _5510:_1024;
      
      private var _3713:_722;
      
      private var _4761:_650;
      
      private var _5497:Object;
      
      private var plugin:PluginModel;
      
      public var _5507:Array;
      
      public var _3717:PluginModel;
      
      private var _5517:String;
      
      private var _5486:Boolean = false;
      
      private var callback:Function;
      
      private var _5505:Boolean = false;
      
      private var _5515:Boolean = false;
      
      public function _627()
      {
         super();
         this._5517 = _1528.language == _1530.zh_CN ? "　　　　　　" : "                                ";
      }
      
      override protected function _1576() : void
      {
         _1565(CommandNotification.PLUGIN_CHECK_IMPORT_TYPE_COMPLETE,this._3652);
         _1565(CommandNotification.PLUGIN_SELECT_PLUGIN_COMPLETE,this._3652);
      }
      
      private function _3652(param1:_9) : void
      {
         switch(param1.type)
         {
            case CommandNotification.PLUGIN_CHECK_IMPORT_TYPE_COMPLETE:
               this._5507 = param1.data;
               this._5509();
               this._5486 = true;
               if(this._5505)
               {
                  this.callback();
                  this._5505 = false;
               }
               break;
            case CommandNotification.PLUGIN_SELECT_PLUGIN_COMPLETE:
               if(param1.data && param1.data.name != "DragonBones Pro")
               {
                  this._3717 = param1.data.ooo;
               }
               else
               {
                  this._3717 = null;
               }
               this._5499();
         }
      }
      
      public function _5147(param1:String) : void
      {
         var path:String = param1;
         this._3155();
         if(this._5486)
         {
            this._5505 = false;
            this._5510._5519.text = path;
         }
         else
         {
            this._5505 = true;
            this.callback = function back():void
            {
               _5510._5519.text = path;
            };
         }
      }
      
      public function _4945(param1:String, param2:String, param3:String) : void
      {
         var jsonPath:String = param1;
         var pngPath:String = param2;
         var texPath:String = param3;
         this._3155();
         if(this._5486)
         {
            this._5505 = false;
            this._5510._5519.text = jsonPath;
         }
         else
         {
            this._5505 = true;
            this.callback = function back():void
            {
               _5510._5519.text = jsonPath;
            };
         }
      }
      
      public function _3242(param1:Dictionary) : void
      {
         var _1849:Dictionary = param1;
         this._5515 = true;
         this._4761 = new _650();
         if(this._5486)
         {
            this._5505 = false;
            this._5502(_1849);
         }
         else
         {
            this._5505 = true;
            this.callback = function back():void
            {
               _5502(_1849);
            };
            _1567(new CommandNotification(CommandNotification.PLUGIN_CHECK_TYPE,_904.IMPORT));
         }
      }
      
      private function _5502(param1:Dictionary) : void
      {
         var _loc2_:String = null;
         var _loc4_:PluginModel = null;
         var _loc5_:PluginModel = null;
         if(Boolean(param1.hasOwnProperty("plugin")) && param1["plugin"] != "auto")
         {
            for each(_loc4_ in this._5507)
            {
               if(param1["plugin"] == _loc4_.name)
               {
                  this._3717 = _loc4_;
               }
            }
         }
         else
         {
            for each(_loc5_ in this._5507)
            {
               if(_loc5_._3668.checkDataValid(FileUtil.openAsString(param1["dbdata"])))
               {
                  this._3717 = _loc5_;
               }
            }
         }
         if(param1.hasOwnProperty("projectname"))
         {
            _loc2_ = param1["projectname"];
         }
         else
         {
            _loc2_ = FileUtil.getFileName(param1["dbdata"]);
         }
         this._4761.projectName = _loc2_;
         if(param1.hasOwnProperty("projectpath"))
         {
            _527.getInstance()._2376 = FileUtil.escapePath(param1["projectpath"]);
            this._4761.path = FileUtil.escapePath(param1["projectpath"]) + _loc2_;
         }
         else
         {
            this._4761.path = FileUtil.escapePath(File.documentsDirectory.resolvePath("DBProjects").nativePath) + _loc2_;
         }
         var _loc3_:_722 = new _722();
         _loc3_._3717 = this._3717;
         if(param1.hasOwnProperty("texturefolder"))
         {
            _loc3_.type = _722.TYPE_FILES;
            _loc3_._5512 = FileUtil.escapePath(param1["texturefolder"]);
         }
         else
         {
            _loc3_.type = _722.TYPE_TEXTURE;
            _loc3_._3724 = String(param1["texturedata"]).split("|");
            _loc3_._3725 = String(param1["textureatlas"]).split("|");
         }
         _loc3_._3714 = param1["dbdata"];
         _loc3_.outputPath = FileUtil.escapePath(this._4761.path);
         this._4761._3283(_loc3_);
      }
      
      public function _3243(param1:Dictionary) : void
      {
         var _loc2_:String = null;
         this._5515 = true;
         this._4761 = new _650();
         if(param1.hasOwnProperty("projectname"))
         {
            _loc2_ = param1["projectname"];
         }
         else
         {
            _loc2_ = FileUtil.getFileName(param1["dbdatapack"]);
         }
         this._4761.projectName = _loc2_;
         if(param1.hasOwnProperty("projectpath"))
         {
            _527.getInstance()._2376 = FileUtil.escapePath(param1["projectpath"]);
            this._4761.path = FileUtil.escapePath(param1["projectpath"]) + _loc2_;
         }
         else
         {
            this._4761.path = FileUtil.escapePath(File.documentsDirectory.resolvePath("DBProjects").nativePath) + _loc2_;
         }
         var _loc3_:_722 = new _722();
         _loc3_.type = _722.TYPE_ZIP;
         _loc3_._3736 = param1["dbdatapack"];
         _loc3_.outputPath = FileUtil.escapePath(this._4761.path);
         this._4761._3283(_loc3_);
      }
      
      public function _3226(param1:String, param2:String, param3:String) : void
      {
         var jsonPath:String = param1;
         var pngPath:String = param2;
         var texPath:String = param3;
         if(this._5486)
         {
            this._5505 = false;
            this._5504(jsonPath,pngPath,texPath);
         }
         else
         {
            this._5505 = true;
            this.callback = function back():void
            {
               _5504(jsonPath,pngPath,texPath);
            };
            _1567(new CommandNotification(CommandNotification.PLUGIN_CHECK_TYPE,_904.IMPORT));
         }
      }
      
      private function _5504(param1:String, param2:String, param3:String) : void
      {
      }
      
      public function _3289(param1:String) : void
      {
         this._3155();
         this._5510._5519.text = param1;
      }
      
      public function _10786(param1:String) : void
      {
         this._3717 = null;
         this._4761 = new _650();
         this._4761.addEventListener(ImportEvent.IMPORT_SUCCESS,this._5516);
         this._4761.addEventListener(ImportEvent.IMPORT_FAIL,this.onFail);
         var _loc2_:String = FileUtil.getFileName(param1);
         if(_loc2_ == null || _loc2_ == "")
         {
            _loc2_ = _638.NEW_PROJECT_NAME;
         }
         var _loc3_:String = _2214._11701(_loc2_);
         _loc2_ = _2214._11702(_loc3_,_loc3_);
         var _loc4_:String = File.applicationStorageDirectory.resolvePath(_638.NEW_PROJECT_NAME + "/" + _loc3_ + "/library").nativePath;
         var _loc5_:String = FileUtil.escapePath(_2214._10787 + "/" + _loc3_);
         this._4761.projectName = _loc2_;
         this._4761.path = _loc5_;
         var _loc6_:_722;
         (_loc6_ = new _722())._3271 = false;
         _loc6_.libraryPath = FileUtil.escapePath(_loc4_);
         _loc6_.type = _722.TYPE_ZIP;
         _loc6_._3736 = param1;
         var _loc7_:String = FileUtil.escapePath(_loc5_);
         _loc7_ = FileUtil.escapePath(_loc7_);
         _loc6_.outputPath = _loc7_;
         this._4761._3283(_loc6_);
      }
      
      public function _3306() : void
      {
         this._3155();
         this._5510._5519.text = "";
      }
      
      private function _3155() : void
      {
         var _loc1_:String = null;
         this._3717 = null;
         this._4761 = new _650();
         this._4761.addEventListener(ImportEvent.IMPORT_SUCCESS,this._5516);
         this._4761.addEventListener(ImportEvent.IMPORT_FAIL,this.onFail);
         if(Boolean(this._2861._3678) && Boolean(_2214._1844))
         {
            if(_2214._1844._2871._2865._1811 != SymbolType.COMIC)
            {
               _loc1_ = this._2861._3678._3680();
            }
         }
         this._5510 = new _1024(this._4761,_2214._10787,_loc1_);
         this._5510.addEventListener(UIEvent.CREATION_COMPLETE,this._5483);
         this._5510.open();
         this._5510._5519._2581();
      }
      
      protected function _5483(param1:UIEvent) : void
      {
         _1567(new CommandNotification(CommandNotification.PLUGIN_CHECK_TYPE,_904.IMPORT));
      }
      
      public function _5499() : void
      {
         if(this._3717)
         {
            if(this._3717._5520)
            {
               this._5510._2633.text = this._5517 + this._3717._3668.dataFileDescription() + " (" + tr("Import.plugin.name",this._3717.name) + ")";
            }
            else
            {
               this._3717 = null;
               this._5510._2633.text = tr("Import.data.json");
               Alert.show(tr("Plugin.PluginDamaged"));
            }
         }
         else
         {
            this._5510._2633.text = tr("Import.data.json");
         }
      }
      
      public function _5506(param1:String) : *
      {
         var _loc2_:PluginModel = null;
         if(param1 == "")
         {
            return null;
         }
         if(this._5510)
         {
            this._5510._5518 = "";
         }
         for each(_loc2_ in this._5507)
         {
            if(_loc2_._3668.checkDataValid(param1))
            {
               this._3717 = _loc2_;
               if(this._5510)
               {
                  this._5510._5518 += this._5517 + _loc2_._3668.dataFileDescription() + " (" + tr("Import.plugin.name",_loc2_.name) + ")";
               }
               return _loc2_.name;
            }
         }
         this._3717 = null;
         return null;
      }
      
      private function _5509() : void
      {
         var _loc1_:PluginModel = null;
         var _loc2_:Array = null;
         var _loc3_:int = 0;
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         if(this._5510)
         {
            this._5510._5518 = "";
            this._5510._5489 = "";
            this._5510._5491 = "";
            this._5510._5485 = "";
            for each(_loc1_ in this._5507)
            {
               if(_loc1_._5520 && _loc1_._3668.dataFileDescription() != "")
               {
                  this._5510._5518 += "\n　　　　　　" + _loc1_._3668.dataFileDescription() + " (" + tr("Import.plugin.name",_loc1_.name) + ")";
                  this._5510._5489 += "," + _loc1_._3668.dataFileDescription();
                  _loc2_ = _loc1_._3668.dataFileExtension();
                  _loc3_ = 0;
                  while(_loc3_ < _loc2_.length)
                  {
                     this._5510._5491 += ";*." + _loc2_[_loc3_];
                     _loc3_++;
                  }
                  _loc4_ = _loc1_._3668.textureAtlasDataFileExtension();
                  _loc5_ = 0;
                  while(_loc5_ < _loc4_.length)
                  {
                     this._5510._5485 += ";*." + _loc4_[_loc5_];
                     _loc5_++;
                  }
               }
            }
         }
      }
      
      private function wrap() : String
      {
         if(SystemInfo.isMacOS)
         {
            return "\n";
         }
         return "\r\n";
      }
      
      private function onFail(param1:ImportEvent) : void
      {
         Alert.show(tr("Import.error.fail"));
         HashObject._1844 = this._5497;
      }
      
      private function _5513(param1:String) : void
      {
         Alert.show(param1);
         HashObject._1844 = this._5497;
      }
      
      private function _5516(param1:ImportEvent) : void
      {
         _1567(new CommandNotification(CommandNotification.IMPORT_PROJECT,param1.data));
      }
      
      public function _3283(param1:_722) : void
      {
         var _3287:_722 = param1;
         this._3713 = _3287;
         this._5497 = HashObject._1844;
         if(!this._3713._3271)
         {
            HashObject._1844 = this._3713._2871;
         }
         if(this._3713.projectName == null || this._3713.projectName == "")
         {
            this._5513(tr("Import.missProjectName"));
            return;
         }
         if(!FileUtil.exists(this._3713._3714))
         {
            this._5513(tr("Import.error.noFile"));
            return;
         }
         try
         {
            switch(this._3713.type)
            {
               case _722.TYPE_TEXTURE:
                  this._5503();
                  break;
               case _722.TYPE_ZIP:
                  this._3804();
                  break;
               case _722.TYPE_PNG:
                  this._5494();
                  break;
               case _722.TYPE_DBSWF:
                  this._5492();
                  break;
               case _722.TYPE_FILES:
                  this.importFiles();
                  break;
               default:
                  HashObject._1844 = this._5497;
            }
         }
         catch(e:Error)
         {
            _5513(e.message);
         }
      }
      
      private function _5503() : void
      {
         _779.instance._3276(_779.PARAM_V3,_773.UNPACK);
         this._3713._3717 = this._3717;
         var _loc1_:_123 = new _123();
         _513._3287 = this._3713;
         _loc1_._2389(new _514());
         _loc1_._2389(new _11498());
         _loc1_._2389(new _517());
         _loc1_._2389(new _511());
         _loc1_.addEventListener(_121.FAIL,this._5508);
         _loc1_.addEventListener(_121.COMPLETE,this._5498);
         _loc1_.run();
      }
      
      private function _3804() : void
      {
         _779.instance._3276(_779.PARAM_V3,_773.ZIP);
         _11110.instance._11131._11139(_11105.ImportData_DataType,_11105.DataFormat_ZIP);
         var _loc1_:_123 = new _123();
         _513._3287 = this._3713;
         _loc1_._2389(new LoadZipFileTask());
         _loc1_._2389(new _517());
         _loc1_._2389(new _511());
         _loc1_.addEventListener(_121.FAIL,this._5508);
         _loc1_.addEventListener(_121.COMPLETE,this._5498);
         _loc1_.run();
      }
      
      private function _5498(param1:_121) : void
      {
         param1.target.removeEventListener(_121.FAIL,this._5508);
         param1.target.removeEventListener(_121.COMPLETE,this._5498);
         this._5487(this._3713);
      }
      
      private function _5508(param1:_121) : void
      {
         param1.target.removeEventListener(_121.FAIL,this._5508);
         param1.target.removeEventListener(_121.COMPLETE,this._5498);
         switch(param1.data.type)
         {
            case ERROR_NO_DRAGONBONES_DATA:
            case ERROR_ZIP_DATA:
               Alert.show(tr("Notice.Nonsupport version!"));
               break;
            case ERROR_NO_TEXTURE_DATA:
               Alert.show(tr("Notice.Nonsupport version!"));
         }
      }
      
      private function _5494() : void
      {
         var pngByte:ByteArray;
         var pngName:String;
         var onImageComplete:Function = null;
         var depressData:_36 = null;
         var textureConfigBytes:ByteArray = null;
         var saveArr:Array = null;
         var _3818:_1318 = null;
         onImageComplete = function(param1:BitmapData):void
         {
            var bmpD:BitmapData = param1;
            var sheetConfigData:Object = _3713._5490;
            var _2762:Object = _3713._1717;
            var saveSpriteSheetPath:String = _3713._5493;
            var saveSpriteSheetConfigPath:String = _3713._5484;
            var textureAtlas:_37 = new _37(bmpD,sheetConfigData);
            try
            {
               _3713._3274 = _13488._1737(_2762,textureAtlas,saveSpriteSheetPath,saveSpriteSheetConfigPath,false);
               _5487(_3713);
            }
            catch(e:Error)
            {
               _5513(tr("Import.error.png"));
            }
         };
         _779.instance._3276(_779.PARAM_V3,_773.PNG);
         _11110.instance._11131._11139(_11105.ImportData_DataType,_11105.DataFormat_PNG);
         pngByte = FileUtil.openAsByteArray(this._3713._5500);
         pngName = FileUtil.getFileName(this._3713._5500);
         this._3713._5484 = this._3713._3727 + "texture.json";
         this._3713._5493 = this._3713._3727 + "texture.png";
         if(pngByte == null)
         {
            this._5513(tr("Import.error.png"));
         }
         else
         {
            try
            {
               depressData = _34._1768(pngByte);
               this._3713._1717 = depressData._1756;
               this._3713._5490 = depressData._1748;
               textureConfigBytes = new ByteArray();
               textureConfigBytes.writeUTFBytes(JSON.stringify(depressData._1748));
               saveArr = [];
               saveArr.push({
                  "path":this._3713._5484,
                  "content":textureConfigBytes,
                  "texture":true
               });
               saveArr.push({
                  "path":this._3713._5493,
                  "content":depressData._1841,
                  "texture":true
               });
               this._3713._3282 = saveArr;
               _3818 = new _1318();
               _3818.decode(depressData._1841,onImageComplete);
            }
            catch(e:Error)
            {
               _5513(tr("Import.error.png"));
            }
         }
      }
      
      private function _5492() : void
      {
         var swfByte:ByteArray;
         var swfName:String;
         var depressData:_36 = null;
         var textureConfigBytes:ByteArray = null;
         var saveArr:Array = null;
         var textureAtlas:_37 = null;
         _779.instance._3276(_779.PARAM_V3,_773.SWF);
         _11110.instance._11131._11139(_11105.ImportData_DataType,_11105.DataFormat_DBSWF);
         swfByte = FileUtil.openAsByteArray(this._3713._5500);
         swfName = FileUtil.getFileName(this._3713._5500);
         this._3713._5493 = this._3713._3727 + swfName + ".dbswf";
         if(swfByte == null)
         {
            this._5513(tr("Import.error.dbswf"));
         }
         else
         {
            try
            {
               depressData = _34._1768(swfByte);
               this._3713._1717 = depressData._1756;
               this._3713._5490 = depressData._1748;
               textureConfigBytes = new ByteArray();
               textureConfigBytes.writeUTFBytes(JSON.stringify(depressData._1748));
               saveArr = [];
               saveArr.push({
                  "path":this._3713._5493,
                  "content":swfByte
               });
               this._3713._3282 = saveArr;
               textureAtlas = new _37(new MovieClip(),this._3713._5490);
               this._3713._3274 = _13488._1769(this._3713._1717,textureAtlas,this._3713._5493,false);
               this._5487(this._3713);
            }
            catch(e:Error)
            {
               _5513(tr("Import.error.dbswf"));
            }
         }
      }
      
      private function importFiles() : void
      {
         var _loc2_:Object = null;
         var _loc3_:ByteArray = null;
         var _loc4_:String = null;
         var _loc5_:String = null;
         var _loc6_:String = null;
         var _loc7_:String = null;
         _779.instance._3276(_779.PARAM_V3,_773.UNPACK);
         var _loc1_:String = FileUtil.getExtension(this._3713._3714);
         switch(_loc1_.toLowerCase())
         {
            case XML_SUFFIX:
               _loc2_ = XML(FileUtil.openAsString(this._3713._3714));
               this.setData(_loc2_);
               break;
            case JSON_SUFFIX:
               if(this._3717)
               {
                  if(!this._3717._3668.checkDataValid(FileUtil.openAsString(this._3713._3714)))
                  {
                     Alert.show(tr("Notice.Nonsupport version!"));
                     return;
                  }
                  _loc4_ = FileUtil.openAsString(this._3713._3714);
                  _loc5_ = this._3717._3668.convertToDBData(_loc4_);
                  _loc2_ = JSON.parse(_loc5_);
               }
               else
               {
                  _loc2_ = JSON.parse(FileUtil.openAsString(this._3713._3714));
               }
               this.setData(_loc2_);
               break;
            case AMF3_SUFFIX:
               _loc3_ = FileUtil.openAsByteArray(this._3713._3714);
               _loc3_.uncompress();
               _loc2_ = _loc3_.readObject();
               this.setData(_loc2_);
               break;
            default:
               if(this._3717)
               {
                  if(!this._3717._3668.checkDataValid(FileUtil.openAsString(this._3713._3714)))
                  {
                     Alert.show(tr("Notice.Nonsupport version!"));
                     return;
                  }
                  _loc6_ = FileUtil.openAsString(this._3713._3714);
                  _loc7_ = this._3717._3668.convertToDBData(_loc6_);
                  _loc2_ = JSON.parse(_loc7_);
                  this.setData(_loc2_);
               }
               else
               {
                  Alert.show(tr("Notice.Nonsupport version!"));
               }
         }
      }
      
      public function _14551(param1:Object, param2:String, param3:String) : void
      {
         var skinFolderPath:String;
         var _13225:Array;
         var imageFileObj:Object;
         var armature:Object = null;
         var imagePath:String = null;
         var imageFile:File = null;
         var imageSavePath:String = null;
         var skin:Object = null;
         var slot:Object = null;
         var display:Object = null;
         var i:int = 0;
         var len:int = 0;
         var _1854:ByteArray = null;
         var data:Object = param1;
         var imgPath:String = param2;
         var library:String = param3;
         var importpsdVO:_722 = new _722();
         importpsdVO._3271 = true;
         importpsdVO.libraryPath = FileUtil.escapePath(library);
         importpsdVO.type = _722.TYPE_FILES;
         importpsdVO._5512 = FileUtil.escapePath(imgPath);
         skinFolderPath = importpsdVO._5512;
         _13225 = [];
         importpsdVO._1717 = data;
         imageFileObj = {};
         if(data)
         {
            for each(armature in data.armature)
            {
               for each(skin in armature.skin)
               {
                  for each(slot in skin.slot)
                  {
                     for each(display in slot.display)
                     {
                        if(_13225.indexOf(display.name) == -1)
                        {
                           if(data is XML)
                           {
                              _13225.push(display.@name);
                           }
                           else
                           {
                              _13225.push(display.name);
                           }
                        }
                     }
                  }
               }
            }
            if(skinFolderPath != null && skinFolderPath != "")
            {
               i = 0;
               len = int(_13225.length);
               while(i < len)
               {
                  imagePath = skinFolderPath + _13225[i] + ".png";
                  imageSavePath = imagePath;
                  imageFileObj[_13225[i]] = {"path":imageSavePath};
                  imageFile = new File(imagePath);
                  if(imageFile.exists)
                  {
                     _1854 = FileUtil.openAsByteArray(imagePath);
                     _1854.position = 0;
                     imageFileObj[_13225[i]].type = _1854.readMultiByte(4,"iso-8859-1");
                     _1854.position = 16;
                     imageFileObj[_13225[i]].width = _1854.readInt();
                     imageFileObj[_13225[i]].height = _1854.readInt();
                  }
                  i++;
               }
            }
            try
            {
               importpsdVO._3274 = _13488._1757(importpsdVO._1717,imageFileObj,false);
               _527.getInstance()._2376 = "";
               _1567(new CommandNotification(CommandNotification.IMPORT_PSD_PROJECT,importpsdVO));
            }
            catch(e:Error)
            {
               _5513(tr("Notice.Nonsupport version!"));
            }
         }
         else
         {
            this._5513(tr("Import.error.unknow"));
         }
      }
      
      private function setData(param1:Object) : void
      {
         var imageFileObj:Object;
         var armature:Object = null;
         var imagePath:String = null;
         var imageFile:File = null;
         var imageSavePath:String = null;
         var skin:Object = null;
         var slot:Object = null;
         var display:Object = null;
         var i:int = 0;
         var len:int = 0;
         var _1854:ByteArray = null;
         var data:Object = param1;
         var dataDirPath:String = FileUtil.getDirectory(this._3713._3714);
         var skinFolderPath:String = this._3713._5512;
         var saveDirPath:String = this._3713.outputPath;
         var _13225:Array = [];
         var saveArr:Array = [];
         this._3713._1717 = data;
         imageFileObj = {};
         if(data)
         {
            for each(armature in data.armature)
            {
               for each(skin in armature.skin)
               {
                  for each(slot in skin.slot)
                  {
                     for each(display in slot.display)
                     {
                        if(_13225.indexOf(display.name) == -1)
                        {
                           if(data is XML)
                           {
                              _13225.push(display.@name);
                           }
                           else if(display.path)
                           {
                              _13225.push(display.path);
                           }
                           else
                           {
                              _13225.push(display.name);
                           }
                        }
                     }
                  }
               }
            }
            if(skinFolderPath != null && skinFolderPath != "")
            {
               i = 0;
               len = int(_13225.length);
               while(i < len)
               {
                  imagePath = skinFolderPath + _13225[i] + ".png";
                  imageSavePath = this._3713._3727 + _13225[i] + ".png";
                  imageFileObj[_13225[i]] = {"path":imageSavePath};
                  imageFile = new File(imagePath);
                  if(imageFile.exists)
                  {
                     _1854 = FileUtil.openAsByteArray(imagePath);
                     _1854.position = 0;
                     imageFileObj[_13225[i]].type = _1854.readMultiByte(4,"iso-8859-1");
                     _1854.position = 16;
                     imageFileObj[_13225[i]].width = _1854.readInt();
                     imageFileObj[_13225[i]].height = _1854.readInt();
                     saveArr.push({
                        "path":imageSavePath,
                        "content":FileUtil.openAsByteArray(imagePath)
                     });
                  }
                  i++;
               }
            }
            try
            {
               this._3713._3282 = saveArr;
               this._3713._3274 = _13488._1757(this._3713._1717,imageFileObj,false);
               this._5487(this._3713);
            }
            catch(e:Error)
            {
               _5513(tr("Notice.Nonsupport version!"));
            }
         }
         else
         {
            this._5513(tr("Import.error.unknow"));
         }
      }
      
      public function _5488() : void
      {
         this._5482.bound = this._5510.nativeWindow.bounds;
      }
      
      private function _5487(param1:_722) : void
      {
         if(this._5515)
         {
            _1567(new CommandNotification(CommandNotification.IMPORT_PROJECT_NO_OPEN,param1));
            this._5515 = false;
         }
         else
         {
            _527.getInstance()._2376 = "";
            if(param1._3717)
            {
               if(Boolean(param1._3717.name) && param1._3717.name.indexOf("Cocos") != -1)
               {
                  _779.instance._3276(_779.PARAM_TYPE,_773.TYPE_COCOS);
                  _11110.instance._11131._11139(_11105.ImportData_DataType,_11105.DataType_Cocos);
               }
               else if(Boolean(param1._3717.name) && param1._3717.name.indexOf("Spine") != -1)
               {
                  _779.instance._3276(_779.PARAM_TYPE,_773.TYPE_SPINE);
                  _11110.instance._11131._11139(_11105.ImportData_DataType,_11105.DataType_Spine);
               }
               else
               {
                  _779.instance._3276(_779.PARAM_TYPE,param1._3717.name);
                  _11110.instance._11131._11139(_11105.ImportData_DataType,param1._3717.name);
               }
            }
            else
            {
               _779.instance._3276(_779.PARAM_TYPE,_773.TYPE_DB);
               _11110.instance._11131._11139(_11105.ImportData_DataType,_11105.DataType_DragonBones_JSON);
            }
            _779.instance._3276(_779.PARAM_DVER,this._3713._5496());
            _11110.instance._11131._11139(_11105.ImportData_DataVersion,this._3713._5496());
            _1567(new CommandNotification(CommandNotification.IMPORT_PROJECT,param1));
         }
      }
      
      private function get _5482() : _632
      {
         return _1407.getInstance(_632) as _632;
      }
      
      private function get _2861() : LibraryPanelController
      {
         return _1407.getInstance(LibraryPanelController) as LibraryPanelController;
      }
      
      public function _12635(param1:String) : void
      {
         var projectName:String;
         var _3280:String;
         var libraryPath:String;
         var projectPath:String;
         var savePath:String;
         var ext:String;
         var dataName:String = null;
         var dataFolder:String = null;
         var dataExt:String = null;
         var _3287:_722 = null;
         var path:String = param1;
         this._4761 = new _650();
         this._4761.addEventListener(ImportEvent.IMPORT_SUCCESS,this._5516);
         this._4761.addEventListener(ImportEvent.IMPORT_FAIL,this.onFail);
         projectName = FileUtil.getFileName(path);
         dataName = projectName;
         dataFolder = FileUtil.getDirectory(path);
         dataExt = FileUtil.getExtension(path);
         if(projectName == null || projectName == "")
         {
            projectName = _638.NEW_PROJECT_NAME;
         }
         _3280 = _2214._11701(projectName);
         projectName = _2214._11702(_3280,_3280);
         libraryPath = File.applicationStorageDirectory.resolvePath(_638.NEW_PROJECT_NAME + "/" + _3280 + "/library").nativePath;
         projectPath = FileUtil.escapePath(_2214._10787 + "/" + _3280);
         this._4761.projectName = projectName;
         this._4761.path = projectPath;
         _3287 = new _722();
         _3287._3271 = false;
         _3287.libraryPath = FileUtil.escapePath(libraryPath);
         savePath = FileUtil.escapePath(projectPath);
         savePath = FileUtil.escapePath(savePath);
         _3287.outputPath = savePath;
         ext = FileUtil.getExtension(path).toLowerCase();
         switch(ext)
         {
            case "zip":
               _3287.type = _722.TYPE_ZIP;
               _3287._3736 = path;
               this._4761._3283(_3287);
               break;
            case "json":
            default:
               this.callback = function():void
               {
                  _12693(path);
                  _3287.type = _722.TYPE_TEXTURE;
                  var _loc1_:Array = _7171(dataFolder,dataExt,dataName);
                  if(_loc1_)
                  {
                     _3287._3725 = _loc1_[0];
                     _3287._3724 = _loc1_[1];
                  }
                  _3287._3714 = path;
                  _4761._3283(_3287);
               };
               if(this._5486)
               {
                  this.callback();
                  this.callback = null;
               }
               else
               {
                  this._5505 = true;
                  _1567(new CommandNotification(CommandNotification.PLUGIN_CHECK_TYPE,_904.IMPORT));
               }
         }
      }
      
      private function _12693(param1:String) : void
      {
         var _loc2_:String = null;
         var _loc3_:Object = null;
         try
         {
            if(FileUtil.exists(param1))
            {
               _loc2_ = FileUtil.openAsString(param1);
               _loc3_ = JSON.parse(_loc2_);
               this._5506(JSON.stringify(_loc3_));
            }
         }
         catch(e:Error)
         {
         }
      }
      
      private function _7171(param1:String, param2:String, param3:String) : Array
      {
         var _loc7_:* = null;
         var _loc8_:String = null;
         var _loc9_:int = 0;
         param1 = FileUtil.escapePath(param1);
         var _loc4_:* = param3 + "_tex";
         var _loc5_:Array = [];
         var _loc6_:Array = [];
         if(this._3717)
         {
            if(this._3717._3668.isSupportTextureAtlas())
            {
               _loc7_ = this._7170(param1);
               if(_loc7_ != "")
               {
                  _loc8_ = this._7170(param1,false,FileUtil.getFileName(_loc7_));
               }
            }
            if(Boolean(_loc7_) && Boolean(_loc8_))
            {
               _loc5_.push(_loc7_);
               _loc6_.push(_loc8_);
               return [_loc5_,_loc6_];
            }
            return null;
         }
         _loc7_ = param1 + _loc4_ + ".png";
         if(FileUtil.exists(_loc7_))
         {
            _loc5_.push(_loc7_);
            _loc8_ = param1 + _loc4_ + "." + param2;
            if(FileUtil.exists(_loc8_))
            {
               _loc6_.push(_loc8_);
            }
         }
         else
         {
            _loc9_ = 0;
            _loc7_ = param1 + _loc4_ + "_" + _loc9_ + ".png";
            while(FileUtil.exists(_loc7_))
            {
               _loc5_.push(_loc7_);
               _loc8_ = param1 + _loc4_ + "_" + _loc9_ + "." + param2;
               if(FileUtil.exists(_loc8_))
               {
                  _loc6_.push(_loc8_);
               }
               _loc9_++;
               _loc7_ = param1 + _loc4_ + "_" + _loc9_ + ".png";
            }
         }
         if(_loc5_.length > 0 && _loc6_.length > 0)
         {
            return [_loc5_,_loc6_];
         }
         return null;
      }
      
      private function _7170(param1:String, param2:Boolean = true, param3:String = "") : String
      {
         var _loc7_:File = null;
         var _loc8_:String = null;
         var _loc4_:File = File.applicationDirectory.resolvePath(param1);
         var _loc5_:String = "";
         var _loc6_:Array = this._3717._3668.textureAtlasDataFileExtension();
         if(_loc4_.isDirectory)
         {
            for each(_loc7_ in _loc4_.getDirectoryListing())
            {
               if(!_loc7_.isDirectory)
               {
                  _loc5_ = FileUtil.getExtension(_loc7_.name);
                  if(param2)
                  {
                     if(_loc5_ == "png")
                     {
                        return _loc7_.nativePath;
                     }
                  }
                  else if(FileUtil.getFileName(_loc7_.name) == param3 && _loc5_ != "png")
                  {
                     for each(_loc8_ in _loc6_)
                     {
                        if(_loc5_ == _loc8_ || _loc8_ == "*")
                        {
                           return _loc7_.nativePath;
                        }
                     }
                  }
               }
            }
         }
         return "";
      }
   }
}

