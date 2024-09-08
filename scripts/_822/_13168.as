package _822
{
   import _1374.IconButton;
   import _834._13169;
   
   public class _13168 extends IconButton
   {
      private var _12942:Boolean;
      
      public function _13168()
      {
         super();
         this.skinName = _13169;
      }
      
      public function get limited() : Boolean
      {
         return this._12942;
      }
      
      public function set limited(param1:Boolean) : void
      {
         this._12942 = param1;
         this._2570();
      }
      
      override protected function _6231() : String
      {
         var _loc1_:String = super._6231();
         if(this.limited)
         {
            return "limited_" + _loc1_;
         }
         return _loc1_;
      }
   }
}

