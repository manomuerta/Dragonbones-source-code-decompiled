package _1225
{
   import _1045.Label;
   import _1185._1196;
   import _1278._1277;
   import egret.core.ns_egret;
   import flash.text.TextFormatAlign;
   
   use namespace ns_egret;
   
   public class _1227 extends _1277
   {
      public var labelDisplay:Label;
      
      public function _1227()
      {
         super();
         states = ["up","over","down","disabled"];
         this.minHeight = 21;
         this.minWidth = 21;
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this.labelDisplay = new Label();
         this.labelDisplay.textAlign = TextFormatAlign.CENTER;
         this.labelDisplay.verticalAlign = _1196.MIDDLE;
         this.labelDisplay._6080 = 1;
         this.labelDisplay.left = 5;
         this.labelDisplay.right = 5;
         this.labelDisplay.top = 3;
         this.labelDisplay.bottom = 3;
         addElement(this.labelDisplay);
      }
      
      override public function _5823(param1:Number, param2:Number) : void
      {
         var _loc3_:uint = 0;
         super._5823(param1,param2);
         graphics.clear();
         switch(_2080)
         {
            case "up":
            case "disabled":
               ns_egret::_9048(0,0,param1,param2,ns_egret::_9052[0],ns_egret::_9049[0],[ns_egret::_9054[0],ns_egret::_9054[1]],ns_egret::_9051);
               _loc3_ = uint(ns_egret::_9053[0]);
               break;
            case "over":
               ns_egret::_9048(0,0,param1,param2,ns_egret::_9052[1],ns_egret::_9049[1],[ns_egret::_9054[2],ns_egret::_9054[3]],ns_egret::_9051);
               _loc3_ = uint(ns_egret::_9053[1]);
               break;
            case "down":
               ns_egret::_9048(0,0,param1,param2,ns_egret::_9052[2],ns_egret::_9049[2],[ns_egret::_9054[4],ns_egret::_9054[5]],ns_egret::_9051);
               _loc3_ = uint(ns_egret::_9053[1]);
         }
         if(this.labelDisplay)
         {
            this.labelDisplay.textColor = _loc3_;
            this.labelDisplay.ns_egret::_8525();
            this.labelDisplay.filters = _2080 == "over" || _2080 == "down" ? ns_egret::_9050 : null;
         }
      }
   }
}

