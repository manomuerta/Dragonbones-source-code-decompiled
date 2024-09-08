package _755
{
   import _18._21;
   import _346._10607;
   import _346._11494;
   import _346._363;
   import _346._366;
   import _35.HashObject;
   import _35._13488;
   import _35._34;
   import _51._50;
   import _639._638;
   import _648._647;
   import _648._665;
   import _721._762;
   import _724._13550;
   import _97._101;
   import _97._104;
   import _97._117;
   import egret.utils.FileUtil;
   import flash.filesystem.File;
   import flash.utils.ByteArray;
   
   public class _758
   {
      private static var _13952:int = 0;
      
      public function _758()
      {
         super();
      }
      
      public static function _5796(param1:_665) : void
      {
         var _loc2_:Object = _104.decode(FileUtil.openAsByteArray(param1.projectPath));
         HashObject._1844 = param1;
         param1._2824 = _5927(_loc2_.timeline);
         param1._1756 = _5924(_loc2_.dragonBones);
         param1._3286 = _5931(_loc2_.stage,param1._1756._2126);
         if(_loc2_.isNew)
         {
            param1.isNew = true;
         }
         if(_loc2_.currentArmatureName)
         {
            param1._2865 = param1._1756.dragonBonesVO._2107(_loc2_.currentArmatureName);
         }
         else if(Boolean(_loc2_._2865) && param1._2865 == null)
         {
            param1._2865 = HashObject._1663(_loc2_._2865) as _50;
         }
         if(param1._2865 == null && param1._1756._2126.length > 0)
         {
            param1._2865 = param1._1756._2126[0];
         }
         param1._1655 = _5925(_loc2_._1655);
         param1.libraryData = _5929(_loc2_.library,param1,_loc2_.libraryVitualFolderObj);
         param1._3536 = _5934(_loc2_._3536);
         param1._13344 = _loc2_._13344;
         if(_loc2_._14621)
         {
            param1._14621 = _loc2_._14621;
         }
      }
      
      public static function _5797(param1:_665) : Boolean
      {
         var _loc2_:Object = {};
         _loc2_.library = param1.libraryData._3284;
         _loc2_.libraryVitualFolderObj = _13949(param1.libraryData._13788);
         _loc2_._2865 = param1._2865.id;
         _loc2_.currentArmatureName = param1._2865.name;
         _loc2_.stage = _5930(param1._3286);
         _loc2_.timeline = _5928(param1._2824);
         _loc2_.dragonBones = _5923(param1._1756);
         _loc2_._3536 = _5932(param1._3536);
         _loc2_._13344 = param1._13344;
         _loc2_._10703 = param1._10703;
         _loc2_._14621 = param1._14621;
         return FileUtil.save(param1.projectPath,_104.encode(_loc2_));
      }
      
      private static function _5932(param1:Object) : Object
      {
         var _loc3_:String = null;
         var _loc4_:Array = null;
         var _loc5_:_647 = null;
         var _loc6_:_647 = null;
         var _loc2_:Object = {};
         if(param1)
         {
            for(_loc3_ in param1)
            {
               _loc4_ = [];
               if(param1[_loc3_])
               {
                  for each(_loc5_ in param1[_loc3_])
                  {
                     if(_loc5_ && _loc5_.visible && _loc5_.data)
                     {
                        (_loc6_ = new _647()).data = _loc5_.data.id;
                        _loc4_.push(_loc6_);
                     }
                  }
               }
               if(_loc4_.length)
               {
                  _loc2_[_loc3_] = _loc4_;
               }
            }
         }
         return _loc2_;
      }
      
      private static function _5934(param1:Object) : Object
      {
         var _loc3_:String = null;
         var _loc4_:Array = null;
         var _loc5_:Object = null;
         var _loc6_:_647 = null;
         var _loc2_:Object = {};
         for(_loc3_ in param1)
         {
            _loc4_ = [];
            for each(_loc5_ in param1[_loc3_])
            {
               (_loc6_ = new _647()).data = HashObject._1663(_loc5_.data);
               _loc4_.push(_loc6_);
            }
            if(_loc4_.length)
            {
               _loc2_[_loc3_] = _loc4_;
            }
         }
         return _loc2_;
      }
      
      public static function _4189(param1:_665) : void
      {
         var _loc3_:Object = null;
         if(param1 == null)
         {
            return;
         }
         var _loc2_:ByteArray = FileUtil.openAsByteArray(param1.projectPath);
         if(_loc2_)
         {
            _loc3_ = _104.decode(_loc2_);
            _loc3_.library = param1.libraryData._3284;
            FileUtil.save(param1.projectPath,_104.encode(_loc3_));
         }
      }
      
      public static function _5795(param1:_665, param2:_762, param3:_638, param4:Boolean = true) : Boolean
      {
         var _loc5_:Boolean = false;
         var _loc8_:String = null;
         var _loc9_:_11494 = null;
         var _loc10_:* = null;
         var _loc11_:String = null;
         var _loc12_:File = null;
         var _loc13_:File = null;
         var _loc14_:String = null;
         var _loc15_:Boolean = false;
         var _loc16_:Boolean = false;
         var _loc17_:String = null;
         var _loc18_:_363 = null;
         var _loc19_:_366 = null;
         var _loc20_:_11494 = null;
         var _loc21_:_10607 = null;
         var _loc6_:String = param1.projectPath;
         var _loc7_:String = param1.projectPath;
         param1.projectPath = param2.ouputPath + param2.projectName + ".dbproj";
         if(_5797(param1))
         {
            param1.projectPath = _loc7_;
            _loc8_ = param1.projectPath.replace(/(\/)/g,"_").replace(":","").replace(".","");
            if(_117._10678.hasOwnProperty(_loc8_))
            {
               _loc10_ = param2.ouputPath + param2.projectName + ".dbproj";
               _loc11_ = _loc10_.replace(/(\/)/g,"_").replace(":","").replace(".","");
               _117._10677(_loc11_,_117._10678[_loc8_]);
            }
            if(param2._5603)
            {
               _loc12_ = new File(param1.projectPath);
               _loc13_ = new File(param2.ouputPath + param2.projectName + ".dbproj");
               if(_loc12_.parent && _loc13_.parent && param1 && param1.libraryData && Boolean(param1.libraryData._5850))
               {
                  for(_loc17_ in param1.libraryData._3284)
                  {
                     _loc14_ = param1.libraryData._3284[_loc17_];
                     _loc15_ = FileUtil.copyTo(_loc12_.parent.resolvePath(_loc14_).nativePath,_loc13_.parent.resolvePath(_loc14_).nativePath,true);
                     if(!_loc15_)
                     {
                        _loc16_ = true;
                        _loc14_ = "library/";
                        param1.libraryData._3284[_loc17_] = _loc14_;
                        _loc15_ = FileUtil.copyTo(_loc12_.parent.resolvePath(_loc14_).nativePath,_loc13_.parent.resolvePath(_loc14_).nativePath,true);
                     }
                  }
                  if(_loc16_)
                  {
                     _5797(param1);
                  }
               }
            }
            (_loc9_ = new _11494()).direct = true;
            _loc9_._1572(param1.projectPath);
            _loc9_.execute();
            if(!param2._10705)
            {
               if(Boolean(param3) && Boolean(param3._11562(param2.ouputPath + param2.projectName + ".dbproj")))
               {
                  (_loc20_ = new _11494()).direct = true;
                  _loc20_._1572(param2.ouputPath + param2.projectName + ".dbproj");
                  _loc20_.execute();
               }
               _loc18_ = new _363();
               _loc18_._1572(param2.ouputPath + param2.projectName + ".dbproj");
               _loc18_.execute();
               _loc19_ = new _366();
               _loc19_._1572(param2.ouputPath + param2.projectName + ".dbproj");
               _loc19_.execute();
            }
            if(param4)
            {
               _loc21_ = new _10607();
               _loc21_._1572(param2.ouputPath + param2.projectName + ".dbproj");
               _loc21_.execute();
            }
            return true;
         }
         return false;
      }
      
      private static function _5931(param1:Object, param2:Vector.<_50>) : _760
      {
         return !!param1 ? _760._1630(param1,param2) : _760._5935();
      }
      
      private static function _5930(param1:_760) : Object
      {
         return _760._1629(param1);
      }
      
      private static function _5927(param1:Object) : _761
      {
         return !!param1 ? _761._1630(param1) : new _761();
      }
      
      private static function _5928(param1:_761) : Object
      {
         return _761._1629(param1);
      }
      
      private static function _5924(param1:Object) : _756
      {
         var _loc6_:Vector.<_50> = null;
         var _loc7_:_50 = null;
         var _loc8_:Object = null;
         var _loc2_:String = "";
         var _loc3_:String = param1.version;
         var _loc4_:Number = Number(param1.frameRate);
         var _loc5_:Array = param1.armature;
         if(_loc3_ != "5.5")
         {
            _13488._13604(param1);
         }
         if(_loc5_.length > 0)
         {
            _loc6_ = new Vector.<_50>();
            for each(_loc8_ in _loc5_)
            {
               _loc7_ = _13488._1736(_loc8_,_loc4_,true);
               _loc6_.push(_loc7_);
            }
         }
         _34._11273(_loc3_,_loc6_);
         if(Number(_loc3_) < Number(_101.DATA_VERSION_5_0))
         {
            _loc3_ = _101.DATA_VERSION_5_0;
         }
         return _756._1572(_loc2_,_loc3_,_loc4_,_loc6_);
      }
      
      private static function _5923(param1:_756) : Object
      {
         var _loc4_:_50 = null;
         var _loc5_:Object = null;
         var _loc2_:Object = {};
         var _loc3_:String = "5.5";
         _loc2_.version = _loc3_;
         _loc2_.frameRate = param1.frameRate;
         _loc2_.armature = [];
         for each(_loc4_ in param1._2126)
         {
            _loc5_ = {};
            _13488._2684(_loc4_,_loc5_,true,_loc3_);
            _loc2_.armature.push(_loc5_);
         }
         return _loc2_;
      }
      
      private static function _13949(param1:Array) : Object
      {
         var _loc3_:_13550 = null;
         var _loc4_:Object = null;
         _13951(param1);
         var _loc2_:Object = {};
         _loc2_.libraryVitualFolderVOList = [];
         for each(_loc3_ in param1)
         {
            (_loc4_ = {}).name = _loc3_.name;
            _loc4_._13939 = _loc3_._13695.name;
            _loc4_._13751 = _loc3_._13751;
            _loc2_.libraryVitualFolderVOList.push(_loc4_);
         }
         return _loc2_;
      }
      
      private static function _13951(param1:Array) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            _13952 = 0;
            param1[_loc2_].treeDepth = _13950(param1[_loc2_]);
            _loc2_++;
         }
         param1.sortOn("treeDepth",Array.NUMERIC);
      }
      
      private static function _13950(param1:Object) : int
      {
         if(param1._13695 is _757)
         {
            _13952 += 1;
            return _13952;
         }
         if(param1._13695 is _13550)
         {
            _13952 += 1;
            _13950(param1._13695);
         }
         return _13952;
      }
      
      private static function _13948(param1:Object) : Array
      {
         var _loc5_:_13550 = null;
         if(!param1)
         {
            return null;
         }
         var _loc2_:Array = [];
         var _loc3_:Array = param1.libraryVitualFolderVOList;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_.length)
         {
            param1 = _loc3_[_loc4_];
            (_loc5_ = new _13550(param1.name))._13939 = param1._13939;
            _loc5_._13751 = param1._13751;
            _loc5_.name = param1.name;
            _loc2_.push(_loc5_);
            _loc4_++;
         }
         return _loc2_;
      }
      
      private static function _5925(param1:Object) : _21
      {
         return !!param1 ? _21._1630(param1) : new _21();
      }
      
      private static function _5926(param1:_21) : Object
      {
         return _21._1629(param1);
      }
      
      private static function _5929(param1:Object, param2:_665, param3:Object) : _757
      {
         var _loc4_:String = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         if(!_5933(param1,param2))
         {
            param1 = {};
            _loc5_ = 0;
            _loc6_ = int(param2._1756._2126.length);
            while(_loc5_ < _loc6_)
            {
               _loc4_ = param2._1756._2126[_loc5_].name;
               param1[_loc4_] = "library/";
               _loc5_++;
            }
         }
         return new _757(param1,param2.projectPath,_13948(param3));
      }
      
      private static function _5933(param1:Object, param2:_665) : Boolean
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:String = null;
         if(param1 == null || param1 is Array)
         {
            return false;
         }
         if(param2 && param2._1756 && Boolean(param2._1756._2126))
         {
            _loc3_ = 0;
            _loc4_ = int(param2._1756._2126.length);
            while(_loc3_ < _loc4_)
            {
               _loc5_ = param2._1756._2126[_loc3_].name;
               if(param1[_loc5_] == null)
               {
                  return false;
               }
               _loc3_++;
            }
         }
         return true;
      }
      
      public static function _10698() : void
      {
         var file:File = null;
         try
         {
            file = File.applicationStorageDirectory.resolvePath(_638.NEW_PRJECT_CACHE_FOLDER);
            if(Boolean(file) && Boolean(file.isDirectory))
            {
               file.deleteDirectory(true);
            }
         }
         catch(e:Error)
         {
         }
      }
   }
}

