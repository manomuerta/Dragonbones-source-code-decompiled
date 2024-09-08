package _1439
{
   import _1185._1188;
   import _1185._1189;
   import _1376.CloseTabButton;
   import _1376._1377;
   
   public class _1447 extends _1480
   {
      public var _9725:_1377;
      
      public function _1447()
      {
         super();
      }
      
      override protected function _2438() : void
      {
         super._2438();
         _2515.itemRenderer = CloseTabButton;
         _2515._2514 = CloseTabButtonSkin;
         var _loc1_:_1189 = new _1189();
         _loc1_.gap = -1;
         _loc1_._2401 = _1188.LEFT;
         _2515.layout = _loc1_;
         this._9725 = new _1377();
         this._9725.skinName = _1446;
         this._9725.width = 30;
         this.addElement(this._9725);
      }
   }
}

