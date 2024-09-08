package _120
{
   import flash.events.Event;
   
   public class _123 extends _119
   {
      private var _11550:_119 = null;
      
      public function _123()
      {
         this._tasks = new Vector.<_119>();
         super();
      }
      
      private function _11549(param1:_119) : void
      {
         var _loc2_:_119 = this._tasks.shift();
         if(_loc2_)
         {
            this._11550 = _loc2_;
            if(param1)
            {
               this._11550._11540 = param1._2222;
            }
            else
            {
               this._11550._11540 = this._11540;
            }
            this._11550._11537 = this._11537;
            this._11550.addEventListener(_121.COMPLETE,this._2385);
            this._11550.addEventListener(_121.FAIL,this._2386);
            this._11550.run();
         }
         else
         {
            if(this._11550)
            {
               this._2222 = this._11550._2222;
            }
            complete();
         }
      }
      
      private function _2386(param1:_121) : void
      {
         this._11550 = param1.currentTarget as _119;
         if(this._11550)
         {
            this._11550.removeEventListener(_121.FAIL,this._2386);
            fail(param1.data.type,param1.data.data);
         }
      }
      
      private function _2385(param1:Event) : void
      {
         this._11550.removeEventListener(_121.COMPLETE,this._2385);
         if(this._tasks.length > 0)
         {
            this._11549(this._11550);
         }
         else
         {
            complete();
         }
      }
      
      override public function run() : void
      {
         if(this._11541)
         {
            return;
         }
         super.run();
         this._11549(null);
      }
      
      override public function stop() : void
      {
         super.stop();
         if(this._11550)
         {
            this._11550.stop();
            this._11550 = null;
         }
      }
      
      public function _2389(param1:_119) : _119
      {
         if(param1)
         {
            if(this._tasks.indexOf(param1) < 0)
            {
               this._tasks.push(param1);
               return param1;
            }
            throw new ArgumentError();
         }
         throw new ArgumentError();
      }
      
      public function get running() : Boolean
      {
         return this._11541;
      }
   }
}

