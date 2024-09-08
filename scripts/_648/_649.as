package _648
{
   import _51._52;
   import _81._86;
   import _81._88;
   import flash.geom.Matrix;
   import flash.geom.Point;
   
   public class _649
   {
      public var x:Number;
      
      public var y:Number;
      
      public var _2136:Number = 0;
      
      public var rotation:Number;
      
      public var _5259:Number;
      
      public var bone:_52;
      
      public var child:_52;
      
      private var _length:Number;
      
      public var _3800:_86;
      
      public var _2194:Matrix;
      
      public function _649()
      {
         super();
      }
      
      public function _3801() : Point
      {
         var _loc1_:Number = this.rotation * Math.PI / 180;
         var _loc2_:Number = this.x + Math.cos(_loc1_) * this.length;
         var _loc3_:Number = this.y + Math.sin(_loc1_) * this.length;
         return new Point(_loc2_,_loc3_);
      }
      
      public function get length() : Number
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         var _loc3_:Point = null;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Point = null;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         if(this.bone)
         {
            if(this.child)
            {
               _loc1_ = this.child.globalTransform.x - this.bone.globalTransform.x;
               _loc2_ = this.child.globalTransform.y - this.bone.globalTransform.y;
               _loc3_ = _88._2135(new Point(_loc1_,_loc2_),this.bone._2009,true);
               _loc4_ = _loc3_.x - this.bone.globalTransform.x;
               _loc5_ = _loc3_.y - this.bone.globalTransform.y;
               this._length = Math.sqrt(_loc4_ * _loc4_ + _loc5_ * _loc5_);
            }
            else
            {
               _loc6_ = this.bone.length;
               _loc7_ = 0;
               _loc8_ = _88._2135(new Point(_loc6_,_loc7_),this.bone._2009,true);
               _loc9_ = _loc8_.x - this.bone.globalTransform.x;
               _loc10_ = _loc8_.y - this.bone.globalTransform.y;
               this._length = Math.sqrt(_loc9_ * _loc9_ + _loc10_ * _loc10_);
            }
         }
         else
         {
            this._length = 0;
         }
         return this._length;
      }
      
      public function set length(param1:Number) : void
      {
         this._length = param1;
      }
      
      public function _3799(param1:Number, param2:Number) : void
      {
         var _loc3_:Number = param1 - this.x;
         var _loc4_:Number = param2 - this.y;
         var _loc5_:Number = Math.atan2(_loc4_,_loc3_);
         this.rotation = _loc5_ * 180 / Math.PI;
      }
   }
}

