package _1477
{
   import _1045.HScrollBar;
   import _1045.VScrollBar;
   import _1045._1084;
   
   public class _1257 extends _1084
   {
      public var _8292:HScrollBar;
      
      public var _8294:VScrollBar;
      
      public function _1257()
      {
         super();
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this._8292 = new HScrollBar();
         this._8292.visible = false;
         addElement(this._8292);
         this._8294 = new VScrollBar();
         this._8294.visible = false;
         addElement(this._8294);
      }
   }
}

