package _12444
{
   import _13503._13502;
   import _13505._13507;
   import _93._92;
   
   public class _14056 extends _92
   {
      public function _14056()
      {
         super();
      }
      
      override public function _1572(param1:*) : void
      {
         _2223 = param1;
      }
      
      override protected function _2211() : *
      {
         return this._1992._1881(this._14402._1826);
      }
      
      override public function execute() : void
      {
         var _loc1_:int = 0;
         super.execute();
         _2213();
         if(_2208)
         {
            _loc1_ = int(this._1992._1753.indexOf(_2208));
            this._1992._1753[_loc1_] = this._14402;
         }
      }
      
      override public function revert() : void
      {
         var _loc1_:_13507 = null;
         var _loc2_:int = 0;
         super.revert();
         if(_2208)
         {
            _loc1_ = this._1992._1881(this._14402._1826);
            _loc2_ = int(this._1992._1753.indexOf(_loc1_));
            this._1992._1753[_loc2_] = _2208;
         }
      }
      
      public function get _14402() : _13507
      {
         return _2223._14402;
      }
      
      public function get _1992() : _13502
      {
         return _2223._1992;
      }
   }
}

