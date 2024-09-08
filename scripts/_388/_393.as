package _388
{
   import _1404._1407;
   import _579._578;
   import _93._92;
   
   public class _393 extends _92
   {
      public function _393()
      {
         super();
         _2215 = false;
         _2219 = true;
      }
      
      override public function execute() : void
      {
         super.execute();
         if(this.target == "bone")
         {
            _2214._1844._2969 = this.value;
         }
         else if(this.target == "image")
         {
            _2214._1844._2968 = this.value;
         }
         this._3331._3330();
      }
      
      override public function revert() : void
      {
         super.revert();
      }
      
      protected function get target() : String
      {
         return _2223.target;
      }
      
      protected function get value() : Boolean
      {
         return _2223.value;
      }
      
      protected function get _3331() : _578
      {
         return _1407.getInstance(_578) as _578;
      }
   }
}

