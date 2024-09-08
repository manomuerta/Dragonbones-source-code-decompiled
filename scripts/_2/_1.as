package _2
{
   import _1045._1104;
   import _11111._11110;
   import _13._12;
   import _1331._1332;
   import _1374._1398;
   import _1483._1482;
   import _15._16;
   import _24._25;
   import _472._474;
   import _6.Context;
   import egret.core.Injector;
   import egret.core._1114;
   import egret.managers._1203;
   import egret.managers._1220;
   import egret.utils.FileUtil;
   import egret.utils.app._1499;
   import flash.events.ErrorEvent;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.UncaughtErrorEvent;
   import flash.filesystem.File;
   import flash.utils.setTimeout;
   
   public class _1 extends EventDispatcher
   {
      private var _1557:_474;
      
      private var context:Context;
      
      public function _1(param1:_1220)
      {
         this.context = Context.getInstance();
         super();
         this._1557 = new _474();
         this.context._1560(param1.stage);
         this.context._1559._1558 = param1;
         param1.stage.addEventListener("callLaterError",this._1556);
         param1.loaderInfo.uncaughtErrorEvents.addEventListener(UncaughtErrorEvent.UNCAUGHT_ERROR,this._1556);
      }
      
      private function _1556(param1:UncaughtErrorEvent) : void
      {
         var _loc3_:String = null;
         var _loc7_:int = 0;
         var _loc2_:* = "\r\n\r\n" + new Date().toString() + "\r\n" + "=======================================================================" + "\r\n";
         var _loc4_:String = "";
         if(param1.error is Error)
         {
            _loc3_ = param1.error.getStackTrace();
            _loc7_ = int(_loc3_.indexOf("\n"));
            if(_loc7_ > 0 && _loc7_ < _loc3_.length - 1)
            {
               _loc4_ = _loc3_.substring(_loc7_ + 1);
               _loc3_ = _loc3_.substring(0,_loc7_);
            }
         }
         else if(param1.error is ErrorEvent)
         {
            _loc3_ = ErrorEvent(param1.error).text;
         }
         else
         {
            _loc3_ = param1.error.toString();
         }
         var _loc5_:String = File.applicationStorageDirectory.resolvePath("crash_log.txt").nativePath;
         var _loc6_:String = FileUtil.openAsString(_loc5_);
         _loc6_ = _loc6_ + _loc2_ + _loc3_ + "\r\n" + _loc4_;
         FileUtil.save(_loc5_,_loc6_);
         _11110.instance._11206._11132(_loc3_,_loc4_);
         if(param1.error && param1.error.errorID == 1009)
         {
            dispatchEvent(new Event("uncaughtError"));
         }
      }
      
      public function start() : void
      {
         Injector.mapClass(_1104,_1482);
         Injector.mapClass(_1114,_1398);
         Injector.mapClass(_1203,_16);
         _12.init();
         _1332.start();
         _1499.start();
         _25.initialize(this.context.stage);
         this._1557.start();
         _25._1693();
         setTimeout(function():void
         {
            dispatchEvent(new Event(Event.COMPLETE));
            _1557._12505();
         },2000);
      }
   }
}

