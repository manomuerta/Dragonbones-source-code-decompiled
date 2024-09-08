package _226
{
   import _1404._1407;
   import _51._52;
   import _555._570;
   import _555._576;
   import _93._92;
   
   public class _247 extends _92
   {
      public function _247()
      {
         super();
         _2219 = true;
         _2215 = true;
      }
      
      override public function execute() : void
      {
         super.execute();
         this._2966(this._2965);
         this._2894();
      }
      
      override public function revert() : void
      {
         super.revert();
         this._2966(this._2964);
         this._2894();
      }
      
      protected function _2966(param1:Array) : void
      {
         var _loc2_:_52 = null;
         var _loc3_:int = 0;
         var _loc4_:int = int(this._2957.length);
         while(_loc3_ < _loc4_)
         {
            _loc2_ = this._2957[_loc3_];
            _loc2_.inheritScale = param1[_loc3_ * 2];
            _loc2_.inheritRotation = param1[_loc3_ * 2 + 1];
            _2212._2881(_loc2_);
            _loc3_++;
         }
      }
      
      protected function _2894() : void
      {
         _576(_1407.getInstance(_576)).refresh();
         _570(_1407.getInstance(_570)).refresh();
      }
      
      override protected function _2211() : *
      {
         var _loc2_:_52 = null;
         var _loc1_:Array = [];
         for each(_loc2_ in this._2957)
         {
            _loc1_.push(_loc2_.inheritScale,_loc2_.inheritRotation);
         }
         return _loc1_;
      }
      
      protected function get _2957() : Array
      {
         return _2223.items;
      }
      
      protected function get _2965() : Array
      {
         return _2223.inheritValueList;
      }
      
      protected function get _2964() : Array
      {
         return _2208;
      }
   }
}

