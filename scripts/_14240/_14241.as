package _14240
{
   import _14161._14162;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.utils.ByteArray;
   
   public class _14241 extends EventDispatcher
   {
      public static const COMPLETE:String = "complete";
      
      public static const ERROR:String = "fail";
      
      private static const ESCAPE_CHAR_CODE:Number = 61;
      
      private static const inverse:Array = [64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,62,64,64,64,63,52,53,54,55,56,57,58,59,60,61,64,64,64,64,64,64,64,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,64,64,64,64,64,64,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64];
      
      public var bytes:ByteArray;
      
      public var _2648:String;
      
      private var encoded:String;
      
      private var index:uint = 0;
      
      private var count:int = 0;
      
      private var _15145:int = 0;
      
      private var work:Array;
      
      public function _14241(param1:String)
      {
         this.work = [0,0,0,0];
         super();
         this.encoded = param1;
      }
      
      public function decode() : void
      {
         new _14162(this.startFunction,this._15157,this._15153).start();
      }
      
      private function startFunction() : void
      {
         this.bytes = new ByteArray();
         this.count = 0;
         this._15145 = 0;
         this.index = 0;
         this._2648 = null;
      }
      
      private function _15157() : int
      {
         var _loc2_:Number = NaN;
         var _loc1_:int = 0;
         while(true)
         {
            if(_loc1_ >= 100)
            {
               return _14162.CONTINUE;
            }
            if(this.index == this.encoded.length)
            {
               return _14162.COMPLETE;
            }
            _loc2_ = Number(this.encoded.charCodeAt(this.index++));
            if(_loc2_ == ESCAPE_CHAR_CODE)
            {
               var _loc3_:* = this.count++;
               this.work[_loc3_] = -1;
            }
            else
            {
               if(inverse[_loc2_] == 64)
               {
                  continue;
               }
               _loc3_ = this.count++;
               this.work[_loc3_] = inverse[_loc2_];
            }
            if(this.count == 4)
            {
               this.count = 0;
               this.bytes.writeByte(this.work[0] << 2 | (this.work[1] & 0xFF) >> 4);
               ++this._15145;
               if(this.work[2] == -1)
               {
                  break;
               }
               this.bytes.writeByte(this.work[1] << 4 | (this.work[2] & 0xFF) >> 2);
               ++this._15145;
               if(this.work[3] == -1)
               {
                  return _14162.COMPLETE;
               }
               this.bytes.writeByte(this.work[2] << 6 | this.work[3]);
               ++this._15145;
            }
            _loc1_++;
         }
         return _14162.COMPLETE;
      }
      
      private function _15153() : void
      {
         if(this.count > 0)
         {
            this._2648 = "A partial block (" + this.count + " of 4 bytes) was dropped. Decoded data is probably truncated!";
            dispatchEvent(new Event(ERROR));
         }
         else
         {
            dispatchEvent(new Event(COMPLETE));
         }
      }
   }
}

