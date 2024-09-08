package _561
{
   import _51._52;
   import _652._654;
   import _658.Mesh;
   import _658._660;
   import _658._662;
   import _783.StageNotification;
   import _93._94;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Dictionary;
   import flash.utils.Timer;
   
   public class _566 extends _94
   {
      private const INTERVAL:int = 30;
      
      private const DISTANCE_PER_FRAME:int = 30;
      
      private const WEIGHT_PER_FRAME:int = 30;
      
      private const MAX_BONE_PRE_VERTEX:int = 4;
      
      private const MIN_DISTANCE:Number = 100;
      
      private const OVER_DISTANCE:Number = 200;
      
      private const OVER_WEIGHT:Number = 0.0025;
      
      private var _2123:Mesh;
      
      private var _4285:_660;
      
      private var _timer:Timer;
      
      private var _4286:int;
      
      private var _4284:Vector.<_52>;
      
      private var _4279:Vector.<_52>;
      
      private var _4289:int;
      
      private var _4278:Dictionary;
      
      private var _4271:_52;
      
      private var _4270:int;
      
      private var _4277:Number = 1.7976931348623157e+308;
      
      private var _4276:Number = 0;
      
      private var _2352:Dictionary;
      
      private var _4288:int;
      
      public function _566()
      {
         super();
         this._timer = new Timer(this.INTERVAL);
         this._timer.addEventListener(TimerEvent.TIMER,this.onTimer);
         this._4284 = new Vector.<_52>();
         this._4279 = new Vector.<_52>();
         this._4278 = new Dictionary();
         this._2352 = new Dictionary();
      }
      
      private function onTimer(param1:TimerEvent) : void
      {
         switch(this._4286)
         {
            case 0:
               this.filterBone();
               break;
            case 1:
               this._4272();
               break;
            case 2:
               this._4274();
               break;
            case 3:
            default:
               this._4282();
         }
      }
      
      public function autoWeight(param1:Mesh) : void
      {
         this._2123 = param1;
         this._4285 = this._2123.meshRig;
         if(this._2123 && this._4285 && this._4285._2922.length > 1)
         {
            this._4275();
         }
      }
      
      private function _4275() : void
      {
         _1567(new StageNotification(StageNotification.START_AUTO_WEIGHT));
         this._timer.start();
      }
      
      private function _4282() : void
      {
         this._timer.reset();
         _1567(new StageNotification(StageNotification.END_AUTO_WEIGHT,this._2352));
         this._4285 = null;
         this._2123 = null;
         this._4284.length = 0;
         this._4279.length = 0;
         this._4278 = new Dictionary();
         this._2352 = new Dictionary();
         this._4286 = 0;
         this._4288 = 0;
         this._4289 = 0;
      }
      
      private function filterBone() : void
      {
         var _loc2_:int = 0;
         var _loc4_:_52 = null;
         var _loc5_:Array = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc1_:int = 0;
         var _loc3_:Point = new Point();
         _loc1_ = 0;
         _loc2_ = int(this._4285._2922.length);
         while(_loc1_ < _loc2_)
         {
            _loc3_.x = this._4285._2922[_loc1_].globalTransform.x;
            _loc3_.y = this._4285._2922[_loc1_].globalTransform.y;
            if(this._2123.hitTest(_loc3_))
            {
               this._4284.push(this._4285._2922[_loc1_]);
            }
            else
            {
               this._4279.push(this._4285._2922[_loc1_]);
            }
            _loc1_++;
         }
         if(this._4284.length <= 1)
         {
            if(this._4284.length == 1)
            {
               _loc4_ = this._4284[0];
            }
            else
            {
               _loc4_ = this._4285._2922[0];
            }
            _loc1_ = 0;
            _loc2_ = int(this._4285._4281.length);
            while(_loc1_ < _loc2_)
            {
               _loc5_ = [];
               _loc6_ = 0;
               _loc7_ = int(this._4285._2922.length);
               while(_loc6_ < _loc7_)
               {
                  if(this._4285._2922[_loc6_] == _loc4_)
                  {
                     _loc5_.push({
                        "bone":this._4285._2922[_loc6_],
                        "weight":1
                     });
                  }
                  else
                  {
                     _loc5_.push({
                        "bone":this._4285._2922[_loc6_],
                        "weight":0
                     });
                  }
                  _loc6_++;
               }
               this._2352[this._4285._4281[_loc1_]] = _loc5_;
               _loc1_++;
            }
            this._4286 = 3;
         }
         else
         {
            ++this._4286;
            this._4289 = 0;
            this._4271 = this._4284[0];
            this._4270 = 0;
         }
      }
      
      private function _4272() : void
      {
         var _loc2_:_662 = null;
         var _loc1_:int = this._4289 + this.DISTANCE_PER_FRAME;
         if(this._4271 == null)
         {
            ++this._4286;
            return;
         }
         while(this._4289 < _loc1_)
         {
            if(this._4289 >= this._4285._4281.length)
            {
               ++this._4270;
               this._4289 = 0;
               if(this._4270 < this._4284.length)
               {
                  this._4271 = this._4284[this._4270];
               }
               else
               {
                  this._4271 = null;
               }
               break;
            }
            _loc2_ = this._4285._4281[this._4289];
            this._4280(_loc2_,this._4271);
            ++this._4289;
         }
         if(this._4277 <= this.MIN_DISTANCE)
         {
            this._4277 = this.MIN_DISTANCE;
         }
      }
      
      private function _4280(param1:_662, param2:_52) : void
      {
         if(this._4278[param1] == null)
         {
            this._4278[param1] = new Dictionary();
         }
         var _loc3_:Number = param2.globalTransform.x;
         var _loc4_:Number = param2.globalTransform.y;
         var _loc5_:Point;
         (_loc5_ = new Point()).x = param2.length;
         _loc5_ = param2._2009.transformPoint(_loc5_);
         var _loc6_:Number = param1.vertex.x;
         var _loc7_:Number = param1.vertex.y;
         var _loc8_:Number = _654._4273(_loc6_,_loc7_,_loc3_,_loc4_,_loc5_.x,_loc5_.y);
         this._4278[param1][param2] = _loc8_;
         if(this._4277 > _loc8_)
         {
            this._4277 = _loc8_;
         }
         if(this._4276 < _loc8_)
         {
            this._4276 = _loc8_;
         }
      }
      
      private function _4274() : void
      {
         var _loc2_:_662 = null;
         var _loc1_:int = this._4288 + this.WEIGHT_PER_FRAME;
         while(this._4288 < _loc1_)
         {
            if(this._4288 >= this._4285._4281.length)
            {
               ++this._4286;
               break;
            }
            _loc2_ = this._4285._4281[this._4288];
            this._4283(_loc2_);
            ++this._4288;
         }
      }
      
      private function _4283(param1:_662) : void
      {
         var _loc4_:Object = null;
         var _loc5_:Number = NaN;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc10_:Object = null;
         var _loc2_:Array = [];
         var _loc3_:Dictionary = this._4278[param1];
         for(_loc4_ in _loc3_)
         {
            (_loc10_ = {}).bone = _loc4_;
            _loc10_.weight = this._4277 / _loc3_[_loc4_];
            if(_loc10_.weight < this.OVER_WEIGHT)
            {
               _loc10_.weight = 0;
            }
            _loc2_.push(_loc10_);
         }
         _loc5_ = Number.MAX_VALUE;
         _loc7_ = 0;
         _loc8_ = int(_loc2_.length);
         while(_loc7_ < _loc8_)
         {
            if(_loc2_[_loc7_].weight != 0)
            {
               _loc6_ = -1;
               break;
            }
            if(_loc3_[_loc2_[_loc7_].bone] < _loc5_)
            {
               _loc5_ = Number(_loc3_[_loc2_[_loc7_].bone]);
               _loc6_ = _loc7_;
            }
            _loc7_++;
         }
         if(_loc6_ >= 0)
         {
            _loc2_[_loc6_].weight = 1;
         }
         _loc2_ = _loc2_.sortOn("weight",Array.NUMERIC | Array.DESCENDING);
         var _loc9_:Number = 0;
         _loc7_ = 0;
         _loc8_ = int(_loc2_.length);
         while(_loc7_ < _loc8_)
         {
            if(_loc7_ < this.MAX_BONE_PRE_VERTEX)
            {
               _loc9_ += _loc2_[_loc7_].weight;
            }
            else
            {
               _loc2_[_loc7_].weight = 0;
            }
            _loc7_++;
         }
         _loc7_ = 0;
         _loc8_ = int(_loc2_.length);
         while(_loc7_ < _loc8_)
         {
            if(_loc9_ > 0)
            {
               _loc2_[_loc7_].weight /= _loc9_;
            }
            else
            {
               _loc2_[_loc7_].weight = _loc7_ == 0 ? 1 : 0;
            }
            _loc7_++;
         }
         _loc7_ = 0;
         _loc8_ = int(this._4279.length);
         while(_loc7_ < _loc8_)
         {
            _loc2_.push({
               "bone":this._4279[_loc7_],
               "weight":0
            });
            _loc7_++;
         }
         this._2352[param1] = _loc2_;
      }
   }
}

