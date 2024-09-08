package _14223
{
   import _14176._14175;
   import _14176._14178;
   import _14176._14179;
   import _14176._14180;
   import _14176._14181;
   import _14176._14182;
   import _14176._14183;
   import _14176._14184;
   import _14176._14185;
   import _14176._14186;
   import flash.geom.Point;
   
   public class _14228
   {
      private var firstPoint:Point;
      
      private var _15444:Point;
      
      private var commands:Vector.<_14186>;
      
      private var _15449:_14226;
      
      public function _14228(param1:Vector.<_14186>)
      {
         super();
         this.commands = param1;
      }
      
      public function render(param1:_14226) : void
      {
         var _loc2_:_14186 = null;
         this._15449 = param1;
         if(this._15449._15425 != 0 || this._15449._15426 != 0)
         {
            this._15449.moveTo(0,0);
         }
         for each(_loc2_ in this.commands)
         {
            switch(_loc2_.type)
            {
               case "M":
               case "m":
                  this.moveTo(_loc2_ as _14185);
                  break;
               case "L":
               case "l":
                  this.lineTo(_loc2_ as _14182);
                  break;
               case "H":
               case "h":
                  this._15445(_loc2_ as _14183);
                  break;
               case "V":
               case "v":
                  this._15447(_loc2_ as _14184);
                  break;
               case "Q":
               case "q":
                  this._15446(_loc2_ as _14180);
                  break;
               case "T":
               case "t":
                  this._15442(_loc2_ as _14181);
                  break;
               case "C":
               case "c":
                  this._15448(_loc2_ as _14178);
                  break;
               case "S":
               case "s":
                  this._15443(_loc2_ as _14179);
                  break;
               case "A":
               case "a":
                  this._15324(_loc2_ as _14175);
                  break;
               case "Z":
               case "z":
                  this.closePath();
                  break;
            }
         }
      }
      
      private function closePath() : void
      {
         this._15449.lineTo(this.firstPoint.x,this.firstPoint.y);
      }
      
      private function moveTo(param1:_14185) : void
      {
         var _loc2_:Number = param1.x;
         var _loc3_:Number = param1.y;
         if(!param1.absolute)
         {
            _loc2_ += this._15449._15425;
            _loc3_ += this._15449._15426;
         }
         this._15449.moveTo(_loc2_,_loc3_);
         this.firstPoint = new Point(_loc2_,_loc3_);
      }
      
      private function lineTo(param1:_14182) : void
      {
         var _loc2_:Number = param1.x;
         var _loc3_:Number = param1.y;
         if(!param1.absolute)
         {
            _loc2_ += this._15449._15425;
            _loc3_ += this._15449._15426;
         }
         this._15449.lineTo(_loc2_,_loc3_);
      }
      
      private function _15445(param1:_14183) : void
      {
         var _loc2_:Number = param1.x;
         if(!param1.absolute)
         {
            _loc2_ += this._15449._15425;
         }
         this._15449.lineTo(_loc2_,this._15449._15426);
      }
      
      private function _15447(param1:_14184) : void
      {
         var _loc2_:Number = param1.y;
         if(!param1.absolute)
         {
            _loc2_ += this._15449._15426;
         }
         this._15449.lineTo(this._15449._15425,_loc2_);
      }
      
      private function _15446(param1:_14180) : void
      {
         var _loc2_:Number = param1.x1;
         var _loc3_:Number = param1.y1;
         var _loc4_:Number = param1.x;
         var _loc5_:Number = param1.y;
         if(!param1.absolute)
         {
            _loc2_ += this._15449._15425;
            _loc3_ += this._15449._15426;
            _loc4_ += this._15449._15425;
            _loc5_ += this._15449._15426;
         }
         this._15449.curveTo(_loc2_,_loc3_,_loc4_,_loc5_);
         this._15444 = new Point(_loc2_,_loc3_);
      }
      
      private function _15442(param1:_14181) : void
      {
         var _loc2_:Number = this._15449._15425 + (this._15449._15425 - this._15444.x);
         var _loc3_:Number = this._15449._15426 + (this._15449._15426 - this._15444.y);
         var _loc4_:Number = param1.x;
         var _loc5_:Number = param1.y;
         if(!param1.absolute)
         {
            _loc4_ += this._15449._15425;
            _loc5_ += this._15449._15426;
         }
         this._15449.curveTo(_loc2_,_loc3_,_loc4_,_loc5_);
         this._15444 = new Point(_loc2_,_loc3_);
      }
      
      private function _15448(param1:_14178) : void
      {
         var _loc2_:Number = param1.x1;
         var _loc3_:Number = param1.y1;
         var _loc4_:Number = param1.x2;
         var _loc5_:Number = param1.y2;
         var _loc6_:Number = param1.x;
         var _loc7_:Number = param1.y;
         if(!param1.absolute)
         {
            _loc2_ += this._15449._15425;
            _loc3_ += this._15449._15426;
            _loc4_ += this._15449._15425;
            _loc5_ += this._15449._15426;
            _loc6_ += this._15449._15425;
            _loc7_ += this._15449._15426;
         }
         this._15449.cubicCurveTo(_loc2_,_loc3_,_loc4_,_loc5_,_loc6_,_loc7_);
         this._15444 = new Point(_loc4_,_loc5_);
      }
      
      private function _15443(param1:_14179) : void
      {
         var _loc2_:Number = this._15449._15425 + (this._15449._15425 - this._15444.x);
         var _loc3_:Number = this._15449._15426 + (this._15449._15426 - this._15444.y);
         var _loc4_:Number = param1.x2;
         var _loc5_:Number = param1.y2;
         var _loc6_:Number = param1.x;
         var _loc7_:Number = param1.y;
         if(!param1.absolute)
         {
            _loc4_ += this._15449._15425;
            _loc5_ += this._15449._15426;
            _loc6_ += this._15449._15425;
            _loc7_ += this._15449._15426;
         }
         this._15449.cubicCurveTo(_loc2_,_loc3_,_loc4_,_loc5_,_loc6_,_loc7_);
         this._15444 = new Point(_loc4_,_loc5_);
      }
      
      private function _15324(param1:_14175) : void
      {
         var _loc2_:Number = param1.x;
         var _loc3_:Number = param1.y;
         if(!param1.absolute)
         {
            _loc2_ += this._15449._15425;
            _loc3_ += this._15449._15426;
         }
         this._15449._15324(param1._14639,param1._14638,param1._15176,param1._15177,param1._15178,_loc2_,_loc3_);
      }
   }
}

