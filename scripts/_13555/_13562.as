package _13555
{
   import _1045.Button;
   
   public class _13562 extends Button
   {
      private var _selected:Boolean = false;
      
      public function _13562()
      {
         super();
      }
      
      public function set selected(param1:Boolean) : void
      {
         this._selected = param1;
         _2570();
      }
      
      override protected function _6231() : String
      {
         if(this._selected)
         {
            return "selected";
         }
         return "normal";
      }
   }
}

