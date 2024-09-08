package _13191
{
   import _1404._1407;
   import _51._79;
   import _555._13201;
   import _93._92;
   
   public class _13198 extends _92
   {
      public function _13198()
      {
         super();
         _2219 = true;
         _2215 = true;
      }
      
      override public function execute() : void
      {
         super.execute();
         this._13254(this._13255);
         this._2894();
      }
      
      override public function revert() : void
      {
         super.revert();
         this._13254(this._13256);
         this._2894();
      }
      
      private function _2894() : void
      {
         this._13242.refresh();
      }
      
      private function _13254(param1:Array) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         this._1837._1715.length = 0;
         _loc2_ = 0;
         _loc3_ = int(param1.length);
         while(_loc2_ < _loc3_)
         {
            this._1837._1715.push(param1[_loc2_]);
            _loc2_++;
         }
      }
      
      protected function get _1837() : _79
      {
         return _2223._1837;
      }
      
      protected function get _13256() : Array
      {
         return _2223._13256;
      }
      
      protected function get _13255() : Array
      {
         return _2223._13255;
      }
      
      private function get _13242() : _13201
      {
         return _1407.getInstance(_13201) as _13201;
      }
   }
}

