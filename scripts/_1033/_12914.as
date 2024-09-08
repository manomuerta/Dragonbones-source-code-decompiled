package _1033
{
   import _1045.Button;
   import _1045._1084;
   import _1045._1105;
   
   public class _12914 extends _1084
   {
      public var background:_1105;
      
      public var closeButton:Button;
      
      public function _12914()
      {
         super();
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this.background = new _1105();
         this.background.left = 0;
         this.background.right = 0;
         this.background.top = 0;
         this.background.bottom = 0;
         this.addElement(this.background);
         this.closeButton = new Button();
         this.closeButton.skinName = _12915;
         this.closeButton.right = 0;
         this.closeButton.top = 0;
         this.addElement(this.closeButton);
      }
   }
}

