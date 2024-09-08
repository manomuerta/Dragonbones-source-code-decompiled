package _953
{
   import _721._763;
   import _81.BoundingBox;
   import _81._82;
   import _81._89;
   import egret.core._1140;
   import flash.geom.Matrix;
   
   public class _955 extends _1140 implements _89
   {
      private static var matrix:Matrix = new Matrix();
      
      private var _6762:uint = 16777215;
      
      private var _6763:Number = 1;
      
      private var _13447:Boolean;
      
      private var _type:int;
      
      private var _6105:_763;
      
      public function _955()
      {
         super();
      }
      
      override protected function _5823(param1:Number, param2:Number) : void
      {
         super._5823(param1,param2);
      }
      
      public function _13449() : void
      {
         var _loc1_:Number = NaN;
         if(this._6105 == null)
         {
            graphics.clear();
            return;
         }
         if(this._6105.type == _763.TYPE_OLD)
         {
            graphics.clear();
            graphics.lineStyle(0,this._6105.bgColor,this._6763);
            graphics.beginFill(this._6105.bgColor,0);
            graphics.drawRect(0,0,this._6105.width,this._6105.height);
         }
         else
         {
            graphics.clear();
            if(this._6105.opened)
            {
               _loc1_ = this._6105._13227 && this._6105.hasBackground ? 1 : 0;
               graphics.lineStyle(0,0,1);
               graphics.beginFill(this._6105.bgColor,_loc1_);
               graphics.drawRect(-this._6105.width / 2,-this._6105.height / 2,this._6105.width,this._6105.height);
            }
         }
      }
      
      public function set bgColor(param1:uint) : void
      {
         if(this._6762 != param1)
         {
            this._6762 = param1;
            this._13449();
         }
      }
      
      public function set bgAlpha(param1:Number) : void
      {
         if(this._6763 != param1)
         {
            this._6763 = param1;
            this._13449();
         }
      }
      
      public function set _13448(param1:Boolean) : void
      {
         this._13447 = param1;
         this._13449();
      }
      
      public function set _2000(param1:_763) : void
      {
         this._6105 = param1;
         this._13449();
      }
      
      public function get _2041() : Number
      {
         return x;
      }
      
      public function get _2040() : Number
      {
         return y;
      }
      
      public function get _2038() : Number
      {
         return width;
      }
      
      public function get _2037() : Number
      {
         return height;
      }
      
      public function get _2009() : Matrix
      {
         return matrix;
      }
      
      public function set boundingBox(param1:BoundingBox) : void
      {
         _82._2015[this] = param1;
      }
      
      public function get boundingBox() : BoundingBox
      {
         return _82._2015[this];
      }
   }
}

