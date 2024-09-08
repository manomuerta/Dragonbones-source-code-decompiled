package _859
{
   import _11220._11219;
   import _658._661;
   import _724._725;
   import egret.core._1140;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   
   public class _11257 extends _1140 implements _860, _858
   {
      public const LINE_ALPHA:Number = 0.3;
      
      public const FILL_ALPHA:Number = 0.2;
      
      private var _5741:Boolean;
      
      private var _5740:Boolean;
      
      private var _6359:_725;
      
      private var _5253:Rectangle;
      
      private var _11383:_11219;
      
      public function _11257()
      {
         super();
      }
      
      public function set _11278(param1:_11219) : void
      {
         this._11383 = param1;
         this._5253 = null;
      }
      
      private function _11444() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:_661 = null;
         var _loc4_:_661 = null;
         this.graphics.clear();
         if(this._11383 && this._11383.vertices && this._11383.vertices.length >= 3)
         {
            _loc2_ = int(this._11383.vertices.length);
            this.graphics.lineStyle(1,this._11383.color,this.LINE_ALPHA);
            this.graphics.beginFill(this._11383.color,this.FILL_ALPHA);
            _loc1_ = 0;
            while(_loc1_ < _loc2_)
            {
               _loc3_ = this._11383.vertices[_loc1_];
               if(_loc1_ == 0)
               {
                  _loc4_ = _loc3_;
                  this.graphics.moveTo(_loc3_.x,_loc3_.y);
               }
               else
               {
                  this.graphics.lineTo(_loc3_.x,_loc3_.y);
               }
               _loc1_++;
            }
            this.graphics.lineTo(_loc4_.x,_loc4_.y);
            this.graphics.endFill();
         }
      }
      
      public function set _2104(param1:_725) : void
      {
         this._6359 = param1;
         if(this._11383 != null)
         {
            this._11444();
         }
      }
      
      public function set _5724(param1:Object) : void
      {
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
      
      public function dispose() : void
      {
      }
      
      public function get AABB() : Rectangle
      {
         if(this._5253 == null)
         {
            this._5253 = this._11383.AABB;
         }
         return this._5253;
      }
      
      public function get matrix() : Matrix
      {
         return transform.matrix;
      }
   }
}

