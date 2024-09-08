package _777
{
   import _639._640;
   import egret.utils.FileUtil;
   import flash.filesystem.File;
   import flash.utils.ByteArray;
   
   public class _10256 extends _640
   {
      private static var _instance:_10256;
      
      private var _5632:Object;
      
      private var _10391:Boolean;
      
      public function _10256()
      {
         super();
         _5633 = "sts.amf";
         _5627 = "stsDebug.amf";
      }
      
      public static function getInstance() : _10256
      {
         if(_instance == null)
         {
            _instance = new _10256();
         }
         return _instance;
      }
      
      public function _1664() : void
      {
         var _loc1_:String = null;
         this._5632 = {};
         if(_5635)
         {
            for(_loc1_ in _5635)
            {
               this._5632[_loc1_] = new _10255(_5635[_loc1_]);
            }
         }
      }
      
      public function _5634() : void
      {
         if(this._10391)
         {
            _5635 = this._5551();
            save(true);
            this._10391 = false;
         }
      }
      
      public function set changed(param1:Boolean) : void
      {
         this._10391 = param1;
      }
      
      public function get projectDic() : Object
      {
         return this._5632;
      }
      
      public function _5551() : Object
      {
         var _loc2_:String = null;
         var _loc1_:Object = {};
         for(_loc2_ in this._5632)
         {
            _loc1_[_loc2_] = (this._5632[_loc2_] as _10255)._10373();
         }
         return _loc1_;
      }
      
      public function _10382(param1:String, param2:ByteArray) : String
      {
         var _loc3_:String = "sts/" + param1;
         var _loc4_:String = "stsDebug/" + param1;
         var _loc5_:File = File.applicationStorageDirectory.resolvePath(_loc3_);
         FileUtil.save(_loc5_.nativePath,param2);
         return _loc5_.nativePath;
      }
   }
}

