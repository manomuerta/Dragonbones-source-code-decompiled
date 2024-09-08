package _127
{
   import _1045.Button;
   import _172._173;
   import _172._174;
   
   public class _150 extends _174
   {
      public function _150()
      {
         super();
      }
      
      public function confirmation() : void
      {
         _2556(_173.OK_ID);
      }
      
      public function get _13693() : Boolean
      {
         var _loc1_:Button = _2641(_173.OK_ID);
         if(Boolean(_loc1_) && _loc1_.enabled)
         {
            return true;
         }
         return false;
      }
   }
}

