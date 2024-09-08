package _965
{
   import _1045._1084;
   import _1045._1105;
   
   public class _969 extends _1084
   {
      public var _2448:_1105;
      
      public function _969()
      {
         super();
         this.minHeight = this.minWidth = 6;
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this._2448 = new _1105();
         this._2448.graphics.beginFill(2699835);
         this._2448.graphics.drawRect(0,0,100,4);
         this._2448.graphics.endFill();
         this.addElement(this._2448);
      }
   }
}

