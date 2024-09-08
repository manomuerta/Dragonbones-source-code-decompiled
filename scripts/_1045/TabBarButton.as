package _1045
{
   import _1088._1102;
   import flash.events.Event;
   
   public class TabBarButton extends _1102 implements _1070
   {
      private var _8554:Boolean = true;
      
      private var _data:Object;
      
      private var _2540:int;
      
      public function TabBarButton()
      {
         super();
      }
      
      public function get _8552() : Boolean
      {
         return this._8554;
      }
      
      public function set _8552(param1:Boolean) : void
      {
         this._8554 = param1;
      }
      
      public function get data() : Object
      {
         return this._data;
      }
      
      public function set data(param1:Object) : void
      {
         this._data = param1;
         dispatchEvent(new Event("dataChange"));
      }
      
      public function get itemIndex() : int
      {
         return this._2540;
      }
      
      public function set itemIndex(param1:int) : void
      {
         this._2540 = param1;
      }
      
      override public function set label(param1:String) : void
      {
         if(param1 != label)
         {
            super.label = param1;
            if(labelDisplay)
            {
               labelDisplay.text = label;
            }
         }
      }
      
      override protected function _8239() : void
      {
         if(selected && !this._8552)
         {
            return;
         }
         super._8239();
      }
   }
}

