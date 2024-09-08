package egret.utils
{
   import flash.events.Event;
   import flash.events.FileListEvent;
   import flash.filesystem.File;
   import flash.filesystem.FileMode;
   import flash.filesystem.FileStream;
   import flash.system.Capabilities;
   import flash.utils.ByteArray;
   
   public class FileUtil
   {
      public function FileUtil()
      {
         super();
      }
      
      public static function save(param1:String, param2:Object, param3:Boolean = true, param4:String = "", param5:Boolean = false) : Boolean
      {
         var file:File = null;
         var fs:FileStream = null;
         var path:String = param1;
         var data:Object = param2;
         var deleteExist:Boolean = param3;
         var charSet:String = param4;
         var globalPath:Boolean = param5;
         path = escapePath(path);
         if(globalPath)
         {
            try
            {
               file = new File(path);
            }
            catch(error:Error)
            {
               return false;
            }
         }
         else
         {
            file = new File(File.applicationDirectory.resolvePath(path).nativePath);
         }
         if(deleteExist && Boolean(file.exists))
         {
            deletePath(file.nativePath);
         }
         if(file.isDirectory)
         {
            return false;
         }
         fs = new FileStream();
         try
         {
            fs.open(file,FileMode.WRITE);
            if(data is ByteArray)
            {
               fs.writeBytes(data as ByteArray);
            }
            else if(data is String)
            {
               if(charSet)
               {
                  fs.writeMultiByte(data as String,charSet);
               }
               else
               {
                  fs.writeUTFBytes(data as String);
               }
            }
            else
            {
               fs.writeObject(data);
            }
         }
         catch(e:Error)
         {
            fs.close();
            return false;
         }
         fs.close();
         return true;
      }
      
      public static function open(param1:String) : FileStream
      {
         var path:String = param1;
         path = escapePath(path);
         var file:File = new File(File.applicationDirectory.resolvePath(path).nativePath);
         var fs:FileStream = new FileStream();
         try
         {
            fs.open(file,FileMode.READ);
         }
         catch(e:Error)
         {
            return null;
         }
         return fs;
      }
      
      public static function checkAccess(param1:File) : Boolean
      {
         var fs:FileStream = null;
         var file:File = param1;
         try
         {
            fs = new FileStream();
            fs.open(file,FileMode.UPDATE);
            return true;
         }
         catch(error:Error)
         {
            return false;
         }
         finally
         {
            fs.close();
         }
      }
      
      public static function openAsByteArray(param1:String) : ByteArray
      {
         param1 = escapePath(param1);
         var _loc2_:FileStream = open(param1);
         if(!_loc2_)
         {
            return null;
         }
         _loc2_.position = 0;
         var _loc3_:ByteArray = new ByteArray();
         _loc2_.readBytes(_loc3_);
         _loc2_.close();
         return _loc3_;
      }
      
      public static function openAsString(param1:String, param2:String = "") : String
      {
         var _loc4_:String = null;
         param1 = escapePath(param1);
         var _loc3_:FileStream = open(param1);
         if(!_loc3_)
         {
            return "";
         }
         _loc3_.position = 0;
         if(!param2 || param2 == "utf-8")
         {
            _loc4_ = _loc3_.readUTFBytes(_loc3_.bytesAvailable);
         }
         else
         {
            _loc4_ = _loc3_.readMultiByte(_loc3_.bytesAvailable,param2);
         }
         _loc3_.close();
         return _loc4_;
      }
      
      public static function browseForOpen(param1:Function, param2:int = 1, param3:Array = null, param4:String = null, param5:String = "") : void
      {
         var file:File = null;
         var onSelect:Function = param1;
         var type:int = param2;
         var typeFilter:Array = param3;
         var title:String = param4;
         var defaultPath:String = param5;
         defaultPath = escapePath(defaultPath);
         if(!title)
         {
            title = tr("FileUtil.Browse");
         }
         if(defaultPath == "")
         {
            file = new File();
         }
         else
         {
            file = File.applicationDirectory.resolvePath(defaultPath);
         }
         switch(type)
         {
            case 1:
               file.addEventListener(Event.SELECT,function(param1:Event):void
               {
                  onSelect(param1.target as File);
               });
               file.browseForOpen(title,typeFilter);
               break;
            case 2:
               file.addEventListener(FileListEvent.SELECT_MULTIPLE,function(param1:FileListEvent):void
               {
                  onSelect(param1.files);
               });
               file.browseForOpenMultiple(title,typeFilter);
               break;
            case 3:
               file.addEventListener(Event.SELECT,function(param1:Event):void
               {
                  onSelect(param1.target as File);
               });
               file.browseForDirectory(title);
         }
      }
      
      public static function browseForSave(param1:Function, param2:String = null, param3:String = null, param4:Function = null) : void
      {
         var file:File = null;
         var onSelect:Function = param1;
         var defaultPath:String = param2;
         var title:String = param3;
         var onCancel:Function = param4;
         defaultPath = escapePath(defaultPath);
         if(Capabilities.os.indexOf("Mac OS 10.11") == 0)
         {
            defaultPath = FileUtil.getDirectory(defaultPath);
         }
         if(!title)
         {
            title = tr("FileUtil.Save");
         }
         if(defaultPath != null)
         {
            file = File.applicationDirectory.resolvePath(defaultPath);
         }
         else
         {
            file = new File();
         }
         file.addEventListener(Event.SELECT,function(param1:Event):void
         {
            onSelect(param1.target as File);
         });
         file.addEventListener(Event.CANCEL,function(param1:Event):void
         {
            if(onCancel != null)
            {
               onCancel();
            }
         });
         file.browseForSave(title);
      }
      
      public static function browseAndSave(param1:Object, param2:String = null, param3:String = null) : void
      {
         var file:File = null;
         var data:Object = param1;
         var defaultPath:String = param2;
         var title:String = param3;
         defaultPath = escapePath(defaultPath);
         if(Capabilities.os.indexOf("Mac OS 10.11") == 0)
         {
            defaultPath = FileUtil.getDirectory(defaultPath);
         }
         if(!title)
         {
            title = tr("FileUtil.Save");
         }
         if(defaultPath != null)
         {
            file = File.applicationDirectory.resolvePath(defaultPath);
         }
         else
         {
            file = new File();
         }
         file.addEventListener(Event.SELECT,function(param1:Event):void
         {
            save(file.nativePath,data);
         });
         file.browseForSave(title);
      }
      
      public static function moveTo(param1:String, param2:String, param3:Boolean = false) : Boolean
      {
         var file:File;
         var destFile:File;
         var source:String = param1;
         var dest:String = param2;
         var overwrite:Boolean = param3;
         source = escapePath(source);
         dest = escapePath(dest);
         if(source == dest)
         {
            return true;
         }
         if(source.toLowerCase() == dest.toLowerCase())
         {
            return false;
         }
         file = new File(File.applicationDirectory.resolvePath(source).nativePath);
         destFile = new File(File.applicationDirectory.resolvePath(dest).nativePath);
         if(destFile.exists)
         {
            deletePath(destFile.nativePath);
         }
         try
         {
            file.moveTo(destFile,overwrite);
         }
         catch(e:Error)
         {
            return false;
         }
         return true;
      }
      
      public static function totalCopyTo(param1:String, param2:String, param3:Boolean = false, param4:Function = null) : void
      {
         var _loc6_:Boolean = false;
         var _loc7_:Array = null;
         var _loc8_:Array = null;
         var _loc9_:int = 0;
         var _loc10_:File = null;
         var _loc11_:int = 0;
         param1 = escapePath(param1);
         param2 = escapePath(param2);
         var _loc5_:File = new File(param1);
         if(_loc5_.exists == false)
         {
            if(param4 != null)
            {
               param4(false);
            }
         }
         if(_loc5_.isDirectory == false)
         {
            if(param4 != null)
            {
               param4(copyTo(_loc5_.nativePath,param2,param3));
            }
         }
         else
         {
            _loc6_ = true;
            _loc7_ = search(param1);
            _loc8_ = [];
            _loc9_ = param1.length;
            param2 = param2.charAt(param2.length - 1) == "/" ? param2 : param2 + "/";
            for each(_loc10_ in _loc7_)
            {
               _loc8_.push(param2 + _loc10_.nativePath.substr(_loc9_));
            }
            _loc11_ = 0;
            while(_loc11_ < _loc7_.length)
            {
               _loc6_ = copyTo(_loc7_[_loc11_]["nativePath"],_loc8_[_loc11_],param3) && _loc6_;
               _loc11_++;
            }
            if(param4 != null)
            {
               param4(_loc6_);
            }
         }
      }
      
      public static function copyTo(param1:String, param2:String, param3:Boolean = false) : Boolean
      {
         var file:File;
         var destFile:File;
         var source:String = param1;
         var dest:String = param2;
         var overwrite:Boolean = param3;
         source = escapePath(source);
         dest = escapePath(dest);
         if(source == dest)
         {
            return true;
         }
         file = File.applicationDirectory.resolvePath(source);
         destFile = new File(File.applicationDirectory.resolvePath(dest).nativePath);
         if(destFile.exists)
         {
            deletePath(destFile.nativePath);
         }
         try
         {
            file.copyTo(destFile,overwrite);
         }
         catch(e:Error)
         {
            return false;
         }
         return true;
      }
      
      public static function deletePath(param1:String, param2:Boolean = false) : Boolean
      {
         var path:String = param1;
         var moveToTrash:Boolean = param2;
         path = escapePath(path);
         var file:File = new File(File.applicationDirectory.resolvePath(path).nativePath);
         if(moveToTrash)
         {
            try
            {
               file.moveToTrash();
            }
            catch(e:Error)
            {
               return false;
            }
         }
         else if(file.isDirectory)
         {
            try
            {
               file.deleteDirectory(true);
            }
            catch(e:Error)
            {
               return false;
            }
         }
         else
         {
            try
            {
               file.deleteFile();
            }
            catch(e:Error)
            {
               return false;
            }
         }
         return true;
      }
      
      public static function getDirectory(param1:String) : String
      {
         var _loc2_:File = null;
         try
         {
            _loc2_ = new File(param1);
            return escapePath(_loc2_.parent.nativePath);
         }
         catch(error:Error)
         {
         }
         return "";
      }
      
      public static function getModificationDate(param1:String) : Number
      {
         var _loc2_:File = null;
         param1 = escapePath(param1);
         try
         {
            _loc2_ = new File(param1);
         }
         catch(error:Error)
         {
         }
         if(_loc2_ && _loc2_.exists && Boolean(_loc2_.modificationDate))
         {
            return _loc2_.modificationDate.time;
         }
         return -1;
      }
      
      public static function getCreationDate(param1:String) : Number
      {
         var _loc2_:File = null;
         param1 = escapePath(param1);
         try
         {
            _loc2_ = new File(param1);
         }
         catch(error:Error)
         {
         }
         if(_loc2_ && _loc2_.exists && Boolean(_loc2_.modificationDate))
         {
            return _loc2_.creationDate.time;
         }
         return -1;
      }
      
      public static function getExtension(param1:String) : String
      {
         param1 = escapeUrl(param1);
         var _loc2_:int = int(param1.lastIndexOf("."));
         if(_loc2_ == -1)
         {
            return "";
         }
         var _loc3_:int = int(param1.lastIndexOf("/"));
         if(_loc3_ > _loc2_)
         {
            return "";
         }
         return param1.substring(_loc2_ + 1);
      }
      
      public static function getFileNameWithSuffix(param1:String) : String
      {
         if(param1 == null || param1 == "")
         {
            return "";
         }
         param1 = FileUtil.escapePath(param1);
         var _loc2_:int = int(param1.lastIndexOf("/"));
         _loc2_ = int(param1.lastIndexOf("/"));
         if(_loc2_ > 0 && _loc2_ == param1.length - 1)
         {
            param1 = param1.substring(0,param1.length - 1);
            _loc2_ = int(param1.lastIndexOf("/"));
            return param1.substring(_loc2_ + 1);
         }
         return param1.substring(_loc2_ + 1);
      }
      
      public static function getFileName(param1:String) : String
      {
         var _loc3_:int = 0;
         if(param1 == null || param1 == "")
         {
            return "";
         }
         param1 = escapePath(param1);
         var _loc2_:int = int(param1.lastIndexOf("/"));
         if(_loc2_ > 0 && _loc2_ == param1.length - 1)
         {
            param1 = param1.substring(0,param1.length - 1);
            _loc2_ = int(param1.lastIndexOf("/"));
            _loc3_ = param1.length;
            return param1.substring(_loc2_ + 1,_loc3_);
         }
         _loc3_ = int(param1.lastIndexOf("."));
         if(_loc3_ <= _loc2_)
         {
            _loc3_ = param1.length;
         }
         return param1.substring(_loc2_ + 1,_loc3_);
      }
      
      public static function search(param1:String, param2:String = null, param3:Function = null) : Array
      {
         param1 = escapePath(param1);
         var _loc4_:File = File.applicationDirectory.resolvePath(param1);
         var _loc5_:Array = [];
         if(!_loc4_.isDirectory || Boolean(_loc4_.isSymbolicLink))
         {
            return _loc5_;
         }
         param2 = !!param2 ? param2.toLowerCase() : "";
         findFiles(_loc4_,_loc5_,param2,param3);
         return _loc5_;
      }
      
      private static function findFiles(param1:File, param2:Array, param3:String = null, param4:Function = null) : void
      {
         var _loc6_:File = null;
         var _loc5_:Array = param1.getDirectoryListing();
         for each(_loc6_ in _loc5_)
         {
            if(Boolean(_loc6_.isDirectory) && !_loc6_.isSymbolicLink)
            {
               if(param4 != null)
               {
                  if(param4(_loc6_))
                  {
                     findFiles(_loc6_,param2,param3,param4);
                  }
               }
               else
               {
                  findFiles(_loc6_,param2,param3,param4);
               }
            }
            else if(param4 != null)
            {
               if(param4(_loc6_))
               {
                  param2.push(_loc6_);
               }
            }
            else if(param3)
            {
               if(Boolean(_loc6_.extension) && _loc6_.extension.toLowerCase() == param3)
               {
                  param2.push(_loc6_);
               }
            }
            else
            {
               param2.push(_loc6_);
            }
         }
      }
      
      public static function url2Path(param1:String) : String
      {
         param1 = escapePath(param1);
         var _loc2_:File = File.applicationDirectory.resolvePath(param1);
         return escapeUrl(_loc2_.nativePath);
      }
      
      public static function path2Url(param1:String) : String
      {
         param1 = escapePath(param1);
         return File.applicationDirectory.resolvePath(param1).url;
      }
      
      public static function exists(param1:String) : Boolean
      {
         param1 = escapePath(param1);
         var _loc2_:File = File.applicationDirectory.resolvePath(param1);
         return _loc2_.exists;
      }
      
      public static function escapePath(param1:String) : String
      {
         var _loc2_:File = null;
         var _loc3_:String = null;
         if(!param1)
         {
            return "";
         }
         if(param1.indexOf("file:") == 0)
         {
            try
            {
               _loc2_ = new File();
               _loc2_.url = param1;
               param1 = _loc2_.nativePath;
            }
            catch(e:Error)
            {
            }
         }
         try
         {
            _loc2_ = new File(param1);
            if(_loc2_.exists)
            {
               if(_loc2_.isDirectory)
               {
                  param1 = _loc2_.nativePath + File.separator;
               }
            }
            else
            {
               _loc3_ = getExtension(param1);
               if(!_loc3_)
               {
                  param1 = _loc2_.nativePath + File.separator;
               }
            }
         }
         catch(e:Error)
         {
         }
         return param1.split("\\").join("/");
      }
      
      public static function escapeUrl(param1:String) : String
      {
         return Boolean(!param1) ? "" : param1.split("\\").join("/");
      }
   }
}

