package _14079
{
   import _1404._1407;
   import _472._12461;
   import _648._12463;
   import _93._95;
   import egret.utils.FileUtil;
   import egret.utils._1543;
   import flash.filesystem.File;
   import flash.net.registerClassAlias;
   import flash.utils.ByteArray;
   import flash.utils.setTimeout;
   
   public class _14082 extends _95
   {
      private static var instance:_14082;
      
      public static var _11721:String = "hotkeys.txt";
      
      public static var _11720:String = "hotkeysDebug.txt";
      
      public static var _11723:String = "crash_log.txt";
      
      public static var _11722:String = "locales/language.xml";
      
      private static var propertyList:Array = [["cacheDB",new _14078()],["cacheIMG",new _14081()],["cacheHTML",new _14080()]];
      
      protected var _5635:Object;
      
      protected var _5633:String;
      
      protected var _5627:String;
      
      private var _5636:Boolean = false;
      
      private var _14688:_14078;
      
      private var _14687:_14081;
      
      private var _14686:_14080;
      
      public function _14082()
      {
         this._12594 = _1407.getInstance(_12463);
         this._12569 = _1407.getInstance(_12461);
         super();
         registerClassAlias("cacheDB",_14078);
         registerClassAlias("cacheIMG",_14081);
         registerClassAlias("cacheHTML",_14080);
      }
      
      public static function getInstance() : _14082
      {
         if(instance == null)
         {
            instance = new _14082();
         }
         return instance;
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
      
      public function _14653(param1:String) : void
      {
         this._5633 = "#ExportCache/" + param1 + "_EXC.amf";
         this._5627 = "#ExportCache/" + param1 + "_EXCDebug.amf";
      }
      
      public function clear() : void
      {
         this._14688 = null;
         this._14687 = null;
         this._14686 = null;
         this._5635 = null;
      }
      
      public function set cacheDB(param1:_14078) : void
      {
         this._14688 = param1;
      }
      
      public function get cacheDB() : _14078
      {
         return this._14688;
      }
      
      public function set cacheIMG(param1:_14081) : void
      {
         this._14687 = param1;
      }
      
      public function get cacheIMG() : _14081
      {
         return this._14687;
      }
      
      public function set cacheHTML(param1:_14080) : void
      {
         this._14686 = param1;
      }
      
      public function get cacheHTML() : _14080
      {
         return this._14686;
      }
      
      public function _1664() : void
      {
         var _loc1_:Object = null;
         var _loc2_:Array = null;
         for each(_loc2_ in propertyList)
         {
            _loc1_ = this._5629(_loc2_[0]);
            this[_loc2_[0]] = _loc1_ != null ? _loc1_ : _loc2_[1];
         }
      }
      
      public function _3525() : void
      {
         var _loc1_:Array = null;
         for each(_loc1_ in propertyList)
         {
            this._5628(_loc1_[0],this[_loc1_[0]]);
         }
         this.save(true);
      }
      
      public function update() : void
      {
         this._5621("cacheDB",this["cacheDB"]);
         this._5621("cacheIMG",this["cacheIMG"]);
         this._5621("cacheHTML",this["cacheHTML"]);
      }
      
      public function reset() : void
      {
         this._14688._14453();
         this._14687._14453();
         this._14686._14453();
         this.update();
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

