package _346
{
   import egret.utils.FileUtil;
   import flash.filesystem.File;
   
   public class _361 extends _364
   {
      public function _361()
      {
         super();
      }
      
      override public function execute() : void
      {
         var _loc1_:String = FileUtil.escapeUrl(File.applicationStorageDirectory.resolvePath("newProjectTemp").nativePath);
         var _loc2_:String = projectPath.concat();
         var _loc3_:_363 = new _363();
         _loc3_._1572(projectPath);
         _loc3_._10700 = _loc2_.substr(0,_loc1_.length) != _loc1_;
         _loc3_.execute();
         var _loc4_:_366 = new _366();
         _loc4_._1572(projectPath);
         _loc4_.execute();
      }
   }
}

