package _13191
{
   import _1404._1407;
   import _51._50;
   import _555._13201;
   import _648._13209;
   import _93._92;
   
   public class _13197 extends _92
   {
      public function _13197()
      {
         super();
         _2219 = true;
         _2215 = true;
      }
      
      override public function execute() : void
      {
         super.execute();
         this.model._13253 = this._13251;
         if(this._1886)
         {
            this._1886.playTimes = this._13251;
         }
         this._2894();
      }
      
      override public function revert() : void
      {
         super.revert();
         this.model._13253 = this._13252;
         if(this._1886)
         {
            this._1886.playTimes = this._13252;
         }
         this._2894();
      }
      
      private function get _1886() : _50
      {
         return _2223._1886 as _50;
      }
      
      private function get model() : _13209
      {
         return _2223.sheetModel as _13209;
      }
      
      private function get _13252() : int
      {
         return int(_2223._13252);
      }
      
      private function get _13251() : int
      {
         return int(_2223._13251);
      }
      
      private function _2894() : void
      {
         this._13242._13250();
      }
      
      private function get _13242() : _13201
      {
         return _1407.getInstance(_13201) as _13201;
      }
   }
}

