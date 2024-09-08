package _11489
{
   import flash.geom.Point;
   
   public class Curve
   {
      private static const _helpVector:Vector.<Number> = new Vector.<Number>();
      
      private static const _4235:Point = new Point();
      
      private static const _helpSegment:_11489._11490 = new _11489._11490();
      
      public function Curve(param1:Boolean = false)
      {
         this._tweenSamples = new Vector.<Number>();
         this._all = new Vector.<Bezier>();
         super();
         this._all.push(new Bezier(null,param1));
      }
      
      public function copyFrom(param1:Curve) : Curve
      {
         if(!param1 || param1 === this)
         {
            throw new ArgumentError();
         }
         this._all.length = param1.all.length;
         var _loc2_:uint = 0;
         var _loc3_:uint = this._all.length;
         while(_loc2_ < _loc3_)
         {
            this._all[_loc2_] = param1.all[_loc2_].clone();
            _loc2_++;
         }
         this._tweenSamples.length = param1._tweenSamples.length;
         _loc2_ = 0;
         _loc3_ = this._tweenSamples.length;
         while(_loc2_ < _loc3_)
         {
            this._tweenSamples[_loc2_] = param1._tweenSamples[_loc2_];
            _loc2_++;
         }
         return this;
      }
      
      public function clone() : Curve
      {
         var _loc1_:Curve = new Curve();
         _loc1_.copyFrom(this);
         return _loc1_;
      }
      
      public function get _14299() : Boolean
      {
         if(this._all.length == 1 && this._all[0].points.length == 4 && this._all[0].points[0].x == 0 && this._all[0].points[0].y == 0 && this._all[0].points[1].x == 0 && this._all[0].points[1].y == 0 && this._all[0].points[2].x == 1 && this._all[0].points[2].y == 1 && this._all[0].points[3].x == 1 && this._all[0].points[3].y == 1)
         {
            return true;
         }
         return false;
      }
      
      public function fromArray(param1:Array) : void
      {
         var _loc4_:uint = 0;
         var _loc5_:Bezier = null;
         if(!param1 || param1.length < 8 || Boolean((param1.length - 2) % 6))
         {
            return;
         }
         this._all.length = (param1.length - 2) / 6;
         var _loc2_:uint = 0;
         var _loc3_:uint = this._all.length;
         while(_loc2_ < _loc3_)
         {
            _loc4_ = _loc2_ * 6;
            _loc5_ = this._all[_loc2_] = this._all[_loc2_] || new Bezier();
            _loc5_.start.setTo(param1[_loc4_],param1[_loc4_ + 1]);
            _loc5_.controlA.setTo(param1[_loc4_ + 2],param1[_loc4_ + 3]);
            _loc5_._11525.setTo(param1[_loc4_ + 4],param1[_loc4_ + 5]);
            _loc5_.end.setTo(param1[_loc4_ + 6],param1[_loc4_ + 7]);
            _loc2_++;
         }
      }
      
      public function toArray() : Array
      {
         var _loc4_:Bezier = null;
         var _loc1_:Array = [];
         var _loc2_:uint = 0;
         var _loc3_:uint = this._all.length;
         while(_loc2_ < _loc3_)
         {
            _loc4_ = this._all[_loc2_];
            if(_loc4_._11523)
            {
               _loc1_.push(_loc4_.controlA.x,_loc4_.controlA.y);
               if(_loc2_ !== _loc3_ - 1)
               {
                  _loc1_.push(_loc4_.end.x,_loc4_.end.y);
               }
            }
            else
            {
               _loc1_.push(_loc4_.controlA.x,_loc4_.controlA.y,_loc4_._11525.x,_loc4_._11525.y);
               if(_loc2_ !== _loc3_ - 1)
               {
                  _loc1_.push(_loc4_.end.x,_loc4_.end.y);
               }
            }
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function _11532(param1:Point) : Bezier
      {
         return null;
      }
      
      public function insertPoint(param1:Bezier, param2:Number) : Bezier
      {
         var _loc3_:int = int(this._all.indexOf(param1));
         if(!param1 || _loc3_ < 0)
         {
            throw new ArgumentError();
         }
         if(param2 <= 0 || param2 >= 1)
         {
            return null;
         }
         var _loc4_:Vector.<Point> = param1._11529(param2);
         var _loc5_:Bezier = null;
         if(param1._11523)
         {
            _loc5_ = new Bezier(null,true);
            _loc5_.controlA.copyFrom(_loc4_[4]);
            _loc5_.end.copyFrom(param1.end);
            param1.controlA.copyFrom(_loc4_[3]);
            param1.end.copyFrom(_loc4_[5]);
            _loc5_.start.copyFrom(param1.end);
         }
         else
         {
            _loc5_ = new Bezier();
            _loc5_.controlA.copyFrom(_loc4_[8]);
            _loc5_._11525.copyFrom(_loc4_[6]);
            _loc5_.end.copyFrom(param1.end);
            param1.controlA.copyFrom(_loc4_[4]);
            param1._11525.copyFrom(_loc4_[7]);
            param1.end.copyFrom(_loc4_[9]);
            _loc5_.start.copyFrom(param1.end);
         }
         param1.update();
         _loc5_.update();
         this._all.splice(_loc3_ + 1,0,_loc5_);
         return _loc5_;
      }
      
      public function _11533(param1:Point) : Bezier
      {
         var _loc4_:Bezier = null;
         var _loc5_:Bezier = null;
         var _loc6_:Bezier = null;
         if(!param1 || this._all.length <= 1)
         {
            throw new ArgumentError();
         }
         var _loc2_:uint = 0;
         var _loc3_:uint = this._all.length;
         while(_loc2_ < _loc3_)
         {
            _loc4_ = this._all[_loc2_];
            if(_loc4_.start === param1)
            {
               if(_loc2_ === 0)
               {
                  this._all.shift();
               }
               else
               {
                  _loc5_ = this._all[_loc2_ - 1];
                  _loc5_.end.copyFrom(_loc4_.end);
                  _loc5_._11525.copyFrom(_loc4_.controlA);
                  this._all.splice(_loc2_,1);
               }
               return _loc4_;
            }
            if(_loc4_.end === param1)
            {
               if(_loc2_ === _loc3_ - 1)
               {
                  this._all.pop();
               }
               else
               {
                  _loc6_ = this._all[_loc2_ + 1];
                  _loc4_.end.copyFrom(_loc6_.end);
                  _loc4_._11525.copyFrom(_loc6_.controlA);
                  this._all.splice(_loc2_ + 1,1);
               }
               return _loc4_;
            }
            _loc2_++;
         }
         return null;
      }
      
      public function update(param1:uint = 100) : void
      {
         var _loc2_:uint = 0;
         var _loc3_:uint = this._all.length;
         while(_loc2_ < _loc3_)
         {
            this._all[_loc2_].update(param1);
            _loc2_++;
         }
      }
      
      public function _11514(param1:uint) : void
      {
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:Bezier = null;
         if(param1 < 2)
         {
            param1 = 2;
         }
         this._tweenSamples.length = param1 - 1;
         var _loc2_:Number = 1 / param1;
         var _loc3_:uint = 1;
         while(_loc3_ < param1)
         {
            _helpSegment.start.x = _loc3_ * _loc2_;
            _helpSegment.start.y = -100;
            _helpSegment.end.x = _loc3_ * _loc2_;
            _helpSegment.end.y = 100;
            _loc4_ = 0;
            _loc5_ = this._all.length;
            while(_loc4_ < _loc5_)
            {
               _loc6_ = this._all[_loc4_];
               _helpVector.length = 0;
               _loc6_._11520(_helpSegment,_helpVector);
               if(_helpVector.length > 0)
               {
                  _loc6_.compute(_helpVector[0],_4235);
                  break;
               }
               _loc4_++;
            }
            this._tweenSamples[_loc3_ - 1] = _4235.y;
            _loc3_++;
         }
      }
      
      public function _11516(param1:Number) : Number
      {
         var _loc2_:uint = 0;
         var _loc3_:uint = 0;
         if(param1 <= 0)
         {
            return 0;
         }
         if(param1 >= 1)
         {
            return 1;
         }
         if(this._tweenSamples.length < 1)
         {
            return 0;
         }
         _loc2_ = uint(this._tweenSamples.length + 1);
         _loc3_ = Math.floor(param1 * _loc2_);
         var _loc4_:Number = _loc3_ === 0 ? 0 : this._tweenSamples[_loc3_ - 1];
         var _loc5_:Number = _loc3_ === _loc2_ - 1 ? 1 : this._tweenSamples[_loc3_];
         return _loc4_ + (_loc5_ - _loc4_) * (param1 * _loc2_ - _loc3_);
      }
      
      public function get _11534() : Boolean
      {
         var _loc1_:Point = this.start.start;
         var _loc2_:Point = this.end.end;
         return _loc1_.x === _loc2_.x && _loc1_.y === _loc2_.y;
      }
      
      public function get start() : Bezier
      {
         return this._all[0];
      }
      
      public function get end() : Bezier
      {
         return this._all[this._all.length - 1];
      }
      
      public function get all() : Vector.<Bezier>
      {
         return this._all;
      }
   }
}

