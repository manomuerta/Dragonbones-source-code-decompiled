package _127
{
   import _1045.Group;
   import _1045._1070;
   import _97._103;
   
   public class _146 extends Group implements _1070
   {
      protected var _data:Object;
      
      protected var _selected:Boolean = false;
      
      protected var _2540:int;
      
      protected var _2541:String = "";
      
      public function _146()
      {
         super();
      }
      
      protected function _2539() : void
      {
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
      }
      
      public function get data() : Object
      {
         return this._data;
      }
      
      public function set data(param1:Object) : void
      {
         var _loc2_:int = _103._2277(param1);
         if(_loc2_ != -1)
         {
            _103._2275(_loc2_);
         }
         else if(this._data == param1)
         {
            return;
         }
         this._data = param1;
         this._2539();
      }
   }
}

