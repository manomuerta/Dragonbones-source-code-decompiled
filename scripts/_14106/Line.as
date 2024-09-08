package _14106
{
   import egret.core._1140;
   
   public class Line extends _1140
   {
      private var _color:uint = 15329769;
      
      private var _14827:Object;
      
      private var _type:uint = 0;
      
      private var _size:Number = 6;
      
      private var _12254:Number = 1;
      
      private var _14826:Number = 10;
      
      public function Line()
      {
         super();
      }
      
      public function _6107(param1:int = -1) : void
      {
         if(param1 != -1)
         {
            this._14826 = param1;
         }
         this.graphics.clear();
         this.graphics.beginFill(this.color,0.01);
         if(this.type == 0)
         {
            this.graphics.drawRect(0,-this._size / 2,this._14826,this._size);
         }
         else
         {
            this.graphics.drawRect(-this._size / 2,0,this._size,this._14826);
         }
         this.graphics.lineStyle(this.thickness,this.color,1);
         this.graphics.moveTo(0,0);
         if(this.type == 0)
         {
            this.graphics.lineTo(this._14826,0);
         }
         else
         {
            this.graphics.lineTo(0,this._14826);
         }
         this.graphics.endFill();
      }
      
      public function get _14640() : Object
      {
         return this._14827;
      }
      
      public function set _14640(param1:Object) : void
      {
         this._14827 = param1;
      }
      
      public function get type() : uint
      {
         return this._type;
      }
      
      public function set type(param1:uint) : void
      {
         if(this._type == param1)
         {
            return;
         }
         this._type = param1;
      }
      
      public function set _14756(param1:Number) : void
      {
         if(this._14826 == param1)
         {
            return;
         }
         this._14826 = param1;
      }
      
      public function get color() : uint
      {
         return this._color;
      }
      
      public function set color(param1:uint) : void
      {
         if(this._color == param1)
         {
            return;
         }
         this._color = param1;
      }
      
      public function get thickness() : Number
      {
         return this._12254;
      }
      
      public function set thickness(param1:Number) : void
      {
         this._size = param1 * 6;
         if(param1 > 1)
         {
            param1 = 1;
         }
         this._12254 = param1;
      }
   }
}

