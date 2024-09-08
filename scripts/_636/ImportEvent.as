package _636
{
   public class ImportEvent extends DBModelEvent
   {
      public static var IMPORT_ZIP_SUCCESS:String = "ImportEvent:IMPORT_ZIP_SUCCESS";
      
      public static var IMPORT_SUCCESS:String = "ImportEvent:IMPORT_SUCCESS";
      
      public static var IMPORT_FAIL:String = "ImportEvent:IMPORT_FAIL";
      
      public function ImportEvent(param1:String, param2:* = null, param3:Boolean = false, param4:Boolean = false)
      {
         super(param1,param2,param3,param4);
      }
   }
}

