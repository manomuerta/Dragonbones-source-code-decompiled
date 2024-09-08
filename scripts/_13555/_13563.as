package _13555
{
   import _1045.Group;
   import _1045._1084;
   
   public class _13563 extends _1084
   {
      public var _13975:Group;
      
      public function _13563()
      {
         super();
         this.states = ["selected","normal"];
         this.minHeight = this.minWidth = 30;
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this._13975 = new Group();
         addElement(this._13975);
      }
      
      override protected function _2519() : void
      {
         if(_2080 == "normal")
         {
            this._13975.graphics.clear();
            this._13975.graphics.beginFill(1975081,1);
            this._13975.graphics.drawCircle(3,3,5);
            this._13975.graphics.endFill();
         }
         else
         {
            this._13975.graphics.clear();
            this._13975.graphics.beginFill(4675431,1);
            this._13975.graphics.drawCircle(3,3,5);
            this._13975.graphics.endFill();
         }
      }
   }
}

