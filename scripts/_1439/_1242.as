package _1439
{
   import _1045.Scroller;
   import _1045._1046;
   import _1045._1084;
   import _1088.ItemRenderer;
   import _1185._1188;
   import _1185._1197;
   import _1477._1257;
   
   public class _1242 extends _1084
   {
      public var _2491:Scroller;
      
      public var _2490:_1046;
      
      public function _1242()
      {
         super();
         this.states = ["normal","disabled"];
      }
      
      override protected function _2438() : void
      {
         this._2491 = new Scroller();
         this._2491.left = this._2491.top = this._2491.bottom = 0;
         this._2491.right = 0;
         this._2491._6243 = 0;
         this._2491.skinName = _1257;
         this.addElement(this._2491);
         this._2490 = new _1046();
         this._2490.itemRenderer = ItemRenderer;
         this._2491.viewport = this._2490;
         var _loc1_:_1197 = new _1197();
         _loc1_._2401 = _1188.CONTENT_JUSTIFY;
         _loc1_.gap = 0;
         this._2490.layout = _loc1_;
      }
   }
}

