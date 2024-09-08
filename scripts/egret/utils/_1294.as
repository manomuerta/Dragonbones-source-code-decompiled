package egret.utils
{
   import flash.utils.Dictionary;
   
   public class _1294
   {
      private var cache:Dictionary;
      
      public function _1294()
      {
         this.cache = new Dictionary(true);
         super();
      }
      
      public function push(param1:*) : void
      {
         this.cache[param1] = null;
      }
      
      public function get() : *
      {
         var _loc1_:* = undefined;
         var _loc2_:int = 0;
         var _loc3_:* = this.cache;
         for(_loc1_ in _loc3_)
         {
            delete this.cache[_loc1_];
            return _loc1_;
         }
      }
      
      public function reset() : void
      {
         this.cache = new Dictionary(true);
      }
   }
}

