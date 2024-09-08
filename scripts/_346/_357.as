package _346
{
   import _11111._11110;
   import _1177.CloseEvent;
   import _120._121;
   import _120._123;
   import _1374.Alert;
   import _1404._1407;
   import _18._21;
   import _354.AddImageFileTask;
   import _354.AddTextureFileTask;
   import _354._353;
   import _40.BoneFrameVO;
   import _40._39;
   import _40._41;
   import _40._47;
   import _40._48;
   import _472._622;
   import _51._50;
   import _51._52;
   import _51._71;
   import _51._79;
   import _521._528;
   import _54._53;
   import _555.LibraryPanelController;
   import _648._665;
   import _721._722;
   import _721._763;
   import _73.SymbolType;
   import _755._757;
   import _755._760;
   import _755._761;
   import _777._779;
   import _783.TipNotification;
   import _93._92;
   import _97._100;
   import egret.utils.FileUtil;
   import egret.utils.tr;
   import flash.events.Event;
   import flash.filesystem.File;
   
   public class _357 extends _92
   {
      public static const DEFAULT_COMIC_WIDTH:int = 600;
      
      public static const DEFAULT_COMIC_HEIGHT:int = 800;
      
      private var _10295:Vector.<_50>;
      
      private var _10293:Vector.<String>;
      
      private var _2871:_665;
      
      private var taskQueue:_123;
      
      private var _12566:Array;
      
      private var projectPath:String;
      
      public function _357()
      {
         super();
      }
      
      override public function execute() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:File = null;
         var _loc6_:File = null;
         var _loc7_:String = null;
         var _loc8_:String = null;
         var _loc9_:String = null;
         var _loc10_:int = 0;
         var _loc11_:Alert = null;
         var _loc12_:String = null;
         var _loc13_:int = 0;
         var _loc14_:Array = null;
         var _loc15_:Array = null;
         var _loc16_:Object = null;
         var _loc17_:String = null;
         var _loc18_:Object = null;
         var _loc19_:AddTextureFileTask = null;
         var _loc20_:AddImageFileTask = null;
         var _loc21_:Alert = null;
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
         if(!this._3287._3271)
         {
            if(FileUtil.exists(this.projectPath))
            {
               _loc5_ = new File(this.projectPath);
               _loc6_ = _loc5_.parent;
               _loc7_ = _loc5_.name.substr(0,_loc5_.name.length - _loc5_.extension.length - 1);
               _loc8_ = _loc5_.extension;
               _loc10_ = 1;
               do
               {
                  _loc9_ = _loc7_ + "_" + String(_loc10_++) + "." + _loc8_;
               }
               while(_loc5_ = _loc6_.resolvePath(_loc9_), _loc5_.exists);
               
               this.projectPath = FileUtil.escapePath(_loc5_.nativePath);
            }
            if(!_665._3272(this.projectPath))
            {
               this._3281._1567(new TipNotification(TipNotification.TIP_ALERT,tr("Import.error.fail")));
               return;
            }
            if(!this._3287.saveFile())
            {
               this._3281._1567(new TipNotification(TipNotification.TIP_ALERT,tr("Import.error.fail")));
               return;
            }
            this._2871 = this._3287._2871;
            this._2871.projectPath = this.projectPath;
            this._2871._3286 = _760._1630({
               "cY":0,
               "cX":0,
               "filter":{
                  "visibleFilter":{
                     "image":1,
                     "slots":[],
                     "bones":[],
                     "armatures":[],
                     "bone":1
                  },
                  "selectableFilter":{
                     "image":1,
                     "slots":[],
                     "bones":[],
                     "armatures":[],
                     "bone":1
                  }
               },
               "zoom":1
            });
            this._2871._2824 = _761._1630({
               "autoRecordKeyFrame":0,
               "autoTween":1
            });
            this._2871._1655 = new _21();
            if(this._3287._3279())
            {
               _loc11_ = Alert.show(tr("Import.psd.typeChange"),"",null,this._2503,tr("Import.psd.movieClip"),tr("Import.psd.armature"),tr("Import.psd.comic"));
               _loc11_.closeButton.visible = false;
               _loc11_._2631.visible = false;
               _loc11_._2630.visible = false;
            }
            else
            {
               this._3283();
            }
         }
         else
         {
            this._2871 = _2214._1844._2871;
            this.taskQueue = new _123();
            this.taskQueue.addEventListener(_121.COMPLETE,this.onComplete);
            this.taskQueue.addEventListener(_121.FAIL,this.onFail);
            _loc14_ = [];
            _loc15_ = [];
            this._12566 = [];
            _loc1_ = 0;
            _loc2_ = int(this._3287._3282.length);
            while(_loc1_ < _loc2_)
            {
               if(this._3287._3282[_loc1_].texture == null)
               {
                  _loc12_ = this._3287._3282[_loc1_].path;
                  _loc14_.push(this._3287._3282[_loc1_]);
                  if(FileUtil.exists(_loc12_))
                  {
                     _loc13_++;
                  }
               }
               else
               {
                  this._12566.push(this._3287._3282[_loc1_]);
               }
               _loc1_++;
            }
            while(this._12566.length > 0)
            {
               _loc16_ = this._12566.pop();
               _loc17_ = FileUtil.getFileName(_loc16_.path);
               _loc18_ = this._12565(_loc17_);
               if(_loc18_ == null)
               {
                  break;
               }
               if(FileUtil.exists(_loc16_.path) || FileUtil.exists(_loc18_.path))
               {
                  _loc13_++;
               }
               if(FileUtil.getExtension(_loc16_.path).toLowerCase() == "png")
               {
                  _loc15_.push([_loc16_,_loc18_]);
               }
               else
               {
                  _loc15_.push([_loc18_,_loc16_]);
               }
            }
            AddImageFileTask.num = _loc13_;
            _loc1_ = 0;
            _loc2_ = int(_loc15_.length);
            while(_loc1_ < _loc2_)
            {
               _loc19_ = new AddTextureFileTask(_loc15_[_loc1_][0].path,_loc15_[_loc1_][0].content,_loc15_[_loc1_][1].path,_loc15_[_loc1_][1].content,this._3287._3274);
               this.taskQueue._2389(_loc19_);
               _loc1_++;
            }
            _loc1_ = 0;
            _loc2_ = int(_loc14_.length);
            while(_loc1_ < _loc2_)
            {
               _loc20_ = new AddImageFileTask(_loc14_[_loc1_].path,_loc14_[_loc1_].content,this._3287._3274);
               this.taskQueue._2389(_loc20_);
               _loc1_++;
            }
            if(this._3287._3279())
            {
               _loc21_ = Alert.show(tr("Import.psd.typeChange"),"",null,this._12567,tr("Import.psd.movieClip"),tr("Import.psd.armature"));
               _loc21_.closeButton.visible = false;
               _loc21_._2631.visible = false;
               _loc21_._2630.visible = false;
            }
            else
            {
               this._12568();
            }
         }
      }
      
      private function _12565(param1:String) : Object
      {
         var _loc2_:Object = null;
         var _loc3_:int = 0;
         var _loc4_:int = int(this._12566.length);
         while(_loc3_ < _loc4_)
         {
            _loc2_ = this._12566[_loc3_];
            if(FileUtil.getFileName(_loc2_.path) == param1)
            {
               this._12566.splice(_loc3_,1);
               return _loc2_;
            }
            _loc3_++;
         }
         return null;
      }
      
      private function _3283() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc5_:String = null;
         var _loc6_:_361 = null;
         if(this._3287 == null || this._3287._3274 == null || this._2871 == null)
         {
            return;
         }
         var _loc3_:_71 = this._3287._3274;
         this._2871.init(_loc3_);
         var _loc4_:Object = {};
         if(_loc3_._2126)
         {
            _loc1_ = 0;
            _loc2_ = int(_loc3_._2126.length);
            while(_loc1_ < _loc2_)
            {
               if(_loc3_._2126[_loc1_])
               {
                  if(_loc3_._2126[_loc1_]._1811 == SymbolType.STAGE)
                  {
                     _loc3_._2126[_loc1_]._1811 = SymbolType.MC;
                  }
                  _loc5_ = _loc3_._2126[_loc1_].name;
                  _loc4_[_loc5_] = "library/";
               }
               _loc1_++;
            }
         }
         this._2871.libraryData = new _757(_loc4_,this.projectPath);
         this._2871.save();
         if(this._2871.projectPath)
         {
            _loc6_ = new _361();
            _loc6_._1572(this._2871.projectPath);
            _loc6_.execute();
         }
         if(_2214 && _2214._1844 && Boolean(_2214._1844._2871))
         {
            _2214._1844._2871.isNew = true;
            _2214._1844._5805(null);
            _2217._10699();
            _779.instance._3276(_779.PARAM_RESULT,0);
            _779.instance._3275();
            _11110.instance._11131._11132();
         }
      }
      
      private function _2503(param1:CloseEvent) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(param1.detail == Alert.FIRST_BUTTON)
         {
            this._3270(this._3287._3274._2126[0]);
            this._3283();
         }
         else if(param1.detail == Alert.THIRD_BUTTON)
         {
            _loc2_ = 0;
            _loc3_ = 0;
            if(this._3287._1717 && this._3287._1717.armature && Boolean(this._3287._1717.armature[0]) && Boolean(this._3287._1717.armature[0].aabb))
            {
               _loc2_ = int(this._3287._1717.armature[0].aabb.width);
               if(_loc2_ > 0)
               {
                  _loc3_ = int(_loc2_ * 16 / 9);
               }
               else
               {
                  _loc3_ = DEFAULT_COMIC_HEIGHT;
               }
            }
            if(_loc2_ <= 0)
            {
               _loc2_ = DEFAULT_COMIC_WIDTH;
            }
            if(_loc3_ <= 0)
            {
               _loc3_ = DEFAULT_COMIC_HEIGHT;
            }
            this._3273(this._3287._3274._2126[0],_loc2_,_loc3_);
            this._2871._3286._3285(this._3287._3274._2126[0],_763._1572(_loc2_,_loc3_,_100.COMIC_BG_COLOR));
            this._3283();
         }
         else
         {
            this._3283();
         }
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
      
      private function _12567(param1:CloseEvent) : void
      {
         if(param1.detail == Alert.FIRST_BUTTON)
         {
            this._3270(this._3287._3274._2126[0]);
            this._3287._3274._2126[0]._1741();
            this._3287._3274._2126[0]._1988();
            this._3287._3274._2126[0]._1751();
            this._12568();
         }
         else
         {
            this._12568();
         }
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
      
      private function _3270(param1:_50) : void
      {
         var _loc2_:_79 = null;
         var _loc3_:_52 = null;
         var _loc4_:_52 = null;
         var _loc5_:_41 = null;
         var _loc6_:_48 = null;
         var _loc7_:BoneFrameVO = null;
         var _loc8_:_47 = null;
         param1._1811 = SymbolType.MC;
         _loc3_ = param1._1990;
         var _loc9_:_39;
         (_loc9_ = _39._1869(tr("Animation.new.name")))._1746 = [];
         _loc9_._1745 = [];
         _loc9_._1753 = [];
         _loc5_ = _41._1869(_loc3_);
         _loc9_._1746.push(_loc5_);
         var _loc10_:int = 0;
         var _loc11_:int = int(param1._1780.length);
         while(_loc10_ < _loc11_)
         {
            _loc2_ = param1._1780[_loc10_] as _79;
            _loc4_ = _52._1729(_loc2_.name,_loc3_);
            _loc4_._1724.copyFrom(_loc2_._1724);
            _loc4_._1882 = _loc2_;
            param1._1794(_loc4_);
            _loc7_ = new BoneFrameVO(_loc4_,false);
            _loc5_ = _41._1869(_loc4_,[_loc7_]);
            _loc9_._1746.push(_loc5_);
            _loc2_._1724.x = 0;
            _loc2_._1724.y = 0;
            _loc2_._1724.scaleX = 1;
            _loc2_._1724.scaleY = 1;
            _loc2_._1724.skewX = 0;
            _loc2_._1724.skewY = 0;
            _loc2_.parentBoneData = _loc4_;
            (_loc8_ = new _47(_loc2_,false))._1732 = _loc2_._1923;
            _loc6_ = _48._1869(_loc2_,[_loc8_]);
            _loc2_._1711 = null;
            _loc9_._1745.push(_loc6_);
            _loc10_++;
         }
         param1._1963 = [_loc9_];
         _loc9_.rootArmatureData = param1;
      }
      
      private function _3273(param1:_50, param2:int = 800, param3:int = 600) : void
      {
         var _loc4_:_79 = null;
         var _loc5_:_52 = null;
         var _loc6_:_52 = null;
         var _loc7_:_41 = null;
         var _loc8_:_48 = null;
         var _loc9_:BoneFrameVO = null;
         var _loc10_:_47 = null;
         param1._1811 = SymbolType.COMIC;
         _loc5_ = param1._1990;
         var _loc11_:_39 = _39._1869("comic");
         var _loc12_:int = 0;
         var _loc13_:int = int(param1._1780.length);
         while(_loc12_ < _loc13_)
         {
            _loc4_ = param1._1780[_loc12_] as _79;
            _loc6_ = _52._1729(_loc4_.name,_loc5_);
            _loc6_._1724.copyFrom(_loc4_._1724);
            _loc6_._1882 = _loc4_;
            param1._1794(_loc6_);
            _loc4_._1724.x = 0;
            _loc4_._1724.y = 0;
            _loc4_._1724.scaleX = 1;
            _loc4_._1724.scaleY = 1;
            _loc4_._1724.skewX = 0;
            _loc4_._1724.skewY = 0;
            _loc4_.parentBoneData = _loc6_;
            _loc12_++;
         }
         param1._1763 = new _53(param1);
         _loc11_.rootArmatureData = param1;
      }
   }
}

