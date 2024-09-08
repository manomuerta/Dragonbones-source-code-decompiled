package _648
{
   import _1404._1407;
   import _625._627;
   import _721._722;
   import _93._95;
   import _97._101;
   import egret.utils.FileUtil;
   import egret.utils.tr;
   import flash.filesystem.File;
   import flash.net.FileFilter;
   
   public class _650 extends _95
   {
      public static const ANIMATION_EXT:String = "dbani";
      
      private const ERROR_XML_FORMAT:int = 1;
      
      private const ERROR_XML_VERSION:int = 2;
      
      private var _path:String;
      
      private var _projectName:String;
      
      public function _650(param1:String = null)
      {
         super();
         this._path = param1;
      }
      
      public static function get _5669() : Array
      {
         var _loc1_:FileFilter = new FileFilter(tr("Import.filter.json"),"*.json");
         return [_loc1_];
      }
      
      public static function get _5671() : Array
      {
         var _loc1_:FileFilter = new FileFilter(tr("Import.filter.png"),"*.png");
         return [_loc1_];
      }
      
      public static function get _5670() : Array
      {
         var _loc1_:FileFilter = new FileFilter(tr("Import.filter.zip"),"*.zip");
         return [_loc1_];
      }
      
      public static function _5668(param1:String = "", param2:String = "") : Array
      {
         var _loc3_:FileFilter = new FileFilter(tr("Import.filter.DbData") + param1,"*.xml;*.json;*.amf3;*.zip;*.png;*.dbswf" + param2);
         return [_loc3_];
      }
      
      public static function get _4169() : Array
      {
         var _loc1_:FileFilter = new FileFilter(tr("Import.filter.image"),"*.png;*.jpg;*.psd");
         return [_loc1_];
      }
      
      public static function _5664(param1:String = "") : Array
      {
         var _loc2_:FileFilter = new FileFilter(tr("Import.filter.textureConfig"),"*.xml;*.amf3;*.json" + param1);
         return [_loc2_];
      }
      
      public static function get _4167() : Array
      {
         var _loc1_:FileFilter = new FileFilter(tr("Import.filter.asstes"),"*.xml;*.json;*.png;*.jpg;*.jpeg;*.psd;*.svg;*.swf");
         return [_loc1_];
      }
      
      public static function get _11605() : Array
      {
         var _loc1_:FileFilter = new FileFilter(tr("Import.filter.animation"),"*." + _650.ANIMATION_EXT);
         return [_loc1_];
      }
      
      public function set path(param1:String) : void
      {
         this._path = param1;
      }
      
      public function get path() : String
      {
         return this._path;
      }
      
      public function get projectPath() : String
      {
         this._path = FileUtil.escapePath(this._path);
         var _loc1_:String = this._path + this._projectName;
         return _loc1_ + _101.PROJECT_SUFFIX;
      }
      
      public function set projectName(param1:String) : void
      {
         this._projectName = param1;
      }
      
      public function _3283(param1:_722) : void
      {
         param1.projectPath = this.projectPath;
         param1.projectName = this._projectName;
         var _loc2_:String = this._path;
         var _loc3_:File = new File(this.projectPath);
         if(Boolean(_loc3_.parent) && Boolean(_loc3_.parent.parent))
         {
            _loc2_ = _loc3_.parent.parent.nativePath;
         }
         else if(_loc3_.parent)
         {
            _loc2_ = _loc3_.parent.nativePath;
         }
         param1._3280 = _loc2_;
         (_1407.getInstance(_627) as _627)._3283(param1);
      }
   }
}

