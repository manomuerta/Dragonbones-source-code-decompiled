package _668
{
   import _51._50;
   import _676._677;
   import _676._697;
   import _703._705;
   import _93._95;
   import flash.utils.Dictionary;
   
   public class _673 extends _95
   {
      private static var _5801:Dictionary = new Dictionary(false);
      
      private var _3251:_50;
      
      public function _673()
      {
         super();
      }
      
      public function get _1886() : _50
      {
         return this._3251;
      }
      
      public function set _1886(param1:_50) : void
      {
         var _loc2_:_677 = null;
         if(this._3251 == param1)
         {
            return;
         }
         this._3251 = param1;
         if(this._3251)
         {
            if(!this._3997)
            {
               _5801[this._3251] = new _697();
               (_5801[this._3251] as _697)._5804 = true;
            }
            _loc2_ = _705._2951[this._3251];
            if(!_loc2_)
            {
               _loc2_ = _677._1572(this._3251);
            }
            this._3997.source = _loc2_;
         }
      }
      
      public function get _3997() : _697
      {
         return _5801[this._3251];
      }
      
      public function get _2879() : _677
      {
         return this._3997.source as _677;
      }
   }
}

