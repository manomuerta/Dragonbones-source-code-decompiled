package _818
{
   import _1045._1046;
   import _1045._1084;
   import _1185._1189;
   
   public class _817 extends _1084
   {
      public var _2490:_1046;
      
      public function _817()
      {
         super();
         this.states = ["normal","disabled"];
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this._2490 = new _1046();
         this._2490.percentHeight = 100;
         this._2490.percentWidth = 100;
         this.addElement(this._2490);
         var _loc1_:_1189 = new _1189();
         _loc1_.gap = -1;
         _loc1_.padding = 2;
         this._2490.layout = _loc1_;
         this._2490.itemRenderer = _819;
         this._2490._2514 = _820;
      }
   }
}

