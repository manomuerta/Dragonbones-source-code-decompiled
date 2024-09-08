package _579
{
   import _470._469;
   import _755._760;
   import _783.CommandNotification;
   import _783.StageNotification;
   import _822._829;
   import _93._94;
   import _953.StageFilterBar;
   import flash.events.Event;
   
   public class _578 extends _94
   {
      private var _4844:StageFilterBar;
      
      public function _578()
      {
         super();
      }
      
      override public function start() : void
      {
         super.start();
      }
      
      override protected function init() : void
      {
         super.init();
      }
      
      override protected function _1576() : void
      {
         super._1576();
         this._4845.addEventListener(Event.CHANGE,this._4847);
         this._4843.addEventListener(Event.CHANGE,this._4847);
         this._4842.addEventListener(Event.CHANGE,this._4847);
         this._4841.addEventListener(Event.CHANGE,this._4847);
         this._4840.addEventListener(Event.CHANGE,this._4838);
         this._4839.addEventListener(Event.CHANGE,this._4838);
      }
      
      override protected function dispose() : void
      {
         super.dispose();
      }
      
      private function _4847(param1:Event) : void
      {
         var _loc2_:_829 = param1.currentTarget as _829;
         var _loc3_:Object = _469._3470(_loc2_.data.target,_loc2_.data.type,_loc2_.selected);
         _1567(new CommandNotification(CommandNotification.CHANGE_GLOBAL_STAGE_FILTER,_loc3_));
      }
      
      public function _3360(param1:Boolean = true) : void
      {
         var _loc2_:_829 = null;
         if(!this._4844 || !this._4845 || !this._4845.data || !this._4845.data.hasOwnProperty("target") || !this._4845.data.hasOwnProperty("type"))
         {
            return;
         }
         if(param1)
         {
            _loc2_ = this._4843;
         }
         else
         {
            _loc2_ = this._4845;
         }
         _loc2_.selected = !_loc2_.selected;
         var _loc3_:Object = _469._3470(_loc2_.data.target,_loc2_.data.type,_loc2_.selected);
         _1567(new CommandNotification(CommandNotification.CHANGE_GLOBAL_STAGE_FILTER,_loc3_));
      }
      
      private function _4838(param1:Event) : void
      {
         var _loc2_:_829 = param1.currentTarget as _829;
         var _loc3_:Object = _469._3471(_loc2_.data.target,_loc2_.selected);
         _1567(new CommandNotification(CommandNotification.CHANGE_INHERITED_EDITABLE,_loc3_));
      }
      
      public function _3341() : void
      {
         this._4844._3095();
         _1567(new StageNotification(StageNotification.UPDATE_FILTER_STATUS));
      }
      
      public function _3330() : void
      {
         this._4840.selected = _2214._1844._2969;
         this._4839.selected = _2214._1844._2968;
      }
      
      public function set _4846(param1:StageFilterBar) : void
      {
         if(this._4844 == param1)
         {
            return;
         }
         if(this._4844)
         {
            this.dispose();
         }
         this._4844 = param1;
         if(this._4844)
         {
            this.start();
         }
      }
      
      public function get _3286() : _760
      {
         return this._4844._3286;
      }
      
      protected function get _4845() : _829
      {
         return this._4844._4845;
      }
      
      protected function get _4843() : _829
      {
         return this._4844._4843;
      }
      
      protected function get _4842() : _829
      {
         return this._4844._4842;
      }
      
      protected function get _4841() : _829
      {
         return this._4844._4841;
      }
      
      protected function get _4840() : _829
      {
         return this._4844._4840;
      }
      
      protected function get _4839() : _829
      {
         return this._4844._4839;
      }
   }
}

