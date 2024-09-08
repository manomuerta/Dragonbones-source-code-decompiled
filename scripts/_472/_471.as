package _472
{
   import _1009.ExitWindow;
   import _1038._1037;
   import _1045.Group;
   import _1177.CloseEvent;
   import _1177.UIEvent;
   import _120._10601;
   import _120._123;
   import _12465._12464;
   import _12469._12468;
   import _1374.Alert;
   import _1374.Application;
   import _1374.Window;
   import _1404._1407;
   import _24.Shortcut;
   import _24._26;
   import _300._299;
   import _300._468;
   import _521._12460;
   import _521._14070;
   import _521._15565;
   import _521._520;
   import _521._522;
   import _521._525;
   import _521._528;
   import _521._531;
   import _541._553;
   import _555.LibraryPanelController;
   import _555._571;
   import _586._585;
   import _6.Context;
   import _625.SettingWindowController;
   import _625._10493;
   import _625._11506;
   import _625._13542;
   import _625._631;
   import _625._632;
   import _636.DBModelEvent;
   import _639._638;
   import _648._11507;
   import _668._671;
   import _783.CommandNotification;
   import _783.StageNotification;
   import _783._782;
   import _93._94;
   import _97._117;
   import _97._99;
   import egret.utils.FileUtil;
   import egret.utils.SystemInfo;
   import egret.utils.app._1497;
   import egret.utils.tr;
   import flash.desktop.NativeApplication;
   import flash.events.Event;
   import flash.filesystem.File;
   
   public class _471 extends _94
   {
      public static var _11968:Boolean;
      
      private var _3527:_525;
      
      private var _3506:_522;
      
      private var _3515:_553;
      
      private var _3507:_518;
      
      private var _3516:_519;
      
      private var _3534:_622;
      
      private var _3528:_528;
      
      private var _3517:_475;
      
      private var _3529:_520;
      
      private var _3541:_531;
      
      private var _3523:_631;
      
      private var _10502:_10493;
      
      private var _3530:_632;
      
      private var _3540:SettingWindowController;
      
      private var _3511:_585;
      
      private var _3510:_571;
      
      private var _12571:_12460;
      
      private var _12569:_12461;
      
      private var _12570:_12468;
      
      private var _12572:_12464;
      
      private var _13770:_13542;
      
      private var _14445:_14070;
      
      private var _15575:_15565;
      
      private var _3522:_638;
      
      private var application:Application;
      
      public var _11575:Group;
      
      private var _13769:LibraryPanelController;
      
      private var _3542:ExitWindow;
      
      private var _3518:_1037;
      
      public function _471()
      {
         this._3527 = _1407.getInstance(_525);
         this._3506 = _1407.getInstance(_522);
         this._3515 = _1407.getInstance(_553);
         this._3507 = _1407.getInstance(_518);
         this._3516 = _1407.getInstance(_519);
         this._3534 = _1407.getInstance(_622);
         this._3528 = _1407.getInstance(_528);
         this._3517 = _1407.getInstance(_475);
         this._3529 = _1407.getInstance(_520);
         this._3541 = _1407.getInstance(_531);
         this._3523 = _1407.getInstance(_631);
         this._10502 = _1407.getInstance(_10493);
         this._3530 = _1407.getInstance(_632);
         this._3540 = _1407.getInstance(SettingWindowController);
         this._3511 = _1407.getInstance(_585);
         this._3510 = _1407.getInstance(_571);
         this._12571 = _1407.getInstance(_12460);
         this._12569 = _1407.getInstance(_12461);
         this._12570 = _1407.getInstance(_12468);
         this._12572 = _1407.getInstance(_12464);
         this._13770 = _1407.getInstance(_13542);
         this._14445 = _1407.getInstance(_14070);
         this._15575 = _1407.getInstance(_15565);
         this._11575 = new Group();
         this._13769 = _1407.getInstance(LibraryPanelController);
         super();
         this._3522 = new _638();
      }
      
      override public function start() : void
      {
         super.start();
         this._12569.start();
         this._12570.start();
         this._12572.start();
         this._3515.application = this.application;
         this._3515.start();
         this._3507.application = this.application;
         this._3507.start();
         this._3516.application = this.application;
         this._3516.start();
         this._3534.start();
         this._14445.start();
         _1559._1558.addElement(this.application);
         _1559._1558.addElement(this._3534._3544);
         _1559._1558.addElement(this._11575);
         this._11575.percentWidth = 100;
         this._11575.percentHeight = 100;
         this._3517.upload();
         this._3541.start();
         this._3523.start();
         this._10502.start();
         this._3530.start();
         this._3540.start();
         this._3511.start();
         this._12571.start();
         this._13770.start();
         this._15575.start();
         this._3512();
      }
      
      override protected function init() : void
      {
         Window._3526 = "/assets/icon/16.png";
         this.application = new Application();
         this.application.title = "DragonBones Pro";
         this.application._2576 = true;
         if(!SystemInfo.isMacOS)
         {
            this.application._3539 = false;
         }
         this.application.minHeight = 200;
         this.application.minWidth = 400;
         this.application.titleIcon = Window._3526;
         _1559.application = this.application;
         this.application.addEventListener(UIEvent.CREATION_COMPLETE,this._3502);
         Context.getInstance()._1568 = {
            "appModel":this._3522,
            "_2217":this._3527,
            "_2209":this._3506
         };
         this._3522.initialize();
         this._3522._1664();
      }
      
      override protected function _1576() : void
      {
         if(SystemInfo.isMacOS)
         {
            Shortcut._1681(stage,_26.EXIT,this._1616);
         }
         this.application.addEventListener(Event.CLOSING,this._3533);
         NativeApplication.nativeApplication.addEventListener(Event.EXITING,this._3538);
         this.application.addEventListener(Event.DEACTIVATE,this._11485);
         this._3522.addEventListener(DBModelEvent.CURRENT_DOC_CHANGED,this._3500);
         this._3522.addEventListener(DBModelEvent.COORDINATE_TYPE_CHANGED,this._3499);
         this._3522._2220.addEventListener(DBModelEvent.EDIT_MODE_CHANGED,this._3503);
         this._3522._2220.addEventListener(DBModelEvent.ANIMATION_MODE_CHANGED,this._3501);
         _1565(_782.CLEAR_CACHE,this._11574);
         _1565(_782.RESTART,this._11576);
      }
      
      public function _12505() : void
      {
         this._12572._12505();
      }
      
      private function _11574(param1:_782) : void
      {
         this._11573();
      }
      
      private function _11576(param1:_782) : void
      {
         this._11966();
      }
      
      private function _3502(param1:UIEvent) : void
      {
         _299.start();
         _117._11211 = true;
         _1567(new _782(_782.INIT_COMPLETE));
         _2214._3524 = true;
      }
      
      private function _11485(param1:Event) : void
      {
         Shortcut.clear();
         _1567(new StageNotification(StageNotification.WINDOW_DEACTIVATE));
      }
      
      public function _3512() : void
      {
         var _loc1_:_468 = new _468();
         _loc1_._1572(null);
         _loc1_.execute();
      }
      
      public function _3225() : void
      {
         if(this._3508())
         {
            this._3535();
         }
         else
         {
            this._3509();
         }
      }
      
      private function _3535() : void
      {
         if(!this._3542)
         {
            this._3542 = new ExitWindow();
            this._3505();
         }
         this._3542.open();
         this._3518 = this._3521();
         this._3542._3537 = this._3521().length > 1;
         this._3542.num = this._3521().length - 1;
         this._3542.showText = tr("ExitWindow.ShowSaveProjects",FileUtil.getFileName((this._3518[0] as _671).path));
      }
      
      private function _3521() : _1037
      {
         var _loc2_:_671 = null;
         var _loc5_:_671 = null;
         var _loc1_:_1037 = new _1037([0]);
         var _loc3_:int = int(_2214.openProjectPathList.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = _2214._11562(_2214.openProjectPathList[_loc4_]);
            if(Boolean(_loc5_._2871) && _loc5_._2871._3543)
            {
               if(Boolean(_2214._1844) && _loc5_ == _2214._1844)
               {
                  _loc2_ = _loc5_;
               }
               else
               {
                  _loc1_.addItem(_loc5_);
               }
            }
            _loc4_++;
         }
         _loc1_.removeItemAt(0);
         if(_loc2_)
         {
            _loc1_.addItemAt(_loc2_,0);
         }
         return _loc1_;
      }
      
      private function _3505() : void
      {
         this._3542.addEventListener("save",this._3531);
         this._3542.addEventListener("noSave",this._3520);
         this._3542.addEventListener(Event.CANCEL,this._3519);
         this._3542.addEventListener(Event.CLOSE,this._3532);
      }
      
      private function _3504() : void
      {
         this._3542.removeEventListener("save",this._3531);
         this._3542.removeEventListener("noSave",this._3520);
         this._3542.removeEventListener(Event.CANCEL,this._3519);
         this._3542.removeEventListener(Event.CLOSE,this._3532);
      }
      
      private function _3531(param1:Event) : void
      {
         var lastTask:_10601;
         var pdd:_671 = null;
         var saveTask:_10612 = null;
         var e:Event = param1;
         var queue:_123 = new _123();
         if(this._3542.selectAll)
         {
            for each(pdd in this._3518)
            {
               saveTask = new _10612(pdd);
               queue._2389(saveTask);
            }
         }
         else
         {
            saveTask = new _10612(this._3518[0]);
            queue._2389(saveTask);
         }
         lastTask = new _10601(function():void
         {
            if(_3542.selectAll)
            {
               _3509();
            }
            else
            {
               _3518.removeItemAt(0);
               if(_3518.length)
               {
                  _3542.showText = tr("ExitWindow.ShowSaveProjects",FileUtil.getFileName((_3518[0] as _671).path));
                  --_3542.num;
               }
               else
               {
                  _3509();
               }
            }
         });
         queue._2389(lastTask);
         queue.run();
      }
      
      private function _3520(param1:Event) : void
      {
         if(this._3518.length > 0)
         {
            this._3518.removeItemAt(0);
         }
         if(this._3542.selectAll)
         {
            this._3509();
         }
         else if(this._3518.length)
         {
            this._3542.showText = tr("ExitWindow.ShowSaveProjects",FileUtil.getFileName((this._3518[0] as _671).path));
            --this._3542.num;
         }
         else
         {
            this._3509();
         }
      }
      
      public function _3509(param1:Boolean = true) : void
      {
         var exportModel:_11507 = null;
         var wwwww:Boolean = param1;
         if(this._3542)
         {
            this._3542.close();
            this._3504();
            this._3542 = null;
         }
         exportModel = _1407.getInstance(_11507) as _11507;
         if(Boolean(exportModel) && exportModel.taskQueue.runingTasks.length > 0)
         {
            Alert.show(tr("ExitWindow.cancelExport.message",exportModel.taskQueue.runingTasks.length),tr("ExitWindow.cancelExport.title"),null,function(param1:CloseEvent):void
            {
               if((param1 as CloseEvent).detail === Alert.FIRST_BUTTON)
               {
                  exportModel.taskQueue.stop();
                  _11969(wwwww);
               }
            },tr("Alert.Confirm"),tr("Alert.Cancel"));
         }
         else
         {
            this._11969(wwwww);
         }
      }
      
      private function _3532(param1:Event) : void
      {
         _11968 = false;
         this._3542.removeEventListener(Event.CLOSE,this._3532);
         if(this._3542)
         {
            this._3542.close();
            this._3504();
            this._3542 = null;
         }
      }
      
      private function _3519(param1:Event) : void
      {
         _11968 = false;
         this._3542.removeEventListener(Event.CANCEL,this._3519);
         if(this._3542)
         {
            this._3542.close();
            this._3504();
            this._3542 = null;
         }
      }
      
      private function _3533(param1:Event) : void
      {
         var onCloseBtnClick:Function;
         var event:Event = param1;
         if(this._3508())
         {
            onCloseBtnClick = function(param1:CloseEvent):void
            {
               _3529._3302(tr("CloseApplication.content"));
               if(param1.detail == Alert.FIRST_BUTTON)
               {
                  _3509(true);
               }
            };
            event.preventDefault();
            this._3535();
         }
         else
         {
            _1567(new CommandNotification(CommandNotification.APPLICATION_EXIT));
            if(_11968)
            {
               this.restart();
            }
            event.preventDefault();
            this._3509(true);
         }
      }
      
      private function _11969(param1:Boolean) : void
      {
         var wwwww:Boolean = param1;
         _1567(new CommandNotification(CommandNotification.APPLICATION_EXIT));
         if(wwwww)
         {
            if(_11968)
            {
               this.restart();
            }
            else
            {
               this._12569.logout(1,null);
               _99(function():void
               {
                  NativeApplication.nativeApplication.exit();
               });
            }
         }
      }
      
      private function _11966() : void
      {
         _11968 = true;
         if(this._3508())
         {
            this._3535();
         }
         else
         {
            _1567(new CommandNotification(CommandNotification.APPLICATION_EXIT));
            if(_11968)
            {
               this.restart();
            }
         }
      }
      
      private function _3538(param1:Event) : void
      {
         this._3522._3525();
         _2216._3525();
      }
      
      private function _3508() : Boolean
      {
         var _loc3_:_671 = null;
         var _loc1_:int = int(_2214.openProjectPathList.length);
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            _loc3_ = _2214._11562(_2214.openProjectPathList[_loc2_]);
            if(Boolean(_loc3_._2871) && _loc3_._2871._3543)
            {
               return true;
            }
            _loc2_++;
         }
         return false;
      }
      
      private function _3500(param1:DBModelEvent) : void
      {
         if(_2214._1844)
         {
            _2214._1844._2871._3536 = this._3511._3545;
         }
         this._3510._3514();
         this._3510._3513();
         this._13769._3514();
         _1567(new _782(_782.CURRENT_DOC_CHANGED));
         _117._11211 = false;
      }
      
      private function _3499(param1:DBModelEvent) : void
      {
         _1567(new StageNotification(StageNotification.UPDATE_COORDINATE_TYPE));
      }
      
      private function _3503(param1:DBModelEvent) : void
      {
         _1567(new StageNotification(StageNotification.UPDATE_EDIT_MODE));
      }
      
      private function _3501(param1:DBModelEvent) : void
      {
         _1567(new StageNotification(StageNotification.UPDATE_ANIMATION_MODE));
      }
      
      private function _1616() : void
      {
         this.application.close();
      }
      
      public function _11135(param1:String = "") : void
      {
         this._11572._3155();
      }
      
      private function restart() : void
      {
         _1497.start();
      }
      
      public function _11573() : void
      {
         var _loc1_:File = File.applicationStorageDirectory;
         if(_loc1_.exists)
         {
            _loc1_.deleteDirectory(true);
         }
      }
      
      protected function get _11572() : _11506
      {
         return _1407.getInstance(_11506) as _11506;
      }
   }
}

