package _319
{
   import _13492._13501;
   import _13503._13502;
   import _13505._13507;
   import _1404._1407;
   import _51._50;
   import _573.TimelinePanelController;
   import _586._588;
   import _586._594;
   import _658._660;
   import _708._715;
   
   public class _13538 extends _328
   {
      public function _13538()
      {
         super();
         _2215 = true;
         _2219 = true;
      }
      
      override protected function _2211() : *
      {
         var armature:_50;
         var i:int = 0;
         var len:int = 0;
         var _1992:_13502 = null;
         var j:int = 0;
         var jLen:int = 0;
         var _1770:_13507 = null;
         var k:int = 0;
         var kLen:int = 0;
         var _13724:_13501 = null;
         var deleteFrames:Object = null;
         var deleteFrameArr:Array = null;
         var setDeleteInfo:Function = function(param1:String, param2:String, param3:Array):void
         {
            if(deleteFrames[param1] == null)
            {
               deleteFrames[param1] = {};
            }
            deleteFrames[param1][param2] = param3;
         };
         super._2211();
         armature = _1837.rootArmatureData;
         deleteFrames = {};
         i = 0;
         len = int(armature._13619.length);
         while(i < len)
         {
            _1992 = armature._13619[i] as _13502;
            j = 0;
            jLen = int(_1992._1753.length);
            while(j < jLen)
            {
               _1770 = _1992._1753[j] as _13507;
               if(Boolean(_1770) && _1770._1826.mesh == mesh)
               {
                  deleteFrameArr = [];
                  k = 0;
                  kLen = int(_1770._1816.length);
                  while(k < kLen)
                  {
                     deleteFrameArr.push(_1770._1816[k]);
                     k++;
                  }
                  if(deleteFrameArr.length > 0)
                  {
                     setDeleteInfo(_1992.name,_1770.name,deleteFrameArr);
                  }
               }
               j++;
            }
            i++;
         }
         return {
            "meshObj":mesh._3197(),
            "deleteFrames":deleteFrames
         };
      }
      
      override public function execute() : void
      {
         mesh.autoOutline(this.density);
         _2223.meshRig = mesh.meshRig;
         if(mesh.meshRig)
         {
            mesh.meshRig._3195();
         }
         mesh.meshRig = null;
         this.deleteAnimation();
         _3172._3024();
         this._3193._3024();
         this._3193._12947();
         this._2894();
      }
      
      private function deleteAnimation() : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:_13502 = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:_13507 = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:_13501 = null;
         var _loc1_:_50 = _1837.rootArmatureData;
         _loc2_ = 0;
         _loc3_ = int(_loc1_._13619.length);
         while(_loc2_ < _loc3_)
         {
            _loc4_ = _loc1_._13619[_loc2_] as _13502;
            _loc5_ = 0;
            _loc6_ = int(_loc4_._1753.length);
            while(_loc5_ < _loc6_)
            {
               _loc7_ = _loc4_._1753[_loc5_] as _13507;
               if((Boolean(_loc7_)) && _loc7_._1826.mesh == mesh)
               {
                  _loc7_._1816.length = 0;
               }
               _loc5_++;
            }
            _loc2_++;
         }
      }
      
      override public function revert() : void
      {
         mesh._1796(_2208.meshObj);
         mesh.meshRig = _2223.meshRig as _660;
         this._3193._12947();
         this._3185();
         this._2894();
      }
      
      private function _3185() : void
      {
         var deleteFrames:Object = null;
         var i:int = 0;
         var len:int = 0;
         var _1992:_13502 = null;
         var j:int = 0;
         var jLen:int = 0;
         var _1770:_13507 = null;
         var k:int = 0;
         var kLen:int = 0;
         var _13724:_13501 = null;
         var frames:Array = null;
         var getDeleteInfo:Function = function(param1:String, param2:String):Array
         {
            if(deleteFrames[param1] == null)
            {
               return null;
            }
            return deleteFrames[param1][param2] as Array;
         };
         deleteFrames = _2208.deleteFrames;
         var armature:_50 = _1837.rootArmatureData;
         i = 0;
         len = int(armature._13619.length);
         while(i < len)
         {
            _1992 = armature._13619[i] as _13502;
            j = 0;
            jLen = int(_1992._1753.length);
            while(j < jLen)
            {
               _1770 = _1992._1753[j] as _13507;
               if(_1770)
               {
                  frames = getDeleteInfo(_1992.name,_1770.name);
                  if(frames)
                  {
                     k = 0;
                     kLen = int(frames.length);
                     while(k < kLen)
                     {
                        _13724 = frames[k] as _13501;
                        _1770._1816.push(_13724);
                        k++;
                     }
                  }
               }
               j++;
            }
            i++;
         }
      }
      
      override protected function _2894() : void
      {
         super._2894();
         if(_2214._2220._2873 == _715.ANIMATE)
         {
            this._2962._4556();
            this._2962._3002();
            this._2962.refresh();
            this._2962._3186();
            this._2962._3133();
            this._2962._3140();
         }
         this._2877._3198._3194();
      }
      
      protected function get density() : int
      {
         var _loc1_:int = int(_2223.density);
         if(_loc1_ < 1)
         {
            _loc1_ = 1;
         }
         else if(_loc1_ > 5)
         {
            _loc1_ = 5;
         }
         return _loc1_;
      }
      
      protected function get _2877() : _588
      {
         return _1407.getInstance(_588) as _588;
      }
      
      protected function get _3193() : _594
      {
         return _1407.getInstance(_594) as _594;
      }
      
      private function get _2962() : TimelinePanelController
      {
         return _1407.getInstance(TimelinePanelController) as TimelinePanelController;
      }
   }
}

