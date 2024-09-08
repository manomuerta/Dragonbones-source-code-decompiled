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
   
   public class _1534
   {
      private static const FORMAT_BYTE_ARRAY:int = 0;
      
      private static const FORMAT_TEXT:int = 1;
      
      private static const FORMAT_XML:int = 2;
      
      private var loader:URLLoader;
      
      private var format:int;
      
      private var _10179:Array;
      
      private var currentIndex:int = 0;
      
      private var _10177:Array;
      
      private var _10160:Function;
      
      private var _10176:Function;
      
      private var _5959:Function;
      
      private var _9196:Function;
      
      public function _1534()
      {
         this._10177 = [];
         super();
         this.loader = new URLLoader();
         this.loader.addEventListener(Event.COMPLETE,this._10174);
         this.loader.addEventListener(ProgressEvent.PROGRESS,this.onProgress);
         this.loader.addEventListener(IOErrorEvent.IO_ERROR,this._5961);
      }
      
      public function _10180(param1:Array, param2:Function, param3:Function = null, param4:Function = null, param5:Function = null) : void
      {
         this.format = FORMAT_BYTE_ARRAY;
         this.loader.dataFormat = URLLoaderDataFormat.BINARY;
         this.load(param1,param2,param3,param4,param5);
      }
      
      public function _10181(param1:Array, param2:Function, param3:Function = null, param4:Function = null, param5:Function = null) : void
      {
         this.format = FORMAT_TEXT;
         this.loader.dataFormat = URLLoaderDataFormat.TEXT;
         this.load(param1,param2,param3,param4,param5);
      }
      
      public function _10182(param1:Array, param2:Function, param3:Function = null, param4:Function = null, param5:Function = null) : void
      {
         this.format = FORMAT_XML;
         this.loader.dataFormat = URLLoaderDataFormat.TEXT;
         this.load(param1,param2,param3,param4,param5);
      }
      
      private function load(param1:Array, param2:Function, param3:Function = null, param4:Function = null, param5:Function = null) : void
      {
         if(param1 == null || param1.length == 0)
         {
            return;
         }
         this._10179 = param1;
         this._9196 = param2;
         this._10160 = param3;
         this._10176 = param4;
         this._5959 = param5;
         this.currentIndex = 0;
         this._10177 = [];
         this._10178();
      }
      
      private function _10178() : void
      {
         var _loc1_:String = this._10179[this.currentIndex];
         _loc1_ = _1535.path2Url(_loc1_);
         this.loader.load(new URLRequest(_loc1_));
      }
      
      private function next() : void
      {
         ++this.currentIndex;
         if(this.currentIndex >= this._10179.length)
         {
            this._9198();
         }
         else
         {
            this._10178();
         }
      }
      
      private function _10174(param1:Event) : void
      {
         var data:String = null;
         var xml:XML = null;
         var e:Event = param1;
         switch(this.format)
         {
            case FORMAT_BYTE_ARRAY:
               this._10177.push(this.loader.data as ByteArray);
               if(this._10160 != null)
               {
                  this._10160(this.loader.data as ByteArray,this.currentIndex);
               }
               break;
            case FORMAT_TEXT:
               this._10177.push(this.loader.data as String);
               if(this._10160 != null)
               {
                  this._10160(this.loader.data as String,this.currentIndex);
               }
               break;
            case FORMAT_XML:
               data = this.loader.data as String;
               try
               {
                  xml = new XML(data);
               }
               catch(e:Error)
               {
                  xml = null;
               }
               this._10177.push(xml);
               if(this._10160 != null)
               {
                  this._10160(xml,this.currentIndex);
               }
         }
         this.next();
      }
      
      private function onProgress(param1:ProgressEvent) : void
      {
         if(this._10176 != null)
         {
            this._10176(param1,this.currentIndex);
         }
      }
      
      private function _5961(param1:IOErrorEvent) : void
      {
         this._10177.push(null);
         if(this._5959 != null)
         {
            this._5959(param1,this.currentIndex);
         }
         this.next();
      }
      
      private function _9198() : void
      {
         if(this._9196 != null)
         {
            setTimeout(this._9196,1,this._10177);
         }
      }
   }
}

