package _708
{
   import _73.DBEnumBase;
   
   public class _715 extends DBEnumBase
   {
      public static const ARMATURE:_715 = new _715("armature");
      
      public static const ANIMATE:_715 = new _715("animation");
      
      public static const GENERAL:_715 = new _715("general");
      
      public static const COMIC:_715 = new _715("comic");
      
      public static const SHEET:_715 = new _715("sheet");
      
      public static const NULL:_715 = new _715("null");
      
      public static const List:Array = [ARMATURE,ANIMATE,GENERAL,COMIC,SHEET,NULL];
      
      public function _715(param1:String)
      {
         super(param1);
      }
      
      public function change() : _715
      {
         return this == ARMATURE ? ANIMATE : ARMATURE;
      }
   }
}

