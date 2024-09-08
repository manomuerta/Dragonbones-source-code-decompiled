package _1225
{
   import _1278._1277;
   import egret.core.ns_egret;
   import flash.display.GradientType;
   import flash.display.Graphics;
   
   use namespace ns_egret;
   
   public class _1256 extends _1277
   {
      public function _1256()
      {
         super();
         states = ["up","over","down","disabled"];
         this._2080 = "up";
         this.minHeight = 17;
         this.minWidth = 15;
      }
      
      override public function _5823(param1:Number, param2:Number) : void
      {
         var _loc4_:uint = 0;
         super._5823(param1,param2);
         var _loc3_:Graphics = graphics;
         _loc3_.clear();
         switch(_2080)
         {
            case "up":
            case "disabled":
               drawRoundRect(0,0,param1,param2,0,ns_egret::_9052[0],1,_9067(0,0,param1,param2),GradientType.LINEAR,null,{
                  "x":1,
                  "y":1,
                  "w":param1 - 2,
                  "h":param2 - 2,
                  "r":0
               });
               drawRoundRect(1,1,param1 - 2,param2 - 2,0,[ns_egret::_9054[0],ns_egret::_9054[1]],1,_9067(1,1,param1 - 2,param2 - 2),GradientType.LINEAR);
               _6107(param1 - 1,0,param1 - 1,param2,ns_egret::_9049[0]);
               _loc4_ = uint(ns_egret::_9053[0]);
               break;
            case "over":
               drawRoundRect(0,0,param1,param2,0,ns_egret::_9052[1],1,_9067(0,0,param1,param2),GradientType.LINEAR,null,{
                  "x":1,
                  "y":1,
                  "w":param1 - 2,
                  "h":param2 - 2,
                  "r":0
               });
               drawRoundRect(1,1,param1 - 2,param2 - 2,0,[ns_egret::_9054[2],ns_egret::_9054[3]],1,_9067(1,1,param1 - 2,param2 - 2),GradientType.LINEAR);
               _6107(param1 - 1,0,param1 - 1,param2,ns_egret::_9049[1]);
               _loc4_ = uint(ns_egret::_9053[1]);
               break;
            case "down":
               drawRoundRect(0,0,param1,param2,0,ns_egret::_9052[2],1,_9067(0,0,param1,param2),GradientType.LINEAR,null,{
                  "x":1,
                  "y":1,
                  "w":param1 - 2,
                  "h":param2 - 2,
                  "r":0
               });
               drawRoundRect(1,1,param1 - 2,param2 - 2,0,[ns_egret::_9054[4],ns_egret::_9054[5]],1,_9067(1,1,param1 - 2,param2 - 2),GradientType.LINEAR);
               _6107(param1 - 1,0,param1 - 1,param2,ns_egret::_9049[2]);
               _loc4_ = uint(ns_egret::_9053[1]);
         }
         _loc3_.lineStyle(0,0,0);
         _loc3_.beginFill(_loc4_);
         _loc3_.moveTo(param1 * 0.5,param2 * 0.5 - 3);
         _loc3_.lineTo(param1 * 0.5 - 3.5,param2 * 0.5 + 2);
         _loc3_.lineTo(param1 * 0.5 + 3.5,param2 * 0.5 + 2);
         _loc3_.lineTo(param1 * 0.5,param2 * 0.5 - 3);
         _loc3_.endFill();
      }
   }
}

