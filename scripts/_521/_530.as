package _521
{
   import _51._52;
   import _6._7;
   import _708._717;
   import _783.CommandNotification;
   import _783.StageNotification;
   import _97._99;
   import flash.events.MouseEvent;
   
   public class _530 extends _7
   {
      public static var instance:_530 = new _530();
      
      private var _3830:Boolean = false;
      
      private var target:Object;
      
      private var _3824:Array;
      
      private var _3828:Function;
      
      private var _3826:Boolean;
      
      public function _530()
      {
         super();
      }
      
      public function _3833(param1:Object, param2:Function, param3:Array = null, param4:Boolean = false) : void
      {
         if(!this._3832)
         {
            this._3827(true);
            this.target = param1;
            this._3826 = param4;
            this._3828 = param2;
            this._3824 = param3;
            _1565(StageNotification.PICK_ITEM,this._3831);
            _99(this._3829);
            _1567(new StageNotification(StageNotification.START_PICK));
         }
      }
      
      public function get _14525() : Array
      {
         return this._3824;
      }
      
      public function _3834() : void
      {
         if(this._3832)
         {
            this._3827(false);
            _1564(StageNotification.PICK_ITEM,this._3831);
            stage.removeEventListener(MouseEvent.CLICK,this._3825);
            stage.removeEventListener(MouseEvent.RIGHT_CLICK,this._3825);
            _1567(new StageNotification(StageNotification.STOP_PICK));
         }
      }
      
      private function _3831(param1:StageNotification) : void
      {
         var _loc3_:Object = null;
         var _loc2_:_52 = param1.data as _52;
         for each(_loc3_ in this._3824)
         {
            if(_loc3_ == _loc2_)
            {
               return;
            }
         }
         this._3828(this.target,_loc2_);
         if(!this._3826)
         {
            this._3834();
         }
      }
      
      private function _3829() : void
      {
         stage.addEventListener(MouseEvent.CLICK,this._3825);
         stage.addEventListener(MouseEvent.RIGHT_CLICK,this._3825);
      }
      
      private function _3825(param1:MouseEvent) : void
      {
         if(_524._3784("pick") != "click")
         {
            this._3834();
            _1567(new CommandNotification(CommandNotification.HIDE_TOOL_TIP,_717.TRACE));
         }
      }
      
      private function _3827(param1:Boolean) : void
      {
         this._3830 = param1;
         if(param1 == false)
         {
            _1567(new CommandNotification(CommandNotification.HIDE_TOOL_TIP,_717.TRACE));
         }
      }
      
      public function get _3832() : Boolean
      {
         return this._3830;
      }
   }
}

