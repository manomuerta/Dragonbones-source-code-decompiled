package egret.managers
{
   import egret.core._1130;
   import flash.display.InteractiveObject;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   public class _1201 implements _1204
   {
      private var _stage:Stage;
      
      private var _8963:_1130;
      
      public function _1201()
      {
         super();
      }
      
      public function get stage() : Stage
      {
         return this._stage;
      }
      
      public function set stage(param1:Stage) : void
      {
         if(this._stage == param1)
         {
            return;
         }
         var _loc2_:Stage = !!this._stage ? this.stage : param1;
         if(param1)
         {
            _loc2_.addEventListener(MouseEvent.MOUSE_DOWN,this._4063);
            _loc2_.addEventListener(FocusEvent.MOUSE_FOCUS_CHANGE,this._8961);
            _loc2_.addEventListener(Event.ACTIVATE,this._4172);
            _loc2_.addEventListener(FocusEvent.FOCUS_IN,this._2574,true);
         }
         else
         {
            _loc2_.removeEventListener(MouseEvent.MOUSE_DOWN,this._4063);
            _loc2_.removeEventListener(FocusEvent.MOUSE_FOCUS_CHANGE,this._8961);
            _loc2_.removeEventListener(Event.ACTIVATE,this._4172);
            _loc2_.removeEventListener(FocusEvent.FOCUS_IN,this._2574,true);
         }
         this._stage = param1;
      }
      
      private function _8961(param1:FocusEvent) : void
      {
         var _loc2_:TextField = null;
         if(param1.isDefaultPrevented())
         {
            return;
         }
         if(param1.relatedObject is TextField)
         {
            _loc2_ = param1.relatedObject as TextField;
            if(_loc2_.type == "input" || _loc2_.selectable || _loc2_.htmlText && _loc2_.htmlText.indexOf("</A>") != -1)
            {
               return;
            }
         }
         param1.preventDefault();
      }
      
      private function _4063(param1:MouseEvent) : void
      {
         var _loc2_:_1130 = this._8962(InteractiveObject(param1.target));
         if(!_loc2_)
         {
            return;
         }
         if((_loc2_ != this._8963 || !this.stage.focus) && !(_loc2_ is TextField))
         {
            _loc2_._2581();
         }
      }
      
      private function _2574(param1:FocusEvent) : void
      {
         this._8963 = this._8962(InteractiveObject(param1.target));
      }
      
      private function _8962(param1:InteractiveObject) : _1130
      {
         while(param1)
         {
            if(param1 is _1130 && _1130(param1)._2576 && _1130(param1).enabled)
            {
               return param1 as _1130;
            }
            param1 = param1.parent;
         }
         return null;
      }
      
      private function _4172(param1:Event) : void
      {
         if(this._8963)
         {
            this._8963._2581();
         }
      }
   }
}

