package _477
{
   import _93._94;
   import flash.events.Event;
   import flash.system.MessageChannel;
   import flash.system.Worker;
   import flash.system.WorkerDomain;
   import flash.system.WorkerState;
   import flash.utils.ByteArray;
   
   public class _14067 extends _94
   {
      private static const INITED:String = "inited";
      
      private static const PROGRESS:String = "progress";
      
      private static const ERROR:String = "error";
      
      private static const TEST:String = "test";
      
      private static const CACHE_GIFHEAD:String = "cacheGifHead";
      
      private static const CACHE_GIFBMDS:String = "cacheGifBmds";
      
      private static const RUN:String = "run";
      
      private static const SUCCESS:String = "success";
      
      private static var _14473:Class = _14067__14473;
      
      private var debug:Boolean = false;
      
      private var _14485:Worker;
      
      private var _14475:MessageChannel;
      
      private var progressChannel:MessageChannel;
      
      private var resultChannel:MessageChannel;
      
      private var data:Array;
      
      private var _14479:Function = null;
      
      private var _14482:Function = null;
      
      private var _14478:Function = null;
      
      private var _14484:Boolean = false;
      
      private var _14486:Boolean = false;
      
      private var pointerHead:int = 0;
      
      private var pointerBmds:int = 0;
      
      private var result:Object = null;
      
      public function _14067()
      {
         super();
      }
      
      private function _14483() : void
      {
         var _loc1_:ByteArray = new _14473();
         this._14485 = WorkerDomain.current.createWorker(_loc1_);
         this._14475 = Worker.current.createMessageChannel(this._14485);
         this._14485.setSharedProperty("incomingCommandChannel",this._14475);
         this.progressChannel = this._14485.createMessageChannel(Worker.current);
         this.progressChannel.addEventListener(Event.CHANNEL_MESSAGE,this._14476);
         this._14485.setSharedProperty("progressChannel",this.progressChannel);
         this.resultChannel = this._14485.createMessageChannel(Worker.current);
         this.resultChannel.addEventListener(Event.CHANNEL_MESSAGE,this._14477);
         this._14485.setSharedProperty("resultChannel",this.resultChannel);
         this._14485.addEventListener(Event.WORKER_STATE,this._14474);
      }
      
      public function _14471(param1:Array, param2:Function, param3:Function, param4:Function) : void
      {
         this.data = param1;
         this._14479 = param2;
         this._14482 = param3;
         this._14478 = param4;
         if(!this._14485)
         {
            this._14483();
         }
         if(this._14485.state != WorkerState.RUNNING)
         {
            this._14485.start();
         }
      }
      
      public function _14472() : void
      {
         this._14485.terminate();
         this.progressChannel.removeEventListener(Event.CHANNEL_MESSAGE,this._14476);
         this.resultChannel.removeEventListener(Event.CHANNEL_MESSAGE,this._14477);
         this._14485.removeEventListener(Event.WORKER_STATE,this._14474);
         this.progressChannel = null;
         this.resultChannel = null;
         this._14485 = null;
         this.result = null;
         this._14484 = false;
         this._14486 = false;
         this.pointerBmds = 0;
         this.pointerHead = 0;
      }
      
      private function _14474(param1:Event) : void
      {
         if(this._14485.state == WorkerState.RUNNING)
         {
            this._14486 = true;
            this.flush();
         }
      }
      
      private function _14476(param1:Event) : void
      {
         var _loc2_:Object = this.progressChannel.receive();
         switch(_loc2_["type"])
         {
            case CACHE_GIFHEAD:
            case CACHE_GIFBMDS:
               this._14481();
               break;
            case INITED:
               this._14484 = true;
               this.flush();
               break;
            case ERROR:
               if(this._14482 != null)
               {
                  this._14482.call(null);
               }
               break;
            case PROGRESS:
               if(this._14478 != null)
               {
                  this._14478.call(null,_loc2_["total"],_loc2_["cur"]);
               }
               break;
            case TEST:
               this.log("TEST_MESSAGE------" + _loc2_.msg);
         }
      }
      
      private function _14477(param1:Event) : void
      {
         var _loc2_:String = this.resultChannel.receive() as String;
         switch(_loc2_)
         {
            case SUCCESS:
               if(this._14479 != null)
               {
                  this.result = this._14485.getSharedProperty(SUCCESS);
                  this._14479.call(null,this.result);
               }
         }
      }
      
      private function flush() : void
      {
         if(this._14484 && this._14486)
         {
            this._14480();
         }
      }
      
      private function _14480() : void
      {
         if(this.data.length == this.pointerHead)
         {
            this._14475.send(RUN);
            this.data.length = 0;
            return;
         }
         var _loc1_:Object = {};
         _loc1_["hasBG"] = this.data[this.pointerHead]["hasBG"];
         _loc1_["color"] = this.data[this.pointerHead]["color"];
         _loc1_["repeat"] = this.data[this.pointerHead]["repeat"];
         _loc1_["quality"] = this.data[this.pointerHead]["quality"];
         _loc1_["total"] = this.data[this.pointerHead]["total"];
         _loc1_["bmDs"] = [];
         _loc1_["path"] = this.data[this.pointerHead]["path"];
         this._14485.setSharedProperty(CACHE_GIFHEAD,_loc1_);
         this._14475.send(CACHE_GIFHEAD);
         this.log("----------------pointerHead-------------:" + _loc1_.path);
         this.log("path:" + this.pointerHead);
      }
      
      private function _14481() : void
      {
         if(this.data[this.pointerHead]["bmDs"].length == this.pointerBmds)
         {
            this.pointerBmds = 0;
            ++this.pointerHead;
            this._14480();
            return;
         }
         var _loc1_:Array = this.data[this.pointerHead]["bmDs"];
         this._14485.setSharedProperty(CACHE_GIFBMDS,_loc1_[this.pointerBmds]);
         this._14475.send(CACHE_GIFBMDS);
         _loc1_[this.pointerBmds] = null;
         ++this.pointerBmds;
         if(this._14478 != null)
         {
            this._14478.call(null,this.data[this.pointerHead]["bmDs"].length,this.pointerBmds,2);
         }
         this.log("pointerBmds:" + this.pointerBmds + "," + this.data[this.pointerHead].bmDs.length);
      }
      
      private function log(param1:String) : void
      {
         if(this.debug)
         {
         }
      }
   }
}

