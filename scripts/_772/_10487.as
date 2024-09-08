package _772
{
   public class _10487 implements _774
   {
      public static const TYPE_NONE:int = 0;
      
      public static const TYPE_ARMATURE:int = 1;
      
      public static const TYPE_MC:int = 2;
      
      public static const TYPE_STAGE:int = 3;
      
      public static const TYPE_COMIC:int = 4;
      
      public var type:int;
      
      public var name:int = 46;
      
      public function _10487()
      {
         super();
      }
      
      public function _5965() : Object
      {
         var _loc1_:Object = {};
         _loc1_.Name = this.name;
         _loc1_.type = this.type;
         return _loc1_;
      }
   }
}

