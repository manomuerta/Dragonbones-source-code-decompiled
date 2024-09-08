package _521
{
   import _120._121;
   import _120._123;
   import _12444.CopyImageFileTask;
   import _12444.CopyTextureFileTask;
   import _13503._13502;
   import _13505._13504;
   import _13505._13507;
   import _13505._13508;
   import _1404._1407;
   import _14101._14103;
   import _14101._14104;
   import _214._14051;
   import _214._213;
   import _24.Shortcut;
   import _24._26;
   import _470._469;
   import _51._50;
   import _51._52;
   import _51._69;
   import _51._70;
   import _51._79;
   import _555.LibraryPanelController;
   import _573.TimelinePanelController;
   import _692._696;
   import _708._715;
   import _708._717;
   import _73._74;
   import _783.CommandNotification;
   import _783.MenuNotification;
   import _783.TipNotification;
   import _93._94;
   import _97._101;
   import _97._124;
   import egret.utils.FileUtil;
   import egret.utils.tr;
   import flash.display.BlendMode;
   import flash.utils.Dictionary;
   
   public class _12460 extends _94
   {
      private var _12605:Object;
      
      private var _12610:_52;
      
      public function _12460()
      {
         super();
      }
      
      override protected function _1576() : void
      {
         super._1576();
         _1565(MenuNotification.PASTE_BONE,this.onPaste);
         _1565(MenuNotification.COPY_SLOT,this._12613);
         _1565(MenuNotification.COPY_DISPLAY,this._12613);
         _1565(MenuNotification.PASTE_SLOT,this.onPaste);
         _1565(MenuNotification.PASTE_DISPLAY,this.onPaste);
         _1565(MenuNotification.SELECTIVE_PASTE,this._14506);
         _1565(MenuNotification.COPY_SLOT_PROPERTY,this._14505);
         _1565(MenuNotification.PASTE_SLOT_PROPERTY,this._14504);
         Shortcut._1681(stage,_26.PASTE,this._12600);
         Shortcut._1681(stage,_26.COPY,this._12604);
      }
      
      override protected function dispose() : void
      {
         _1564(MenuNotification.PASTE_BONE,this.onPaste);
         _1564(MenuNotification.COPY_SLOT,this._12613);
         _1564(MenuNotification.COPY_DISPLAY,this._12613);
         _1564(MenuNotification.PASTE_SLOT,this.onPaste);
         _1564(MenuNotification.PASTE_DISPLAY,this.onPaste);
         Shortcut._1673(stage,_26.PASTE,this._12600);
         Shortcut._1673(stage,_26.COPY,this._12604);
         super.dispose();
      }
      
      private function _12600() : void
      {
         var _loc1_:String = null;
         if(this._2852._12614())
         {
            return;
         }
         if(_213.type != _213.TYPE_SLOT_PROPERTY && _2226._2889.length != 1)
         {
            if(_2226._2889.length > 1)
            {
               _loc1_ = tr("Tip-pleaseSelectOneItem");
            }
            else if(_2226._2889.length == 0)
            {
               _loc1_ = tr("Tip-noItemSelected");
            }
            this._3351(_loc1_);
            return;
         }
         if(_213.type == _213.TYPE_SLOT_PROPERTY && _2226._2889.length == 0)
         {
            this._3351(tr("Tip-noItemSelected"));
            return;
         }
         if(_2226._2484 is _52)
         {
            this.onPaste(null);
         }
         else if(_2226._2484 is _79)
         {
            this.onPaste(null);
         }
         else if(_2226._2484 is _70)
         {
            this.onPaste(null);
         }
      }
      
      private function _3351(param1:String) : void
      {
         _1567(new TipNotification(TipNotification.SHOW_TOOL_TIP,{
            "type":_717.ANIMATE,
            "showText":param1
         }));
      }
      
      private function _12604() : void
      {
         if(_2226._2889.length != 1)
         {
            return;
         }
         if(this._2852._12614())
         {
            return;
         }
         if(_2226._2484 is _52)
         {
            this._12612();
         }
         else if(_2226._2484 is _79)
         {
            this._12613(null);
         }
         else if(_2226._2484 is _70)
         {
            this._12613(null);
         }
      }
      
      private function onPaste(param1:MenuNotification) : void
      {
         if(_2214._1844._2873 != _715.ARMATURE)
         {
            if(_213.type == _213.TYPE_BONE || _213.type == _213.TYPE_SLOT || _213.type == _213.TYPE_DISPLAY)
            {
               if(_2214._1844._2873 == _715.ANIMATE)
               {
                  this._3351(tr("Tip-canPasteInArmatureMode"));
               }
            }
            return;
         }
         if(this._2852._12614())
         {
            return;
         }
         switch(_213.type)
         {
            case _213.TYPE_BONE:
               this._12609(param1);
               break;
            case _213.TYPE_SLOT:
               this._12611(param1);
               break;
            case _213.TYPE_DISPLAY:
               this._12611(param1);
               break;
            case _213.TYPE_SLOT_PROPERTY:
               this._14504(param1);
         }
      }
      
      private function _14506(param1:MenuNotification) : void
      {
         var _loc2_:_14104 = new _14104();
         _loc2_.open();
      }
      
      public function selectivePaste(param1:uint) : void
      {
         switch(_213.type)
         {
            case _213.TYPE_BONE:
               this._12609(null,param1);
               break;
            case _213.TYPE_SLOT:
               this._12611(null,param1);
               break;
            case _213.TYPE_DISPLAY:
               this._12611(null,param1);
         }
      }
      
      private function _12603(param1:String, param2:String, param3:Boolean) : String
      {
         var _loc4_:String = param1 + param2;
         var _loc5_:String = FileUtil.getExtension(_loc4_);
         var _loc6_:int = _loc5_.length + 1;
         var _loc7_:String;
         var _loc8_:String = _loc7_ = _loc4_.substr(0,_loc4_.length - _loc6_);
         var _loc9_:int = 1;
         if(param3)
         {
            while(FileUtil.exists(_loc8_ + "." + _loc5_) || FileUtil.exists(_loc8_ + "." + "json"))
            {
               _loc8_ = _loc7_ + "_" + _loc9_;
               _loc9_++;
            }
         }
         else
         {
            while(FileUtil.exists(_loc8_ + "." + _loc5_))
            {
               _loc8_ = _loc7_ + "_" + _loc9_;
               _loc9_++;
            }
         }
         return _loc8_.substr(param1.length);
      }
      
      private function _12608(param1:String, param2:Vector.<String>, param3:Function) : void
      {
         var copyFilesList:Array;
         var sameImageNum:int;
         var sameTextureNum:int;
         var _2913:String;
         var i:int = 0;
         var len:int = 0;
         var taskQueue:_123 = null;
         var assetName:String = null;
         var assetExtension:String = null;
         var assetNameNoExtension:String = null;
         var nextAssetName:String = null;
         var nextAssetExtension:String = null;
         var nextAssetNameNoExtension:String = null;
         var newAssetName:String = null;
         var assetName2:String = null;
         var copyTexutreTask:CopyTextureFileTask = null;
         var copyImageTask:CopyImageFileTask = null;
         var _12521:String = param1;
         var _12523:Vector.<String> = param2;
         var callback:Function = param3;
         this._12605 = {};
         copyFilesList = [];
         sameImageNum = 0;
         sameTextureNum = 0;
         _2913 = FileUtil.escapePath(this._3678._3680());
         if(_2913 != _12521)
         {
            i = 0;
            len = int(_12523.length);
            for(; i < len; i++)
            {
               assetName = _12523[i];
               assetExtension = FileUtil.getExtension(assetName).toLowerCase();
               assetNameNoExtension = FileUtil.getFileName(assetName);
               if(i < len - 1)
               {
                  nextAssetName = _12523[i + 1];
                  nextAssetExtension = FileUtil.getExtension(nextAssetName).toLowerCase();
                  nextAssetNameNoExtension = FileUtil.getFileName(nextAssetName);
                  if(nextAssetNameNoExtension == assetNameNoExtension && (assetExtension == "json" || nextAssetExtension == "json"))
                  {
                     newAssetName = this._12603(_2913,assetName,true);
                     copyFilesList.push([_12523[i],_12523[i + 1]]);
                     i++;
                     if(newAssetName + "." + assetExtension != assetName)
                     {
                        this._12605[assetName] = newAssetName;
                        this._12605[nextAssetName] = newAssetName;
                        sameTextureNum++;
                     }
                     continue;
                  }
               }
               copyFilesList.push([_12523[i]]);
               newAssetName = this._12603(_2913,assetName,false);
               if(newAssetName + "." + assetExtension != assetName)
               {
                  this._12605[assetName] = newAssetName;
                  assetName2 = assetName.substr(0,assetName.length - assetExtension.length - 1);
                  this._12605[assetName2] = newAssetName;
                  sameImageNum++;
               }
            }
            taskQueue = new _123();
            CopyTextureFileTask.num = sameTextureNum;
            CopyImageFileTask.num = sameImageNum;
            CopyTextureFileTask.type = CopyTextureFileTask.TYPE_CUSTOME;
            CopyImageFileTask.type = CopyImageFileTask.TYPE_CUSTOME;
            i = 0;
            len = int(copyFilesList.length);
            while(i < len)
            {
               if(copyFilesList[i].length == 2)
               {
                  copyTexutreTask = new CopyTextureFileTask([_12521 + copyFilesList[i][0],_12521 + copyFilesList[i][1]],[_2913 + copyFilesList[i][0],_2913 + copyFilesList[i][1]],this._12605);
                  taskQueue._2389(copyTexutreTask);
               }
               else
               {
                  copyImageTask = new CopyImageFileTask(_12521 + copyFilesList[i][0],_2913 + copyFilesList[i][0],this._12605);
                  taskQueue._2389(copyImageTask);
               }
               i++;
            }
            taskQueue.addEventListener(_121.COMPLETE,function(param1:_121):void
            {
               if(_12523.length > 0)
               {
                  _2861._4188();
               }
               if(callback != null)
               {
                  callback();
               }
            });
            taskQueue.run();
         }
         else if(callback != null)
         {
            callback();
         }
      }
      
      private function _12607(param1:_52, param2:uint) : void
      {
         var _loc3_:_52 = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:_50 = null;
         var _loc12_:_52 = null;
         var _loc14_:_79 = null;
         var _loc20_:Vector.<Object> = null;
         var _loc21_:Vector.<Object> = null;
         var _loc22_:Vector.<Object> = null;
         var _loc23_:_13502 = null;
         var _loc25_:String = null;
         var _loc26_:_79 = null;
         var _loc27_:Object = null;
         var _loc28_:Array = null;
         var _loc29_:_70 = null;
         var _loc30_:_70 = null;
         var _loc31_:Object = null;
         var _loc32_:String = null;
         var _loc33_:Object = null;
         var _loc34_:Array = null;
         var _loc35_:int = 0;
         var _loc36_:Array = null;
         var _loc37_:_52 = null;
         var _loc38_:int = 0;
         var _loc39_:Object = null;
         _loc8_ = param1.rootArmatureData;
         _loc3_ = _213.bone._12520.clone();
         var _loc9_:Vector.<_52> = new Vector.<_52>();
         if(_14103._14395(param2,_14103.CHILD_BONE))
         {
            _loc9_ = _loc9_.concat(_loc3_._2021());
         }
         _loc9_.push(_loc3_);
         var _loc10_:Dictionary = new Dictionary();
         var _loc11_:Vector.<_52> = new Vector.<_52>();
         if(_14103._14395(param2,_14103.CHILD_BONE))
         {
            _loc11_ = _loc11_.concat(_213.bone._12520._2021());
         }
         _loc11_.push(_213.bone._12520);
         _loc4_ = 0;
         _loc5_ = int(_loc11_.length);
         while(_loc4_ < _loc5_)
         {
            if(_loc11_[_loc4_].name == _loc9_[_loc4_].name)
            {
               _loc10_[_loc11_[_loc4_]] = _loc9_[_loc4_];
            }
            _loc4_++;
         }
         _loc4_ = 0;
         _loc5_ = int(_loc9_.length);
         while(_loc4_ < _loc5_)
         {
            _loc12_ = _loc9_[_loc4_];
            _loc25_ = _124._1747(_loc12_.name,_loc8_._1793);
            if(_loc25_ != _loc12_.name)
            {
               _loc12_.name = _loc25_;
            }
            _loc4_++;
         }
         var _loc13_:Vector.<_79> = _213.bone._12522;
         var _loc15_:Vector.<Object> = new Vector.<Object>();
         var _loc16_:Vector.<Object> = new Vector.<Object>();
         var _loc17_:String = _loc8_._1795.name;
         var _loc18_:Dictionary = new Dictionary();
         var _loc19_:Dictionary = new Dictionary();
         if(_14103._14395(param2,_14103.SLOT))
         {
            _loc4_ = 0;
            _loc5_ = int(_loc13_.length);
            while(_loc4_ < _loc5_)
            {
               _loc14_ = _loc13_[_loc4_];
               (_loc26_ = new _79()).name = _124._1747(_loc14_.name,_loc8_._1996);
               _loc26_.parentBoneData = _loc10_[_loc14_.parentBoneData];
               _loc26_.blendMode = _loc14_.blendMode;
               _loc26_.onlyBoundingBox = _loc14_.onlyBoundingBox;
               _loc26_._2152 = _loc14_._1926.clone();
               if(_loc26_.parentBoneData != null)
               {
                  _loc18_[_loc14_] = _loc26_;
                  _loc27_ = _469._2897(_loc26_,_loc26_.parentBoneData);
                  _loc15_.push(_loc27_);
                  _loc28_ = [];
                  if(_14103._14395(param2,_14103.DISPLAY))
                  {
                     _loc6_ = 0;
                     _loc7_ = int(_loc14_._1715.length);
                     while(_loc6_ < _loc7_)
                     {
                        _loc29_ = _loc14_._1765[_loc14_._1715[_loc6_]];
                        if(_loc29_)
                        {
                           _loc30_ = _loc29_._14298(_loc14_.parentBoneData.rootArmatureData);
                           _loc19_[_loc29_] = _loc30_;
                           if(_loc30_.type == _74.BOUNDINGBOX && Boolean(_loc30_._11278))
                           {
                              _loc32_ = _124._1747(_loc30_._11278.name,_loc8_._11282);
                              _loc30_._11278.name = _loc32_;
                              _loc30_._11284();
                           }
                           this._14500(param2,_loc30_);
                           this._12595(_loc30_,this._12605);
                           if(_loc30_._2165 && _loc30_.mesh && Boolean(_loc30_.mesh._1831))
                           {
                              _loc33_ = _loc30_.mesh._1831;
                              _loc34_ = _loc33_[_101.BONE];
                              _loc35_ = 0;
                              _loc35_ = 0;
                              while(_loc35_ < _loc34_.length)
                              {
                                 if(_loc34_[_loc35_] is String)
                                 {
                                    _loc37_ = this._15576(_loc34_[_loc35_],_loc11_);
                                    _loc38_ = -1;
                                    if(Boolean(_loc37_) && Boolean(_loc10_[_loc37_]))
                                    {
                                       _loc34_[_loc35_] = (_loc10_[_loc37_] as _52).name;
                                    }
                                 }
                                 _loc35_++;
                              }
                              _loc36_ = _loc33_[_101.A_BONE_POSE];
                              _loc35_ = 0;
                              while(_loc35_ < _loc36_.length)
                              {
                                 _loc39_ = _loc36_[_loc35_];
                                 _loc37_ = this._15576(_loc39_.bone,_loc11_);
                                 if((Boolean(_loc37_)) && Boolean(_loc10_[_loc37_]))
                                 {
                                    _loc39_.bone = (_loc10_[_loc37_] as _52).name;
                                 }
                                 _loc35_++;
                              }
                           }
                           _loc30_._1985 = _loc8_._1755;
                           this._2106._3808(_loc8_.name,_loc30_);
                           _loc31_ = _469._2895(_loc30_,_loc17_,_loc26_,null,_loc14_._1711 == _loc14_._1715[_loc6_]);
                           _loc28_.push(_loc31_);
                        }
                        _loc6_++;
                     }
                  }
                  if(_loc28_.length > 0)
                  {
                     _loc16_.push(_loc28_);
                  }
               }
               _loc4_++;
            }
         }
         if(_14103._14395(param2,_14103.KEYFRAMES))
         {
            _loc20_ = this._14501(_loc8_,_loc10_);
            _loc21_ = this._14502(_213.bone._14376,_loc8_,_loc18_);
            _loc22_ = this._14497(_213.bone._14378,_loc8_,_loc19_);
         }
         var _loc24_:Object;
         (_loc24_ = {})._2890 = param1;
         _loc24_._12539 = _loc3_;
         _loc24_._1886 = _loc8_;
         _loc24_.addSlots = _loc15_;
         _loc24_.addDisplays = _loc16_;
         _loc24_.pasteBoneTimeLineData = _loc20_;
         _loc24_.pasteSlotTimeLineData = _loc21_;
         _loc24_.pasteFFDTimeLineData = _loc22_;
         _loc24_.flag = param2;
         _1567(new CommandNotification(CommandNotification.PASTE_BONE,_loc24_));
         this._12610 = null;
      }
      
      private function _15576(param1:String, param2:Vector.<_52>) : _52
      {
         var _loc3_:int = 0;
         while(_loc3_ < param2.length)
         {
            if(param2[_loc3_].name == param1)
            {
               return param2[_loc3_];
            }
            _loc3_++;
         }
         return null;
      }
      
      private function _14501(param1:_50, param2:Dictionary) : Vector.<Object>
      {
         var _loc5_:_13502 = null;
         var _loc6_:int = 0;
         var _loc7_:String = null;
         var _loc8_:Array = null;
         var _loc9_:_13504 = null;
         var _loc10_:_13504 = null;
         var _loc11_:Object = null;
         var _loc3_:Vector.<Object> = new Vector.<Object>();
         var _loc4_:Dictionary = _213.bone._14377;
         for(_loc7_ in _loc4_)
         {
            _loc8_ = _loc4_[_loc7_];
            _loc5_ = param1._13656(_loc7_);
            _loc6_ = 0;
            while(_loc6_ < _loc8_.length)
            {
               _loc9_ = _loc8_[_loc6_] as _13504;
               (_loc10_ = _loc9_.clone() as _13504)._1823 = param2[_loc9_._1823];
               if(_loc10_._1823 != null && Boolean(_loc5_))
               {
                  _loc11_ = _469._14443(_loc5_,_loc10_);
                  _loc3_.push(_loc11_);
               }
               _loc6_++;
            }
         }
         return _loc3_;
      }
      
      private function _14502(param1:Dictionary, param2:_50, param3:Dictionary) : Vector.<Object>
      {
         var _loc5_:_13502 = null;
         var _loc6_:int = 0;
         var _loc7_:String = null;
         var _loc8_:Array = null;
         var _loc9_:_13508 = null;
         var _loc10_:_13508 = null;
         var _loc11_:Object = null;
         var _loc4_:Vector.<Object> = new Vector.<Object>();
         for(_loc7_ in param1)
         {
            _loc8_ = param1[_loc7_];
            _loc5_ = param2._13656(_loc7_);
            _loc6_ = 0;
            while(_loc6_ < _loc8_.length)
            {
               _loc9_ = _loc8_[_loc6_] as _13508;
               (_loc10_ = _loc9_.clone() as _13508)._1824 = param3[_loc9_._1824];
               if(_loc10_._1824 != null && Boolean(_loc5_))
               {
                  _loc11_ = _469._14442(_loc5_,_loc10_);
                  _loc4_.push(_loc11_);
               }
               _loc6_++;
            }
         }
         return _loc4_;
      }
      
      private function _14497(param1:Dictionary, param2:_50, param3:Dictionary) : Vector.<Object>
      {
         var _loc5_:_13502 = null;
         var _loc6_:int = 0;
         var _loc7_:String = null;
         var _loc8_:Array = null;
         var _loc9_:_13507 = null;
         var _loc10_:_13507 = null;
         var _loc11_:Object = null;
         var _loc4_:Vector.<Object> = new Vector.<Object>();
         for(_loc7_ in param1)
         {
            _loc8_ = param1[_loc7_];
            _loc5_ = param2._13656(_loc7_);
            _loc6_ = 0;
            while(_loc6_ < _loc8_.length)
            {
               _loc9_ = _loc8_[_loc6_] as _13507;
               (_loc10_ = _loc9_.clone() as _13507)._1826 = param3[_loc9_._1826];
               if(_loc10_._1826 != null && Boolean(_loc5_))
               {
                  _loc11_ = _469._14441(_loc5_,_loc10_);
                  _loc4_.push(_loc11_);
               }
               _loc6_++;
            }
         }
         return _loc4_;
      }
      
      private function _12609(param1:MenuNotification = null, param2:uint = 63) : void
      {
         var _1836:_52 = null;
         var _1886:_50 = null;
         var e:MenuNotification = param1;
         var flag:uint = param2;
         if(_213.type == _213.TYPE_BONE)
         {
            _1836 = _2226._2484 as _52;
            this._12610 = _1836;
            if(_1836 == null)
            {
               this._3351(tr("Tip-pleaseSelectOneBone"));
               return;
            }
            _1886 = _1836.rootArmatureData;
            if(_1886 == null || this._2861 == null || this._2861._3678 == null)
            {
               return;
            }
            if(_213.bone._12523.length > 0)
            {
               this._12608(_213.bone._12521,_213.bone._12523,function():void
               {
                  _12607(_12610,flag);
               });
            }
            else
            {
               this._12607(this._12610,flag);
            }
         }
      }
      
      private function _12595(param1:_70, param2:Object) : void
      {
         var _loc3_:String = null;
         var _loc4_:String = null;
         if(param1.type == _74.IMAGE || param1.type == _74.MESH)
         {
            if(param1.path.indexOf("@") != -1)
            {
               _loc3_ = param1.textureName;
               if(param2)
               {
                  _loc4_ = param2[_loc3_ + ".json"];
                  if(_loc4_ != null)
                  {
                     param1.changePath(_loc4_ + "@" + param1._1814);
                  }
               }
            }
            else
            {
               _loc3_ = param1.path;
               if(param2)
               {
                  _loc4_ = param2[_loc3_];
                  if(_loc4_ != null)
                  {
                     param1.changePath(_loc4_);
                  }
               }
            }
         }
      }
      
      private function _14505(param1:MenuNotification) : void
      {
         var _loc2_:Object = null;
         if(_2226._2889.length == 1)
         {
            if(_2226._2484 is _79)
            {
               _loc2_ = {};
               _loc2_._1837 = _2226._2484 as _79;
               _1567(new CommandNotification(CommandNotification.COPY_SLOT_PROPERTY,_loc2_));
            }
         }
      }
      
      private function _14504(param1:MenuNotification) : void
      {
         var _loc5_:_79 = null;
         var _loc8_:Object = null;
         var _loc12_:int = 0;
         var _loc13_:Array = null;
         if(!_2226._14509())
         {
            this._3351(tr("Tip-pleaseSelectSlot"));
            return;
         }
         var _loc2_:Array = _2226._3863;
         var _loc3_:_14051 = _213._14375;
         var _loc4_:int = int(_loc2_.length);
         var _loc6_:Object;
         (_loc6_ = new Object())._13352 = _loc2_;
         _loc6_._10564 = _loc3_._14390;
         var _loc7_:Dictionary = new Dictionary();
         var _loc9_:_69 = _loc3_._14388;
         var _loc10_:int = 0;
         while(_loc10_ < _loc4_)
         {
            _loc5_ = _loc2_[_loc10_];
            (_loc8_ = new Object()).newColor = _loc3_._14389.clone();
            _loc8_._3007 = _loc5_._1926;
            _loc8_._10563 = !!_loc5_.blendMode ? _loc5_.blendMode : BlendMode.NORMAL;
            _loc12_ = _loc9_ == null ? -1 : _loc9_.displayIndex;
            _loc13_ = _loc5_._1715;
            if(_loc12_ < 0 || _loc13_.length == 0)
            {
               _loc8_._3013 = null;
            }
            else if(_loc12_ >= 0)
            {
               if(_loc12_ <= _loc13_.length - 1)
               {
                  _loc8_._3013 = _loc5_._13232(_loc12_);
               }
               else
               {
                  _loc8_._3013 = _loc5_._13232(0);
               }
            }
            _loc7_[_loc5_.name] = _loc8_;
            _loc10_++;
         }
         _loc6_.slotProDic = _loc7_;
         var _loc11_:String = CommandNotification.PASTE_SLOT_PROPERTY;
         _1567(new CommandNotification(_loc11_,_loc6_));
      }
      
      private function _12612() : void
      {
         var _loc2_:Object = null;
         var _loc1_:_52 = _2226._2484 as _52;
         if(Boolean(_loc1_) && Boolean(_loc1_.rootArmatureData))
         {
            if(this._2861._3678)
            {
               _loc2_ = {};
               _loc2_._1836 = _loc1_;
               _loc2_.libraryPath = this._2861._3678._3680();
               _1567(new CommandNotification(CommandNotification.COPY_BONE,_loc2_));
            }
         }
      }
      
      private function _12613(param1:MenuNotification) : void
      {
         var _loc2_:Object = null;
         var _loc3_:_70 = null;
         if(_2226._2889.length == 1)
         {
            if(this._2861._3678)
            {
               if(_2226._2484 is _79)
               {
                  _loc2_ = {};
                  _loc2_._1837 = _2226._2484 as _79;
                  _loc2_.libraryPath = this._2861._3678._3680();
                  _1567(new CommandNotification(CommandNotification.COPY_SLOT,_loc2_));
               }
               else if(_2226._2484 is _70)
               {
                  _loc3_ = _2226._2484 as _70;
                  if(_loc3_.type == _74.ARMATURE)
                  {
                     return;
                  }
                  _loc2_ = {};
                  _loc2_.displayVO = _loc3_;
                  _loc2_.libraryPath = this._2861._3678._3680();
                  _1567(new CommandNotification(CommandNotification.COPY_DISPLAY,_loc2_));
               }
            }
         }
      }
      
      private function _12611(param1:MenuNotification = null, param2:uint = 63) : void
      {
         var _1836:_52 = null;
         var _1886:_50 = null;
         var _1837:_79 = null;
         var displayName:String = null;
         var e:MenuNotification = param1;
         var flag:uint = param2;
         if(_2226._2889.length != 1)
         {
            return;
         }
         if(_213.type == _213.TYPE_SLOT)
         {
            if(!(_2226._2484 is _52))
            {
               this._3351(tr("Tip-pleaseSelectOneBone"));
               return;
            }
            _1836 = _2226._2484 as _52;
            this._12610 = _1836;
            if(_1836 == null)
            {
               return;
            }
            _1886 = _1836.rootArmatureData;
            if(_1886 == null || this._2861 == null || this._2861._3678 == null)
            {
               return;
            }
            if(_213.slot._12523.length > 0)
            {
               this._12608(_213.slot._12521,_213.slot._12523,function():void
               {
                  _12606(_12610,flag);
               });
            }
            else
            {
               this._12606(this._12610,flag);
            }
         }
         else if(_213.type == _213.TYPE_DISPLAY)
         {
            if(_2226._2484 is _52)
            {
               _1836 = _2226._2484 as _52;
               if(_1836 == null)
               {
                  return;
               }
               _1886 = _1836.rootArmatureData;
               if(_1886 == null || this._2861 == null || this._2861._3678 == null)
               {
                  return;
               }
            }
            else
            {
               if(!(_2226._2484 is _79))
               {
                  this._3351(tr("Tip-pleaseselectboneorslot"));
                  return;
               }
               _1837 = _2226._2484 as _79;
               _1836 = _1837.parentBoneData;
               if(_1836 == null)
               {
                  return;
               }
               _1886 = _1836.rootArmatureData;
               if(_1886 == null || this._2861 == null || this._2861._3678 == null)
               {
                  return;
               }
               if(_1837._11287 && _213.display._12525.type != _74.BOUNDINGBOX)
               {
                  this._3351(tr("Tip-imageCanInsertBoundingBoxSlot"));
                  return;
               }
               displayName = _213.display._12525.name;
            }
            if(_213.display._12523.length > 0)
            {
               this._12608(_213.display._12521,_213.display._12523,function():void
               {
                  _12599(flag);
               });
            }
            else
            {
               this._12599(flag);
            }
         }
      }
      
      private function _14507(param1:MenuNotification = null, param2:uint = 63) : void
      {
      }
      
      private function _12606(param1:_52, param2:uint) : void
      {
         var _loc3_:_52 = null;
         var _loc4_:_79 = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:_50 = null;
         var _loc20_:_13502 = null;
         var _loc21_:Vector.<Object> = null;
         var _loc23_:_70 = null;
         var _loc24_:_70 = null;
         var _loc25_:Object = null;
         var _loc26_:String = null;
         var _loc27_:String = null;
         var _loc28_:_13508 = null;
         var _loc29_:_13508 = null;
         var _loc30_:Object = null;
         _loc9_ = param1.rootArmatureData;
         _loc3_ = param1;
         var _loc10_:_79 = _213.slot._12519;
         var _loc11_:Vector.<Object> = new Vector.<Object>();
         var _loc12_:Vector.<Object> = new Vector.<Object>();
         var _loc13_:String = _loc9_._1795.name;
         var _loc14_:_79;
         (_loc14_ = new _79()).name = _124._1747(_loc10_.name,_loc9_._1996);
         _loc14_.parentBoneData = _loc3_;
         _loc14_.blendMode = _loc10_.blendMode;
         _loc14_.onlyBoundingBox = _loc10_.onlyBoundingBox;
         _loc14_._2152 = _loc10_._1926.clone();
         var _loc15_:Object = _469._2897(_loc14_,_loc14_.parentBoneData);
         _loc11_.push(_loc15_);
         var _loc16_:Dictionary = new Dictionary();
         var _loc17_:Array = [];
         if(_14103._14395(param2,_14103.DISPLAY))
         {
            _loc7_ = 0;
            _loc8_ = int(_loc10_._1715.length);
            while(_loc7_ < _loc8_)
            {
               _loc23_ = _loc10_._1765[_loc10_._1715[_loc7_]];
               if(_loc23_)
               {
                  _loc24_ = _loc23_._14298(_loc10_.parentBoneData.rootArmatureData);
                  _loc16_[_loc23_] = _loc24_;
                  if(_loc24_.type == _74.BOUNDINGBOX && Boolean(_loc24_._11278))
                  {
                     _loc26_ = _124._1747(_loc24_._11278.name,_loc9_._11282);
                     _loc24_._11278.name = _loc26_;
                     _loc24_._11284();
                  }
                  this._14500(param2,_loc24_);
                  this._12595(_loc24_,this._12605);
                  _loc24_._1985 = _loc9_._1755;
                  this._2106._3808(_loc9_.name,_loc24_);
                  _loc25_ = _469._2895(_loc24_,_loc13_,_loc14_,null,_loc10_._1711 == _loc10_._1715[_loc7_]);
                  _loc17_.push(_loc25_);
               }
               _loc7_++;
            }
         }
         if(_loc17_.length > 0)
         {
            _loc12_.push(_loc17_);
         }
         var _loc18_:Dictionary = _213.slot._14376;
         var _loc19_:Vector.<Object> = new Vector.<Object>();
         if(_14103._14395(param2,_14103.KEYFRAMES))
         {
            for(_loc27_ in _loc18_)
            {
               _loc20_ = _loc9_._13656(_loc27_);
               _loc28_ = _loc18_[_loc27_];
               (_loc29_ = _loc28_.clone() as _13508)._1824 = _loc14_;
               if(_loc20_)
               {
                  _loc30_ = _469._14442(_loc20_,_loc29_);
                  _loc19_.push(_loc30_);
               }
            }
            _loc21_ = this._14497(_213.slot._14378,_loc9_,_loc16_);
         }
         var _loc22_:Object;
         (_loc22_ = {})._2890 = param1;
         _loc22_._1886 = _loc9_;
         _loc22_.addSlots = _loc11_;
         _loc22_.addDisplays = _loc12_;
         _loc22_.pasteSlotTimeLineData = _loc19_;
         _loc22_.pasteFFDTimeLineData = _loc21_;
         _loc22_.flag = param2;
         _1567(new CommandNotification(CommandNotification.PASTE_SLOT,_loc22_));
         this._12610 = null;
      }
      
      private function _14500(param1:uint, param2:_70) : void
      {
         if(param2._2165 == false)
         {
            return;
         }
         if(_14103._14395(param1,_14103.WEIGHT) == false)
         {
            param2.mesh.meshRig = null;
            param2.mesh._1831 = null;
         }
         if(_14103._14395(param1,_14103.MESH) == false)
         {
            param2.mesh = null;
            param2.type = _74.IMAGE;
         }
      }
      
      private function _12599(param1:uint) : void
      {
         var _loc2_:Object = null;
         var _loc3_:_52 = null;
         var _loc4_:_50 = null;
         var _loc5_:Vector.<Object> = null;
         var _loc6_:_52 = null;
         var _loc7_:_70 = null;
         var _loc8_:String = null;
         var _loc9_:_79 = null;
         var _loc10_:Object = null;
         var _loc11_:Object = null;
         var _loc12_:String = null;
         var _loc13_:String = null;
         if(_2226._2484 is _52)
         {
            _loc6_ = _2226._2484 as _52;
            _loc7_ = _213.display._12525._14298(_loc6_.rootArmatureData);
            this._14500(param1,_loc7_);
            _loc3_ = _2226._2484 as _52;
            if(_loc3_ == null)
            {
               return;
            }
            _loc4_ = _loc3_.rootArmatureData;
            _loc8_ = _124._1747(_loc7_._2120,_loc4_._1996);
            _loc9_ = _79._1729(_loc8_,_loc3_);
            this._12595(_loc7_,this._12605);
            _loc7_._1985 = _loc4_._1755;
            this._2106._3808(_loc4_.name,_loc7_);
            if(_14103._14395(param1,_14103.KEYFRAMES))
            {
               _loc5_ = this._14496(_loc7_,_loc4_);
            }
            _loc2_ = _469._3482(_loc7_,_loc4_._1795.name,_loc9_,_loc3_,null);
            _loc2_._14391 = true;
            _loc10_ = {
               "_14397":_loc2_,
               "pasteFFDTimeLineData":_loc5_,
               "flag":param1,
               "_1886":_loc4_
            };
            _1567(new CommandNotification(CommandNotification.PASTE_DISPLAY_TO_BONE,_loc10_));
         }
         else if(_2226._2484 is _79)
         {
            _loc9_ = _2226._2484 as _79;
            if(_loc9_ == null)
            {
               return;
            }
            _loc3_ = _loc9_.parentBoneData;
            if(_loc3_ == null)
            {
               return;
            }
            _loc4_ = _loc3_.rootArmatureData;
            if(_loc4_ == null)
            {
               return;
            }
            _loc7_ = _213.display._12525._14298(_loc9_.rootArmatureData);
            if(_loc9_._2159(_loc7_._13230))
            {
               _loc12_ = _loc9_._13231(_loc7_._13230);
               _loc7_._13228 = _loc12_;
            }
            this._14500(param1,_loc7_);
            if(_loc7_.type != _74.BOUNDINGBOX)
            {
               if(_loc9_._11287)
               {
                  return;
               }
            }
            else if(_loc7_._11278)
            {
               _loc13_ = _124._1747(_loc7_._11278.name,_loc4_._11282);
               _loc7_._11278.name = _loc13_;
               _loc7_._11284();
            }
            this._12595(_loc7_,this._12605);
            _loc7_._1985 = _loc4_._1755;
            this._2106._3808(_loc4_.name,_loc7_);
            if(_14103._14395(param1,_14103.KEYFRAMES))
            {
               _loc5_ = this._14496(_loc7_,_loc4_);
            }
            _loc2_ = _469._2895(_loc7_,_loc4_._1795.name,_loc9_,null);
            _loc11_ = {
               "_14400":_loc2_,
               "pasteFFDTimeLineData":_loc5_,
               "flag":param1,
               "_1886":_loc4_
            };
            _1567(new CommandNotification(CommandNotification.PASTE_DISPLAY_TO_SLOT,_loc11_));
         }
      }
      
      private function _14496(param1:_70, param2:_50) : Vector.<Object>
      {
         var _loc5_:_13502 = null;
         var _loc6_:int = 0;
         var _loc7_:String = null;
         var _loc8_:Array = null;
         var _loc9_:_13507 = null;
         var _loc10_:_13507 = null;
         var _loc11_:Object = null;
         var _loc3_:Dictionary = _213.display._14378;
         var _loc4_:Vector.<Object> = new Vector.<Object>();
         for(_loc7_ in _loc3_)
         {
            _loc8_ = _loc3_[_loc7_];
            _loc5_ = param2._13656(_loc7_);
            _loc6_ = 0;
            while(_loc6_ < _loc8_.length)
            {
               _loc9_ = _loc8_[_loc6_] as _13507;
               (_loc10_ = _loc9_.clone() as _13507)._1826 = param1;
               if(_loc10_._1826 != null && Boolean(_loc5_))
               {
                  _loc11_ = _469._14441(_loc5_,_loc10_);
                  _loc4_.push(_loc11_);
               }
               _loc6_++;
            }
         }
         return _loc4_;
      }
      
      public function _12602() : Boolean
      {
         if(_2226._2889.length == 1 && _2226._2889[0] is _52)
         {
            return true;
         }
         return false;
      }
      
      public function _12601() : Boolean
      {
         if(_2226._2889.length == 1 && _2226._2889[0] is _79)
         {
            return true;
         }
         return false;
      }
      
      public function _12596() : Boolean
      {
         if(_2226._2889.length == 1 && _2226._2889[0] is _70)
         {
            return true;
         }
         return false;
      }
      
      public function _12598() : Boolean
      {
         if(_213.type == _213.TYPE_BONE || _213.type == _213.TYPE_SLOT || _213.type == _213.TYPE_DISPLAY)
         {
            return this._12602() && _2220._2873 == _715.ARMATURE;
         }
         return false;
      }
      
      public function _12597() : Boolean
      {
         if(_213.type == _213.TYPE_DISPLAY)
         {
            return this._12601();
         }
         return false;
      }
      
      public function _14499() : Boolean
      {
         if(_213.type == _213.TYPE_BONE || _213.type == _213.TYPE_SLOT || _213.type == _213.TYPE_DISPLAY)
         {
            return this._12602() && _2220._2873 == _715.ARMATURE;
         }
         return false;
      }
      
      public function _14498() : Boolean
      {
         if(_213.type == _213.TYPE_DISPLAY)
         {
            return this._12601();
         }
         return false;
      }
      
      public function _14508() : Boolean
      {
         if(_2226._14509())
         {
            return true;
         }
         return false;
      }
      
      public function _14503() : Boolean
      {
         if(_213.type == _213.TYPE_SLOT_PROPERTY)
         {
            return this._14508();
         }
         return false;
      }
      
      public function get _3678() : _696
      {
         return this._2861._3678;
      }
      
      private function get _2861() : LibraryPanelController
      {
         return _1407.getInstance(LibraryPanelController) as LibraryPanelController;
      }
      
      private function get _2106() : _528
      {
         return _1407.getInstance(_528) as _528;
      }
      
      private function get _2852() : TimelinePanelController
      {
         return _1407.getInstance(TimelinePanelController) as TimelinePanelController;
      }
   }
}

