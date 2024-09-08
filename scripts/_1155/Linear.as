package _1155
{
   public class Linear implements _1158
   {
      private var _8826:Number = 0;
      
      private var _8828:Number = 0;
      
      public function Linear(param1:Number = 0, param2:Number = 0)
      {
         super();
         this._8827 = param1;
         this._8825 = param2;
      }
      
      public function get _8827() : Number
      {
         return this._8826;
      }
      
      public function set _8827(param1:Number) : void
      {
         this._8826 = param1;
      }
      
      public function get _8825() : Number
      {
         return this._8828;
      }
      
      public function set _8825(param1:Number) : void
      {
         this._8828 = param1;
      }
      
      public function ease(param1:Number) : Number
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         if(this._8827 == 0 && this._8825 == 0)
         {
            return param1;
         }
         var _loc2_:Number = 1 / (1 - this._8827 / 2 - this._8825 / 2);
         if(param1 < this._8827)
         {
            return param1 * _loc2_ * (param1 / this._8827) / 2;
         }
         if(param1 > 1 - this._8825)
         {
            _loc3_ = param1 - (1 - this._8825);
            _loc4_ = _loc3_ / this._8825;
            return _loc2_ * (1 - this._8827 / 2 - this._8825 + _loc3_ * (2 - _loc4_) / 2);
         }
         return _loc2_ * (param1 - this._8827 / 2);
      }
   }
}

