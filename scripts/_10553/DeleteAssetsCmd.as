package _10553
{
   import _11111._11110;
   import _1404._1407;
   import _555.LibraryPanelController;
   import _93._92;
   import flash.filesystem.File;
   
   public class DeleteAssetsCmd extends _92
   {
      private var _3048:Array;
      
      public function DeleteAssetsCmd()
      {
         this._3048 = [];
         super();
         _2219 = true;
      }
      
      override public function execute() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         if(this._10565)
         {
            _loc1_ = 0;
            _loc1_ = 0;
            _loc2_ = int(this._10565.length);
            while(_loc1_ < _loc2_)
            {
               this.deleteFile(this._10565[_loc1_]);
               _loc1_++;
            }
            this._2861._4188();
         }
      }
      
      private function deleteFile(param1:String) : void
      {
         var url:String = param1;
         var file:File = new File(url);
         try
         {
            if(file.exists)
            {
               if(file.isDirectory)
               {
                  file.deleteDirectory(true);
               }
               else
               {
                  file.deleteFile();
               }
            }
         }
         catch(e:Error)
         {
            _11110.instance._11204._11132("DeleteAssetsCmd::deleteFile",e);
         }
      }
      
      private function get _10565() : Vector.<String>
      {
         return this._2223 as Vector.<String>;
      }
      
      private function get _2861() : LibraryPanelController
      {
         return _1407.getInstance(LibraryPanelController) as LibraryPanelController;
      }
   }
}

