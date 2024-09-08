package _13212
{
   import _1045.Scroller;
   import _1045._1046;
   import _1045._1084;
   import egret.core._1139;
   
   public class _13214 extends _1084
   {
      public var _2491:Scroller;
      
      public var _2490:_1046;
      
      public function _13214()
      {
         super();
         this.states = ["normal","disabled"];
      }
      
      override protected function _2438() : void
      {
         this._2491 = new Scroller();
         this._2491._6182 = _1139.OFF;
         this._2490 = new _1046();
         this._2490.itemRenderer = _13215;
         this._2491.viewport = this._2490;
         this.addElement(this._2491);
         this._2491.percentHeight = 100;
         this._2491.percentWidth = 100;
      }
   }
}

