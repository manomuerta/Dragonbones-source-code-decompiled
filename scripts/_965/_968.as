package _965
{
   import _1045._1084;
   import _1045._1105;
   
   public class _968 extends _1084
   {
      public var _2448:_1105;
      
      public function _968()
      {
         super();
         this.minHeight = this.minWidth = 8;
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this._2448 = new _1105();
         this._2448.graphics.beginFill(16777215);
         this._2448.graphics.drawCircle(4,4,4);
         this._2448.graphics.endFill();
         this.addElement(this._2448);
      }
   }
}

