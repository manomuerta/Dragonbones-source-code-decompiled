package _804
{
   import _1045._1046;
   import _1045._1084;
   import _1185._1189;
   import _790._797;
   
   public class _806 extends _1084
   {
      public var _2490:_1046;
      
      public function _806()
      {
         super();
         this.states = ["normal","disabled"];
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this._2490 = new _1046();
         this._2490.percentWidth = 100;
         this._2490.percentHeight = 100;
         this.addElement(this._2490);
         var _loc1_:_1189 = new _1189();
         _loc1_.gap = 2;
         this._2490.layout = _loc1_;
         this._2490.itemRenderer = _797;
         this._2490._2514 = _805;
      }
      
      override protected function _2519() : void
      {
         super._2519();
         if(_2080 != "normal")
         {
            if(_2080 == "disabled")
            {
            }
         }
      }
   }
}

