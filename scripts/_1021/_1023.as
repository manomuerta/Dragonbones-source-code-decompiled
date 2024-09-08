package _1021
{
   import _1045.Group;
   import _1045._1070;
   import _1185._1189;
   import _1374.TextInput;
   import flash.events.Event;
   
   public class _1023 extends Group implements _1070
   {
      private var _selected:Boolean;
      
      private var _2540:int;
      
      private var _2541:String;
      
      private var _data:Object;
      
      public var input:TextInput;
      
      public function _1023()
      {
         super();
         var _loc1_:_1189 = new _1189();
         _loc1_.verticalAlign = "middle";
         this.layout = _loc1_;
         this.input = new TextInput();
         this.input.percentWidth = 100;
         addElement(this.input);
         this.input.addEventListener(Event.CHANGE,this._6406);
      }
      
      private function _6406(param1:Event) : void
      {
         this._data.url = this.input.text;
         this.owner.dispatchEvent(param1);
      }
      
      public function get data() : Object
      {
         return this._data;
      }
      
      public function set data(param1:Object) : void
      {
         this._data = param1;
      }
      
      public function get selected() : Boolean
      {
         return this._selected;
      }
      
      public function set selected(param1:Boolean) : void
      {
         this._selected = param1;
      }
      
      public function get itemIndex() : int
      {
         return this._2540;
      }
      
      public function set itemIndex(param1:int) : void
      {
         this._2540 = param1;
      }
      
      public function get label() : String
      {
         return this._2541;
      }
      
      public function set label(param1:String) : void
      {
         this._2541 = param1;
         this.input.text = this._2541;
      }
   }
}

