package _978
{
   import _1177.ListEvent;
   import _1177.RendererExistenceEvent;
   import _127._130;
   import egret.core.ns_egret;
   import flash.display.DisplayObject;
   
   use namespace ns_egret;
   
   public class _985 extends _130
   {
      public function _985()
      {
         super();
         this.addEventListener(ListEvent.ITEM_ROLL_OVER,this._6955);
         this.addEventListener(ListEvent.ITEM_ROLL_OUT,this._6956);
      }
      
      private function _6955(param1:ListEvent) : void
      {
         (param1.itemRenderer as _986)._4901 = true;
      }
      
      private function _6956(param1:ListEvent) : void
      {
         (param1.itemRenderer as _986)._4901 = false;
      }
      
      override public function addChild(param1:DisplayObject) : DisplayObject
      {
         ns_egret::_1607(param1);
         return param1;
      }
      
      override protected function _2463(param1:RendererExistenceEvent) : void
      {
         super._2463(param1);
         var _loc2_:DisplayObject = param1._2487 as DisplayObject;
         if(_loc2_ == null)
         {
            return;
         }
         (_loc2_ as _986)._4901 = false;
      }
   }
}

