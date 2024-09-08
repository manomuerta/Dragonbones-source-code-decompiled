package _346
{
   import _11111._11110;
   import _120._121;
   import _120._123;
   import _1404._1407;
   import _354.AddImageFileTask;
   import _354.AddTextureFileTask;
   import _354._353;
   import _472._622;
   import _51._50;
   import _51._71;
   import _521._528;
   import _555.LibraryPanelController;
   import _648._665;
   import _721._722;
   import _73.SymbolType;
   import _777._779;
   import _783.TipNotification;
   import _93._92;
   import egret.utils.tr;
   import flash.events.Event;
   
   public class _14065 extends _92
   {
      public static const DEFAULT_COMIC_WIDTH:int = 600;
      
      public static const DEFAULT_COMIC_HEIGHT:int = 800;
      
      private var _10295:Vector.<_50>;
      
      private var _10293:Vector.<String>;
      
      private var _2871:_665;
      
      private var taskQueue:_123;
      
      private var _12566:Array;
      
      private var projectPath:String;
      
      public function _14065()
      {
         super();
      }
      
      override public function execute() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         this.projectPath = this._3287.projectPath;
         _loc1_ = 0;
         _loc2_ = int(this._3287._3274._2126.length);
         while(_loc1_ < _loc2_)
         {
            if(this._3287._3274._2126[_loc1_]._1811 == SymbolType.ARMATURE)
            {
               _loc3_++;
            }
            else
            {
               _loc4_++;
            }
            this._3287._3274._2126[_loc1_]._1871();
            _loc1_++;
         }
         _779.instance._3276(_779.PARAM_V1,_loc4_);
         _779.instance._3276(_779.PARAM_V2,_loc3_);
         this._2871 = _2214._1844._2871;
         this.taskQueue = new _123();
         this.taskQueue.addEventListener(_121.COMPLETE,this.onComplete);
         this.taskQueue.addEventListener(_121.FAIL,this.onFail);
         this._12568();
      }
      
      private function _12568() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc4_:_353 = null;
         var _loc3_:int = 0;
         _loc1_ = 0;
         _loc2_ = int(this._3287._3274._2126.length);
         while(_loc1_ < _loc2_)
         {
            if(this._3287._3274._2126[_loc1_]._1811 == SymbolType.STAGE)
            {
               this._3287._3274._2126[_loc1_]._1811 = SymbolType.MC;
            }
            if(this._2129(this._2871.dragonBonesVO,this._3287._3274._2126[_loc1_].name))
            {
               _loc3_++;
            }
            _loc1_++;
         }
         _353.num = _loc3_;
         this._10295 = new Vector.<_50>();
         this._10293 = new Vector.<String>();
         _loc1_ = 0;
         _loc2_ = int(this._3287._3274._2126.length);
         while(_loc1_ < _loc2_)
         {
            _loc4_ = new _353(this._2871.dragonBonesVO,this._3287._3274,this._3287._3274._2126[_loc1_],this._3287.libraryPath,this._10295,this._10293);
            this.taskQueue._2389(_loc4_);
            _loc1_++;
         }
         this.taskQueue.run();
      }
      
      private function onFail(param1:_121) : void
      {
         _353.type = _353.TYPE_CUSTOME;
         AddImageFileTask.type = AddImageFileTask.TYPE_CUSTOME;
         AddTextureFileTask.type = AddTextureFileTask.TYPE_CUSTOME;
         param1.target.removeEventListener(_121.FAIL,this.onFail);
         this._3281._1567(new TipNotification(TipNotification.TIP_ALERT,tr("Import.error.fail")));
         _779.instance._3276(_779.PARAM_RESULT,tr("Import.error.fail"));
         _779.instance._3275();
         _11110.instance._11131.fail("Import.error.fail");
         _11110.instance._11131._11132();
      }
      
      private function onComplete(param1:Event) : void
      {
         var _loc5_:_50 = null;
         _353.type = _353.TYPE_CUSTOME;
         AddImageFileTask.type = AddImageFileTask.TYPE_CUSTOME;
         AddTextureFileTask.type = AddTextureFileTask.TYPE_CUSTOME;
         var _loc2_:_722 = _2223 as _722;
         var _loc3_:int = 0;
         var _loc4_:int = int(_loc2_._3274._2126.length);
         _loc3_ = 0;
         while(_loc3_ < _loc4_)
         {
            _loc5_ = _loc2_._3274._2126[_loc3_];
            this._2106._3278(_loc5_);
            _loc3_++;
         }
         param1.target.removeEventListener(_121.COMPLETE,this.onComplete);
         this._2861.importArmatures(this._10295,this._10293);
         this._3281._1567(new TipNotification(TipNotification.TIP_ALERT,tr("Import.project.success")));
         _779.instance._3276(_779.PARAM_RESULT,0);
         _779.instance._3275();
         _11110.instance._11131._11132();
         this._2861.openNewArmature(_loc5_);
      }
      
      private function _2129(param1:_71, param2:String) : Boolean
      {
         var _loc3_:int = 0;
         var _loc4_:int = int(param1._2126.length);
         while(_loc3_ < _loc4_)
         {
            if(param1._2126[_loc3_].name == param2)
            {
               return true;
            }
            _loc3_++;
         }
         return false;
      }
      
      protected function get _3281() : _622
      {
         return _1407.getInstance(_622) as _622;
      }
      
      private function get _2861() : LibraryPanelController
      {
         return _1407.getInstance(LibraryPanelController) as LibraryPanelController;
      }
      
      private function get _2106() : _528
      {
         return _1407.getInstance(_528) as _528;
      }
      
      private function get _3287() : _722
      {
         return _2223 as _722;
      }
   }
}

