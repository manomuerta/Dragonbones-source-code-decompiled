package _14101
{
   import egret.utils.tr;
   
   public class _14103
   {
      public static const CHILD_BONE:int = 1;
      
      public static const SLOT:int = 2;
      
      public static const DISPLAY:int = 4;
      
      public static const MESH:int = 8;
      
      public static const WEIGHT:int = 16;
      
      public static const KEYFRAMES:int = 32;
      
      public static const ALL_TYPES_SELECTED:uint = 63;
      
      public function _14103()
      {
         super();
      }
      
      public static function _14776(param1:int) : String
      {
         var _loc2_:String = "";
         switch(param1)
         {
            case CHILD_BONE:
               _loc2_ = tr("SelectivePaste.childBone");
               break;
            case SLOT:
               _loc2_ = tr("MenuItem-slot");
               break;
            case DISPLAY:
               _loc2_ = tr("Property.display.ImageType");
               break;
            case MESH:
               _loc2_ = tr("Property.display.MeshType");
               break;
            case WEIGHT:
               _loc2_ = tr("Property.mesh.weight");
               break;
            case KEYFRAMES:
               _loc2_ = tr("SelectivePaste.animationKeyFrame");
         }
         return _loc2_;
      }
      
      public static function _14395(param1:uint, param2:int) : Boolean
      {
         return (param1 & param2) != 0;
      }
   }
}

