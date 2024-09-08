package _127
{
   import _1045.Group;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class _14039 extends Group
   {
      private var items:Array;
      
      private var _14335:ButtonItem;
      
      private var _14273:int = 0;
      
      public function _14039()
      {
         this.items = [];
         super();
      }
      
      override protected function _5823(param1:Number, param2:Number) : void
      {
         super._5823(param1,param2);
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this.left = this.top = this.bottom = 1;
         this.right = 0;
      }
      
      public function _14334(param1:Array) : void
      {
         var _loc3_:ButtonItem = null;
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = new ButtonItem();
            _loc3_.data = _loc2_;
            _loc3_.label = param1[_loc2_];
            addElement(_loc3_);
            _loc3_.addEventListener(MouseEvent.CLICK,this._6595);
            this.items.push(_loc3_);
            _loc2_++;
         }
      }
      
      private function _6595(param1:MouseEvent) : void
      {
         if(this._14335)
         {
            this._14335.enabled = true;
         }
         this._14335 = param1.currentTarget as ButtonItem;
         this._14335.enabled = false;
         this._14273 = this._14335.data;
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      public function get _14317() : int
      {
         return this._14273;
      }
      
      public function set _14317(param1:int) : void
      {
         this._14335 = this.items[param1];
         if(this._14335)
         {
            if(this._14335)
            {
               this._14335.enabled = true;
            }
            this._14335.enabled = false;
            this._14273 = this._14335.data;
         }
      }
   }
}

import _1045.Group;
import _1045.Label;
import _1185._1196;
import flash.events.MouseEvent;

class ButtonItem extends Group
{
   public var data:*;
   
   private var labelDisplay:Label;
   
   private var states:Array;
   
   private var _2080:String;
   
   private var _2361:int;
   
   private var _h:int;
   
   public function ButtonItem()
   {
      this.labelDisplay = new Label();
      super();
      this._2080 = "up";
   }
   
   override protected function _2438() : void
   {
      super._2438();
      this.percentWidth = 100;
      this.labelDisplay.verticalAlign = _1196.MIDDLE;
      this.labelDisplay._6080 = 1;
      this.labelDisplay.left = 5;
      this.labelDisplay.right = 5;
      this.labelDisplay.top = 3;
      this.labelDisplay.bottom = 3;
      addElement(this.labelDisplay);
      this.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseHandler);
      this.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseHandler);
      this.addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseHandler);
      this.addEventListener(MouseEvent.MOUSE_UP,this.onMouseHandler);
   }
   
   public function set label(param1:String) : void
   {
      this.labelDisplay.text = param1;
   }
   
   private function onMouseHandler(param1:MouseEvent) : void
   {
      var _loc2_:uint = 0;
      var _loc3_:Number = 1;
      switch(param1.type)
      {
         case MouseEvent.MOUSE_OVER:
            this._2080 = "over";
            _loc2_ = 3165778;
            _loc3_ = 0.3;
            break;
         case MouseEvent.MOUSE_OUT:
            this._2080 = "up";
            _loc2_ = 2041905;
            break;
         case MouseEvent.MOUSE_DOWN:
            this._2080 = "down";
            _loc2_ = 3165778;
            break;
         case MouseEvent.MOUSE_UP:
            this._2080 = "up";
            _loc2_ = 2041905;
      }
      this._9048(this._2361,this._h,_loc2_,_loc3_);
   }
   
   override protected function _5823(param1:Number, param2:Number) : void
   {
      var _loc3_:uint = 0;
      super._5823(param1,param2);
      this._2361 = param1;
      this._h = param2;
      var _loc4_:Number = 1;
      switch(this._2080)
      {
         case "up":
            _loc3_ = 2041905;
            break;
         case "over":
            _loc3_ = 3165778;
            _loc4_ = 0.3;
            break;
         case "disabled":
         case "down":
            _loc3_ = 3165778;
      }
      this._9048(param1,param2,_loc3_,_loc4_);
   }
   
   private function _9048(param1:Number, param2:Number, param3:uint, param4:Number = 1) : void
   {
      this.graphics.clear();
      this.graphics.beginFill(param3,param4);
      this.graphics.drawRect(0,0,param1,param2);
      this.graphics.endFill();
   }
   
   override public function set enabled(param1:Boolean) : void
   {
      var _loc2_:uint = 0;
      super.enabled = param1;
      if(param1)
      {
         this._2080 = "up";
         _loc2_ = 2041905;
         this.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseHandler);
         this.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseHandler);
         this.addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseHandler);
         this.addEventListener(MouseEvent.MOUSE_UP,this.onMouseHandler);
      }
      else
      {
         this._2080 = "disabled";
         _loc2_ = 3165778;
         this.removeEventListener(MouseEvent.MOUSE_OVER,this.onMouseHandler);
         this.removeEventListener(MouseEvent.MOUSE_OUT,this.onMouseHandler);
         this.removeEventListener(MouseEvent.MOUSE_DOWN,this.onMouseHandler);
         this.removeEventListener(MouseEvent.MOUSE_UP,this.onMouseHandler);
      }
      this._9048(this._2361,this._h,_loc2_);
   }
}

