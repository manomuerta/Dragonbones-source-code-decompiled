package _178
{
   import flash.geom.Point;
   
   public final class _186
   {
      public static const ARMATURE:String = "armature";
      
      public static const IMAGE:String = "image";
      
      public var name:String;
      
      public var _1828:String;
      
      public var type:String;
      
      public var transform:_184;
      
      public var pivot:Point;
      
      public var filterType:String;
      
      public function _186()
      {
         super();
         this.transform = new _184();
         this.pivot = new Point();
      }
      
      public function dispose() : void
      {
         this.transform = null;
         this.pivot = null;
      }
   }
}

