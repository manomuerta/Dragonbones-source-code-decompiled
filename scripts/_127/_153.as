package _127
{
   import _1045._1084;
   import _1045._1105;
   
   public class _153 extends _1084
   {
      public var _2448:_1105;
      
      public function _153()
      {
         super();
         this.minHeight = this.minWidth = 6;
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this._2448 = new _1105();
         this._2448.graphics.beginFill(3687762);
         this._2448.graphics.drawRect(0,0,60,4);
         this._2448.graphics.endFill();
         this.addElement(this._2448);
      }
   }
}

