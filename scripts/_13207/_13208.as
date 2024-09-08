package _13207
{
   import _51._71;
   import _93._95;
   
   public class _13208 extends _95
   {
      public static const TOTAL_NUM:int = 10;
      
      public var groups:Vector.<_13206>;
      
      public function _13208()
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         this.groups = new Vector.<_13206>();
         super();
         _loc1_ = 0;
         _loc2_ = TOTAL_NUM;
         while(_loc1_ < _loc2_)
         {
            this.groups[_loc1_] = new _13206();
            _loc1_++;
         }
      }
      
      public function _5965() : Object
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc1_:Array = [];
         _loc2_ = 0;
         _loc3_ = int(this.groups.length);
         while(_loc2_ < _loc3_)
         {
            _loc1_.push(this.groups[_loc2_]._5965());
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function _13351(param1:_71, param2:Array) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(param2 == null || param2.length != this.groups.length || param1 == null)
         {
            return;
         }
         _loc3_ = 0;
         _loc4_ = int(this.groups.length);
         while(_loc3_ < _loc4_)
         {
            this.groups[_loc3_].clear();
            this.groups[_loc3_]._13386(param1,param2[_loc3_]);
            _loc3_++;
         }
      }
      
      public function clear() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         _loc1_ = 0;
         _loc2_ = int(this.groups.length);
         while(_loc1_ < _loc2_)
         {
            this.groups[_loc1_].clear();
            _loc1_++;
         }
      }
   }
}

