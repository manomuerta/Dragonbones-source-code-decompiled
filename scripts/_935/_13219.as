package _935
{
   import _1045.Group;
   import _953._13221;
   import _953._13222;
   import _97._125;
   
   public class _13219 extends _938
   {
      public var sheetPanel:_13221;
      
      private var g:Group;
      
      public function _13219()
      {
         super();
         _6679 = _13222;
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this.sheetPanel = new _13221();
         this.g = _125._2397();
         this.g.bottom = 5;
         this.g.left = gap;
         this.g.percentWidth = 100;
         addElement(this.g);
         this.g.addElement(this.sheetPanel);
      }
      
      override public function _14625(param1:int) : void
      {
         super._14625(param1);
         this.g.left = param1;
      }
   }
}

