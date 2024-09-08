package com.codeazur.as3swf.timeline
{
   import com.codeazur.utils.StringUtils;
   
   public class Layer
   {
      public var depth:uint = 0;
      
      public var frameCount:uint = 0;
      
      public var frameStripMap:Array;
      
      public var strips:Array;
      
      public function Layer(param1:uint, param2:uint)
      {
         super();
         this.depth = param1;
         this.frameCount = param2;
         this.frameStripMap = [];
         this.strips = [];
      }
      
      public function appendStrip(param1:uint, param2:uint, param3:uint) : void
      {
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:LayerStrip = null;
         if(param1 != LayerStrip.TYPE_EMPTY)
         {
            _loc5_ = this.strips.length;
            if(_loc5_ == 0 && param2 > 0)
            {
               _loc4_ = 0;
               while(_loc4_ < param2)
               {
                  this.frameStripMap[_loc4_] = _loc5_;
                  _loc4_++;
               }
               var _loc7_:*;
               this.strips[_loc7_ = _loc5_++] = new LayerStrip(LayerStrip.TYPE_SPACER,0,param2 - 1);
            }
            else if(_loc5_ > 0)
            {
               _loc6_ = this.strips[_loc5_ - 1] as LayerStrip;
               if(_loc6_.endFrameIndex + 1 < param2)
               {
                  _loc4_ = uint(_loc6_.endFrameIndex + 1);
                  while(_loc4_ < param2)
                  {
                     this.frameStripMap[_loc4_] = _loc5_;
                     _loc4_++;
                  }
                  this.strips[_loc7_ = _loc5_++] = new LayerStrip(LayerStrip.TYPE_SPACER,_loc6_.endFrameIndex + 1,param2 - 1);
               }
            }
            _loc4_ = param2;
            while(_loc4_ <= param3)
            {
               this.frameStripMap[_loc4_] = _loc5_;
               _loc4_++;
            }
            this.strips[_loc5_] = new LayerStrip(param1,param2,param3);
         }
      }
      
      public function getStripsForFrameRegion(param1:uint, param2:uint) : Array
      {
         if(param1 >= this.frameStripMap.length || param2 < param1)
         {
            return [];
         }
         var _loc3_:uint = uint(this.frameStripMap[param1]);
         var _loc4_:uint = param2 >= this.frameStripMap.length ? this.strips.length - 1 : uint(this.frameStripMap[param2]);
         return this.strips.slice(_loc3_,_loc4_ + 1);
      }
      
      public function toString(param1:uint = 0) : String
      {
         var _loc3_:uint = 0;
         var _loc4_:LayerStrip = null;
         var _loc2_:String = "Depth: " + this.depth + ", Frames: " + this.frameCount;
         if(this.strips.length > 0)
         {
            _loc2_ += "\n" + StringUtils.repeat(param1 + 2) + "Strips:";
            _loc3_ = 0;
            while(_loc3_ < this.strips.length)
            {
               _loc4_ = this.strips[_loc3_] as LayerStrip;
               _loc2_ += "\n" + StringUtils.repeat(param1 + 4) + "[" + _loc3_ + "] " + _loc4_.toString();
               _loc3_++;
            }
         }
         return _loc2_;
      }
   }
}

