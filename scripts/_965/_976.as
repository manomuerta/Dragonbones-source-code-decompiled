package _965
{
   import _1045._1082;
   import _1045._1084;
   
   public class _976 extends _1084
   {
      public var _2448:_1082;
      
      public function _976()
      {
         super();
         this.minHeight = this.minWidth = 12;
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this._2448 = new _1082();
         this._2448.fillColor = 1975081;
         this._2448._2529 = 0;
         this._2448.percentWidth = this._2448.percentHeight = 100;
         this.addElement(this._2448);
      }
   }
}

