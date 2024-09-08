package _1155
{
   public class _1156 implements _1158
   {
      private var _8826:Number = 0.5;
      
      public function _1156(param1:Number = 0.5)
      {
         super();
         this._8827 = param1;
      }
      
      public function get _8827() : Number
      {
         return this._8826;
      }
      
      public function set _8827(param1:Number) : void
      {
         this._8826 = param1;
      }
      
      public function ease(param1:Number) : Number
      {
         var _loc2_:Number = 1 - this._8826;
         if(param1 <= this._8826 && this._8826 > 0)
         {
            return this._8826 * this.easeIn(param1 / this._8826);
         }
         return this._8826 + _loc2_ * this.easeOut((param1 - this._8826) / _loc2_);
      }
      
      protected function easeIn(param1:Number) : Number
      {
         return param1;
      }
      
      protected function easeOut(param1:Number) : Number
      {
         return param1;
      }
   }
}

