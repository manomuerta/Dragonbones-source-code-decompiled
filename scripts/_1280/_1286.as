package _1280
{
   import egret.core._1127;
   import egret.core.ns_egret;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   
   use namespace ns_egret;
   
   public class _1286 extends EventDispatcher
   {
      private var initialized:Boolean = false;
      
      public var name:String;
      
      public var overrides:Array;
      
      public var _9077:Array;
      
      public function _1286(param1:Object = null)
      {
         var _loc2_:String = null;
         this.overrides = [];
         this._9077 = [];
         super();
         for(_loc2_ in param1)
         {
            this[_loc2_] = param1[_loc2_];
         }
      }
      
      ns_egret function initialize(param1:_1127) : void
      {
         var _loc2_:int = 0;
         if(!this.initialized)
         {
            this.initialized = true;
            _loc2_ = 0;
            while(_loc2_ < this.overrides.length)
            {
               _1282(this.overrides[_loc2_]).initialize(param1);
               _loc2_++;
            }
         }
      }
      
      ns_egret function _8306() : void
      {
         if(hasEventListener("enterState"))
         {
            dispatchEvent(new Event("enterState"));
         }
      }
      
      ns_egret function _8313() : void
      {
         if(hasEventListener("exitState"))
         {
            dispatchEvent(new Event("exitState"));
         }
      }
   }
}

