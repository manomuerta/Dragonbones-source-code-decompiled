package _11489
{
   import flash.geom.Point;
   
   public class _11490
   {
      public var start:Point;
      
      public var end:Point;
      
      public function _11490(param1:Number = 0, param2:Number = 0, param3:Number = 1, param4:Number = 1)
      {
         this._start = new Point();
         this._end = new Point();
         super();
         this.start = this._start;
         this.end = this._end;
         this.start.setTo(param1,param2);
         this.start.setTo(param3,param4);
      }
      
      public function copyFrom(param1:_11489._11490) : _11489._11490
      {
         if(!param1 || param1 === this)
         {
            throw new ArgumentError();
         }
         this.start.copyFrom(param1.start);
         this.end.copyFrom(param1.end);
         return this;
      }
      
      public function clone() : _11489._11490
      {
         var _loc1_:_11489._11490 = new _11489._11490();
         _loc1_.copyFrom(this);
         return _loc1_;
      }
      
      public function align(param1:Vector.<Point>) : Vector.<Point>
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc8_:Point = null;
         var _loc9_:Point = null;
         var _loc2_:Vector.<Point> = new Vector.<Point>();
         _loc3_ = this.start.x;
         _loc4_ = this.start.y;
         var _loc5_:Number = -Math.atan2(this.end.y - _loc4_,this.end.x - _loc3_);
         var _loc6_:uint = 0;
         var _loc7_:uint = param1.length;
         while(_loc6_ < _loc7_)
         {
            _loc8_ = param1[_loc6_];
            _loc9_ = new Point((_loc8_.x - _loc3_) * Math.cos(_loc5_) - (_loc8_.y - _loc4_) * Math.sin(_loc5_),(_loc8_.x - _loc3_) * Math.sin(_loc5_) + (_loc8_.y - _loc4_) * Math.cos(_loc5_));
            _loc2_.push(_loc9_);
            _loc6_++;
         }
         return _loc2_;
      }
   }
}

