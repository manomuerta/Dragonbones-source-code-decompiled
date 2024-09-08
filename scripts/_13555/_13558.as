package _13555
{
   import _1045.Group;
   import _1045.Label;
   import _1045._1084;
   import _97._125;
   import flash.text.TextFormatAlign;
   
   public class _13558 extends _1084
   {
      public var container:Group;
      
      public var _13965:Label;
      
      public function _13558()
      {
         super();
      }
      
      override protected function _2438() : void
      {
         this.container = _125._2397(0);
         this.container.width = 640;
         this.container.height = 500;
         addElement(this.container);
         this._13965 = new Label();
         this._13965.maxWidth = 400;
         this._13965.leading = 5;
         this._13965._6080 = 0;
         this._13965.textAlign = TextFormatAlign.LEFT;
         this._13965.size = 14;
         this._13965.textColor = 39679;
         this.container.addElement(this._13965);
      }
   }
}

