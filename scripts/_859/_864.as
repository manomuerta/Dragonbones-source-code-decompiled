package _859
{
   import _658.Mesh;
   import _724._725;
   import egret.core._1140;
   import flash.display.BitmapData;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   
   public class _864 extends _1140 implements _860, _858
   {
      protected static var _3689:Matrix = new Matrix();
      
      private var _5741:Boolean;
      
      private var _5740:Boolean;
      
      private var _6359:_725;
      
      private var _5253:Rectangle;
      
      private var _5424:BitmapData;
      
      private var _6360:BitmapData;
      
      private var _2123:Mesh;
      
      public function _864()
      {
         super();
      }
      
      public function get AABB() : Rectangle
      {
         if(this._5253 == null && Boolean(this._2123))
         {
            if(this._2123.AABB == null)
            {
               this._2123._3144();
            }
            this._5253 = this._2123.AABB;
         }
         return this._5253;
      }
      
      public function get matrix() : Matrix
      {
         return transform.matrix;
      }
      
      public function set _2104(param1:_725) : void
      {
         if(this._6359 != param1 || this._6359 != null)
         {
            this._6359 = param1;
            if(this._2123)
            {
               this._2123._2104 = param1;
            }
            this.mesh = this._2123;
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
         this._5253 = this._2123.AABB;
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
         if(this._2123)
         {
            this._2123._5725(this);
         }
         this._2123 = param1;
         if(this._2123)
         {
            this._2123._5735(this);
         }
      }
      
      public function get mesh() : Mesh
      {
         return this._2123;
      }
      
      private function _6218() : void
      {
         this._6360 = this._2123._1826;
         if(this._6360)
         {
            this._5253 = this._2123.AABB;
            if(this._5253)
            {
               _3689.setTo(1,0,0,1,0,0);
               _3689.tx = this._5253.x;
               _3689.ty = this._5253.y;
               graphics.beginBitmapFill(this._6360,_3689,false,true);
               graphics.drawRect(this._5253.x,this._5253.y,this._6360.width,this._6360.height);
            }
         }
      }
      
      public function dispose() : void
      {
         if(this._2123)
         {
            this._2123._2104 = null;
         }
         this.mesh = null;
         this._6359 = null;
         this._6360 = null;
         this._5253 = null;
         graphics.clear();
      }
   }
}

