package _741
{
   import egret.utils.FileUtil;
   import flash.filesystem.File;
   
   public class _748 extends _744
   {
      public function _748(param1:File, param2:String)
      {
         super(param1,param2);
      }
      
      override public function get data() : *
      {
         try
         {
            _data = JSON.parse(FileUtil.openAsString(_file.nativePath));
            return _data;
         }
         catch(e:Error)
         {
            return null;
         }
      }
   }
}

