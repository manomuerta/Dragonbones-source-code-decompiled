package _1162
{
   import _1148.Animation;
   import _1148._1149;
   import _1148._1150;
   import egret.core.ns_egret;
   import flash.display.DisplayObject;
   import flash.geom.Point;
   
   use namespace ns_egret;
   
   public class _1163 extends _1161
   {
      private static var position:Point = new Point();
      
      private var _8818:Boolean = false;
      
      private var _8867:Number = 0;
      
      private var _8869:Object;
      
      public var initialized:Boolean = false;
      
      public var _8774:Point;
      
      public var _8768:Boolean;
      
      private var _8866:Point;
      
      public function _1163(param1:Object)
      {
         this._8869 = {
            "rotation":NaN,
            "scaleX":NaN,
            "scaleY":NaN,
            "translationX":NaN,
            "translationY":NaN
         };
         super(param1);
      }
      
      override public function _8837() : void
      {
         if(!this._8818)
         {
            this._8818 = true;
            super._8837();
         }
      }
      
      private function _8858(param1:Object) : Boolean
      {
         return param1 is Number && !isNaN(Number(param1)) || !(param1 is Number) && param1 !== null;
      }
      
      private function _8776(param1:Vector.<_1149>, param2:_1149, param3:Number = 0, param4:Boolean = false) : void
      {
         param2.time += param3;
         var _loc5_:int = 0;
         while(_loc5_ < param1.length)
         {
            if(param1[_loc5_].time >= param2.time)
            {
               if(param1[_loc5_].time == param2.time)
               {
                  if(param4)
                  {
                     param2.time += 0.01;
                     param1.splice(_loc5_ + 1,0,param2);
                  }
                  else
                  {
                     param2.time -= 0.01;
                     param1.splice(_loc5_,0,param2);
                  }
               }
               else
               {
                  param1.splice(_loc5_,0,param2);
               }
               return;
            }
            _loc5_++;
         }
         param1.push(param2);
      }
      
      public function _8778(param1:_1150, param2:Number = 0) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:_1150 = null;
         var _loc7_:int = 0;
         var _loc8_:Number = NaN;
         var _loc9_:_1149 = null;
         var _loc3_:Boolean = false;
         if(motionPaths)
         {
            _loc7_ = int(motionPaths.length);
            if(param2 < this._8867)
            {
               _loc8_ = this._8867 - param2;
               _loc4_ = 0;
               while(_loc4_ < _loc7_)
               {
                  _loc6_ = _1150(motionPaths[_loc4_]);
                  _loc5_ = 0;
                  while(_loc5_ < _loc6_._8781.length)
                  {
                     _loc6_._8781[_loc5_].time += _loc8_;
                     _loc5_++;
                  }
                  _loc4_++;
               }
               this._8867 = param2;
            }
            _loc4_ = 0;
            while(_loc4_ < _loc7_)
            {
               _loc6_ = _1150(motionPaths[_loc4_]);
               if(_loc6_.property == param1.property)
               {
                  _loc5_ = 0;
                  while(_loc5_ < param1._8781.length)
                  {
                     this._8776(_loc6_._8781,param1._8781[_loc5_],param2 - this._8867,_loc5_ == 0);
                     _loc5_++;
                  }
                  _loc3_ = true;
                  break;
               }
               _loc4_++;
            }
         }
         else
         {
            motionPaths = new Vector.<_1150>();
            this._8867 = param2;
         }
         if(!_loc3_)
         {
            if(param2 > this._8867)
            {
               _loc5_ = 0;
               while(_loc5_ < param1._8781.length)
               {
                  param1._8781[_loc5_].time += param2 - this._8867;
                  _loc5_++;
               }
            }
            motionPaths.push(param1);
         }
         _loc7_ = int(motionPaths.length);
         _loc4_ = 0;
         while(_loc4_ < _loc7_)
         {
            _loc6_ = _1150(motionPaths[_loc4_]);
            _loc9_ = _loc6_._8781[_loc6_._8781.length - 1];
            if(!isNaN(_loc9_.time))
            {
               duration = Math.max(duration,_loc9_.time);
            }
            _loc4_++;
         }
      }
      
      override public function play() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:Boolean = false;
         var _loc4_:_1150 = null;
         var _loc5_:_1149 = null;
         if(motionPaths)
         {
            this._8865();
            _loc3_ = this._8774.x != 0 || this._8774.y != 0;
            _loc1_ = 0;
            while(_loc1_ < motionPaths.length)
            {
               _loc4_ = motionPaths[_loc1_];
               if(_loc3_ && (_loc4_.property == "translationX" || _loc4_.property == "translationY"))
               {
                  _loc2_ = 0;
                  while(_loc2_ < _loc4_._8781.length)
                  {
                     _loc5_ = _loc4_._8781[_loc2_];
                     if(this._8858(_loc5_.value))
                     {
                        if(_loc4_.property == "translationX")
                        {
                           _loc5_.value += this._8774.x;
                        }
                        else
                        {
                           _loc5_.value += this._8774.y;
                        }
                     }
                     _loc2_++;
                  }
               }
               _loc1_++;
            }
         }
         super.play();
      }
      
      override public function _8808(param1:Animation) : void
      {
         this._8818 = false;
         super._8808(param1);
      }
      
      private function _8865() : void
      {
         if(!this._8774)
         {
            this._8774 = new Point(0,0);
         }
         if(this._8768)
         {
            this._8774.x = target.width / 2;
            this._8774.y = target.height / 2;
         }
      }
      
      override protected function _8852(param1:String) : *
      {
         var _loc2_:Point = null;
         switch(param1)
         {
            case "translationX":
            case "translationY":
               this._8865();
               _loc2_ = _1168._8864(target as DisplayObject,this._8774);
               if(param1 == "translationX")
               {
                  return _loc2_.x;
               }
               if(param1 == "translationY")
               {
                  return _loc2_.y;
               }
               return;
               break;
            default:
               return super._8852(param1);
         }
      }
      
      override protected function _8860(param1:Animation) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Point = null;
         var _loc5_:Number = NaN;
         var _loc6_:int = 0;
         while(_loc6_ < motionPaths.length)
         {
            if(this._8869[motionPaths[_loc6_].property] !== undefined)
            {
               this._8869[motionPaths[_loc6_].property] = param1._2584[motionPaths[_loc6_].property];
            }
            else
            {
               setValue(motionPaths[_loc6_].property,param1._2584[motionPaths[_loc6_].property]);
            }
            _loc6_++;
         }
         _loc5_ = !isNaN(this._8869.rotation) ? Number(this._8869.rotation) : this._8852("rotation");
         _loc2_ = !isNaN(this._8869.scaleX) ? Number(this._8869.scaleX) : this._8852("scaleX");
         _loc3_ = !isNaN(this._8869.scaleY) ? Number(this._8869.scaleY) : this._8852("scaleY");
         position.x = !isNaN(this._8869.translationX) ? Number(this._8869.translationX) : this._8852("translationX");
         position.y = !isNaN(this._8869.translationY) ? Number(this._8869.translationY) : this._8852("translationY");
         if(!this._8866)
         {
            this._8866 = position.clone();
         }
         if(isNaN(this._8869.translationX) && Math.abs(position.x - this._8866.x) < 0.1)
         {
            position.x = this._8866.x;
         }
         if(isNaN(this._8869.translationY) && Math.abs(position.y - this._8866.y) < 0.1)
         {
            position.y = this._8866.y;
         }
         this._8866.x = position.x;
         this._8866.y = position.y;
         _loc4_ = position;
         _1168._8868(target as DisplayObject,this._8774,_loc4_,_loc2_,_loc3_,_loc5_);
      }
   }
}

