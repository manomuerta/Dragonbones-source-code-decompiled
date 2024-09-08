package _639
{
   import _1374._1393;
   import _14079._14082;
   import _35.HashObject;
   import _636.DBModelEvent;
   import _648._665;
   import _668._671;
   import _668._706;
   import _708._707;
   import _777._10256;
   import _97._101;
   import egret.utils.FileUtil;
   import egret.utils._1501;
   import flash.filesystem.File;
   import flash.utils.Dictionary;
   
   public class _638 extends _640
   {
      public static const NEW_PROJECT_NAME:String = "NewProject";
      
      public static const NEW_COMIC_NAME:String = "NewComic";
      
      public static const NEW_PRJECT_CACHE_FOLDER:String = "newProjectTemp";
      
      private static var propertyList:Array = [["Cache:OPEN_PROJECTS",[],"projectsToOpen","openProjectPathList"],["Cache:RECENT_PROJECTS",[],"recentProjectPathList","recentProjectPathList"],["Cache:OPEN_WELCOME",true,"welcomeToOpen","openWelcome"],["Cache:CURRENT_DOC_PATH","","_currentDocPath","_currentDocPath"],["Cache:NEW_PROJECT_PATH",FileUtil.escapePath(File.documentsDirectory.resolvePath("DBProjects").nativePath),"_newProjectPath","_newProjectPath"],["Cache:COORDINATE_TYPE",_707.GLOBAL.toString(),"coordinateTypeStr","coordinateTypeStr"]];
      
      public var _3524:Boolean = false;
      
      public var projectsToOpen:Array;
      
      public var welcomeToOpen:Boolean = false;
      
      public var openProjectPathList:Array;
      
      private var _5631:Boolean = false;
      
      private var _5632:Dictionary;
      
      public var recentProjectPathList:Array;
      
      private var _10789:Array;
      
      private var _10791:Dictionary;
      
      private var _currentDocPath:String = "";
      
      private var _newProjectPath:String;
      
      private var _10790:String;
      
      private var _5626:_707;
      
      private var _5630:_641;
      
      private var _5625:_642;
      
      private var _14662:_14082;
      
      private var _11719:HotkeysModel;
      
      private var _10364:_10256;
      
      private var _12696:_12462;
      
      public function _638()
      {
         this.projectsToOpen = [];
         this.openProjectPathList = [];
         this._5632 = new Dictionary();
         this.recentProjectPathList = [];
         this._10789 = [];
         this._10791 = new Dictionary();
         super();
         _5633 = "cache.amf";
         _5627 = "cache2.amf";
         this._5630 = new _641();
         this._5625 = _642.getInstance();
         this._14662 = _14082.getInstance();
         this._11719 = HotkeysModel.getInstance();
         this._10364 = _10256.getInstance();
         this._12696 = _12462.getInstance();
         this._10790 = FileUtil.escapePath(File.applicationStorageDirectory.resolvePath(NEW_PRJECT_CACHE_FOLDER).nativePath);
      }
      
      override public function initialize() : void
      {
         super.initialize();
         this._5630.initialize();
         this._5625.initialize();
         this._11719.initialize();
         this._10364.initialize();
         this._12696.initialize();
      }
      
      override protected function _5620() : Object
      {
         var _loc1_:Object = {};
         _loc1_["Cache:APP_LAST_VERSION"] = _1501.currentVersion;
         return _loc1_;
      }
      
      public function _1664() : void
      {
         var _loc1_:Object = null;
         var _loc2_:Array = null;
         for each(_loc2_ in propertyList)
         {
            _loc1_ = _5629(_loc2_[0]);
            this[_loc2_[2]] = _loc1_ != null ? _loc1_ : _loc2_[1];
         }
         this._5630._1664();
         this._5625._1664();
         this._10364._1664();
         this._12696._1664();
      }
      
      public function _3214() : void
      {
         this._5630._1664(true);
      }
      
      public function _3525() : void
      {
         var _loc1_:Array = null;
         for each(_loc1_ in propertyList)
         {
            _5628(_loc1_[0],this[_loc1_[3]]);
         }
         save(true);
      }
      
      public function _4820(param1:_671) : void
      {
         var _loc2_:String = param1.path;
         if(this.openProjectPathList.indexOf(_loc2_) == -1)
         {
            this.openProjectPathList.push(_loc2_);
            _5621("Cache:OPEN_PROJECTS",this.openProjectPathList);
         }
         this._5632[_loc2_] = param1;
      }
      
      public function _10702(param1:String) : void
      {
         this._10697(param1);
         if(this.recentProjectPathList.indexOf(param1) == -1)
         {
            this.recentProjectPathList.unshift(param1);
            this.recentProjectPathList.splice(12);
            _5621("Cache:RECENT_PROJECTS",this.recentProjectPathList);
         }
      }
      
      public function _10697(param1:String) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.recentProjectPathList.length)
         {
            if(param1 == this.recentProjectPathList[_loc2_])
            {
               this.recentProjectPathList.splice(_loc2_,1);
               _5621("Cache:RECENT_PROJECTS",this.recentProjectPathList);
            }
            _loc2_++;
         }
      }
      
      public function _3221(param1:_671) : void
      {
         var _loc2_:String = param1.path;
         var _loc3_:int = int(this.openProjectPathList.indexOf(_loc2_));
         if(_loc3_ != -1)
         {
            this.openProjectPathList.splice(_loc3_,1);
            _5621("Cache:OPEN_PROJECTS",this.openProjectPathList);
            if(param1._2871)
            {
               HashObject._1845(param1._2871);
            }
         }
         delete this._5632[_loc2_];
         if(this._currentDocPath == _loc2_)
         {
            this._currentDocPath = "";
         }
      }
      
      public function _11562(param1:String) : _671
      {
         return this._5632[param1];
      }
      
      private function _5624(param1:String) : _665
      {
         var _2871:_665 = null;
         var projectPath:String = param1;
         projectPath = FileUtil.escapeUrl(projectPath);
         if(!FileUtil.exists(projectPath))
         {
            return null;
         }
         try
         {
            _2871 = _665._5622(projectPath);
         }
         catch(e:Error)
         {
            return null;
         }
         return _2871;
      }
      
      public function get _3740() : Boolean
      {
         if(this._currentDocPath == "" || this._currentDocPath == _706._4829)
         {
            return false;
         }
         return true;
      }
      
      public function get _3223() : _1393
      {
         if(this._currentDocPath == "")
         {
            return null;
         }
         if(this._currentDocPath == _706._4829)
         {
            return _706.instance;
         }
         return this._5632[this._currentDocPath];
      }
      
      public function get _1844() : _671
      {
         return this._3223 as _671;
      }
      
      public function get _3328() : String
      {
         return this._currentDocPath;
      }
      
      public function set _3328(param1:String) : void
      {
         this._currentDocPath = param1;
         _5621("Cache:CURRENT_DOC_PATH",this._currentDocPath);
         dispatchEvent(new DBModelEvent(DBModelEvent.CURRENT_DOC_CHANGED));
      }
      
      public function _4926(param1:_1393) : Boolean
      {
         var _loc3_:_671 = null;
         var _loc2_:String = "";
         if(param1 is _671)
         {
            _loc3_ = param1 as _671;
            if(!_loc3_._2871)
            {
               _loc3_._2871 = this._5624(_loc3_.path);
               if(!_loc3_._2871)
               {
                  return false;
               }
            }
            _loc2_ = _loc3_.path;
            HashObject._1844 = _loc3_._2871;
         }
         else if(param1 is _706)
         {
            _loc2_ = _706._4829;
         }
         this._3328 = _loc2_;
         return true;
      }
      
      public function _11692() : void
      {
         this.openWelcome = false;
         this._4926(null);
         this._3525();
      }
      
      public function get _2220() : _641
      {
         return this._5630;
      }
      
      public function get _2216() : _642
      {
         return this._5625;
      }
      
      public function get _14312() : _14082
      {
         return this._14662;
      }
      
      public function get openWelcome() : Boolean
      {
         return this._5631;
      }
      
      public function set openWelcome(param1:Boolean) : void
      {
         if(this._5631 == param1)
         {
            return;
         }
         this._5631 = param1;
         _5621("Cache:OPEN_WELCOME",this._5631);
      }
      
      public function get _3277() : String
      {
         if(this._newProjectPath == null || this._newProjectPath == "")
         {
            return FileUtil.escapePath(File.documentsDirectory.resolvePath("DBProjects").nativePath);
         }
         return this._newProjectPath;
      }
      
      public function set _3277(param1:String) : void
      {
         if(this._newProjectPath == param1)
         {
            return;
         }
         this._newProjectPath = param1;
         _5621("Cache:NEW_PROJECT_PATH",this._newProjectPath);
      }
      
      public function get _3326() : _707
      {
         return this._5626;
      }
      
      public function set _3326(param1:_707) : void
      {
         if(this._5626 == param1)
         {
            return;
         }
         this._5626 = param1;
         _5621("Cache:COORDINATE_TYPE",this.coordinateTypeStr);
         dispatchEvent(new DBModelEvent(DBModelEvent.COORDINATE_TYPE_CHANGED));
      }
      
      private function get coordinateTypeStr() : String
      {
         return !!this._5626 ? this._5626.toString() : "";
      }
      
      private function set coordinateTypeStr(param1:String) : void
      {
         if(this.coordinateTypeStr == param1)
         {
            return;
         }
         this._5626 = _707._5623(param1);
      }
      
      public function get _10365() : _10256
      {
         return this._10364;
      }
      
      public function _11701(param1:String) : String
      {
         var _loc2_:String = param1;
         var _loc3_:String = FileUtil.escapePath(this._10790 + "/" + _loc2_);
         var _loc4_:int = 1;
         while(FileUtil.exists(_loc3_))
         {
            _loc2_ = param1 + "_" + _loc4_;
            _loc3_ = FileUtil.escapePath(this._10790 + "/" + _loc2_);
            _loc4_++;
         }
         return _loc2_;
      }
      
      public function _11702(param1:String, param2:String) : String
      {
         var _loc3_:String = param2;
         var _loc4_:String = FileUtil.escapePath(this._10790 + "/" + param1 + "/" + param2 + _101.PROJECT_SUFFIX);
         var _loc5_:int = 1;
         while(FileUtil.exists(_loc4_))
         {
            _loc3_ = param2 + "_" + _loc5_;
            _loc4_ = FileUtil.escapePath(this._10790 + "/" + param1 + "/" + param2 + _101.PROJECT_SUFFIX);
            _loc5_++;
         }
         return _loc3_;
      }
      
      public function _11703(param1:String, param2:String) : String
      {
         return FileUtil.escapePath(this._10790 + "/" + param1 + "/" + param2 + _101.PROJECT_SUFFIX);
      }
      
      public function get _10787() : String
      {
         return this._10790;
      }
      
      public function get _11715() : HotkeysModel
      {
         return this._11719;
      }
   }
}

