package _1376
{
   import _1045.Button;
   import _1421._1422;
   import egret.utils.tr;
   import flash.display.NativeMenu;
   import flash.display.NativeMenuItem;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class CloseTabButton extends _1378
   {
      private var _9585:NativeMenu;
      
      public var closeButton:Button;
      
      public function CloseTabButton()
      {
         super();
         mouseChildren = true;
         this.addEventListener(MouseEvent.RIGHT_CLICK,this._9584);
         this.addEventListener(MouseEvent.MIDDLE_CLICK,this._9582);
      }
      
      protected function _9582(param1:MouseEvent) : void
      {
         dispatchEvent(new _1422(_1422.CLOSE,true));
      }
      
      protected function _9584(param1:MouseEvent) : void
      {
         this.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
         if(!this._9585)
         {
            this._9585 = this._6375([tr("CloseTabButton.Close"),tr("CloseTabButton.CloseOther"),tr("CloseTabButton.CloseAll")]);
         }
         var _loc2_:Point = this.localToGlobal(new Point(this.mouseX,this.mouseY));
         this._9585.display(stage,_loc2_.x,_loc2_.y);
      }
      
      private function _6375(param1:Array) : NativeMenu
      {
         var _loc3_:NativeMenuItem = null;
         var _loc5_:String = null;
         var _loc2_:NativeMenu = new NativeMenu();
         var _loc4_:int = 0;
         for each(_loc5_ in param1)
         {
            _loc3_ = new NativeMenuItem(_loc5_,!_loc5_);
            if(_loc5_)
            {
               _loc3_.addEventListener(Event.SELECT,this._3935);
            }
            _loc2_.addItem(_loc3_);
            _loc4_++;
         }
         return _loc2_;
      }
      
      private function _3935(param1:Event) : void
      {
         switch(param1.target.label)
         {
            case tr("CloseTabButton.Close"):
               dispatchEvent(new _1422(_1422.CLOSE,true));
               break;
            case tr("CloseTabButton.CloseOther"):
               dispatchEvent(new _1422(_1422.CLOSE_OTHER,true));
               break;
            case tr("CloseTabButton.CloseAll"):
               dispatchEvent(new _1422(_1422.CLOSE_ALL,true));
         }
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         super.partAdded(param1,param2);
         if(param2 == this.closeButton)
         {
            this.closeButton.addEventListener(MouseEvent.MOUSE_DOWN,this._9583,false,2048);
            this.closeButton.addEventListener(MouseEvent.CLICK,this._2517);
         }
      }
      
      override protected function partRemoved(param1:String, param2:Object) : void
      {
         super.partRemoved(param1,param2);
         if(param2 == this.closeButton)
         {
            this.closeButton.removeEventListener(MouseEvent.CLICK,this._2517);
            this.closeButton.removeEventListener(MouseEvent.MOUSE_DOWN,this._9583);
         }
      }
      
      private function _9583(param1:MouseEvent) : void
      {
         param1.stopImmediatePropagation();
      }
      
      private function _2517(param1:MouseEvent) : void
      {
         param1.stopImmediatePropagation();
         dispatchEvent(new _1422(_1422.CLOSE,true));
      }
   }
}

