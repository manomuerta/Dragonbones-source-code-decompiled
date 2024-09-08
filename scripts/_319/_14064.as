package _319
{
   import _13492._13501;
   import _13503._13502;
   import _13505._13507;
   import _1404._1407;
   import _51._50;
   import _586._594;
   import _658._661;
   import _658._662;
   import flash.utils.Dictionary;
   
   public class _14064 extends _328
   {
      public function _14064()
      {
         super();
         _2215 = true;
         _2219 = true;
      }
      
      override protected function _2211() : *
      {
         var armature:_50;
         var indices:Array;
         var i:int = 0;
         var len:int = 0;
         var deleteIndex:int = 0;
         var _1992:_13502 = null;
         var j:int = 0;
         var jLen:int = 0;
         var _1770:_13507 = null;
         var k:int = 0;
         var kLen:int = 0;
         var _13724:_13501 = null;
         var deleteFFDTimelineFrameObj:Object = null;
         var indiceDic:Dictionary = null;
         var indiceDic2:Dictionary = null;
         var index:int = 0;
         var deleteFFDValue:Vector.<Number> = null;
         var setDeleteInfo:Function = function(param1:String, param2:String, param3:int, param4:Vector.<Number>, param5:Vector.<Number>):void
         {
            if(deleteFFDTimelineFrameObj[param1] == null)
            {
               deleteFFDTimelineFrameObj[param1] = {};
            }
            if(deleteFFDTimelineFrameObj[param1][param2] == null)
            {
               deleteFFDTimelineFrameObj[param1][param2] = {};
            }
            deleteFFDTimelineFrameObj[param1][param2][param3] = {
               "_1642":param4,
               "_3430":param5
            };
         };
         var deleteIndices:Vector.<int> = new Vector.<int>();
         i = 0;
         len = int(vertices.length);
         while(i < len)
         {
            deleteIndex = int(mesh.vertices.indexOf(vertices[i]));
            deleteIndices.push(deleteIndex);
            i++;
         }
         _2223.deleteIndices = deleteIndices;
         armature = _1837.rootArmatureData;
         deleteFFDTimelineFrameObj = {};
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
                  k = 0;
                  kLen = int(_1770._1816.length);
                  while(k < kLen)
                  {
                     _13724 = _1770._1816[k] as _13501;
                     deleteFFDValue = this._14435(_13724,deleteIndices);
                     setDeleteInfo(_1992.name,_1770.name,k,deleteFFDValue,_13724._13636.concat());
                     k++;
                  }
               }
               j++;
            }
            i++;
         }
         _2223.deleteFFDTimelineFrameObj = deleteFFDTimelineFrameObj;
         indiceDic = new Dictionary();
         indiceDic2 = new Dictionary();
         indices = [];
         i = 0;
         len = int(vertices.length);
         while(i < len)
         {
            index = int(mesh.vertices.indexOf(vertices[i]));
            indiceDic[vertices[i]] = index;
            indiceDic2[this._14436[i]] = index;
            i++;
         }
         vertices.sort(function(param1:_661, param2:_661):int
         {
            if(indiceDic[param1] < indiceDic[param2])
            {
               return 1;
            }
            return -1;
         });
         this._14436.sort(function(param1:_661, param2:_661):int
         {
            if(indiceDic2[param1] < indiceDic2[param2])
            {
               return 1;
            }
            return -1;
         });
         i = 0;
         len = int(vertices.length);
         while(i < len)
         {
            indices.push(indiceDic[vertices[i]]);
            i++;
         }
         _2223.indices = indices;
         indiceDic = null;
         indiceDic2 = null;
      }
      
      private function _14435(param1:_13501, param2:Vector.<int>) : Vector.<Number>
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc6_:int = 0;
         var _loc8_:int = 0;
         var _loc5_:Array = [];
         _loc3_ = 0;
         _loc4_ = int(param2.length);
         while(_loc3_ < _loc4_)
         {
            _loc6_ = param2[_loc3_];
            if(param1._13636.length > _loc6_ * 2)
            {
               _loc5_.push(_loc6_ * 2);
            }
            if(param1._13636.length > _loc6_ * 2 + 1)
            {
               _loc5_.push(_loc6_ * 2 + 1);
            }
            _loc3_++;
         }
         _loc5_.sort();
         var _loc7_:Vector.<Number> = new Vector.<Number>();
         if(_loc5_.length > 0)
         {
            _loc8_ = 0;
            _loc3_ = 0;
            _loc4_ = int(param1._13636.length);
            while(_loc3_ < _loc4_)
            {
               if(_loc3_ != _loc5_[_loc8_])
               {
                  _loc7_.push(param1._13636[_loc3_]);
               }
               else
               {
                  _loc8_++;
               }
               _loc3_++;
            }
         }
         else
         {
            _loc7_ = param1._13636.concat();
         }
         return _loc7_;
      }
      
      override public function execute() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc4_:Vector.<_662> = null;
         var _loc5_:_662 = null;
         var _loc3_:Array = [];
         if(mesh._2119())
         {
            _loc4_ = new Vector.<_662>();
            _loc1_ = 0;
            _loc2_ = int(vertices.length);
            while(_loc1_ < _loc2_)
            {
               _loc5_ = mesh._3158(vertices[_loc1_],this._14436[_loc1_],false);
               if(_loc5_)
               {
                  _loc4_.push(_loc5_);
               }
               _loc1_++;
            }
            _2223.removeRigs = _loc4_;
         }
         else
         {
            _loc1_ = 0;
            _loc2_ = int(vertices.length);
            while(_loc1_ < _loc2_)
            {
               mesh._3161(vertices[_loc1_],this._14436[_loc1_],false);
               _loc1_++;
            }
         }
         this._3178(false);
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
      
      private function _3178(param1:Boolean) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:_13502 = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:_13507 = null;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:_13501 = null;
         var _loc13_:int = 0;
         var _loc14_:Object = null;
         var _loc2_:int = int(_2223.deleteIndex);
         var _loc3_:_50 = _1837.rootArmatureData;
         _loc4_ = 0;
         _loc5_ = int(_loc3_._13619.length);
         while(_loc4_ < _loc5_)
         {
            _loc6_ = _loc3_._13619[_loc4_] as _13502;
            _loc7_ = 0;
            _loc8_ = int(_loc6_._1753.length);
            while(_loc7_ < _loc8_)
            {
               _loc9_ = _loc6_._1753[_loc7_] as _13507;
               if((Boolean(_loc9_)) && _loc9_._1826.mesh == mesh)
               {
                  _loc10_ = 0;
                  _loc11_ = int(_loc9_._1816.length);
                  while(_loc10_ < _loc11_)
                  {
                     _loc14_ = this._14434(_loc6_.name,_loc9_.name,_loc10_);
                     if((Boolean(_loc14_)) && Boolean(_loc14_._1642))
                     {
                        (_loc9_._1816[_loc10_] as _13501).value = param1 ? _loc14_._3430 : _loc14_._1642;
                     }
                     _loc10_++;
                  }
               }
               _loc7_++;
            }
            _loc4_++;
         }
      }
      
      override public function revert() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:Vector.<_662> = null;
         var _loc4_:_662 = null;
         var _loc5_:int = 0;
         if(mesh._2119())
         {
            _loc3_ = _2223.removeRigs;
            _loc1_ = int(vertices.length - 1);
            while(_loc1_ >= 0)
            {
               _loc5_ = int(_2223.indices[_loc1_]);
               if(_loc5_ >= 0)
               {
                  mesh._3180(vertices[_loc1_],this._14436[_loc1_],_loc5_,false,_loc3_[_loc1_]);
               }
               else
               {
                  mesh._3162(vertices[_loc1_],this._14436[_loc1_],false,_loc3_[_loc1_]);
               }
               _loc1_--;
            }
         }
         else
         {
            _loc1_ = int(vertices.length - 1);
            while(_loc1_ >= 0)
            {
               _loc5_ = int(_2223.indices[_loc1_]);
               if(_loc5_ >= 0)
               {
                  mesh._3182(vertices[_loc1_],this._14436[_loc1_],_loc5_,false);
               }
               else
               {
                  mesh._3167(vertices[_loc1_],this._14436[_loc1_],false);
               }
               _loc1_--;
            }
         }
         this._3178(true);
         if(this._12547)
         {
            mesh.userEdges.length = 0;
            _loc1_ = 0;
            _loc2_ = int(this._12547.length);
            while(_loc1_ < _loc2_)
            {
               mesh.userEdges.push(this._12547[_loc1_]);
               _loc1_++;
            }
         }
         if(this._12548)
         {
            mesh.outline.length = 0;
            _loc1_ = 0;
            _loc2_ = int(this._12548.length);
            while(_loc1_ < _loc2_)
            {
               mesh.outline.push(this._12548[_loc1_]);
               _loc1_++;
            }
         }
         if(this._12545)
         {
            mesh._5739.length = 0;
            _loc1_ = 0;
            _loc2_ = int(this._12545.length);
            while(_loc1_ < _loc2_)
            {
               mesh._5739.push(this._12545[_loc1_]);
               _loc1_++;
            }
         }
         mesh._3165();
         this._2894();
      }
      
      private function _14434(param1:String, param2:String, param3:int) : Object
      {
         var _loc4_:Object = _2223.deleteFFDTimelineFrameObj;
         if(_loc4_[param1] == null)
         {
            return null;
         }
         if(_loc4_[param1][param2] == null)
         {
            return null;
         }
         return _loc4_[param1][param2][param3];
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
      
      protected function get _14436() : Vector.<_661>
      {
         return _2223._14436 as Vector.<_661>;
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

