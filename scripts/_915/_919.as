package _915
{
   import _1049._1057;
   import _1177.UIEvent;
   import _1374.TextInput;
   import _636.MeshEvent;
   import flash.events.Event;
   import flash.events.FocusEvent;
   
   public class _919 extends _1049._1057
   {
      public var _6521:TextInput;
      
      public var _6593:_918;
      
      public function _919()
      {
         super();
         this.skinName = _920;
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         super.partAdded(param1,param2);
         if(param2 == this._6593)
         {
            this._6593.addEventListener(Event.CHANGE,this._6590);
            this._6593.addEventListener(UIEvent.CHANGE_END,this._6592);
         }
         if(param2 == this._6521)
         {
            this._6521.addEventListener(FocusEvent.FOCUS_OUT,this._6591);
         }
         this.update();
      }
      
      private function _6592(param1:UIEvent) : void
      {
         this._6593.enabled = data.weight < 1;
      }
      
      private function _6590(param1:Event) : void
      {
         var _loc2_:Number = this._6593.value * 0.01;
         this.owner.dispatchEvent(new MeshEvent(MeshEvent.MODIFY_BAR_WEIGHT,_loc2_));
      }
      
      override public function prepare(param1:Boolean) : void
      {
         super.prepare(param1);
         this.update();
      }
      
      private function update() : void
      {
         var _loc2_:Boolean = false;
         var _loc3_:int = 0;
         var _loc1_:Object = data;
         if(_loc1_)
         {
            if(Boolean(stage) && Boolean(stage.focus))
            {
               if(this._6521.contains(stage.focus))
               {
                  stage.focus = null;
               }
            }
            _loc3_ = _loc1_.weight * 100;
            if(_loc3_ < 0)
            {
               _loc3_ = 0;
               _loc2_ = true;
            }
            if(this._6521)
            {
               this._6521.text = _loc3_.toString();
               this._6521.enabled = _loc1_.weight < 1;
            }
            if(this._6593)
            {
               this._6593.value = _loc3_;
               this._6593._2449();
            }
            if(_loc3_ < 100 && Boolean(this._6593))
            {
               this._6593.enabled = true;
            }
            if(_loc2_ && this._6521 && Boolean(this._6593))
            {
               this._6521.enabled = false;
               this._6593.enabled = false;
            }
         }
      }
      
      override public function set data(param1:Object) : void
      {
         super.data = param1;
      }
      
      private function _6591(param1:Event) : void
      {
         var _loc2_:Number = Number(this._6521.text);
         if(isNaN(_loc2_))
         {
            this._6521.text = int(data.weight * 100).toString();
            return;
         }
         _loc2_ *= 0.01;
         if(_loc2_ > 1)
         {
            this._6521.text = "100";
            _loc2_ = 1;
         }
         this.owner.dispatchEvent(new MeshEvent(MeshEvent.MODIFY_WEIGHT,_loc2_));
      }
   }
}

