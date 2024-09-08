package _1331
{
   import com.adobe.crypto.MD5;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import flash.net.URLRequestHeader;
   import flash.net.URLRequestMethod;
   
   public class _10651 extends _1341
   {
      private var loader:URLLoader;
      
      public function _10651()
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
         _loc3_.method = URLRequestMethod.POST;
         _loc3_.data = this._11091();
         _loc3_.requestHeaders = this._9221();
         this.loader.load(_loc3_);
      }
      
      private function _9221() : Array
      {
         var _loc1_:Date = new Date();
         var _loc2_:String = "";
         var _loc3_:String = "";
         var _loc4_:String = "";
         _loc2_ = _1332.instance._3755.get("token");
         _loc3_ = _1332.instance._3755.get("statistics");
         _loc4_ = _1332.instance._3755.get("decodetoken");
         var _loc5_:URLRequestHeader = new URLRequestHeader("timestamp",_loc1_.time.toString());
         var _loc6_:URLRequestHeader = new URLRequestHeader("signature",MD5.hash("Usertool" + _loc4_ + _loc1_.time.toString()));
         return [_loc5_,_loc6_];
      }
      
      private function _11091() : String
      {
         var _loc1_:Object = new Object();
         _loc1_.dragonbone = 1;
         return JSON.stringify(_loc1_);
      }
   }
}

