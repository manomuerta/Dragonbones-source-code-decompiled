package _953
{
   import _1045.Group;
   import _1045._1105;
   import _639._642;
   import flash.display.BitmapData;
   import flash.display.Graphics;
   import flash.display.Shape;
   import flash.geom.Matrix;
   import flash.geom.Point;
   
   public class _952 extends Group
   {
      private var _6746:Number = 20;
      
      private var _6751:_1105;
      
      private var _6752:_1105;
      
      private var _x:Number;
      
      private var _y:Number;
      
      private var _1857:Number = 1;
      
      private var _6750:Number;
      
      private var _6104:Number;
      
      private var _6102:Number;
      
      private var _6103:Point;
      
      private var _6754:int;
      
      private var _6753:int;
      
      private var _6110:Number;
      
      private var _6111:Number;
      
      private var _5455:BitmapData;
      
      public function _952()
      {
         super();
         this._6750 = this._6748;
         this._6751 = new _1105();
         this._6752 = new _1105();
         addElement(this._6751);
         addElement(this._6752);
         this._6103 = new Point();
         var _loc1_:Shape = new Shape();
         _loc1_.graphics.beginFill(5855326);
         _loc1_.graphics.drawRect(0,0,this._6750 * 2,this._6750 * 2);
         _loc1_.graphics.beginFill(6513256);
         _loc1_.graphics.drawRect(0,0,this._6750,this._6750);
         _loc1_.graphics.drawRect(this._6750,this._6750,this._6750,this._6750);
         _loc1_.graphics.endFill();
         if(!this._5455)
         {
            this._5455 = new BitmapData(this._6748 * 2,this._6748 * 2);
            this._5455.draw(_loc1_);
         }
      }
      
      public function get _6748() : Number
      {
         return this._6746;
      }
      
      public function set _6748(param1:Number) : void
      {
         this._6746 = param1;
         this._6750 = this._6746;
         var _loc2_:Shape = new Shape();
         _loc2_.graphics.beginFill(5855326);
         _loc2_.graphics.drawRect(0,0,this._6750 * 2,this._6750 * 2);
         _loc2_.graphics.beginFill(6513256);
         _loc2_.graphics.drawRect(0,0,this._6750,this._6750);
         _loc2_.graphics.drawRect(this._6750,this._6750,this._6750,this._6750);
         _loc2_.graphics.endFill();
         this._5455 = null;
         if(!this._5455)
         {
            this._5455 = new BitmapData(this._6748 * 2,this._6748 * 2);
            this._5455.draw(_loc2_);
         }
      }
      
      public function draw(param1:Number, param2:Number, param3:Boolean = true) : void
      {
         if(this._6104 != param1 || this._6102 != param2 || this._6748 != _642.getInstance().backgroundSize)
         {
            this._6748 = _642.getInstance().backgroundSize;
            this._6104 = param1;
            this._6102 = param2;
            this._6754 = (int(this._6104 / (this._6750 * 2)) + 4) * this._6750 * 2;
            this._6753 = (int(this._6102 / (this._6750 * 2)) + 4) * this._6750 * 2;
            this._6103.x = this._6104 / 2;
            this._6103.y = this._6102 / 2;
            this._6747(this._6754,this._6753);
            if(param3)
            {
               this._6749(this._6104 * 2 + 20,this._6102 * 2 + 20);
            }
         }
      }
      
      private function _6747(param1:Number, param2:Number) : void
      {
         var _loc3_:Matrix = new Matrix();
         var _loc4_:Number = this._1857;
         _loc3_.scale(_loc4_,_loc4_);
         var _loc5_:Graphics = this._6751.graphics;
         _loc5_.clear();
         _loc5_.beginBitmapFill(this._5455,_loc3_);
         _loc5_.drawRect(-param1 / 2,-param2 / 2,param1,param2);
         _loc5_.endFill();
         this._6751.x = this._6103.x;
         this._6751.y = this._6103.y;
      }
      
      private function _6749(param1:Number, param2:Number) : void
      {
         var _loc3_:Number = -param1 / 2;
         var _loc4_:Number = -param2 / 2;
         var _loc5_:Graphics = this._6752.graphics;
         _loc5_.lineStyle(1,0);
         _loc5_.moveTo(0,_loc4_);
         _loc5_.lineTo(0,-_loc4_);
         _loc5_.moveTo(_loc3_,0);
         _loc5_.lineTo(-_loc3_,0);
         this._6752.x = this._6103.x;
         this._6752.y = this._6103.y;
      }
      
      public function _6112(param1:Number) : void
      {
         this._6110 = param1;
         this._x = param1 * 1000 % (this._6750 * 2000);
         this._x *= 0.001;
         this._6751.x = this._6103.x + this._x;
         if(param1 > this._6104 / 2 + 10)
         {
            this._6752.x = this._6103.x + this._6104 / 2 + 10;
         }
         else if(param1 < -this._6104 / 2 - 10)
         {
            this._6752.x = this._6103.x - this._6104 / 2 - 10;
         }
         else
         {
            this._6752.x = this._6103.x + param1;
         }
      }
      
      public function _6113(param1:Number) : void
      {
         this._6111 = param1;
         this._y = param1 * 1000 % (this._6750 * 2000);
         this._y *= 0.001;
         this._6751.y = this._6103.y + this._y;
         if(param1 > this._6102 / 2 + 10)
         {
            this._6752.y = this._6103.y + this._6102 / 2 + 10;
         }
         else if(param1 < -this._6102 / 2 - 10)
         {
            this._6752.y = this._6103.y - this._6102 / 2 - 10;
         }
         else
         {
            this._6752.y = this._6103.y + param1;
         }
      }
      
      public function set scale(param1:Number) : void
      {
         this._1857 = param1;
         var _loc2_:Number = this._6748 * param1;
         if(_loc2_ != this._6750)
         {
            this._6750 = _loc2_;
            this._6754 = (int(this._6104 / (this._6750 * 2)) + 4) * this._6750 * 2;
            this._6753 = (int(this._6102 / (this._6750 * 2)) + 4) * this._6750 * 2;
            this._6747(this._6754,this._6753);
            this._6112(this._6110);
            this._6113(this._6111);
         }
      }
      
      public function get scale() : Number
      {
         return this._1857;
      }
   }
}

