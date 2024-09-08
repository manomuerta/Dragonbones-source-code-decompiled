package _859
{
   import _658.Mesh;
   import _724._725;
   import _880._879;
   import egret.core._1140;
   import flash.display.BitmapData;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   
   public class _14094 extends _1140 implements _860, _858
   {
      protected static var _3689:Matrix = new Matrix();
      
      private var _5741:Boolean;
      
      private var _5740:Boolean;
      
      private var _6359:_725;
      
      private var _5253:Rectangle;
      
      private var _5424:BitmapData;
      
      private var _6360:BitmapData;
      
      private var _2123:Mesh;
      
      private var _14689:Vector.<Number>;
      
      private var _5743:Vector.<int>;
      
      private var _14690:Vector.<Number>;
      
      public function _14094()
      {
         super();
      }
      
      public function get AABB() : Rectangle
      {
         return this._5253;
      }
      
      public function get matrix() : Matrix
      {
         return transform.matrix;
      }
      
      public function _4242(param1:Vector.<Number>, param2:Vector.<int>, param3:Vector.<Number>) : void
      {
         this._14689 = param1;
         this._5743 = param2;
         this._14690 = param3;
      }
      
      public function set _2104(param1:_725) : void
      {
         if(this._6359 != param1 || this._6359 != null)
         {
            if(this._6359 != null)
            {
               this._6359._5725(this);
            }
            this._6359 = param1;
            if(this._6359 != null)
            {
               this._6359._5735(this);
            }
         }
      }
      
      public function set _5724(param1:Object) : void
      {
         if(this._2123 == null)
         {
            return;
         }
         if(this._5424 != param1 || this._2123.invalid)
         {
            graphics.clear();
            if(param1 is BitmapData)
            {
               this._5424 = param1 as BitmapData;
               this._6218();
            }
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
      
      public function set mesh(param1:Mesh) : void
      {
         this._2123 = param1;
      }
      
      public function get mesh() : Mesh
      {
         return this._2123;
      }
      
      private function _6218() : void
      {
         if(Boolean(this._14689) && Boolean(this._5424))
         {
            this._3144();
            _3689.setTo(1,0,0,1,0,0);
            graphics.beginBitmapFill(this._5424,_3689,false,true);
            graphics.drawTriangles(this._14689,this._5743,this._14690);
            graphics.endFill();
         }
      }
      
      public function _3144() : void
      {
         if(this._5253 == null)
         {
            this._5253 = new Rectangle();
         }
         var _loc1_:Number = Number.MAX_VALUE;
         var _loc2_:Number = Number.MAX_VALUE;
         var _loc3_:Number = -Number.MAX_VALUE;
         var _loc4_:Number = -Number.MAX_VALUE;
         var _loc5_:int = 0;
         var _loc6_:int = int(this._14689.length);
         while(_loc5_ < _loc6_)
         {
            if(this._14689[_loc5_] > _loc3_)
            {
               _loc3_ = this._14689[_loc5_];
            }
            if(this._14689[_loc5_] < _loc1_)
            {
               _loc1_ = this._14689[_loc5_];
            }
            if(this._14689[_loc5_ + 1] > _loc4_)
            {
               _loc4_ = this._14689[_loc5_ + 1];
            }
            if(this._14689[_loc5_ + 1] < _loc2_)
            {
               _loc2_ = this._14689[_loc5_ + 1];
            }
            _loc5_ += 2;
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
      }
      
      public function dispose() : void
      {
         this._2104 = null;
         this.mesh = null;
         this._6359 = null;
         this._6360 = null;
         this._5253 = null;
         graphics.clear();
      }
   }
}

