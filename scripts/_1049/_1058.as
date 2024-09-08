package _1049
{
   import _1045.Grid;
   import _1045.Group;
   import _1193._1192;
   import egret.core.ns_egret;
   
   use namespace ns_egret;
   
   public class _1058 extends Group
   {
      public function _1058()
      {
         super();
         layout = new _1192();
      }
      
      override public function invalidateDisplayList() : void
      {
         var _loc1_:Grid = parent as Grid;
         if(Boolean(_loc1_) && _loc1_.ns_egret::_7695)
         {
            return;
         }
         if(_loc1_)
         {
            _loc1_.invalidateDisplayList();
         }
      }
      
      override public function invalidateSize() : void
      {
         var _loc1_:Grid = parent as Grid;
         if(Boolean(_loc1_) && _loc1_.ns_egret::_7695)
         {
            return;
         }
         if(_loc1_)
         {
            _loc1_.invalidateSize();
         }
      }
   }
}

