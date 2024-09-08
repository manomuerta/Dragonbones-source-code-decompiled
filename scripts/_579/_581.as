package _579
{
   import _1038._1037;
   import _11106._11105;
   import _11106._11108;
   import _11111._11110;
   import _1177.ListEvent;
   import _1374._1393;
   import _1376.CloseTabButton;
   import _1404._1407;
   import _1421.BoxContainerEvent;
   import _1421._1423;
   import _1421._1427;
   import _346._10606;
   import _472._577;
   import _521.DBAnimateManager;
   import _521._530;
   import _555.AnimationPanelController;
   import _555.LibraryPanelController;
   import _555._13201;
   import _555._558;
   import _555._570;
   import _555._571;
   import _573.TimelinePanelController;
   import _584._583;
   import _648._665;
   import _668._671;
   import _668._706;
   import _708._715;
   import _708._716;
   import _73.SymbolType;
   import _755._759;
   import _783.CommandNotification;
   import _872._1005;
   import _93._94;
   import _935._13219;
   import _935._937;
   import _935._939;
   import _935._940;
   import _935._941;
   import _944.StagePanel;
   import _944._945;
   import _944._946;
   import _97._117;
   import egret.core._1142;
   import egret.managers._1198;
   import flash.events.MouseEvent;
   import flash.filesystem.File;
   import flash.geom.Point;
   import flash.ui.MouseCursor;
   
   public class _581 extends _94
   {
      private var _4916:_583;
      
      private var _2880:_571;
      
      private var _3176:_580;
      
      private var _2858:AnimationPanelController;
      
      private var _2852:TimelinePanelController;
      
      private var _2861:LibraryPanelController;
      
      private var _2908:_558;
      
      private var _4915:_582;
      
      private var _2853:_570;
      
      private var _13242:_13201;
      
      private var _4918:_945;
      
      private var _4912:_665;
      
      public function _581()
      {
         this._4916 = _1407.getInstance(_583);
         this._2880 = _1407.getInstance(_571);
         this._3176 = _1407.getInstance(_580);
         this._2858 = _1407.getInstance(AnimationPanelController);
         this._2852 = _1407.getInstance(TimelinePanelController);
         this._2861 = _1407.getInstance(LibraryPanelController);
         this._2908 = _1407.getInstance(_558);
         this._4915 = _1407.getInstance(_582);
         this._2853 = _1407.getInstance(_570);
         this._13242 = _1407.getInstance(_13201);
         super();
      }
      
      override public function start() : void
      {
         super.start();
         this._4916.start();
      }
      
      override protected function init() : void
      {
         this._4918._11378();
      }
      
      override protected function _1576() : void
      {
         this._4918.addEventListener(_1423.SELECTED_DOC_CHANGE,this._4907);
         this._4918.addEventListener(_1427.CLOSING_PANEL,this._4910);
         this._4918.addEventListener(_1427.CLOSE_PANEL,this._4911);
         this._4918.parent.addEventListener(BoxContainerEvent.DRAG_PANEL_MOVED,this._4908);
         if(this._4918._2515)
         {
            this._4918._2515.addEventListener(ListEvent.ITEM_ROLL_OVER,this._4923);
            this._4918._2515.addEventListener(ListEvent.ITEM_ROLL_OUT,this._4925);
         }
         this.toolTip.addEventListener(MouseEvent.ROLL_OVER,this._4920);
         this.toolTip.addEventListener(MouseEvent.ROLL_OUT,this._4921);
         this.toolTip.addEventListener(MouseEvent.CLICK,this._4927);
      }
      
      override protected function dispose() : void
      {
         super.dispose();
      }
      
      private function _4907(param1:_1423) : void
      {
         var _loc3_:_10606 = null;
         if(!this._4918._4919)
         {
            return;
         }
         var _loc2_:String = this._4918._4919.path;
         if(_2214._3328 != _loc2_)
         {
            _loc3_ = new _10606();
            _loc3_.execute();
            _2226._2889 = [];
            if(_loc2_ == _706._4829)
            {
               _1567(new CommandNotification(CommandNotification.SELECT_WELCOME_PAGE));
            }
            else
            {
               _1567(new CommandNotification(CommandNotification.SELECT_PROJECT,this._4918._4919.path));
            }
         }
         else
         {
            this._4909();
         }
      }
      
      private function _4910(param1:_1427) : void
      {
         var _loc2_:_671 = null;
         if(param1._4928 is _671)
         {
            _loc2_ = param1._4928 as _671;
            if(Boolean(_loc2_._2871) && _loc2_._2871._3543)
            {
               param1.preventDefault();
               _1567(new CommandNotification(CommandNotification.SHOW_CLOSE_PROJECT_CONFIRMATION_DIALOG,_loc2_));
            }
         }
         else if(param1._4928 is _706 && this._4823.dataProvider.length == 1)
         {
            param1.preventDefault();
         }
      }
      
      private function _4911(param1:_1427) : void
      {
         var _loc2_:_671 = null;
         var _loc3_:_10606 = null;
         if(param1._4928 is _671)
         {
            _11110.instance._11652(_11105.Name_CloseProject,_11108.Stage);
            if(_117._11125)
            {
               _117._11125 = false;
               _loc3_ = new _10606();
               _loc3_.execute();
            }
            _loc2_ = param1._4928 as _671;
            _1567(new CommandNotification(CommandNotification.CLOSE_PROJECT_SUCCESS,_loc2_.path));
         }
         else if(param1._4928 is _706)
         {
            _1567(new CommandNotification(CommandNotification.CLOSE_WELCOME_PAGE));
         }
      }
      
      private function _4908(param1:BoxContainerEvent) : void
      {
         this._4914();
      }
      
      protected function _4923(param1:ListEvent) : void
      {
         var _loc3_:_671 = null;
         var _loc4_:Point = null;
         var _loc2_:CloseTabButton = param1.itemRenderer as CloseTabButton;
         if(Boolean(_loc2_) && Boolean(_loc2_.closeButton))
         {
            _loc3_ = param1.item as _671;
            if(Boolean(_loc3_) && Boolean(this._4918))
            {
               _loc4_ = _loc2_.localToGlobal(new Point(0,_loc2_.height - 2));
               this._4918._3351(_loc4_.x,_loc4_.y,_loc3_.path);
            }
         }
      }
      
      protected function _4925(param1:ListEvent) : void
      {
         if(this._4918)
         {
            this._4918._3344();
         }
      }
      
      protected function _4920(param1:MouseEvent) : void
      {
         if(this.toolTip)
         {
            this.toolTip.visible = true;
            _1198.setCursor(MouseCursor.BUTTON);
         }
      }
      
      protected function _4921(param1:MouseEvent) : void
      {
         if(this.toolTip)
         {
            this.toolTip.visible = false;
            _1198.setCursor(MouseCursor.AUTO);
         }
      }
      
      protected function _4927(param1:MouseEvent) : void
      {
         var _loc2_:String = null;
         var _loc3_:int = 0;
         var _loc4_:String = null;
         var _loc5_:File = null;
         if(param1.currentTarget is _1005 && param1.target is _1142)
         {
            _loc2_ = (param1.currentTarget as _1005).showText;
            _loc3_ = int(_loc2_.lastIndexOf("/"));
            _loc4_ = _loc2_.substring(_loc3_ + 1,_loc2_.length);
            _loc2_ = _loc2_.replace(_loc4_,"");
            _loc5_ = File.documentsDirectory.resolvePath(_loc2_);
            if(_loc5_.exists)
            {
               _loc5_.openWithDefaultApplication();
            }
         }
      }
      
      public function _3312() : void
      {
         var _loc1_:_1393 = null;
         if(!_2214.openWelcome)
         {
            _2214.openWelcome = true;
            _loc1_ = this._4918._4919;
            this._4918.dataProvider.addItemAt(_706.instance,0);
            this._4918._4919 = _loc1_;
         }
      }
      
      public function _3296(param1:_671) : void
      {
         _2214._4820(param1);
         this._4918._2248(param1);
      }
      
      public function _3311(param1:Boolean = true, param2:Boolean = false) : void
      {
         if(_2214.openWelcome)
         {
            _2214.openWelcome = false;
            this._4918._4922(_706.instance,param1,param2);
            if(_2214._3223 != this._4918._4919)
            {
               this._3298(this._4918._4919 as _671);
            }
         }
      }
      
      public function _3222(param1:_671, param2:Boolean = true, param3:Boolean = false) : void
      {
         this._4918._4922(param1,param2,param3);
         if(Boolean(this._4918._4919) && _2214._3223 != this._4918._4919)
         {
            this._4929(this._4918._4919);
         }
         if(this.toolTip)
         {
            this.toolTip.visible = false;
         }
      }
      
      public function _4929(param1:_1393) : void
      {
         if(param1 == _706.instance)
         {
            this._3313();
         }
         else
         {
            this._3298(param1 as _671);
         }
      }
      
      public function _3313() : void
      {
         _2214._4926(_706.instance);
         _2217._3791 = null;
         if(this._4918._4919 == _706.instance)
         {
            this._4909();
         }
         else
         {
            this._4918._4919 = _706.instance;
         }
      }
      
      public function _3298(param1:_671) : Boolean
      {
         if(!param1)
         {
            _2214._3328 = "";
            return false;
         }
         if(_2214._4926(param1))
         {
            _2217._3791 = param1._2871._1655;
            if(this._4918._4919 == param1)
            {
               this._4909();
            }
            else
            {
               this._4918._4919 = param1;
            }
            DBAnimateManager.getInstance()._3769 = param1.path;
            return true;
         }
         return false;
      }
      
      public function _4806() : void
      {
         var _loc6_:_671 = null;
         var _loc7_:int = 0;
         var _loc1_:Array = this._4918.dataProvider.source;
         var _loc2_:int = int(_2214.openProjectPathList.length);
         var _loc3_:Boolean = false;
         var _loc4_:int = _2214.openWelcome ? 1 : 0;
         var _loc5_:int = 0;
         while(_loc5_ < _loc2_)
         {
            _loc6_ = _2214._11562(_2214.openProjectPathList[_loc5_]);
            if(_loc1_[_loc5_ + _loc4_] != _loc6_)
            {
               _loc7_ = int(_loc1_.indexOf(_loc6_));
               if(_loc7_ == -1)
               {
                  throw Error("index == -1");
               }
               _loc1_.splice(_loc7_,1);
               _loc1_.splice(_loc5_ + _loc4_,0,_loc6_);
               _loc3_ = true;
            }
            _loc5_++;
         }
         if(_loc3_)
         {
            this._4918.dataProvider.refresh();
         }
      }
      
      public function _4914() : void
      {
         var _loc4_:int = 0;
         var _loc6_:_1037 = null;
         var _loc7_:String = null;
         var _loc1_:Array = this._4918.dataProvider.source;
         var _loc2_:int = int(_2214.openProjectPathList.length);
         var _loc3_:int = 0;
         if(_2214.openWelcome)
         {
            _loc3_ = 1;
            _loc6_ = this._4918.dataProvider as _1037;
            if((_loc4_ = _loc6_.getItemIndex(_706.instance)) != 0)
            {
               if(_loc4_ != -1)
               {
                  _loc6_.removeItemAt(_loc4_);
               }
               _loc6_.addItemAt(_706.instance,0);
            }
         }
         var _loc5_:int = 0;
         while(_loc5_ < _loc2_ - _loc3_)
         {
            _loc7_ = (_loc1_[_loc5_ + _loc3_] as _671).path;
            if(_loc7_ != _2214.openProjectPathList[_loc5_])
            {
               _loc4_ = int(_2214.openProjectPathList.indexOf(_loc7_));
               if(_loc4_ != -1)
               {
                  _2214.openProjectPathList.splice(_loc4_,1);
               }
               _2214.openProjectPathList.splice(_loc5_,0,_loc7_);
            }
            _loc5_++;
         }
         _2214._3525();
      }
      
      private function _4909() : void
      {
         var _loc1_:_671 = null;
         var _loc2_:SymbolType = null;
         this._3176._3332 = _716.SELECT;
         _530.instance._3834();
         if(this._4918._4919 is _671)
         {
            this._4915.welcomePage = null;
            this._3176.stagePanel = this._4918._4827 as StagePanel;
            _loc1_ = this._4918._4919 as _671;
            this._4913 = _loc1_._2871;
            _2220._2873 = this._3176.stagePanel._2873;
            _loc2_ = _loc1_._2871._2865._1811;
            switch(_loc2_)
            {
               case SymbolType.ARMATURE:
                  this._3176.stagePanel.skinName = _937;
                  break;
               case SymbolType.MC:
                  this._3176.stagePanel.skinName = _940;
                  break;
               case SymbolType.STAGE:
                  this._3176.stagePanel.skinName = _941;
                  break;
               case SymbolType.COMIC:
                  this._3176.stagePanel.skinName = _939;
                  break;
               case SymbolType.SHEET:
                  this._3176.stagePanel.skinName = _13219;
                  break;
               default:
                  this._3176.stagePanel.skinName = _937;
            }
         }
         else
         {
            this._3176.stagePanel = null;
            this._4915.welcomePage = this._4918._4827 as _946;
            this._4913 = null;
            _2220._2873 = _715.NULL;
         }
         this._3212._3327();
      }
      
      private function _4924() : void
      {
      }
      
      public function get _4823() : _945
      {
         return this._4918;
      }
      
      public function set _4823(param1:_945) : void
      {
         if(this._4918 == param1)
         {
            return;
         }
         if(this._4918)
         {
            this.dispose();
         }
         this._4918 = param1;
         if(this._4918)
         {
            this.start();
         }
      }
      
      private function get _3212() : _577
      {
         return _1407.getInstance(_577);
      }
      
      private function set _4913(param1:_665) : void
      {
         if(this._4912 == param1)
         {
            return;
         }
         this._4912 = param1;
         _2226.selectableFilter = !!param1 ? param1._3286.selectableFilter : null;
         _2225.visibleFilter = !!param1 ? param1._3286.visibleFilter : null;
         this._4916._2871 = param1;
         this._2852._2871 = param1;
         this._2880._2871 = param1;
         this._2858._2871 = param1;
         this._2908._2871 = param1;
         this._2861._2871 = param1;
         this._13242._2871 = param1;
         this._2853.refresh();
      }
      
      private function get toolTip() : _1005
      {
         return this._4918._11379;
      }
   }
}

