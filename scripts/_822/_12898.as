package _822
{
   import _1075.MenuBarItemRenderer;
   
   public class _12898 extends MenuBarItemRenderer
   {
      public var limited:Boolean;
      
      public function _12898()
      {
         super();
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

