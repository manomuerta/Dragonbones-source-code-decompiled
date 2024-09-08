package com.codeazur.as3swf.timeline
{
   public class LayerStrip
   {
      public static const TYPE_EMPTY:uint = 0;
      
      public static const TYPE_SPACER:uint = 1;
      
      public static const TYPE_STATIC:uint = 2;
      
      public static const TYPE_MOTIONTWEEN:uint = 3;
      
      public static const TYPE_SHAPETWEEN:uint = 4;
      
      public var type:uint = 0;
      
      public var startFrameIndex:uint = 0;
      
      public var endFrameIndex:uint = 0;
      
      public function LayerStrip(param1:uint, param2:uint, param3:uint)
      {
         super();
         this.type = param1;
         this.startFrameIndex = param2;
         this.endFrameIndex = param3;
      }
      
      public function toString() : String
      {
         var _loc1_:* = null;
         if(this.startFrameIndex == this.endFrameIndex)
         {
            _loc1_ = "Frame: " + this.startFrameIndex;
         }
         else
         {
            _loc1_ = "Frames: " + this.startFrameIndex + "-" + this.endFrameIndex;
         }
         _loc1_ += ", Type: ";
         switch(this.type)
         {
            case TYPE_EMPTY:
               _loc1_ += "EMPTY";
               break;
            case TYPE_SPACER:
               _loc1_ += "SPACER";
               break;
            case TYPE_STATIC:
               _loc1_ += "STATIC";
               break;
            case TYPE_MOTIONTWEEN:
               _loc1_ += "MOTIONTWEEN";
               break;
            case TYPE_SHAPETWEEN:
               _loc1_ += "SHAPETWEEN";
               break;
            default:
               _loc1_ += "unknown";
         }
         return _loc1_;
      }
   }
}

