package egret.utils
{
   import flash.utils.ByteArray;
   import nochump.util.zip.ZipEntry;
   import nochump.util.zip.ZipFile;
   
   public class _1550
   {
      public function _1550()
      {
         super();
      }
      
      public static function open(param1:String) : ByteArray
      {
         var _loc2_:ByteArray = FileUtil.openAsByteArray(param1);
         if(!_loc2_)
         {
            return null;
         }
         return parse(_loc2_);
      }
      
      public static function parse(param1:ByteArray) : ByteArray
      {
         var _loc2_:ZipFile = new ZipFile(param1);
         var _loc3_:ZipEntry = _loc2_.getEntry("library.swf");
         return _loc2_.getInput(_loc3_);
      }
   }
}

