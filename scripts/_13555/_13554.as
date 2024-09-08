package _13555
{
   import _1045.Label;
   import _1045._1105;
   import _1088.ItemRenderer;
   import _1177.UIEvent;
   
   public class _13554 extends ItemRenderer
   {
      public var img:_1105;
      
      public var _13965:Label;
      
      public function _13554()
      {
         super();
         this.skinName = _13556;
      }
      
      override protected function _6699() : void
      {
         this.img.source = data.url;
         this._13965.htmlText = data.htmlText;
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         super.partAdded(param1,param2);
         if(param2 == this.img)
         {
            this.img.addEventListener(UIEvent.CONTENT_CHANGED,this._13964);
         }
      }
      
      private function _13964(param1:UIEvent) : void
      {
      }
   }
}

