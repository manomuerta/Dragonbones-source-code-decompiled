package _741
{
   import egret.utils.FileUtil;
   import flash.filesystem.File;
   
   public class _752 extends _744
   {
      public function _752(param1:File, param2:String)
      {
         super(param1,param2);
      }
      
      override public function get data() : *
      {
         _data = XML(FileUtil.openAsString(_file.nativePath));
         return _data;
      }
   }
}

