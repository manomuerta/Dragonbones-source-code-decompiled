package _658
{
   import _13505._13507;
   import _204._205;
   import _51._50;
   import _51._52;
   import _51._79;
   import _652._653;
   import _652._654;
   import _652._655;
   import _652._656;
   import _724._725;
   import _81._86;
   import _81._88;
   import _859._860;
   import _880._879;
   import _97._101;
   import flash.display.BitmapData;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.Dictionary;
   
   public class Mesh implements _860
   {
      private var _5748:uint = 0;
      
      public var _1812:Vector.<_661>;
      
      public var _5739:Vector.<_661>;
      
      public var vertices:Vector.<_661>;
      
      public var triangles:Vector.<_655>;
      
      public var outline:Vector.<_661>;
      
      public var userEdges:Vector.<_661>;
      
      private var _5733:Vector.<_661>;
      
      private var _5719:Vector.<_661>;
      
      private var _5737:Vector.<Number>;
      
      private var _14690:Vector.<Number>;
      
      private var _14689:Vector.<Number>;
      
      private var _5743:Vector.<uint>;
      
      private var _2348:Number;
      
      private var _2343:Number;
      
      private var _5729:Number;
      
      private var _5723:Number;
      
      private var _5742:Vector.<Number>;
      
      private var _2109:BitmapData;
      
      private var _5745:BitmapData;
      
      private var _5253:Rectangle;
      
      public var invalid:Boolean = true;
      
      private var _5718:Boolean;
      
      private var _5736:Boolean;
      
      private var _2101:_725;
      
      private var _5741:Boolean;
      
      private var _5740:Boolean;
      
      private var _2098:_13507;
      
      private var _2093:Vector.<Number>;
      
      public var _2111:Vector.<Number>;
      
      public var _5731:Number;
      
      public var _5730:Number;
      
      public var _1831:Object;
      
      public var _2162:Matrix;
      
      public var globalTransform:_86;
      
      private var _5722:Matrix;
      
      public var reference:Vector.<_860>;
      
      private var _1802:Array;
      
      private var _10797:Dictionary;
      
      private var _4285:_660;
      
      public function Mesh(param1:BitmapData)
      {
         this._1802 = [];
         this._10797 = new Dictionary();
         this.densityNumArr = [0.3,0.4,0.5,0.6,0.7];
         super();
         this._5737 = new Vector.<Number>();
         this._14690 = new Vector.<Number>();
         this._14689 = new Vector.<Number>();
         this._5743 = new Vector.<uint>();
         this._2162 = new Matrix();
         this.globalTransform = new _86();
         this._5722 = new Matrix();
         this.reference = new Vector.<_860>();
         this._5742 = new Vector.<Number>();
         this._5742.push(1,1,1,1);
         this._5253 = new Rectangle();
         if(param1 != null)
         {
            this._2348 = param1.width;
            this._2343 = param1.height;
            this._2092(this._2348,this._2343);
            this._2103(param1);
         }
      }
      
      public function clone(param1:Array, param2:Dictionary = null) : Mesh
      {
         this._1802 = param1.concat();
         if(param2)
         {
            this._10797 = param2;
         }
         return this._10798();
      }
      
      public function _2103(param1:BitmapData) : void
      {
         if(this._2109 != param1)
         {
            this._2109 = param1;
            this._2348 = this._2109.width;
            this._2343 = this._2109.height;
            this._5729 = this._2348 / 2;
            this._5723 = this._2343 / 2;
            this._5253.setTo(-this._5729,-this._5723,this._2348,this._2343);
            this.invalid = true;
            this.update();
         }
      }
      
      private function _13924(param1:Number, param2:Number, param3:int) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Array = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:Point = null;
         var _loc9_:_661 = null;
         if(this._2109)
         {
            _loc4_ = !!this.densityNumArr[param3 - 1] ? Number(this.densityNumArr[param3 - 1]) : 0.7;
            _loc5_ = _654.outline(this._2109,1,_loc4_);
            this.vertices.length = 0;
            this._1812.length = 0;
            this._5719.length = 0;
            this._5733.length = 0;
            this.outline.length = 0;
            this._5739.length = 0;
            this.userEdges.length = 0;
            _loc6_ = 0;
            _loc7_ = int(_loc5_.length);
            while(_loc6_ < _loc7_)
            {
               _loc8_ = _loc5_[_loc6_] as Point;
               _loc9_ = this._1750(_loc8_.x - param1 / 2,_loc8_.y - param2 / 2);
               this.vertices.push(_loc9_);
               this._1812.push(_loc9_.clone());
               this._5719.push(_loc9_.clone());
               this._5733.push(_loc9_.clone());
               _loc6_++;
            }
            _loc6_ = 0;
            _loc7_ = int(this.vertices.length);
            while(_loc6_ < _loc7_ - 1)
            {
               this.outline.push(this.vertices[_loc6_],this.vertices[_loc6_ + 1]);
               this._5739.push(this._1812[_loc6_],this._1812[_loc6_ + 1]);
               _loc6_++;
            }
            this.outline.push(this.vertices[_loc6_],this.vertices[0]);
            this._5739.push(this._1812[_loc6_],this._1812[0]);
            this._3165();
         }
         else
         {
            this._2092(this._2348,this._2348);
         }
      }
      
      private function _2092(param1:Number, param2:Number) : void
      {
         this.vertices = new Vector.<_661>();
         this._1812 = new Vector.<_661>();
         this._5719 = new Vector.<_661>();
         this._5733 = new Vector.<_661>();
         var _loc3_:_661 = this._1750(-param1 / 2,-param2 / 2);
         var _loc4_:_661 = this._1750(param1 / 2,-param2 / 2);
         var _loc5_:_661 = this._1750(-param1 / 2,param2 / 2);
         var _loc6_:_661 = this._1750(param1 / 2,param2 / 2);
         this.vertices.push(_loc3_);
         this.vertices.push(_loc4_);
         this.vertices.push(_loc5_);
         this.vertices.push(_loc6_);
         this._1812.push(_loc3_.clone());
         this._1812.push(_loc4_.clone());
         this._1812.push(_loc5_.clone());
         this._1812.push(_loc6_.clone());
         this._5719.push(_loc3_.clone());
         this._5719.push(_loc4_.clone());
         this._5719.push(_loc5_.clone());
         this._5719.push(_loc6_.clone());
         this._5733.push(_loc3_.clone());
         this._5733.push(_loc4_.clone());
         this._5733.push(_loc5_.clone());
         this._5733.push(_loc6_.clone());
         var _loc7_:_655 = new _655(_loc3_,_loc4_,_loc5_);
         var _loc8_:_655 = new _655(_loc4_,_loc6_,_loc5_);
         this.triangles = new Vector.<_655>();
         this.triangles.push(_loc7_);
         this.triangles.push(_loc8_);
         this.outline = new Vector.<_661>();
         this.outline.push(_loc3_,_loc4_,_loc4_,_loc6_,_loc6_,_loc5_,_loc5_,_loc3_);
         this._5739 = new Vector.<_661>();
         this._5739.push(this._1812[0],this._1812[1],this._1812[1],this._1812[3],this._1812[3],this._1812[2],this._1812[2],this._1812[0]);
         this.userEdges = new Vector.<_661>();
         this._5253.setTo(-param1 / 2,-param2 / 2,param1,param2);
      }
      
      public function _4326() : Boolean
      {
         if(this.vertices.length == 4)
         {
            if(this.vertices[0].x == -this._5729 && this.vertices[0].y == -this._5723 && this.vertices[1].x == this._5729 && this.vertices[1].y == -this._5723 && this.vertices[2].x == -this._5729 && this.vertices[2].y == this._5723 && this.vertices[3].x == this._5729 && this.vertices[3].y == this._5723)
            {
               return true;
            }
         }
         return false;
      }
      
      public function autoOutline(param1:int = 0) : void
      {
         this._13924(this._2348,this._2343,param1);
         this.invalid = true;
      }
      
      public function _3196() : void
      {
         this._2092(this._2348,this._2343);
         this.invalid = true;
      }
      
      public function _3189() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = int(this.vertices.length);
         while(_loc1_ < _loc2_)
         {
            this._1812[_loc1_].x = this.vertices[_loc1_].x;
            this._1812[_loc1_].y = this.vertices[_loc1_].y;
            _loc1_++;
         }
         this._5736 = false;
      }
      
      public function _3183(param1:_656) : _661
      {
         var _loc2_:int = 0;
         var _loc3_:int = int(this._1812.length);
         while(_loc2_ < _loc3_)
         {
            if(this._1812[_loc2_].id == param1.id)
            {
               return this._5719[_loc2_];
            }
            _loc2_++;
         }
         return null;
      }
      
      public function _13382(param1:_656) : int
      {
         var _loc2_:int = 0;
         var _loc3_:int = int(this._1812.length);
         while(_loc2_ < _loc3_)
         {
            if(this._1812[_loc2_].id == param1.id)
            {
               return _loc2_;
            }
            _loc2_++;
         }
         return -1;
      }
      
      public function _4263(param1:_656) : _661
      {
         var _loc2_:int = 0;
         var _loc3_:int = int(this._1812.length);
         while(_loc2_ < _loc3_)
         {
            if(this._1812[_loc2_].id == param1.id)
            {
               return this._1812[_loc2_];
            }
            _loc2_++;
         }
         return null;
      }
      
      public function _5717(param1:_656) : _661
      {
         var _loc2_:int = 0;
         var _loc3_:int = int(this._1812.length);
         while(_loc2_ < _loc3_)
         {
            if(this._1812[_loc2_].id == param1.id)
            {
               return this._5733[_loc2_];
            }
            _loc2_++;
         }
         return null;
      }
      
      public function _11661(param1:_656) : _661
      {
         var _loc2_:int = 0;
         var _loc3_:int = int(this.vertices.length);
         while(_loc2_ < _loc3_)
         {
            if(this.vertices[_loc2_].id == param1.id)
            {
               return this.vertices[_loc2_];
            }
            _loc2_++;
         }
         return null;
      }
      
      public function _10798() : Mesh
      {
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:String = null;
         var _loc25_:_661 = null;
         var _loc26_:int = 0;
         var _loc28_:_661 = null;
         var _loc29_:_661 = null;
         var _loc1_:Object = new Object();
         var _loc2_:Vector.<Number> = this._2708;
         var _loc3_:Vector.<_661> = this._1812;
         var _loc4_:Vector.<uint> = this._2709;
         var _loc5_:Array = [];
         var _loc6_:Array = [];
         var _loc7_:Array = [];
         var _loc8_:Array = [];
         var _loc9_:Array = [];
         _loc10_ = 0;
         _loc11_ = int(_loc2_.length);
         while(_loc10_ < _loc11_)
         {
            _loc6_.push(Number(_loc3_[_loc10_ / 4].x.toFixed(2)),Number(_loc3_[_loc10_ / 4].y.toFixed(2)));
            _loc5_.push(Number(_loc2_[_loc10_ + 2].toFixed(5)),Number(_loc2_[_loc10_ + 3].toFixed(5)));
            _loc10_ += 4;
         }
         _loc10_ = 0;
         _loc11_ = int(_loc4_.length);
         while(_loc10_ < _loc11_)
         {
            _loc9_.push(_loc4_[_loc10_]);
            _loc10_++;
         }
         _loc10_ = 0;
         _loc11_ = int(this.outline.length);
         while(_loc10_ < _loc11_)
         {
            _loc7_.push(this.outline[_loc10_].index,this.outline[_loc10_ + 1].index);
            _loc10_ += 2;
         }
         _loc1_[_205.A_TRIANGLES] = _loc9_;
         var _loc13_:Object = this._2707();
         if(_loc13_)
         {
            _loc1_[_205.A_WEIGHTS] = _loc13_[_205.A_WEIGHTS];
            _loc1_[_205.A_SLOT_POSE] = this._2706(_loc13_[_205.A_SLOT_POSE]);
            _loc1_[_205.A_BONE_POSE] = [];
            _loc10_ = 0;
            _loc11_ = int(_loc13_[_205.A_BONE].length);
            while(_loc10_ < _loc11_)
            {
               _loc12_ = _loc13_[_205.A_BONE][_loc10_];
               _loc1_[_205.A_BONE_POSE].push(int(_loc12_));
               _loc1_[_205.A_BONE_POSE] = _loc1_[_205.A_BONE_POSE].concat(this._2706(_loc13_[_205.A_BONE_POSE][_loc12_]));
               _loc10_++;
            }
         }
         _loc10_ = 0;
         _loc11_ = int(this.userEdges.length);
         while(_loc10_ < _loc11_)
         {
            _loc8_.push(this.userEdges[_loc10_].index,this.userEdges[_loc10_ + 1].index);
            _loc10_ += 2;
         }
         var _loc14_:Array = _loc5_;
         var _loc15_:Array = _loc6_;
         var _loc16_:Number = this.maxWidth;
         var _loc17_:Number = this.maxHeight;
         var _loc18_:Number = _loc16_ / 2;
         var _loc19_:Number = _loc17_ / 2;
         var _loc20_:Object = {};
         var _loc21_:Vector.<_661> = new Vector.<_661>();
         var _loc22_:Vector.<_661> = new Vector.<_661>();
         var _loc23_:Vector.<_661> = new Vector.<_661>();
         var _loc24_:Vector.<_661> = new Vector.<_661>();
         var _loc27_:Object = {};
         var _loc30_:Mesh = new Mesh(null);
         if(_loc1_[_205.A_WEIGHTS])
         {
            this._1791(_loc1_[_205.A_WEIGHTS]);
            this._1785(_loc30_,_loc1_[_205.A_WEIGHTS],_loc1_[_205.A_SLOT_POSE],_loc1_[_205.A_BONE_POSE]);
         }
         _loc10_ = 0;
         _loc11_ = int(_loc15_.length);
         while(_loc10_ < _loc11_)
         {
            _loc26_ = _loc10_ / 2;
            _loc25_ = _loc30_._1750(_loc15_[_loc10_],_loc15_[_loc10_ + 1]);
            _loc24_.push(_loc25_.clone() as _661);
            _loc25_.x = _loc14_[_loc10_] * _loc16_ - _loc18_;
            _loc25_.y = _loc14_[_loc10_ + 1] * _loc17_ - _loc19_;
            _loc21_.push(_loc25_);
            _loc27_[_loc26_] = _loc25_;
            _loc10_ += 2;
         }
         _loc10_ = 0;
         _loc11_ = int(_loc7_.length);
         while(_loc10_ < _loc11_)
         {
            _loc28_ = _loc27_[_loc7_[_loc10_]];
            _loc29_ = _loc27_[_loc7_[_loc10_ + 1]];
            if(!(Boolean(_loc28_) && Boolean(_loc29_)))
            {
               throw new Error("this mesh data is broken!");
            }
            _loc22_.push(_loc28_,_loc29_);
            _loc10_ += 2;
         }
         if(_loc8_)
         {
            _loc10_ = 0;
            _loc11_ = int(_loc8_.length);
            while(_loc10_ < _loc11_)
            {
               _loc28_ = _loc27_[_loc8_[_loc10_]];
               _loc29_ = _loc27_[_loc8_[_loc10_ + 1]];
               if(!(Boolean(_loc28_) && Boolean(_loc29_)))
               {
                  throw new Error("this mesh data is broken!");
               }
               _loc23_.push(_loc28_,_loc29_);
               _loc10_ += 2;
            }
         }
         _loc20_._1812 = _loc24_;
         _loc20_.vertices = _loc21_;
         _loc20_.outline = _loc22_;
         _loc20_.userEdges = _loc23_;
         _loc20_.width = _loc16_;
         _loc20_.height = _loc17_;
         _loc30_._1796(_loc20_);
         return _loc30_;
      }
      
      private function _1791(param1:Array) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:String = null;
         _loc2_ = 0;
         _loc3_ = int(param1.length);
         while(_loc2_ < _loc3_)
         {
            _loc4_ = int(param1[_loc2_]);
            _loc6_ = 1;
            while(_loc6_ < _loc4_ * 2)
            {
               _loc7_ = this._1758(param1[_loc2_ + _loc6_]).name;
               if(this._10797[_loc7_])
               {
                  param1[_loc2_ + _loc6_] = this._10797[_loc7_];
               }
               else
               {
                  param1[_loc2_ + _loc6_] = _loc7_;
               }
               _loc6_ += 2;
            }
            _loc2_ += _loc4_ * 2 + 1;
         }
      }
      
      private function _1758(param1:int) : _52
      {
         return this._1802[param1];
      }
      
      private function _1785(param1:Mesh, param2:Array, param3:Array, param4:Array) : void
      {
         var _loc5_:Object = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:String = null;
         var _loc10_:Array = null;
         var _loc11_:int = 0;
         if(Boolean(param2) && param2.length > 0)
         {
            (_loc5_ = {})[_101.BONE] = param2;
            _loc5_[_101.A_SLOT_POSE] = this._1819(param3);
            _loc5_[_101.A_BONE_POSE] = [];
            _loc6_ = 0;
            _loc7_ = int(param4.length);
            while(_loc6_ < _loc7_)
            {
               _loc8_ = int(param4[_loc6_]);
               _loc9_ = this._1758(_loc8_).name;
               if(this._10797[_loc9_])
               {
                  _loc9_ = this._10797[_loc9_];
               }
               _loc10_ = [];
               _loc11_ = 0;
               while(_loc11_ < 6)
               {
                  _loc10_.push(param4[_loc6_ + 1 + _loc11_]);
                  _loc11_++;
               }
               _loc5_[_101.A_BONE_POSE].push({
                  "bone":_loc9_,
                  "pose":this._1819(_loc10_)
               });
               _loc6_ += 7;
            }
            param1._1831 = _loc5_;
         }
      }
      
      private function _1819(param1:Array) : Matrix
      {
         var _loc2_:Matrix = new Matrix();
         if(Boolean(param1) && param1.length == 6)
         {
            _loc2_.setTo(param1[0],param1[1],param1[2],param1[3],param1[4],param1[5]);
         }
         return _loc2_;
      }
      
      private function _2706(param1:Matrix) : Array
      {
         var _loc2_:Array = [];
         _loc2_.push(param1.a);
         _loc2_.push(param1.b);
         _loc2_.push(param1.c);
         _loc2_.push(param1.d);
         _loc2_.push(param1.tx);
         _loc2_.push(param1.ty);
         return _loc2_;
      }
      
      public function _3197() : Object
      {
         var _loc1_:Vector.<_661> = this.vertices.concat();
         var _loc2_:Vector.<_661> = this._1812.concat();
         var _loc3_:Vector.<_661> = this.outline.concat();
         var _loc4_:Vector.<_661> = this.userEdges.concat();
         var _loc5_:Vector.<_661> = this._5733.concat();
         var _loc6_:Vector.<_661> = this._5719.concat();
         var _loc7_:Number = this._2348;
         var _loc8_:Number = this._2343;
         return {
            "vertices":_loc1_,
            "ffd":_loc2_,
            "_1812":_loc2_,
            "_2115":_loc5_,
            "outputVertices":_loc6_,
            "outline":_loc3_,
            "userEdges":_loc4_,
            "width":_loc7_,
            "height":_loc8_
         };
      }
      
      public function _1796(param1:Object) : void
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:Vector.<_661> = null;
         var _loc9_:Vector.<_661> = null;
         var _loc2_:Vector.<_661> = param1._1812.concat();
         var _loc3_:Vector.<_661> = param1.vertices.concat();
         var _loc4_:Vector.<_661> = param1.outline.concat();
         var _loc5_:Vector.<_661> = param1.userEdges.concat();
         if(param1._2115 != null && param1.outputVertices != null)
         {
            _loc8_ = param1._2115.concat();
            _loc9_ = param1.outputVertices.concat();
         }
         if(param1.height)
         {
            this._2343 = param1.height;
            this._5723 = this._2343 / 2;
         }
         if(param1.width)
         {
            this._2348 = param1.width;
            this._5729 = this._2348 / 2;
         }
         if(_loc3_ && _loc3_.length >= 3 && _loc4_ && _loc4_.length >= 6 && Boolean(_loc5_))
         {
            this.vertices = _loc3_;
            this.outline = _loc4_;
            this.userEdges = _loc5_;
            this._1812 = _loc2_;
            this._5719 = _loc9_;
            this._5733 = _loc8_;
            this._5728();
            this._5720();
            this._3165();
         }
      }
      
      private function _5728() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         if(this._1812 == null)
         {
            return;
         }
         if(this._5719 == null)
         {
            this._5719 = new Vector.<_661>();
            this._5719.length = this._1812.length;
            _loc1_ = 0;
            _loc2_ = int(this._1812.length);
            while(_loc1_ < _loc2_)
            {
               this._5719[_loc1_] = this._1812[_loc1_].clone() as _661;
               _loc1_++;
            }
         }
         if(this._5733 == null)
         {
            this._5733 = new Vector.<_661>();
            this._5733.length = this._1812.length;
            _loc1_ = 0;
            _loc2_ = int(this._1812.length);
            while(_loc1_ < _loc2_)
            {
               this._5733[_loc1_] = this._1812[_loc1_].clone() as _661;
               _loc1_++;
            }
         }
      }
      
      public function _3143() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         _loc1_ = 0;
         _loc2_ = int(this._1812.length);
         while(_loc1_ < _loc2_)
         {
            if(this._1812[_loc1_].id == this._5719[_loc1_].id)
            {
               this._1812[_loc1_].x = this._5719[_loc1_].x;
               this._1812[_loc1_].y = this._5719[_loc1_].y;
               this._5733[_loc1_].x = this._5719[_loc1_].x;
               this._5733[_loc1_].y = this._5719[_loc1_].y;
            }
            _loc1_++;
         }
      }
      
      private function _5715() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         _loc1_ = 0;
         _loc2_ = int(this._1812.length);
         while(_loc1_ < _loc2_)
         {
            if(this._1812[_loc1_].id == this._5733[_loc1_].id)
            {
               this._1812[_loc1_].x = this._5733[_loc1_].x;
               this._1812[_loc1_].y = this._5733[_loc1_].y;
            }
            _loc1_++;
         }
      }
      
      private function _5720() : void
      {
         if(this._5739 == null)
         {
            this._5739 = new Vector.<_661>();
         }
         else
         {
            this._5739.length = 0;
         }
         var _loc1_:int = 0;
         var _loc2_:int = int(this.outline.length);
         while(_loc1_ < _loc2_)
         {
            this._5739.push(this._3183(this.outline[_loc1_]));
            _loc1_++;
         }
      }
      
      public function empty() : void
      {
         this._5718 = true;
         this.vertices.length = 0;
         this._1812.length = 0;
         this._5719.length = 0;
         this._5733.length = 0;
         this.outline.length = 0;
         this._5739.length = 0;
         this.userEdges.length = 0;
         this.triangles.length = 0;
         if(this.meshRig)
         {
            this.meshRig._3195();
         }
         this.meshRig = null;
      }
      
      public function _1750(param1:Number = 0, param2:Number = 0) : _661
      {
         return new _661(param1,param2,this._5748++);
      }
      
      public function _5721(param1:Number, param2:Number) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         _loc3_ = 0;
         _loc4_ = int(this._5719.length);
         while(_loc3_ < _loc4_)
         {
            this._5719[_loc3_].x += param1;
            this._5719[_loc3_].y += param2;
            _loc3_++;
         }
         this._3144();
      }
      
      public function _3167(param1:_661, param2:_661, param3:Boolean = true) : void
      {
         this.vertices.push(param1);
         if(param2 == null)
         {
            this._5736 = true;
         }
         else
         {
            this._1812.push(param2);
            this._5719.push(param2.clone());
            this._5733.push(param2.clone());
         }
         this._5718 = true;
         if(param3)
         {
            this._3165();
         }
      }
      
      public function _3182(param1:_661, param2:_661, param3:int, param4:Boolean = true) : void
      {
         this.vertices.splice(param3,0,param1);
         if(param2 == null)
         {
            this._5736 = true;
         }
         else
         {
            this._1812.splice(param3,0,param2);
            this._5719.splice(param3,0,param2.clone());
            this._5733.splice(param3,0,param2.clone());
         }
         this._5718 = true;
         if(param4)
         {
            this._3165();
         }
      }
      
      public function _3161(param1:_661, param2:_661, param3:Boolean = true) : void
      {
         var _loc4_:int = int(this.vertices.indexOf(param1));
         if(_loc4_ > -1)
         {
            if(param2 != null)
            {
               if(!this._5736)
               {
                  this._1812.splice(_loc4_,1);
                  this._5719.splice(_loc4_,1);
                  this._5733.splice(_loc4_,1);
               }
            }
            else
            {
               this._5736 = true;
            }
            this.vertices.splice(_loc4_,1);
            this._5718 = true;
            if(param3)
            {
               this._3165();
            }
         }
      }
      
      public function _12550(param1:_661, param2:Number, param3:Number) : void
      {
         if(param1.x != param2 || param1.y != param3)
         {
            param1.x = param2;
            param1.y = param3;
         }
      }
      
      public function _3190(param1:_661, param2:Number, param3:Number) : void
      {
         if(param1.x != param2 || param1.y != param3)
         {
            param1.x = param2;
            param1.y = param3;
            this._3165();
         }
      }
      
      public function _3166(param1:_661, param2:_661, param3:Boolean = true) : void
      {
         this.outline.push(param1);
         this.outline.push(param2);
         if(!this._5736)
         {
            this._5739.push(this._3183(param1),this._3183(param2));
         }
         this._5718 = true;
         if(param3)
         {
            this._3165();
         }
      }
      
      public function _3160(param1:_661, param2:_661, param3:Boolean = true) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         _loc4_ = 0;
         _loc5_ = int(this.outline.length);
         while(_loc4_ < _loc5_)
         {
            if(this.outline[_loc4_] == param1 && this.outline[_loc4_ + 1] == param2 || this.outline[_loc4_] == param2 && this.outline[_loc4_ + 1] == param1)
            {
               this.outline.splice(_loc4_,2);
               this._5739.splice(_loc4_,2);
               this._5718 = true;
               if(param3)
               {
                  this._3165();
               }
               return;
            }
            _loc4_ += 2;
         }
      }
      
      public function _3164(param1:_661, param2:_661, param3:Boolean = true) : void
      {
         this.userEdges.push(param1);
         this.userEdges.push(param2);
         this._5718 = true;
         if(param3)
         {
            this._3165();
         }
      }
      
      public function _3159(param1:_661, param2:_661, param3:Boolean = true) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         _loc4_ = 0;
         _loc5_ = int(this.userEdges.length);
         while(_loc4_ < _loc5_)
         {
            if(this.userEdges[_loc4_] == param1 && this.userEdges[_loc4_ + 1] == param2 || this.userEdges[_loc4_] == param2 && this.userEdges[_loc4_ + 1] == param1)
            {
               this.userEdges.splice(_loc4_,2);
               this._5718 = true;
               if(param3)
               {
                  this._3165();
               }
               return;
            }
            _loc4_ += 2;
         }
      }
      
      public function _3165() : void
      {
         this.triangles = _653._5674(Vector.<_656>(this.vertices),Vector.<_656>(this.outline),Vector.<_656>(this.userEdges));
         this.invalid = true;
         this._5718 = false;
      }
      
      public function get maxWidth() : Number
      {
         return this._2348;
      }
      
      public function get maxHeight() : Number
      {
         return this._2343;
      }
      
      public function get _14668() : Vector.<Number>
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         if(this._5736)
         {
            this._3189();
         }
         this._14690.length = 0;
         _loc1_ = 0;
         _loc2_ = int(this.vertices.length);
         while(_loc1_ < _loc2_)
         {
            _loc3_ = this.vertices[_loc1_].x;
            _loc4_ = this.vertices[_loc1_].y;
            _loc5_ = (_loc3_ + this._5729) / this._2348;
            _loc6_ = (_loc4_ + this._5723) / this._2343;
            this._14690.push(_loc5_,_loc6_);
            _loc1_++;
         }
         return this._14690;
      }
      
      public function get _14663() : Vector.<Number>
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         if(this._5736)
         {
            this._3189();
         }
         this._14689.length = 0;
         _loc1_ = 0;
         _loc2_ = int(this._5719.length);
         while(_loc1_ < _loc2_)
         {
            _loc3_ = this._5719[_loc1_].x;
            _loc4_ = this._5719[_loc1_].y;
            this._14689.push(_loc3_,_loc4_);
            _loc1_++;
         }
         return this._14689;
      }
      
      public function get _2708() : Vector.<Number>
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         if(this._5736)
         {
            this._3189();
         }
         this._5737.length = 0;
         _loc1_ = 0;
         _loc2_ = int(this.vertices.length);
         while(_loc1_ < _loc2_)
         {
            _loc3_ = this.vertices[_loc1_].x;
            _loc4_ = this.vertices[_loc1_].y;
            _loc5_ = (_loc3_ + this._5729) / this._2348;
            _loc6_ = (_loc4_ + this._5723) / this._2343;
            _loc3_ = this._5719[_loc1_].x;
            _loc4_ = this._5719[_loc1_].y;
            this._5737.push(_loc3_,_loc4_,_loc5_,_loc6_);
            _loc1_++;
         }
         return this._5737;
      }
      
      public function get _2709() : Vector.<uint>
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         this._5743.length = 0;
         _loc1_ = 0;
         _loc2_ = int(this.vertices.length);
         while(_loc1_ < _loc2_)
         {
            this.vertices[_loc1_].index = _loc1_;
            _loc1_++;
         }
         _loc1_ = 0;
         _loc2_ = int(this.triangles.length);
         while(_loc1_ < _loc2_)
         {
            this._5743.push(this.triangles[_loc1_]._4260.index,this.triangles[_loc1_].bp.index,this.triangles[_loc1_].cp.index);
            _loc1_++;
         }
         return this._5743;
      }
      
      public function get _5746() : Vector.<Number>
      {
         return this._5742;
      }
      
      public function get _1854() : BitmapData
      {
         return this._2109;
      }
      
      public function get _1826() : BitmapData
      {
         return this._5745;
      }
      
      public function get AABB() : Rectangle
      {
         if(this._5718)
         {
            return null;
         }
         return this._5253;
      }
      
      public function _5735(param1:_860) : void
      {
         if(this.reference.indexOf(param1) >= 0)
         {
            return;
         }
         this.reference.push(param1);
         if(!this.invalid)
         {
            param1._5724 = this._5745;
         }
         else
         {
            this.update();
         }
      }
      
      public function _5725(param1:_860) : void
      {
         var _loc2_:int = int(this.reference.indexOf(param1));
         if(_loc2_ >= 0)
         {
            this.reference.splice(_loc2_,1);
         }
      }
      
      public function hitTest(param1:Point) : Boolean
      {
         this._5720();
         return _654._4252(param1,Vector.<_656>(this._5739));
      }
      
      public function update() : void
      {
         var i:int = 0;
         var len:int = 0;
         if(this.invalid)
         {
            this._2886();
            if(this.meshRig)
            {
               this.meshRig._5716();
            }
            this._3144();
            if(this._5253 == null || this._5253.width <= 0 || this._5253.height <= 0)
            {
               return;
            }
            if(this._5745 != null)
            {
               this._5745.dispose();
               this._5745 = null;
            }
            try
            {
               this._2109.width;
               this._5745 = new BitmapData(this._5253.width,this._5253.height,true,4278255615);
               if(_879.ready)
               {
                  _879.instance._5738(this._5253.width,this._5253.height,-this._5253.x,-this._5253.y,this,this._5745);
                  this.invalid = false;
               }
               i = 0;
               len = int(this.reference.length);
               while(i < len)
               {
                  this.reference[i]._5744 = false;
                  this.reference[i]._5747 = false;
                  this.reference[i]._5724 = this._5745;
                  i++;
               }
            }
            catch(e:Error)
            {
               return;
            }
         }
      }
      
      public function set _2104(param1:_725) : void
      {
         if(this._2101)
         {
            this._2101._5725(this);
         }
         this._2101 = param1;
         if(this._2101)
         {
            this._2101._5735(this);
         }
      }
      
      public function set _5724(param1:Object) : void
      {
         if(param1 is BitmapData && !this._5740 && !this._5741)
         {
            this._2103(param1 as BitmapData);
         }
      }
      
      public function set _5747(param1:Boolean) : void
      {
         this._5741 = param1;
      }
      
      public function get _5747() : Boolean
      {
         return this._5741;
      }
      
      public function set _5744(param1:Boolean) : void
      {
         this._5740 = param1;
      }
      
      public function get _5744() : Boolean
      {
         return this._5740;
      }
      
      public function get _1903() : _13507
      {
         return this._2098;
      }
      
      public function set _1903(param1:_13507) : void
      {
         this._2098 = param1;
         this.invalid = true;
      }
      
      public function get _2118() : Vector.<_661>
      {
         return this._5719;
      }
      
      public function get _3142() : Vector.<Number>
      {
         if(this._2093)
         {
            return this._2093;
         }
         if(this._2098)
         {
            return this._2098._1910;
         }
         return null;
      }
      
      public function set _2094(param1:Vector.<Number>) : void
      {
         this._2093 = param1;
         this.invalid = true;
      }
      
      public function get _2094() : Vector.<Number>
      {
         return this._2093;
      }
      
      public function get _2102() : Vector.<_661>
      {
         return this._5719;
      }
      
      public function get _2115() : Vector.<_661>
      {
         return this._5733;
      }
      
      public function get meshRig() : _660
      {
         return this._4285;
      }
      
      public function set meshRig(param1:_660) : void
      {
         this._4285 = param1;
         this.invalid = true;
      }
      
      public function _3144() : void
      {
         var _loc1_:Number = Number.MAX_VALUE;
         var _loc2_:Number = Number.MAX_VALUE;
         var _loc3_:Number = -Number.MAX_VALUE;
         var _loc4_:Number = -Number.MAX_VALUE;
         var _loc5_:int = 0;
         var _loc6_:int = int(this._2118.length);
         while(_loc5_ < _loc6_)
         {
            if(this._2118[_loc5_].x > _loc3_)
            {
               _loc3_ = this._2118[_loc5_].x;
            }
            if(this._2118[_loc5_].x < _loc1_)
            {
               _loc1_ = this._2118[_loc5_].x;
            }
            if(this._2118[_loc5_].y > _loc4_)
            {
               _loc4_ = this._2118[_loc5_].y;
            }
            if(this._2118[_loc5_].y < _loc2_)
            {
               _loc2_ = this._2118[_loc5_].y;
            }
            _loc5_++;
         }
         this._5253.x = _loc1_;
         this._5253.y = _loc2_;
         this._5253.width = _loc3_ - _loc1_;
         this._5253.height = _loc4_ - _loc2_;
         if(this._5253.width > _879.MAX_SIZE)
         {
            this._5253.width = _879.MAX_SIZE;
         }
         else if(this._5253.width < _879.MIN_SIZE)
         {
            this._5253.width = _879.MIN_SIZE;
         }
         if(this._5253.height > _879.MAX_SIZE)
         {
            this._5253.height = _879.MAX_SIZE;
         }
         else if(this._5253.height <= _879.MIN_SIZE)
         {
            this._5253.height = _879.MIN_SIZE;
         }
         this._5732();
      }
      
      private function _5732() : void
      {
         var _loc3_:_661 = null;
         var _loc1_:Number = 0;
         var _loc2_:Number = 0;
         var _loc4_:int = 0;
         var _loc5_:int = int(this.outline.length);
         while(_loc4_ < _loc5_)
         {
            _loc3_ = this._3183(this.outline[_loc4_]);
            _loc1_ += _loc3_.x;
            _loc2_ += _loc3_.y;
            _loc4_ += 2;
         }
         _loc5_ /= 2;
         _loc1_ /= _loc5_;
         _loc2_ /= _loc5_;
         this._2162.tx = _loc1_;
         this._2162.ty = _loc2_;
         this.globalTransform.x = this._2162.tx;
         this.globalTransform.y = this._2162.ty;
      }
      
      private function _2886() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:Vector.<Number> = null;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         this._2111 = null;
         if(this._2098 != null && Boolean(this._2098._1910))
         {
            this._2111 = this._2098._1910;
         }
         if(this._2094)
         {
            _loc3_ = this._2094;
         }
         else if(this._2111)
         {
            if(this._2115.length == 0)
            {
               _loc1_ = 0;
               _loc2_ = this._1812.length * 2;
               while(_loc1_ < _loc2_)
               {
                  this._3142[_loc1_] = 0;
                  _loc1_++;
               }
            }
            _loc3_ = this._2111;
         }
         if(this._1812)
         {
            _loc1_ = 0;
            _loc2_ = int(this._1812.length);
            while(_loc1_ < _loc2_)
            {
               _loc4_ = 0;
               _loc5_ = 0;
               if(_loc3_)
               {
                  if(_loc1_ * 2 < _loc3_.length)
                  {
                     _loc4_ = _loc3_[_loc1_ * 2];
                  }
                  if(_loc1_ * 2 + 1 < _loc3_.length)
                  {
                     _loc5_ = _loc3_[_loc1_ * 2 + 1];
                  }
               }
               if(this._2119())
               {
                  this._5733[_loc1_].x = this._1812[_loc1_].x + _loc4_;
                  this._5733[_loc1_].y = this._1812[_loc1_].y + _loc5_;
               }
               else
               {
                  this._5719[_loc1_].x = this._1812[_loc1_].x + _loc4_;
                  this._5719[_loc1_].y = this._1812[_loc1_].y + _loc5_;
               }
               _loc1_++;
            }
         }
         else
         {
            _loc1_ = 0;
            _loc2_ = int(this._1812.length);
            while(_loc1_ < _loc2_)
            {
               if(this._2119())
               {
                  this._5733[_loc1_].x = this._1812[_loc1_].x;
                  this._5733[_loc1_].y = this._1812[_loc1_].y;
               }
               else
               {
                  this._5719[_loc1_].x = this._1812[_loc1_].x;
                  this._5719[_loc1_].y = this._1812[_loc1_].y;
               }
               _loc1_++;
            }
         }
      }
      
      public function dispose() : void
      {
         this._2104 = null;
      }
      
      public function _1789(param1:_50, param2:_79) : void
      {
         if(this._1831)
         {
            this.meshRig = new _660(this,null);
            this.meshRig._1789(this,param1,param2,this._1831);
            this.meshRig._5716();
            this._5732();
         }
      }
      
      public function _2707() : Object
      {
         if(this.meshRig)
         {
            return this.meshRig._5726();
         }
         return null;
      }
      
      public function _2119() : Boolean
      {
         return this.meshRig != null;
      }
      
      public function _1751() : void
      {
         if(this.meshRig)
         {
            this.invalid = true;
            this.update();
         }
      }
      
      public function _3023(param1:_86) : void
      {
         var _loc2_:Matrix = new Matrix();
         _88._2013(param1,_loc2_);
         this._5722.copyFrom(this._2162);
         this._5722.invert();
         this._5722.concat(_loc2_);
         this._5722.concat(this._2162);
         this.meshRig._5727(this._5722);
         this._5715();
         this.invalid = true;
      }
      
      public function _3148() : void
      {
         this.meshRig._3145();
         this._5715();
      }
      
      public function _3145() : void
      {
         if(Boolean(this.meshRig) && this.meshRig._2922.length > 0)
         {
            this.meshRig._3145();
         }
      }
      
      public function _3138() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         if(this.meshRig == null || this.meshRig._2922.length == 0)
         {
            _loc1_ = 0;
            _loc2_ = int(this._5719.length);
            while(_loc1_ < _loc2_)
            {
               this._5733[_loc1_].x = this._5719[_loc1_].x;
               this._5733[_loc1_].y = this._5719[_loc1_].y;
               _loc1_++;
            }
         }
      }
      
      public function _4251(param1:_661) : _662
      {
         if(this.meshRig)
         {
            return this.meshRig._4251(param1);
         }
         return null;
      }
      
      public function _3162(param1:_661, param2:_661, param3:Boolean = true, param4:_662 = null) : _662
      {
         this._3167(param1,param2,param3);
         var _loc5_:_661 = this._3183(param2);
         var _loc6_:_661 = this._5717(param1);
         if(param4)
         {
            param4._5734(_loc6_,_loc5_);
         }
         return this.meshRig._3167(param2,_loc5_,param4);
      }
      
      public function _3180(param1:_661, param2:_661, param3:int, param4:Boolean = true, param5:_662 = null) : _662
      {
         this._3182(param1,param2,param3,param4);
         var _loc6_:_661 = this._3183(param2);
         var _loc7_:_661 = this._5717(param1);
         if(param5)
         {
            param5._5734(_loc7_,_loc6_);
         }
         return this.meshRig._3167(param2,_loc6_,param5);
      }
      
      public function _3158(param1:_661, param2:_661, param3:Boolean = true) : _662
      {
         this._3161(param1,param2,param3);
         return this.meshRig._3161(param2);
      }
      
      public function _12508() : Mesh
      {
         var _loc1_:Object = this._12703();
         var _loc2_:Mesh = new Mesh(null);
         _loc2_._1796(_loc1_);
         return _loc2_;
      }
      
      public function _12703() : Object
      {
         var _loc1_:Vector.<_661> = _661._12507(this.vertices);
         var _loc2_:Vector.<_661> = _661._12507(this._1812);
         var _loc3_:Vector.<_661> = _661._12702(this.outline,_loc1_);
         var _loc4_:Vector.<_661> = _661._12702(this.userEdges,_loc1_);
         var _loc5_:Vector.<_661> = _661._12507(this._5733);
         var _loc6_:Vector.<_661> = _661._12507(this._5719);
         var _loc7_:Number = this._2348;
         var _loc8_:Number = this._2343;
         return {
            "vertices":_loc1_,
            "ffd":_loc2_,
            "_1812":_loc2_,
            "_2115":_loc5_,
            "outputVertices":_loc6_,
            "outline":_loc3_,
            "userEdges":_loc4_,
            "width":_loc7_,
            "height":_loc8_
         };
      }
   }
}

