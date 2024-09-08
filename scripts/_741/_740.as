package _741
{
   import egret.utils.FileUtil;
   import flash.filesystem.File;
   import flash.utils.ByteArray;
   
   public class _740 extends _744
   {
      public function _740(param1:File, param2:String)
      {
         super(param1,param2);
      }
      
      override public function get data() : *
      {
         var byte:ByteArray = null;
         try
         {
            byte = FileUtil.openAsByteArray(_file.nativePath);
            _data = byte.readObject();
         }
         catch(e:Error)
         {
            byte.uncompress();
            _data = byte.readObject();
         }
         return _data;
      }
   }
}

