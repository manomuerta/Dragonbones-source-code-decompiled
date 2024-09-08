package _477
{
   import _35._13488;
   import _648._650;
   import _97._101;
   import egret.utils.FileUtil;
   import egret.utils.tr;
   import flash.utils.ByteArray;
   
   public class _11496 extends _494
   {
      public function _11496()
      {
         super();
      }
      
      override public function run() : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:Object = null;
         var _loc7_:Object = null;
         var _loc8_:Array = null;
         if(!_3238.exportData)
         {
            complete();
            return;
         }
         var _loc1_:Object = _13488._13605(_3238.dragonBonesVO,_3238.version,false);
         if(_loc1_.name == "")
         {
            _loc1_.name = _3238.projectName;
         }
         _3613._3675 = _loc1_;
         if(_3238.exportAnimationName != null && _3238.exportAnimationName != "")
         {
            if(_loc1_[_101.ARMATURE])
            {
               _loc2_ = 0;
               _loc3_ = int(_loc1_[_101.ARMATURE].length);
               while(_loc2_ < _loc3_)
               {
                  _loc6_ = _loc1_[_101.ARMATURE][_loc2_];
                  if((Boolean(_loc6_)) && Boolean(_loc6_[_101.ANIMATION]))
                  {
                     _loc8_ = [];
                     _loc4_ = 0;
                     _loc5_ = int(_loc6_[_101.ANIMATION].length);
                     while(_loc4_ < _loc5_)
                     {
                        _loc7_ = _loc6_[_101.ANIMATION][_loc4_];
                        if((Boolean(_loc7_)) && _loc7_.name == _3238.exportAnimationName)
                        {
                           _loc8_.push(_loc7_);
                        }
                        _loc4_++;
                     }
                     if(_loc8_.length > 0)
                     {
                        _loc6_[_101.ANIMATION] = _loc8_;
                     }
                  }
                  _loc2_++;
               }
            }
         }
         var _loc9_:ByteArray = new ByteArray();
         _loc9_.writeUTFBytes(JSON.stringify(_loc1_));
         var _loc10_:String = (!!_3238.curArmature ? _3238.curArmature : _3238.outputName) + "_" + (!!_3238.exportAnimationName ? _3238.exportAnimationName : "all");
         FileUtil.browseAndSave(_loc9_,_3238.ouputPath + _loc10_ + "." + _650.ANIMATION_EXT,tr(""));
         complete();
      }
   }
}

