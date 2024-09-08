package _73
{
   public class SymbolType extends DBEnumBase
   {
      public static const ARMATURE:SymbolType = new SymbolType("Armature");
      
      public static const SHEET:SymbolType = new SymbolType("Sheet");
      
      public static const MC:SymbolType = new SymbolType("MovieClip");
      
      public static const STAGE:SymbolType = new SymbolType("Stage");
      
      public static const COMIC:SymbolType = new SymbolType("Comic");
      
      public function SymbolType(param1:String)
      {
         super(param1);
      }
   }
}

