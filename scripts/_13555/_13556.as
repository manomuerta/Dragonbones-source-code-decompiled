package _13555
{
   import _1045.Group;
   import _1045.Label;
   import _1045._1084;
   import _1045._1105;
   import _97._125;
   import flash.text.TextFormatAlign;
   
   public class _13556 extends _1084
   {
      public var img:_1105;
      
      public var _13965:Label;
      
      public var container:Group;
      
      public var _2566:Group;
      
      public var _6333:Group;
      
      public function _13556()
      {
         this.img = new _1105();
         super();
      }
      
      override protected function _2438() : void
      {
         this.container = _125._2413(20);
         this.container.width = 640;
         this.container.height = 500;
         addElement(this.container);
         this._2566 = _125._2397(0);
         this._2566.width = 640;
         this._2566.height = 400;
         this.container.addElement(this._2566);
         this._2566.addElement(this.img);
         this._6333 = _125._13690(0);
         this._6333.width = 640;
         this._6333.height = 100;
         this.container.addElement(this._6333);
         this._13965 = new Label();
         this._13965.maxWidth = 400;
         this._13965.leading = 5;
         this._13965._6080 = 0;
         this._13965.textAlign = TextFormatAlign.LEFT;
         this._13965.size = 14;
         this._13965.textColor = 39679;
         this._6333.addElement(this._13965);
      }
   }
}

