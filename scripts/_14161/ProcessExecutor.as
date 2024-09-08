package _14161
{
   import _14159._14158;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.utils.getTimer;
   
   public class ProcessExecutor
   {
      private static var _instance:ProcessExecutor;
      
      private static var _15167:Boolean = false;
      
      private static var _15163:Boolean = false;
      
      private var _stage:Stage;
      
      private var _15168:Vector.<_14160>;
      
      private var _15160:Number = 0.25;
      
      public function ProcessExecutor()
      {
         super();
         if(!_15163)
         {
            throw new Error("The class \'ProcessExecutor\' is singleton.");
         }
      }
      
      public static function get instance() : ProcessExecutor
      {
         if(_instance == null)
         {
            _15163 = true;
            _instance = new ProcessExecutor();
            _15163 = false;
         }
         return _instance;
      }
      
      public function initialize(param1:Stage) : void
      {
         if(_15167)
         {
            return;
         }
         _15167 = true;
         this._stage = param1;
         this._15168 = new Vector.<_14160>();
      }
      
      public function get _15162() : Number
      {
         return this._15160;
      }
      
      public function set _15162(param1:Number) : void
      {
         this._15160 = param1;
      }
      
      private function get _15161() : Number
      {
         return 1000 / this._stage.frameRate * this._15160;
      }
      
      private function _15164() : void
      {
         if(this._stage == null)
         {
            throw new Error("You must initialize the ProcessExecutor. Ex: ProcessExecutor.instance.initialize(stage)");
         }
      }
      
      public function _15159(param1:_14160) : void
      {
         this._15164();
         if(this._15168.length == 0)
         {
            this._stage.addEventListener(Event.ENTER_FRAME,this._8632);
         }
         this._15168.push(param1);
      }
      
      public function _15165(param1:_14160) : Boolean
      {
         return this._15168.indexOf(param1) != -1;
      }
      
      public function _15155(param1:_14160) : void
      {
         var _loc2_:int = int(this._15168.indexOf(param1));
         if(_loc2_ == -1)
         {
            return;
         }
         this._15168.splice(_loc2_,1);
         if(this._15168.length == 0)
         {
            this._stage.removeEventListener(Event.ENTER_FRAME,this._8632);
         }
      }
      
      private function _8632(param1:Event) : void
      {
         var process:_14160 = null;
         var e:Event = param1;
         var timePerProcess:int = this._15161 / this._15168.length;
         try
         {
            for each(process in this._15168)
            {
               this._15166(process,timePerProcess);
            }
         }
         catch(e:Error)
         {
            _14158._15148(_14158.PARSER_ERROR);
            _15155(process);
         }
      }
      
      private function _15166(param1:_14160, param2:int) : void
      {
         var _loc3_:int = getTimer() + param2;
         var _loc4_:Function = param1._15151;
         while(!_loc4_())
         {
            if(getTimer() >= _loc3_)
            {
               break;
            }
         }
      }
   }
}

