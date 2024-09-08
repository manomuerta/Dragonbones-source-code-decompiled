package _1374
{
   import _1045._1082;
   import _1045._1085;
   import _1177.UIEvent;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class ColorPicker extends _1085
   {
      private var _9635:Boolean = false;
      
      public var _9633:_1082;
      
      private var _9630:uint = 39679;
      
      private var _9631:uint = 39679;
      
      public function ColorPicker()
      {
         super();
         mouseChildren = false;
         addEventListener(MouseEvent.CLICK,this._6595);
      }
      
      public function get _6193() : Boolean
      {
         return this._9635;
      }
      
      public function set _6193(param1:Boolean) : void
      {
         this._9635 = param1;
      }
      
      private function _6595(param1:MouseEvent) : void
      {
         var _loc2_:ColorWindow = new ColorWindow();
         _loc2_._9634 = this.stage;
         _loc2_._6193 = this._6193;
         _loc2_._4061 = this._9630;
         _loc2_._9636 = this._9630;
         _loc2_.defaultColor = this._9631;
         _loc2_.addEventListener(Event.CHANGE,this._9632);
         _loc2_.addEventListener(UIEvent.CONFIRM,this._7060);
         _loc2_.addEventListener(Event.CANCEL,this.onCancel);
         _loc2_.addEventListener(Event.CLEAR,this._9637);
         _loc2_.open();
      }
      
      protected function _9637(param1:Event) : void
      {
         dispatchEvent(new Event(Event.CLEAR));
      }
      
      protected function onCancel(param1:Event) : void
      {
         this._4061 = param1.currentTarget._9636;
         dispatchEvent(new Event(Event.CANCEL));
      }
      
      protected function _7060(param1:Event) : void
      {
         this._4061 = param1.currentTarget._4061;
         dispatchEvent(new UIEvent(UIEvent.CONFIRM));
      }
      
      private function _9632(param1:Event) : void
      {
         var _loc2_:* = this._9630 != param1.currentTarget._4061;
         this._4061 = param1.currentTarget._4061;
         _2449();
         if(_loc2_)
         {
            dispatchEvent(new Event(Event.CHANGE));
         }
      }
      
      public function get _4061() : uint
      {
         return this._9630;
      }
      
      public function set _4061(param1:uint) : void
      {
         if(this._9630 == param1)
         {
            return;
         }
         this._9630 = param1;
         if(this._9633)
         {
            this._9633.fillColor = this._9630;
         }
      }
      
      public function get defaultColor() : uint
      {
         return this._9631;
      }
      
      public function set defaultColor(param1:uint) : void
      {
         this._9631 = param1;
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         super.partAdded(param1,param2);
         if(param2 == this._9633)
         {
            this._9633.fillColor = this._9630;
         }
      }
   }
}

