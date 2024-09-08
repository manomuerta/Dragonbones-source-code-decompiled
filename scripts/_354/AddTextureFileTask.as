package _354
{
   import _1021._1020;
   import _11111._11110;
   import _120._119;
   import _51._50;
   import _51._70;
   import _51._71;
   import _51._79;
   import _97._124;
   import egret.utils.FileUtil;
   import egret.utils.tr;
   import flash.filesystem.File;
   import flash.filesystem.FileMode;
   import flash.filesystem.FileStream;
   import flash.utils.ByteArray;
   
   public class AddTextureFileTask extends _119
   {
      public static const TYPE_CUSTOME:int = 0;
      
      public static const TYPE_RENAME:int = 1;
      
      public static const TYPE_REPLACE:int = 2;
      
      public static const TYPE_ABANDON:int = 3;
      
      public static var type:int = 0;
      
      private var _3254:_71;
      
      private var _3262:String;
      
      private var _3259:ByteArray;
      
      private var _3268:String;
      
      private var _3266:ByteArray;
      
      private var _3258:String;
      
      private var _3257:String;
      
      private var _3261:String;
      
      private var _3265:String;
      
      private var _3260:String;
      
      private var _3264:File;
      
      private var _3269:ByteArray;
      
      public function AddTextureFileTask(param1:String, param2:ByteArray, param3:String, param4:ByteArray, param5:_71)
      {
         super();
         this._3254 = param5;
         this._3262 = param1;
         this._3259 = param2;
         this._3268 = param3;
         this._3266 = param4;
      }
      
      override public function run() : void
      {
         this._3258 = FileUtil.getFileName(this._3262);
         this._3261 = FileUtil.getExtension(this._3262);
         this._3260 = FileUtil.getDirectory(this._3262);
         this._3265 = FileUtil.getExtension(this._3268);
         this._3257 = _124._1747(this._3258,this._3256);
         if(this._3257 != this._3258)
         {
            this._3264 = new File(this._3262);
            this._3269 = this._3259;
            this.addFile(type);
         }
         else
         {
            this.saveFile();
            complete();
         }
      }
      
      private function _3256(param1:String) : Boolean
      {
         return FileUtil.exists(this._3260 + param1 + "." + this._3261) || FileUtil.exists(this._3260 + param1 + "." + this._3265);
      }
      
      private function saveFile() : void
      {
         var file:File = null;
         var fileStream:FileStream = null;
         var configfile:File = null;
         var configFileStream:FileStream = null;
         try
         {
            file = File.documentsDirectory.resolvePath(this._3260 + this._3257 + "." + this._3261);
            fileStream = new FileStream();
            fileStream.open(file,FileMode.WRITE);
            fileStream.writeBytes(this._3259);
            fileStream.close();
            configfile = File.documentsDirectory.resolvePath(this._3260 + this._3257 + "." + this._3265);
            configFileStream = new FileStream();
            configFileStream.open(configfile,FileMode.WRITE);
            configFileStream.writeBytes(this._3266);
            configFileStream.close();
         }
         catch(e:Error)
         {
            _11110.instance._11204._11132("AddTextureFileTask::saveFile",e);
            fail(tr("Export.error.saveFile"),null);
         }
      }
      
      private function addFile(param1:int) : void
      {
         switch(param1)
         {
            case TYPE_CUSTOME:
               this._3253(this.addFile);
               break;
            case TYPE_ABANDON:
               complete();
               break;
            case TYPE_RENAME:
               this._3255();
               this.modifyConfig();
               this.saveFile();
               complete();
               break;
            case TYPE_REPLACE:
               this._3257 = this._3258;
               this.saveFile();
               complete();
         }
      }
      
      private function _3253(param1:Function) : void
      {
         var _loc2_:_1020 = null;
         if(type == TYPE_CUSTOME)
         {
            --AddImageFileTask.num;
            _loc2_ = new _1020();
            _loc2_.setData(_1020.TYPE_TEXTURE,this._3258,this._3257,this._3260,this._3264,this._3269,AddImageFileTask.num,param1);
            _loc2_.open();
         }
         else
         {
            param1(type);
         }
      }
      
      private function _3255() : void
      {
         var _loc1_:_50 = null;
         var _loc2_:_79 = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:_70 = null;
         var _loc8_:Array = null;
         var _loc9_:String = null;
         var _loc10_:Array = null;
         var _loc3_:int = 0;
         var _loc4_:int = int(this._3254._2126.length);
         while(_loc3_ < _loc4_)
         {
            _loc1_ = this._3254._2126[_loc3_];
            _loc5_ = 0;
            _loc6_ = int(_loc1_._1780.length);
            while(_loc5_ < _loc6_)
            {
               _loc2_ = _loc1_._1780[_loc5_];
               for each(_loc7_ in _loc2_._1765)
               {
                  if(_loc7_.textureName)
                  {
                     _loc8_ = _loc7_.textureName.split("/");
                     if(_loc8_[_loc8_.length - 1] == this._3258)
                     {
                        _loc8_[_loc8_.length - 1] = this._3257;
                        _loc9_ = _loc8_.join("/");
                        _loc10_ = _loc7_.path.split("@");
                        if(_loc10_.length == 2)
                        {
                           _loc7_.changePath(_loc9_ + "@" + _loc10_[1]);
                        }
                     }
                  }
               }
               _loc5_++;
            }
            _loc3_++;
         }
      }
      
      private function modifyConfig() : void
      {
         var jsonObj:Object = null;
         var jsonByte:ByteArray = null;
         var xmlObj:XML = null;
         var xmlByte:ByteArray = null;
         var amfObj:Object = null;
         var amfByte:ByteArray = null;
         try
         {
            switch(this._3265.toLowerCase())
            {
               case "json":
                  this._3266.position = 0;
                  jsonObj = JSON.parse(this._3266.readUTFBytes(this._3266.length));
                  jsonObj.imagePath = this._3257 + "." + this._3261;
                  jsonByte = new ByteArray();
                  jsonByte.writeUTFBytes(JSON.stringify(jsonObj));
                  this._3266 = jsonByte;
                  break;
               case "amf3":
                  try
                  {
                     this._3266.position = 0;
                     amfObj = this._3266.readObject();
                  }
                  catch(e:Error)
                  {
                     _3266.position = 0;
                     _3266.uncompress();
                     amfObj = _3266.readObject();
                  }
                  if(amfObj != null)
                  {
                     amfObj.imagePath = this._3257 + "." + this._3261;
                     amfByte = new ByteArray();
                     amfByte.writeObject(amfObj);
                     this._3266 = amfByte;
                  }
                  break;
               case "xml":
                  this._3266.position = 0;
                  xmlObj = XML(this._3266.readUTFBytes(this._3266.length));
                  xmlObj.@imagePath = this._3257 + "." + this._3261;
                  xmlByte = new ByteArray();
                  xmlByte.writeUTFBytes(xmlObj);
                  this._3266 = xmlByte;
            }
         }
         catch(e:Error)
         {
            _11110.instance._11204._11132("AddTextureFileTask::modifyConfig",e);
            fail(e.message,null);
         }
      }
   }
}

