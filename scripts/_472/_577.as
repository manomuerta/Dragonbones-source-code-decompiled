package _472
{
   import _1177.IndexChangeEvent;
   import _127._154;
   import _127._156;
   import _1374.TabGroup;
   import _1374.TabPanel;
   import _1374._1382;
   import _1374._1385;
   import _1374._1396;
   import _1376.BoxElement;
   import _1376._1379;
   import _1404._1407;
   import _1421._1427;
   import _346._366;
   import _381._383;
   import _381._384;
   import _555.AnimationPanelController;
   import _555.LibraryPanelController;
   import _555._13201;
   import _555._13202;
   import _555._556;
   import _555._557;
   import _555._558;
   import _555._570;
   import _555._571;
   import _555._576;
   import _561._568;
   import _573.TimelinePanelController;
   import _579._581;
   import _636.DBPanelEvent;
   import _648._663;
   import _668._671;
   import _668._706;
   import _708._715;
   import _783.CommandNotification;
   import _783.StageNotification;
   import _783._782;
   import _872._871;
   import _872._888;
   import _93._94;
   import _944.StagePanel;
   import _944._945;
   import _97._116;
   import _97._96;
   import egret.utils.FileUtil;
   import flash.desktop.NativeApplication;
   import flash.events.Event;
   
   public class _577 extends _94
   {
      public var _3768:_871;
      
      public var _4627:_663;
      
      private var _3219:_581;
      
      private var _2880:_571;
      
      private var _2861:LibraryPanelController;
      
      private var _2852:TimelinePanelController;
      
      private var _2858:AnimationPanelController;
      
      private var _2908:_558;
      
      private var _3016:_570;
      
      private var _4817:_576;
      
      private var _4822:_557;
      
      private var _4216:_568;
      
      private var _3056:_556;
      
      private var _13242:_13201;
      
      private var _13241:_13202;
      
      private var _4836:_888;
      
      public function _577()
      {
         this._3219 = _1407.getInstance(_581);
         this._2880 = _1407.getInstance(_571);
         this._2861 = _1407.getInstance(LibraryPanelController);
         this._2852 = _1407.getInstance(TimelinePanelController);
         this._2858 = _1407.getInstance(AnimationPanelController);
         this._2908 = _1407.getInstance(_558);
         this._3016 = _1407.getInstance(_570);
         this._4817 = _1407.getInstance(_576);
         this._4822 = _1407.getInstance(_557);
         this._4216 = _1407.getInstance(_568);
         this._3056 = _1407.getInstance(_556);
         this._13242 = _1407.getInstance(_13201);
         this._13241 = _1407.getInstance(_13202);
         super();
         _96._2243 = this._2243;
         _96._2229 = this._4828;
         _96._2244 = {
            "BoxElement":BoxElement,
            "TabGroup":_154,
            "TabPanel":_156,
            "Document":_1382,
            "Timeline":TabPanel
         };
         _96._2236 = {
            "BoxElement":BoxElement,
            "TabGroup":_945,
            "TabPanel":StagePanel
         };
      }
      
      override public function start() : void
      {
         super.start();
         this._2880.start();
         this._2861.start();
         this._2852.start();
         this._2858.start();
         this._3016.start();
         this._4817.start();
         this._4822.start();
         this._2908.start();
         this._4216.start();
         this._3056.start();
         this._13242.start();
         this._13241.start();
      }
      
      override protected function init() : void
      {
         this._4627 = new _663();
         this._4836 = new _888();
         this._3768.addElement(this._4836);
         this._4836._2581();
      }
      
      override protected function _1576() : void
      {
         NativeApplication.nativeApplication.addEventListener(Event.EXITING,this._3538);
         _1565(_782.INIT_COMPLETE,this._3745);
         _1565(StageNotification.UPDATE_EDIT_MODE,this._3864);
      }
      
      private function _3538(param1:Event) : void
      {
         this._3327();
         _2220._4804();
      }
      
      private function _3745(param1:_782) : void
      {
         _1564(_782.INIT_COMPLETE,this._3745);
         this._4836.addEventListener(DBPanelEvent.LAYOUT_CHANGED,this._4809);
         this._4836._2245.addEventListener(_1427.CLOSING_PANEL,this._4814);
         this._4825();
         this._4818();
         this._4824();
         this._4819();
      }
      
      private function _3864(param1:StageNotification) : void
      {
         this._4825();
      }
      
      private function _4825() : void
      {
         this._4627._4816();
         this._4627._4807(this._2873);
         _96._2235 = this._4801;
         this._4836._4815(_2220._4821);
         _96._2235 = null;
      }
      
      private function _4818() : void
      {
         this._4836._4810(_2220._4821);
         this._3219._4823 = this._4836._2245._4833._4837 as _945;
      }
      
      private function _4824() : void
      {
         var _loc1_:String = null;
         if(_2214.welcomeToOpen)
         {
            _1567(new CommandNotification(CommandNotification.OPEN_WELCOME_PAGE));
         }
         for each(_loc1_ in _2214.projectsToOpen)
         {
            _1567(new CommandNotification(CommandNotification.OPEN_PROJECT,_loc1_));
         }
         this._3219._4806();
      }
      
      private function _4819() : void
      {
         var _loc3_:String = null;
         var _loc4_:_366 = null;
         var _loc5_:_383 = null;
         var _loc1_:String = _2214._3328;
         if(_loc1_ != _706._4829)
         {
            if(_loc1_ != "" && !_2214._11562(_loc1_))
            {
               _loc1_ = "";
            }
            if(_loc1_ == "")
            {
               var _loc6_:int = 0;
               var _loc7_:* = _2214.openProjectPathList;
               for each(_loc3_ in _loc7_)
               {
                  _loc1_ = _loc3_;
               }
            }
            if(_loc1_ != "")
            {
               _loc4_ = new _366();
               _loc4_._1572(_loc1_);
               _loc4_.execute();
               return;
            }
            _loc5_ = new _383();
            _loc5_.execute();
         }
         var _loc2_:_384 = new _384();
         _loc2_.execute();
      }
      
      public function _3215() : void
      {
         this._4825();
      }
      
      public function _3213(param1:String) : void
      {
         var _loc4_:_154 = null;
         this._4627._3213(param1);
         var _loc2_:Boolean = _2220._4826(param1);
         var _loc3_:TabPanel = _116.getInstance(param1);
         if(_loc2_)
         {
            this._4836._2239(false);
            _loc4_ = _loc3_.owner as _154;
         }
         else
         {
            _loc4_ = this._4813(param1);
            if(_loc4_)
            {
               _loc4_.addElement(_loc3_);
            }
            else
            {
               this._4836._4832(_loc3_);
               _loc4_ = _loc3_.owner as _154;
            }
         }
         if(Boolean(_loc4_) && _loc4_._4827 != _loc3_)
         {
            if(_loc4_._4827)
            {
               this._4627.closePanel(_116._2246(_loc4_._4827));
            }
            _loc4_._4827 = _loc3_;
         }
         this._4836._4812();
      }
      
      public function closePanel(param1:String) : void
      {
         var _loc3_:_1396 = null;
         var _loc2_:* = _116.getInstance(param1);
         if(_loc2_ && Boolean(_loc2_.owner))
         {
            this._4808(_loc2_);
            this._4627.closePanel(param1);
            _loc3_ = this._4836.closePanel(_loc2_);
            if(_loc3_)
            {
               this._4627._3213(_116._2246(_loc3_));
            }
            this._4836._4812();
         }
      }
      
      public function _4812() : void
      {
         this._4836._4812();
      }
      
      public function _3327(param1:Boolean = false) : void
      {
         _2220._4821 = this._4836._2239(false);
      }
      
      private function _4801(param1:String) : void
      {
         this._4627._3213(param1);
      }
      
      private function _4800(param1:String) : void
      {
         this._4627.closePanel(param1);
      }
      
      private function _4809(param1:DBPanelEvent) : void
      {
         _96._2235 = this._4801;
         _96._2233 = this._4800;
         this._3327();
         _96._2235 = null;
         _96._2233 = null;
      }
      
      private function _4814(param1:_1427) : void
      {
         var _loc2_:TabGroup = param1.target as TabGroup;
         var _loc3_:_1396 = param1._4830;
         if(!_loc3_ || _loc2_ is _1385)
         {
            return;
         }
         param1.preventDefault();
         _1567(new CommandNotification(CommandNotification.CLOSE_PANEL,_116._2246(_loc3_)));
      }
      
      private function _4808(param1:_1396) : void
      {
         var _loc4_:_1379 = null;
         var _loc6_:XML = null;
         var _loc2_:_154 = param1.owner as _154;
         var _loc3_:BoxElement = _loc2_._4835 as BoxElement;
         var _loc5_:String = "";
         if(Boolean(_loc2_) && Boolean(_loc3_))
         {
            if(_loc3_._2247 == _loc2_)
            {
               _loc4_ = _loc3_._2241;
               if(_loc3_.isVertical == true)
               {
                  _loc5_ = "top";
               }
               else
               {
                  _loc5_ = "left";
               }
            }
            else if(_loc3_._2241 == _loc2_)
            {
               _loc4_ = _loc3_._2247;
               if(_loc3_.isVertical == true)
               {
                  _loc5_ = "bottom";
               }
               else
               {
                  _loc5_ = "right";
               }
            }
         }
         if(_loc4_)
         {
            (_loc6_ = _2220._4802(_116._2246(param1))).@tabGroupId = _loc2_._2250;
            _loc6_.@relativeId = _loc4_._2250;
            _loc6_.@pos = _loc5_;
            _2220._4803();
         }
      }
      
      private function _2243(param1:String) : _671
      {
         param1 = FileUtil.escapeUrl(param1);
         if(!_2214._11562(param1))
         {
            if(!FileUtil.exists(param1))
            {
               return null;
            }
            _2214._4820(new _671(param1));
         }
         return _2214._11562(param1);
      }
      
      private function _4828(param1:TabGroup) : void
      {
         param1.addEventListener(IndexChangeEvent.CHANGING,this._4811);
      }
      
      private function _4811(param1:IndexChangeEvent) : void
      {
         var _loc2_:TabGroup = param1.currentTarget as TabGroup;
         this._4627.closePanel(_116._2246(_loc2_._4827));
         this._4627._3213(_116._2246(_loc2_.getElementAt(param1.newIndex)));
      }
      
      private function _4813(param1:String) : _154
      {
         var _loc2_:_154 = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:String = null;
         var _loc7_:Object = null;
         var _loc3_:XML = _2220._4802(param1,false);
         if(_loc3_)
         {
            _loc4_ = int(_loc3_.@tabGroupId);
            _loc5_ = int(_loc3_.@relativeId);
            _loc6_ = _loc3_.@pos;
            _loc2_ = _96._2234(this._4836._2245._4837,_loc4_) as _154;
            if(!_loc2_)
            {
               _loc7_ = this._4834(_2220._4805,_loc5_,_loc6_);
               if(_loc7_)
               {
                  _loc2_ = new _154();
                  _loc2_._2250 = _loc4_;
                  this._4836._2245.addElementAt(_loc2_,_loc7_.relative,_loc7_.pos);
               }
            }
         }
         else
         {
            switch(param1)
            {
               case _116.CURVE_PANEL:
                  _loc2_ = new _154();
                  _loc2_._2250 = 101;
                  this._4836._2245.addElementAt(_loc2_,this._4836._4833,"left");
                  break;
               case _116.MESH_PANEL:
                  _loc2_ = new _154();
                  _loc2_._2250 = 102;
                  this._4836._2245.addElementAt(_loc2_,this._4836._4833,"left");
            }
         }
         return _loc2_;
      }
      
      private function _4834(param1:XML, param2:int, param3:String) : Object
      {
         var _loc4_:Boolean = false;
         var _loc5_:_1379 = null;
         var _loc6_:XML = null;
         do
         {
            _loc5_ = _96._2234(this._4836._2245._4837,param2);
            if(_loc5_)
            {
               return {
                  "relative":_loc5_,
                  "pos":param3
               };
            }
            _loc4_ = false;
            for each(_loc6_ in param1.children())
            {
               if(_loc6_.@tabGroupId == param2)
               {
                  param2 = int(_loc6_.@relativeId);
                  param3 = _loc6_.@pos;
                  _loc4_ = true;
                  break;
               }
            }
         }
         while(_loc4_);
         
         return null;
      }
      
      private function get _2873() : _715
      {
         return _2220._2873;
      }
   }
}

