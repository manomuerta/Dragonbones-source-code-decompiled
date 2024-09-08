package _772
{
   public class _10254 implements _774
   {
      public static const OP_PREVIEW:int = 1;
      
      public static const OP_EXPORT:int = 2;
      
      public var name:int = 27;
      
      public var op:int = 2;
      
      public var type:int;
      
      public var value1:uint;
      
      public var result:String;
      
      public var data:String;
      
      public function _10254()
      {
         super();
      }
      
      public function _5965() : Object
      {
         var _loc1_:Object = {};
         _loc1_.Name = this.name;
         _loc1_.op = this.op;
         _loc1_.type = 1;
         _loc1_.data = this.data;
         return _loc1_;
      }
   }
}

