package _1088
{
   import avmplus.getQualifiedClassName;
   import egret.core._1114;
   import egret.core._1129;
   import egret.utils._1295;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Loader;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.net.URLRequest;
   import flash.utils.ByteArray;
   
   public class _1089 implements _1114
   {
      private var _8384:_1295;
      
      public function _1089()
      {
         this._8384 = new _1295();
         super();
      }
      
      public function clear() : void
      {
         this._8384.refresh();
      }
      
      public function _1579(param1:Object, param2:Function, param3:Object) : void
      {
         var data:Object = null;
         var className:String = null;
         var loader:Loader = null;
         var source:Object = param1;
         var _1580:Function = param2;
         var oldContent:Object = param3;
         var content:Object = source;
         if(source is Class)
         {
            className = getQualifiedClassName(source);
            data = this._8384.get(className) as BitmapData;
            if(data)
            {
               _1580(data,source);
               return;
            }
            content = new source();
         }
         if(content is Bitmap)
         {
            content = Bitmap(content).bitmapData;
            if(className)
            {
               this._8384.set(className,content);
            }
         }
         if(content is DisplayObject || content is BitmapData || content is _1129)
         {
            _1580(content,source);
         }
         else if(source is String || source is ByteArray)
         {
            if(source is String)
            {
               data = this._8384.get(String(source));
            }
            if(data)
            {
               _1580(data,source);
            }
            else
            {
               loader = new Loader();
               loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,function(param1:Event):void
               {
                  _1580(source,source);
               });
               loader.contentLoaderInfo.addEventListener(Event.COMPLETE,function(param1:Event):void
               {
                  var _loc2_:BitmapData = null;
                  if(loader.content is Bitmap)
                  {
                     _loc2_ = (loader.content as Bitmap).bitmapData;
                     if(source is String)
                     {
                        _8384.set(String(source),_loc2_);
                     }
                     _1580(_loc2_,source);
                  }
                  else
                  {
                     _1580(loader.content,source);
                  }
               });
               if(source is String)
               {
                  loader.load(new URLRequest(source as String));
               }
               else
               {
                  loader.loadBytes(source as ByteArray);
               }
            }
         }
         else
         {
            _1580(content,source);
         }
      }
   }
}

