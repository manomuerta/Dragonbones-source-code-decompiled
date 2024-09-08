package _388
{
   import _708._717;
   import _93._92;
   
   public class _395 extends _92
   {
      public function _395()
      {
         super();
      }
      
      override public function execute() : void
      {
         if(this.has())
         {
            _2212._3334._3335(_1642);
         }
      }
      
      private function has() : Boolean
      {
         var _loc1_:String = null;
         if(!_1642 || !(_1642 is String))
         {
            return false;
         }
         for each(_loc1_ in _717.All_ITEMS)
         {
            if(_loc1_ == _1642)
            {
               return true;
            }
         }
         return false;
      }
   }
}

