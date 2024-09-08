package _13191
{
   import _1404._1407;
   import _555._13201;
   import _555._13202;
   import _93._92;
   
   public class _13195 extends _92
   {
      private var _3108:Vector.<_13196>;
      
      public function _13195()
      {
         super();
         _2215 = true;
         _2219 = true;
      }
      
      override public function _1572(param1:*) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:_13196 = null;
         super._1572(param1);
         this._3108 = new Vector.<_13196>();
         _loc2_ = 0;
         _loc3_ = int(this._13249.length);
         while(_loc2_ < _loc3_)
         {
            _loc4_ = new _13196();
            _loc4_._1572(this._13249[_loc2_]);
            this._3108.push(_loc4_);
            _loc2_++;
         }
      }
      
      override public function execute() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         super.execute();
         _loc1_ = 0;
         _loc2_ = int(this._3108.length);
         while(_loc1_ < _loc2_)
         {
            this._3108[_loc1_].execute();
            _loc1_++;
         }
         this._2894();
      }
      
      override public function revert() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         super.revert();
         _loc1_ = 0;
         _loc2_ = int(this._3108.length);
         while(_loc1_ < _loc2_)
         {
            this._3108[_loc1_].revert();
            _loc1_++;
         }
         this._2894();
      }
      
      private function _2894() : void
      {
         this._13242._13248();
      }
      
      protected function get _13249() : Array
      {
         return _2223._13249 as Array;
      }
      
      private function get _13241() : _13202
      {
         return _1407.getInstance(_13202) as _13202;
      }
      
      private function get _13242() : _13201
      {
         return _1407.getInstance(_13201) as _13201;
      }
   }
}

