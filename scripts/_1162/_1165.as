package _1162
{
   import _1148._1149;
   import _1148._1150;
   import egret.core.ns_egret;
   
   use namespace ns_egret;
   
   public class _1165 extends _1161
   {
      public var _5444:Number;
      
      public var _5452:Number;
      
      public function _1165(param1:Object)
      {
         super(param1);
      }
      
      override public function play() : void
      {
         var _loc1_:Number = this._5444;
         var _loc2_:Number = this._5452;
         if("visible" in target && !target.visible)
         {
            if(isNaN(_loc1_))
            {
               _loc1_ = Number(target.alpha);
            }
            if(isNaN(_loc2_))
            {
               _loc2_ = Number(target.alpha);
            }
            if(_loc1_ == 0 && _loc2_ != 0)
            {
               target.alpha = 0;
               target.visible = true;
            }
         }
         motionPaths = new <_1150>[new _1150("alpha")];
         motionPaths[0]._8781 = new <_1149>[new _1149(0,this._5444),new _1149(duration,this._5452)];
         super.play();
      }
   }
}

