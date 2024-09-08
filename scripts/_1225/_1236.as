package _1225
{
   import _1278._1277;
   import egret.core.ns_egret;
   
   use namespace ns_egret;
   
   public class _1236 extends _1277
   {
      public function _1236()
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
               ns_egret::_9048(0,0,param1,param2,ns_egret::_9052[0],ns_egret::_9049[0],[ns_egret::_9054[0],ns_egret::_9054[1]],1);
               break;
            case "over":
               ns_egret::_9048(0,0,param1,param2,ns_egret::_9052[1],ns_egret::_9049[1],[ns_egret::_9054[2],ns_egret::_9054[3]],1);
               break;
            case "down":
               ns_egret::_9048(0,0,param1,param2,ns_egret::_9052[2],ns_egret::_9049[2],[ns_egret::_9054[4],ns_egret::_9054[5]],1);
         }
      }
   }
}

