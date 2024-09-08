package _521
{
   import _658._661;
   import _783.BoundingBoxNotification;
   
   public class _11241 extends _533
   {
      private var _3822:Vector.<_661>;
      
      public function _11241()
      {
         super();
         this._3822 = new Vector.<_661>();
      }
      
      public function get _3823() : Vector.<_661>
      {
         return this._3822;
      }
      
      override protected function _3778() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         this._3822.length = 0;
         _loc1_ = 0;
         _loc2_ = int(_3780.length);
         while(_loc1_ < _loc2_)
         {
            this._3822.push(_3780[_loc1_] as _661);
            _loc1_++;
         }
         _1567(new BoundingBoxNotification(BoundingBoxNotification.UPDATE_SELECT_VERTICES));
      }
   }
}

