package _127
{
   import _1045.Scroller;
   import _1045._1046;
   import _1045._1084;
   import _1088.ItemRenderer;
   import _1185._1186;
   
   public class _132 extends _1084
   {
      public var _2491:Scroller;
      
      public var _2490:_1046;
      
      public function _132()
      {
         super();
         this.states = ["normal","disabled"];
      }
      
      override protected function _2438() : void
      {
         this._2491 = new Scroller();
         this._2490 = new _1046();
         this._2490.itemRenderer = ItemRenderer;
         this.addElement(this._2490);
         var _loc1_:_1186 = new _1186();
         this._2490.layout = _loc1_;
      }
   }
}

