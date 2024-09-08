package _639
{
   import _93._95;
   import egret.utils.FileUtil;
   import egret.utils._1543;
   import flash.filesystem.File;
   import flash.utils.ByteArray;
   import flash.utils.setTimeout;
   
   public class _640 extends _95
   {
      public static var _11721:String = "hotkeys.txt";
      
      public static var _11720:String = "hotkeysDebug.txt";
      
      public static var _11723:String = "crash_log.txt";
      
      public static var _11722:String = "locales/language.xml";
      
      protected var _5635:Object;
      
      protected var _5633:String;
      
      protected var _5627:String;
      
      private var _5636:Boolean = false;
      
      public function _640()
      {
         super();
      }
      
      public static function _11709() : String
      {
         return File.applicationStorageDirectory.resolvePath(_11721).nativePath;
      }
      
      public static function _11713() : String
      {
         return File.applicationStorageDirectory.resolvePath(_11723).nativePath;
      }
      
      public static function _11707() : String
      {
         return File.applicationDirectory.resolvePath(_11722).nativePath;
      }
      
      public function initialize() : void
      {
         var _loc1_:File = null;
         var _loc2_:ByteArray = null;
         if(!this._5635)
         {
            _loc1_ = File.applicationStorageDirectory.resolvePath(this._5633);
            if(_loc1_.exists)
            {
               _loc2_ = FileUtil.openAsByteArray(_loc1_.nativePath);
               if(_loc2_)
               {
                  try
                  {
                     _loc2_.uncompress();
                     this._5635 = _loc2_.readObject();
                  }
                  catch(error:Error)
                  {
                  }
               }
            }
         }
         if(!this._5635)
         {
            this._5635 = this._5620();
         }
      }
      
      protected function _5620() : Object
      {
         return {};
      }
      
      protected function _5629(param1:String) : *
      {
         return this._5635[param1];
      }
      
      protected function _5628(param1:String, param2:*) : void
      {
         var _loc3_:* = undefined;
         if(param2 is Number || param2 is Boolean || param2 is String || param2 is Array)
         {
            _loc3_ = param2;
         }
         else if(param2 is XML)
         {
            _loc3_ = (param2 as XML).toXMLString();
         }
         else
         {
            _loc3_ = _1543.clone(param2);
         }
         this._5635[param1] = _loc3_;
      }
      
      protected function _5621(param1:String, param2:*, param3:Boolean = false) : void
      {
         this._5628(param1,param2);
         this.save(param3);
      }
      
      protected function save(param1:Boolean = false) : void
      {
         if(param1)
         {
            this._5634();
         }
         else if(this._5636 == false)
         {
            this._5636 = true;
            setTimeout(this._5634,1000);
         }
      }
      
      private function _5634() : void
      {
         var _loc1_:File = File.applicationStorageDirectory.resolvePath(this._5633);
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeObject(this._5635);
         _loc2_.compress();
         FileUtil.save(_loc1_.nativePath,_loc2_);
         this._5636 = false;
      }
   }
}

