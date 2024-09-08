package egret.utils.app
{
   import egret.utils.app.bridge._1500;
   import flash.desktop.NativeApplication;
   import flash.utils.setTimeout;
   
   public class _1499
   {
      private static var instance:_1499;
      
      public function _1499()
      {
         super();
      }
      
      public static function start(param1:Boolean = false) : void
      {
         var needTips:Boolean = param1;
         if(!instance)
         {
            instance = new _1499();
            AppConnection.initialize();
            AppConnection.eventDispatcher.addEventListener(AppConnectionEvent.RECEIVE,instance.onReceive);
         }
         if(_1500._10080)
         {
            _1500.checkUpdate(NativeApplication.nativeApplication.applicationID,needTips);
         }
         else
         {
            _1500.load(function(param1:Boolean):void
            {
               _1500.checkUpdate(NativeApplication.nativeApplication.applicationID,needTips);
            });
         }
      }
      
      protected function onReceive(param1:AppConnectionEvent) : void
      {
         if(param1.messageName == "reUpdate")
         {
            setTimeout(start,2000,param1.args.shift());
         }
      }
   }
}

