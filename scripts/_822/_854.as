package _822
{
   import _1045.Group;
   import _1045._1082;
   
   public class _854 extends Group
   {
      public var color:uint;
      
      public function _854()
      {
         super();
      }
      
      override protected function _2438() : void
      {
         super._2438();
         var _loc1_:_1082 = new _1082();
         _loc1_.horizontalCenter = 0;
         _loc1_.width = 1;
         _loc1_.percentHeight = 100;
         _loc1_.fillColor = this.color;
         this.addElement(_loc1_);
      }
   }
}

