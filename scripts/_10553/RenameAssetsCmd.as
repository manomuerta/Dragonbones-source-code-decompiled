package _10553
{
   import _11111._11110;
   import _1404._1407;
   import _555.LibraryPanelController;
   import _555._570;
   import _555._571;
   import _93._92;
   import egret.utils.FileUtil;
   import flash.filesystem.File;
   
   public class RenameAssetsCmd extends _92
   {
      private var _3048:Array;
      
      public function RenameAssetsCmd()
      {
         this._3048 = [];
         super();
         _2219 = true;
         _2215 = true;
      }
      
      override public function execute() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         if(_2223.imageFile)
         {
            this.renameFile(this._10573,this.newPath);
            this._10569(this._2952,this.newName);
         }
         else if(_2223.folderFile)
         {
            this.renameFile(this._10573,this.newPath);
            this._10566(this._2952,this.newName);
         }
         else if(_2223.textureFile)
         {
            _loc1_ = 0;
            _loc2_ = int(this._10571.length);
            while(_loc1_ < _loc2_)
            {
               this.renameFile(this._10571[_loc1_],this._10572[_loc1_]);
               _loc1_++;
            }
            this._10566(this._2952 + "@",this.newName + "@");
         }
         else if(_2223.subTexture)
         {
            this._10568(this._10573,this._2952,this.newName);
            this._10569(this._10567 + "@" + this._2952,this._10567 + "@" + this.newName);
         }
         this._3173();
      }
      
      override public function revert() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         if(_2223.imageFile)
         {
            this.renameFile(this.newPath,this._10573);
            this._10569(this.newName,this._2952);
         }
         else if(_2223.folderFile)
         {
            this.renameFile(this.newPath,this._10573);
            this._10566(this.newName,this._2952);
         }
         else if(_2223.textureFile)
         {
            _loc1_ = 0;
            _loc2_ = int(this._10571.length);
            while(_loc1_ < _loc2_)
            {
               this.renameFile(this._10572[_loc1_],this._10571[_loc1_]);
               _loc1_++;
            }
            this._10566(this.newName + "@",this._2952 + "@");
         }
         else if(_2223.subTexture)
         {
            this._10568(this._10573,this.newName,this._2952);
            this._10569(this._10567 + "@" + this.newName,this._10567 + "@" + this._2952);
         }
         this._3173();
      }
      
      private function renameFile(param1:String, param2:String) : void
      {
         var _10573:String = param1;
         var newPath:String = param2;
         var file:File = new File(_10573);
         var newFile:File = new File(newPath);
         if(file.exists)
         {
            try
            {
               file.moveTo(newFile,true);
               this.deleteFile(_10573);
            }
            catch(e:Error)
            {
               _11110.instance._11204._11132("RenameAssetsCmd::renameFile",e);
            }
         }
      }
      
      private function _10568(param1:String, param2:String, param3:String) : void
      {
         var _loc5_:String = null;
         var _loc6_:Object = null;
         var _loc7_:Array = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc4_:File = new File(param1);
         if(_loc4_.exists)
         {
            _loc5_ = FileUtil.openAsString(param1);
            _loc6_ = JSON.parse(_loc5_);
            if((Boolean(_loc7_ = _loc6_.SubTexture)) && _loc7_.length > 0)
            {
               _loc8_ = 0;
               _loc9_ = int(_loc7_.length);
               while(_loc8_ < _loc9_)
               {
                  if(_loc7_[_loc8_].name == param2)
                  {
                     _loc7_[_loc8_].name = param3;
                     break;
                  }
                  _loc8_++;
               }
            }
            _loc5_ = JSON.stringify(_loc6_);
            FileUtil.save(_loc4_.nativePath,_loc5_,true);
         }
      }
      
      private function _10569(param1:String, param2:String) : void
      {
         this._2861.renameAssetName(param1,param2);
      }
      
      private function _10566(param1:String, param2:String) : void
      {
         this._2861.renameAssetFolderName(param1,param2);
      }
      
      private function deleteFile(param1:String) : void
      {
         var _loc2_:File = new File(param1);
         if(_loc2_.exists)
         {
            if(_loc2_.isDirectory)
            {
               _loc2_.deleteDirectory(true);
            }
            else
            {
               _loc2_.deleteFile();
            }
         }
      }
      
      private function _3173() : void
      {
         this._2861._4188();
         this._2880._2891();
         this._2853.refresh();
      }
      
      private function get _10573() : String
      {
         return this._2223._10573;
      }
      
      private function get _10571() : Vector.<String>
      {
         return this._2223._10571;
      }
      
      private function get _2952() : String
      {
         return this._2223._2952;
      }
      
      private function get newPath() : String
      {
         return this._2223.newPath;
      }
      
      private function get _10572() : Vector.<String>
      {
         return this._2223._10572;
      }
      
      private function get newName() : String
      {
         return this._2223.newName;
      }
      
      private function get _10567() : String
      {
         return this._2223._10567;
      }
      
      private function get _2861() : LibraryPanelController
      {
         return _1407.getInstance(LibraryPanelController) as LibraryPanelController;
      }
      
      private function get _2880() : _571
      {
         return _1407.getInstance(_571) as _571;
      }
      
      private function get _2853() : _570
      {
         return _1407.getInstance(_570) as _570;
      }
   }
}

