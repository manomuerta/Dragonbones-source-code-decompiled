package _1185
{
   import flash.geom.Rectangle;
   
   public class _1191 extends _1186
   {
      public function _1191()
      {
         super();
      }
      
      override protected function _7923(param1:Rectangle) : Rectangle
      {
         var _loc2_:Rectangle = new Rectangle();
         _loc2_.left = param1.left - 20;
         _loc2_.right = param1.left;
         return _loc2_;
      }
      
      override protected function _7922(param1:Rectangle) : Rectangle
      {
         var _loc2_:Rectangle = new Rectangle();
         _loc2_.left = param1.right;
         _loc2_.right = param1.right + 20;
         return _loc2_;
      }
      
      override protected function _7926(param1:Rectangle) : Rectangle
      {
         var _loc2_:Rectangle = new Rectangle();
         _loc2_.top = param1.top - 20;
         _loc2_.bottom = param1.top;
         return _loc2_;
      }
      
      override protected function _7925(param1:Rectangle) : Rectangle
      {
         var _loc2_:Rectangle = new Rectangle();
         _loc2_.top = param1.bottom;
         _loc2_.bottom = param1.bottom + 20;
         return _loc2_;
      }
   }
}

