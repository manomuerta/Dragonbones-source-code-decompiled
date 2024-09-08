package _127
{
   import _1045.ComboBox;
   import _1045.TextInput;
   import _1045._1047;
   import _1045._1105;
   import _1177.DragEvent;
   import _1404._1406;
   import egret.core._1140;
   import egret.managers.DragManager;
   import egret.utils._99;
   import flash.display.DisplayObject;
   import flash.events.FocusEvent;
   import flash.events.KeyboardEvent;
   import flash.ui.Keyboard;
   
   public class _14047 extends TextInput
   {
      private var _9809:Boolean = false;
      
      public var _9806:Function;
      
      public var _9807:Function;
      
      public var _2578:_1105;
      
      public var _2582:_1105;
      
      public function _14047()
      {
         super();
         addEventListener(FocusEvent.FOCUS_IN,this._2574);
         addEventListener(FocusEvent.FOCUS_OUT,this.focusOutHandler);
      }
      
      public function get _9810() : Boolean
      {
         return this._9809;
      }
      
      public function set _9810(param1:Boolean) : void
      {
         this._9809 = param1;
         if(this._9809)
         {
            addEventListener(DragEvent.DRAG_ENTER,this._9808);
            addEventListener(DragEvent.DRAG_DROP,this._4532);
         }
         else
         {
            removeEventListener(DragEvent.DRAG_ENTER,this._9808);
            removeEventListener(DragEvent.DRAG_DROP,this._4532);
         }
      }
      
      private function _9808(param1:DragEvent) : void
      {
         var _loc2_:Object = null;
         if(param1._1611.hasFormat(_1406.DRAG_STRING))
         {
            if(this._9807 != null)
            {
               _loc2_ = param1._1611._4508(_1406.DRAG_STRING);
               if(this._9807(this,_loc2_))
               {
                  DragManager.acceptDragDrop(this);
                  _2581();
               }
            }
            else
            {
               DragManager.acceptDragDrop(this);
               _2581();
            }
         }
      }
      
      private function _4532(param1:DragEvent) : void
      {
         var _loc2_:Object = param1._1611._4508(_1406.DRAG_STRING);
         if(this._9806 != null)
         {
            this._9806(this,_loc2_);
         }
         else
         {
            this.text = String(_loc2_);
            stage.focus = stage;
         }
      }
      
      protected function _2574(param1:FocusEvent) : void
      {
         if(param1.target == this)
         {
            _2581();
         }
         addEventListener(KeyboardEvent.KEY_DOWN,this._2575);
         if(this._2578)
         {
            this._2578.visible = false;
         }
         if(this._2582)
         {
            this._2582.visible = true;
         }
         _99(_2577.selectAll);
         _2570();
      }
      
      private function _2575(param1:KeyboardEvent) : void
      {
         var _loc2_:DisplayObject = null;
         if(param1.keyCode == Keyboard.ENTER && Boolean(stage))
         {
            _loc2_ = this;
            while(_loc2_)
            {
               _loc2_ = _loc2_.parent;
               if(_loc2_ && _loc2_ is _1140 && _1140(_loc2_)._2576 == true && !(_loc2_ is ComboBox))
               {
                  _1140(_loc2_)._2581();
                  break;
               }
            }
         }
      }
      
      protected function focusOutHandler(param1:FocusEvent) : void
      {
         removeEventListener(KeyboardEvent.KEY_DOWN,this._2575);
         if(this._2578)
         {
            this._2578.visible = true;
         }
         if(this._2582)
         {
            this._2582.visible = false;
         }
         _2570();
      }
      
      public function set scrollH(param1:Number) : void
      {
         var _loc2_:_1047 = _2577 as _1047;
         if(_loc2_)
         {
            _loc2_.horizontalScrollPosition = param1;
         }
      }
   }
}

