package egret.utils
{
   import flash.filesystem.File;
   import flash.utils.ByteArray;
   import flash.utils.Dictionary;
   import flash.utils.setTimeout;
   
   public class _1549
   {
      private static var _10214:Dictionary = new Dictionary();
      
      private var _10211:Object;
      
      private var initialized:Boolean = false;
      
      private var _10215:Boolean = true;
      
      private var _path:String = "";
      
      private var _10213:String = "";
      
      private var _decrypt:Function;
      
      private var _encrypt:Function;
      
      private var _5636:Boolean = false;
      
      public function _1549(param1:String = "data.dat", param2:Boolean = true, param3:Function = null, param4:Function = null)
      {
         this._10211 = {};
         super();
         this.initialize(param1,param2,param3,param4);
      }
      
      public static function get(param1:String = "data.dat", param2:Boolean = true, param3:Function = null, param4:Function = null) : _1549
      {
         var _loc5_:_1549 = null;
         if(_10214[param1])
         {
            return _10214[param1];
         }
         return new _1549(param1,param2,param3,param4);
      }
      
      private function initialize(param1:String = "data.dat", param2:Boolean = true, param3:Function = null, param4:Function = null) : void
      {
         var _loc5_:File = null;
         var _loc7_:int = 0;
         var _loc8_:ByteArray = null;
         if(this.initialized)
         {
            return;
         }
         if(_10214[param1])
         {
            throw new Error("路径为" + param1 + "的数据本地持久化已被使用，请更换存储路径。或直接用静态方法get获得");
         }
         _10214[param1] = this;
         this._10215 = param2;
         this._path = param1;
         this._decrypt = param3;
         this._encrypt = param4;
         var _loc6_:String = FileUtil.getExtension(this._path);
         if(_loc6_)
         {
            _loc7_ = int(this._path.lastIndexOf(_loc6_));
            this._10213 = this._path.slice(0,_loc7_ - 1) + "_debug." + _loc6_;
         }
         else
         {
            this._10213 = this._path + "_debug";
         }
         if(this._10215)
         {
            _loc5_ = new File(File.applicationStorageDirectory.nativePath).resolvePath(this._10213);
         }
         else
         {
            _loc5_ = new File(File.applicationStorageDirectory.nativePath).resolvePath(this._path);
         }
         if(_loc5_.exists)
         {
            _loc8_ = FileUtil.openAsByteArray(_loc5_.nativePath);
            if(_loc8_)
            {
               try
               {
                  if(!this._10215)
                  {
                     _loc8_.position = 0;
                     _loc8_.uncompress();
                     _loc8_.position = 0;
                     if(this._decrypt != null)
                     {
                        _loc8_ = this._decrypt(_loc8_);
                     }
                  }
                  _loc8_.position = 0;
                  this._10211 = _loc8_.readObject();
               }
               catch(error:Error)
               {
               }
            }
         }
         if(!this._10211)
         {
            this._10211 = {};
         }
         this.initialized = true;
      }
      
      public function has(param1:String) : Boolean
      {
         return this._10211.hasOwnProperty(param1);
      }
      
      public function get(param1:String) : *
      {
         return this._10211[param1];
      }
      
      public function set(param1:String, param2:*) : void
      {
         if(param2 === null)
         {
            if(this._10211.hasOwnProperty(param1))
            {
               delete this._10211[param1];
            }
         }
         else
         {
            this._10211[param1] = param2;
         }
         this.save();
      }
      
      private function save() : void
      {
         if(!this._5636)
         {
            this._5636 = true;
            setTimeout(this._10212,100);
         }
      }
      
      private function _10212() : void
      {
         var _loc1_:File = null;
         var _loc3_:String = null;
         this._5636 = false;
         var _loc2_:ByteArray = new ByteArray();
         if(this._10215)
         {
            _loc1_ = new File(File.applicationStorageDirectory.nativePath).resolvePath(this._10213);
            _loc2_.writeObject(this._10211);
         }
         else
         {
            _loc1_ = new File(File.applicationStorageDirectory.nativePath).resolvePath(this._path);
            _loc2_.writeObject(this._10211);
            _loc2_.position = 0;
            if(this._encrypt != null)
            {
               _loc2_ = this._encrypt(_loc2_);
            }
            _loc2_.position = 0;
            _loc2_.compress();
         }
         FileUtil.save(_loc1_.nativePath,_loc2_);
      }
   }
}

