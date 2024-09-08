package _1225
{
   import _1278._1277;
   import egret.core.ns_egret;
   import flash.display.GradientType;
   
   use namespace ns_egret;
   
   public class _1271 extends _1277
   {
      public function _1271()
      {
         super();
         states = ["up","over","down","disabled"];
         this._2080 = "up";
         this.minHeight = 15;
         this.minWidth = 15;
      }
      
      override public function _5823(param1:Number, param2:Number) : void
      {
         super._5823(param1,param2);
         graphics.clear();
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
         }
      }
   }
}

