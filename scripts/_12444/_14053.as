package _12444
{
   import _13503._13502;
   import _13505._13504;
   import _93._92;
   
   public class _14053 extends _92
   {
      public function _14053()
      {
         super();
      }
      
      override public function _1572(param1:*) : void
      {
         _2223 = param1;
      }
      
      override protected function _2211() : *
      {
         return this._1992._1873(this._14396._1823);
      }
      
      override public function execute() : void
      {
         var _loc1_:int = 0;
         super.execute();
         _2213();
         if(_2208)
         {
            _loc1_ = int(this._1992._1746.indexOf(_2208));
            this._1992._1746[_loc1_] = this._14396;
         }
      }
      
      override public function revert() : void
      {
         var _loc1_:_13504 = null;
         var _loc2_:int = 0;
         super.revert();
         if(_2208)
         {
            _loc1_ = this._1992._1873(this._14396._1823);
            _loc2_ = int(this._1992._1746.indexOf(_loc1_));
            this._1992._1746[_loc2_] = _2208;
         }
      }
      
      public function get _14396() : _13504
      {
         return _2223._14396;
      }
      
      public function get _1992() : _13502
      {
         return _2223._1992;
      }
   }
}

