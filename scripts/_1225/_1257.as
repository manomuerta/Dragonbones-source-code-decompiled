package _1225
{
   import _1045.HScrollBar;
   import _1045.VScrollBar;
   import _1278._1277;
   
   public class _1257 extends _1277
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
         this._8292.skinName = _1235;
         addElement(this._8292);
         this._8294 = new VScrollBar();
         this._8294.visible = false;
         this._8294.skinName = _1270;
         addElement(this._8294);
      }
      
      override public function _5823(param1:Number, param2:Number) : void
      {
         super._5823(param1,param2);
      }
   }
}

