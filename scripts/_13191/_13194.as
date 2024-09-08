package _13191
{
   import _1404._1407;
   import _51._50;
   import _555._13201;
   import _93._92;
   
   public class _13194 extends _92
   {
      public function _13194()
      {
         super();
         _2219 = true;
         _2215 = true;
      }
      
      override public function _1572(param1:*) : void
      {
         super._1572(param1);
         _2223._2948 = this._1886.frameRate;
      }
      
      override public function execute() : void
      {
         super.execute();
         this._1886.frameRate = this._2947;
         this._2894();
      }
      
      override public function revert() : void
      {
         super.revert();
         this._1886.frameRate = this._2948;
         this._2894();
      }
      
      private function get _1886() : _50
      {
         return _2223._1886 as _50;
      }
      
      private function get _2948() : uint
      {
         return uint(_2223._2948);
      }
      
      private function get _2947() : uint
      {
         return uint(_2223._2947);
      }
      
      private function _2894() : void
      {
         this._13242._13247();
      }
      
      private function get _13242() : _13201
      {
         return _1407.getInstance(_13201) as _13201;
      }
   }
}

