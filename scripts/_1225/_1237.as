package _1225
{
   import _1278._1277;
   import egret.core.ns_egret;
   import flash.display.GradientType;
   
   use namespace ns_egret;
   
   public class _1237 extends _1277
   {
      public function _1237()
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
         drawRoundRect(0,0,param1,param2,0,ns_egret::_9052[0],1,_9056(0,0,param1,param2),GradientType.LINEAR,null,{
            "x":1,
            "y":1,
            "w":param1 - 2,
            "h":param2 - 2,
            "r":0
         });
         drawRoundRect(1,1,param1 - 2,param2 - 2,0,14539739,1,_9056(1,2,param1 - 2,param2 - 3));
         _6107(1,1,param1 - 1,1,12369084);
      }
   }
}

