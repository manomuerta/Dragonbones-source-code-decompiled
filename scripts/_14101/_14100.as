package _14101
{
   import _1088.ItemRenderer;
   import _1177.UIEvent;
   import _127._128;
   
   public class _14100 extends ItemRenderer
   {
      public var _6492:_128;
      
      public function _14100()
      {
         super();
         this.skinName = _14102;
      }
      
      override protected function _6699() : void
      {
         this._6492.label = data.label;
         this._6492.enabled = data.enabled;
         this._6492.selected = data.selected;
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         super.partAdded(param1,param2);
         if(param2 == this._6492)
         {
            this._6492.addEventListener(UIEvent.VALUE_COMMIT,this._13964);
         }
      }
      
      private function _13964(param1:UIEvent) : void
      {
         this.dispatchEvent(new UIEvent(UIEvent.VALUE_COMMIT,true));
      }
   }
}

