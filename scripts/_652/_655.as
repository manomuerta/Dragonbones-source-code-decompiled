package _652
{
   import flash.geom.Point;
   
   public class _655
   {
      public var _4260:_656;
      
      public var bp:_656;
      
      public var cp:_656;
      
      public function _655(param1:_656, param2:_656, param3:_656)
      {
         super();
         this._4260 = param1;
         this.bp = param2;
         this.cp = param3;
      }
      
      public function _5677(param1:Point, param2:Point) : Vector.<_656>
      {
         var _loc3_:Vector.<_656> = new Vector.<_656>();
         if(!_654.cross2(this._4260,this.bp,param1,param2))
         {
            _loc3_.push(this._4260,this.bp);
         }
         if(!_654.cross2(this.bp,this.cp,param1,param2))
         {
            _loc3_.push(this.bp,this.cp);
         }
         if(!_654.cross2(this.cp,this._4260,param1,param2))
         {
            _loc3_.push(this.cp,this._4260);
         }
         if(_loc3_.length >= 6)
         {
            return null;
         }
         return _loc3_;
      }
      
      public function _5705(param1:Point, param2:Point) : Boolean
      {
         if(_654.cross2(this._4260,this.bp,param1,param2))
         {
            return true;
         }
         if(_654.cross2(this.bp,this.cp,param1,param2))
         {
            return true;
         }
         if(_654.cross2(this.cp,this._4260,param1,param2))
         {
            return true;
         }
         return false;
      }
      
      private function determinant(param1:Number, param2:Number, param3:Number, param4:Number) : Number
      {
         return param1 * param3 - param2 * param4;
      }
      
      private function cross(param1:Point, param2:Point, param3:Point, param4:Point) : Boolean
      {
         if(param1.equals(param3))
         {
            return false;
         }
         if(param2.equals(param3))
         {
            return false;
         }
         if(param1.equals(param4))
         {
            return false;
         }
         if(param2.equals(param4))
         {
            return false;
         }
         var _loc5_:Number = this.determinant(param2.x - param1.x,param3.x - param4.x,param2.y - param1.y,param3.y - param4.y);
         if(_loc5_ <= 0.000001 && _loc5_ >= -0.000001)
         {
            return false;
         }
         var _loc6_:Number = this.determinant(param3.x - param1.x,param3.x - param4.x,param3.y - param1.y,param3.y - param4.y) / _loc5_;
         if(_loc6_ > 1 || _loc6_ < 0)
         {
            return false;
         }
         var _loc7_:Number = this.determinant(param2.x - param1.x,param3.x - param1.x,param2.y - param1.y,param3.y - param1.y) / _loc5_;
         if(_loc7_ > 1 || _loc7_ < 0)
         {
            return false;
         }
         return true;
      }
      
      public function _5681(param1:int, param2:int) : Boolean
      {
         if(this._4260.id == param1 && (this.bp.id == param2 || this.cp.id == param2))
         {
            return true;
         }
         if(this.bp.id == param1 && (this._4260.id == param2 || this.cp.id == param2))
         {
            return true;
         }
         if(this.cp.id == param1 && (this._4260.id == param2 || this.bp.id == param2))
         {
            return true;
         }
         return false;
      }
      
      public function _2549() : Point
      {
         var _loc1_:Number = (this._4260.x + this.bp.x + this.cp.x) / 3;
         var _loc2_:Number = (this._4260.y + this.bp.y + this.cp.y) / 3;
         return new Point(_loc1_,_loc2_);
      }
      
      public function toString() : String
      {
         return "[" + this._4260.toString() + " " + this.bp.toString() + " " + this.cp.toString() + "]";
      }
   }
}

