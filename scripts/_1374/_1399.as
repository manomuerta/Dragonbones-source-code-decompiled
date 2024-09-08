package _1374
{
   import _1045.Button;
   
   public class _1399 extends Button
   {
      private var _9785:Boolean = false;
      
      public function _1399()
      {
         super();
      }
      
      public function get _9786() : Boolean
      {
         return this._9785;
      }
      
      public function set _9786(param1:Boolean) : void
      {
         if(this._9785 == param1)
         {
            return;
         }
         this._9785 = param1;
         _2570();
      }
      
      override protected function _6231() : String
      {
         if(enabled && this._9785 && super._6231() != "down")
         {
            return "over";
         }
         return super._6231();
      }
   }
}

