package egret.utils
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   
   public class _1293 implements IEventDispatcher
   {
      private var _9086:EventDispatcher;
      
      public function _1293()
      {
         super();
      }
      
      public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         if(this._9086 == null)
         {
            this._9086 = new EventDispatcher(this);
         }
         this._9086.addEventListener(param1,param2,param3,param4,param5);
      }
      
      public function dispatchEvent(param1:Event) : Boolean
      {
         if(this._9086 != null)
         {
            return this._9086.dispatchEvent(param1);
         }
         return true;
      }
      
      public function hasEventListener(param1:String) : Boolean
      {
         if(this._9086 != null)
         {
            return this._9086.hasEventListener(param1);
         }
         return false;
      }
      
      public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         if(this._9086 != null)
         {
            this._9086.removeEventListener(param1,param2,param3);
         }
      }
      
      public function willTrigger(param1:String) : Boolean
      {
         if(this._9086 != null)
         {
            return this._9086.willTrigger(param1);
         }
         return false;
      }
   }
}

