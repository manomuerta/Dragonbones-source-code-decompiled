package _1088
{
   import _1045._1070;
   import _1177.UIEvent;
   
   public class ItemRenderer extends _1087 implements _1070
   {
      private var _8430:Boolean = false;
      
      private var _data:Object;
      
      private var _selected:Boolean = false;
      
      private var _2540:int = -1;
      
      public function ItemRenderer()
      {
         super();
         mouseChildren = true;
         buttonMode = false;
         useHandCursor = false;
      }
      
      public function get data() : Object
      {
         return this._data;
      }
      
      public function set data(param1:Object) : void
      {
         this._data = param1;
         if(hasEventListener(UIEvent.DATA_CHANGE))
         {
            dispatchEvent(new UIEvent(UIEvent.DATA_CHANGE));
         }
         if(initialized || Boolean(parent))
         {
            this._8430 = false;
            this._6699();
         }
         else
         {
            this._8430 = true;
            _2466();
         }
      }
      
      protected function _6699() : void
      {
      }
      
      public function get selected() : Boolean
      {
         return this._selected;
      }
      
      public function set selected(param1:Boolean) : void
      {
         if(this._selected == param1)
         {
            return;
         }
         this._selected = param1;
         _2570();
      }
      
      public function get itemIndex() : int
      {
         return this._2540;
      }
      
      public function set itemIndex(param1:int) : void
      {
         this._2540 = param1;
      }
      
      override protected function _2476() : void
      {
         super._2476();
         if(this._8430)
         {
            this._8430 = false;
            this._6699();
         }
      }
      
      override protected function _6231() : String
      {
         if(this._selected)
         {
            return "down";
         }
         return super._6231();
      }
   }
}

