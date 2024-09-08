package _12454
{
   import _721._720;
   import egret.utils.FileUtil;
   
   public class _12455
   {
      public var projectpath:String;
      
      public var outputpath:String;
      
      public var outputsetting:String;
      
      public var type:int = 0;
      
      public var target:String;
      
      public var datatype:String;
      
      public var dataversion:String;
      
      public var scale:Number = 1;
      
      public var bgcolor:int = -1;
      
      public var packagetexture:String = "true";
      
      public var texturesetting:String;
      
      public var exportdata:String = "true";
      
      public var exportexture:String = "true";
      
      public var packagezip:String = "false";
      
      public var imgformat:String = "PNG";
      
      public var aniname:String;
      
      public var frame:int = 0;
      
      public var fps:int = 0;
      
      public var stripWhitespace:Boolean = true;
      
      public var allowRotation:Boolean = false;
      
      public var paddingX:int = 2;
      
      public var paddingY:int = 2;
      
      public var duplicatePadding:Boolean = false;
      
      public var powerofTwo:Boolean = true;
      
      public var square:Boolean = false;
      
      public var backgroundColor:String;
      
      public var maxSize:Object;
      
      public var heuristics:int;
      
      public var hasTextureConfig:Boolean = false;
      
      public var callback:String;
      
      private var _12553:Array;
      
      public function _12455(param1:Object)
      {
         var a:String = null;
         var textureSettingStr:String = null;
         var textureSettingObj:Object = null;
         var i:int = 0;
         var len:int = 0;
         var p:String = null;
         var obj:Object = param1;
         this.ANTI_OBFUSCATION = ["projectpath","outputpath","outputsetting","type","target","datatype","dataversion","scale","bgcolor","packagetexture","texturesetting","exportdata","exportexture","packagezip","imgformat","aniname","frame","fps","stripWhitespace","allowRotation","paddingX","paddingY","duplicatePadding","powerofTwo","square","backgroundColor","maxSize","heuristics","hasTextureConfig","callback","dragging"];
         this._12553 = ["stripWhitespace","allowRotation","paddingX","paddingY","duplicatePadding","powerofTwo","square","backgroundColor","maxSize","scale","heuristics"];
         super();
         if(obj)
         {
            for(a in obj)
            {
               if(Object(this).hasOwnProperty(a))
               {
                  this[a] = obj[a];
               }
            }
         }
         if(this.exportSuperType == _720.SUPERTYPE_IMAGE && obj.packagetexture == null)
         {
            this.packagetexture = "false";
         }
         this.scale = this.scale || 1;
         if(this.texturesetting != null)
         {
            try
            {
               textureSettingStr = FileUtil.openAsString(this.texturesetting);
               textureSettingObj = JSON.parse(textureSettingStr);
               if(textureSettingObj)
               {
                  i = 0;
                  len = int(this._12553.length);
                  while(i < len)
                  {
                     p = this._12553[i];
                     if(textureSettingObj.hasOwnProperty(p))
                     {
                        this[p] = textureSettingObj[p];
                        this.hasTextureConfig = true;
                     }
                     i++;
                  }
                  if(this.paddingX < 0)
                  {
                     this.paddingX = 2;
                  }
                  if(this.paddingY < 0)
                  {
                     this.paddingY = 2;
                  }
                  if(this.scale <= 0)
                  {
                     this.scale = 1;
                  }
                  if(this.heuristics < 0 || this.heuristics > 4)
                  {
                     this.heuristics = 0;
                  }
                  if(this.backgroundColor != null)
                  {
                     if(this.backgroundColor.indexOf("0x") == 0)
                     {
                        this.bgcolor = uint(this.backgroundColor);
                     }
                     else
                     {
                        this.bgcolor = -1;
                     }
                  }
               }
            }
            catch(e:Error)
            {
               return;
            }
         }
      }
      
      public function get exportSuperType() : int
      {
         if(this.type == 0)
         {
            return _720.SUPERTYPE_DATA;
         }
         if(this.type == 1 || this.type == 2)
         {
            return _720.SUPERTYPE_IMAGE;
         }
         if(this.type == 3)
         {
            return _720.SUPERTYPE_HTML;
         }
         return _720.SUPERTYPE_DATA;
      }
      
      public function get imageFormat() : int
      {
         if(this.imgformat)
         {
            switch(this.imgformat.toLowerCase())
            {
               case "png":
                  return _720.IMAGES_FORMAT_PNG;
               case "jpg":
               case "jpeg":
                  return _720.IMAGES_FORMAT_JPG;
               case "gif":
                  return _720.IMAGES_FORMAT_GIF;
               default:
                  return _720.IMAGES_FORMAT_PNG;
            }
         }
         else
         {
            return _720.IMAGES_FORMAT_PNG;
         }
      }
      
      public function get singleFrame() : Boolean
      {
         if(this.type == 1)
         {
            return true;
         }
         return false;
      }
      
      public function get dataType() : int
      {
         if(this.datatype)
         {
            switch(this.datatype.toLowerCase())
            {
               case "db":
                  return _720.EXPORT_TYPE_DRAGONBONES;
               case "spine":
                  return _720.EXPORT_TYPE_SPINE;
               case "egretfast":
                  return _720.EXPORT_TYPE_EGRETFAST;
               case "egretmc":
                  return _720.EXPORT_TYPE_MOVIECLIP;
            }
         }
         return _720.EXPORT_TYPE_DRAGONBONES;
      }
      
      public function get _12555() : Array
      {
         if(this.target == null)
         {
            return null;
         }
         return this.target.split(",");
      }
      
      public function get _12556() : Boolean
      {
         if(this.packagetexture == "false")
         {
            return false;
         }
         return true;
      }
      
      public function get exportData() : Boolean
      {
         if(this.exportdata == "false")
         {
            return false;
         }
         return true;
      }
      
      public function get _12558() : Boolean
      {
         if(this.exportexture == "false")
         {
            return false;
         }
         return true;
      }
      
      public function get _12563() : Boolean
      {
         if(this.packagezip == "true")
         {
            return true;
         }
         return false;
      }
      
      public function get autoSize() : Boolean
      {
         if(this.maxSize == null)
         {
            return true;
         }
         return this.maxSize is String && String(this.maxSize) == "auto";
      }
      
      public function get maxWidth() : int
      {
         if(this.maxSize == null)
         {
            return 0;
         }
         if(!(this.maxSize is String) && this.maxSize["width"] != null)
         {
            return int(this.maxSize["width"]);
         }
         return 0;
      }
      
      public function get maxHeight() : int
      {
         if(this.maxSize == null)
         {
            return 0;
         }
         if(!(this.maxSize is String) && this.maxSize["height"] != null)
         {
            return int(this.maxSize["height"]);
         }
         return 0;
      }
   }
}

