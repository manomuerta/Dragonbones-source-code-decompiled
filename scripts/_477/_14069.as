package _477
{
   import _120._119;
   import _521._14070;
   import com.hurlant.util.Base64;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import flash.net.URLRequestMethod;
   
   public class _14069 extends _119
   {
      public function _14069()
      {
         this._11970 = new URLRequest();
         this._loader = new URLLoader();
         super();
         this._11970.method = URLRequestMethod.POST;
         this._loader.addEventListener(Event.COMPLETE,this._loaderHandler);
         this._loader.addEventListener(IOErrorEvent.IO_ERROR,this._loaderHandler);
         this._loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this._loaderHandler);
      }
      
      private function _loaderHandler(param1:Event) : void
      {
         var resultString:String = null;
         var result:Object = null;
         var eachOutput:Object = null;
         var event:Event = param1;
         switch(event.type)
         {
            case Event.COMPLETE:
               resultString = this._loader.data;
               try
               {
                  result = JSON.parse(resultString);
                  if(result.code === 200)
                  {
                     this._2222 = result.data;
                     for each(eachOutput in this._2222)
                     {
                        if(eachOutput.format === "base64")
                        {
                           eachOutput.data = com.hurlant.util.Base64.decodeToByteArray(eachOutput.data);
                        }
                     }
                     this.complete();
                  }
                  else
                  {
                     this.fail("Action error.",resultString);
                  }
               }
               catch(error:*)
               {
                  fail("Result error.",resultString);
               }
               break;
            default:
               this.fail(event.type,event.toString());
         }
      }
      
      private function _11588() : void
      {
         this._loader.removeEventListener(Event.COMPLETE,this._loaderHandler);
         this._loader.removeEventListener(IOErrorEvent.IO_ERROR,this._loaderHandler);
         this._loader.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,this._loaderHandler);
      }
      
      override public function run() : void
      {
         super.run();
         if(!this._11540)
         {
            this.fail("Input data error.");
            return;
         }
         this._11970.url = _14070.serverURL + "/convert";
         this._11970.data = JSON.stringify(this._11540);
         this._loader.load(this._11970);
      }
      
      override public function stop() : void
      {
         super.stop();
         this._11588();
      }
      
      override public function complete() : void
      {
         super.complete();
         this._11588();
      }
      
      override public function fail(param1:String, param2:* = null) : void
      {
         super.fail(param1,param2);
         this._11588();
      }
   }
}

