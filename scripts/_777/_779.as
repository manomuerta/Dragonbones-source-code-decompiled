package _777
{
   import _120._119;
   import _120._121;
   import _120._123;
   import _54._67;
   import _73.SymbolType;
   import _772._10253;
   import _772._10254;
   import _772._10487;
   import _772._10494;
   import _772._771;
   import _772._773;
   import _772._775;
   import _783.CommandNotification;
   import _93._94;
   import com.google.analytics.AnalyticsTracker;
   import com.hurlant.util.Base64;
   import egret.utils.FileUtil;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.net.URLLoader;
   import flash.utils.ByteArray;
   import flash.utils.Timer;
   import flash.utils.getTimer;
   
   public class _779 extends _94
   {
      private static var _instance:_779;
      
      private static const MIN_EDIT_TIME:int = 1800000;
      
      private static const MIN_SAVE_TIME:int = 300000;
      
      private static const MIN_RUNNING_TIME:int = 600000;
      
      private static const MIN_IDLE_TIME:int = 30000;
      
      private static const MIN_SAVE_FILE_TIME:int = 8 * 3600000;
      
      private static const TIMER_TIME:int = 10000;
      
      private static const REPORT_SYMBOL_TYPE_TIME:int = 600000;
      
      public static const RELEASE_HOST:String = "http://tools.statistics.egret.com/info.php";
      
      public static const DEBUG_HOST:String = "http://10.0.4.191/egret/open/analysis-egret-labs-org/toolsStat/info.php";
      
      public static const OVER_TIME:int = 30000;
      
      public static const MAX_QUEUE:int = 2;
      
      public static var _10390:String = DEBUG_HOST;
      
      public static const PARAM_OP:String = "op";
      
      public static const PARAM_TYPE:String = "type";
      
      public static const PARAM_V1:String = "value1";
      
      public static const PARAM_V2:String = "value2";
      
      public static const PARAM_V3:String = "value3";
      
      public static const PARAM_V4:String = "value4";
      
      public static const PARAM_V5:String = "value5";
      
      public static const PARAM_V6:String = "value6";
      
      public static const PARAM_DVER:String = "dVer";
      
      public static const PARAM_RESULT:String = "result";
      
      private var _5972:Vector.<URLLoader>;
      
      private var _5976:Vector.<_123>;
      
      private var _5978:Vector.<_119>;
      
      private var _5977:_775;
      
      private var _5973:_773;
      
      private var _5975:_771;
      
      private var _10377:_10253;
      
      private var _10489:_10487;
      
      private var _10511:_10494;
      
      private var _5632:Object;
      
      private var _10381:_10255;
      
      private var _10389:int = 0;
      
      private var _10376:_10256;
      
      private var _10385:Stage;
      
      private var _10386:int;
      
      private var _10379:int;
      
      private var _idleTimer:Timer;
      
      private var _10388:Boolean;
      
      private var _10378:int;
      
      private var _10488:int;
      
      private var _lastTime:int = -1;
      
      private var _tracker:AnalyticsTracker;
      
      public function _779()
      {
         var _loc1_:int = 0;
         var _loc2_:_123 = null;
         super();
         _10390 = RELEASE_HOST;
         this._5978 = new Vector.<_119>();
         this._5972 = new Vector.<URLLoader>();
         this._5976 = new Vector.<_123>();
         _loc1_ = 0;
         while(_loc1_ < MAX_QUEUE)
         {
            this._5972.push(new URLLoader());
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < MAX_QUEUE)
         {
            _loc2_ = new _123();
            _loc2_.addEventListener(_121.COMPLETE,this._5971);
            this._5976.push(_loc2_);
            _loc1_++;
         }
         this._5977 = new _775();
         this._5973 = new _773();
         this._5975 = new _771();
         this._10377 = new _10253();
         this._10489 = new _10487();
         this._10511 = new _10494();
         start();
      }
      
      public static function get instance() : _779
      {
         if(_instance == null)
         {
            _instance = new _779();
         }
         return _instance;
      }
      
      override protected function init() : void
      {
         super.init();
         this._10376 = _2214._10365;
         this._5632 = this._10376.projectDic;
         this._10387 = this.stage;
      }
      
      override protected function _1576() : void
      {
         super._1576();
         this._1565(CommandNotification.APPLICATION_EXIT,this._1616);
      }
      
      private function _1616(param1:CommandNotification) : void
      {
         this._10376._5634();
      }
      
      private function _5971(param1:_121) : void
      {
         var _loc2_:_119 = null;
         if(this._5978.length > 0)
         {
            _loc2_ = this._5978.shift();
            this._5979(_loc2_);
         }
         else
         {
            this._10376.changed = true;
            this._10376._5634();
         }
      }
      
      public function get urlLoader() : URLLoader
      {
         if(this._5972.length > 0)
         {
            return this._5972.pop();
         }
         return null;
      }
      
      public function set _10387(param1:Stage) : void
      {
         if(this._10385)
         {
            return;
         }
         this._10385 = param1;
         if(!this._10385)
         {
         }
      }
      
      private function onTimer(param1:TimerEvent) : void
      {
         var _loc3_:_10255 = null;
         if(this._10388)
         {
            return;
         }
         var _loc2_:int = getTimer();
         if(this._lastTime < 0)
         {
            this._lastTime = _loc2_;
         }
         this._10386 += _loc2_ - this._10378;
         this._10379 = _loc2_;
         if(this._10379 > MIN_RUNNING_TIME && this._10386 > MIN_IDLE_TIME)
         {
            _loc3_ = this._10374();
            if(_loc3_)
            {
               if(this._10375(_loc3_))
               {
                  this._10388 = true;
                  this._10386 = 0;
                  this._10378 = _loc2_;
               }
            }
         }
         this._10488 += _loc2_ - this._10378;
         if(this._10488 >= REPORT_SYMBOL_TYPE_TIME)
         {
            this._10488 = 0;
            this._10490();
         }
         this._lastTime = _loc2_;
      }
      
      private function _10380(param1:Event) : void
      {
         this._10386 = 0;
         this._10378 = getTimer();
      }
      
      public function _5974(param1:URLLoader) : void
      {
         this._5972.push(param1);
      }
      
      private function _5979(param1:_119) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Boolean = false;
         _loc2_ = 0;
         while(_loc2_ < MAX_QUEUE)
         {
            if(!this._5976[_loc2_].running)
            {
               this._5976[_loc2_]._2389(param1);
               this._5976[_loc2_].run();
               _loc3_ = true;
               break;
            }
            _loc2_++;
         }
         if(!_loc3_)
         {
            this._5978.push(param1);
         }
      }
      
      public function _10375(param1:_10255) : Boolean
      {
         var _loc4_:_10257 = null;
         var _loc2_:_10254 = new _10254();
         _loc2_.op = param1.op;
         var _loc3_:ByteArray = FileUtil.openAsByteArray(param1.dataSavePath);
         if(_loc3_)
         {
            _loc2_.data = com.hurlant.util.Base64.encodeByteArray(_loc3_);
            _loc4_ = new _10257(_loc2_._5965(),param1);
            this._5979(_loc4_);
            return true;
         }
         param1.dataSavePath = null;
         param1.dataLastEditTime = 0;
         this._10376.changed = true;
         return false;
      }
      
      public function _3293(param1:String, param2:*) : void
      {
         this._5977[param1] = param2;
         this._10389 = 0;
      }
      
      public function _3276(param1:String, param2:*) : void
      {
         if(param1 == _779.PARAM_TYPE)
         {
            if(this._5973[param1] == 5)
            {
               return;
            }
         }
         this._5973[param1] = param2;
         if(param1 == PARAM_OP)
         {
            this._10389 = param2;
         }
      }
      
      public function _10491() : void
      {
         if(_2214 && _2214._1844 && _2214._1844._2871 && Boolean(_2214._1844._2871._2865))
         {
            switch(_2214._1844._2871._2865._1811)
            {
               case SymbolType.ARMATURE:
                  this._10489.type = _10487.TYPE_ARMATURE;
                  break;
               case SymbolType.MC:
                  this._10489.type = _10487.TYPE_MC;
                  break;
               case SymbolType.STAGE:
                  this._10489.type = _10487.TYPE_STAGE;
                  break;
               case SymbolType.COMIC:
                  this._10489.type = _10487.TYPE_COMIC;
            }
         }
         else
         {
            this._10489.type = _10487.TYPE_NONE;
         }
      }
      
      public function _10306(param1:String, param2:*) : void
      {
         if(this._10381)
         {
            this._10381[param1] = param2;
         }
      }
      
      public function _3645(param1:String, param2:*) : void
      {
         this._5975[param1] = param2;
      }
      
      public function _3291() : void
      {
         var _loc1_:_780 = new _780(this._5977._5965());
         this._5979(_loc1_);
      }
      
      public function _3275() : void
      {
         var _loc1_:_780 = new _780(this._5973._5965());
         this._5979(_loc1_);
         this._5973[_779.PARAM_TYPE] = 1;
      }
      
      public function _3630() : void
      {
         var _loc1_:_780 = new _780(this._5975._5965());
         this._5979(_loc1_);
      }
      
      public function _10490() : void
      {
         this._10491();
         var _loc1_:_780 = new _780(this._10489._5965());
         this._5979(_loc1_);
      }
      
      public function _10505() : void
      {
         var _loc1_:_780 = new _780(this._10511._5965());
         this._5979(_loc1_);
      }
      
      public function _10351(param1:_67) : void
      {
         var _loc2_:_780 = null;
         if(param1)
         {
            this._10377._2071 = param1;
            _loc2_ = new _780(this._10377._5965());
            this._5979(_loc2_);
         }
      }
      
      public function _3296(param1:String) : void
      {
         var _loc2_:_10255 = null;
         if(this._5632[param1] == null)
         {
            _loc2_ = new _10255();
            _loc2_.path = param1;
            _loc2_.projectType = this._10389;
            this._5632[param1] = _loc2_;
         }
         this._10381 = this._5632[param1];
         this._10381.lastEditTime = getTimer();
         this._10376.changed = true;
      }
      
      public function _3222(param1:String) : void
      {
         var _loc2_:int = 0;
         if(Boolean(this._10381) && this._10381.path == param1)
         {
            _loc2_ = getTimer();
            this._10381.editTime += _loc2_ - this._10381.lastEditTime;
            this._10381.lastEditTime = _loc2_;
            this._10376.changed = true;
         }
         this._10376._5634();
      }
      
      private function _10374() : _10255
      {
         var _loc1_:_10255 = null;
         for each(_loc1_ in this._5632)
         {
            if(_loc1_ && _loc1_.dataSavePath != null && _loc1_.dataLastEditTime - getTimer() > MIN_SAVE_FILE_TIME)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      public function _10304() : Boolean
      {
         return false;
      }
      
      public function _10305(param1:String, param2:ByteArray) : void
      {
         var _loc3_:String = this._10376._10382(param1,param2);
         this._10381.dataSavePath = _loc3_;
         this._10381.dataLastEditTime = new Date().getTime();
         this._10376._5634();
      }
   }
}

