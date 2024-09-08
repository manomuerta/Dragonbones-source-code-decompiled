package _6
{
   import _2._3;
   import flash.display.Stage;
   import flash.events.EventDispatcher;
   import flash.utils.Dictionary;
   
   public class Context extends EventDispatcher
   {
      private static var _instance:Context;
      
      private var _stage:Stage;
      
      private var _1571:*;
      
      private var _1573:_3;
      
      private var _1569:Dictionary;
      
      public function Context()
      {
         this._1573 = new _3();
         this._1569 = new Dictionary();
         super();
      }
      
      public static function getInstance() : Context
      {
         if(_instance == null)
         {
            _instance = new Context();
         }
         return _instance;
      }
      
      public function _1570(param1:String, param2:Class) : void
      {
         this._1569[param1] = param2;
      }
      
      public function _1567(param1:_9) : Boolean
      {
         var _loc3_:_8 = null;
         var _loc2_:Class = this._1569[param1.type];
         if(_loc2_)
         {
            _loc3_ = new _loc2_();
            _loc3_._1572(param1.data);
            _loc3_._1574();
         }
         return super.dispatchEvent(param1);
      }
      
      public function get stage() : Stage
      {
         return this._stage;
      }
      
      public function _1560(param1:Stage) : void
      {
         if(!param1)
         {
            return;
         }
         this._stage = param1;
      }
      
      public function get _1568() : *
      {
         return this._1571;
      }
      
      public function set _1568(param1:*) : void
      {
         this._1571 = param1;
      }
      
      public function get _1559() : _3
      {
         return this._1573;
      }
   }
}

