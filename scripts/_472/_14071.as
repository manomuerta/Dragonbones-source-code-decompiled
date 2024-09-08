package _472
{
   import _14255._14257;
   import _93._94;
   import egret.utils.tr;
   import flash.events.Event;
   import flash.system.MessageChannel;
   import flash.system.Worker;
   import flash.system.WorkerDomain;
   import flash.system.WorkerState;
   import flash.utils.ByteArray;
   
   public class _14071 extends _94
   {
      private static var _14607:Class = _14071__14607;
      
      private var _14485:Worker;
      
      private var _14475:MessageChannel;
      
      private var progressChannel:MessageChannel;
      
      private var resultChannel:MessageChannel;
      
      private var data:Object;
      
      private var outpath:String;
      
      private var overwrite:Boolean;
      
      private var _14479:Function = null;
      
      private var _14482:Function = null;
      
      public var jsonData:Object;
      
      public var display:Array;
      
      public var layers:Array;
      
      private var _14484:Boolean = false;
      
      private var _14486:Boolean = false;
      
      public function _14071()
      {
         super();
         this._14483();
      }
      
      private function _14483() : void
      {
         var _loc1_:ByteArray = new _14607();
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
      
      public function _14471(param1:Object, param2:Function, param3:Function) : void
      {
         this.data = param1;
         this.outpath = this.data["outpath"];
         this.overwrite = this.data["overwrite"];
         this._14479 = param2;
         this._14482 = param3;
         if(!this._14485)
         {
            this._14483();
         }
         if(this._14485.state != WorkerState.RUNNING)
         {
            this._14485.start();
         }
         else
         {
            this._14475.send(this.data);
         }
      }
      
      public function _14472() : void
      {
         if(this._14485)
         {
            this._14485.terminate();
            this._14485.removeEventListener(Event.WORKER_STATE,this._14474);
         }
         if(this.progressChannel)
         {
            this.progressChannel.removeEventListener(Event.CHANNEL_MESSAGE,this._14476);
         }
         if(this.resultChannel)
         {
            this.resultChannel.removeEventListener(Event.CHANNEL_MESSAGE,this._14477);
         }
         this.progressChannel = null;
         this.resultChannel = null;
         this._14485 = null;
         this._14484 = false;
         this._14486 = false;
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
         var _loc2_:String = "";
         var _loc3_:String = this.progressChannel.receive();
         switch(_loc3_)
         {
            case _14257.INITED:
               this._14484 = true;
               this.flush();
               break;
            case _14257.LAYER_SIGNATURE_ERROR:
            case _14257.LAYER_EFFECT_SIGNATURE_ERROR:
               _loc2_ = tr("Import.psdexport.errorTip1");
               break;
            case _14257.INVALID_BLEND_SIGNATURE:
            case _14257.INVALID_BELEND_EFFECT:
               _loc2_ = tr("Import.psdexport.errorTip2");
               break;
            case _14257.INVALID_MASK_SIZE:
            case _14257.INVALID_MASK:
               _loc2_ = tr("Import.psdexport.errorTip3");
               break;
            case _14257.INVALID_COMPRESSION:
            case _14257.INVALID_SIGNATURE:
            case _14257.OTHER_ERROR:
               _loc2_ = tr("Import.psdexport.errorTip4");
               break;
            case _14257.INVALID_VERSION:
               _loc2_ = tr("Import.psdexport.errorTip5");
         }
         if(this._14482 != null && Boolean(_loc2_))
         {
            this._14482.call(null,_loc2_);
         }
      }
      
      private function flush() : void
      {
         if(this._14484 && this._14486)
         {
            this._14475.send(this.data);
            this.data = null;
         }
      }
      
      private function _14477(param1:Event) : void
      {
         var _loc2_:Object = this.resultChannel.receive() as Object;
         this.jsonData = _loc2_["jsonData"];
         this.display = _loc2_["display"];
         this.layers = _loc2_["layers"];
         if(Boolean(this.layers) && this.layers.length == 0)
         {
            if(this._14482 != null)
            {
               this._14482.call(null,tr("Import.psdexport.errorTip1"));
            }
         }
         else if(this._14479 != null)
         {
            this._14479.call(null,this.outpath,this.overwrite);
         }
      }
      
      public function clear() : void
      {
         this.data = null;
         this.jsonData = null;
         this.display = null;
         this.layers = null;
      }
   }
}

