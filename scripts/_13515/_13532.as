package _13515
{
   import _13492._13496;
   import _93._92;
   
   public class _13532 extends _92
   {
      public function _13532()
      {
         super();
         _2219 = true;
         _2215 = true;
      }
      
      override public function execute() : void
      {
         this._1946.value = this.newValue;
      }
      
      override public function revert() : void
      {
         this._1946.value = this.oldValue;
      }
      
      private function get _1946() : _13496
      {
         return _2223._1946;
      }
      
      private function get newValue() : *
      {
         return _2223.newValue;
      }
      
      private function get oldValue() : *
      {
         return _2223.oldValue;
      }
   }
}

