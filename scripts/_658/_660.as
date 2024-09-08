package _658
{
   import _51._50;
   import _51._52;
   import _51._79;
   import _97._100;
   import _97._101;
   import flash.geom.Matrix;
   import flash.geom.Point;
   
   public class _660
   {
      private var _4284:Vector.<_52>;
      
      private var _5754:Vector.<Matrix>;
      
      private var _5763:Vector.<_662>;
      
      private var _4235:Point;
      
      private var _2123:Mesh;
      
      private var _5755:Matrix;
      
      private var _5760:Array;
      
      public function _660(param1:Mesh, param2:Matrix)
      {
         super();
         this._2123 = param1;
         this._4284 = new Vector.<_52>();
         this._5754 = new Vector.<Matrix>();
         this._5763 = new Vector.<_662>();
         this._4235 = new Point();
         this._5755 = new Matrix();
         if(param2)
         {
            this._5755.copyFrom(param2);
         }
      }
      
      public function _1789(param1:Mesh, param2:_50, param3:_79, param4:Object) : void
      {
         var vertexRigData:Array;
         var _1831:Array = null;
         var boneName:String = null;
         var weight:Number = NaN;
         var bone:_52 = null;
         var i:int = 0;
         var len:int = 0;
         var mesh:Mesh = param1;
         var armature:_50 = param2;
         var slot:_79 = param3;
         var rigdata:Object = param4;
         var getVertexRigData:Function = function():Array
         {
            if(_1831.length == 0)
            {
               return null;
            }
            var _loc1_:int = int(_1831[0]);
            return _1831.splice(0,_loc1_ * 2 + 1);
         };
         _1831 = rigdata[_101.BONE];
         this._2123 = mesh;
         this._5755 = rigdata[_101.A_SLOT_POSE];
         this._5760 = rigdata[_101.A_BONE_POSE];
         this._4284.length = 0;
         i = 0;
         len = int(this._5760.length);
         while(i < len)
         {
            this._4284.push(armature._1810(this._5760[i].bone));
            this._5754.push(this._5760[i].pose);
            i++;
         }
         vertexRigData = getVertexRigData();
         i = 0;
         while(vertexRigData)
         {
            this._5763.push(this._5751(mesh._2115[i],vertexRigData,armature,slot,mesh._2102[i]));
            vertexRigData = getVertexRigData();
            i++;
         }
      }
      
      private function _5751(param1:_661, param2:Array, param3:_50, param4:_79, param5:_661) : _662
      {
         var _loc9_:_52 = null;
         var _loc6_:int = int(param2[0]);
         var _loc7_:Vector.<_52> = new Vector.<_52>();
         var _loc8_:Vector.<Number> = new Vector.<Number>();
         var _loc10_:int = 0;
         while(_loc10_ < _loc6_)
         {
            _loc9_ = param3._1810(param2[_loc10_ * 2 + 1]);
            if(_loc9_ == null)
            {
               throw new Error("rig data error");
            }
            _loc7_.push(_loc9_);
            _loc8_.push(param2[1 + _loc10_ * 2 + 1]);
            _loc10_++;
         }
         return this._5756(param1,_loc7_,_loc8_,param4,param5);
      }
      
      public function _5727(param1:Matrix) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         _loc2_ = 0;
         _loc3_ = int(this._5763.length);
         while(_loc2_ < _loc3_)
         {
            this._5763[_loc2_]._5758(param1);
            _loc2_++;
         }
      }
      
      public function _3145() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         _loc1_ = 0;
         _loc2_ = int(this._5763.length);
         while(_loc1_ < _loc2_)
         {
            this._5763[_loc1_]._3145();
            _loc1_++;
         }
      }
      
      private function _5756(param1:_661, param2:Vector.<_52>, param3:Vector.<Number>, param4:_79, param5:_661) : _662
      {
         var _loc8_:_52 = null;
         var _loc9_:Matrix = null;
         var _loc6_:_662 = new _662(param1,param5,this._5755);
         var _loc7_:int = int(param2.length);
         var _loc10_:int = 0;
         while(_loc10_ < _loc7_)
         {
            _loc8_ = param2[_loc10_];
            _loc9_ = this._2970(_loc8_);
            _loc6_._3206(param2[_loc10_],param3[_loc10_],_loc9_);
            _loc10_++;
         }
         return _loc6_;
      }
      
      public function _2970(param1:_52) : Matrix
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         _loc2_ = 0;
         _loc3_ = int(this._4284.length);
         while(_loc2_ < _loc3_)
         {
            if(this._4284[_loc2_] == param1)
            {
               return this._5754[_loc2_];
            }
            _loc2_++;
         }
         return null;
      }
      
      public function _2975(param1:_52, param2:Matrix) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:Matrix = this._2970(param1);
         _loc5_.copyFrom(param2);
         _loc3_ = 0;
         _loc4_ = int(this._5763.length);
         while(_loc3_ < _loc4_)
         {
            this._5763[_loc3_]._2975(param1,_loc5_);
            _loc3_++;
         }
      }
      
      public function _5209(param1:_661) : _662
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         _loc2_ = 0;
         _loc3_ = int(this._5763.length);
         while(_loc2_ < _loc3_)
         {
            if(this._5763[_loc2_].id == param1.id)
            {
               return this._5763[_loc2_];
            }
            _loc2_++;
         }
         return null;
      }
      
      public function _5716() : void
      {
         var _loc1_:Point = null;
         var _loc2_:int = 0;
         var _loc3_:int = int(this._5763.length);
         while(_loc2_ < _loc3_)
         {
            this._5763[_loc2_]._5761();
            _loc2_++;
         }
      }
      
      public function _5726() : Object
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc1_:Array = [];
         _loc2_ = 0;
         _loc3_ = int(this._5763.length);
         while(_loc2_ < _loc3_)
         {
            _loc4_ = this._5763[_loc2_]._5726();
            _loc6_ = int(_loc4_.length);
            _loc1_.push(_loc6_ / 2);
            _loc5_ = 0;
            while(_loc5_ < _loc6_)
            {
               _loc1_.push(_loc4_[_loc5_]);
               _loc5_++;
            }
            _loc2_++;
         }
         var _loc8_:Object;
         (_loc8_ = {})[_101.A_SLOT_POSE] = this._5755;
         _loc8_[_101.A_BONE_POSE] = {};
         _loc8_[_101.BONE] = [];
         _loc2_ = 0;
         _loc3_ = int(this._4284.length);
         while(_loc2_ < _loc3_)
         {
            _loc7_ = this._5762(this._4284[_loc2_]);
            _loc8_[_101.BONE].push(_loc7_);
            _loc8_[_101.A_BONE_POSE][_loc7_] = this._5754[_loc2_];
            _loc2_++;
         }
         _loc8_[_101.A_WEIGHTS] = _loc1_;
         return _loc8_;
      }
      
      private function _5762(param1:_52) : int
      {
         return param1.rootArmatureData._1779.indexOf(param1);
      }
      
      public function _3161(param1:_661) : _662
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         _loc2_ = 0;
         _loc3_ = int(this._5763.length);
         while(_loc2_ < _loc3_)
         {
            if(this._5763[_loc2_].id == param1.id)
            {
               return this._5763.splice(_loc2_,1)[0];
            }
            _loc2_++;
         }
         return null;
      }
      
      public function _3167(param1:_661, param2:_661, param3:_662 = null) : _662
      {
         var _loc4_:_661 = null;
         if(param3 == null)
         {
            _loc4_ = this._2123._5717(param1);
            param3 = new _662(_loc4_,param2,this._5755);
            param3._3206(this._4284[0],1,this._5754[0]);
         }
         this._5763.push(param3);
         return param3;
      }
      
      public function _4251(param1:_661) : _662
      {
         var _loc2_:_661 = new _661(0,0,param1.id);
         var _loc3_:_662 = new _662(_loc2_,param1,this._5755);
         _loc3_._3206(this._4284[0],1,this._5754[0]);
         _loc3_._3145();
         return _loc3_;
      }
      
      public function _3873(param1:_52) : Boolean
      {
         return this._4284.indexOf(param1) != -1;
      }
      
      public function addBone(param1:_52, param2:Matrix, param3:Array = null) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:Array = null;
         if(this._3873(param1))
         {
            return;
         }
         this._4284.push(param1);
         this._5754.push(param2);
         if(this._4284.length == 1)
         {
            this._5757();
         }
         if(param3)
         {
            _loc6_ = [];
            _loc4_ = 0;
            _loc5_ = int(this._5763.length);
            while(_loc4_ < _loc5_)
            {
               this._5763[_loc4_]._5753(param1,param3[_loc4_],param2);
               _loc4_++;
            }
         }
      }
      
      public function _3203(param1:_52, param2:Matrix, param3:int) : void
      {
         if(this._3873(param1))
         {
            return;
         }
         this._4284.splice(param3,0,param1);
         this._5754.splice(param3,0,param2);
         if(this._4284.length == 1)
         {
            this._5757();
         }
      }
      
      public function _2892(param1:_52) : Array
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:int = int(this._4284.indexOf(param1));
         if(_loc2_ >= 0)
         {
            this._4284.splice(_loc2_,1);
            this._5754.splice(_loc2_,1);
            param1._2035();
         }
         var _loc5_:Array = [];
         _loc3_ = 0;
         _loc4_ = int(this._5763.length);
         while(_loc3_ < _loc4_)
         {
            _loc5_.push(this._5763[_loc3_]._5208(param1));
            this._5763[_loc3_]._5752(param1);
            if(this._5763[_loc3_].isEmpty && this._4284.length > 0)
            {
               this._5763[_loc3_]._3206(this._4284[0],1,this._5754[0]);
            }
            _loc3_++;
         }
         return _loc5_;
      }
      
      private function _5757() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:_661 = null;
         var _loc4_:_661 = null;
         var _loc5_:_661 = null;
         var _loc6_:_662 = null;
         this._5763.length = 0;
         _loc1_ = 0;
         _loc2_ = int(this._2123._1812.length);
         while(_loc1_ < _loc2_)
         {
            _loc3_ = this._2123._1812[_loc1_];
            _loc4_ = this._2123._5717(_loc3_);
            _loc5_ = this._2123._3183(_loc3_);
            _loc6_ = new _662(_loc4_,_loc5_,this._5755);
            this._5763.push(_loc6_);
            _loc6_._3206(this._4284[0],1,this._4284[0]._2009);
            _loc1_++;
         }
      }
      
      public function _3195() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         _loc1_ = 0;
         _loc2_ = int(this._4284.length);
         while(_loc1_ < _loc2_)
         {
            this._4284[_loc1_]._2035();
            _loc1_++;
         }
      }
      
      public function _5168() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         _loc1_ = 0;
         _loc2_ = int(this._4284.length);
         while(_loc1_ < _loc2_)
         {
            this._4284[_loc1_].color = _100.RIG_BONE_COLOR[_loc1_ % _100.RIG_BONE_COLOR.length];
            _loc1_++;
         }
      }
      
      public function _3202() : Array
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:_662 = null;
         var _loc7_:Array = null;
         var _loc6_:Array = [];
         _loc1_ = 0;
         _loc2_ = int(this._4281.length);
         while(_loc1_ < _loc2_)
         {
            _loc5_ = this._4281[_loc1_];
            _loc7_ = [];
            _loc3_ = 0;
            _loc4_ = int(this._4284.length);
            while(_loc3_ < _loc4_)
            {
               _loc7_.push({
                  "bone":this._4284[_loc3_],
                  "weight":_loc5_._5208(this._4284[_loc3_])
               });
               _loc3_++;
            }
            _loc6_.push(_loc7_);
            _loc1_++;
         }
         return _loc6_;
      }
      
      public function _3201(param1:Array) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:Array = null;
         var _loc7_:_52 = null;
         var _loc8_:Number = NaN;
         var _loc9_:_662 = null;
         _loc2_ = 0;
         _loc3_ = int(param1.length);
         while(_loc2_ < _loc3_)
         {
            _loc6_ = param1[_loc2_];
            _loc9_ = this._5763[_loc2_];
            _loc4_ = 0;
            _loc5_ = int(_loc6_.length);
            while(_loc4_ < _loc5_)
            {
               _loc7_ = _loc6_[_loc4_].bone;
               _loc8_ = Number(_loc6_[_loc4_].weight);
               _loc9_._3206(_loc7_,_loc8_,this._2970(_loc7_));
               _loc4_++;
            }
            _loc2_++;
         }
      }
      
      public function set _5759(param1:Matrix) : void
      {
         this._5755.copyFrom(param1);
      }
      
      public function get _2922() : Vector.<_52>
      {
         return this._4284;
      }
      
      public function get _5759() : Matrix
      {
         return this._5755;
      }
      
      public function get _4281() : Vector.<_662>
      {
         return this._5763;
      }
   }
}

