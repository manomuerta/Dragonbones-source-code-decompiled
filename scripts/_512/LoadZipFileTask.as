package _512
{
   import _11106._11105;
   import _11111._11110;
   import _35._34;
   import _35._38;
   import _625._627;
   import _772._773;
   import _777._779;
   import _97._101;
   import egret.utils.FileUtil;
   import flash.geom.Rectangle;
   import flash.utils.ByteArray;
   import zero.zip.Zip;
   import zero.zip.ZipFile;
   
   public class LoadZipFileTask extends _513
   {
      private var _3615:Object;
      
      private var _3733:Object;
      
      private var _3735:Boolean;
      
      public function LoadZipFileTask()
      {
         this._3615 = {};
         this._3733 = {};
         super();
      }
      
      override public function run() : void
      {
         var fileArr:Vector.<ZipFile> = null;
         var entry:ZipFile = null;
         var fileNames:Array = null;
         var fileName:String = null;
         var fileSuffix:String = null;
         var textureName:String = null;
         var _1756:ByteArray = null;
         var _1854:ByteArray = null;
         var textureConfigData:ByteArray = null;
         var isDragonBonesJson:Boolean = false;
         var isTextureConfigJson:Boolean = false;
         var textureFileName:String = null;
         var textureConfigFileName:String = null;
         var fileBytes:ByteArray = null;
         var fileObj:Object = null;
         var i:int = 0;
         var len:int = 0;
         var zipFile:Zip = null;
         var imageInfo:Object = null;
         var pngName:String = null;
         var textureFolderIndex:int = 0;
         var savedImage:Array = null;
         var zipByte:ByteArray = FileUtil.openAsByteArray(_3287._3736);
         var importName:String = FileUtil.getFileName(_3287._3736);
         if(zipByte == null)
         {
            fail(_627.ERROR_ZIP_DATA);
         }
         else
         {
            if(_3287._3712 == null)
            {
               _3287._3712 = {};
            }
            if(_3287._3282 == null)
            {
               _3287._3282 = [];
            }
            try
            {
               zipFile = new Zip();
               zipFile.decode(zipByte);
            }
            catch(e:Error)
            {
               _11110.instance._11204._11132("LoadZipFileTask::run",e);
               fail(_627.ERROR_ZIP_DATA);
               return;
            }
            fileArr = zipFile.fileV;
            i = 0;
            len = int(fileArr.length);
            for(; i < len; i++)
            {
               entry = fileArr[i];
               fileNames = entry.name.split(".");
               fileSuffix = fileNames.pop();
               fileName = fileNames.join(".");
               fileBytes = entry.data;
               if(entry.isDirectory)
               {
                  continue;
               }
               switch(fileSuffix.toLowerCase())
               {
                  case _627.PNG_SUFFIX:
                     _1854 = fileBytes;
                     imageInfo = {};
                     imageInfo.data = _1854;
                     _1854.position = 0;
                     imageInfo.type = _1854.readMultiByte(4,"iso-8859-1");
                     _1854.position = 16;
                     imageInfo.width = _1854.readInt();
                     imageInfo.height = _1854.readInt();
                     pngName = entry.name;
                     textureFolderIndex = int(pngName.indexOf("texture/"));
                     if(textureFolderIndex != -1)
                     {
                        pngName = pngName.substr(textureFolderIndex + 8);
                     }
                     imageInfo.name = pngName;
                     this._3615[fileName] = imageInfo;
                     _1854.position = 0;
                     break;
                  case _627.JSON_SUFFIX:
                     fileObj = JSON.parse(fileBytes.toString());
                     this._3734(fileObj,entry.name,entry.data,fileName,fileSuffix);
                     break;
                  case _627.XML_SUFFIX:
                     fileObj = XML(fileBytes.toString());
                     this._3734(fileObj,entry.name,entry.data,fileName,fileSuffix);
                     break;
                  case _627.AMF3_SUFFIX:
                     fileBytes.uncompress();
                     fileObj = fileBytes.readObject();
                     this._3734(fileObj,entry.name,entry.data,fileName,fileSuffix);
                     break;
               }
            }
         }
         if(_3287._1717 == null)
         {
            fail(_627.ERROR_ZIP_DATA);
            return;
         }
         savedImage = [];
         if(this._3735)
         {
            for(fileName in this._3733)
            {
               if(this._3615[fileName] != null)
               {
                  this._3732(this._3733[fileName],this._3615[fileName]);
                  savedImage.push(fileName);
               }
            }
            _779.instance._3276(_779.PARAM_V4,_773.TEXTURE);
            _11110.instance._11131._11139(_11105.ImportData_TextureType,_11105.TextureType_TextureAtlas);
         }
         else
         {
            _779.instance._3276(_779.PARAM_V4,_773.IMAGES);
            _11110.instance._11131._11139(_11105.ImportData_TextureType,_11105.TextureType_Images);
         }
         for(fileName in this._3615)
         {
            if(savedImage.indexOf(fileName) == -1)
            {
               this._3731(this._3615[fileName].name,this._3615[fileName].data);
            }
         }
         complete();
      }
      
      private function _3734(param1:Object, param2:String, param3:ByteArray, param4:String, param5:String) : void
      {
         var _loc6_:Boolean = false;
         var _loc7_:Boolean = false;
         var _loc8_:XML = null;
         var _loc9_:XML = null;
         if(param1 is XML)
         {
            var _loc10_:int = 0;
            var _loc11_:* = param1[_101.SUB_TEXTURE];
            for each(_loc8_ in _loc11_)
            {
               _loc6_ = true;
            }
            if(!_loc6_)
            {
               _loc10_ = 0;
               _loc11_ = param1[_101.ARMATURE];
               for each(_loc9_ in _loc11_)
               {
                  _loc7_ = true;
               }
            }
         }
         else if(param1[_101.ARMATURE])
         {
            _loc7_ = true;
         }
         else if(param1[_101.SUB_TEXTURE])
         {
            _loc6_ = true;
         }
         if(_loc7_)
         {
            _3287._1717 = param1;
         }
         else if(_loc6_)
         {
            this._3735 = true;
            this._3728(param4,param1);
            this._3733[param4] = {
               "name":param2,
               "data":param3
            };
         }
      }
      
      private function _3732(param1:Object, param2:Object) : void
      {
         var _loc3_:String = _3287._3727;
         _3287._3282.push({
            "path":_loc3_ + param2.name,
            "content":param2.data,
            "texture":true
         });
         _3287._3282.push({
            "path":_loc3_ + param1.name,
            "content":param1.data,
            "texture":true
         });
      }
      
      private function _3731(param1:String, param2:ByteArray) : void
      {
         var _loc3_:String = _3287._3727;
         _3287._3282.push({
            "path":_loc3_ + param1,
            "content":param2
         });
      }
      
      private function _3728(param1:String, param2:Object) : void
      {
         var _loc4_:_38 = null;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:String = null;
         var _loc8_:Rectangle = null;
         var _loc3_:Object = _34._1720(param2);
         for(_loc7_ in _loc3_)
         {
            _loc4_ = _loc3_[_loc7_] as _38;
            if(_loc4_)
            {
               _loc8_ = _loc4_.frame;
               if(_loc8_ == null)
               {
                  _loc8_ = _loc4_.region;
               }
               _loc5_ = _loc8_.width;
               _loc6_ = _loc8_.height;
               if(isNaN(_loc5_))
               {
                  _loc5_ = 0;
               }
               if(isNaN(_loc6_))
               {
                  _loc6_ = 0;
               }
               _3287._3712[_loc7_] = {
                  "width":_loc5_,
                  "height":_loc6_,
                  "path":param1 + "@" + _loc7_
               };
            }
         }
      }
   }
}

