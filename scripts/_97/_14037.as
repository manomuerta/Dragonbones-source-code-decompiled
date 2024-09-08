package _97
{
   import flash.display.Stage;
   import flash.events.Event;
   
   public class _14037
   {
      private static var stage:Stage;
      
      private static var _14325:Array = [];
      
      private static var _14324:Boolean = false;
      
      public function _14037()
      {
         super();
      }
      
      public static function register(param1:Stage) : void
      {
         _14324 = false;
         stage = param1;
         if(stage)
         {
            stage.addEventListener(Event.ENTER_FRAME,_14322);
         }
      }
      
      public static function dispose() : void
      {
         _14324 = true;
         if(_14325.length > 0)
         {
            return;
         }
         if(stage)
         {
            stage.removeEventListener(Event.ENTER_FRAME,_14322);
         }
      }
      
      public static function _14321() : void
      {
         _14324 = true;
         if(stage)
         {
            stage.removeEventListener(Event.ENTER_FRAME,_14322);
         }
         _14325.length = 0;
      }
      
      public static function _14323(param1:int, param2:Function, ... rest) : void
      {
         _14325.push(new Ticker(param1,param2,rest));
      }
      
      private static function _14322(param1:Event) : void
      {
         var _loc2_:Ticker = null;
         var _loc3_:int = 0;
         while(_loc3_ < _14325.length)
         {
            _loc2_ = _14325[_loc3_];
            if(_loc2_.onTicker())
            {
               _14325.splice(_loc3_,1);
            }
            _loc3_++;
         }
         if(_14324)
         {
            dispose();
         }
      }
   }
}

class Ticker
{
   private var _14323:int;
   
   private var callFun:Function;
   
   private var _14326:Array;
   
   private var count:int = 0;
   
   public function Ticker(param1:int, param2:Function, param3:Array)
   {
      super();
      this._14323 = param1;
      this.callFun = param2;
      this._14326 = param3;
   }
   
   public function onTicker() : Boolean
   {
      ++this.count;
      if(this._14323 == this.count)
      {
         if(this.callFun != null)
         {
            if(this._14326.length > 0)
            {
               this.callFun.apply(null,this._14326);
            }
            else
            {
               this.callFun.call(null);
            }
         }
         return true;
      }
      return false;
   }
}

