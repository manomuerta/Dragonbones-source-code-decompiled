package _120
{
   import flash.events.Event;
   
   public class _122 extends _119
   {
      public var _11545:uint = 1;
      
      private var _11547:uint = 0;
      
      private var _11544:uint = 0;
      
      private var _11546:uint = 0;
      
      public function _122()
      {
         this.waitingTasks = new Vector.<_119>();
         this.runingTasks = new Vector.<_119>();
         super();
      }
      
      private function _11549() : void
      {
         var _loc1_:_119 = null;
         if(this._11545 === 0 || this.runingTasks.length < this._11545)
         {
            _loc1_ = this.waitingTasks.shift();
            if(_loc1_)
            {
               this.runingTasks.push(_loc1_);
               _loc1_.addEventListener(_121.COMPLETE,this._2385,false,-999999);
               _loc1_.addEventListener(_121.FAIL,this._2386);
               _loc1_.addEventListener(_121.PROGRESS,this._11543);
               _loc1_.run();
               this.dispatchEvent(new _121(_121.SUB_START));
               this._11549();
            }
            else if(this.runingTasks.length < 1)
            {
               complete();
            }
         }
      }
      
      private function _11543(param1:_121) : void
      {
         dispatchEvent(param1);
      }
      
      private function _2386(param1:_121) : void
      {
         var _loc2_:_119 = param1.currentTarget as _119;
         if(_loc2_)
         {
            ++this._11546;
            this.runingTasks.splice(this.runingTasks.indexOf(_loc2_),1);
            _loc2_.removeEventListener(_121.COMPLETE,this._2385);
            _loc2_.removeEventListener(_121.FAIL,this._2386);
            _loc2_.removeEventListener(_121.PROGRESS,this._11543);
            fail(param1.data.type,param1.data.data);
            this._11549();
         }
      }
      
      private function _2385(param1:Event) : void
      {
         var _loc3_:Number = NaN;
         var _loc2_:_119 = param1.currentTarget as _119;
         if(_loc2_)
         {
            ++this._11544;
            this.runingTasks.splice(this.runingTasks.indexOf(_loc2_),1);
            _loc2_.removeEventListener(_121.COMPLETE,this._2385);
            _loc2_.removeEventListener(_121.FAIL,this._2386);
            _loc2_.removeEventListener(_121.PROGRESS,this._11543);
            _loc3_ = (this._11544 + this._11546) / this._11547;
            dispatchEvent(new _121(_121.SUB_COMPLETE,_loc2_));
            dispatchEvent(new _121(_121.PROGRESS,_loc3_));
            this._11549();
         }
      }
      
      override public function run() : void
      {
         if(this._11541)
         {
            return;
         }
         super.run();
         this._11549();
      }
      
      override public function stop() : void
      {
         var _loc1_:_119 = null;
         super.stop();
         for each(_loc1_ in this.runingTasks)
         {
            _loc1_.removeEventListener(_121.COMPLETE,this._2385);
            _loc1_.removeEventListener(_121.FAIL,this._2386);
            _loc1_.removeEventListener(_121.PROGRESS,this._11543);
            _loc1_.stop();
         }
         this.runingTasks.length = 0;
         this.waitingTasks.length = 0;
      }
      
      public function _2389(param1:_119) : _119
      {
         if(param1)
         {
            if(this.waitingTasks.indexOf(param1) < 0 || this.runingTasks.indexOf(param1) < 0)
            {
               ++this._11547;
               this.waitingTasks.push(param1);
               return param1;
            }
            throw new ArgumentError();
         }
         throw new ArgumentError();
      }
      
      public function _11548(param1:_119) : void
      {
         var _loc2_:int = 0;
         if(param1)
         {
            _loc2_ = int(this.waitingTasks.indexOf(param1));
            if(_loc2_ >= 0)
            {
               --this._11547;
               this.waitingTasks.splice(_loc2_,1);
            }
            else
            {
               _loc2_ = int(this.runingTasks.indexOf(param1));
               if(_loc2_ < 0)
               {
                  throw new ArgumentError();
               }
               this.runingTasks.splice(_loc2_,1);
               param1.removeEventListener(_121.COMPLETE,this._2385);
               param1.removeEventListener(_121.FAIL,this._2386);
               param1.removeEventListener(_121.PROGRESS,this._11543);
               param1.stop();
               this._11549();
            }
            return;
         }
         throw new ArgumentError();
      }
   }
}

