package _890
{
   import _1045.Label;
   import _1045._1084;
   
   public class _892 extends _1084
   {
      public var _6487:Label;
      
      public var _6486:_889;
      
      public function _892()
      {
         this._6487 = new Label();
         this._6486 = new _889();
         super();
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this._6486.percentHeight = 100;
         this._6486.percentWidth = 100;
         this.addElement(this._6487);
      }
   }
}

