package _822
{
   import egret.core._1140;
   import flash.display.BitmapData;
   import flash.geom.Matrix;
   
   public class _830 extends _1140
   {
      protected static var _3689:Matrix = new Matrix();
      
      protected var _bitmapData:BitmapData;
      
      private var _6208:Boolean = false;
      
      public function _830()
      {
         super();
      }
      
      override protected function _2476() : void
      {
         super._2476();
         if(this._6208)
         {
            this._6208 = false;
            this.draw();
         }
      }
      
      protected function draw() : void
      {
         graphics.clear();
         _3689.tx = -this._bitmapData.width / 2;
         _3689.ty = -this._bitmapData.height / 2;
         graphics.beginBitmapFill(this._bitmapData,_3689,false,true);
         graphics.drawRect(-this._bitmapData.width / 2,-this._bitmapData.height / 2,this._bitmapData.width,this._bitmapData.height);
      }
      
      public function get bitmapData() : BitmapData
      {
         return this._bitmapData;
      }
      
      public function set bitmapData(param1:BitmapData) : void
      {
         if(this._bitmapData == param1)
         {
            return;
         }
         this._bitmapData = param1;
         this._6208 = true;
         _2466();
      }
      
      public function dispose() : void
      {
      }
   }
}

