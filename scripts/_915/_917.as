package _915
{
   import _1045.Group;
   import _1045.Label;
   import _1045._1082;
   import _1045._1084;
   import _97._125;
   
   public class _917 extends _1084
   {
      public var _4444:Label;
      
      public var _6594:_1082;
      
      public function _917()
      {
         super();
      }
      
      override protected function _2438() : void
      {
         var _loc1_:Group = null;
         super._2438();
         _loc1_ = _125._2414();
         _loc1_.left = 6;
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         this._4444 = new Label();
         this._6594 = new _1082();
         this._6594.width = 12;
         this._6594.height = 12;
         _loc1_.addElement(this._6594);
         _loc1_.addElement(this._4444);
         addElement(_loc1_);
      }
   }
}

