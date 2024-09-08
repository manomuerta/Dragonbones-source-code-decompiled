package _658
{
   import _51._52;
   import _652._654;
   import flash.geom.Matrix;
   import flash.geom.Point;
   
   public class _662
   {
      private const MIN_WEIGHT:Number = 0.001;
      
      private const MAX_WEIGHT:Number = 1;
      
      public var id:uint;
      
      private var _2138:Vector.<_52>;
      
      private var _5766:Vector.<Matrix>;
      
      private var _5771:Vector.<Matrix>;
      
      private var _5777:Vector.<Number>;
      
      private var _5776:Vector.<Number>;
      
      private var _5778:Point;
      
      private var _2205:Matrix;
      
      private var _5773:Matrix;
      
      private var _4235:Point;
      
      private var _5774:Number;
      
      private var _5775:_661;
      
      private var _5770:_661;
      
      private var _5769:_661;
      
      private var _5755:Matrix;
      
      private var _5767:Boolean;
      
      private var _5765:Matrix;
      
      public function _662(param1:_661, param2:_661, param3:Matrix)
      {
         super();
         this._5775 = param1;
         this.id = param1.id;
         this._5770 = param2;
         this._2138 = new Vector.<_52>();
         this._5771 = new Vector.<Matrix>();
         this._5766 = new Vector.<Matrix>();
         this._5777 = new Vector.<Number>();
         this._5776 = new Vector.<Number>();
         this._5778 = new Point();
         this._2205 = new Matrix();
         this._5773 = new Matrix();
         this._4235 = new Point();
         this._5755 = new Matrix();
         this._5755.copyFrom(param3);
      }
      
      public function _5734(param1:_661, param2:_661) : void
      {
         this._5775 = param1;
         this._5770 = param2;
      }
      
      public function _5758(param1:Matrix) : void
      {
         this._5767 = true;
         this._5765 = param1;
         this._5761();
         this._3145();
      }
      
      public function _5753(param1:_52, param2:Number, param3:Matrix = null) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(this._2138.indexOf(param1) != -1)
         {
            return;
         }
         if(param2 > 0)
         {
            _loc4_ = 0;
            _loc5_ = int(this._2138.length);
            while(_loc4_ < _loc5_)
            {
               if(param2 == 1)
               {
                  this._5777[_loc4_] = 0;
               }
               else
               {
                  this._5777[_loc4_] -= this._5777[_loc4_] * param2;
               }
               _loc4_++;
            }
         }
         this._3206(param1,param2,param3);
      }
      
      public function _5752(param1:_52) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:Number = this._5208(param1);
         if(_loc2_ > 0)
         {
            _loc3_ = 0;
            _loc4_ = int(this._2138.length);
            while(_loc3_ < _loc4_)
            {
               if(this._2138[_loc3_] != param1)
               {
                  if(_loc2_ < 1)
                  {
                     this._5777[_loc3_] += this._5777[_loc3_] / (1 - _loc2_) * _loc2_;
                  }
               }
               _loc3_++;
            }
         }
         this._3206(param1,0);
      }
      
      private function addBone(param1:_52, param2:Number, param3:Matrix) : void
      {
         this._2138.push(param1);
         this._5777.push(param2);
         var _loc4_:Matrix = new Matrix();
         _loc4_.copyFrom(param3);
         _loc4_.invert();
         this._5766.push(_loc4_);
      }
      
      public function _2975(param1:_52, param2:Matrix) : void
      {
         var _loc4_:Matrix = null;
         var _loc3_:int = int(this._2138.indexOf(param1));
         if(_loc3_ > -1)
         {
            _loc4_ = this._5766[_loc3_];
            _loc4_.copyFrom(param2);
            _loc4_.invert();
         }
      }
      
      public function _3206(param1:_52, param2:Number, param3:Matrix = null) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc4_:int = int(this._2138.indexOf(param1));
         if(_loc4_ == -1)
         {
            if(param2 > 0)
            {
               if(param3 == null)
               {
                  param3 = param1._2009;
               }
               this.addBone(param1,param2,param3);
            }
         }
         else
         {
            this._5777[_loc4_] = param2;
            if(param2 == 0)
            {
               this._5772(_loc4_);
            }
            else if(param3)
            {
               this._2205.copyFrom(param3);
               this._2205.invert();
               this._5766[_loc4_].copyFrom(this._2205);
            }
         }
      }
      
      private function _5772(param1:int) : void
      {
         this._2138.splice(param1,1);
         this._5777.splice(param1,1);
         this._5766.splice(param1,1);
      }
      
      public function _5208(param1:_52) : Number
      {
         var _loc2_:int = int(this._2138.indexOf(param1));
         if(_loc2_ != -1)
         {
            return this._5777[_loc2_];
         }
         return 0;
      }
      
      public function _5768() : _52
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:Number = -1;
         var _loc4_:int = 0;
         _loc1_ = 0;
         _loc2_ = int(this._2138.length);
         while(_loc1_ < _loc2_)
         {
            if(this._5777[_loc1_] > _loc3_)
            {
               _loc3_ = this._5777[_loc1_];
               _loc4_ = _loc1_;
            }
            _loc1_++;
         }
         return this._2138[_loc4_];
      }
      
      public function _5761() : Point
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         if(this._2138.length > 0)
         {
            _loc1_ = 0;
            _loc2_ = int(this._2138.length);
            while(_loc1_ < _loc2_)
            {
               this._2205.copyFrom(this._5766[_loc1_]);
               this._2205.concat(this._2138[_loc1_]._2009);
               this._5774 = this._5777[_loc1_];
               _654._5693(this._2205,this._5774);
               if(_loc1_ == 0)
               {
                  this._5773.copyFrom(this._2205);
               }
               else
               {
                  _654._5700(this._5773,this._2205);
               }
               _loc1_++;
            }
            if(this._5767)
            {
               this._5773.concat(this._5765);
            }
            this._5778.x = this._5775.x;
            this._5778.y = this._5775.y;
            this._2205.copyFrom(this._5755);
            this._2205.concat(this._5773);
            this._5778 = this._2205.transformPoint(this._5778);
            this._5770.x = this._5778.x;
            this._5770.y = this._5778.y;
         }
         else
         {
            this._5778.x = this._5775.x;
            this._5778.y = this._5775.y;
            this._2205.copyFrom(this._5755);
            this._5778 = this._2205.transformPoint(this._5778);
            this._5770.x = this._5778.x;
            this._5770.y = this._5778.y;
         }
         return this._5778;
      }
      
      public function _3145() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = int(this._2138.length);
         while(_loc1_ < _loc2_)
         {
            this._2205.copyFrom(this._5766[_loc1_]);
            this._2205.concat(this._2138[_loc1_]._2009);
            this._5774 = this._5777[_loc1_];
            _654._5693(this._2205,this._5774);
            if(_loc1_ == 0)
            {
               this._5773.copyFrom(this._2205);
            }
            else
            {
               _654._5700(this._5773,this._2205);
            }
            _loc1_++;
         }
         this._4235.x = this._5770.x;
         this._4235.y = this._5770.y;
         this._2205.copyFrom(this._5755);
         this._2205.concat(this._5773);
         this._2205.invert();
         this._4235 = this._2205.transformPoint(this._4235);
         this._5775.x = this._4235.x;
         this._5775.y = this._4235.y;
         this._5767 = false;
      }
      
      public function _5726() : Array
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc1_:Array = [];
         _loc2_ = 0;
         _loc3_ = int(this._2138.length);
         while(_loc2_ < _loc3_)
         {
            if(this._5777[_loc2_] > 0)
            {
               _loc1_.push(this._5762(this._2138[_loc2_]));
               _loc1_.push(this._5777[_loc2_]);
            }
            _loc2_++;
         }
         return _loc1_;
      }
      
      private function _5762(param1:_52) : int
      {
         return param1.rootArmatureData._1779.indexOf(param1);
      }
      
      public function get _4253() : _661
      {
         return this._5775;
      }
      
      public function get isEmpty() : Boolean
      {
         var _loc2_:int = 0;
         var _loc1_:Number = 0;
         var _loc3_:int = int(this._5777.length);
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            _loc1_ += this._5777[_loc2_];
            _loc2_++;
         }
         return _loc1_ == 0;
      }
      
      public function get bones() : Vector.<_52>
      {
         return this._2138;
      }
      
      public function get weights() : Vector.<Number>
      {
         return this._5777;
      }
      
      public function get vertex() : Point
      {
         return this._5778;
      }
   }
}

