package _512
{
   import _35._34;
   import _35._38;
   import _521._527;
   import _625._627;
   import _648.PluginModel;
   import egret.utils.FileUtil;
   import flash.geom.Rectangle;
   import flash.utils.ByteArray;
   
   public class _11498 extends _513
   {
      public function _11498()
      {
         super();
      }
      
      override public function run() : void
      {
         var _loc3_:String = null;
         var _loc4_:String = null;
         var _loc5_:Object = null;
         if(_3287._3282 == null)
         {
            _3287._3282 = [];
         }
         if(_3287._3712 == null)
         {
            _3287._3712 = {};
         }
         var _loc1_:int = 0;
         var _loc2_:int = int(_3287._3724.length);
         while(_loc1_ < _loc2_)
         {
            _loc3_ = _3287._3724[_loc1_];
            _loc4_ = this._3730(_loc3_);
            if(_loc4_)
            {
               _loc5_ = this._3726(_loc3_);
               if(_loc5_)
               {
                  _527.getInstance()._2377("Finish:: TextureConfig:" + _loc3_);
                  this._3728(_loc3_,_loc5_);
                  this._3729(_loc3_,_loc5_,_loc4_);
               }
               else
               {
                  _527.getInstance()._2377("Error:: TextureConfig:" + _loc3_);
                  fail(_627.ERROR_NO_TEXTURE_DATA);
               }
            }
            _loc1_++;
         }
         complete();
      }
      
      private function _3728(param1:String, param2:Object) : void
      {
         var _loc5_:_38 = null;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:String = null;
         var _loc9_:Rectangle = null;
         var _loc3_:String = FileUtil.getFileName(param1);
         var _loc4_:Object = _34._1720(param2);
         for(_loc8_ in _loc4_)
         {
            _loc5_ = _loc4_[_loc8_] as _38;
            if(_loc5_)
            {
               _loc9_ = _loc5_.frame;
               if(_loc9_ == null)
               {
                  _loc9_ = _loc5_.region;
               }
               _loc6_ = _loc9_.width;
               _loc7_ = _loc9_.height;
               if(isNaN(_loc6_))
               {
                  _loc6_ = 0;
               }
               if(isNaN(_loc7_))
               {
                  _loc7_ = 0;
               }
               _3287._3712[_loc8_] = {
                  "width":_loc6_,
                  "height":_loc7_,
                  "path":_loc3_ + "@" + _loc8_
               };
            }
         }
      }
      
      private function _3730(param1:String) : String
      {
         var _loc2_:int = param1.lastIndexOf(".") + 1;
         var _loc3_:* = param1.substring(0,_loc2_);
         _loc3_ += "png";
         if(_3287._3725.indexOf(_loc3_) != -1)
         {
            return _loc3_;
         }
         return null;
      }
      
      private function _3729(param1:String, param2:Object, param3:String) : void
      {
         var _loc4_:String = FileUtil.getFileNameWithSuffix(param3);
         var _loc5_:String = _3287._3727;
         _3287._3282.push({
            "path":_loc5_ + _loc4_,
            "content":FileUtil.openAsByteArray(param3),
            "texture":true
         });
         var _loc6_:String = FileUtil.getFileName(param1);
         var _loc7_:ByteArray = new ByteArray();
         if(param2 is XML)
         {
            _loc7_.writeUTFBytes(XML(param2));
            _3287._3282.push({
               "path":_loc5_ + _loc6_ + ".xml",
               "content":_loc7_,
               "texture":true
            });
         }
         else
         {
            _loc7_.writeUTFBytes(JSON.stringify(param2));
            _3287._3282.push({
               "path":_loc5_ + _loc6_ + ".json",
               "content":_loc7_,
               "texture":true
            });
         }
      }
      
      private function _3731(param1:String) : void
      {
         var _loc2_:String = FileUtil.getFileNameWithSuffix(param1);
         var _loc3_:String = _3287._3727;
         _3287._3282.push({
            "path":_loc3_ + _loc2_,
            "content":FileUtil.openAsByteArray(param1)
         });
      }
      
      private function _3726(param1:String) : Object
      {
         var data:Object = null;
         var bytes:ByteArray = null;
         var dataStrs:String = null;
         var dataTranss:String = null;
         var path:String = param1;
         var extension:String = FileUtil.getExtension(path);
         extension = extension.toLowerCase();
         var _3717:PluginModel = _3287._3717;
         switch(extension.toLowerCase())
         {
            case _627.XML_SUFFIX:
               data = XML(FileUtil.openAsString(path));
               break;
            case _627.JSON_SUFFIX:
               if(_3717)
               {
                  data = JSON.parse(_3717._3668.convertToDBTextureAtlasData(FileUtil.openAsString(path)));
               }
               else
               {
                  data = JSON.parse(FileUtil.openAsString(path));
               }
               break;
            case _627.AMF3_SUFFIX:
               bytes = FileUtil.openAsByteArray(path);
               bytes.uncompress();
               data = bytes.readObject();
               break;
            default:
               if(_3717)
               {
                  dataStrs = FileUtil.openAsString(path);
                  dataTranss = _3717._3668.convertToDBTextureAtlasData(dataStrs);
                  data = JSON.parse(dataTranss);
               }
         }
         try
         {
            if(isNaN(data["SubTexture"][0]["x"]) && isNaN(data["SubTexture"][0]["y"]) && isNaN(data["SubTexture"][0]["width"]) && isNaN(data["SubTexture"][0]["height"]))
            {
               data = null;
            }
         }
         catch(error:Error)
         {
            data = null;
         }
         return data;
      }
   }
}

