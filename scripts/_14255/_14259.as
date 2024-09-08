package _14255
{
   public class _14259
   {
      public static var isCreateSkeleton:Boolean = false;
      
      public static var originType:int = _14258.Center;
      
      public static var scale:Number = 1;
      
      public static var ignoreHiddenLayers:Boolean = true;
      
      public static var onlyUpdateTexture:Boolean = false;
      
      public static var isExportData:Boolean = true;
      
      public function _14259()
      {
         super();
      }
      
      public static function toString() : String
      {
         var _loc1_:String = isCreateSkeleton ? "true" : "false";
         var _loc2_:String = onlyUpdateTexture ? "true" : "false";
         var _loc3_:String = ignoreHiddenLayers ? "true" : "false";
         return "isCreateSkeleton=" + _loc1_ + ",onlyUpdateTexture=" + _loc2_ + ",ignoreHiddenLayers=" + _loc3_ + ",originType=" + originType + ",scale=" + scale;
      }
   }
}

