package _319
{
   import _13492._13501;
   import _13503._13502;
   import _13505._13507;
   import _1404._1407;
   import _51._50;
   import _573.TimelinePanelController;
   import _652._654;
   import _658._661;
   import _708._715;
   
   public class _326 extends _328
   {
      public function _326()
      {
         super();
         _2215 = true;
         _2219 = true;
      }
      
      override protected function _2211() : *
      {
         var _3166:Vector.<_661>;
         var removedOutline:Vector.<_661>;
         var firstVertex:_661;
         var deletedVertices:Vector.<_661>;
         var deletedFFDVertices:Vector.<_661>;
         var armature:_50;
         var endVertex:_661 = null;
         var endEdge:Vector.<_661> = null;
         var i:int = 0;
         var len:int = 0;
         var _3169:_661 = null;
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
         _3166 = new Vector.<_661>(2);
         removedOutline = new Vector.<_661>();
         firstVertex = mesh.vertices[0];
         deletedVertices = new Vector.<_661>();
         deletedFFDVertices = new Vector.<_661>();
         endVertex = this._3174;
         while(Boolean(endVertex) && this._3188(endVertex,firstVertex))
         {
            _3169 = mesh._3183(endVertex);
            mesh._3161(endVertex,_3169,false);
            deletedVertices.push(endVertex);
            deletedFFDVertices.push(_3169);
            endEdge = this._3184();
            if(endEdge)
            {
               endVertex = endEdge[1];
               removedOutline.push(endEdge[0],endEdge[1]);
               mesh._3160(endEdge[0],endEdge[1],false);
            }
            else
            {
               endVertex = null;
            }
         }
         if(endVertex)
         {
            _3166[0] = endVertex;
            _3166[1] = firstVertex;
            i = 0;
            len = int(deletedVertices.length);
            while(i < len)
            {
               mesh._3167(deletedVertices[i],deletedFFDVertices[i],false);
               i++;
            }
            i = 0;
            len = int(removedOutline.length);
            while(i < len)
            {
               mesh._3166(removedOutline[i],removedOutline[i + 1],false);
               i += 2;
            }
            _2223.removedOutline = removedOutline;
            _2223._3166 = _3166;
            _2223.deletedVertices = deletedVertices;
            _2223.deletedFFDVertices = deletedFFDVertices;
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
            return {"deleteFrames":deleteFrames};
         }
         throw new Error("end add outline error");
      }
      
      private function _3188(param1:_661, param2:_661) : Boolean
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         _loc3_ = 0;
         _loc4_ = int(mesh.outline.length);
         while(_loc3_ < _loc4_)
         {
            if(_654.cross2(param1,param2,mesh.outline[_loc3_],mesh.outline[_loc3_ + 1]))
            {
               return true;
            }
            _loc3_ += 2;
         }
         return false;
      }
      
      private function _3184() : Vector.<_661>
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:_661 = null;
         var _loc1_:Vector.<_661> = new Vector.<_661>(2);
         var _loc2_:_661 = mesh.vertices[0];
         var _loc3_:Vector.<_661> = new Vector.<_661>();
         _loc4_ = 0;
         _loc5_ = int(mesh.outline.length);
         while(_loc4_ < _loc5_)
         {
            _loc6_ = int(_loc3_.indexOf(mesh.outline[_loc4_]));
            if(_loc6_ == -1)
            {
               _loc3_.push(mesh.outline[_loc4_]);
            }
            else
            {
               _loc3_.splice(_loc6_,1);
            }
            _loc4_++;
         }
         if(_loc3_.length == 2)
         {
            if(_loc3_[0] == _loc2_)
            {
               _loc7_ = _loc3_[1];
            }
            else
            {
               _loc7_ = _loc3_[0];
            }
         }
         if(_loc7_ != null)
         {
            _loc4_ = 0;
            _loc5_ = int(mesh.outline.length);
            while(_loc4_ < _loc5_)
            {
               if(mesh.outline[_loc4_] == _loc7_)
               {
                  _loc1_[0] = _loc7_;
                  _loc1_[1] = mesh.outline[_loc4_ + 1];
                  return _loc1_;
               }
               if(mesh.outline[_loc4_ + 1] == _loc7_)
               {
                  _loc1_[0] = _loc7_;
                  _loc1_[1] = mesh.outline[_loc4_];
                  return _loc1_;
               }
               _loc4_ += 2;
            }
         }
         return null;
      }
      
      override public function execute() : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc1_:Vector.<_661> = _2223.removedOutline;
         var _loc2_:Vector.<_661> = _2223._3166;
         var _loc3_:Vector.<_661> = _2223.deletedVertices;
         var _loc4_:Vector.<_661> = _2223.deletedFFDVertices;
         _loc5_ = 0;
         _loc6_ = int(_loc1_.length);
         while(_loc5_ < _loc6_)
         {
            mesh._3160(_loc1_[_loc5_],_loc1_[_loc5_ + 1],false);
            _loc5_ += 2;
         }
         _loc5_ = 0;
         _loc6_ = int(_loc3_.length);
         while(_loc5_ < _loc6_)
         {
            mesh._3161(_loc3_[_loc5_],_loc4_[_loc5_],false);
            _loc5_++;
         }
         mesh._3166(_loc2_[0],_loc2_[1]);
         mesh._3189();
         this.deleteAnimation();
         this._2894();
         _3172._3187();
         _11553._3187();
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
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc1_:Vector.<_661> = _2223.removedOutline;
         var _loc2_:Vector.<_661> = _2223._3166;
         var _loc3_:Vector.<_661> = _2223.deletedVertices;
         var _loc4_:Vector.<_661> = _2223.deletedFFDVertices;
         mesh._3160(_loc2_[0],_loc2_[1]);
         _loc5_ = int(_loc3_.length - 1);
         while(_loc5_ >= 0)
         {
            mesh._3167(_loc3_[_loc5_],_loc4_[_loc5_],false);
            _loc5_--;
         }
         _loc5_ = _loc1_.length - 2;
         while(_loc5_ >= 0)
         {
            mesh._3166(_loc1_[_loc5_],_loc1_[_loc5_ + 1],false);
            _loc5_ -= 2;
         }
         this._3185();
         this._2894();
      }
      
      private function _3185() : void
      {
         var armature:_50;
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
         if(_2208 == null || _1837 == null)
         {
            return;
         }
         deleteFrames = _2208.deleteFrames;
         armature = _1837.rootArmatureData;
         if(Boolean(armature) && Boolean(armature._13619))
         {
            i = 0;
            len = int(armature._13619.length);
            while(i < len)
            {
               _1992 = armature._13619[i] as _13502;
               if(Boolean(_1992) && Boolean(_1992._1753))
               {
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
               }
               i++;
            }
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
      }
      
      private function get _2962() : TimelinePanelController
      {
         return _1407.getInstance(TimelinePanelController) as TimelinePanelController;
      }
      
      private function get _3174() : _661
      {
         return _2223._3174 as _661;
      }
   }
}

