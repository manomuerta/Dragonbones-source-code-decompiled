package _890
{
   import _1045.Label;
   import _1374.IconButton;
   
   public class _896 extends _892
   {
      public var btn:IconButton;
      
      public var _6490:Label;
      
      public function _896()
      {
         this.btn = new IconButton();
         this._6490 = new Label();
         super();
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this.addElement(this.btn);
         this.addElement(this._6490);
         this.btn.percentWidth = 90;
         this.btn.verticalCenter = 0;
         this.btn.mouseEnabled = false;
         this.btn.mouseChildren = false;
         this.btn._2576 = false;
         this._6490.mouseEnabled = false;
         this._6490.verticalCenter = 0;
         this._6490.bold = true;
      }
   }
}

