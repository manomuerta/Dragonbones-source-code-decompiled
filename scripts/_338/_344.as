package _338
{
   import _1404._1407;
   import _555._571;
   
   public class _344 extends _342
   {
      public function _344()
      {
         super();
      }
      
      override public function execute() : void
      {
         if(this._3218())
         {
            this._3216._3217(_1642);
         }
      }
      
      private function get _3216() : _571
      {
         return _1407.getInstance(_571) as _571;
      }
      
      private function _3218() : Boolean
      {
         if(_1642 != null && _1642 is Boolean)
         {
            return true;
         }
         return false;
      }
   }
}

