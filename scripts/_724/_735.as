package _724
{
   import _521._528;
   import _859._860;
   import flash.display.BitmapData;
   
   public class _735 extends _732
   {
      public function _735(param1:String, param2:Number, param3:Number)
      {
         super();
         this._path = param1;
         this._name = param1;
         this._5873 = param1;
         this.width = param2;
         this.height = param3;
         _1563 = STATUS_MISSING;
         if(isNaN(this.width) || this.width <= 0)
         {
            this.width = this.bitmapData.width;
         }
         if(isNaN(this.height) || this.height <= 0)
         {
            this.height = this.bitmapData.height;
         }
         this._2166 = -this.width / 2;
         this._2167 = -this.height / 2;
      }
      
      public function setSize(param1:Number, param2:Number) : void
      {
         if(!isNaN(param1))
         {
            this.width = param1;
            this._2166 = -this.width / 2;
         }
         if(!isNaN(param2))
         {
            this.height = param2;
            this._2167 = -this.height / 2;
         }
      }
      
      override public function get bitmapData() : BitmapData
      {
         return _528._14513;
      }
      
      override public function _5735(param1:_860) : void
      {
         super._5735(param1);
         param1._5747 = true;
         param1._5744 = false;
         param1._5724 = this.bitmapData;
      }
      
      override public function _2108(param1:Function) : void
      {
         param1(this.bitmapData);
      }
   }
}

