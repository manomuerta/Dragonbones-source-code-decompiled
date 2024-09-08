package _14161
{
   public class _14162 implements _14160
   {
      public static const CONTINUE:int = 0;
      
      public static const SKIP_FRAME:int = 1;
      
      public static const COMPLETE:int = 2;
      
      private var _15156:Function;
      
      private var _15152:Function;
      
      private var _15154:Function;
      
      internal var _15158:Boolean = false;
      
      internal var _11538:Boolean = false;
      
      public function _14162(param1:Function, param2:Function, param3:Function = null)
      {
         super();
         this._15154 = param1;
         this._15156 = param2;
         this._15152 = param3;
      }
      
      public function get _15157() : Function
      {
         return this._15156;
      }
      
      public function get _15153() : Function
      {
         return this._15152;
      }
      
      public function get startFunction() : Function
      {
         return this._15154;
      }
      
      public function get _1890() : Boolean
      {
         return this._15158;
      }
      
      public function get _11541() : Boolean
      {
         return this._11538;
      }
      
      public function start() : void
      {
         if(this._11538)
         {
            throw new Error("This process is already running.");
         }
         if(this._15158)
         {
            throw new Error("This process is complete.");
         }
         this._11538 = true;
         if(this.startFunction != null)
         {
            this.startFunction();
         }
         ProcessExecutor.instance._15159(this);
      }
      
      public function stop() : void
      {
         this._11538 = false;
         ProcessExecutor.instance._15155(this);
      }
      
      public function complete() : void
      {
         this._11538 = false;
         this._15158 = true;
         if(this._15153 != null)
         {
            this._15153();
         }
         ProcessExecutor.instance._15155(this);
      }
      
      public function reset() : void
      {
         if(this._11538)
         {
            this.stop();
         }
         this._15158 = false;
      }
      
      public function _15151() : Boolean
      {
         var _loc1_:* = this._15157();
         if(_loc1_ == COMPLETE)
         {
            this.complete();
         }
         return _loc1_;
      }
   }
}

