package _1225
{
   import _1278._1277;
   import egret.core.ns_egret;
   import flash.display.Graphics;
   
   use namespace ns_egret;
   
   public class _1255 extends _1277
   {
      public function _1255()
      {
         super();
         states = ["up","over","down","disabled"];
         this._2080 = "up";
         this.minHeight = 15;
         this.minWidth = 17;
      }
      
      override public function _5823(param1:Number, param2:Number) : void
      {
         var _loc4_:uint = 0;
         super._5823(param1,param2);
         var _loc3_:Graphics = graphics;
         _loc3_.clear();
         var _loc5_:Object = 0;
         switch(_2080)
         {
            case "up":
            case "disabled":
               ns_egret::_9048(0,0,param1,param2,ns_egret::_9052[0],ns_egret::_9049[0],[ns_egret::_9054[0],ns_egret::_9054[1]],_loc5_);
               _loc4_ = uint(ns_egret::_9053[0]);
               break;
            case "over":
               ns_egret::_9048(0,0,param1,param2,ns_egret::_9052[1],ns_egret::_9049[1],[ns_egret::_9054[2],ns_egret::_9054[3]],_loc5_);
               _loc4_ = uint(ns_egret::_9053[1]);
               break;
            case "down":
               ns_egret::_9048(0,0,param1,param2,ns_egret::_9052[2],ns_egret::_9049[2],[ns_egret::_9054[4],ns_egret::_9054[5]],_loc5_);
               _loc4_ = uint(ns_egret::_9053[1]);
         }
         _loc3_.lineStyle(0,0,0);
         _loc3_.beginFill(_loc4_);
         _loc3_.moveTo(param1 * 0.5 + 3,param2 * 0.5);
         _loc3_.lineTo(param1 * 0.5 - 2,param2 * 0.5 - 3.5);
         _loc3_.lineTo(param1 * 0.5 - 2,param2 * 0.5 + 3.5);
         _loc3_.lineTo(param1 * 0.5 + 3,param2 * 0.5);
         _loc3_.endFill();
      }
   }
}

