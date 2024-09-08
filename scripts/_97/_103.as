package _97
{
   public class _103
   {
      public static var _2278:_103 = new _103();
      
      public static var _2276:_103 = new _103();
      
      private var _2278:Array;
      
      public function _103()
      {
         this._2278 = [];
         super();
      }
      
      public static function addItem(param1:*) : void
      {
         _2278.addItem(param1);
      }
      
      public static function _2277(param1:*) : int
      {
         return _2278._2277(param1);
      }
      
      public static function _2275(param1:int) : void
      {
         _2278._2275(param1);
      }
      
      public function addItem(param1:*) : void
      {
         if(this._2278.indexOf(param1) == -1)
         {
            this._2278.push(param1);
         }
      }
      
      public function _2277(param1:*) : int
      {
         return this._2278.indexOf(param1);
      }
      
      public function _2275(param1:int) : void
      {
         this._2278.splice(param1,1);
      }
   }
}

