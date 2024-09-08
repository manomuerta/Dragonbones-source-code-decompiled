package _319
{
   import _658._661;
   
   public class _325 extends _328
   {
      public function _325()
      {
         super();
         _2215 = true;
         _2219 = true;
      }
      
      override public function execute() : void
      {
         super.execute();
         mesh._3159(this.v0,this.v1,true);
         _2894();
      }
      
      override public function revert() : void
      {
         super.revert();
         mesh._3164(this.v0,this.v1);
         _2894();
      }
      
      protected function get v0() : _661
      {
         return _2223.v0 as _661;
      }
      
      protected function get v1() : _661
      {
         return _2223.v1 as _661;
      }
   }
}

