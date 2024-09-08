package _13515
{
   import _1404._1407;
   import _555._570;
   import _93._92;
   
   public class _13519 extends _13521
   {
      private var _13723:_92;
      
      public function _13519()
      {
         super();
      }
      
      override public function execute() : void
      {
         super.execute();
         this._2894();
      }
      
      override public function revert() : void
      {
         super.revert();
         this._2894();
      }
      
      private function _2894() : void
      {
         _2852.refresh();
         _2852._3140();
         _2852._3002();
         this._2853.refresh();
      }
      
      protected function get _2853() : _570
      {
         return _1407.getInstance(_570) as _570;
      }
   }
}

