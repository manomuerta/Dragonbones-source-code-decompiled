package _777
{
   import _120._119;
   import _1331.Crypto;
   import _1404._1407;
   import _1529._1528;
   import _2._4;
   import _648._12463;
   import egret.utils._1501;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   import flash.events.TimerEvent;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import flash.net.URLRequestHeader;
   import flash.net.URLRequestMethod;
   import flash.system.Capabilities;
   import flash.utils.Timer;
   
   public class _780 extends _119
   {
      protected var _5981:URLLoader;
      
      protected var _5980:Timer;
      
      protected var _data:Object;
      
      public function _780(param1:Object)
      {
         this._12594 = _1407.getInstance(_12463);
         super();
         this._data = param1;
      }
      
      override public function run() : void
      {
         var _loc1_:String = null;
         var _loc2_:String = null;
         var _loc3_:URLRequest = null;
         var _loc4_:Array = null;
         this._5981 = _779.instance.urlLoader;
         if(this._5981)
         {
            this._5981.addEventListener(IOErrorEvent.IO_ERROR,this.onError);
            this._5981.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onError);
            this._5981.addEventListener(Event.COMPLETE,this.onComplete);
            _loc1_ = this.getData();
            _loc2_ = _779._10390;
            _loc3_ = new URLRequest(_loc2_);
            _loc3_.method = URLRequestMethod.POST;
            _loc4_ = new Array(new URLRequestHeader("Content-Type","application/x-www-form-urlencoded;"));
            _loc3_.data = "data=" + _loc1_;
            this._5981.load(_loc3_);
            this._5980 = new Timer(_779.OVER_TIME,1);
            this._5980.addEventListener(TimerEvent.TIMER_COMPLETE,this._5388);
            this._5980.start();
         }
      }
      
      protected function getData() : String
      {
         this._data.PName = _4.SOFT_NAME;
         this._data.OS = Capabilities.os;
         this._data.OS_ver = Capabilities.version;
         this._data.uid = this._12594.uid;
         this._data.uuid = this._12594._12691;
         if(this._data.uid == null)
         {
            this._data.uid = this._data.uuid;
         }
         this._data.toolsLang = _1528.language;
         this._data.ver = _1501.currentVersion;
         this._data.installtime = "";
         this._data.pid = "";
         return this.encrypt(this._data);
      }
      
      protected function onComplete(param1:Event) : void
      {
         this.complete();
      }
      
      protected function onError(param1:Event) : void
      {
         this.complete();
      }
      
      protected function _5388(param1:TimerEvent) : void
      {
         this.complete();
      }
      
      protected function encrypt(param1:Object) : String
      {
         var _loc2_:String = JSON.stringify(param1);
         return Crypto._5963(_loc2_);
      }
      
      override public function complete() : void
      {
         this._5980.stop();
         this._5980.removeEventListener(TimerEvent.TIMER_COMPLETE,this._5388);
         this._5981.removeEventListener(IOErrorEvent.IO_ERROR,this.onError);
         this._5981.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onError);
         this._5981.removeEventListener(Event.COMPLETE,this.onComplete);
         this._5981.close();
         _779.instance._5974(this._5981);
         super.complete();
      }
   }
}

