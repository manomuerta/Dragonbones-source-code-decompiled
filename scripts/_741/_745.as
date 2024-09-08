package _741
{
   import _521._528;
   import egret.utils.FileUtil;
   import flash.filesystem.File;
   
   public class _745 extends _744
   {
      protected var _5874:Vector.<_746>;
      
      protected var _5920:Object;
      
      public function _745(param1:File, param2:String)
      {
         this._5874 = new Vector.<_746>();
         this._5920 = {};
         super(param1,param2);
      }
      
      public function _5902(param1:String) : Boolean
      {
         var _loc2_:int = 0;
         var _loc3_:int = int(this._5874.length);
         while(_loc2_ < _loc3_)
         {
            if(this._5874[_loc2_] is _745)
            {
               if(FileUtil.escapeUrl(this._5874[_loc2_].path) == FileUtil.escapeUrl(param1))
               {
                  return true;
               }
               if((this._5874[_loc2_] as _745)._5902(param1))
               {
                  return true;
               }
            }
            else if(!this._5874[_loc2_].removed && FileUtil.escapeUrl(this._5874[_loc2_].path) == FileUtil.escapeUrl(param1))
            {
               return true;
            }
            _loc2_++;
         }
         return false;
      }
      
      public function _10582(param1:String) : Boolean
      {
         var _loc5_:String = null;
         var _loc2_:String = FileUtil.getDirectory(param1) + FileUtil.getFileName(param1);
         var _loc3_:int = 0;
         var _loc4_:int = int(this._5874.length);
         while(_loc3_ < _loc4_)
         {
            if(this._5874[_loc3_] is _745)
            {
               if((this._5874[_loc3_] as _745)._10582(_loc2_))
               {
                  return true;
               }
            }
            else if(!this._5874[_loc3_].removed)
            {
               _loc5_ = FileUtil.escapeUrl(this._5874[_loc3_].path);
               if(FileUtil.getDirectory(_loc5_) + FileUtil.getFileName(_loc5_) == FileUtil.escapeUrl(_loc2_))
               {
                  return true;
               }
            }
            _loc3_++;
         }
         return false;
      }
      
      override public function _5846(param1:String) : void
      {
         super._5846(param1);
         var _loc2_:int = 0;
         var _loc3_:int = int(this._5874.length);
         while(_loc2_ < _loc3_)
         {
            if(this._5874[_loc2_] is _744)
            {
               (this._5874[_loc2_] as _744)._5846(param1);
            }
            _loc2_++;
         }
      }
      
      override public function _4188() : Boolean
      {
         var _loc1_:Boolean = false;
         var _loc4_:File = null;
         var _loc5_:String = null;
         var _loc6_:Array = null;
         var _loc7_:_746 = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(_file.exists)
         {
            if(_file.modificationDate.time != _5915)
            {
               _5915 = _file.modificationDate.time;
               _path = _file.nativePath;
               _3686 = _file.name;
               if(_name == null)
               {
                  _name = FileUtil.getFileName(_path.substr(_5916.length + 1));
               }
               _loc1_ = true;
            }
            _loc2_ = 0;
            _loc3_ = int(this._5875.length);
            while(_loc2_ < _loc3_)
            {
               _loc1_ = this._5875[_loc2_]._4188() || _loc1_;
               if(this._5875[_loc2_].removed)
               {
                  _loc5_ = this._5919(this._5874[_loc2_].path);
                  this._5920[_loc5_] = null;
                  delete this._5920[_loc5_];
                  this._5875.splice(_loc2_,1);
                  _loc2_--;
                  _loc3_--;
               }
               _loc2_++;
            }
            _loc6_ = _file.getDirectoryListing();
            _loc2_ = 0;
            _loc3_ = int(_loc6_.length);
            while(_loc2_ < _loc3_)
            {
               _loc4_ = _loc6_[_loc2_] as File;
               if(Boolean(_loc4_.isDirectory) || _528._3820(_loc4_.extension))
               {
                  _loc5_ = this._5919(_loc4_.nativePath);
                  if(this._5920[_loc5_] == null)
                  {
                     _loc7_ = _750._5901(_loc4_,_5851);
                     this._5875.push(_loc7_);
                     this._5920[_loc5_] = _loc7_;
                     _loc1_ = true;
                  }
               }
               _loc2_++;
            }
            _5917 = false;
         }
         else
         {
            _5917 = true;
            _loc1_ = true;
         }
         return _loc1_;
      }
      
      public function _5900() : String
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:_746 = null;
         var _loc5_:String = null;
         var _loc1_:Object = {};
         _loc2_ = 0;
         _loc3_ = int(this._5874.length);
         while(_loc2_ < _loc3_)
         {
            _loc4_ = this._5874[_loc2_];
            if(_loc4_ is _742)
            {
               if(_loc1_[_loc4_.name])
               {
                  return _loc4_.name;
               }
               _loc1_[_loc4_.name] = true;
            }
            else if(_loc4_ is _745)
            {
               _loc5_ = (_loc4_ as _745)._5900();
               if(_loc5_ != null)
               {
                  return _loc5_;
               }
            }
            _loc2_++;
         }
         return null;
      }
      
      private function _5919(param1:String) : String
      {
         return FileUtil.escapePath(param1.toLowerCase());
      }
      
      public function get _5875() : Vector.<_746>
      {
         return this._5874;
      }
   }
}

