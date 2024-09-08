package _521
{
   import _13503._13502;
   import _13505._13504;
   import _13505._13507;
   import _13505._13508;
   import _1404._1407;
   import _14101._14103;
   import _470._469;
   import _51._50;
   import _51._52;
   import _51._70;
   import _51._79;
   import _708._715;
   import _708._717;
   import _73._74;
   import _783.CommandNotification;
   import _783.MenuNotification;
   import _783.TipNotification;
   import _93._94;
   import _97._101;
   import _97._124;
   import egret.utils.tr;
   import flash.utils.Dictionary;
   
   public class _15565 extends _94
   {
      public function _15565()
      {
         super();
      }
      
      override protected function _1576() : void
      {
         super._1576();
         _1565(MenuNotification.DUPLICATE,this._15582);
      }
      
      override protected function dispose() : void
      {
         super.dispose();
         _1564(MenuNotification.DUPLICATE,this._15582);
      }
      
      private function _15582(param1:MenuNotification) : void
      {
         if(param1.data != "scenepanel")
         {
            return;
         }
         if(_2214._1844._2873 != _715.ARMATURE)
         {
            if(_2214._1844._2873 == _715.ANIMATE)
            {
               this._3351(tr("Tip-canduplicateInArmatureMode"));
            }
            return;
         }
         if(_2226._2889.length != 1)
         {
            this._3351("Tip.duplicate.canselectoneitem");
            return;
         }
         if(_2226._2484 is _52)
         {
            this._10690(_2226._2484 as _52);
         }
         else if(_2226._2484 is _79)
         {
            this._10694(_2226._2484 as _79);
         }
         else if(_2226._2484 is _70)
         {
            this._15581(_2226._2484 as _70);
         }
      }
      
      private function _10690(param1:_52) : void
      {
         var _loc8_:_52 = null;
         var _loc11_:_79 = null;
         var _loc12_:_52 = null;
         var _loc19_:_52 = null;
         var _loc21_:_13502 = null;
         var _loc22_:_13504 = null;
         var _loc23_:_13508 = null;
         var _loc24_:_13507 = null;
         var _loc29_:String = null;
         var _loc30_:_79 = null;
         var _loc31_:Object = null;
         var _loc32_:Array = null;
         var _loc33_:_70 = null;
         var _loc34_:_70 = null;
         var _loc35_:Object = null;
         var _loc36_:String = null;
         if(!param1.parentBoneData)
         {
            return;
         }
         var _loc2_:Vector.<_52> = new Vector.<_52>();
         _loc2_ = _loc2_.concat(param1._2021());
         _loc2_.push(param1);
         var _loc3_:Vector.<_52> = new Vector.<_52>();
         var _loc4_:_52 = param1.clone();
         _loc3_ = _loc3_.concat(_loc4_._2021());
         _loc3_.push(_loc4_);
         var _loc5_:Dictionary = new Dictionary();
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         _loc7_ = int(_loc3_.length);
         _loc6_ = 0;
         while(_loc6_ < _loc7_)
         {
            _loc5_[_loc2_[_loc6_]] = _loc3_[_loc6_];
            _loc6_++;
         }
         var _loc9_:_50 = param1.rootArmatureData;
         var _loc10_:String = _loc9_._1795.name;
         _loc7_ = int(_loc3_.length);
         _loc6_ = 0;
         while(_loc6_ < _loc7_)
         {
            _loc8_ = _loc3_[_loc6_];
            _loc29_ = _124._1747(_loc8_.name,_loc9_._1793);
            if(_loc29_ != _loc8_.name)
            {
               _loc8_.name = _loc29_;
            }
            _loc6_++;
         }
         var _loc13_:Dictionary = new Dictionary();
         var _loc14_:Dictionary = new Dictionary();
         var _loc15_:Vector.<Object> = new Vector.<Object>();
         var _loc16_:Vector.<Object> = new Vector.<Object>();
         var _loc17_:int = 0;
         var _loc18_:int = 0;
         var _loc20_:Vector.<_79> = new Vector.<_79>();
         _loc7_ = int(_loc9_._1780.length);
         _loc6_ = 0;
         while(_loc6_ < _loc7_)
         {
            _loc11_ = _loc9_._1780[_loc6_];
            if((_loc12_ = _loc11_.parentBoneData) != null && _loc2_.indexOf(_loc12_) >= 0)
            {
               _loc20_.push(_loc11_);
            }
            _loc6_++;
         }
         _loc7_ = int(_loc20_.length);
         _loc6_ = 0;
         while(_loc6_ < _loc7_)
         {
            _loc11_ = _loc20_[_loc6_];
            (_loc30_ = new _79()).name = _124._1747(_loc11_.name,_loc9_._1996);
            _loc30_.parentBoneData = _loc5_[_loc11_.parentBoneData];
            _loc30_.blendMode = _loc11_.blendMode;
            _loc30_.onlyBoundingBox = _loc11_.onlyBoundingBox;
            _loc30_._2152 = _loc11_._1926.clone();
            if(_loc30_.parentBoneData != null)
            {
               _loc13_[_loc11_] = _loc30_;
               _loc31_ = _469._2897(_loc30_,_loc30_.parentBoneData);
               _loc15_.push(_loc31_);
               _loc32_ = [];
               _loc18_ = int(_loc11_._1715.length);
               _loc17_ = 0;
               while(_loc17_ < _loc18_)
               {
                  _loc33_ = _loc11_._1765[_loc11_._1715[_loc17_]];
                  if(_loc33_)
                  {
                     _loc34_ = _loc33_._14298(_loc11_.parentBoneData.rootArmatureData);
                     _loc14_[_loc33_] = _loc34_;
                     if(_loc34_.type == _74.BOUNDINGBOX && Boolean(_loc34_._11278))
                     {
                        _loc36_ = _124._1747(_loc34_._11278.name,_loc9_._11282);
                        _loc34_._11278.name = _loc36_;
                        _loc34_._11284();
                     }
                     if(_loc34_._2165 && _loc34_.mesh && Boolean(_loc34_.mesh._1831))
                     {
                        this._15580(_loc34_,_loc2_,_loc5_);
                     }
                     _loc34_._1985 = _loc9_._1755;
                     this._2106._3808(_loc9_.name,_loc34_);
                     _loc35_ = _469._2895(_loc34_,_loc10_,_loc30_,null,_loc11_._1711 == _loc11_._1715[_loc17_]);
                     _loc32_.push(_loc35_);
                  }
                  _loc17_++;
               }
               if(_loc32_.length > 0)
               {
                  _loc16_.push(_loc32_);
               }
            }
            _loc6_++;
         }
         var _loc25_:Vector.<Object> = new Vector.<Object>();
         var _loc26_:Vector.<Object> = new Vector.<Object>();
         var _loc27_:Vector.<Object> = new Vector.<Object>();
         this._15577(_loc2_,_loc9_,_loc5_,_loc25_);
         _loc7_ = int(_loc20_.length);
         _loc6_ = 0;
         while(_loc6_ < _loc7_)
         {
            _loc11_ = _loc20_[_loc6_];
            this._15578(_loc11_,_loc9_,_loc13_,_loc14_,_loc26_,_loc27_);
            _loc6_++;
         }
         var _loc28_:Object;
         (_loc28_ = {})._2890 = param1.parentBoneData;
         _loc28_._12539 = _loc4_;
         _loc28_._1886 = _loc9_;
         _loc28_.addSlots = _loc15_;
         _loc28_.addDisplays = _loc16_;
         _loc28_.pasteBoneTimeLineData = _loc25_;
         _loc28_.pasteSlotTimeLineData = _loc26_;
         _loc28_.pasteFFDTimeLineData = _loc27_;
         _loc28_.flag = _14103.ALL_TYPES_SELECTED;
         _1567(new CommandNotification(CommandNotification.PASTE_BONE,_loc28_));
      }
      
      private function _10694(param1:_79) : void
      {
         var _loc12_:_70 = null;
         var _loc13_:_70 = null;
         var _loc15_:_13502 = null;
         var _loc16_:_13508 = null;
         var _loc17_:_13507 = null;
         var _loc24_:Object = null;
         var _loc25_:String = null;
         var _loc2_:_50 = param1.parentBoneData.rootArmatureData;
         var _loc3_:Vector.<Object> = new Vector.<Object>();
         var _loc4_:Vector.<Object> = new Vector.<Object>();
         var _loc5_:String = _loc2_._1795.name;
         var _loc6_:_52 = param1.parentBoneData;
         var _loc7_:_79;
         (_loc7_ = new _79()).name = _124._1747(param1.name,_loc2_._1996);
         _loc7_.parentBoneData = _loc6_;
         _loc7_.blendMode = param1.blendMode;
         _loc7_.onlyBoundingBox = param1.onlyBoundingBox;
         _loc7_._2152 = param1._1926.clone();
         var _loc8_:Object = _469._2897(_loc7_,_loc7_.parentBoneData);
         _loc3_.push(_loc8_);
         var _loc9_:Dictionary = new Dictionary();
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         _loc11_ = int(param1._1715.length);
         var _loc14_:Array = [];
         _loc10_ = 0;
         while(_loc10_ < _loc11_)
         {
            _loc12_ = param1._1765[param1._1715[_loc10_]];
            if(_loc12_)
            {
               _loc13_ = _loc12_._14298(param1.parentBoneData.rootArmatureData);
               _loc9_[_loc12_] = _loc13_;
               if(_loc13_.type == _74.BOUNDINGBOX && Boolean(_loc13_._11278))
               {
                  _loc25_ = _124._1747(_loc13_._11278.name,_loc2_._11282);
                  _loc13_._11278.name = _loc25_;
                  _loc13_._11284();
               }
               _loc13_._1985 = _loc2_._1755;
               this._2106._3808(_loc2_.name,_loc13_);
               _loc24_ = _469._2895(_loc13_,_loc5_,_loc7_,null,param1._1711 == param1._1715[_loc10_]);
               _loc14_.push(_loc24_);
            }
            _loc10_++;
         }
         if(_loc14_.length > 0)
         {
            _loc4_.push(_loc14_);
         }
         var _loc18_:Vector.<Object> = new Vector.<Object>();
         var _loc19_:Vector.<Object> = new Vector.<Object>();
         var _loc20_:int = 0;
         var _loc21_:int = 0;
         var _loc22_:Dictionary;
         (_loc22_ = new Dictionary())[param1] = _loc7_;
         this._15578(param1,_loc2_,_loc22_,_loc9_,_loc18_,_loc19_);
         var _loc23_:Object;
         (_loc23_ = {})._2890 = _loc6_;
         _loc23_._1886 = _loc2_;
         _loc23_.addSlots = _loc3_;
         _loc23_.addDisplays = _loc4_;
         _loc23_.pasteSlotTimeLineData = _loc18_;
         _loc23_.pasteFFDTimeLineData = _loc19_;
         _loc23_.flag = _14103.ALL_TYPES_SELECTED;
         _1567(new CommandNotification(CommandNotification.PASTE_SLOT,_loc23_));
      }
      
      private function _15581(param1:_70) : void
      {
      }
      
      private function _15580(param1:_70, param2:Vector.<_52>, param3:Dictionary) : void
      {
         var _loc6_:_52 = null;
         var _loc9_:int = 0;
         var _loc10_:Object = null;
         var _loc4_:Object = param1.mesh._1831;
         var _loc5_:Array = _loc4_[_101.BONE];
         var _loc7_:int = 0;
         _loc7_ = 0;
         while(_loc7_ < _loc5_.length)
         {
            if(_loc5_[_loc7_] is String)
            {
               _loc6_ = this._15579(_loc5_[_loc7_],param2);
               _loc9_ = -1;
               if(Boolean(_loc6_) && Boolean(param3[_loc6_]))
               {
                  _loc5_[_loc7_] = (param3[_loc6_] as _52).name;
               }
            }
            _loc7_++;
         }
         var _loc8_:Array = _loc4_[_101.A_BONE_POSE];
         _loc7_ = 0;
         while(_loc7_ < _loc8_.length)
         {
            _loc10_ = _loc8_[_loc7_];
            _loc6_ = this._15579(_loc10_.bone,param2);
            if((Boolean(_loc6_)) && Boolean(param3[_loc6_]))
            {
               _loc10_.bone = (param3[_loc6_] as _52).name;
            }
            _loc7_++;
         }
      }
      
      private function _15577(param1:Vector.<_52>, param2:_50, param3:Dictionary, param4:Vector.<Object>) : void
      {
         var _loc9_:_52 = null;
         var _loc10_:_13502 = null;
         var _loc11_:_13504 = null;
         var _loc12_:_13504 = null;
         var _loc13_:Object = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         _loc6_ = int(param1.length);
         _loc5_ = 0;
         while(_loc5_ < _loc6_)
         {
            _loc9_ = param1[_loc5_];
            _loc8_ = int(param2._13619.length);
            _loc7_ = 0;
            while(_loc7_ < _loc8_)
            {
               _loc10_ = param2._13619[_loc7_];
               if(_loc11_ = _loc10_._1873(_loc9_))
               {
                  (_loc12_ = _loc11_.clone() as _13504)._1823 = param3[_loc9_];
                  if(_loc12_._1823 != null)
                  {
                     _loc13_ = _469._14443(_loc10_,_loc12_);
                     param4.push(_loc13_);
                  }
               }
               _loc7_++;
            }
            _loc5_++;
         }
      }
      
      private function _15578(param1:_79, param2:_50, param3:Dictionary, param4:Dictionary, param5:Vector.<Object>, param6:Vector.<Object>) : void
      {
         var _loc11_:_13502 = null;
         var _loc12_:_13508 = null;
         var _loc13_:_13507 = null;
         var _loc14_:_70 = null;
         var _loc15_:_13508 = null;
         var _loc16_:Object = null;
         var _loc17_:_13507 = null;
         var _loc18_:Object = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         _loc8_ = int(param2._13619.length);
         _loc7_ = 0;
         while(_loc7_ < _loc8_)
         {
            _loc11_ = param2._13619[_loc7_];
            if(_loc12_ = _loc11_._1875(param1))
            {
               (_loc15_ = _loc12_.clone() as _13508)._1824 = param3[param1];
               _loc16_ = _469._14442(_loc11_,_loc15_);
               param5.push(_loc16_);
            }
            _loc10_ = int(param1._1715.length);
            _loc9_ = 0;
            while(_loc9_ < _loc10_)
            {
               _loc14_ = param1._1765[param1._1715[_loc9_]];
               if(_loc14_._2165)
               {
                  _loc13_ = _loc11_._1881(_loc14_);
                  if(_loc13_)
                  {
                     (_loc17_ = _loc13_.clone() as _13507)._1826 = param4[_loc14_];
                     if(_loc17_._1826 != null)
                     {
                        _loc18_ = _469._14441(_loc11_,_loc17_);
                        param6.push(_loc18_);
                     }
                  }
               }
               _loc9_++;
            }
            _loc7_++;
         }
      }
      
      private function _15579(param1:String, param2:Vector.<_52>) : _52
      {
         var _loc3_:int = 0;
         var _loc4_:int = int(param2.length);
         _loc3_ = 0;
         while(_loc3_ < _loc4_)
         {
            if(param2[_loc3_].name == param1)
            {
               return param2[_loc3_];
            }
            _loc3_++;
         }
         return null;
      }
      
      private function _3351(param1:String) : void
      {
         _1567(new TipNotification(TipNotification.SHOW_TOOL_TIP,{
            "type":_717.ANIMATE,
            "showText":param1
         }));
      }
      
      private function get _2106() : _528
      {
         return _1407.getInstance(_528) as _528;
      }
   }
}

