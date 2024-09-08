package _1439
{
   import _1045._1082;
   import _1045._1084;
   
   public class _1275 extends _1084
   {
      public function _1275()
      {
         super();
         this.states = ["up","over","down","disabled"];
      }
      
      override protected function _2438() : void
      {
         var _loc1_:_1082 = new _1082();
         _loc1_._2529 = 0;
         _loc1_.fillColor = 0;
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         this.addElement(_loc1_);
      }
   }
}

