package _767
{
   import _1331._1341;
   import _1404._1407;
   import _648._12463;
   import com.adobe.crypto.MD5;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import flash.net.URLRequestHeader;
   import flash.net.URLRequestMethod;
   
   public class _10614 extends _1341
   {
      public var _10809:int;
      
      private var loader:URLLoader;
      
      public function _10614()
      {
         this._12594 = _1407.getInstance(_12463);
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
         _loc3_.data = this._10808();
         _loc3_.requestHeaders = this._9221();
         this.loader.load(_loc3_);
      }
      
      private function _9221() : Array
      {
         var _loc1_:Date = new Date();
         var _loc2_:String = "";
         var _loc3_:String = "";
         var _loc4_:String = "";
         if(this._12594._3766)
         {
            _loc2_ = this._12594.token;
            _loc3_ = this._12594.statistics;
            _loc4_ = this._12594.config.get("decodetoken");
         }
         var _loc5_:URLRequestHeader = new URLRequestHeader("token",_loc2_);
         var _loc6_:URLRequestHeader = new URLRequestHeader("statistics",_loc3_);
         var _loc7_:URLRequestHeader = new URLRequestHeader("timestamp",_loc1_.time.toString());
         var _loc8_:URLRequestHeader = new URLRequestHeader("signature",MD5.hash("Workbuy" + _loc4_ + _loc1_.time.toString()));
         return [_loc5_,_loc6_,_loc7_,_loc8_];
      }
      
      private function _10808() : String
      {
         var _loc1_:Object = new Object();
         _loc1_.id = this._10809;
         return JSON.stringify(_loc1_);
      }
   }
}

