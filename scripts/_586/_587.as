package _586
{
   import _1177.ListEvent;
   import _51._52;
   import _783.StageNotification;
   import _93._94;
   import _948._947;
   import _953._954;
   import _97._99;
   
   public class _587 extends _94
   {
      private var _5001:_954;
      
      private var _4999:Vector.<_52>;
      
      private var _4998:Vector.<Object>;
      
      private var _4997:_52;
      
      private var _5003:Boolean;
      
      public function _587()
      {
         super();
         this._4998 = new Vector.<Object>();
         _1565(StageNotification.UPDATE_SELECTED_BINDING_BONE,this._4995);
      }
      
      override protected function _1576() : void
      {
         super._1576();
         _1565(StageNotification.START_WEIGHT_TOOL,this._4388);
         _1565(StageNotification.STOP_WEIGHT_TOOL,this._4404);
         _1565(StageNotification.OVER_FFD,this._5002);
         _99(this._4996);
         this._5001.addEventListener(ListEvent.ITEM_ROLL_OVER,this._4990);
         this._5001.addEventListener(ListEvent.ITEM_ROLL_OUT,this._4991);
         this._5001.addEventListener(ListEvent.ITEM_CLICK,this._4992);
      }
      
      private function _4996() : void
      {
         this._5001.mouseChildren = true;
         this._5001.mouseEnabled = true;
      }
      
      private function _4995(param1:StageNotification) : void
      {
         this._4998[0] = param1.data;
         this._4993();
      }
      
      private function _4993() : void
      {
      }
      
      private function _4388(param1:StageNotification) : void
      {
         this._4994();
      }
      
      public function _4994() : void
      {
         _1567(new StageNotification(StageNotification.UPDATE_SELECTED_BINDING_BONE,null));
      }
      
      override protected function dispose() : void
      {
         this._5003 = false;
         if(this._5001)
         {
            this._5001.enabled = true;
         }
         super.dispose();
         _1564(StageNotification.START_WEIGHT_TOOL,this._4388);
         _1564(StageNotification.STOP_WEIGHT_TOOL,this._4404);
         if(this._5001)
         {
            this._5001.removeEventListener(ListEvent.ITEM_ROLL_OVER,this._4990);
            this._5001.removeEventListener(ListEvent.ITEM_ROLL_OUT,this._4991);
            this._5001.removeEventListener(ListEvent.ITEM_CLICK,this._4992);
         }
      }
      
      private function _4404(param1:StageNotification) : void
      {
         this._4999 = null;
         this._4994();
         this.dispose();
      }
      
      public function set _3198(param1:_954) : void
      {
         if(this._5001 == param1)
         {
            return;
         }
         this._5001 = param1;
         this.dispose();
      }
      
      public function set _5000(param1:Vector.<_52>) : void
      {
         this._4999 = param1;
         if(Boolean(this._4999) && this._4999.length > 0)
         {
            this._4996();
            if(!_2227)
            {
               start();
            }
         }
      }
      
      private function _5002(param1:StageNotification) : void
      {
         this._5003 = param1.data;
         this._5001.enabled = !this._5003;
         if(param1.data)
         {
            if(this._4997 != null)
            {
               _1567(new StageNotification(StageNotification.ROLLOUT_BONE,this._4997));
            }
         }
         else if(this._4997 != null && this._4999 && this._4999.indexOf(this._4997) != -1)
         {
            _1567(new StageNotification(StageNotification.ROLLOVER_BONE,this._4997));
         }
      }
      
      private function _4990(param1:ListEvent) : void
      {
         var _loc2_:_52 = (param1.itemRenderer as _947)._1823;
         this._4997 = _loc2_;
         if(Boolean(this._4999) && this._4999.indexOf(_loc2_) != -1)
         {
            _1567(new StageNotification(StageNotification.ROLLOVER_BONE,_loc2_));
         }
      }
      
      private function _4991(param1:ListEvent) : void
      {
         var _loc2_:_52 = (param1.itemRenderer as _947)._1823;
         this._4997 = null;
         _1567(new StageNotification(StageNotification.ROLLOUT_BONE,_loc2_));
      }
      
      private function _4992(param1:ListEvent) : void
      {
         var _loc2_:_52 = param1.item as _52;
         if(this._5003)
         {
            return;
         }
         if(Boolean(this._4999) && this._4999.indexOf(_loc2_) != -1)
         {
            _1567(new StageNotification(StageNotification.UPDATE_SELECTED_BINDING_BONE,_loc2_));
         }
         else
         {
            this._4993();
         }
      }
   }
}

