package _388
{
   import _1404._1407;
   import _579._578;
   import _93._92;
   
   public class _407 extends _92
   {
      public function _407()
      {
         super();
         _2215 = true;
         _2219 = true;
      }
      
      override public function execute() : void
      {
         super.execute();
         this._3331._3360(false);
      }
      
      override public function revert() : void
      {
         super.revert();
         this._3331._3360(false);
      }
      
      public function get _3331() : _578
      {
         return _1407.getInstance(_578) as _578;
      }
   }
}

