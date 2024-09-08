package _319
{
   import _1404._1407;
   import _40._39;
   import _40._42;
   import _40._43;
   import _51._50;
   import _586._594;
   import _658._661;
   import _658._662;
   
   public class _12451 extends _328
   {
      public function _12451()
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
         var _1992:_39 = null;
         var j:int = 0;
         var jLen:int = 0;
         var _1770:_43 = null;
         var k:int = 0;
         var kLen:int = 0;
         var _13724:_42 = null;
         var deleteFFDTimelineFrameObj:Object = null;
         var deleteOffsetX:Number = NaN;
         var deleteOffsetY:Number = NaN;
         var deleteArr:Array = null;
         var setDeleteInfo:Function = function(param1:String, param2:String, param3:int, param4:Array):void
         {
            if(deleteFFDTimelineFrameObj[param1] == null)
            {
               deleteFFDTimelineFrameObj[param1] = {};
            }
            if(deleteFFDTimelineFrameObj[param1][param2] == null)
            {
               deleteFFDTimelineFrameObj[param1][param2] = {};
            }
            deleteFFDTimelineFrameObj[param1][param2][param3] = param4;
         };
         var deleteIndex:int = int(mesh.vertices.indexOf(vertex));
         _2223.deleteIndex = deleteIndex;
         armature = _1837.rootArmatureData;
         deleteFFDTimelineFrameObj = {};
         i = 0;
         len = int(armature._1963.length);
         while(i < len)
         {
            _1992 = armature._1963[i] as _39;
            j = 0;
            jLen = int(_1992._1753.length);
            while(j < jLen)
            {
               _1770 = _1992._1753[j] as _43;
               if(Boolean(_1770) && _1770._1826.mesh == mesh)
               {
                  k = 0;
                  kLen = int(_1770._1816.length);
                  while(k < kLen)
                  {
                     _13724 = _1770._1816[k] as _42;
                     deleteOffsetX = NaN;
                     deleteOffsetY = NaN;
                     if(_13724.ffd.length > deleteIndex * 2)
                     {
                        deleteOffsetX = _13724.ffd[deleteIndex * 2];
                     }
                     if(_13724.ffd.length > deleteIndex * 2 + 1)
                     {
                        deleteOffsetY = _13724.ffd[deleteIndex * 2 + 1];
                     }
                     deleteArr = [];
                     if(!isNaN(deleteOffsetX) || !isNaN(deleteOffsetY))
                     {
                        deleteArr.push(deleteOffsetX);
                        if(!isNaN(deleteOffsetY))
                        {
                           deleteArr.push(deleteOffsetY);
                        }
                        setDeleteInfo(_1992.name,_1770.name,k,deleteArr);
                     }
                     k++;
                  }
               }
               j++;
            }
            i++;
         }
         return {
            "deleteIndex":deleteIndex,
            "deleteInfo":deleteFFDTimelineFrameObj
         };
      }
      
      override public function execute() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         if(mesh._2119())
         {
            _2223.removeRig = mesh._3158(vertex,this._3169,false);
         }
         else
         {
            mesh._3161(vertex,this._3169,false);
         }
         this._3178();
         if(this._12546)
         {
            mesh.userEdges.length = 0;
            _loc1_ = 0;
            _loc2_ = int(this._12546.length);
            while(_loc1_ < _loc2_)
            {
               mesh.userEdges.push(this._12546[_loc1_]);
               _loc1_++;
            }
         }
         if(this._12549)
         {
            mesh.outline.length = 0;
            _loc1_ = 0;
            _loc2_ = int(this._12549.length);
            while(_loc1_ < _loc2_)
            {
               mesh.outline.push(this._12549[_loc1_]);
               _loc1_++;
            }
         }
         if(this._12544)
         {
            mesh._5739.length = 0;
            _loc1_ = 0;
            _loc2_ = int(this._12544.length);
            while(_loc1_ < _loc2_)
            {
               mesh._5739.push(this._12544[_loc1_]);
               _loc1_++;
            }
         }
         mesh._3165();
         this._2894();
      }
      
      private function _3178() : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:_39 = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:_43 = null;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:_42 = null;
         var _loc12_:int = 0;
         var _loc1_:int = int(_2223.deleteIndex);
         var _loc2_:_50 = _1837.rootArmatureData;
         _loc3_ = 0;
         _loc4_ = int(_loc2_._1963.length);
         while(_loc3_ < _loc4_)
         {
            _loc5_ = _loc2_._1963[_loc3_] as _39;
            _loc6_ = 0;
            _loc7_ = int(_loc5_._1753.length);
            while(_loc6_ < _loc7_)
            {
               _loc8_ = _loc5_._1753[_loc6_] as _43;
               if((Boolean(_loc8_)) && _loc8_._1826.mesh == mesh)
               {
                  _loc9_ = 0;
                  _loc10_ = int(_loc8_._1816.length);
                  while(_loc9_ < _loc10_)
                  {
                     _loc11_ = _loc8_._1816[_loc9_] as _42;
                     if(_loc11_.ffd.length > _loc1_ * 2 + 1)
                     {
                        _loc12_ = 2;
                     }
                     else if(_loc11_.ffd.length > _loc1_ * 2)
                     {
                        _loc12_ = 1;
                     }
                     if(_loc12_ > 0)
                     {
                        _loc11_.ffd.splice(_loc1_ * 2,_loc12_);
                     }
                     _loc9_++;
                  }
               }
               _loc6_++;
            }
            _loc3_++;
         }
      }
      
      override public function revert() : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc1_:int = int(_2223.deleteIndex);
         if(mesh._2119())
         {
            mesh._3180(vertex,this._3169,_loc1_,false,_2223.removeRig as _662);
         }
         else
         {
            mesh._3182(vertex,this._3169,_loc1_,false);
         }
         this._3177();
         if(this._12547)
         {
            mesh.userEdges.length = 0;
            _loc2_ = 0;
            _loc3_ = int(this._12547.length);
            while(_loc2_ < _loc3_)
            {
               mesh.userEdges.push(this._12547[_loc2_]);
               _loc2_++;
            }
         }
         if(this._12548)
         {
            mesh.outline.length = 0;
            _loc2_ = 0;
            _loc3_ = int(this._12548.length);
            while(_loc2_ < _loc3_)
            {
               mesh.outline.push(this._12548[_loc2_]);
               _loc2_++;
            }
         }
         if(this._12545)
         {
            mesh._5739.length = 0;
            _loc2_ = 0;
            _loc3_ = int(this._12545.length);
            while(_loc2_ < _loc3_)
            {
               mesh._5739.push(this._12545[_loc2_]);
               _loc2_++;
            }
         }
         mesh._3165();
         this._2894();
      }
      
      private function _3177() : void
      {
         var deleteIndex:int;
         var armature:_50;
         var deleteInfo:Object = null;
         var i:int = 0;
         var len:int = 0;
         var _1992:_39 = null;
         var j:int = 0;
         var jLen:int = 0;
         var _1770:_43 = null;
         var k:int = 0;
         var kLen:int = 0;
         var _13724:_42 = null;
         var deleteLen:int = 0;
         var deleteArr:Array = null;
         var m:int = 0;
         var mLen:int = 0;
         var getDeleteArr:Function = function(param1:String, param2:String, param3:int):Array
         {
            if(deleteInfo[param1] == null)
            {
               return null;
            }
            if(deleteInfo[param1][param2] == null)
            {
               return null;
            }
            return deleteInfo[param1][param2][param3] as Array;
         };
         if(_2208 == null || _1837 == null)
         {
            return;
         }
         deleteIndex = int(_2208.deleteIndex);
         deleteInfo = _2208.deleteInfo;
         armature = _1837.rootArmatureData;
         if(Boolean(armature) && Boolean(armature._1963))
         {
            i = 0;
            len = int(armature._1963.length);
            while(i < len)
            {
               _1992 = armature._1963[i] as _39;
               if(Boolean(_1992) && Boolean(_1992._1753))
               {
                  j = 0;
                  jLen = int(_1992._1753.length);
                  while(j < jLen)
                  {
                     _1770 = _1992._1753[j] as _43;
                     if(Boolean(_1770) && _1770._1826.mesh == mesh)
                     {
                        k = 0;
                        kLen = int(_1770._1816.length);
                        while(k < kLen)
                        {
                           _13724 = _1770._1816[k] as _42;
                           deleteArr = getDeleteArr(_1992.name,_1770.name,k);
                           if(deleteArr)
                           {
                              m = 0;
                              mLen = int(deleteArr.length);
                              while(m < mLen)
                              {
                                 if(!isNaN(deleteArr[m]))
                                 {
                                    _13724.ffd.splice(deleteIndex * 2 + m,0,deleteArr[m]);
                                 }
                                 m++;
                              }
                           }
                           k++;
                        }
                     }
                     j++;
                  }
               }
               i++;
            }
         }
      }
      
      override protected function _2894() : void
      {
         this._3008._3024();
         super._2894();
      }
      
      private function get _12547() : Vector.<_661>
      {
         return _2223._12547 as Vector.<_661>;
      }
      
      private function get _12546() : Vector.<_661>
      {
         return _2223._12546 as Vector.<_661>;
      }
      
      private function get _12548() : Vector.<_661>
      {
         return _2223._12548 as Vector.<_661>;
      }
      
      private function get _12549() : Vector.<_661>
      {
         return _2223._12549 as Vector.<_661>;
      }
      
      private function get _12545() : Vector.<_661>
      {
         return _2223._12545 as Vector.<_661>;
      }
      
      private function get _12544() : Vector.<_661>
      {
         return _2223._12544 as Vector.<_661>;
      }
      
      protected function get _3169() : _661
      {
         return _2223._3169 as _661;
      }
      
      protected function get _3008() : _594
      {
         return _1407.getInstance(_594) as _594;
      }
   }
}

