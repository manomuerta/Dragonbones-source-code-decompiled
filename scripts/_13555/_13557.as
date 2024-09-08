package _13555
{
   import _1045.Label;
   import _1088.ItemRenderer;
   
   public class _13557 extends ItemRenderer
   {
      public var _13965:Label;
      
      public function _13557()
      {
         super();
         this.skinName = _13558;
      }
      
      override protected function _6699() : void
      {
         this._13965.htmlText = data.htmlText;
      }
   }
}

