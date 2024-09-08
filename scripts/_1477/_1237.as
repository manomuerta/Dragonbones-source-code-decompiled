package _1477
{
   import _1045._1084;
   import _1045._1105;
   import flash.geom.Rectangle;
   
   public class _1237 extends _1084
   {
      private var _10056:Class;
      
      public function _1237()
      {
         this._10056 = _1237__10056;
         super();
      }
      
      override protected function _2438() : void
      {
         super._2438();
         var _loc1_:_1105 = new _1105(this._10056);
         _loc1_.left = _loc1_.right = 0;
         _loc1_.top = _loc1_.bottom = 0;
         _loc1_.minWidth = _loc1_.minHeight = 13;
         _loc1_.scale9Grid = new Rectangle(1,1,1,1);
         this.addElement(_loc1_);
      }
   }
}

