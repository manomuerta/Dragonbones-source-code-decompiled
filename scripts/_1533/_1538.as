package _1533
{
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.net.URLLoader;
   import flash.net.URLLoaderDataFormat;
   import flash.net.URLRequest;
   import flash.utils.ByteArray;
   import flash.utils.setTimeout;
   
   public class _1538
   {
      private static const FORMAT_BYTE_ARRAY:int = 0;
      
      private static const FORMAT_TEXT:int = 1;
      
      private static const FORMAT_XML:int = 2;
      
      private var loader:URLLoader;
      
      private var format:int;
      
      private var _1580:Function;
      
      private var _10176:Function;
      
      private var _5959:Function;
      
      public function _1538()
      {
         super();
         this.loader = new URLLoader();
         this.loader.addEventListener(Event.COMPLETE,this._5962);
         this.loader.addEventListener(ProgressEvent.PROGRESS,this.onProgress);
         this.loader.addEventListener(IOErrorEvent.IO_ERROR,this.ioError);
      }
      
      public function _10086(param1:String, param2:Function, param3:Function = null, param4:Function = null) : void
      {
         this.format = FORMAT_BYTE_ARRAY;
         this.loader.dataFormat = URLLoaderDataFormat.BINARY;
         this.load(param1,param2,param3,param4);
      }
      
      public function _10192(param1:String, param2:Function, param3:Function = null, param4:Function = null) : void
      {
         this.format = FORMAT_TEXT;
         this.loader.dataFormat = URLLoaderDataFormat.TEXT;
         this.load(param1,param2,param3,param4);
      }
      
      public function _10193(param1:String, param2:Function, param3:Function = null, param4:Function = null) : void
      {
         this.format = FORMAT_XML;
         this.loader.dataFormat = URLLoaderDataFormat.TEXT;
         this.load(param1,param2,param3,param4);
      }
      
      private function load(param1:String, param2:Function, param3:Function = null, param4:Function = null) : void
      {
         this._1580 = param2;
         this._10176 = param3;
         this._5959 = param4;
         param1 = _1535.path2Url(param1);
         this.loader.load(new URLRequest(param1));
      }
      
      private function _5962(param1:Event) : void
      {
         var data:String = null;
         var xml:XML = null;
         var e:Event = param1;
         if(this._1580 != null)
         {
            switch(this.format)
            {
               case FORMAT_BYTE_ARRAY:
                  setTimeout(this._1580,1,this.loader.data as ByteArray);
                  break;
               case FORMAT_TEXT:
                  setTimeout(this._1580,1,this.loader.data as String);
                  break;
               case FORMAT_XML:
                  data = this.loader.data as String;
                  if(data != null)
                  {
                     try
                     {
                        xml = new XML(data);
                     }
                     catch(e:Error)
                     {
                        xml = null;
                     }
                  }
                  setTimeout(this._1580,1,xml);
            }
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
         if(this._5959 != null)
         {
            this._5959(param1);
         }
      }
   }
}

