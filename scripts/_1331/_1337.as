package _1331
{
   import com.adobe.crypto.MD5;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import flash.net.URLRequestHeader;
   import flash.net.URLVariables;
   
   public class _1337 extends _1341
   {
      public var email:String = "";
      
      public var password:String = "";
      
      public var account:String = "";
      
      public var type:Number = 1;
      
      public var _12691:String = "";
      
      private var loader:URLLoader;
      
      public function _1337()
      {
         super();
      }
      
      override public function request(param1:Function = null, param2:Function = null) : void
      {
         if(!this.loader)
         {
            this.loader = new URLLoader();
            this.loader.addEventListener(Event.COMPLETE,_5957);
            this.loader.addEventListener(IOErrorEvent.IO_ERROR,_9222);
         }
         this._1580 = param1;
         this._5959 = param2;
         var _loc3_:URLRequest = new URLRequest();
         _loc3_.url = serverURL;
         _loc3_.method = method;
         _loc3_.data = this._9220();
         _loc3_.requestHeaders = this._9221();
         this.loader.load(_loc3_);
      }
      
      private function _9221() : Array
      {
         var _loc1_:Date = new Date();
         var _loc2_:URLRequestHeader = new URLRequestHeader("timestamp",_loc1_.time.toString());
         var _loc3_:URLRequestHeader = new URLRequestHeader("signature",MD5.hash("Userlogin2" + _loc1_.time));
         var _loc4_:URLRequestHeader = new URLRequestHeader("client","DragonBones:" + 4.5);
         return [_loc2_,_loc3_,_loc4_];
      }
      
      private function _9220() : String
      {
         var _loc1_:Object = new Object();
         _loc1_.account = this.account;
         _loc1_.password = MD5.hash(this.password);
         _loc1_.type = this.type;
         _loc1_.client_id = this._12691;
         return JSON.stringify(_loc1_);
      }
      
      override protected function _9223() : URLVariables
      {
         var _loc1_:URLVariables = new URLVariables();
         _loc1_["action"] = Crypto._5966("login");
         _loc1_["email"] = Crypto._5966(this.email);
         _loc1_["password"] = Crypto._5966(this.password);
         return _loc1_;
      }
   }
}

