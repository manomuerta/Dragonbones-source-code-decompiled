package _1075
{
   import _1045.Label;
   import _1045.SkinnableContainer;
   import _1045._1105;
   import flash.events.MouseEvent;
   
   public class MenuBarItemRenderer extends SkinnableContainer implements _1076
   {
      private var _state:String = "up";
      
      private var _data:Object;
      
      private var _8143:Boolean = false;
      
      public var _2448:_1105;
      
      public var labelDisplay:Label;
      
      private var _icon:Object;
      
      private var _2541:String;
      
      public function MenuBarItemRenderer()
      {
         super();
         mouseChildren = false;
         this.addEventListener(MouseEvent.MOUSE_DOWN,this._8141);
         this.addEventListener(MouseEvent.ROLL_OVER,this._8132);
         this.addEventListener(MouseEvent.ROLL_OUT,this._8142);
      }
      
      protected function _8142(param1:MouseEvent) : void
      {
         if(!this._8143)
         {
            this._state = "up";
         }
         _6232();
      }
      
      protected function _8141(param1:MouseEvent) : void
      {
         this._state = "down";
         _6232();
      }
      
      protected function _8132(param1:MouseEvent) : void
      {
         if(!this._8143)
         {
            this._state = "over";
         }
         _6232();
      }
      
      public function get _8136() : Boolean
      {
         return this._8143;
      }
      
      public function set _8136(param1:Boolean) : void
      {
         this._8143 = param1;
         if(this._8143 == false)
         {
            this._state = "up";
            _2570();
         }
      }
      
      public function get data() : Object
      {
         return this._data;
      }
      
      public function set data(param1:Object) : void
      {
         this._data = param1;
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         super.partAdded(param1,param2);
         if(Boolean(this.icon) && param2 == this._2448)
         {
            this._2448.source = this.icon;
         }
         if(Boolean(this.label) && param2 == this.labelDisplay)
         {
            this.labelDisplay.text = this.label;
         }
      }
      
      public function get icon() : Object
      {
         return this._icon;
      }
      
      public function set icon(param1:Object) : void
      {
         this._icon = param1;
         if(this._2448)
         {
            this._2448.source = param1;
         }
      }
      
      public function get label() : String
      {
         return this._2541;
      }
      
      public function set label(param1:String) : void
      {
         this._2541 = param1;
         if(this.labelDisplay)
         {
            this.labelDisplay.text = param1;
         }
      }
      
      override protected function _6231() : String
      {
         return this._state;
      }
      
      public function _8137() : void
      {
         this._state = "down";
         _6232();
      }
      
      public function _8139() : void
      {
         this._state = "up";
         _6232();
      }
   }
}

