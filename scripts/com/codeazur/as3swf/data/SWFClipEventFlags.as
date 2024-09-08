package com.codeazur.as3swf.data
{
   import com.codeazur.as3swf.SWFData;
   
   public class SWFClipEventFlags
   {
      public var keyUpEvent:Boolean;
      
      public var keyDownEvent:Boolean;
      
      public var mouseUpEvent:Boolean;
      
      public var mouseDownEvent:Boolean;
      
      public var mouseMoveEvent:Boolean;
      
      public var unloadEvent:Boolean;
      
      public var enterFrameEvent:Boolean;
      
      public var loadEvent:Boolean;
      
      public var dragOverEvent:Boolean;
      
      public var rollOutEvent:Boolean;
      
      public var rollOverEvent:Boolean;
      
      public var releaseOutsideEvent:Boolean;
      
      public var releaseEvent:Boolean;
      
      public var pressEvent:Boolean;
      
      public var initializeEvent:Boolean;
      
      public var dataEvent:Boolean;
      
      public var constructEvent:Boolean;
      
      public var keyPressEvent:Boolean;
      
      public var dragOutEvent:Boolean;
      
      public function SWFClipEventFlags(param1:SWFData = null, param2:uint = 0)
      {
         super();
         if(param1 != null)
         {
            this.parse(param1,param2);
         }
      }
      
      public function parse(param1:SWFData, param2:uint) : void
      {
         var _loc5_:uint = 0;
         var _loc3_:uint = param1.readUI8();
         this.keyUpEvent = (_loc3_ & 0x80) != 0;
         this.keyDownEvent = (_loc3_ & 0x40) != 0;
         this.mouseUpEvent = (_loc3_ & 0x20) != 0;
         this.mouseDownEvent = (_loc3_ & 0x10) != 0;
         this.mouseMoveEvent = (_loc3_ & 8) != 0;
         this.unloadEvent = (_loc3_ & 4) != 0;
         this.enterFrameEvent = (_loc3_ & 2) != 0;
         this.loadEvent = (_loc3_ & 1) != 0;
         var _loc4_:uint = param1.readUI8();
         this.dragOverEvent = (_loc4_ & 0x80) != 0;
         this.rollOutEvent = (_loc4_ & 0x40) != 0;
         this.rollOverEvent = (_loc4_ & 0x20) != 0;
         this.releaseOutsideEvent = (_loc4_ & 0x10) != 0;
         this.releaseEvent = (_loc4_ & 8) != 0;
         this.pressEvent = (_loc4_ & 4) != 0;
         this.initializeEvent = (_loc4_ & 2) != 0;
         this.dataEvent = (_loc4_ & 1) != 0;
         if(param2 >= 6)
         {
            _loc5_ = param1.readUI8();
            this.constructEvent = (_loc5_ & 4) != 0;
            this.keyPressEvent = (_loc5_ & 2) != 0;
            this.dragOutEvent = (_loc5_ & 1) != 0;
            param1.readUI8();
         }
      }
      
      public function publish(param1:SWFData, param2:uint) : void
      {
         var _loc5_:uint = 0;
         var _loc3_:uint = 0;
         if(this.keyUpEvent)
         {
            _loc3_ |= 128;
         }
         if(this.keyDownEvent)
         {
            _loc3_ |= 64;
         }
         if(this.mouseUpEvent)
         {
            _loc3_ |= 32;
         }
         if(this.mouseDownEvent)
         {
            _loc3_ |= 16;
         }
         if(this.mouseMoveEvent)
         {
            _loc3_ |= 8;
         }
         if(this.unloadEvent)
         {
            _loc3_ |= 4;
         }
         if(this.enterFrameEvent)
         {
            _loc3_ |= 2;
         }
         if(this.loadEvent)
         {
            _loc3_ |= 1;
         }
         param1.writeUI8(_loc3_);
         var _loc4_:uint = 0;
         if(this.dragOverEvent)
         {
            _loc4_ |= 128;
         }
         if(this.rollOutEvent)
         {
            _loc4_ |= 64;
         }
         if(this.rollOverEvent)
         {
            _loc4_ |= 32;
         }
         if(this.releaseOutsideEvent)
         {
            _loc4_ |= 16;
         }
         if(this.releaseEvent)
         {
            _loc4_ |= 8;
         }
         if(this.pressEvent)
         {
            _loc4_ |= 4;
         }
         if(this.initializeEvent)
         {
            _loc4_ |= 2;
         }
         if(this.dataEvent)
         {
            _loc4_ |= 1;
         }
         param1.writeUI8(_loc4_);
         if(param2 >= 6)
         {
            _loc5_ = 0;
            if(this.constructEvent)
            {
               _loc5_ |= 4;
            }
            if(this.keyPressEvent)
            {
               _loc5_ |= 2;
            }
            if(this.dragOutEvent)
            {
               _loc5_ |= 1;
            }
            param1.writeUI8(_loc5_);
            param1.writeUI8(0);
         }
      }
      
      public function toString() : String
      {
         var _loc1_:Array = [];
         if(this.keyUpEvent)
         {
            _loc1_.push("keyup");
         }
         if(this.keyDownEvent)
         {
            _loc1_.push("keydown");
         }
         if(this.mouseUpEvent)
         {
            _loc1_.push("mouseup");
         }
         if(this.mouseDownEvent)
         {
            _loc1_.push("mousedown");
         }
         if(this.mouseMoveEvent)
         {
            _loc1_.push("mousemove");
         }
         if(this.unloadEvent)
         {
            _loc1_.push("unload");
         }
         if(this.enterFrameEvent)
         {
            _loc1_.push("enterframe");
         }
         if(this.loadEvent)
         {
            _loc1_.push("load");
         }
         if(this.dragOverEvent)
         {
            _loc1_.push("dragover");
         }
         if(this.rollOutEvent)
         {
            _loc1_.push("rollout");
         }
         if(this.rollOverEvent)
         {
            _loc1_.push("rollover");
         }
         if(this.releaseOutsideEvent)
         {
            _loc1_.push("releaseoutside");
         }
         if(this.releaseEvent)
         {
            _loc1_.push("release");
         }
         if(this.pressEvent)
         {
            _loc1_.push("press");
         }
         if(this.initializeEvent)
         {
            _loc1_.push("initialize");
         }
         if(this.dataEvent)
         {
            _loc1_.push("data");
         }
         if(this.constructEvent)
         {
            _loc1_.push("construct");
         }
         if(this.keyPressEvent)
         {
            _loc1_.push("keypress");
         }
         if(this.dragOutEvent)
         {
            _loc1_.push("dragout");
         }
         return _loc1_.join(",");
      }
   }
}

