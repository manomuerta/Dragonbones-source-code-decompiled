package _741
{
   import egret.utils.FileUtil;
   import flash.filesystem.File;
   
   public class _744 implements _746
   {
      protected var _data:*;
      
      protected var _name:String;
      
      protected var _path:String;
      
      protected var _file:File;
      
      protected var _5915:Number;
      
      protected var _5917:Boolean;
      
      protected var _3261:String;
      
      protected var _3686:String;
      
      protected var _5918:String;
      
      protected var _validate:Boolean;
      
      protected var _5916:String;
      
      public function _744(param1:File, param2:String)
      {
         super();
         this._file = param1;
         this._5916 = param2;
         this._4188();
      }
      
      public function _5846(param1:String) : void
      {
         var _loc2_:String = null;
         if(this._5916 != param1)
         {
            this._5916 = param1;
            _loc2_ = this._5916 + "/" + this._name;
            if(this._3261 != null)
            {
               _loc2_ += "." + this._3261;
            }
            this._file = new File(_loc2_);
            this._5915 = 0;
         }
      }
      
      public function _4188() : Boolean
      {
         var _loc1_:Boolean = false;
         if(this._file)
         {
            if(this._file.exists)
            {
               this._5917 = false;
               this._path = FileUtil.escapePath(this._file.nativePath);
               this._3686 = this._file.name;
               this._3261 = this._file.extension;
               if(this._name == null)
               {
                  this._name = this._5914();
               }
               if(this._5915 != this._file.modificationDate.time)
               {
                  this._5915 = this._file.modificationDate.time;
                  _loc1_ = true;
               }
            }
            else if(!this._5917)
            {
               this._5915 = 0;
               this._5918 = null;
               this._5917 = true;
               _loc1_ = true;
            }
         }
         if(_loc1_)
         {
            this._validate = false;
         }
         return _loc1_;
      }
      
      protected function _5914() : String
      {
         var _loc1_:String = this._path.substr(this._5916.length);
         var _loc2_:int = int(_loc1_.lastIndexOf("."));
         var _loc3_:int = 0;
         if(_loc2_ <= _loc3_)
         {
            _loc2_ = this.path.length;
         }
         return _loc1_.substring(_loc3_ + 1,_loc2_);
      }
      
      public function get group() : String
      {
         return this._5918;
      }
      
      public function set group(param1:String) : void
      {
         this._5918 = param1;
      }
      
      public function get data() : *
      {
         return this._data;
      }
      
      public function get _5851() : String
      {
         return this._5916;
      }
      
      public function get path() : String
      {
         return this._path;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get fileName() : String
      {
         return this._3686;
      }
      
      public function get extension() : String
      {
         return this._3261;
      }
      
      public function get removed() : Boolean
      {
         return this._5917;
      }
      
      public function get validate() : Boolean
      {
         return this._validate;
      }
      
      public function set validate(param1:Boolean) : void
      {
         this._validate = param1;
      }
      
      public function dispose() : void
      {
         if(this._data)
         {
            this._data = null;
         }
      }
   }
}

