package _1374
{
   import _1045.TabBar;
   import _1045._1070;
   import _1045._1085;
   import _1177.RendererExistenceEvent;
   import egret.core._1133;
   import egret.core.ns_egret;
   import flash.events.MouseEvent;
   
   use namespace ns_egret;
   
   public class _1391 extends TabBar
   {
      public var _9749:Class;
      
      public var _9748:Class;
      
      public var _9750:Class;
      
      public function _1391()
      {
         super();
      }
      
      override public function _2481(param1:_1070, param2:int, param3:Object) : _1070
      {
         if(param2 == 0 && Boolean(this._9749))
         {
            (param1 as _1085).skinName = this._9749;
         }
         else if(param2 == dataProvider.length - 1 && Boolean(this._9750))
         {
            (param1 as _1085).skinName = this._9750;
         }
         else if(this._9748)
         {
            (param1 as _1085).skinName = this._9748;
         }
         return super._2481(param1,param2,param3);
      }
      
      override protected function _2603(param1:RendererExistenceEvent) : void
      {
         super._2603(param1);
         var _loc2_:_1070 = param1._2487;
         if(_loc2_)
         {
            _loc2_.removeEventListener(MouseEvent.MOUSE_DOWN,this._8095);
         }
      }
      
      private function _8095(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         if(param1.currentTarget is _1070)
         {
            _loc2_ = _1070(param1.currentTarget).itemIndex;
         }
         else
         {
            _loc2_ = _2490.getElementIndex(param1.currentTarget as _1133);
         }
         var _loc3_:int = selectedIndex;
         if(_loc2_ == selectedIndex)
         {
            if(!_6678)
            {
               ns_egret::_2475(NO_SELECTION,true);
            }
         }
         else
         {
            ns_egret::_2475(_loc2_,true);
         }
      }
   }
}

