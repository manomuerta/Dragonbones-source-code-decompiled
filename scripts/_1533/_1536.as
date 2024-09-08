package _1533
{
   import flash.display.DisplayObjectContainer;
   import flash.display.Loader;
   import flash.display.LoaderInfo;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.net.URLRequest;
   
   public class _1536
   {
      private var loader:Loader;
      
      private var _1580:Function;
      
      private var root:DisplayObjectContainer;
      
      private var _10176:Function;
      
      private var _5959:Function;
      
      public function _1536()
      {
         super();
      }
      
      public function _10185(param1:String, param2:Function, param3:Function = null, param4:Function = null) : void
      {
         if(this.loader == null)
         {
            this.loader = new Loader();
         }
         this._1580 = param2;
         this._10176 = param3;
         this._5959 = param4;
         this.loader.contentLoaderInfo.addEventListener(Event.COMPLETE,this._5962);
         this.loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS,this.onProgress);
         this.loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,this.ioError);
         param1 = _1535.path2Url(param1);
         this.loader.load(new URLRequest(param1));
      }
      
      private function _5962(param1:Event) : void
      {
         this.loader.contentLoaderInfo.removeEventListener(Event.COMPLETE,this._5962);
         this.loader.contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS,this.onProgress);
         this.loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR,this.ioError);
         this.root = this.loader.content as DisplayObjectContainer;
         if(this.root.hasOwnProperty("__rslPreloader"))
         {
            this.root.addEventListener(Event.ADDED,this._4333);
         }
         else if(this._1580 != null)
         {
            this._1580(this.root,this.loader.contentLoaderInfo.applicationDomain);
         }
      }
      
      private function _4333(param1:Event) : void
      {
         var _loc2_:Loader = null;
         if(param1.target is Loader)
         {
            this.root.removeEventListener(Event.ADDED,this._4333);
            _loc2_ = param1.target as Loader;
            _loc2_.contentLoaderInfo.addEventListener(Event.INIT,this._10186);
         }
      }
      
      private function _10186(param1:Event) : void
      {
         (param1.target as LoaderInfo).removeEventListener(Event.INIT,this._10186);
         this.root = (param1.target as LoaderInfo).content as DisplayObjectContainer;
         if(this._1580 != null)
         {
            this._1580(this.root,this.loader.contentLoaderInfo.applicationDomain);
         }
      }
      
      private function onProgress(param1:ProgressEvent) : void
      {
         if(this._10176 != null)
         {
            this._10176(param1);
         }
      }
      
      private function ioError(param1:IOErrorEvent) : void
      {
         this.loader.contentLoaderInfo.removeEventListener(Event.COMPLETE,this._5962);
         this.loader.contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS,this.onProgress);
         this.loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR,this.ioError);
         if(this._5959 != null)
         {
            this._5959(param1);
         }
      }
   }
}

