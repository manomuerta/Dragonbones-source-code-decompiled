package _14240
{
   import flash.geom.Point;
   
   public final class Bezier
   {
      public static var tolerance:Number = 1;
      
      public static var _15492:Object = new Object();
      
      public var p1:Point = null;
      
      public var p2:Point = null;
      
      public var c1:Point = null;
      
      public var c2:Point = null;
      
      public var _15427:Array = null;
      
      public function Bezier(param1:Point, param2:Point, param3:Point, param4:Point)
      {
         super();
         this.p1 = param1;
         this.p2 = param4;
         this.c1 = param2;
         this.c2 = param3;
         this._15427 = new Array();
         this._15491(this.p1,this.c1,this.c2,this.p2);
      }
      
      private function _15491(param1:Point, param2:Point, param3:Point, param4:Point) : void
      {
         if(tolerance == 0)
         {
            this._15490(param1,param2,param3,param4);
         }
         else
         {
            this._15489(param1,param2,param3,param4);
         }
      }
      
      private function _15490(param1:Point, param2:Point, param3:Point, param4:Point) : void
      {
         var _loc5_:Point = Point.interpolate(param1,param2,3 / 4);
         var _loc6_:Point = Point.interpolate(param4,param3,3 / 4);
         var _loc7_:Number = (param4.x - param1.x) / 16;
         var _loc8_:Number = (param4.y - param1.y) / 16;
         var _loc9_:Point = Point.interpolate(param1,param2,3 / 8);
         var _loc10_:Point = Point.interpolate(_loc5_,_loc6_,3 / 8);
         _loc10_.x -= _loc7_;
         _loc10_.y -= _loc8_;
         var _loc11_:Point = Point.interpolate(_loc6_,_loc5_,3 / 8);
         _loc11_.x += _loc7_;
         _loc11_.y += _loc8_;
         var _loc12_:Point = Point.interpolate(param4,param3,3 / 8);
         var _loc13_:Point = Point.interpolate(_loc9_,_loc10_,0.5);
         var _loc14_:Point = Point.interpolate(_loc5_,_loc6_,0.5);
         var _loc15_:Point = Point.interpolate(_loc11_,_loc12_,0.5);
         this._15427 = [{
            "s":param1,
            "p":_loc13_,
            "c":_loc9_
         },{
            "s":_loc13_,
            "p":_loc14_,
            "c":_loc10_
         },{
            "s":_loc14_,
            "p":_loc15_,
            "c":_loc11_
         },{
            "s":_loc15_,
            "p":param4,
            "c":_loc12_
         }];
      }
      
      private function _15489(param1:Point, param2:Point, param3:Point, param4:Point) : void
      {
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Point = null;
         var _loc5_:Point = _14244._15488(param1,param2,param3,param4);
         if((_loc5_) && !isNaN(_loc5_.x) && !isNaN(_loc5_.y))
         {
            _loc9_ = (param1.x + param4.x + _loc5_.x * 4 - (param2.x + param3.x) * 3) * 0.125;
            _loc10_ = (param1.y + param4.y + _loc5_.y * 4 - (param2.y + param3.y) * 3) * 0.125;
            if(_loc9_ * _loc9_ + _loc10_ * _loc10_ <= tolerance * tolerance)
            {
               this._15427.push({
                  "s":param1,
                  "p":param4,
                  "c":_loc5_
               });
               return;
            }
         }
         else
         {
            _loc11_ = Point.interpolate(param1,param4,0.5);
            if(Point.distance(param1,_loc11_) <= tolerance)
            {
               this._15427.push({
                  "s":param1,
                  "p":param4,
                  "c":_loc11_
               });
               return;
            }
         }
         var _loc6_:Object = _14244._15493(param1,param2,param3,param4);
         var _loc7_:Object = _loc6_.b0;
         var _loc8_:Object = _loc6_.b1;
         this._15491(param1,_loc7_.b,_loc7_.c,_loc7_.d);
         this._15491(_loc8_.a,_loc8_.b,_loc8_.c,param4);
      }
   }
}

