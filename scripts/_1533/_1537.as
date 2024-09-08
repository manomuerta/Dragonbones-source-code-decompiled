package _1533
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Loader;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.net.URLRequest;
   import flash.system.ApplicationDomain;
   import flash.system.LoaderContext;
   import flash.utils.ByteArray;
   import flash.utils.setTimeout;
   
   public class _1537
   {
      private static const FORMAT_LOADER:int = 0;
      
      private static const FORMAT_BITMAP:int = 1;
      
      private static const FORMAT_BITMAP_DATA:int = 2;
      
      private static const FORMAT_EXTERNAL_CLASS:int = 3;
      
      private static const FORMAT_EXTERNAL_CLASSES:int = 4;
      
      private var loader:Loader;
      
      private var format:int;
      
      private var className:String = "";
      
      private var appDomain:ApplicationDomain;
      
      private var _1580:Function;
      
      private var _10176:Function;
      
      private var _5959:Function;
      
      public function _1537()
      {
         super();
      }
      
      public function _10191(param1:String, param2:Function, param3:Function = null, param4:Function = null, param5:ApplicationDomain = null) : void
      {
         this.format = FORMAT_LOADER;
         this.appDomain = param5;
         this.load(param1,param2,param3,param4);
      }
      
      public function _10190(param1:String, param2:Function, param3:Function = null, param4:Function = null) : void
      {
         this.format = FORMAT_BITMAP;
         this.load(param1,param2,param3,param4);
      }
      
      public function _10189(param1:String, param2:Function, param3:Function = null, param4:Function = null) : void
      {
         this.format = FORMAT_BITMAP_DATA;
         this.load(param1,param2,param3,param4);
      }
      
      public function _10188(param1:String, param2:String, param3:Function, param4:Function = null, param5:Function = null, param6:ApplicationDomain = null) : void
      {
         this.format = FORMAT_EXTERNAL_CLASS;
         this.appDomain = param6;
         this.className = param2;
         this.load(param1,param3,param4,param5);
      }
      
      public function _10187(param1:String, param2:Function, param3:Function = null, param4:Function = null, param5:ApplicationDomain = null) : void
      {
         this.format = FORMAT_EXTERNAL_CLASSES;
         this.appDomain = param5;
         this.load(param1,param2,param3,param4);
      }
      
      private function load(param1:String, param2:Function, param3:Function = null, param4:Function = null) : void
      {
         var _loc5_:LoaderContext = null;
         if(this.loader == null)
         {
            this.loader = new Loader();
         }
         this.loader.contentLoaderInfo.addEventListener(Event.COMPLETE,this._5962);
         this.loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS,this.onProgress);
         this.loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,this.ioError);
         this._1580 = param2;
         this._10176 = param3;
         this._5959 = param4;
         param1 = _1535.path2Url(param1);
         if(this.appDomain)
         {
            _loc5_ = new LoaderContext(false,this.appDomain);
            this.appDomain = null;
            this.loader.load(new URLRequest(param1),_loc5_);
         }
         else
         {
            this.loader.load(new URLRequest(param1));
         }
      }
      
      public function _10081(param1:ByteArray, param2:Function, param3:Function = null, param4:Function = null, param5:ApplicationDomain = null) : void
      {
         var _loc6_:LoaderContext = null;
         if(this.loader == null)
         {
            this.loader = new Loader();
         }
         this.format = FORMAT_LOADER;
         this.loader.contentLoaderInfo.addEventListener(Event.COMPLETE,this._5962);
         this.loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS,this.onProgress);
         this.loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,this.ioError);
         this._1580 = param2;
         this._10176 = param3;
         this._5959 = param4;
         if(param5)
         {
            _loc6_ = new LoaderContext(false,param5);
         }
         else
         {
            _loc6_ = new LoaderContext();
         }
         _loc6_.allowCodeImport = true;
         this.loader.loadBytes(param1,_loc6_);
      }
      
      private function _5962(param1:Event) : void
      {
         var _loc2_:Bitmap = null;
         var _loc3_:Bitmap = null;
         var _loc4_:BitmapData = null;
         var _loc5_:ApplicationDomain = null;
         var _loc6_:Class = null;
         var _loc7_:Array = null;
         var _loc8_:Array = null;
         var _loc9_:ApplicationDomain = null;
         var _loc10_:Vector.<String> = null;
         var _loc11_:Class = null;
         var _loc12_:String = null;
         var _loc13_:String = null;
         this.loader.contentLoaderInfo.removeEventListener(Event.COMPLETE,this._5962);
         this.loader.contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS,this.onProgress);
         this.loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR,this.ioError);
         if(this._1580 != null)
         {
            switch(this.format)
            {
               case FORMAT_LOADER:
                  setTimeout(this._1580,1,this.loader);
                  this.loader = null;
                  break;
               case FORMAT_BITMAP:
                  _loc2_ = this.loader.contentLoaderInfo.content as Bitmap;
                  setTimeout(this._1580,1,_loc2_);
                  this.loader.unload();
                  break;
               case FORMAT_BITMAP_DATA:
                  _loc3_ = this.loader.contentLoaderInfo.content as Bitmap;
                  if(_loc3_ != null)
                  {
                     _loc4_ = _loc3_.bitmapData;
                  }
                  setTimeout(this._1580,1,_loc4_);
                  this.loader.unload();
                  break;
               case FORMAT_EXTERNAL_CLASS:
                  _loc5_ = this.loader.contentLoaderInfo.applicationDomain;
                  if(_loc5_.hasDefinition(this.className))
                  {
                     _loc6_ = _loc5_.getDefinition(this.className) as Class;
                  }
                  setTimeout(this._1580,1,_loc6_);
                  this.loader.unload();
                  break;
               case FORMAT_EXTERNAL_CLASSES:
                  _loc7_ = [];
                  _loc8_ = [];
                  _loc9_ = this.loader.contentLoaderInfo.applicationDomain;
                  _loc10_ = _loc9_.getQualifiedDefinitionNames();
                  for each(_loc12_ in _loc10_)
                  {
                     if(_loc12_.indexOf("_fla::") < 0 && _loc12_.indexOf(".") < 0)
                     {
                        _loc8_.push(_loc12_);
                     }
                  }
                  for each(_loc13_ in _loc10_)
                  {
                     if(_loc9_.hasDefinition(_loc13_))
                     {
                        _loc11_ = _loc9_.getDefinition(_loc13_) as Class;
                        _loc7_.push(_loc11_);
                     }
                  }
                  setTimeout(this._1580,1,_loc7_,_loc8_);
                  this.loader.unload();
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

