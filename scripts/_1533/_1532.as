package _1533
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Loader;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.net.URLRequest;
   import flash.utils.setTimeout;
   
   public class _1532
   {
      private static const FORMAT_LOADER:int = 0;
      
      private static const FORMAT_BITMAP:int = 1;
      
      private static const FORMAT_BITMAP_DATA:int = 2;
      
      private var loader:Loader;
      
      private var format:int;
      
      private var _10179:Array;
      
      private var currentIndex:int = 0;
      
      private var _10177:Array = null;
      
      private var _10160:Function;
      
      private var _10176:Function;
      
      private var _5959:Function;
      
      private var _9196:Function;
      
      public function _1532()
      {
         super();
      }
      
      private function _10175(param1:Boolean = true) : void
      {
         if(param1)
         {
            this.loader = new Loader();
         }
         this.loader.contentLoaderInfo.addEventListener(Event.COMPLETE,this._10174);
         this.loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS,this.onProgress);
         this.loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,this._5961);
      }
      
      private function removeEventListener() : void
      {
         this.loader.contentLoaderInfo.removeEventListener(Event.COMPLETE,this._10174);
         this.loader.contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS,this.onProgress);
         this.loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR,this._5961);
      }
      
      public function _10172(param1:Array, param2:Function, param3:Function = null, param4:Function = null, param5:Function = null) : void
      {
         this.format = FORMAT_LOADER;
         this.load(param1,param2,param3,param4,param5);
      }
      
      public function _10173(param1:Array, param2:Function, param3:Function = null, param4:Function = null, param5:Function = null) : void
      {
         this.format = FORMAT_BITMAP;
         this.load(param1,param2,param3,param4,param5);
      }
      
      public function _10171(param1:Array, param2:Function, param3:Function = null, param4:Function = null, param5:Function = null) : void
      {
         this.format = FORMAT_BITMAP_DATA;
         this.load(param1,param2,param3,param4,param5);
      }
      
      private function load(param1:Array, param2:Function, param3:Function = null, param4:Function = null, param5:Function = null) : void
      {
         if(param1 == null || param1.length == 0)
         {
            return;
         }
         if(this.loader == null)
         {
            this._10175();
         }
         else
         {
            this._10175(false);
         }
         this._10179 = param1;
         this._9196 = param2;
         this._10160 = param3;
         this._10176 = param4;
         this._5959 = param5;
         this._10177 = [];
         this.currentIndex = 0;
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
         var _loc2_:Bitmap = null;
         var _loc3_:Bitmap = null;
         var _loc4_:BitmapData = null;
         switch(this.format)
         {
            case FORMAT_LOADER:
               this.removeEventListener();
               this._10177.push(this.loader);
               if(this._10160 != null)
               {
                  this._10160(this.loader,this.currentIndex);
               }
               this._10175();
               break;
            case FORMAT_BITMAP:
               _loc2_ = this.loader.contentLoaderInfo.content as Bitmap;
               this._10177.push(_loc2_);
               if(this._10160 != null)
               {
                  this._10160(_loc2_,this.currentIndex);
               }
               break;
            case FORMAT_BITMAP_DATA:
               _loc3_ = this.loader.contentLoaderInfo.content as Bitmap;
               if(_loc3_ != null)
               {
                  _loc4_ = _loc3_.bitmapData;
               }
               this._10177.push(_loc4_);
               if(this._10160 != null)
               {
                  this._10160(_loc4_,this.currentIndex);
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
         this.removeEventListener();
         if(this._9196 != null)
         {
            setTimeout(this._9196,1,this._10177);
         }
         this._10177 = null;
      }
   }
}

