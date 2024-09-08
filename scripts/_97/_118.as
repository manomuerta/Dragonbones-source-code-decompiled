package _97
{
   import egret.utils.FileUtil;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.filesystem.File;
   import flash.filesystem.FileMode;
   import flash.filesystem.FileStream;
   import flash.utils.ByteArray;
   
   public class _118
   {
      public function _118()
      {
         super();
      }
      
      public static function _2381(param1:String) : Boolean
      {
         var file:File = null;
         var path:String = param1;
         try
         {
            file = new File(path);
            file.nativePath;
            while(!file.exists)
            {
               file = file.parent;
               if(file == null)
               {
                  return false;
               }
            }
            return true;
         }
         catch(e:Error)
         {
            return false;
         }
      }
      
      public static function save(param1:String, param2:Object, param3:Boolean = true, param4:String = "", param5:Boolean = false, param6:Function = null, param7:Function = null) : void
      {
         var file:File = null;
         var fs:FileStream = null;
         var onSaveComplete:Function = null;
         var onSaveError:Function = null;
         var _2384:Function = null;
         var path:String = param1;
         var data:Object = param2;
         var deleteExist:Boolean = param3;
         var charSet:String = param4;
         var globalPath:Boolean = param5;
         var _2378:Function = param6;
         var _2379:Function = param7;
         onSaveComplete = function(param1:Event):void
         {
            fs.removeEventListener(Event.COMPLETE,onSaveComplete);
            fs.removeEventListener(IOErrorEvent.IO_ERROR,onSaveError);
            fs.removeEventListener(Event.CLOSE,_2384);
            if(_2378 != null)
            {
               _2378();
            }
         };
         onSaveError = function(param1:IOErrorEvent):void
         {
            fs.removeEventListener(Event.COMPLETE,onSaveComplete);
            fs.removeEventListener(IOErrorEvent.IO_ERROR,onSaveError);
            fs.removeEventListener(Event.CLOSE,_2384);
            fs.close();
            if(_2379 != null)
            {
               _2379();
            }
         };
         _2384 = function(param1:Event):void
         {
            fs.removeEventListener(Event.COMPLETE,onSaveComplete);
            fs.removeEventListener(IOErrorEvent.IO_ERROR,onSaveError);
            fs.removeEventListener(Event.CLOSE,_2384);
            if(_2378 != null)
            {
               _2378();
            }
            fs = null;
         };
         path = FileUtil.escapePath(path);
         if(globalPath)
         {
            try
            {
               file = new File(path);
            }
            catch(error:Error)
            {
               if(_2379 != null)
               {
                  _2379();
               }
            }
         }
         else
         {
            file = new File(File.applicationDirectory.resolvePath(path).nativePath);
         }
         if(deleteExist && Boolean(file.exists))
         {
            FileUtil.deletePath(file.nativePath);
         }
         if(file.isDirectory)
         {
            if(_2379 != null)
            {
               _2379();
            }
         }
         fs = new FileStream();
         try
         {
            fs.addEventListener(Event.COMPLETE,onSaveComplete);
            fs.addEventListener(IOErrorEvent.IO_ERROR,onSaveError);
            fs.addEventListener(Event.CLOSE,_2384);
            fs.openAsync(file,FileMode.WRITE);
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
            else if(data is XML)
            {
               fs.writeUTFBytes(data as XML);
            }
            else
            {
               fs.writeObject(data);
            }
            fs.close();
         }
         catch(e:Error)
         {
            fs.removeEventListener(Event.COMPLETE,onSaveComplete);
            fs.removeEventListener(IOErrorEvent.IO_ERROR,onSaveError);
            fs.removeEventListener(Event.CLOSE,_2384);
            fs.close();
            if(_2379 != null)
            {
               _2379();
            }
         }
      }
      
      public static function _2380(param1:String) : Array
      {
         var type:String = null;
         var ff:uint = 0;
         var d8:uint = 0;
         var _2376:String = param1;
         var _1854:ByteArray = FileUtil.openAsByteArray(_2376);
         if(_1854)
         {
            try
            {
               type = _1854.readMultiByte(4,"iso-8859-1");
               if(type.indexOf("PNG") >= 0)
               {
                  return _2382(_2376);
               }
               _1854.position = 0;
               ff = uint(_1854.readByte());
               d8 = uint(_1854.readByte());
               if(ff == 4294967295 && d8 == 4294967256)
               {
                  return _2383(_2376);
               }
            }
            catch(e:Error)
            {
               return null;
            }
         }
         return null;
      }
      
      public static function _2382(param1:String) : Array
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc2_:ByteArray = FileUtil.openAsByteArray(param1);
         _loc2_.position = 0;
         var _loc3_:String = _loc2_.readMultiByte(4,"iso-8859-1");
         if(_loc3_.indexOf("PNG") >= 0)
         {
            _loc2_.position = 16;
            _loc4_ = _loc2_.readInt();
            _loc5_ = _loc2_.readInt();
            return [_loc4_,_loc5_];
         }
         return null;
      }
      
      public static function _2383(param1:String) : Array
      {
         var _loc2_:ByteArray = FileUtil.openAsByteArray(param1);
         return _11094._11122(_loc2_);
      }
   }
}

