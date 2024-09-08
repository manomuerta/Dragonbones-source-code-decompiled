package _120
{
   import flash.events.EventDispatcher;
   
   public class _119 extends EventDispatcher
   {
      public var _11540:* = null;
      
      public var _2222:* = null;
      
      public var _11537:Object = null;
      
      private var _11538:Boolean = false;
      
      private var _11535:Boolean = false;
      
      private var _11539:Boolean = false;
      
      public function _119()
      {
         super();
      }
      
      public function setData(param1:*, param2:* = null) : _119
      {
         this._11540 = param1;
         this._11537 = param2;
         return this;
      }
      
      public function run() : void
      {
         this._11538 = true;
      }
      
      public function stop() : void
      {
         this._11538 = false;
      }
      
      public function complete() : void
      {
         this._11538 = false;
         this._11535 = true;
         dispatchEvent(new _121(_121.COMPLETE));
      }
      
      public function fail(param1:String, param2:* = null) : void
      {
         this._11538 = false;
         this._11539 = true;
         dispatchEvent(new _121(_121.FAIL,{
            "type":param1,
            "data":param2
         }));
      }
      
      public function get _11541() : Boolean
      {
         return this._11538;
      }
      
      public function get _11536() : Boolean
      {
         return this._11535;
      }
      
      public function get _11542() : Boolean
      {
         return this._11539;
      }
   }
}

