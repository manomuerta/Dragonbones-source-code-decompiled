package _472
{
   import _767._768;
   import _93._94;
   import egret.utils.FileUtil;
   import flash.filesystem.File;
   
   public class _475 extends _94
   {
      public function _475()
      {
         super();
      }
      
      public static function _2377(param1:String) : void
      {
         var _loc2_:String = File.applicationStorageDirectory.resolvePath("crash_log.txt").nativePath;
         var _loc3_:String = FileUtil.openAsString(_loc2_);
         _loc3_ += param1;
         FileUtil.save(_loc2_,_loc3_);
      }
      
      public function upload() : void
      {
         var _loc2_:String = null;
         var _loc3_:_768 = null;
         var _loc1_:String = File.applicationStorageDirectory.resolvePath("crash_log.txt").nativePath;
         if(FileUtil.exists(_loc1_))
         {
            _loc2_ = FileUtil.openAsString(_loc1_);
            if(_loc2_ != null && _loc2_ != "")
            {
               _loc3_ = new _768(_loc2_);
               _loc3_.request(this._3603);
            }
         }
      }
      
      private function _3603(param1:Object) : void
      {
         var _loc3_:String = null;
         var _loc2_:String = File.applicationStorageDirectory.resolvePath("crash_log.txt").nativePath;
         if(FileUtil.exists(_loc2_))
         {
            _loc3_ = FileUtil.openAsString(_loc2_);
            _loc3_ = "";
            FileUtil.save(_loc2_,_loc3_);
         }
      }
   }
}

