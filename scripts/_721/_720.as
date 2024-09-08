package _721
{
   import _51._50;
   import _51._70;
   import _51._71;
   import _51._79;
   import _73.SymbolType;
   import egret.utils.FileUtil;
   import flash.geom.Rectangle;
   
   public class _720
   {
      public static var _3650:String;
      
      public static const DATA_TYPE_JSON:String = "json";
      
      public static const DATA_TYPE_XML:String = "xml";
      
      public static const IMAGE_TYPE_FILES:String = "files";
      
      public static const IMAGE_TYPE_TEXTURE:String = "texture";
      
      public static const EXPORT_TYPE_DRAGONBONES:int = 0;
      
      public static const EXPORT_TYPE_MOVIECLIP:int = 1;
      
      public static const EXPORT_TYPE_SPRITESHEET:int = 2;
      
      public static const EXPORT_TYPE_EGRETFAST:int = 3;
      
      public static const EXPORT_TYPE_IMAGE:int = 4;
      
      public static const EXPORT_TYPE_VIDEO:int = 5;
      
      public static const EXPORT_TYPE_SPINE:int = 6;
      
      public static const EXPORT_TYPE_BINARY:int = 7;
      
      public static const SUPERTYPE_DATA:int = 0;
      
      public static const SUPERTYPE_IMAGE:int = 1;
      
      public static const SUPERTYPE_HTML:int = 2;
      
      public static const IMAGES_PACKAGE_FILES:int = 0;
      
      public static const IMAGES_PACKAGE_TEXTURE:int = 1;
      
      public static const IMAGES_FORMAT_PNG:int = 0;
      
      public static const IMAGES_FORMAT_JPG:int = 1;
      
      public static const IMAGES_FORMAT_GIF:int = 2;
      
      public static const TARGET_ALL:int = 0;
      
      public static const TARGET_SELECTED:int = 1;
      
      public static const TARGET_OPENED:int = 2;
      
      public static const TARGET_CUSTOM:int = 3;
      
      private var _5870:String;
      
      public var projectName:String;
      
      public var scale:Number;
      
      public var dataType:String;
      
      public var version:String = "5.5";
      
      public var imageType:String;
      
      public var isZip:Boolean;
      
      public var hasBackground:Boolean;
      
      public var backgroundColor:uint;
      
      public var repeat:int = 0;
      
      public var quality:int = 3;
      
      public var dragonBonesVO:_71;
      
      public var exportType:int;
      
      public var exportFrameRate:int;
      
      public var currentFPS:int;
      
      public var smooth:Boolean;
      
      public var exportData:Boolean;
      
      public var exportTexture:Boolean;
      
      public var exportSuperType:int;
      
      public var imagesPackageType:int;
      
      public var imageFormat:int;
      
      public var singleFrame:Boolean;
      
      public var singleFrameAnimation:String;
      
      public var singleFrameIndex:int;
      
      public var _14673:int;
      
      public var _14674:String;
      
      public var targetType:int;
      
      public var _10711:Array;
      
      public var allArmatures:Array;
      
      public var selectedArmatures:Array;
      
      public var openedArmatures:Array;
      
      public var includeChild:Boolean;
      
      public var outputName:String;
      
      public var allAnimations:Array;
      
      public var allAnimationDurings:Array;
      
      public var curAnimation:String;
      
      public var outputFolder:String = "";
      
      public var _14693:Boolean = true;
      
      public var imageBackgroundColor:uint = 16777215;
      
      public var curArmature:String;
      
      public var curFrameIndex:int;
      
      public var exportArmatureName:String;
      
      public var exportAnimationName:String;
      
      public var exportAnimationFrameIndex:int;
      
      public var exportAnimations:Array;
      
      public var _14462:Boolean = false;
      
      public var _12584:int = 16777215;
      
      public var _12582:Boolean = false;
      
      public var _12579:String;
      
      private var _12706:Object;
      
      public var _2000:_763;
      
      public var _13268:Rectangle;
      
      public var _13266:Object;
      
      public var _12705:Array;
      
      public function _720()
      {
         this._10711 = [];
         this.allArmatures = [];
         this.selectedArmatures = [];
         this.openedArmatures = [];
         this.allAnimations = [];
         this.allAnimationDurings = [];
         this.exportAnimations = [];
         this._12705 = ["ouputPath","projectName","scale","dataType","version","imageType","isZip","hasBackground","backgroundColor","dragonBonesVO","exportType","exportFrameRate","currentFPS","smooth","exportData","exportTexture","exportSuperType","imagesPackageType","imageFormat","singleFrame","singleFrameAnimation","singleFrameIndex","allArmatures","selectedArmatures","openedArmatures","includeChild","outputName","allAnimations","allAnimationDurings","curAnimation","outputFolder","imageBackgroundColor","curArmature","curFrameIndex","exportArmatureName","exportAnimationName","exportAnimationFrameIndex","exportAnimations"];
         super();
         this.scale = 1;
         this.hasBackground = false;
         this.backgroundColor = 16777215;
         this.dataType = _720.DATA_TYPE_JSON;
         this.imageType = _720.IMAGE_TYPE_TEXTURE;
         this.imageFormat = _720.IMAGES_FORMAT_PNG;
         this.exportData = true;
         this.exportTexture = true;
         this.includeChild = true;
      }
      
      public function get ouputPath() : String
      {
         return this._5870;
      }
      
      public function set ouputPath(param1:String) : void
      {
         this._5870 = FileUtil.escapePath(param1);
      }
      
      public function _10577() : Boolean
      {
         var _loc1_:_50 = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:_79 = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:_70 = null;
         if(Boolean(this.dragonBonesVO) && Boolean(this.dragonBonesVO._2126))
         {
            _loc2_ = 0;
            _loc3_ = int(this.dragonBonesVO._2126.length);
            while(_loc2_ < _loc3_)
            {
               _loc1_ = this.dragonBonesVO._2126[_loc2_];
               if(Boolean(_loc1_) && Boolean(_loc1_._1780))
               {
                  _loc4_ = 0;
                  _loc5_ = int(_loc1_._1780.length);
                  while(_loc4_ < _loc5_)
                  {
                     _loc6_ = _loc1_._1780[_loc4_] as _79;
                     if((_loc6_) && _loc6_._1715 && Boolean(_loc6_._1765))
                     {
                        _loc7_ = 0;
                        _loc8_ = int(_loc6_._1715.length);
                        while(_loc7_ < _loc8_)
                        {
                           _loc9_ = _loc6_._1765[_loc6_._1715[_loc7_]];
                           if(_loc9_._2165)
                           {
                              return true;
                           }
                           _loc7_++;
                        }
                     }
                     _loc4_++;
                  }
               }
               _loc2_++;
            }
         }
         return false;
      }
      
      public function _3649() : Boolean
      {
         var _loc1_:_50 = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:_79 = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:_70 = null;
         if(Boolean(this.dragonBonesVO) && Boolean(this.dragonBonesVO._2126))
         {
            _loc2_ = 0;
            _loc3_ = int(this.dragonBonesVO._2126.length);
            while(_loc2_ < _loc3_)
            {
               _loc1_ = this.dragonBonesVO._2126[_loc2_];
               if(Boolean(_loc1_) && Boolean(_loc1_._1780))
               {
                  _loc4_ = 0;
                  _loc5_ = int(_loc1_._1780.length);
                  while(_loc4_ < _loc5_)
                  {
                     _loc6_ = _loc1_._1780[_loc4_] as _79;
                     if((_loc6_) && _loc6_._1715 && Boolean(_loc6_._1765))
                     {
                        _loc7_ = 0;
                        _loc8_ = int(_loc6_._1715.length);
                        while(_loc7_ < _loc8_)
                        {
                           _loc9_ = _loc6_._1765[_loc6_._1715[_loc7_]];
                           if(_loc9_._2112)
                           {
                              return true;
                           }
                           _loc7_++;
                        }
                     }
                     _loc4_++;
                  }
               }
               _loc2_++;
            }
         }
         return false;
      }
      
      public function _10713() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:Array = null;
         var _loc8_:_50 = null;
         var _loc9_:Array = null;
         var _loc6_:_71 = this.dragonBonesVO;
         var _loc7_:Object = {};
         _loc1_ = 0;
         _loc2_ = int(_loc6_._2126.length);
         while(_loc1_ < _loc2_)
         {
            _loc8_ = _loc6_._2126[_loc1_];
            _loc7_[_loc8_.name] = _loc8_._10664();
            _loc1_++;
         }
         switch(this.targetType)
         {
            case _720.TARGET_ALL:
               this._10711 = this.allArmatures.concat();
               break;
            case _720.TARGET_SELECTED:
               if(this.selectedArmatures == null)
               {
                  this.selectedArmatures = [];
               }
               this._10711 = this.selectedArmatures.concat();
               if(this.includeChild)
               {
                  _loc1_ = 0;
                  _loc2_ = int(this.selectedArmatures.length);
                  while(_loc1_ < _loc2_)
                  {
                     _loc5_ = _loc7_[this.selectedArmatures[_loc1_]];
                     if(_loc5_)
                     {
                        _loc3_ = 0;
                        _loc4_ = int(_loc5_.length);
                        while(_loc3_ < _loc4_)
                        {
                           if(this._10711.indexOf(_loc5_[_loc3_]) == -1)
                           {
                              this._10711.push(_loc5_[_loc3_]);
                           }
                           _loc3_++;
                        }
                     }
                     _loc1_++;
                  }
               }
               break;
            case _720.TARGET_OPENED:
               if(this.openedArmatures == null)
               {
                  this.openedArmatures = [];
               }
               this._10711 = this.openedArmatures.concat();
               if(this.includeChild)
               {
                  _loc1_ = 0;
                  _loc2_ = int(this.openedArmatures.length);
                  while(_loc1_ < _loc2_)
                  {
                     _loc5_ = _loc7_[this.openedArmatures[_loc1_]];
                     if(_loc5_)
                     {
                        _loc3_ = 0;
                        _loc4_ = int(_loc5_.length);
                        while(_loc3_ < _loc4_)
                        {
                           if(this._10711.indexOf(_loc5_[_loc3_]) == -1)
                           {
                              this._10711.push(_loc5_[_loc3_]);
                           }
                           _loc3_++;
                        }
                     }
                     _loc1_++;
                  }
               }
               break;
            case _720.TARGET_CUSTOM:
               if(this.includeChild)
               {
                  _loc9_ = [];
                  _loc1_ = 0;
                  _loc2_ = int(this._10711.length);
                  while(_loc1_ < _loc2_)
                  {
                     _loc5_ = _loc7_[this._10711[_loc1_]];
                     if(_loc5_)
                     {
                        _loc3_ = 0;
                        _loc4_ = int(_loc5_.length);
                        while(_loc3_ < _loc4_)
                        {
                           if(_loc9_.indexOf(_loc5_[_loc3_]) == -1)
                           {
                              _loc9_.push(_loc5_[_loc3_]);
                           }
                           _loc3_++;
                        }
                     }
                     _loc1_++;
                  }
                  if(_loc9_.length > 0)
                  {
                     _loc1_ = 0;
                     _loc2_ = int(_loc9_.length);
                     while(_loc1_ < _loc2_)
                     {
                        if(this._10711.indexOf(_loc9_[_loc1_]) == -1)
                        {
                           this._10711.push(_loc9_[_loc1_]);
                        }
                        _loc1_++;
                     }
                  }
               }
         }
      }
      
      public function _12588() : void
      {
         this._12706 = {};
         var _loc1_:int = 0;
         var _loc2_:int = int(this._12705.length);
         while(_loc1_ < _loc2_)
         {
            this._12706[this._12705[_loc1_]] = this[this._12705[_loc1_]];
            _loc1_++;
         }
      }
      
      public function _12586() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         if(this._12706)
         {
            _loc1_ = 0;
            _loc2_ = int(this._12705.length);
            while(_loc1_ < _loc2_)
            {
               if(this._12706.hasOwnProperty(this._12705[_loc1_]))
               {
                  this[this._12705[_loc1_]] = this._12706[this._12705[_loc1_]];
               }
               _loc1_++;
            }
            this._12706 = null;
         }
      }
      
      public function _13393() : Boolean
      {
         var _loc1_:String = null;
         var _loc2_:_50 = null;
         if(this._10711.length == 1)
         {
            _loc1_ = this._10711[0];
         }
         else
         {
            _loc1_ = this.curArmature;
         }
         if(Boolean(_loc1_) && Boolean(this.dragonBonesVO))
         {
            _loc2_ = this.dragonBonesVO._2107(_loc1_);
            return Boolean(_loc2_) && _loc2_._1811 == SymbolType.SHEET;
         }
         return false;
      }
   }
}

