package _388
{
   import _1404._1407;
   import _573.TimelinePanelController;
   
   public class _405 extends _408
   {
      public function _405()
      {
         super();
         _2215 = true;
         _2219 = true;
      }
      
      override public function execute() : void
      {
         super.execute();
         _3358.type = "visible";
         _3358._3210 = _3355;
         _2223._3355 = _3355;
         _3358._3211 = true;
         _3353._1572(_3358);
         _3353.execute();
         _3359.type = "selectable";
         _3359._3210 = _3354;
         _2223._3354 = _3354;
         _3359._3211 = true;
         _3352._1572(_3359);
         _3352.execute();
         _2223.sceneSelectable = _2880._3357;
         _2223.sceneVisible = _2880._3356;
         if(_2880._3357 != 1)
         {
            _2880._3338("selectable",1);
         }
         if(_2880._3356 != 1)
         {
            _2880._3338("visible",1);
         }
         _2223.timeSelectable = this._3208._3357;
         _2223.timeVisible = this._3208._3356;
         var _loc1_:Object = {
            "type":"selectable",
            "value":1
         };
         var _loc2_:Object = {
            "type":"visible",
            "value":1
         };
         var _loc3_:Array = [];
         if(this._3208._3357 != 1)
         {
            _loc3_.push(_loc1_);
         }
         if(this._3208._3356 != 1)
         {
            _loc3_.push(_loc2_);
         }
         if(_loc3_.length > 0)
         {
            this._3208._3336(_loc3_);
         }
      }
      
      override public function revert() : void
      {
         super.revert();
         _3358.type = "visible";
         _3358._3210 = _2223._3355;
         _3358._3211 = false;
         _3353._1572(_3358);
         _3353.execute();
         _3359.type = "selectable";
         _3359._3210 = _2223._3354;
         _3359._3211 = false;
         _3352._1572(_3359);
         _3352.execute();
         _2880._3338("selectable",_2223.sceneSelectable);
         _2880._3338("visible",_2223.sceneVisible);
         var _loc1_:Object = {
            "type":"selectable",
            "value":_2223.timeSelectable
         };
         var _loc2_:Object = {
            "type":"visible",
            "value":_2223.timeVisible
         };
         var _loc3_:Array = [_loc1_,_loc2_];
         this._3208._3336(_loc3_);
      }
      
      override public function _1572(param1:*) : void
      {
         if(!param1)
         {
            param1 = {};
         }
         super._2223 = param1;
      }
      
      protected function get _3208() : TimelinePanelController
      {
         return _1407.getInstance(TimelinePanelController) as TimelinePanelController;
      }
   }
}

