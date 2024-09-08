package _1331
{
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import flash.net.URLVariables;
   
   public class _1339
   {
      private var loader:URLLoader;
      
      protected var _1580:Function;
      
      protected var _5959:Function;
      
      private var _method:String = "POST";
      
      private var _5960:String;
      
      private var variables:Object;
      
      public function _1339()
      {
         this.variables = {};
         super();
      }
      
      public function get method() : String
      {
         return this._method;
      }
      
      public function set method(param1:String) : void
      {
         this._method = param1;
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
         if(!this.loader)
         {
            this.loader = new URLLoader();
            this.loader.addEventListener(Event.COMPLETE,this._5957);
            this.loader.addEventListener(IOErrorEvent.IO_ERROR,this._9222);
         }
         this._1580 = param1;
         this._5959 = param2;
         var _loc3_:URLRequest = new URLRequest();
         _loc3_.url = this.serverURL;
         _loc3_.method = this.method;
         _loc3_.data = this._9223();
         this.loader.load(_loc3_);
      }
      
      public function _9224(param1:String, param2:String) : void
      {
         if(param2 == null)
         {
            if(this.variables.hasOwnProperty(param1))
            {
               delete this.variables[param1];
            }
         }
         else
         {
            this.variables[param1] = param2;
         }
      }
      
      protected function _9223() : URLVariables
      {
         var _loc2_:String = null;
         var _loc1_:URLVariables = new URLVariables();
         for(_loc2_ in this.variables)
         {
            _loc1_[_loc2_] = this.variables[_loc2_];
         }
         return _loc1_;
      }
      
      protected function _9222(param1:IOErrorEvent) : void
      {
         if(this._5959 != null)
         {
            this._5959(param1);
         }
      }
      
      protected function _5957(param1:Event) : void
      {
         if(this._1580 != null)
         {
            this._1580(param1.currentTarget.data);
         }
      }
   }
}

