package _767
{
   import flash.events.Event;
   import flash.events.NetStatusEvent;
   import flash.events.SecurityErrorEvent;
   import flash.events.TimerEvent;
   import flash.net.NetConnection;
   import flash.net.ObjectEncoding;
   import flash.net.Responder;
   import flash.net.URLLoader;
   import flash.utils.Timer;
   
   public class _766
   {
      private var loader:URLLoader;
      
      protected var _1580:Function;
      
      protected var _5959:Function;
      
      private var _5960:String;
      
      protected var _data:Object;
      
      protected var _5958:NetConnection;
      
      protected var _timer:Timer;
      
      public function _766()
      {
         super();
      }
      
      public function get serverURL() : String
      {
         return this._5960;
      }
      
      public function set serverURL(param1:String) : void
      {
         this._5960 = param1;
      }
      
      public function request(param1:Function = null, param2:Function = null) : void
      {
         this._1580 = param1;
         this._5959 = param2;
         if(this._5958 == null)
         {
            this._5958 = new NetConnection();
            this._5958.addEventListener(NetStatusEvent.NET_STATUS,this.onError);
            this._5958.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onError);
            this._5958.objectEncoding = ObjectEncoding.AMF3;
         }
         this._5958.connect(this._5960);
         this._5958.call("User.getInfo",new Responder(this._5516,this.onFail),this.getData());
         this._timer = new Timer(1000 * 10,1);
         this._timer.addEventListener(TimerEvent.TIMER_COMPLETE,this.onTimeout);
         this._timer.start();
      }
      
      private function onTimeout(param1:TimerEvent) : void
      {
         if(this._5959 != null)
         {
            this._5959();
         }
         this.dispose();
      }
      
      private function onFail(param1:Object) : void
      {
         if(this._5959 != null)
         {
            this._5959();
         }
         this.dispose();
      }
      
      private function _5516(param1:Object) : void
      {
         var _loc2_:Object = null;
         if(Boolean(param1) && param1 is String)
         {
            _loc2_ = JSON.parse(param1 as String);
            if(Boolean(_loc2_) && _loc2_["s"] == 0)
            {
               if(this._1580 != null)
               {
                  this._1580(_loc2_);
               }
            }
            else if(this._5959 != null)
            {
               this._5959();
            }
         }
         else if(this._5959 != null)
         {
            this._5959();
         }
         this.dispose();
      }
      
      private function getData() : Object
      {
         return this._data;
      }
      
      protected function onError(param1:Event) : void
      {
         if(this._5959 != null)
         {
            this._5959();
         }
         this.dispose();
      }
      
      protected function _5957(param1:Event) : void
      {
         if(this._1580 != null)
         {
            this._1580(param1.currentTarget.data);
         }
         this.dispose();
      }
      
      protected function dispose() : void
      {
         if(this._5958)
         {
            this._5958.removeEventListener(NetStatusEvent.NET_STATUS,this.onError);
            this._5958.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onError);
            this._5958.close();
            this._5958 = null;
         }
         if(this._timer)
         {
            this._timer.stop();
            this._timer.removeEventListener(TimerEvent.TIMER_COMPLETE,this.onTimeout);
            this._timer = null;
         }
      }
   }
}

